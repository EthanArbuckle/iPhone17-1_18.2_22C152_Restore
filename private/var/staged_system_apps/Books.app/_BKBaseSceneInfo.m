@interface _BKBaseSceneInfo
- (BKSceneControlling)sceneController;
- (BOOL)supportsOpeningToAuxiliaryScene;
- (NSDictionary)userData;
- (NSString)openBookAssetID;
- (NSString)sceneIdentifier;
- (UISceneSession)sceneSession;
- (_BKBaseSceneInfo)initWithSceneSession:(id)a3 userData:(id)a4;
- (void)setSceneController:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSceneSession:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation _BKBaseSceneInfo

- (NSDictionary)userData
{
  return self->_userData;
}

- (NSString)openBookAssetID
{
  v2 = [(_BKBaseSceneInfo *)self userData];
  v3 = [v2 objectForKeyedSubscript:BCContinuationActivityAssetIDKey];

  return (NSString *)v3;
}

- (_BKBaseSceneInfo)initWithSceneSession:(id)a3 userData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(_BKBaseSceneInfo *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 persistentIdentifier];
    sceneIdentifier = v9->_sceneIdentifier;
    v9->_sceneIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_sceneSession, a3);
    objc_storeStrong((id *)&v9->_userData, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_destroyWeak((id *)&self->_sceneController);
  objc_storeStrong((id *)&self->_sceneSession, 0);

  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

- (BOOL)supportsOpeningToAuxiliaryScene
{
  v3 = [(_BKBaseSceneInfo *)self userData];
  v4 = [v3 objectForKeyedSubscript:@"BKSceneInfoIsAudiobookKey"];
  unsigned __int8 v5 = [v4 BOOLValue];

  v6 = [(_BKBaseSceneInfo *)self openBookAssetID];
  if (v6) {
    char v7 = v5 ^ 1;
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (UISceneSession)sceneSession
{
  return self->_sceneSession;
}

- (void)setSceneSession:(id)a3
{
}

- (BKSceneControlling)sceneController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneController);

  return (BKSceneControlling *)WeakRetained;
}

- (void)setSceneController:(id)a3
{
}

- (void)setUserData:(id)a3
{
}

@end