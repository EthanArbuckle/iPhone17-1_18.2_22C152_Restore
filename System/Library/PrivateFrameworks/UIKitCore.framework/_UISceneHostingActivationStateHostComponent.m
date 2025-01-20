@interface _UISceneHostingActivationStateHostComponent
- (id)foregroundAssertionForReason:(id)a3;
- (void)_scene:(id)a3 isMovingToParent:(id)a4;
- (void)evaluateActivationState;
- (void)propagateForeground:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setScene:(id)a3;
@end

@implementation _UISceneHostingActivationStateHostComponent

- (void)setScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISceneHostingActivationStateHostComponent;
  [(FBSSceneComponent *)&v6 setScene:a3];
  v4 = [(FBSSceneComponent *)self hostScene];
  v5 = [v4 _relationshipManagementHostComponent];
  [v5 addObserver:self];
}

- (id)foregroundAssertionForReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ++self->_foregroundAssertionCount;
  v5 = NSString;
  objc_super v6 = [(FBSSceneComponent *)self hostScene];
  v7 = [v6 identityToken];
  v8 = [v5 stringWithFormat:@"foregroundAssertion::%@", v7];

  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76___UISceneHostingActivationStateHostComponent_foregroundAssertionForReason___block_invoke;
  v14[3] = &unk_1E52E04F8;
  objc_copyWeak(&v15, &location);
  v10 = (void *)[v9 initWithIdentifier:v8 forReason:v4 invalidationBlock:v14];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHostingActivationState", &foregroundAssertionForReason____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v13 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Foreground assertion taken: %@", buf, 0xCu);
    }
  }
  [(_UISceneHostingActivationStateHostComponent *)self evaluateActivationState];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (void)evaluateActivationState
{
  if (self->_foregroundAssertionCount)
  {
    [(_UISceneHostingActivationStateHostComponent *)self propagateForeground:0];
    v3 = self;
    uint64_t v4 = 1;
LABEL_3:
    [(_UISceneHostingActivationStateHostComponent *)v3 setForeground:v4];
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEnvironment);

  if (!WeakRetained)
  {
    [(_UISceneHostingActivationStateHostComponent *)self propagateForeground:0];
    v3 = self;
    uint64_t v4 = 0;
    goto LABEL_3;
  }
  [(_UISceneHostingActivationStateHostComponent *)self propagateForeground:1];
}

- (void)setForeground:(BOOL)a3
{
  uint64_t v4 = [(FBSSceneComponent *)self hostScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61___UISceneHostingActivationStateHostComponent_setForeground___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = a3;
  [v4 updateSettings:v5];
}

- (void)propagateForeground:(BOOL)a3
{
  if (self->_isCurrentlyPropagatingForeground != a3)
  {
    self->_isCurrentlyPropagatingForeground = a3;
    v5 = [(FBSSceneComponent *)self hostScene];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67___UISceneHostingActivationStateHostComponent_propagateForeground___block_invoke;
    v6[3] = &unk_1E52E9E80;
    BOOL v7 = a3;
    v6[4] = self;
    [v5 updateSettings:v6];
  }
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  objc_storeWeak((id *)&self->_parentEnvironment, a4);
  [(_UISceneHostingActivationStateHostComponent *)self evaluateActivationState];
}

- (void).cxx_destruct
{
}

@end