package
{
	import com.Polygon;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			
			var polygon:Polygon = new Polygon(170,5,0,0);
			polygon.drawBackGroundCanvas(0x990000,2,0);
			polygon.drawCurrentCanvas(0xff0000,2,0.6);
			polygon.drawLastCanvas(0x002188,2,0.5);
			addChild(polygon);
			polygon.x = 200;
			polygon.y = 200;
		}
	}
}