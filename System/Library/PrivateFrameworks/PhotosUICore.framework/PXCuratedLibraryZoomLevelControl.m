@interface PXCuratedLibraryZoomLevelControl
+ (id)_allPotentialZoomLevelIdentifiers;
+ (id)_enabledZoomLevelIdentifiersForViewModel:(id)a3;
+ (id)_zoomLevelIdentifiersForViewModel:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)enabledZoomLevelIdentifiers;
- (NSArray)zoomLevelIdentifiers;
- (PXCuratedLibraryStyleGuide)styleGuide;
- (PXCuratedLibraryViewModel)viewModel;
- (PXCuratedLibraryZoomLevelControl)initWithCoder:(id)a3;
- (PXCuratedLibraryZoomLevelControl)initWithFrame:(CGRect)a3;
- (PXCuratedLibraryZoomLevelControl)initWithViewModel:(id)a3 styleGuide:(id)a4;
- (PXCuratedLibraryZoomLevelControlDelegate)delegate;
- (int64_t)selectedZoomLevel;
- (int64_t)shrinkLevel;
- (int64_t)zoomLevelDisplayedBeforeZoomLevel:(int64_t)a3;
- (void)_handleSegmentedControlAction:(id)a3;
- (void)_invalidateSegmentedControl;
- (void)_updateSegmentedControl;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setEnabledZoomLevelIdentifiers:(id)a3;
- (void)setSelectedZoomLevel:(int64_t)a3;
- (void)setShrinkLevel:(int64_t)a3;
@end

@implementation PXCuratedLibraryZoomLevelControl

uint64_t __70__PXCuratedLibraryZoomLevelControl__zoomLevelIdentifiersForViewModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v4 = *(void **)(a1 + 32);
  return [v4 isZoomLevelEnabled:v3];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXViewModelObservationContext_48254 == a5)
  {
    id v19 = v9;
    if ((a4 & 0x2004) == 0) {
      goto LABEL_14;
    }
    v10 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
    if ([v10 zoomLevelTransitionPhase])
    {
      v11 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
      uint64_t v12 = [v11 zoomLevelTransitionPhase];

      if (v12 != 2)
      {
LABEL_14:
        if ((a4 & 0x10000) != 0)
        {
          v14 = objc_opt_class();
          v15 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
          v16 = [v14 _enabledZoomLevelIdentifiersForViewModel:v15];
          [(PXCuratedLibraryZoomLevelControl *)self setEnabledZoomLevelIdentifiers:v16];
        }
        id v9 = v19;
        if ((a4 & 0x400000000) != 0) {
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    else
    {
    }
    v13 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
    -[PXCuratedLibraryZoomLevelControl setSelectedZoomLevel:](self, "setSelectedZoomLevel:", [v13 zoomLevel]);

    goto LABEL_14;
  }
  if ((void *)PXCuratedLibraryStyleGuideObservationContext != a5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryZoomLevelControl.m" lineNumber:332 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 4) != 0)
  {
LABEL_4:
    id v18 = v9;
    [(PXCuratedLibraryZoomLevelControl *)self _invalidateSegmentedControl];
    id v9 = v18;
  }
LABEL_5:
}

- (void)setEnabledZoomLevelIdentifiers:(id)a3
{
  v8 = (NSArray *)a3;
  v4 = self->_enabledZoomLevelIdentifiers;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      enabledZoomLevelIdentifiers = self->_enabledZoomLevelIdentifiers;
      self->_enabledZoomLevelIdentifiers = v6;

      [(PXCuratedLibraryZoomLevelControl *)self _invalidateSegmentedControl];
    }
  }
}

- (PXCuratedLibraryZoomLevelControl)initWithViewModel:(id)a3 styleGuide:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  id v9 = -[PXCuratedLibraryZoomLevelControl initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v11 = [MEMORY[0x1E4FB14C8] effectWithStyle:1202];
    uint64_t v12 = [v10 initWithEffect:v11];
    backgroundEffectView = v9->_backgroundEffectView;
    v9->_backgroundEffectView = (UIVisualEffectView *)v12;

    v14 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    v15 = [(UIVisualEffectView *)v9->_backgroundEffectView contentView];
    [v15 setBackgroundColor:v14];

    [(UIVisualEffectView *)v9->_backgroundEffectView _setGroupName:PXCuratedLibraryToolbarBackdropGroupName];
    [(PXCuratedLibraryZoomLevelControl *)v9 addSubview:v9->_backgroundEffectView];
    v16 = [(id)objc_opt_class() _allPotentialZoomLevelIdentifiers];
    v9->_textSizes = (CGSize *)malloc_type_calloc([v16 count], 0x10uLL, 0x1000040451B5BE8uLL);

    v9->_selectedZoomLevel = [v7 zoomLevel];
    uint64_t v17 = [(id)objc_opt_class() _zoomLevelIdentifiersForViewModel:v7];
    zoomLevelIdentifiers = v9->_zoomLevelIdentifiers;
    v9->_zoomLevelIdentifiers = (NSArray *)v17;

    uint64_t v19 = [(id)objc_opt_class() _enabledZoomLevelIdentifiersForViewModel:v7];
    enabledZoomLevelIdentifiers = v9->_enabledZoomLevelIdentifiers;
    v9->_enabledZoomLevelIdentifiers = (NSArray *)v19;

    v21 = objc_alloc_init(_PXCuratedLibraryZoomLevelSegmentedControl);
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v21;

    [(_PXCuratedLibraryZoomLevelSegmentedControl *)v9->_segmentedControl addTarget:v9 action:sel__handleSegmentedControlAction_ forControlEvents:0x2000];
    uint64_t v23 = [(NSArray *)v9->_zoomLevelIdentifiers count];
    if (v23 >= 1)
    {
      uint64_t v24 = v23;
      for (uint64_t i = 0; i != v24; ++i)
        [(_PXCuratedLibraryZoomLevelSegmentedControl *)v9->_segmentedControl insertSegmentWithTitle:&stru_1F00B0030 atIndex:i animated:0];
    }
    [(PXCuratedLibraryZoomLevelControl *)v9 addSubview:v9->_segmentedControl];
    objc_storeStrong((id *)&v9->_viewModel, a3);
    [(PXCuratedLibraryViewModel *)v9->_viewModel registerChangeObserver:v9 context:PXViewModelObservationContext_48254];
    objc_storeStrong((id *)&v9->_styleGuide, a4);
    [(PXCuratedLibraryStyleGuide *)v9->_styleGuide registerChangeObserver:v9 context:PXCuratedLibraryStyleGuideObservationContext];
    uint64_t v26 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v9 needsUpdateSelector:sel_setNeedsLayout];
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v26;

    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateSegmentedControl needsUpdate:1];
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v9 selector:sel__handleContentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    v29 = [(PXCuratedLibraryZoomLevelControl *)v9 layer];
    [v29 setAllowsGroupOpacity:0];
  }
  return v9;
}

+ (id)_enabledZoomLevelIdentifiersForViewModel:(id)a3
{
  id v4 = a3;
  char v5 = [v4 allowedActions];
  int v6 = [v5 containsObject:@"PXCuratedLibraryActionNavigateToYearsMonthsOrDays"];

  if (v6)
  {
    id v7 = [a1 _zoomLevelIdentifiersForViewModel:v4];
  }
  else
  {
    id v8 = [v4 configuration];

    int v9 = [v8 isZoomLevelEnabled:4];
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      id v10 = &unk_1F02D3820;
    }
    id v7 = v10;
    id v4 = v8;
  }

  return v7;
}

- (void)_updateSegmentedControl
{
  v49[2] = *MEMORY[0x1E4F143B8];
  switch([(PXCuratedLibraryZoomLevelControl *)self shrinkLevel])
  {
    case 0:
    case 1:
      id v4 = (id)*MEMORY[0x1E4FB2948];
      char v5 = 0;
      goto LABEL_7;
    case 2:
    case 3:
      int v6 = (id *)MEMORY[0x1E4FB2948];
      goto LABEL_6;
    case 4:
      int v6 = (id *)MEMORY[0x1E4FB28F0];
LABEL_6:
      id v4 = *v6;
      char v5 = 1;
LABEL_7:
      double v7 = -1.0;
      break;
    default:
      id v4 = (id)*MEMORY[0x1E4FB28F0];
      double v7 = 13.0 - (double)v2;
      char v5 = 1;
      break;
  }
  id v8 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
  int v9 = [v8 configuration];
  uint64_t v10 = [v9 secondaryToolbarStyle];

  if (v10 == 1) {
    char v11 = 1;
  }
  else {
    char v11 = v5;
  }
  char v38 = v11;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v4, *MEMORY[0x1E4FB27B8], 2);
  v13 = v12;
  v40 = v4;
  if (v7 > 0.0)
  {
    uint64_t v14 = [v12 fontWithSize:v7];

    v13 = (void *)v14;
  }
  v15 = [(PXCuratedLibraryZoomLevelControl *)self styleGuide];
  v16 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
  uint64_t v17 = objc_msgSend(v15, "zoomLevelControlTextColorOverLegibilityGradient:", objc_msgSend(v16, "secondaryToolbarLegibilityGradientIsVisible"));

  id v18 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  uint64_t v19 = [v17 colorWithAlphaComponent:0.3];
  segmentedControl = self->_segmentedControl;
  uint64_t v22 = *MEMORY[0x1E4FB0700];
  v48[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v21 = v48[0];
  v48[1] = v22;
  v49[0] = v13;
  v49[1] = v17;
  v39 = v17;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)segmentedControl setTitleTextAttributes:v23 forState:0];

  uint64_t v24 = self->_segmentedControl;
  v46[0] = v21;
  v46[1] = v22;
  v47[0] = v13;
  v47[1] = v18;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)v24 setTitleTextAttributes:v25 forState:4];

  uint64_t v26 = self->_segmentedControl;
  v44[0] = v21;
  v44[1] = v22;
  v45[0] = v13;
  v45[1] = v19;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)v26 setTitleTextAttributes:v27 forState:2];

  long long v28 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)&self->_padding.top = *MEMORY[0x1E4FB2848];
  *(_OWORD *)&self->_padding.bottom = v28;
  v29 = [(PXCuratedLibraryZoomLevelControl *)self styleGuide];
  [v29 lateralMargin];
  BOOL v31 = v30 < 20.0;
  double v32 = 14.0;
  if (!v31) {
    double v32 = 16.0;
  }
  self->_padding.right = v32;
  self->_padding.left = v32;

  self->_minimumInterTextSpacing = 16.0;
  self->_intrinsicSize = (CGSize)*MEMORY[0x1E4F1DB30];
  v33 = [(PXCuratedLibraryZoomLevelControl *)self zoomLevelIdentifiers];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__PXCuratedLibraryZoomLevelControl__updateSegmentedControl__block_invoke;
  v41[3] = &unk_1E5DB3DA0;
  char v43 = v38;
  v41[4] = self;
  id v34 = v13;
  id v42 = v34;
  [v33 enumerateObjectsUsingBlock:v41];
  double height = self->_intrinsicSize.height;
  self->_intrinsicSize.width = self->_intrinsicSize.width
                             + self->_padding.left
                             + self->_padding.right
                             - self->_minimumInterTextSpacing;
  self->_intrinsicSize.double height = height + self->_padding.top + self->_padding.bottom;
  v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXCuratedLibraryZoomLevelControl selectedZoomLevel](self, "selectedZoomLevel"));
  unint64_t v37 = [v33 indexOfObject:v36];

  if ((v37 & 0x8000000000000000) != 0
    || v37 >= [(_PXCuratedLibraryZoomLevelSegmentedControl *)self->_segmentedControl numberOfSegments])
  {
    PXAssertGetLog();
  }
  [(_PXCuratedLibraryZoomLevelSegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:v37];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  [(PXCuratedLibraryZoomLevelControl *)&v13 layoutSubviews];
  [(PXUpdater *)self->_updater updateIfNeeded];
  [(PXCuratedLibraryZoomLevelControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  for (uint64_t i = 0; ; ++i)
  {
    [(PXCuratedLibraryZoomLevelControl *)self setShrinkLevel:i];
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.double height = v10;
    if (CGRectGetWidth(v14) - self->_intrinsicSize.width >= 0.0 || i == 14)
    {
      -[UIVisualEffectView setBounds:](self->_backgroundEffectView, "setBounds:", v4, v6, v8, v10);
      PXRectGetCenter();
    }
  }
}

- (NSArray)zoomLevelIdentifiers
{
  return self->_zoomLevelIdentifiers;
}

- (void)setShrinkLevel:(int64_t)a3
{
  if (self->_shrinkLevel != a3)
  {
    self->_shrinkLevel = a3;
    [(PXCuratedLibraryZoomLevelControl *)self _updateSegmentedControl];
  }
}

- (NSArray)enabledZoomLevelIdentifiers
{
  return self->_enabledZoomLevelIdentifiers;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (int64_t)shrinkLevel
{
  return self->_shrinkLevel;
}

- (int64_t)selectedZoomLevel
{
  return self->_selectedZoomLevel;
}

+ (id)_zoomLevelIdentifiersForViewModel:(id)a3
{
  double v4 = [a3 configuration];
  [a1 _allPotentialZoomLevelIdentifiers];
  objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  PXFilter();
}

+ (id)_allPotentialZoomLevelIdentifiers
{
  return &unk_1F02D3808;
}

void __59__PXCuratedLibraryZoomLevelControl__updateSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = PXCuratedLibraryZoomLevelLocalizedTitle([a2 unsignedIntegerValue], *(unsigned __int8 *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 488) setTitle:v5 forSegmentAtIndex:a3];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v16[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v5 sizeWithAttributes:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = ceil(v9);
  objc_super v13 = (double *)(*(void *)(*(void *)(a1 + 32) + 448) + 16 * a3);
  double *v13 = v12;
  v13[1] = v11;
  *(double *)(*(void *)(a1 + 32) + 464) = v12
                                            + *(double *)(*(void *)(a1 + 32) + 456)
                                            + *(double *)(*(void *)(a1 + 32) + 464);
  double v14 = *(double *)(*(void *)(a1 + 32) + 472);
  if (v14 < v11) {
    double v14 = v11;
  }
  *(double *)(*(void *)(a1 + 32) + 472) = v14;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledZoomLevelIdentifiers, 0);
  objc_storeStrong((id *)&self->_zoomLevelIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (PXCuratedLibraryZoomLevelControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryZoomLevelControlDelegate *)WeakRetained;
}

- (void)_handleSegmentedControlAction:(id)a3
{
  double v4 = [(PXCuratedLibraryZoomLevelControl *)self zoomLevelIdentifiers];
  id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[_PXCuratedLibraryZoomLevelSegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));
  uint64_t v6 = [v5 integerValue];

  if (v6 == [(PXCuratedLibraryZoomLevelControl *)self selectedZoomLevel])
  {
    if ([(_PXCuratedLibraryZoomLevelSegmentedControl *)self->_segmentedControl lastTouchRemainedOnSelectedSegment])
    {
      double v7 = [(PXCuratedLibraryZoomLevelControl *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v10 = [(PXCuratedLibraryZoomLevelControl *)self delegate];
        [v10 zoomLevelControl:self didTapOnAlreadySelectedZoomLevel:v6];
      }
    }
  }
  else
  {
    double v9 = [(PXCuratedLibraryZoomLevelControl *)self viewModel];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PXCuratedLibraryZoomLevelControl__handleSegmentedControlAction___block_invoke;
    v11[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v11[4] = v6;
    [v9 performChanges:v11];
  }
}

uint64_t __66__PXCuratedLibraryZoomLevelControl__handleSegmentedControlAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:*(void *)(a1 + 32)];
}

- (void)_invalidateSegmentedControl
{
}

- (int64_t)zoomLevelDisplayedBeforeZoomLevel:(int64_t)a3
{
  double v4 = [(PXCuratedLibraryZoomLevelControl *)self zoomLevelIdentifiers];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 indexOfObject:v5];

  if ((unint64_t)(v6 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    int64_t v8 = 0;
  }
  else
  {
    double v7 = objc_msgSend(v4, "objectAtIndexedSubscript:");
    int64_t v8 = [v7 integerValue];
  }
  return v8;
}

- (void)setSelectedZoomLevel:(int64_t)a3
{
  if (self->_selectedZoomLevel != a3)
  {
    self->_selectedZoomLevel = a3;
    [(PXCuratedLibraryZoomLevelControl *)self _invalidateSegmentedControl];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(PXUpdater *)self->_updater updateIfNeeded];
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  free(self->_textSizes);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryZoomLevelControl;
  [(PXCuratedLibraryZoomLevelControl *)&v3 dealloc];
}

- (PXCuratedLibraryZoomLevelControl)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryZoomLevelControl.m", 67, @"%s is not available as initializer", "-[PXCuratedLibraryZoomLevelControl initWithFrame:]");

  abort();
}

- (PXCuratedLibraryZoomLevelControl)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryZoomLevelControl.m", 63, @"%s is not available as initializer", "-[PXCuratedLibraryZoomLevelControl initWithCoder:]");

  abort();
}

@end