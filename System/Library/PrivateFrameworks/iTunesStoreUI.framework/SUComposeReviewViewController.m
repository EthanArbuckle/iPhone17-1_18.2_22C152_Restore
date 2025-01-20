@interface SUComposeReviewViewController
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (NSURL)compositionURL;
- (SUComposeReviewViewController)init;
- (SUComposeReviewViewController)initWithCompositionURL:(id)a3;
- (id)copyScriptViewController;
- (void)_showRemoteView;
- (void)dealloc;
- (void)loadView;
- (void)prepareWithCompletionBlock:(id)a3;
- (void)reviewComposeViewControllerDidFinish:(id)a3;
@end

@implementation SUComposeReviewViewController

- (SUComposeReviewViewController)init
{
  return [(SUComposeReviewViewController *)self initWithCompositionURL:0];
}

- (SUComposeReviewViewController)initWithCompositionURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUComposeReviewViewController;
  v4 = [(SUViewController *)&v6 init];
  if (v4)
  {
    v4->_compositionURL = (NSURL *)[a3 copy];
    [(SUComposeReviewViewController *)v4 setContainmentSupport:1];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1) {
      [(SUComposeReviewViewController *)v4 setModalPresentationStyle:2];
    }
  }
  return v4;
}

- (void)dealloc
{
  [(SKComposeReviewViewController *)self->_remoteViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUComposeReviewViewController;
  [(SUViewController *)&v3 dealloc];
}

- (id)copyScriptViewController
{
  objc_super v3 = objc_alloc_init(SUScriptComposeReviewViewController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (void)prepareWithCompletionBlock:(id)a3
{
  if (!self->_remoteViewController)
  {
    v5 = (SKComposeReviewViewController *)objc_alloc((Class)ISWeakLinkedClassForString());
    self->_remoteViewController = v5;
    objc_super v6 = [(SKComposeReviewViewController *)v5 initWithCompositionURL:self->_compositionURL];
    self->_remoteViewController = v6;
    [(SKComposeReviewViewController *)v6 setDelegate:self];
    [(SUComposeReviewViewController *)self addChildViewController:self->_remoteViewController];
    [(SKComposeReviewViewController *)self->_remoteViewController prepareWithCompletionBlock:a3];
    if ([(SUComposeReviewViewController *)self isViewLoaded])
    {
      [(SUComposeReviewViewController *)self _showRemoteView];
    }
  }
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  -[SUComposeReviewViewController setView:](self, "setView:");
  if (self->_remoteViewController) {
    [(SUComposeReviewViewController *)self _showRemoteView];
  }
}

- (void)reviewComposeViewControllerDidFinish:(id)a3
{
}

- (void)_showRemoteView
{
  id v3 = (void *)[(SUComposeReviewViewController *)self view];
  v4 = (void *)[(SKComposeReviewViewController *)self->_remoteViewController view];
  [v4 setAutoresizingMask:18];
  [v3 frame];
  objc_msgSend(v4, "setFrame:");

  [v3 addSubview:v4];
}

- (NSURL)compositionURL
{
  return self->_compositionURL;
}

@end