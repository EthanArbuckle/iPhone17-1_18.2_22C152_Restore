@interface _UIOverCurrentContextPresentationController
- (BOOL)shouldRemovePresentersView;
- (int64_t)presentationStyle;
@end

@implementation _UIOverCurrentContextPresentationController

- (int64_t)presentationStyle
{
  return 6;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

@end