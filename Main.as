package  {
	
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.display.Shape;
	import flash.display.Bitmap;
	//bitmap测试222,feature-one again,hotfix-one, release-1.3
	public class Main extends Sprite{
		
		//[Embed(source = "CP064AB.png")]
//		private var RoleImg:Class;
		
		
		private var elementImg:BitmapData;
		private var sourceEleImg:BitmapData;
		
		private var timer:Timer = new Timer(100);
		private var frame:int = 0
		private var shap:Shape = new Shape();
		public function Main() {
			
			var d:Img2 = new Img2();
			
			sourceEleImg = new BitmapData(d.width, d.height ,true, 1);
			sourceEleImg.draw(d);
			elementImg = new BitmapData(80, 80, true);
			shap.x = 100;
			shap.y = 100;
			this.addChild(shap);
			
			timer.addEventListener("timer",run);
			timer.start();
		}
		private function run(evt:Event):void{
			frame++;
			reDraw(new Rectangle(frame*80, 0, 80, 80));
			if(timer.currentCount == 4){
				frame = 0;
				timer.stop();
				timer.reset();
				timer.start();
			}
		}
		private function reDraw(rect:Rectangle):void{
			elementImg.copyPixels(sourceEleImg, rect, new Point(0,0), null, null, false);
			shap.graphics.clear();
			shap.graphics.beginBitmapFill(elementImg, null, false, false);
			shap.graphics.drawRect(0,0,80,80);
			shap.graphics.endFill();
			
		}
	}
	
}
