@interface _BKSceneControllerWrapper
- (BKSceneControlling)sceneController;
- (_BKSceneControllerWrapper)initWithSceneController:(id)a3;
- (void)setSceneController:(id)a3;
@end

@implementation _BKSceneControllerWrapper

- (_BKSceneControllerWrapper)initWithSceneController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BKSceneControllerWrapper;
  v5 = [(_BKSceneControllerWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sceneController, v4);
  }

  return v6;
}

- (BKSceneControlling)sceneController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneController);

  return (BKSceneControlling *)WeakRetained;
}

- (void)setSceneController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end