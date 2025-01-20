@interface TVRPresentationController
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)shouldPresentInFullscreen;
@end

@implementation TVRPresentationController

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

@end