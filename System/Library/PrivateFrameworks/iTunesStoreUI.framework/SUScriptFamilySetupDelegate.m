@interface SUScriptFamilySetupDelegate
- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
@end

@implementation SUScriptFamilySetupDelegate

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);

  [a3 dismissViewControllerAnimated:1 completion:0];
}

@end