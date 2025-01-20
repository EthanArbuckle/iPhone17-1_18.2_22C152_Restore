@interface JSAWindowManager
- (BOOL)downloadQueue:(id)a3 shouldShowAuthenticateForRequest:(id)a4;
- (BOOL)downloadQueue:(id)a3 shouldShowDialogForRequest:(id)a4;
- (CGSize)keyWindowSize;
- (JSAWindowManager)initWithWindowProvider:(id)a3;
- (JSAWindowProviding)windowProvider;
- (NSString)keyWindowSceneIdentifier;
- (UIWindow)keyWindow;
- (id)downloadQueue:(id)a3 viewControllerToPresentAuthenticateUIForRequest:(id)a4;
- (id)downloadQueue:(id)a3 viewControllerToPresentDialogUIForRequest:(id)a4;
- (id)downloadQueue:(id)a3 viewControllerToPresentEngagementUIForRequest:(id)a4;
- (id)windowFromOptions:(id)a3;
- (void)_keyWindowDidChange:(uint64_t)a1;
- (void)dealloc;
- (void)downloadQueue:(id)a3 shouldShowEngagementForRequest:(id)a4 engagementRequest:(id)a5 completion:(id)a6;
- (void)setKeyWindow:(id)a3;
- (void)setKeyWindowSceneIdentifier:(id)a3;
- (void)setKeyWindowSize:(CGSize)a3;
- (void)updateWindowSizeIfNeeded:(id)a3;
@end

@implementation JSAWindowManager

- (JSAWindowManager)initWithWindowProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JSAWindowManager;
  v6 = [(JSAWindowManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_windowProvider, a3);
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_keyWindowDidChange:" name:UIWindowDidBecomeKeyNotification object:0];

    -[JSAWindowManager _keyWindowDidChange:]_0((uint64_t)v7);
  }

  return v7;
}

- (void)_keyWindowDidChange:(uint64_t)a1
{
  if (a1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_44D4;
    v4[3] = &unk_B2000;
    v4[4] = a1;
    v1 = objc_retainBlock(v4);
    if (v1)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v1[2])(v1);
      }
      else
      {
        v2[0] = _NSConcreteStackBlock;
        v2[1] = 3221225472;
        v2[2] = sub_4624;
        v2[3] = &unk_B2028;
        v3 = v1;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
      }
    }
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)JSAWindowManager;
  [(JSAWindowManager *)&v4 dealloc];
}

- (id)windowFromOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(JSAWindowManager *)self windowProvider];
  v6 = [v5 windowFromOptions:v4];

  if (!v6)
  {
    v6 = [(JSAWindowManager *)self keyWindow];
  }

  return v6;
}

- (void)updateWindowSizeIfNeeded:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4758;
  v8[3] = &unk_B2050;
  id v4 = a3;
  id v9 = v4;
  objc_super v10 = self;
  id v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4880;
      block[3] = &unk_B2028;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)downloadQueue:(id)a3 shouldShowAuthenticateForRequest:(id)a4
{
  return 1;
}

- (BOOL)downloadQueue:(id)a3 shouldShowDialogForRequest:(id)a4
{
  return 1;
}

- (void)downloadQueue:(id)a3 shouldShowEngagementForRequest:(id)a4 engagementRequest:(id)a5 completion:(id)a6
{
}

- (id)downloadQueue:(id)a3 viewControllerToPresentAuthenticateUIForRequest:(id)a4
{
  id v4 = [(JSAWindowManager *)self keyWindow];
  id v5 = +[UIViewController jsa_topMostViewControllerForWindow:v4];

  return v5;
}

- (id)downloadQueue:(id)a3 viewControllerToPresentDialogUIForRequest:(id)a4
{
  id v4 = [(JSAWindowManager *)self keyWindow];
  id v5 = +[UIViewController jsa_topMostViewControllerForWindow:v4];

  return v5;
}

- (id)downloadQueue:(id)a3 viewControllerToPresentEngagementUIForRequest:(id)a4
{
  id v4 = [(JSAWindowManager *)self keyWindow];
  id v5 = +[UIViewController jsa_topMostViewControllerForWindow:v4];

  return v5;
}

- (JSAWindowProviding)windowProvider
{
  return (JSAWindowProviding *)objc_getProperty(self, a2, 8, 1);
}

- (UIWindow)keyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setKeyWindow:(id)a3
{
}

- (CGSize)keyWindowSize
{
  objc_copyStruct(v4, &self->_keyWindowSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setKeyWindowSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_keyWindowSize, &v3, 16, 1, 0);
}

- (NSString)keyWindowSceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyWindowSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyWindowSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_keyWindow);

  objc_storeStrong((id *)&self->_windowProvider, 0);
}

@end