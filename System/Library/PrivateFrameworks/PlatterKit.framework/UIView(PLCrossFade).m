@interface UIView(PLCrossFade)
- (void)pl_performCrossFadeIfNecessary;
@end

@implementation UIView(PLCrossFade)

- (void)pl_performCrossFadeIfNecessary
{
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled])
  {
    id v9 = [MEMORY[0x1E4F39D18] animation];
    unint64_t v2 = [MEMORY[0x1E4F42FF0] _currentAnimationCurve];
    v7 = PLCAMediaTimingFunctionForViewAnimationCurve(v2, v3, v4, v5, v6);
    [v9 setTimingFunction:v7];

    [v9 setType:*MEMORY[0x1E4F3A5B8]];
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    objc_msgSend(v9, "setDuration:");
    v8 = [a1 layer];
    [v8 addAnimation:v9 forKey:@"crossFade"];
  }
}

@end