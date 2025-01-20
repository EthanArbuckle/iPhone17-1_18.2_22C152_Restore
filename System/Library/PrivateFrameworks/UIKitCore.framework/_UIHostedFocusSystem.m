@interface _UIHostedFocusSystem
- (BOOL)_focusSystemIsValid;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_postsFocusUpdateNotifications;
- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3;
- (BOOL)_requiresFocusedItemToBeInHierarchy;
- (BOOL)containsChildOfHostEnvironment:(id)a3;
- (UIFocusEnvironment)hostEnvironment;
- (_UIHostedFocusSystemDelegate)delegate;
- (_UIHostedFocusSystemDelegateProxy)delegateProxy;
- (_UIHostedFocusSystemItemContainer)itemContainerProxy;
- (id)_hostFocusSystem;
- (id)_initWithHostEnvironment:(id)a3;
- (id)behavior;
- (void)setDelegate:(id)a3;
- (void)setDelegateProxy:(id)a3;
@end

@implementation _UIHostedFocusSystem

- (id)_initWithHostEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIHostedFocusSystem.m", 73, @"Invalid parameter not satisfying: %@", @"hostEnvironment" object file lineNumber description];
  }
  v6 = +[UIFocusSystem focusSystemForEnvironment:v5];
  v7 = [v6 behavior];
  v20.receiver = self;
  v20.super_class = (Class)_UIHostedFocusSystem;
  v8 = [(UIFocusSystem *)&v20 initWithFocusBehavior:v7 enabled:1];

  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostEnvironment, v5);
    v9 = [[_UIHostedFocusSystemItemContainer alloc] initWithHostedFocusSystem:v8];
    itemContainerProxy = v8->_itemContainerProxy;
    v8->_itemContainerProxy = v9;

    v11 = v8;
    if (qword_1EB25BD88 != -1) {
      dispatch_once(&qword_1EB25BD88, &__block_literal_global_214);
    }
    v12 = [(_UIHostedFocusSystem *)v11 hostEnvironment];
    if (!v12)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = [NSString stringWithUTF8String:"void _UIHostedFocusSystemRegister(_UIHostedFocusSystem *__strong)"];
      [v18 handleFailureInFunction:v19, @"_UIHostedFocusSystem.m", 29, @"Invalid parameter not satisfying: %@", @"hostEnvironment" file lineNumber description];
    }
    id v13 = (id)_MergedGlobals_1_11;
    v14 = [v13 objectForKey:v12];
    if (v14)
    {
      v15 = v14;
      [v14 addObject:v11];
    }
    else
    {
      v15 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      [v15 addObject:v11];
      [v13 setObject:v15 forKey:v12];
    }
  }
  return v8;
}

- (_UIHostedFocusSystemDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)_UIHostedFocusSystem;
  v2 = [(UIFocusSystem *)&v4 delegate];
  return (_UIHostedFocusSystemDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIHostedFocusSystem *)self delegateProxy];
  id v6 = [v5 delegate];

  if (v6 != v4)
  {
    v7 = [[_UIHostedFocusSystemDelegateProxy alloc] initWithFocusSystem:self delegate:v4];
    [(_UIHostedFocusSystem *)self setDelegateProxy:v7];
    v8.receiver = self;
    v8.super_class = (Class)_UIHostedFocusSystem;
    [(UIFocusSystem *)&v8 setDelegate:v7];
  }
}

- (BOOL)containsChildOfHostEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIHostedFocusSystem.m", 103, @"Invalid parameter not satisfying: %@", @"childEnvironment" object file lineNumber description];
  }
  id v6 = [(_UIHostedFocusSystem *)self delegateProxy];
  v7 = [v6 delegate];

  if (v7) {
    char v8 = [v7 _focusSystem:self containsChildOfHostEnvironment:v5];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)behavior
{
  v3 = [(_UIHostedFocusSystem *)self _hostFocusSystem];
  id v4 = [v3 behavior];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIHostedFocusSystem;
    id v6 = [(UIFocusSystem *)&v9 behavior];
  }
  v7 = v6;

  return v7;
}

- (id)_hostFocusSystem
{
  p_hostEnvironment = &self->_hostEnvironment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_hostEnvironment);
    id v5 = +[UIFocusSystem focusSystemForEnvironment:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  return 0;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 0;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  return 0;
}

- (BOOL)_focusSystemIsValid
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHostedFocusSystem;
  if (![(UIFocusSystem *)&v6 _focusSystemIsValid]) {
    return 0;
  }
  v3 = [(_UIHostedFocusSystem *)self _hostFocusSystem];
  char v4 = [v3 _focusSystemIsValid];

  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystem;
  if (![(UIFocusSystem *)&v8 _isEligibleForFocusInteraction]) {
    return 0;
  }
  p_hostEnvironment = &self->_hostEnvironment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_hostEnvironment);
    char IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v5);
  }
  else
  {
    char IsEligibleForFocusInteraction = 0;
  }

  return IsEligibleForFocusInteraction;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystem;
  if (![(UIFocusSystem *)&v8 _isEligibleForFocusOcclusion]) {
    return 0;
  }
  p_hostEnvironment = &self->_hostEnvironment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_hostEnvironment);
    char IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v5, 0);
  }
  else
  {
    char IsEligibleForFocusOcclusion = 0;
  }

  return IsEligibleForFocusOcclusion;
}

- (UIFocusEnvironment)hostEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (_UIHostedFocusSystemItemContainer)itemContainerProxy
{
  return self->_itemContainerProxy;
}

- (_UIHostedFocusSystemDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void)setDelegateProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_itemContainerProxy, 0);
  objc_destroyWeak((id *)&self->_hostEnvironment);
}

@end