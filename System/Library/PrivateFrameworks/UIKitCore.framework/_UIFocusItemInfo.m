@interface _UIFocusItemInfo
+ (_UIFocusItemInfo)infoWithItem:(id)a3;
+ (_UIFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4;
+ (_UIFocusItemInfo)infoWithView:(id)a3;
- (BOOL)isFocusMovementFlippedHorizontally;
- (BOOL)itemIsKindOfView;
- (BOOL)useFallbackAncestorScroller;
- (CGRect)focusedRectInCoordinateSpace:(id)a3;
- (NSArray)ancestorEnvironmentScrollableContainers;
- (UIFocusItem)item;
- (UIView)containingView;
- (_UIFocusRegion)focusedRegion;
- (id)_createFocusedRegion;
- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5;
- (id)description;
- (id)shortDescription;
- (int64_t)focusTouchSensitivityStyle;
- (int64_t)inheritedFocusMovementStyle;
- (int64_t)rotaryFocusMovementAxis;
- (void)invalidateFocusedRegion;
@end

@implementation _UIFocusItemInfo

+ (_UIFocusItemInfo)infoWithItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithItem:v4 containingView:0 useFallbackAncestorScroller:0];

  return (_UIFocusItemInfo *)v5;
}

+ (_UIFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithItem:v6 containingView:0 useFallbackAncestorScroller:v4];

  return (_UIFocusItemInfo *)v7;
}

+ (_UIFocusItemInfo)infoWithView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithItem:v4 containingView:v4 useFallbackAncestorScroller:0];

  return (_UIFocusItemInfo *)v5;
}

- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusItemInfo;
  v10 = [(_UIFocusItemInfo *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_item, v8);
    if (v9)
    {
      objc_storeWeak((id *)&v11->_containingView, v9);
    }
    else
    {
      v12 = _UIFocusEnvironmentContainingView(v8);
      objc_storeWeak((id *)&v11->_containingView, v12);
    }
    v11->_inheritedFocusMovementStyle = 0;
    if (v5) {
      char v13 = 16;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&v11->_flags = *(unsigned char *)&v11->_flags & 0xEF | v13;
  }

  return v11;
}

- (BOOL)itemIsKindOfView
{
  v3 = [(_UIFocusItemInfo *)self item];
  if (v3)
  {
    id v4 = [(_UIFocusItemInfo *)self item];
    BOOL v5 = [(_UIFocusItemInfo *)self containingView];
    BOOL v6 = v4 == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSArray)ancestorEnvironmentScrollableContainers
{
  ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  if (!ancestorEnvironmentScrollableContainers)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    _UIFocusAncestorEnvironmentScrollableContainers(WeakRetained, (*(unsigned char *)&self->_flags >> 4) & 1);
    BOOL v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = self->_ancestorEnvironmentScrollableContainers;
    self->_ancestorEnvironmentScrollableContainers = v5;

    ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  }
  return ancestorEnvironmentScrollableContainers;
}

- (int64_t)inheritedFocusMovementStyle
{
  int64_t result = self->_inheritedFocusMovementStyle;
  if (!result)
  {
    id v4 = [(_UIFocusItemInfo *)self item];

    if (v4)
    {
      BOOL v5 = [(_UIFocusItemInfo *)self item];
      self->_inheritedFocusMovementStyle = _UIFocusEnvironmentInheritedFocusMovementStyle(v5);

      return self->_inheritedFocusMovementStyle;
    }
    else
    {
      int64_t result = 1;
      self->_inheritedFocusMovementStyle = 1;
    }
  }
  return result;
}

- (int64_t)focusTouchSensitivityStyle
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v3 = [(_UIFocusItemInfo *)self item];
    if (_UIFocusItemIsViewOrRespondsToSelector(v3)) {
      int64_t v4 = [v3 _focusTouchSensitivityStyle];
    }
    else {
      int64_t v4 = 0;
    }
    self->_focusTouchSensitivityStyle = v4;
    *(unsigned char *)&self->_flags |= 1u;
  }
  return self->_focusTouchSensitivityStyle;
}

- (int64_t)rotaryFocusMovementAxis
{
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    v3 = [(_UIFocusItemInfo *)self item];
    self->_rotaryFocusMovementAxis = _UIFocusEnvironmentResolvedRotaryFocusMovementAxis(v3, 0);

    *(unsigned char *)&self->_flags |= 8u;
  }
  return self->_rotaryFocusMovementAxis;
}

- (BOOL)isFocusMovementFlippedHorizontally
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v3 = [(_UIFocusItemInfo *)self item];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54___UIFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke;
    v5[3] = &unk_1E52EDC68;
    v5[4] = &v6;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v3, v5);

    *((unsigned char *)&self->_flags + 1) = *((unsigned char *)v7 + 24);
    *(unsigned char *)&self->_flags |= 2u;
    _Block_object_dispose(&v6, 8);
  }
  return *((unsigned char *)&self->_flags + 1);
}

- (BOOL)useFallbackAncestorScroller
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (_UIFocusRegion)focusedRegion
{
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    v3 = [(_UIFocusItemInfo *)self _createFocusedRegion];
    focusedRegion = self->_focusedRegion;
    self->_focusedRegion = v3;

    *(unsigned char *)&self->_flags |= 4u;
  }
  BOOL v5 = self->_focusedRegion;
  return v5;
}

- (id)_createFocusedRegion
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  BOOL v5 = WeakRetained;
  if (!WeakRetained)
  {
    v22 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = [WeakRetained parentFocusEnvironment];
  if (!v6)
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = NSString;
      id v37 = v5;
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      v40 = [v36 stringWithFormat:@"<%@: %p>", v39, v37];

      [v35 handleFailureInMethod:a2, self, @"_UIFocusItemInfo.m", 190, @"Focus item %@ does not provide a parentFocusEnvironment.", v40 object file lineNumber description];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      v35 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      v75 = NSString;
      id v76 = v5;
      v77 = (objc_class *)objc_opt_class();
      v78 = NSStringFromClass(v77);
      v40 = [v75 stringWithFormat:@"<%@: %p>", v78, v76];

      *(_DWORD *)buf = 138412290;
      id v93 = v40;
      _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "Focus item %@ does not provide a parentFocusEnvironment.  This will become an assert in a future version.", buf, 0xCu);
    }
    else
    {
      v41 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1040) + 8);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      v42 = NSString;
      id v43 = v5;
      v35 = v41;
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v40 = [v42 stringWithFormat:@"<%@: %p>", v45, v43];

      *(_DWORD *)buf = 138412290;
      id v93 = v40;
      _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_ERROR, "Focus item %@ does not provide a parentFocusEnvironment.  This will become an assert in a future version.", buf, 0xCu);
    }

LABEL_29:
  }
LABEL_3:
  if (!_UIFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
    || !_UIFocusItemIsViewOrRespondsToSelector(v5))
  {
LABEL_11:
    if (os_variant_has_internal_diagnostics())
    {
      v27 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        goto LABEL_15;
      }
      v28 = [v5 debugDescription];
      v29 = [v5 parentFocusEnvironment];
      v30 = [v29 debugDescription];
      v31 = [v5 parentFocusEnvironment];
      v32 = [v31 focusItemContainer];
      v33 = [v32 debugDescription];
      *(_DWORD *)buf = 138412802;
      id v93 = v28;
      __int16 v94 = 2112;
      v95 = v30;
      __int16 v96 = 2112;
      v97 = v33;
      _os_log_fault_impl(&dword_1853B0000, v27, OS_LOG_TYPE_FAULT, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);
    }
    else
    {
      v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260558) + 8);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        v22 = 0;
        goto LABEL_17;
      }
      v27 = v26;
      v28 = [v5 debugDescription];
      v29 = [v5 parentFocusEnvironment];
      v30 = [v29 debugDescription];
      v31 = [v5 parentFocusEnvironment];
      v32 = [v31 focusItemContainer];
      v33 = [v32 debugDescription];
      *(_DWORD *)buf = 138412802;
      id v93 = v28;
      __int16 v94 = 2112;
      v95 = v30;
      __int16 v96 = 2112;
      v97 = v33;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);
    }

LABEL_15:
    goto LABEL_16;
  }
  v7 = [v6 focusItemContainer];
  uint64_t v8 = v7;
  if (!v7)
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      v47 = NSString;
      id v48 = v5;
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      v51 = [v47 stringWithFormat:@"<%@: %p>", v50, v48];

      id v52 = v6;
      if (v6)
      {
        v53 = NSString;
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        v56 = [v53 stringWithFormat:@"<%@: %p>", v55, v52];
      }
      else
      {
        v56 = @"(nil)";
      }

      [v46 handleFailureInMethod:a2, self, @"_UIFocusItemInfo.m", 195, @"Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items.", v51, v56 object file lineNumber description];
      goto LABEL_47;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v46 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        goto LABEL_47;
      }
      v79 = NSString;
      id v80 = v5;
      v81 = (objc_class *)objc_opt_class();
      v82 = NSStringFromClass(v81);
      v83 = [v79 stringWithFormat:@"<%@: %p>", v82, v80];

      id v62 = v83;
      id v84 = v6;
      if (v6)
      {
        v89 = NSString;
        v90 = (objc_class *)objc_opt_class();
        v91 = NSStringFromClass(v90);
        v67 = [v89 stringWithFormat:@"<%@: %p>", v91, v84];
      }
      else
      {
        v67 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      id v93 = v62;
      __int16 v94 = 2112;
      v95 = v67;
      _os_log_fault_impl(&dword_1853B0000, v46, OS_LOG_TYPE_FAULT, "Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items.  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      v46 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260548) + 8);
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_47:

        goto LABEL_7;
      }
      v57 = NSString;
      id v58 = v5;
      v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      v61 = [v57 stringWithFormat:@"<%@: %p>", v60, v58];

      id v62 = v61;
      id v63 = v6;
      if (v6)
      {
        v64 = NSString;
        v65 = (objc_class *)objc_opt_class();
        v66 = NSStringFromClass(v65);
        v67 = [v64 stringWithFormat:@"<%@: %p>", v66, v63];
      }
      else
      {
        v67 = @"(nil)";
      }

      *(_DWORD *)buf = 138412546;
      id v93 = v62;
      __int16 v94 = 2112;
      v95 = v67;
      _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items.  This will become an assert in a future version.", buf, 0x16u);
    }

    goto LABEL_47;
  }
  char v9 = [v7 coordinateSpace];
  double v10 = _UIFocusItemFrameInCoordinateSpace(v5, v9);
  _UIFocusRectWithMinimumSize(v10, v11, v12, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v100.origin.x = v15;
  v100.origin.y = v17;
  v100.size.width = v19;
  v100.size.height = v21;
  if (CGRectIsNull(v100))
  {
LABEL_7:

    goto LABEL_11;
  }
  v23 = +[UIFocusSystem focusSystemForEnvironment:v5];
  if (!v23)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v71 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
        goto LABEL_41;
      }
      v85 = NSString;
      id v86 = v5;
      v87 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v87);
      v74 = [v85 stringWithFormat:@"<%@: %p>", v88, v86];

      *(_DWORD *)buf = 138412290;
      id v93 = v74;
      _os_log_fault_impl(&dword_1853B0000, v71, OS_LOG_TYPE_FAULT, "Unable to find focus system for item %@", buf, 0xCu);
    }
    else
    {
      v68 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260550) + 8);
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      v69 = NSString;
      id v70 = v5;
      v71 = v68;
      v72 = (objc_class *)objc_opt_class();
      v73 = NSStringFromClass(v72);
      v74 = [v69 stringWithFormat:@"<%@: %p>", v73, v70];

      *(_DWORD *)buf = 138412290;
      id v93 = v74;
      _os_log_impl(&dword_1853B0000, v71, OS_LOG_TYPE_ERROR, "Unable to find focus system for item %@", buf, 0xCu);
    }

LABEL_41:
  }
LABEL_10:
  v24 = [_UIFocusItemRegion alloc];
  v25 = [v8 coordinateSpace];
  v22 = -[_UIFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v24, "initWithFrame:coordinateSpace:item:focusSystem:", v25, v5, v23, v15, v17, v19, v21);

  if (!v22) {
    goto LABEL_11;
  }
LABEL_17:

LABEL_18:
  return v22;
}

- (CGRect)focusedRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIFocusItemInfo *)self focusedRegion];
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    +[_UIFocusRegionEvaluator frameForRegion:v5 inCoordinateSpace:v4];
    _UIFocusRectWithMinimumSize(v7, v8, v9, v10);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)invalidateFocusedRegion
{
  focusedRegion = self->_focusedRegion;
  self->_focusedRegion = 0;

  *(unsigned char *)&self->_flags &= ~4u;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; item = %@, focusedRegion = %@>",
    v4,
    self,
    WeakRetained,
  uint64_t v6 = self->_focusedRegion);

  return v6;
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = objc_loadWeakRetained((id *)&self->_item);
  if (v5)
  {
    uint64_t v6 = NSString;
    CGFloat v7 = (objc_class *)objc_opt_class();
    CGFloat v8 = NSStringFromClass(v7);
    CGFloat v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    CGFloat v9 = @"(nil)";
  }

  focusedRegion = self->_focusedRegion;
  if (focusedRegion)
  {
    double v11 = NSString;
    double v12 = focusedRegion;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    double v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];
  }
  else
  {
    double v15 = @"(nil)";
  }
  double v16 = [v3 stringWithFormat:@"<%@: %p item = %@, focusedRegion = %@>", v4, self, v9, v15];;

  return v16;
}

- (UIFocusItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (UIFocusItem *)WeakRetained;
}

- (UIView)containingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingView);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_ancestorEnvironmentScrollableContainers, 0);
}

@end