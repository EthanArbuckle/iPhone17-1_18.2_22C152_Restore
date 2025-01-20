@interface BKJSAAppWindowProvider
- (BKAppSceneManager)sceneManager;
- (BKJSAAppWindowProvider)initWithSceneManager:(id)a3;
- (UIWindow)keyWindow;
- (id)windowFromOptions:(id)a3;
- (void)setSceneManager:(id)a3;
@end

@implementation BKJSAAppWindowProvider

- (UIWindow)keyWindow
{
  return (UIWindow *)+[UIWindow _applicationKeyWindow];
}

- (BKJSAAppWindowProvider)initWithSceneManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKJSAAppWindowProvider;
  v5 = [(BKJSAAppWindowProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sceneManager, v4);
  }

  return v6;
}

- (id)windowFromOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
  v6 = [v5 originatingSceneController];
  v7 = BUProtocolCast();

  objc_super v8 = +[BKSceneControllerUtilities sceneTypeKey];
  v9 = [v4 objectForKeyedSubscript:v8];

  if (v5) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  if (v10)
  {
    v15 = [v7 bk_window];
  }
  else
  {
    unint64_t v11 = +[BKSceneControllerUtilities sceneTypeFrom:v9];
    v12 = [(BKJSAAppWindowProvider *)self sceneManager];
    v13 = +[BKSceneControllerUtilities assetIDKey];
    v14 = [v4 objectForKeyedSubscript:v13];
    v15 = [v12 windowFromSceneType:v11 assetID:v14];
  }

  return v15;
}

- (BKAppSceneManager)sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);

  return (BKAppSceneManager *)WeakRetained;
}

- (void)setSceneManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end