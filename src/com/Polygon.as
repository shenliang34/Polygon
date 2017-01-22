package com
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.sensors.Accelerometer;
	
	public class Polygon extends Sprite
	{
		private var _radius:uint;//半径
		private var _edge:uint;//边数
		private var _centerX:Number;//中心点
		private var _centerY:Number;//
		private var _angle:Number;//度数
		
		private var backgroundCanvas:Sprite;
		private var currentCanvas:Sprite;//当前
		private var lastCanvas:Sprite;//上次
		public function Polygon(radius:uint,edge:uint,centerX:Number,centerY:Number)
		{
			_radius = radius;
			_edge = edge;
			_centerX = centerX;
			_centerY = centerY;
			
			_angle = 360 / edge;
			
			//背景
			backgroundCanvas = new Sprite();
			addChild(backgroundCanvas);
			
			//当前
			currentCanvas = new Sprite();
			addChild(currentCanvas);
			
			//上i个
			lastCanvas = new Sprite();
			addChild(lastCanvas);
			super();
		}
		
		
		/**
		 * 
		 * @param fillColor颜色
		 * @param fillThickness 笔刷
		 * @param fillAlpha //透明度
		 * 
		 */		
		public function drawBackGroundCanvas(fillColor:uint,thickness:uint,fillAlpha:Number):void
		{
			backgroundCanvas.graphics.lineStyle(thickness,fillColor);
			backgroundCanvas.graphics.beginFill(fillColor,fillAlpha);
			
			var points:Array = [];
			//
			for (var i:int = 0; i < _edge; i++) 
			{
				var vx:Number = _centerX + Math.sin(radian(i * _angle)) * _radius;
				var vy:Number = _centerY + Math.cos(radian(i * _angle)) * _radius;
				backgroundCanvas.graphics.moveTo(_centerX,_centerY);
				backgroundCanvas.graphics.lineTo( vx,vy);
				
				points.push(new Point(vx,vy));
				
				//画点
				var circle:Sprite = new Sprite();
				circle.graphics.beginFill(0x00ff00,1);
				circle.graphics.drawCircle(0,0,5);
				circle.graphics.endFill();
				backgroundCanvas.addChild(circle);
				circle.x = vx;
				circle.y = vy;
			}
			
			backgroundCanvas.graphics.moveTo(points[0].x,points[0].y);
			for (var j:int = 0; j < points.length; j++) 
			{
				backgroundCanvas.graphics.lineTo(points[j].x,points[j].y);
			}
			backgroundCanvas.graphics.lineTo(points[0].x,points[0].y);
		}
		
		
		/**
		 *弧度 
		 * @param angle
		 * @return 
		 * 
		 */		
		private function radian(angle:Number):Number
		{
			return Math.PI / 180 * angle;
		}
		
		
		public function drawCurrentCanvas(fillColor:uint,thickness:uint,fillAlpha:Number):void
		{
			currentCanvas.graphics.lineStyle(thickness,fillColor);
			currentCanvas.graphics.beginFill(fillColor,fillAlpha);
			
			var points:Array = [];
			//
			for (var i:int = 0; i < _edge; i++) 
			{
				var random:Number = Math.random();
				var vx:Number = _centerX + Math.sin(radian(i * _angle)) * (_radius * random);
				var vy:Number = _centerY + Math.cos(radian(i * _angle)) * (_radius * random);
//				currentCanvas.graphics.moveTo(_centerX,_centerY);
//				currentCanvas.graphics.lineTo( vx,vy);
				
				points.push(new Point(vx,vy));
				
				//画点
				var circle:Sprite = new Sprite();
				circle.graphics.beginFill(fillColor,1);
				circle.graphics.drawCircle(0,0,5);
				circle.graphics.endFill();
				currentCanvas.addChild(circle);
				circle.x = vx;
				circle.y = vy;
			}
			
			currentCanvas.graphics.moveTo(points[0].x,points[0].y);
			for (var j:int = 0; j < points.length; j++) 
			{
				currentCanvas.graphics.lineTo(points[j].x,points[j].y);
			}
			currentCanvas.graphics.lineTo(points[0].x,points[0].y);
		}
		
		
		public function drawLastCanvas(fillColor:uint,thickness:uint,fillAlpha:Number):void
		{
			lastCanvas.graphics.lineStyle(thickness,fillColor);
			lastCanvas.graphics.beginFill(fillColor,fillAlpha);
			
			var points:Array = [];
			//
			for (var i:int = 0; i < _edge; i++) 
			{
				var random:Number = Math.random();
				var vx:Number = _centerX + Math.sin(radian(i * _angle)) * _radius * random;
				var vy:Number = _centerY + Math.cos(radian(i * _angle)) * _radius * random;
//				lastCanvas.graphics.moveTo(_centerX,_centerY);
//				lastCanvas.graphics.lineTo( vx,vy);
				
				points.push(new Point(vx,vy));
				
				//画点
				var circle:Sprite = new Sprite();
				circle.graphics.beginFill(fillColor,1);
				circle.graphics.drawCircle(0,0,5);
				circle.graphics.endFill();
				lastCanvas.addChild(circle);
				circle.x = vx;
				circle.y = vy;
			}
			
			lastCanvas.graphics.moveTo(points[0].x,points[0].y);
			for (var j:int = 0; j < points.length; j++) 
			{
				lastCanvas.graphics.lineTo(points[j].x,points[j].y);
			}
			lastCanvas.graphics.lineTo(points[0].x,points[0].y);
		}
	}
}