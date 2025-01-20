@interface SBInProcessSecureAppAction
- (BOOL)isInProcessAction;
- (CSHostableEntity)hostableEntity;
- (SBApplicationSceneEntity)applicationSceneEntity;
- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 applicationSceneEntity:(id)a4 handler:(id)a5;
- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 hostableEntity:(id)a4 handler:(id)a5;
- (void)setApplicationSceneEntity:(id)a3;
- (void)setHostableEntity:(id)a3;
@end

@implementation SBInProcessSecureAppAction

- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 applicationSceneEntity:(id)a4 handler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4FA7028];
  id v9 = a5;
  v10 = SBSIdentifierForSecureAppType();
  v13.receiver = self;
  v13.super_class = (Class)SBInProcessSecureAppAction;
  v11 = [(SBInProcessSecureAppAction *)&v13 initWithType:1 slot:v8 identifier:v10 configurationObject:0 handler:v9];

  if (v11) {
    [(SBInProcessSecureAppAction *)v11 setApplicationSceneEntity:v7];
  }

  return v11;
}

- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 hostableEntity:(id)a4 handler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4FA7028];
  id v9 = a5;
  v10 = SBSIdentifierForSecureAppType();
  v13.receiver = self;
  v13.super_class = (Class)SBInProcessSecureAppAction;
  v11 = [(SBInProcessSecureAppAction *)&v13 initWithType:1 slot:v8 identifier:v10 configurationObject:0 handler:v9];

  if (v11) {
    [(SBInProcessSecureAppAction *)v11 setHostableEntity:v7];
  }

  return v11;
}

- (BOOL)isInProcessAction
{
  return 1;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (void)setApplicationSceneEntity:(id)a3
{
}

- (CSHostableEntity)hostableEntity
{
  return self->_hostableEntity;
}

- (void)setHostableEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

@end