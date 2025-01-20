@interface CAKeyframeAnimation(Normalized)
+ (id)normalizedKeyframeAnimationWithKeyPath:()Normalized;
@end

@implementation CAKeyframeAnimation(Normalized)

+ (id)normalizedKeyframeAnimationWithKeyPath:()Normalized
{
  v0 = objc_msgSend(MEMORY[0x1E4F39BD8], "animationWithKeyPath:");
  [v0 setBeginTime:1.0e-100];
  [v0 setDuration:1.0];
  [v0 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v0 setRemovedOnCompletion:0];
  return v0;
}

@end