@interface _BKBookSceneControllerProvider
- (BKAppSceneManager)sceneManager;
- (BOOL)sceneSupportsMinifiedPresenting;
- (NSString)requestAssetID;
- (_BKBookSceneControllerProvider)initWithSceneManager:(id)a3 requestAssetID:(id)a4;
- (void)provideSceneController:(id)a3;
- (void)setRequestAssetID:(id)a3;
- (void)setSceneManager:(id)a3;
@end

@implementation _BKBookSceneControllerProvider

- (_BKBookSceneControllerProvider)initWithSceneManager:(id)a3 requestAssetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BKBookSceneControllerProvider;
  v8 = [(_BKBookSceneControllerProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sceneManager, v6);
    objc_storeStrong((id *)&v9->_requestAssetID, a4);
  }

  return v9;
}

- (void)provideSceneController:(id)a3
{
  id v4 = a3;
  v5 = [(_BKBookSceneControllerProvider *)self sceneManager];
  id v6 = [(_BKBookSceneControllerProvider *)self requestAssetID];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CB0CC;
  v8[3] = &unk_100A4A6F8;
  id v9 = v4;
  id v7 = v4;
  [v5 requestBookSceneWithAssetID:v6 completion:v8];
}

- (BOOL)sceneSupportsMinifiedPresenting
{
  return 0;
}

- (BKAppSceneManager)sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);

  return (BKAppSceneManager *)WeakRetained;
}

- (void)setSceneManager:(id)a3
{
}

- (NSString)requestAssetID
{
  return self->_requestAssetID;
}

- (void)setRequestAssetID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAssetID, 0);

  objc_destroyWeak((id *)&self->_sceneManager);
}

@end