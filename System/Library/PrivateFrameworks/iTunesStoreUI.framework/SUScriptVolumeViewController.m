@interface SUScriptVolumeViewController
- (id)newNativeViewController;
@end

@implementation SUScriptVolumeViewController

- (id)newNativeViewController
{
  v3 = objc_msgSend(-[SUScriptObject viewControllerFactory](self, "viewControllerFactory"), "newVolumeViewController");
  objc_msgSend(v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

@end