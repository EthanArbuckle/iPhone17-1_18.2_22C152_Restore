@interface UISpringTimingParameters(VideosUI)
- (id)vui_initWithDampingRatio:()VideosUI frequencyResponse:;
@end

@implementation UISpringTimingParameters(VideosUI)

- (id)vui_initWithDampingRatio:()VideosUI frequencyResponse:
{
  v3 = objc_msgSend(a1, "initWithMass:stiffness:damping:initialVelocity:", 1.0, 6.28318531 / a3 * (6.28318531 / a3), a2 * 12.5663706 / a3, 0.0, 0.0);
  return v3;
}

@end