@interface SBWindowSelfHostWrapper
+ (id)wrapperForUseInWindow:(id)a3 hostRequester:(id)a4 sceneIdentifier:(id)a5;
+ (id)wrapperForWindow:(id)a3 orientation:(int64_t)a4 hostRequester:(id)a5 sceneIdentifier:(id)a6;
- (NSString)requester;
- (UIScenePresentation)hostView;
- (UIScenePresentationContext)presentationContext;
- (UIScenePresenter)presenter;
- (UIWindow)window;
- (void)modifyPresentationContext:(id)a3;
- (void)stopHosting;
@end

@implementation SBWindowSelfHostWrapper

+ (id)wrapperForUseInWindow:(id)a3 hostRequester:(id)a4 sceneIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_msgSend(a1, "wrapperForWindow:orientation:hostRequester:sceneIdentifier:", 0, objc_msgSend(a3, "interfaceOrientation"), v9, v8);

  return v10;
}

+ (id)wrapperForWindow:(id)a3 orientation:(int64_t)a4 hostRequester:(id)a5 sceneIdentifier:(id)a6
{
  id v9 = (UIWindow *)a3;
  v10 = (void *)MEMORY[0x1E4F62490];
  id v11 = a6;
  id v12 = a5;
  v13 = [v10 sharedInstance];
  v14 = [v13 sceneWithIdentifier:v11];

  v15 = [MEMORY[0x1E4F42D70] targetForUIWindow:v9];
  v16 = [v14 uiPresentationManager];
  v17 = [v16 createPresenterForLayerTarget:v15 identifier:v12];

  [v17 activate];
  v18 = [v17 presentationView];
  if (a4 != 1)
  {
    memset(&v36, 0, sizeof(v36));
    if (a4 == 3)
    {
      double v19 = 1.57079633;
    }
    else if (a4 == 4)
    {
      double v19 = -1.57079633;
    }
    else
    {
      double v19 = 3.14159265;
      if (a4 != 2) {
        double v19 = 0.0;
      }
    }
    CGAffineTransformMakeRotation(&v36, -v19);
    CGAffineTransform v35 = v36;
    [v18 setTransform:&v35];
    [v18 frame];
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    CGFloat v24 = -CGRectGetMinX(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v39);
    CGAffineTransformMakeTranslation(&t2, v24, -MinY);
    CGAffineTransform v33 = v36;
    CGAffineTransformConcat(&v35, &v33, &t2);
    CGAffineTransform v36 = v35;
    [v18 setTransform:&v35];
  }
  v26 = objc_alloc_init(SBWindowSelfHostWrapper);
  presenter = v26->_presenter;
  v26->_presenter = (UIScenePresenter *)v17;
  id v28 = v17;

  window = v26->_window;
  v26->_window = v9;
  v30 = v9;

  hostView = v26->_hostView;
  v26->_hostView = (UIScenePresentation *)v18;

  return v26;
}

- (NSString)requester
{
  return (NSString *)[(UIScenePresenter *)self->_presenter identifier];
}

- (UIScenePresentationContext)presentationContext
{
  return (UIScenePresentationContext *)[(UIScenePresenter *)self->_presenter presentationContext];
}

- (void)modifyPresentationContext:(id)a3
{
}

- (void)stopHosting
{
}

- (UIWindow)window
{
  return self->_window;
}

- (UIScenePresentation)hostView
{
  return self->_hostView;
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end