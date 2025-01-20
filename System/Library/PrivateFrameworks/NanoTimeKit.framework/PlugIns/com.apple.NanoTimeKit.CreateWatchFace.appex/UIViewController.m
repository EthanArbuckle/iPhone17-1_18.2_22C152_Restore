@interface UIViewController
- (id)ntke_cancelExtensionBarButton;
- (void)_ntke_cancelExtension;
@end

@implementation UIViewController

- (id)ntke_cancelExtensionBarButton
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_ntke_cancelExtension"];
  return v2;
}

- (void)_ntke_cancelExtension
{
  id v3 = [(UIViewController *)self extensionContext];
  id v2 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  [v3 cancelRequestWithError:v2];
}

@end