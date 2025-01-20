@interface UISceneActivationRequestOptions
- (BOOL)_requestFullscreen;
- (BOOL)preserveLayout;
- (NSString)debugDescription;
- (UIScene)requestingScene;
- (UISceneCollectionJoinBehavior)collectionJoinBehavior;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_collectionJoinBehavior;
- (void)_setRequestFullscreen:(BOOL)a3;
- (void)setCollectionJoinBehavior:(UISceneCollectionJoinBehavior)collectionJoinBehavior;
- (void)setPreserveLayout:(BOOL)a3;
- (void)setRequestingScene:(UIScene *)requestingScene;
@end

@implementation UISceneActivationRequestOptions

- (void).cxx_destruct
{
}

- (int64_t)_collectionJoinBehavior
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(UISceneActivationRequestOptions *)self requestingScene];
  [v4 setRequestingScene:v5];

  objc_msgSend(v4, "setPreserveLayout:", -[UISceneActivationRequestOptions preserveLayout](self, "preserveLayout"));
  objc_msgSend(v4, "_setRequestFullscreen:", -[UISceneActivationRequestOptions _requestFullscreen](self, "_requestFullscreen"));
  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)[(UISceneActivationRequestOptions *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UISceneActivationRequestOptions *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(UISceneActivationRequestOptions *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__UISceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __73__UISceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) requestingScene];
  id v2 = (id)[v1 appendObject:v3 withName:@"requestingScene" skipIfNil:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UISceneActivationRequestOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UISceneActivationRequestOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (UIScene)requestingScene
{
  return self->_requestingScene;
}

- (void)setRequestingScene:(UIScene *)requestingScene
{
}

- (UISceneCollectionJoinBehavior)collectionJoinBehavior
{
  return self->_collectionJoinBehavior;
}

- (void)setCollectionJoinBehavior:(UISceneCollectionJoinBehavior)collectionJoinBehavior
{
  self->_collectionJoinBehavior = collectionJoinBehavior;
}

- (BOOL)preserveLayout
{
  return self->_preserveLayout;
}

- (void)setPreserveLayout:(BOOL)a3
{
  self->_preserveLayout = a3;
}

- (BOOL)_requestFullscreen
{
  return self->__requestFullscreen;
}

- (void)_setRequestFullscreen:(BOOL)a3
{
  self->__requestFullscreen = a3;
}

@end