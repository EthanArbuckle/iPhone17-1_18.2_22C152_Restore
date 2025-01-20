@interface SBPIPContentContext
- (SBPIPContainerViewController)containerViewController;
- (SBPIPContentContext)initWithWindowScene:(id)a3 containerViewController:(id)a4;
- (SBPictureInPictureWindow)window;
- (SBWindowScene)windowScene;
- (id)debugDescription;
- (int64_t)contentZOrderPriority;
- (void)setWindow:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBPIPContentContext

- (SBPIPContentContext)initWithWindowScene:(id)a3 containerViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBPIPContentContext;
  v9 = [(SBPIPContentContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerViewController, a4);
    objc_storeStrong((id *)&v10->_windowScene, a3);
  }

  return v10;
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; containerViewController = %p; window = %p; windowScene = %p>",
               objc_opt_class(),
               self,
               self->_containerViewController,
               self->_window,
               self->_windowScene);
}

- (int64_t)contentZOrderPriority
{
  return [(SBPIPContainerViewController *)self->_containerViewController contentZOrderPriority];
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
}

- (SBPictureInPictureWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (SBPIPContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

@end