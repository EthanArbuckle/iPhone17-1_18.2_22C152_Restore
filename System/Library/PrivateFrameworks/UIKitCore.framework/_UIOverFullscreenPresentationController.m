@interface _UIOverFullscreenPresentationController
- (BOOL)shouldRemovePresentersView;
- (int64_t)presentationStyle;
@end

@implementation _UIOverFullscreenPresentationController

- (int64_t)presentationStyle
{
  return 5;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

@end