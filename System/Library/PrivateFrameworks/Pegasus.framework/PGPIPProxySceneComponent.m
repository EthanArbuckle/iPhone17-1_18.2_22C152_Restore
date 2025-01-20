@interface PGPIPProxySceneComponent
- (NSString)identifier;
- (PGPIPProxySceneComponent)initWithScene:(id)a3;
- (UIScene)_scene;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation PGPIPProxySceneComponent

- (PGPIPProxySceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPIPProxySceneComponent;
  v5 = [(PGPIPProxySceneComponent *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(PGPIPProxySceneComponent *)v5 _setScene:v4];
    uint64_t v7 = [v4 _sceneIdentifier];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"PGPIPSceneComponentDidConnectNotification" object:v6];
  }
  return v6;
}

- (void)_sceneWillInvalidate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PGPIPSceneComponentDidDisconnectNotification" object:self];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->__scene);
}

@end