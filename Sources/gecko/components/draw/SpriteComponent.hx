package gecko.components.draw;

import gecko.Graphics;
import gecko.resources.Texture;
import gecko.Assets;

class SpriteComponent extends DrawComponent {
    static public function createFromTexture(texture:Texture) : SpriteComponent {
        var sprite = SpriteComponent.create("");
        sprite.texture = texture;
        return sprite;
    }

    public var texture(get, set):Texture;
    private var _texture:Texture;

    public function init(texture:String) {
        this.texture = Assets.textures.get(texture);

        onAddedToEntity += _setTransformSize;
    }

    override public function draw(g:Graphics){
        if(_texture == null)return;
        g.drawTexture(_texture, 0, 0);
    }

    override public function beforeDestroy(){
        super.beforeDestroy();

        texture = null;
        onAddedToEntity -= _setTransformSize;
    }

    private function _setTransformSize(e:Entity) {
        if(e.transform != null){
            e.transform.size.set(_texture.width, _texture.height);
        }
    }

    inline function get_texture():Texture {
        return _texture;
    }

    function set_texture(value:Texture):Texture {
        if(value == _texture)return _texture;
        _texture = value;

        if(_texture != null && entity != null && entity.transform != null){
            entity.transform.size.set(_texture.width, _texture.height);
        }

        return _texture;
    }
}