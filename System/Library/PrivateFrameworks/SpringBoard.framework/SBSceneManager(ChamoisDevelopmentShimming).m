@interface SBSceneManager(ChamoisDevelopmentShimming)
- (SBLayoutState)currentLayoutState;
@end

@implementation SBSceneManager(ChamoisDevelopmentShimming)

- (SBLayoutState)currentLayoutState
{
  v4 = [(SBSceneManager *)self _sbWindowScene];
  v5 = [v4 layoutStateProvider];
  v6 = [v5 layoutState];

  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBSceneManager.m", 1513, @"%@ has no layout state- does your corresponding window scene exist yet?", self object file lineNumber description];
  }
  return (SBLayoutState *)v6;
}

@end