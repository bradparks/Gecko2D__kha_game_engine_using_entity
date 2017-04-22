package prime;

import kha.graphics2.Graphics;

class Container extends Actor {
	public var children:Array<Actor> = [];

	override public function update(delta:Float) : Void {
		if(children.length > 0) {
			for(actor in children) {
				actor.update(delta);
			}
		}
	}

	override public function render(graphics:Graphics) : Void {
		if(children.length > 0) {
			for(actor in children) {
				actor.render(graphics);
			}
		}
	}

	public function addChild(actor:Actor) : Void {
		children.push(actor);
	}

	public function removeChild(actor:Actor) : Void {
		children.remove(actor);
	}
}