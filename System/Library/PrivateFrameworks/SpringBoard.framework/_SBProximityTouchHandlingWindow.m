@interface _SBProximityTouchHandlingWindow
+ (_SBProximityTouchHandlingWindow)proximityTouchHandlingWindowWithScene:(void *)a3 viewController:;
@end

@implementation _SBProximityTouchHandlingWindow

+ (_SBProximityTouchHandlingWindow)proximityTouchHandlingWindowWithScene:(void *)a3 viewController:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [(SBFTouchPassThroughWindow *)[_SBProximityTouchHandlingWindow alloc] initWithWindowScene:v5 role:0 debugName:@"_SBProximityTouchHandlingWindow"];

  [(_SBProximityTouchHandlingWindow *)v6 setRootViewController:v4];
  [(_SBProximityTouchHandlingWindow *)v6 setLevel:999999.0];
  [(_SBProximityTouchHandlingWindow *)v6 setUserInteractionEnabled:1];
  return v6;
}

@end