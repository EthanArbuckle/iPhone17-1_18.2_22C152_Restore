@interface RingViewFactory
+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6;
+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6 renderer:(id)a7;
@end

@implementation RingViewFactory

+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6
{
  return +[RingViewFactory workoutRingWithPercent:a4 colors:0 diameter:a3 thickness:a5 renderer:a6];
}

+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6 renderer:(id)a7
{
  id v10 = a4;
  id v11 = [objc_alloc((Class)ARUIRingGroupController) initWithNumberOfRings:1];
  [v11 setPercentage:0 ofRingAtIndex:0 animated:a3];
  *(float *)&double v12 = a5;
  [v11 setRingDiameter:v12];
  *(float *)&double v13 = a6;
  [v11 setRingThickness:v13];
  v14 = [v10 gradientDarkColor];
  v15 = [v10 gradientLightColor];

  [v11 setTopColor:v14 bottomColor:v15 ofRingAtIndex:0];
  v16 = +[ARUIRingsImageFactory renderRingGroupController:v11 withRenderer:0];

  return v16;
}

@end