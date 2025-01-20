@interface WBSWebProcessPlugInPageController
- (WBSWebProcessPlugIn)webProcessPlugIn;
- (WBSWebProcessPlugInPageController)init;
- (WBSWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (WKWebProcessPlugInBrowserContextController)browserContextController;
- (WKWebProcessPlugInFrame)mainFrame;
- (void)willDestroyBrowserContextController:(id)a3;
@end

@implementation WBSWebProcessPlugInPageController

- (WKWebProcessPlugInBrowserContextController)browserContextController
{
  return self->_browserContextController;
}

- (WBSWebProcessPlugIn)webProcessPlugIn
{
  return self->_webProcessPlugIn;
}

- (WBSWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSWebProcessPlugInPageController;
  v9 = [(WBSWebProcessPlugInPageController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webProcessPlugIn, a3);
    objc_storeStrong((id *)&v10->_browserContextController, a4);
    [(WKWebProcessPlugInBrowserContextController *)v10->_browserContextController setLoadDelegate:v10];
    v11 = v10;
  }

  return v10;
}

- (WBSWebProcessPlugInPageController)init
{
  return 0;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  [(WKWebProcessPlugInBrowserContextController *)self->_browserContextController setLoadDelegate:0];
  browserContextController = self->_browserContextController;
  self->_browserContextController = 0;
}

- (WKWebProcessPlugInFrame)mainFrame
{
  return (WKWebProcessPlugInFrame *)[(WKWebProcessPlugInBrowserContextController *)self->_browserContextController mainFrame];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPlugIn, 0);
  objc_storeStrong((id *)&self->_browserContextController, 0);
}

@end