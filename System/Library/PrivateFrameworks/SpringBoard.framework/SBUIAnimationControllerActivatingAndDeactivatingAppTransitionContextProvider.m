@interface SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider
+ (id)transitionContextProviderWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4;
- (NSSet)fromApplicationSceneEntities;
- (NSSet)toApplicationSceneEntities;
- (SBApplicationSceneEntity)activatingAppSceneEntity;
- (SBApplicationSceneEntity)deactivatingAppSceneEntity;
- (SBApplicationSceneEntity)fromApplicationSceneEntity;
- (SBApplicationSceneEntity)toApplicationSceneEntity;
- (SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider)initWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4;
- (void)setActivatingAppSceneEntity:(id)a3;
- (void)setDeactivatingAppSceneEntity:(id)a3;
@end

@implementation SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider

+ (id)transitionContextProviderWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider alloc] initWithToApplicationSceneEntity:v6 fromApplicationSceneEntity:v5];

  return v7;
}

- (SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider)initWithToApplicationSceneEntity:(id)a3 fromApplicationSceneEntity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider;
  v9 = [(SBUIAnimationControllerActivatingAndDeactivatingAppTransitionContextProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_toAppSceneEntity, a3);
    objc_storeStrong((id *)&v10->_fromAppSceneEntity, a4);
  }

  return v10;
}

- (NSSet)toApplicationSceneEntities
{
  if (self->_toAppSceneEntity) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
  }
  else {
  v2 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v2;
}

- (NSSet)fromApplicationSceneEntities
{
  if (self->_fromAppSceneEntity) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
  }
  else {
  v2 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v2;
}

- (SBApplicationSceneEntity)activatingAppSceneEntity
{
  return self->_toAppSceneEntity;
}

- (void)setActivatingAppSceneEntity:(id)a3
{
}

- (SBApplicationSceneEntity)deactivatingAppSceneEntity
{
  return self->_fromAppSceneEntity;
}

- (void)setDeactivatingAppSceneEntity:(id)a3
{
}

- (SBApplicationSceneEntity)toApplicationSceneEntity
{
  return self->_toApplicationSceneEntity;
}

- (SBApplicationSceneEntity)fromApplicationSceneEntity
{
  return self->_fromApplicationSceneEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromApplicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_toApplicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_fromAppSceneEntity, 0);
  objc_storeStrong((id *)&self->_toAppSceneEntity, 0);
}

@end