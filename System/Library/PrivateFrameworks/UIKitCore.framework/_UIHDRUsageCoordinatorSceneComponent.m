@interface _UIHDRUsageCoordinatorSceneComponent
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_UIHDRUsageCoordinatorSceneComponent)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_invalidateTraitOverrides;
- (void)_powerStateDidChange:(id)a3;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_setApplicationOcclusionRects:(id)a3;
- (void)_setScene:(id)a3;
- (void)_setSystemOcclusionRects:(id)a3;
- (void)dealloc;
@end

@implementation _UIHDRUsageCoordinatorSceneComponent

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  if (self)
  {
    char flags = (char)self->_flags;
    if (a4 < 1 == ((flags & 8) == 0))
    {
      *(unsigned char *)&self->_char flags = flags & 0xF7 | (8 * (a4 < 1));
      [(_UIHDRUsageCoordinatorSceneComponent *)self _invalidateTraitOverrides];
    }
  }
}

- (void)_invalidateTraitOverrides
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    [WeakRetained _componentDidUpdateTraitOverrides:self];
  }
}

- (UITraitCollection)_traitOverrides
{
  if ((*(unsigned char *)&self->_flags & 0x38) == 8)
  {
    v2 = [MEMORY[0x1E4F28F80] processInfo];
    int v3 = [v2 isLowPowerModeEnabled];
  }
  else
  {
    int v3 = 1;
  }
  +[_UIHDRUsageCoordinator sharedInstance]();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIHDRUsageCoordinator traitCollectionSuppressingHDR:](v4, v3);

  return (UITraitCollection *)v5;
}

- (_UIHDRUsageCoordinatorSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIHDRUsageCoordinatorSceneComponent;
  v5 = [(_UIHDRUsageCoordinatorSceneComponent *)&v15 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_scene, v4);
    objc_opt_class();
    *(unsigned char *)&v6->_char flags = *(unsigned char *)&v6->_flags & 0xFE | objc_opt_isKindOfClass() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    if (objc_opt_respondsToSelector()) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&v6->_char flags = *(unsigned char *)&v6->_flags & 0xFD | v9;

    id v10 = objc_loadWeakRetained((id *)&v6->_scene);
    if (objc_opt_respondsToSelector()) {
      char v11 = 4;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&v6->_char flags = *(unsigned char *)&v6->_flags & 0xFB | v11;

    id v12 = objc_loadWeakRetained((id *)&v6->_scene);
    *(unsigned char *)&v6->_char flags = *(unsigned char *)&v6->_flags & 0xF7 | (8 * ([v12 activationState] < 1));

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel__powerStateDidChange_ name:*MEMORY[0x1E4F287E8] object:0];
  }
  return v6;
}

- (void)_setScene:(id)a3
{
}

- (void)_setSystemOcclusionRects:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    id v8 = v4;
    uint64_t v6 = [v4 count];
    v5 = v8;
    char flags = (char)self->_flags;
    if ((v6 != 0) == ((flags & 0x20) == 0))
    {
      *(unsigned char *)&self->_char flags = flags & 0xDF | (32 * (v6 != 0));
      [(_UIHDRUsageCoordinatorSceneComponent *)self _invalidateTraitOverrides];
      v5 = v8;
    }
  }
}

- (void)_setApplicationOcclusionRects:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v6 = [v4 count];
    if (v6)
    {
      uint64_t v7 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      char v9 = [WeakRetained screen];
      id v10 = [v9 fixedCoordinateSpace];

      char v11 = [WeakRetained coordinateSpace];
      id v12 = v11;
      if (!v10 || !v11)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v42 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            v46 = v10;
            __int16 v47 = 2048;
            v48 = v12;
            _os_log_fault_impl(&dword_1853B0000, v42, OS_LOG_TYPE_FAULT, "Could not obtain source(%p) or destination(%p) coordinate space", buf, 0x16u);
          }
        }
        else
        {
          v39 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_931) + 8);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v46 = v10;
            __int16 v47 = 2048;
            v48 = v12;
            _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "Could not obtain source(%p) or destination(%p) coordinate space", buf, 0x16u);
          }
        }
        if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
          goto LABEL_24;
        }
        char v40 = *(unsigned char *)&self->_flags & 0xEF;
        goto LABEL_23;
      }
      [v11 bounds];
      if (v7 != 1)
      {
        if (!os_variant_has_internal_diagnostics())
        {
          v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25EEA8) + 8);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v5;
            _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_ERROR, "Expected single occlusion rect, got multiple – %@", buf, 0xCu);
          }
          goto LABEL_21;
        }
        v35 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v5;
          _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "Expected single occlusion rect, got multiple – %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
      double rect = v15 * v16;
      CGFloat v17 = v14;
      CGFloat v18 = v13;
      CGFloat v19 = v16;
      CGFloat v20 = v15;
      v21 = [v5 firstObject];
      [v21 CGRectValue];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;

      objc_msgSend(v10, "convertRect:toCoordinateSpace:", v12, v23, v25, v27, v29);
      CGFloat x = v52.origin.x;
      CGFloat y = v52.origin.y;
      CGFloat width = v52.size.width;
      CGFloat height = v52.size.height;
      v58.origin.CGFloat x = v18;
      v58.origin.CGFloat y = v17;
      v58.size.CGFloat width = v20;
      v58.size.CGFloat height = v19;
      CGRect v53 = CGRectIntersection(v52, v58);
      if (v53.size.width * v53.size.height / rect <= 0.999)
      {
        CGRect v43 = v53;
        if (os_variant_has_internal_diagnostics())
        {
          v35 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            goto LABEL_31;
          }
          v56.size.CGFloat width = v20;
          v56.origin.CGFloat x = v18;
          v56.origin.CGFloat y = v17;
          v56.size.CGFloat height = v19;
          v36 = NSStringFromCGRect(v56);
          v57.origin.CGFloat x = x;
          v57.origin.CGFloat y = y;
          v57.size.CGFloat width = width;
          v57.size.CGFloat height = height;
          v37 = NSStringFromCGRect(v57);
          v38 = NSStringFromCGRect(v43);
          *(_DWORD *)buf = 138412802;
          v46 = v36;
          __int16 v47 = 2112;
          v48 = v37;
          __int16 v49 = 2112;
          v50 = v38;
          _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "Expected full coverage from single occlusion rect (sceneBounds=%@, sceneOrientedOcclusion=%@, intersection=%@)", buf, 0x20u);
LABEL_10:

LABEL_31:
          goto LABEL_21;
        }
        v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25EEA0) + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = v34;
          v54.origin.CGFloat x = v18;
          v54.origin.CGFloat y = v17;
          v54.size.CGFloat width = v20;
          v54.size.CGFloat height = v19;
          v36 = NSStringFromCGRect(v54);
          v55.origin.CGFloat x = x;
          v55.origin.CGFloat y = y;
          v55.size.CGFloat width = width;
          v55.size.CGFloat height = height;
          v37 = NSStringFromCGRect(v55);
          v38 = NSStringFromCGRect(v43);
          *(_DWORD *)buf = 138412802;
          v46 = v36;
          __int16 v47 = 2112;
          v48 = v37;
          __int16 v49 = 2112;
          v50 = v38;
          _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "Expected full coverage from single occlusion rect (sceneBounds=%@, sceneOrientedOcclusion=%@, intersection=%@)", buf, 0x20u);
          goto LABEL_10;
        }
      }
LABEL_21:
      if ((*(unsigned char *)&self->_flags & 0x10) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      char v40 = *(unsigned char *)&self->_flags | 0x10;
LABEL_23:
      *(unsigned char *)&self->_char flags = v40;
      [(_UIHDRUsageCoordinatorSceneComponent *)self _invalidateTraitOverrides];
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
      *(unsigned char *)&self->_flags &= ~0x10u;
      [(_UIHDRUsageCoordinatorSceneComponent *)self _invalidateTraitOverrides];
    }
  }
LABEL_25:
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F287E8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIHDRUsageCoordinatorSceneComponent;
  [(_UIHDRUsageCoordinatorSceneComponent *)&v4 dealloc];
}

- (void)_powerStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___UIHDRUsageCoordinatorSceneComponent__powerStateDidChange___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end