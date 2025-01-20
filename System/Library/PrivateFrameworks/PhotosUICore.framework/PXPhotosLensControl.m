@interface PXPhotosLensControl
- (BOOL)hideSymbols;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)enabledItems;
- (NSArray)items;
- (NSString)backdropGroupName;
- (PXPhotosLensControl)init;
- (PXPhotosLensControlDelegate)delegate;
- (PXPhotosLensControlItem)selectedItem;
- (UIColor)contentBackgroundColor;
- (UIColor)defaultTextColor;
- (int64_t)shrinkLevel;
- (void)_handleSegmentedControlAction:(id)a3;
- (void)_invalidateSegmentedControl;
- (void)_invalidateSegments;
- (void)_updateSegmentedControl;
- (void)_updateSegments;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setDefaultTextColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledItems:(id)a3;
- (void)setHideSymbols:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setShrinkLevel:(int64_t)a3;
@end

@implementation PXPhotosLensControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_enabledItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (int64_t)shrinkLevel
{
  return self->_shrinkLevel;
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (BOOL)hideSymbols
{
  return self->_hideSymbols;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosLensControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosLensControlDelegate *)WeakRetained;
}

- (PXPhotosLensControlItem)selectedItem
{
  return self->_selectedItem;
}

- (NSArray)enabledItems
{
  return self->_enabledItems;
}

- (NSArray)items
{
  return self->_items;
}

- (void)_handleSegmentedControlAction:(id)a3
{
  v4 = [(PXPhotosLensControl *)self items];
  objc_msgSend(v4, "objectAtIndexedSubscript:", -[_PXPhotosLensSegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(PXPhotosLensControl *)self selectedItem];
  if (v10 == v5)
  {
  }
  else
  {
    int v6 = [v10 isEqual:v5];

    if (!v6)
    {
      [(PXPhotosLensControl *)self setSelectedItem:v10];
      goto LABEL_8;
    }
  }
  if ([(_PXPhotosLensSegmentedControl *)self->_segmentedControl lastTouchRemainedOnSelectedSegment])
  {
    v7 = [(PXPhotosLensControl *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(PXPhotosLensControl *)self delegate];
      [v9 photosLensControl:self didTapOnAlreadySelectedItem:v10];
    }
  }
LABEL_8:
}

- (void)_updateSegmentedControl
{
  v43[2] = *MEMORY[0x1E4F143B8];
  switch([(PXPhotosLensControl *)self shrinkLevel])
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v4 = (id *)MEMORY[0x1E4FB2948];
      goto LABEL_3;
    case 4:
      v4 = (id *)MEMORY[0x1E4FB28F0];
LABEL_3:
      id v5 = *v4;
      double v6 = -1.0;
      break;
    default:
      id v5 = (id)*MEMORY[0x1E4FB28F0];
      double v6 = 13.0 - (double)v2;
      break;
  }
  v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", v5, *MEMORY[0x1E4FB27B8], 2, v5);
  char v8 = v7;
  if (v6 > 0.0)
  {
    uint64_t v9 = [v7 fontWithSize:v6];

    char v8 = (void *)v9;
  }
  id v10 = [(PXPhotosLensControl *)self defaultTextColor];
  uint64_t v11 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v12 = [v10 colorWithAlphaComponent:0.3];
  segmentedControl = self->_segmentedControl;
  uint64_t v15 = *MEMORY[0x1E4FB0700];
  v42[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v14 = v42[0];
  v42[1] = v15;
  v43[0] = v8;
  v43[1] = v10;
  v31 = v10;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  [(_PXPhotosLensSegmentedControl *)segmentedControl setTitleTextAttributes:v16 forState:0];

  v17 = self->_segmentedControl;
  v40[0] = v14;
  v40[1] = v15;
  v41[0] = v8;
  v41[1] = v11;
  v32 = (void *)v11;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [(_PXPhotosLensSegmentedControl *)v17 setTitleTextAttributes:v18 forState:4];

  v19 = self->_segmentedControl;
  v38[0] = v14;
  v38[1] = v15;
  v39[0] = v8;
  v39[1] = v12;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  [(_PXPhotosLensSegmentedControl *)v19 setTitleTextAttributes:v20 forState:2];

  v21 = [MEMORY[0x1E4FB14C8] effectWithStyle:1202];
  [(UIVisualEffectView *)self->_backgroundEffectView setEffect:v21];

  v22 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v23 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v23 setBackgroundColor:v22];

  *(_OWORD *)&self->_padding.top = xmmword_1AB35A050;
  *(_OWORD *)&self->_padding.bottom = xmmword_1AB35A050;
  self->_minimumInterTextSpacing = 16.0;
  self->_intrinsicSize = (CGSize)*MEMORY[0x1E4F1DB30];
  LOBYTE(v23) = [(PXPhotosLensControl *)self hideSymbols];
  v24 = [(PXPhotosLensControl *)self items];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __46__PXPhotosLensControl__updateSegmentedControl__block_invoke;
  v33[3] = &unk_1E5DC8C70;
  char v37 = (char)v23;
  id v25 = v30;
  id v34 = v25;
  v35 = self;
  id v26 = v8;
  id v36 = v26;
  [v24 enumerateObjectsUsingBlock:v33];
  double height = self->_intrinsicSize.height;
  self->_intrinsicSize.width = self->_intrinsicSize.width
                             + self->_padding.left
                             + self->_padding.right
                             - self->_minimumInterTextSpacing;
  self->_intrinsicSize.double height = fmax(height + self->_padding.top + self->_padding.bottom, 44.0);
  v28 = [(PXPhotosLensControl *)self selectedItem];
  unint64_t v29 = [v24 indexOfObject:v28];

  if ((v29 & 0x8000000000000000) != 0
    || v29 >= [(_PXPhotosLensSegmentedControl *)self->_segmentedControl numberOfSegments])
  {
    PXAssertGetLog();
  }
  [(_PXPhotosLensSegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:v29];
}

void __46__PXPhotosLensControl__updateSegmentedControl__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = v5;
  if (*(unsigned char *)(a1 + 56)
    || ([v5 symbolName], uint64_t v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    v7 = [v6 title];
    [*(id *)(*(void *)(a1 + 40) + 488) setTitle:v7 forSegmentAtIndex:a3];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v25 = *MEMORY[0x1E4FB06F8];
    v26[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v7 sizeWithAttributes:v9];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    v7 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*(void *)(a1 + 32) scale:2];
    uint64_t v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = [v6 symbolName];
    v17 = [v15 systemImageNamed:v16];
    v18 = [v17 imageWithSymbolConfiguration:v7];

    [*(id *)(*(void *)(a1 + 40) + 488) setImage:v18 forSegmentAtIndex:a3];
    [v18 size];
    double v11 = v19;
    double v13 = v20;
  }
  double v21 = ceil(v11);
  uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 448) + 16 * a3;
  *(double *)uint64_t v22 = v21;
  *(double *)(v22 + 8) = v13;
  *(double *)(*(void *)(a1 + 40) + 464) = v21
                                            + *(double *)(*(void *)(a1 + 40) + 456)
                                            + *(double *)(*(void *)(a1 + 40) + 464);
  double v23 = *(double *)(*(void *)(a1 + 40) + 472);
  double v24 = ceil(v13);
  if (v23 < v24) {
    double v23 = v24;
  }
  *(double *)(*(void *)(a1 + 40) + 472) = v23;
}

- (void)_invalidateSegmentedControl
{
}

- (void)_updateSegments
{
  [(_PXPhotosLensSegmentedControl *)self->_segmentedControl removeAllSegments];
  if ([(NSArray *)self->_items count])
  {
    unint64_t v3 = 0;
    do
      [(_PXPhotosLensSegmentedControl *)self->_segmentedControl insertSegmentWithTitle:&stru_1F00B0030 atIndex:v3++ animated:0];
    while (v3 < [(NSArray *)self->_items count]);
  }
  [(PXPhotosLensControl *)self _invalidateSegmentedControl];
}

- (void)_invalidateSegments
{
}

- (void)setDefaultTextColor:(id)a3
{
  uint64_t v8 = (UIColor *)a3;
  id v5 = self->_defaultTextColor;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_defaultTextColor, a3);
      [(PXPhotosLensControl *)self _invalidateSegmentedControl];
    }
  }
}

- (void)setHideSymbols:(BOOL)a3
{
  if (self->_hideSymbols != a3)
  {
    self->_hideSymbols = a3;
    [(PXPhotosLensControl *)self _invalidateSegmentedControl];
  }
}

- (void)setSelectedItem:(id)a3
{
  double v13 = (PXPhotosLensControlItem *)a3;
  double v6 = self->_selectedItem;
  if (v6 == v13)
  {
  }
  else
  {
    char v7 = v6;
    char v8 = [(PXPhotosLensControlItem *)v6 isEqual:v13];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(PXPhotosLensControl *)self items];
      char v10 = [v9 containsObject:v13];

      if ((v10 & 1) == 0)
      {
        double v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"PXPhotosLensControl.m", 186, @"Invalid parameter not satisfying: %@", @"[self.items containsObject:selectedItem]" object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_selectedItem, a3);
      double v11 = [(PXPhotosLensControl *)self delegate];
      [v11 photosLensControl:self didSelectItem:v13];

      [(PXPhotosLensControl *)self _invalidateSegmentedControl];
    }
  }
}

- (void)setEnabledItems:(id)a3
{
  char v8 = (NSArray *)a3;
  v4 = self->_enabledItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSArray *)[(NSArray *)v8 copy];
      enabledItems = self->_enabledItems;
      self->_enabledItems = v6;

      [(PXPhotosLensControl *)self _invalidateSegmentedControl];
    }
  }
}

- (void)setItems:(id)a3
{
  uint64_t v9 = (NSArray *)a3;
  v4 = self->_items;
  if (v4 == v9)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v9];

    if ((v5 & 1) == 0)
    {
      unint64_t v6 = [(NSArray *)v9 count];
      if (v6 > [(NSArray *)self->_items count]) {
        self->_textSizes = (CGSize *)malloc_type_realloc(self->_textSizes, 16 * [(NSArray *)v9 count], 0x1000040451B5BE8uLL);
      }
      char v7 = (NSArray *)[(NSArray *)v9 copy];
      items = self->_items;
      self->_items = v7;

      [(PXPhotosLensControl *)self _invalidateSegments];
      [(PXPhotosLensControl *)self _invalidateSegmentedControl];
    }
  }
}

- (void)setShrinkLevel:(int64_t)a3
{
  if (self->_shrinkLevel != a3)
  {
    self->_shrinkLevel = a3;
    [(PXPhotosLensControl *)self _updateSegmentedControl];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosLensControl;
  [(PXPhotosLensControl *)&v13 layoutSubviews];
  [(PXUpdater *)self->_updater updateIfNeeded];
  [(PXPhotosLensControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  for (uint64_t i = 0; ; ++i)
  {
    [(PXPhotosLensControl *)self setShrinkLevel:i];
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PXUpdater *)self->_updater updateIfNeeded];
  double v6 = self->_intrinsicSize.width;
  CGFloat height = self->_intrinsicSize.height;
  double v7 = [(PXPhotosLensControl *)self items];
  unint64_t v8 = [v7 count];

  if (width > self->_intrinsicSize.width && v8 >= 2)
  {
    double minimumInterTextSpacing = self->_minimumInterTextSpacing;
    if (width >= v6 + (double)(v8 - 1) * minimumInterTextSpacing) {
      double v6 = v6 + (double)(v8 - 1) * minimumInterTextSpacing;
    }
    else {
      double v6 = width;
    }
  }
  double v11 = v6;
  double v12 = height;
  result.CGFloat height = v12;
  result.double width = v11;
  return result;
}

- (UIColor)contentBackgroundColor
{
  uint64_t v2 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  double v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setContentBackgroundColor:(id)a3
{
  backgroundEffectView = self->_backgroundEffectView;
  id v4 = a3;
  id v5 = [(UIVisualEffectView *)backgroundEffectView contentView];
  [v5 setBackgroundColor:v4];
}

- (NSString)backdropGroupName
{
  return (NSString *)[(UIVisualEffectView *)self->_backgroundEffectView _groupName];
}

- (void)setBackdropGroupName:(id)a3
{
  id v4 = (id)[a3 copy];
  [(UIVisualEffectView *)self->_backgroundEffectView _setGroupName:v4];
}

- (void)dealloc
{
  free(self->_textSizes);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLensControl;
  [(PXPhotosLensControl *)&v3 dealloc];
}

- (PXPhotosLensControl)init
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosLensControl;
  uint64_t v2 = -[PXPhotosLensControl initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    objc_super v3 = [[PXConcretePhotosLensControlItem alloc] initWithIdentifier:@"placeholder" title:&stru_1F00B0030 symbolName:0];
    v22[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    items = v2->_items;
    v2->_items = (NSArray *)v4;

    objc_storeStrong((id *)&v2->_enabledItems, v2->_items);
    uint64_t v6 = [(NSArray *)v2->_items firstObject];
    selectedItem = v2->_selectedItem;
    v2->_selectedItem = (PXPhotosLensControlItem *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1F00]);
    double v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:1202];
    uint64_t v10 = [v8 initWithEffect:v9];
    backgroundEffectView = v2->_backgroundEffectView;
    v2->_backgroundEffectView = (UIVisualEffectView *)v10;

    [(PXPhotosLensControl *)v2 addSubview:v2->_backgroundEffectView];
    v2->_textSizes = (CGSize *)malloc_type_calloc([(NSArray *)v2->_items count], 0x10uLL, 0x1000040451B5BE8uLL);
    uint64_t v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    defaultTextColor = v2->_defaultTextColor;
    v2->_defaultTextColor = (UIColor *)v12;

    CGRect v14 = objc_alloc_init(_PXPhotosLensSegmentedControl);
    segmentedControl = v2->_segmentedControl;
    v2->_segmentedControl = v14;

    [(_PXPhotosLensSegmentedControl *)v2->_segmentedControl addTarget:v2 action:sel__handleSegmentedControlAction_ forControlEvents:0x2000];
    [(PXPhotosLensControl *)v2 _updateSegments];
    [(PXPhotosLensControl *)v2 addSubview:v2->_segmentedControl];
    uint64_t v16 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v2 needsUpdateSelector:sel_setNeedsLayout];
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v16;

    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateSegments needsUpdate:1];
    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateSegmentedControl needsUpdate:1];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__handleContentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    double v19 = [(PXPhotosLensControl *)v2 layer];
    [v19 setAllowsGroupOpacity:0];
  }
  return v2;
}

@end