@interface FBScene(_UIHomeAffordanceHostSceneComponent)
- (id)_homeAffordanceHostSceneComponent;
@end

@implementation FBScene(_UIHomeAffordanceHostSceneComponent)

- (id)_homeAffordanceHostSceneComponent
{
  if (_UIDeviceSupportsGlobalEdgeSwipeTouches()
    && _UIApplicationSupportsHomeAffordanceObservation())
  {
    uint64_t v2 = objc_opt_class();
    v3 = [a1 componentForExtension:v2 ofClass:objc_opt_class()];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end