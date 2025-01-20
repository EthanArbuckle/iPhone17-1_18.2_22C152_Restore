@interface _UIFocusUpdateRequest
+ (id)requestForRemovingFocusInFocusSystem:(id)a3;
- (BOOL)allowsDeferral;
- (BOOL)allowsFocusingCurrentItem;
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (BOOL)canMergeWithRequest:(id)a3;
- (BOOL)isFocusRemovalRequest;
- (BOOL)isMovementRequest;
- (BOOL)isValidInFocusSystem:(id)a3;
- (BOOL)requiresEnvironmentValidation;
- (BOOL)requiresNextFocusedItem;
- (BOOL)resetsUpdateThrottle;
- (BOOL)shouldPerformHapticFeedback;
- (BOOL)shouldPlayFocusSound;
- (BOOL)shouldScrollIfNecessary;
- (UIFocusEnvironment)destinationEnvironment;
- (UIFocusEnvironment)environment;
- (UIFocusSystem)focusSystem;
- (_UIFocusInputDeviceInfo)inputDeviceInfo;
- (_UIFocusUpdateRequest)init;
- (_UIFocusUpdateRequest)initWithEnvironment:(id)a3;
- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4;
- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)requestByMergingWithRequest:(id)a3;
- (id)requestByRedirectingRequestToEnvironment:(id)a3;
- (id)requestByRedirectingRequestToNextContainerEnvironment;
- (void)cacheCurrentFocusSystem;
- (void)setAllowsDeferral:(BOOL)a3;
- (void)setAllowsFocusingCurrentItem:(BOOL)a3;
- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3;
- (void)setResetsUpdateThrottle:(BOOL)a3;
- (void)setScrollIfNecessary:(BOOL)a3;
- (void)setShouldPlayFocusSound:(BOOL)a3;
@end

@implementation _UIFocusUpdateRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_destroyWeak((id *)&self->_destinationEnvironment);
}

- (void)setAllowsFocusingCurrentItem:(BOOL)a3
{
  self->_allowsFocusingCurrentItem = a3;
}

- (_UIFocusUpdateRequest)initWithEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 33, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusUpdateRequest;
  v6 = [(_UIFocusUpdateRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_focusSystem, 0);
    objc_storeWeak((id *)&v7->_environment, v5);
    objc_storeWeak((id *)&v7->_destinationEnvironment, v5);
    v7->_allowsDeferral = 1;
    v7->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v7;
}

- (_UIFocusUpdateRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusUpdateRequest.m" lineNumber:27 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 46, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 47, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusUpdateRequest;
  objc_super v10 = [(_UIFocusUpdateRequest *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_focusSystem, v7);
    objc_storeWeak((id *)&v11->_environment, v9);
    objc_storeWeak((id *)&v11->_destinationEnvironment, v9);
    v11->_allowsDeferral = 1;
    v11->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v11;
}

- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 60, @"Invalid parameter not satisfying: %@", @"destinationEnvironment" object file lineNumber description];
  }
  if (!_UIFocusEnvironmentIsAncestorOfEnvironment(v10, v11))
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = v11;
      if (v11)
      {
        v18 = NSString;
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
      }
      else
      {
        v21 = @"(nil)";
      }

      id v28 = v10;
      if (v28)
      {
        v29 = NSString;
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = [v29 stringWithFormat:@"<%@: %p>", v31, v28];
      }
      else
      {
        v32 = @"(nil)";
      }

      [v16 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 61, @"Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@", v21, v32 object file lineNumber description];
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v22 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        goto LABEL_25;
      }
      id v39 = v11;
      if (v11)
      {
        v41 = NSString;
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v40 = [v41 stringWithFormat:@"<%@: %p>", v43, v39];
      }
      else
      {
        v40 = @"(nil)";
      }

      v33 = v40;
      id v44 = v10;
      if (v44)
      {
        v45 = NSString;
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        v38 = [v45 stringWithFormat:@"<%@: %p>", v47, v44];
      }
      else
      {
        v38 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      v49 = v33;
      __int16 v50 = 2112;
      v51 = v38;
      _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      v22 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &initWithFocusSystem_environment_destinationEnvironment____s_category)+ 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_4;
      }
      id v23 = v11;
      if (v11)
      {
        v24 = NSString;
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        v27 = [v24 stringWithFormat:@"<%@: %p>", v26, v23];
      }
      else
      {
        v27 = @"(nil)";
      }

      v33 = v27;
      id v34 = v10;
      if (v34)
      {
        v35 = NSString;
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        v38 = [v35 stringWithFormat:@"<%@: %p>", v37, v34];
      }
      else
      {
        v38 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      v49 = v33;
      __int16 v50 = 2112;
      v51 = v38;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_25;
  }
LABEL_4:
  v12 = [(_UIFocusUpdateRequest *)self initWithFocusSystem:v9 environment:v10];
  v13 = v12;
  if (v12) {
    objc_storeWeak((id *)&v12->_destinationEnvironment, v11);
  }

  return v13;
}

+ (id)requestForRemovingFocusInFocusSystem:(id)a3
{
  id v3 = a3;
  v4 = [[_UIFocusUpdateRequest alloc] initWithFocusSystem:v3 environment:v3];

  v4->_isFocusRemovalRequest = 1;
  v4->_allowsFocusingCurrentItem = 1;
  return v4;
}

- (id)requestByRedirectingRequestToEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = (id *)[(_UIFocusUpdateRequest *)self copy];
  objc_storeWeak(v5 + 4, v4);
  objc_storeWeak(v5 + 2, v4);

  objc_storeWeak(v5 + 3, 0);
  return v5;
}

- (id)requestByRedirectingRequestToNextContainerEnvironment
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__221;
  id v11 = __Block_byref_object_dispose__221;
  id v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78___UIFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke;
  v6[3] = &unk_1E52EDBF0;
  v6[4] = self;
  v6[5] = &v7;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);

  if (v8[5])
  {
    id v4 = -[_UIFocusUpdateRequest requestByRedirectingRequestToEnvironment:](self, "requestByRedirectingRequestToEnvironment:");
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v6 = [v4 initWithEnvironment:WeakRetained];

  id v7 = objc_loadWeakRetained((id *)&self->_focusSystem);
  objc_storeWeak((id *)(v6 + 24), v7);

  id v8 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  objc_storeWeak((id *)(v6 + 16), v8);

  *(unsigned char *)(v6 + 10) = self->_isFocusRemovalRequest;
  *(unsigned char *)(v6 + 11) = self->_shouldPlayFocusSound;
  *(unsigned char *)(v6 + 12) = self->_allowsFocusingCurrentItem;
  *(unsigned char *)(v6 + 9) = self->_allowsDeferral;
  *(unsigned char *)(v6 + 8) = self->_scrollIfNecessary;
  *(unsigned char *)(v6 + 13) = self->_allowsOverridingPreferedFocusEnvironments;
  *(unsigned char *)(v6 + 14) = self->_resetsUpdateThrottle;
  return (id)v6;
}

- (BOOL)canMergeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFocusUpdateRequest *)self focusSystem];
  uint64_t v6 = [v4 focusSystem];
  id v7 = (void *)v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v10 = v8 || v5 == (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (WeakRetained)
  {
    id v12 = [v4 destinationEnvironment];
    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
      id v14 = [v4 destinationEnvironment];
      BOOL v15 = v13 == v14;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  if (v10)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_environment);
    id v17 = [v4 environment];
    if (v16 == v17 && v15)
    {
      int isFocusRemovalRequest = self->_isFocusRemovalRequest;
      BOOL v20 = isFocusRemovalRequest == [v4 isFocusRemovalRequest];
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)requestByMergingWithRequest:(id)a3
{
  id v4 = (id *)a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = [(_UIFocusUpdateRequest *)self canMergeWithRequest:v4];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      BOOL v20 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "Cannot merge focus update requests that are not allowed to be merged.", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &requestByMergingWithRequest____s_category) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Cannot merge focus update requests that are not allowed to be merged.", v22, 2u);
    }
  }
  id v7 = [_UIFocusUpdateRequest alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  uint64_t v9 = [(_UIFocusUpdateRequest *)v7 initWithEnvironment:WeakRetained];

  id v10 = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v10)
  {
    objc_storeWeak((id *)(v9 + 24), v10);
  }
  else
  {
    id v11 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)(v9 + 24), v11);
  }
  id v12 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (v12)
  {
    objc_storeWeak((id *)(v9 + 16), v12);
  }
  else
  {
    id v13 = objc_loadWeakRetained(v4 + 2);
    objc_storeWeak((id *)(v9 + 16), v13);
  }
  *(unsigned char *)(v9 + 10) = self->_isFocusRemovalRequest;
  if (self->_allowsDeferral) {
    uint64_t v14 = [v4 allowsDeferral];
  }
  else {
    uint64_t v14 = 0;
  }
  [(id)v9 setAllowsDeferral:v14];
  if (self->_scrollIfNecessary) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = [v4 shouldScrollIfNecessary];
  }
  [(id)v9 setScrollIfNecessary:v15];
  if (self->_shouldPlayFocusSound) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = [v4 shouldPlayFocusSound];
  }
  [(id)v9 setShouldPlayFocusSound:v16];
  if (self->_allowsFocusingCurrentItem) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = [v4 allowsFocusingCurrentItem];
  }
  [(id)v9 setAllowsFocusingCurrentItem:v17];
  if (self->_resetsUpdateThrottle) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [v4 resetsUpdateThrottle];
  }
  [(id)v9 setResetsUpdateThrottle:v18];

  return (id)v9;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = v4;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_environment);
    if (v6
      && (+[UIFocusSystem focusSystemForEnvironment:v6],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = v7;
      id v5 = v4;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v11 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unable to find focus system for request. Environment does not appear to be in a valid focus environment chain.", buf, 2u);
        }
      }
      else
      {
        BOOL v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &focusSystem___s_category) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unable to find focus system for request. Environment does not appear to be in a valid focus environment chain.", v12, 2u);
        }
      }
      uint64_t v9 = +[UIScreen mainScreen];
      id v5 = +[UIFocusSystem focusSystemForEnvironment:v9];

      id v4 = 0;
    }
  }
  return (UIFocusSystem *)v5;
}

- (void)cacheCurrentFocusSystem
{
  id v3 = [(_UIFocusUpdateRequest *)self focusSystem];
  objc_storeWeak((id *)&self->_focusSystem, v3);
}

- (BOOL)isValidInFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusUpdateRequest.m", 204, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained
    && ([(_UIFocusUpdateRequest *)self focusSystem],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v5))
  {
    id v9 = +[UIFocusSystem focusSystemForEnvironment:WeakRetained];
    BOOL v8 = v9 == v5;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isMovementRequest
{
  return 0;
}

- (BOOL)requiresNextFocusedItem
{
  return 0;
}

- (BOOL)requiresEnvironmentValidation
{
  return 0;
}

- (BOOL)shouldPerformHapticFeedback
{
  return 0;
}

- (_UIFocusInputDeviceInfo)inputDeviceInfo
{
  return 0;
}

- (BOOL)shouldScrollIfNecessary
{
  return self->_scrollIfNecessary;
}

- (void)setScrollIfNecessary:(BOOL)a3
{
  self->_scrollIfNecessary = a3;
}

- (UIFocusEnvironment)destinationEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (UIFocusEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (BOOL)allowsDeferral
{
  return self->_allowsDeferral;
}

- (void)setAllowsDeferral:(BOOL)a3
{
  self->_allowsDeferral = a3;
}

- (BOOL)isFocusRemovalRequest
{
  return self->_isFocusRemovalRequest;
}

- (BOOL)shouldPlayFocusSound
{
  return self->_shouldPlayFocusSound;
}

- (void)setShouldPlayFocusSound:(BOOL)a3
{
  self->_shouldPlayFocusSound = a3;
}

- (BOOL)allowsFocusingCurrentItem
{
  return self->_allowsFocusingCurrentItem;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (BOOL)resetsUpdateThrottle
{
  return self->_resetsUpdateThrottle;
}

- (void)setResetsUpdateThrottle:(BOOL)a3
{
  self->_resetsUpdateThrottle = a3;
}

@end