@interface _UISlotView
+ (BOOL)accessInstanceVariablesDirectly;
+ (id)_sharedLayerContext;
- (CGSize)intrinsicContentSize;
- (_UISlotView)init;
- (_UISlotViewContentDelegate)_contentDelegate;
- (id)_slotAnyContentProvider;
- (id)_slotStyle;
- (id)_slotStyleResolver;
- (void)_overlayView:(id)a3 centerInView:(id)a4;
- (void)_setContentDelegate:(id)a3;
- (void)_setSlotAnyContentProvider:(id)a3;
- (void)_setSlotStyleResolver:(id)a3;
- (void)_slotStyleDidChange;
- (void)_updateContent;
- (void)dealloc;
- (void)displayLayer:(id)a3;
@end

@implementation _UISlotView

- (_UISlotView)init
{
  v14.receiver = self;
  v14.super_class = (Class)_UISlotView;
  v2 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = _UIKitBundle();
    v4 = [v3 preferredLocalizations];
    uint64_t v5 = [v4 firstObject];
    localization = v2->_localization;
    v2->_localization = (NSString *)v5;

    id slotStyleResolver = v2->_slotStyleResolver;
    v2->_id slotStyleResolver = &__block_literal_global_544;

    id slotAnyContentProvider = v2->_slotAnyContentProvider;
    v2->_id slotAnyContentProvider = 0;

    uint64_t v9 = -[_UISlotView _slotStyle](v2);
    currentSlotStyle = v2->_currentSlotStyle;
    v2->_currentSlotStyle = (UISSlotStyle *)v9;

    v2->_intrinsicContentSize = (CGSize)*MEMORY[0x1E4F1DB30];
    slotContent = v2->_slotContent;
    v2->_slotContent = 0;

    v2->_currentGeneration = 0;
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel__slotStyleDidChange_ name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];
  }
  return v2;
}

- (id)_slotStyle
{
  v1 = [a1 traitCollection];
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = -1;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = -1;
  uint64_t v74 = 0;
  v75 = (double *)&v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = -1;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = -1;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__200;
  v64 = __Block_byref_object_dispose__200;
  v65 = @"_UICTContentSizeCategoryUnspecified";
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = -1;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v42 = __25___UISlotView__slotStyle__block_invoke;
  v43 = &unk_1E53098B8;
  v44 = &v82;
  v45 = &v78;
  v46 = &v74;
  v47 = &v70;
  v48 = &v66;
  v49 = &v60;
  v50 = &v56;
  v51 = &v52;
  v28 = v1;
  __25___UISlotView__slotStyle__block_invoke(v41, v1);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v31 = __25___UISlotView__slotStyle__block_invoke_2;
  v32 = &unk_1E53098E0;
  v33 = &v82;
  v34 = &v78;
  v35 = &v74;
  v36 = &v70;
  v37 = &v66;
  v38 = &v60;
  v39 = &v56;
  v40 = &v52;
  if (__25___UISlotView__slotStyle__block_invoke_2(v30))
  {
    v2 = [a1 window];
    v3 = v2;
    if (v2)
    {
      v4 = [v2 traitCollection];
      v42(v41, v4);
    }
    if (((unsigned int (*)(void *))v31)(v30))
    {
      uint64_t v5 = [v3 windowScene];
      v6 = v5;
      if (v5)
      {
        v7 = [v5 traitCollection];
        v42(v41, v7);
      }
      if (((unsigned int (*)(void *))v31)(v30))
      {
        v8 = [v6 screen];
        uint64_t v9 = v8;
        if (v8)
        {
          v10 = [v8 traitCollection];
          v42(v41, v10);
        }
        if (((unsigned int (*)(void *))v31)(v30))
        {
          v11 = +[UIScreen mainScreen];
          v12 = v11;
          if (v11 && v11 != v9)
          {
            v13 = [v11 traitCollection];
            v42(v41, v13);
          }
        }
      }
    }
  }
  v27 = (void *)MEMORY[0x1E4FB3490];
  BOOL v26 = _AXSButtonShapesEnabled() != 0;
  unint64_t v14 = _UISSlotAccessibilityContrastFromAccessibilityContrast(v83[3]);
  uint64_t v15 = _UISSlotDisplayRangeFromDisplayGamut(v79[3]);
  uint64_t v16 = _UISSlotDisplayScaleFromDisplayScale(v75[3]);
  unint64_t v17 = _UISSlotLayoutDirectionFromTraitEnvironmentLayoutDirection(v71[3]);
  unint64_t v18 = _UISSlotLegibilityWeightFromLegibilityWeight(v67[3]);
  uint64_t v19 = a1[51];
  uint64_t v20 = _UISSlotContentSizeCategoryFromContentSizeCategory((void *)v61[5]);
  id v21 = [a1 tintColor];
  uint64_t v22 = [v21 CGColor];
  uint64_t v23 = _UISSlotUserInterfaceIdiomFromUserInterfaceIdiom(v57[3]);
  v24 = [v27 slotStyleWithAccessibilityButtonShapes:v26 accessibilityContrast:v14 displayRange:v15 displayScale:v16 layoutDirection:v17 legibilityWeight:v18 localization:v19 preferredContentSizeCategory:v20 tintColor:v22 userInterfaceIdiom:v23 userInterfaceStyle:_UISSlotUserInterfaceStyleFromUserInterfaceStyle(v53[3])];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  return v24;
}

- (void)dealloc
{
  slotContent = self->_slotContent;
  v4 = +[_UISlotView _sharedLayerContext]();
  [(UISSlotAnyContent *)slotContent deleteFromLayerContext:v4];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIAccessibilityButtonShapesEnabledStatusDidChangeNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)_UISlotView;
  [(UIView *)&v6 dealloc];
}

+ (id)_sharedLayerContext
{
  self;
  if (_MergedGlobals_5_14 != -1) {
    dispatch_once(&_MergedGlobals_5_14, &__block_literal_global_20_5);
  }
  v0 = (void *)qword_1EB25CA88;
  return v0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)displayLayer:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F3A3C0];
  id v5 = a3;
  [v5 setContentsGravity:v4];
  char v6 = objc_opt_respondsToSelector();
  double v7 = 1.0;
  if (v6) {
    double v7 = (double)[(UISSlotAnyContent *)self->_slotContent contentScale];
  }
  [v5 setContentsScale:v7];
  id v8 = [(UISSlotAnyContent *)self->_slotContent image];
  [v5 setContents:v8];
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_slotStyleDidChange
{
  if (!a1) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 416);
  v3 = -[_UISlotView _slotStyle]((void *)a1);
  uint64_t v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id v5 = *(id *)(a1 + 440);
  id v6 = v4;
  id v9 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {

LABEL_11:
      objc_storeStrong((id *)(a1 + 440), v4);
      [(id)a1 _updateContent];
      goto LABEL_12;
    }
    char v8 = [v5 isEqual:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (id)_slotAnyContentProvider
{
  uint64_t v2 = _Block_copy(self->_slotAnyContentProvider);
  return v2;
}

- (void)_setSlotAnyContentProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id slotAnyContentProvider = self->_slotAnyContentProvider;
  self->_id slotAnyContentProvider = v4;

  [(_UISlotView *)self _updateContent];
}

- (id)_slotStyleResolver
{
  uint64_t v2 = _Block_copy(self->_slotStyleResolver);
  return v2;
}

- (void)_setSlotStyleResolver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id slotStyleResolver = self->_slotStyleResolver;
  self->_id slotStyleResolver = v4;

  (*((void (**)(void))self->_slotStyleResolver + 2))();
  id v6 = (UISSlotStyle *)objc_claimAutoreleasedReturnValue();
  currentSlotStyle = self->_currentSlotStyle;
  self->_currentSlotStyle = v6;
}

- (_UISlotViewContentDelegate)_contentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentDelegate);
  return (_UISlotViewContentDelegate *)WeakRetained;
}

- (void)_setContentDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_contentDelegate, v4);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35___UISlotView__setContentDelegate___block_invoke;
    v8[3] = &unk_1E53097F0;
    objc_copyWeak(&v9, &location);
    [(_UISlotView *)self _setSlotStyleResolver:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35___UISlotView__setContentDelegate___block_invoke_2;
    v6[3] = &unk_1E5309890;
    objc_copyWeak(&v7, &location);
    [(_UISlotView *)self _setSlotAnyContentProvider:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_overlayView:(id)a3 centerInView:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIView *)self superview];

  if (v8 != v6)
  {
    [(UIView *)self setUserInteractionEnabled:0];
    [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:self];
    id v9 = (void *)MEMORY[0x1E4F5B268];
    v10 = [(UIView *)self centerXAnchor];
    v11 = [v7 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v17[0] = v12;
    v13 = [(UIView *)self centerYAnchor];
    unint64_t v14 = [v7 centerYAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    v17[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v9 activateConstraints:v16];
  }
}

- (void)_updateContent
{
  if (self->_slotAnyContentProvider)
  {
    objc_initWeak(&location, self);
    v3 = (void *)(self->_currentGeneration + 1);
    self->_currentGeneration = (unint64_t)v3;
    id slotAnyContentProvider = (void (**)(id, uint64_t, UISSlotStyle *, void *))self->_slotAnyContentProvider;
    id v5 = +[_UISlotView _sharedLayerContext]();
    uint64_t v6 = [v5 contextId];
    currentSlotStyle = self->_currentSlotStyle;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29___UISlotView__updateContent__block_invoke;
    v8[3] = &unk_1E5309908;
    objc_copyWeak(v9, &location);
    v9[1] = v3;
    slotAnyContentProvider[2](slotAnyContentProvider, v6, currentSlotStyle, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotContent, 0);
  objc_storeStrong((id *)&self->_currentSlotStyle, 0);
  objc_destroyWeak((id *)&self->_contentDelegate);
  objc_storeStrong(&self->_slotAnyContentProvider, 0);
  objc_storeStrong(&self->_slotStyleResolver, 0);
  objc_storeStrong((id *)&self->_localization, 0);
}

@end