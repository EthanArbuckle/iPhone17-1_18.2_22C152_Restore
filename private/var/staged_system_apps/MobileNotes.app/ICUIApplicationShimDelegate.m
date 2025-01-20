@interface ICUIApplicationShimDelegate
- (BOOL)isQuickNoteSessionActive;
- (BOOL)isSecureScreenShowing;
- (UIWindow)keyWindow;
@end

@implementation ICUIApplicationShimDelegate

- (UIWindow)keyWindow
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 keyWindow];

  return (UIWindow *)v3;
}

- (BOOL)isSecureScreenShowing
{
  v2 = +[ICQuickNoteSessionManager sharedManager];
  unsigned __int8 v3 = [v2 isSecureScreenShowing];

  return v3;
}

- (BOOL)isQuickNoteSessionActive
{
  v2 = +[ICQuickNoteSessionManager sharedManager];
  unsigned __int8 v3 = [v2 isQuickNoteSessionActive];

  return v3;
}

@end