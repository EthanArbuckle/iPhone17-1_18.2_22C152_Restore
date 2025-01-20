@interface _UIBarCustomizationItemReservoirView
- (BOOL)canBecomeFirstResponder;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSMutableArray)items;
- (UICollectionView)collectionView;
- (UILabel)noContentLabel;
- (UILabel)tipLabel;
- (UINavigationBar)topBar;
- (UIView)containerView;
- (_UIBarCustomizationItemReservoirView)initWithItems:(id)a3;
- (_UIDiffuseShadowView)shadowView;
- (_UIShapeView)arrowView;
- (double)_minimumLineSpacing;
- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)flowLayout;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_updateArrowColor;
- (void)_updateEmptyState;
- (void)addItem:(id)a3;
- (void)invalidateLayoutAndForceUpdate:(BOOL)a3;
- (void)layoutSubviews;
- (void)removeItem:(id)a3;
- (void)scrollViewDidChangeContentSize:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setArrowView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDoneAction:(id)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setItems:(id)a3;
- (void)setNoContentLabel:(id)a3;
- (void)setResetAction:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setTipLabel:(id)a3;
- (void)setTopBar:(id)a3;
- (void)sizeToFit;
@end

@implementation _UIBarCustomizationItemReservoirView

- (_UIBarCustomizationItemReservoirView)initWithItems:(id)a3
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)_UIBarCustomizationItemReservoirView;
  v5 = -[UIView initWithFrame:](&v77, sel_initWithFrame_, 0.0, 0.0, 340.0, 188.0);
  v6 = v5;
  if (v5)
  {
    v7 = [(UIView *)v5 layer];
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);

    v8 = objc_opt_new();
    objc_msgSend(v8, "moveToPoint:", 23.0, 0.0);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", 9.52847097, -5.83629763, 15.0, 0.0);
    objc_msgSend(v8, "addLineToPoint:", 2.05182339, -13.8113884);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", -2.05182339, -13.8113884, 0.0, -16.0);
    objc_msgSend(v8, "addLineToPoint:", -9.52847097, -5.83629763);
    objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", -23.0, 0.0, -15.0, 0.0);
    objc_msgSend(v8, "addLineToPoint:", -23.0, 1.0);
    objc_msgSend(v8, "addLineToPoint:", 23.0, 1.0);
    [v8 closePath];
    [v8 bounds];
    CGFloat v9 = -CGRectGetMinX(v80);
    [v8 bounds];
    CGFloat MinY = CGRectGetMinY(v81);
    CGAffineTransformMakeTranslation(&v78, v9, -MinY);
    [v8 applyTransform:&v78];
    v11 = [_UIShapeView alloc];
    [v8 bounds];
    double Width = CGRectGetWidth(v82);
    [v8 bounds];
    v13 = -[UIView initWithFrame:](v11, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v83) + -1.0);
    v14 = [(UIView *)v6 layer];
    [v14 anchorPoint];
    double v16 = v15;
    double v18 = v17;
    v19 = [(UIView *)v13 layer];
    objc_msgSend(v19, "setAnchorPoint:", v16, v18);

    id v20 = v8;
    uint64_t v21 = [v20 CGPath];
    v22 = [(_UIShapeView *)v13 shapeLayer];
    [v22 setPath:v21];

    [(UIView *)v6 addSubview:v13];
    [(_UIBarCustomizationItemReservoirView *)v6 setArrowView:v13];

    v23 = [UIView alloc];
    [(UIView *)v6 bounds];
    v24 = -[UIView initWithFrame:](v23, "initWithFrame:");
    v25 = [(UIView *)v6 layer];
    [v25 anchorPoint];
    double v27 = v26;
    double v29 = v28;
    v30 = [(UIView *)v24 layer];
    objc_msgSend(v30, "setAnchorPoint:", v27, v29);

    [(UIView *)v24 _setContinuousCornerRadius:13.0];
    [(UIView *)v24 setClipsToBounds:1];
    v31 = +[UIColor secondarySystemBackgroundColor];
    [(UIView *)v24 setBackgroundColor:v31];

    [(UIView *)v6 addSubview:v24];
    [(_UIBarCustomizationItemReservoirView *)v6 setContainerView:v24];

    [(_UIBarCustomizationItemReservoirView *)v6 _updateArrowColor];
    v32 = [_UIDiffuseShadowView alloc];
    v33 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    [v33 frame];
    v34 = -[_UIDiffuseShadowView initWithFrame:](v32, "initWithFrame:");

    v35 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    v36 = [v35 layer];
    [v36 anchorPoint];
    double v38 = v37;
    double v40 = v39;
    v41 = [(UIView *)v34 layer];
    objc_msgSend(v41, "setAnchorPoint:", v38, v40);

    [(_UIDiffuseShadowView *)v34 setIntensity:0.2];
    [(_UIDiffuseShadowView *)v34 setRadius:30.0];
    [(UIView *)v6 insertSubview:v34 atIndex:0];
    [(_UIBarCustomizationItemReservoirView *)v6 setShadowView:v34];

    v42 = objc_opt_new();
    v43 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    [v43 bounds];
    double v44 = CGRectGetWidth(v84);
    objc_msgSend(v42, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    objc_msgSend(v42, "setFrame:", 0.0, 0.0, v44, v45);

    v46 = objc_opt_new();
    v47 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    v48 = [v47 backgroundColor];
    [v46 setBackgroundColor:v48];

    [v42 setStandardAppearance:v46];
    v49 = [UINavigationItem alloc];
    v50 = _UILocalizedString(@"BAR_CUSTOMIZATION_POPOVER_TITLE", @"Title of bar customization popover.", @"Customize");
    v51 = [(UINavigationItem *)v49 initWithTitle:v50];

    [(UINavigationItem *)v51 _setManualScrollEdgeAppearanceEnabled:1];
    [v42 pushNavigationItem:v51 animated:0];
    v52 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    [v52 addSubview:v42];

    [(_UIBarCustomizationItemReservoirView *)v6 setTopBar:v42];
    v53 = objc_opt_new();
    objc_msgSend(v53, "setEstimatedItemSize:", 60.0, 60.0);
    [v53 setMinimumInteritemSpacing:20.0];
    [(_UIBarCustomizationItemReservoirView *)v6 _minimumLineSpacing];
    objc_msgSend(v53, "setMinimumLineSpacing:");
    objc_msgSend(v53, "setSectionInset:", 20.0, 20.0, 56.0, 20.0);
    v54 = [UICollectionView alloc];
    v55 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    [v55 bounds];
    v56 = -[UICollectionView initWithFrame:collectionViewLayout:](v54, "initWithFrame:collectionViewLayout:", v53);

    v57 = [(_UIBarCustomizationItemReservoirView *)v6 topBar];
    [v57 frame];
    -[UICollectionView setContentInset:](v56, "setContentInset:", CGRectGetMaxY(v85), 0.0, 0.0, 0.0);

    v58 = [(_UIBarCustomizationItemReservoirView *)v6 topBar];
    [v58 frame];
    -[UIScrollView setScrollIndicatorInsets:](v56, "setScrollIndicatorInsets:", CGRectGetMaxY(v86), 0.0, 8.0, 0.0);

    [(UICollectionView *)v56 setBackgroundColor:0];
    [(UICollectionView *)v56 setDataSource:v6];
    [(UICollectionView *)v56 setDelegate:v6];
    [(UICollectionView *)v56 setAllowsSelection:0];
    [(UICollectionView *)v56 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kCustomizationReservoirCellIdentifier"];
    -[UICollectionView _setVisibleRectEdgeInsets:](v56, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -150.0, 0.0);
    v59 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    v60 = [(_UIBarCustomizationItemReservoirView *)v6 topBar];
    [v59 insertSubview:v56 below:v60];

    [(_UIBarCustomizationItemReservoirView *)v6 setCollectionView:v56];
    v61 = objc_opt_new();
    v62 = +[UIColor secondaryLabelColor];
    [v61 setTextColor:v62];

    v63 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2"];
    [v61 setFont:v63];

    [v61 setAdjustsFontForContentSizeCategory:1];
    [v61 setNumberOfLines:0];
    [v61 setTextAlignment:1];
    v64 = _UILocalizedString(@"BAR_CUSTOMIZATION_POPOVER_HINT_TEXT", @"Instructional text displayed at top of bar customization popover.", @"Drag to add or remove items from the toolbar");
    [v61 setText:v64];

    v65 = [(_UIBarCustomizationItemReservoirView *)v6 collectionView];
    [v65 addSubview:v61];

    [(_UIBarCustomizationItemReservoirView *)v6 setTipLabel:v61];
    v66 = objc_opt_new();
    [v66 setAlpha:0.0];
    v67 = _UILocalizedString(@"BAR_CUSTOMIZATION_POPOVER_EMPTY_TEXT", @"Customization popover empty state text.", @"Drag to remove items");
    [v66 setText:v67];

    v68 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    [v66 setFont:v68];

    v69 = +[UIColor secondaryLabelColor];
    [v66 setTextColor:v69];

    [v66 setLineBreakMode:4];
    [v66 setAdjustsFontSizeToFitWidth:0];
    v70 = [(_UIBarCustomizationItemReservoirView *)v6 collectionView];
    [v70 addSubview:v66];

    [(_UIBarCustomizationItemReservoirView *)v6 setNoContentLabel:v66];
    v71 = [(_UIBarCustomizationItemReservoirView *)v6 containerView];
    [(UIView *)v6 addSubview:v71];

    [(_UIBarCustomizationItemReservoirView *)v6 setItems:v4];
    v72 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    id v73 = [(UIView *)v6 registerForTraitChanges:v72 withAction:sel__updateArrowColor];

    v79[0] = objc_opt_class();
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
    id v75 = [(UIView *)v6 registerForTraitChanges:v74 withHandler:&__block_literal_global_367];
  }
  return v6;
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E52D9FC0;
  aBlock[4] = self;
  BOOL v19 = a3;
  v7 = (void (**)(void))_Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_2;
  v16[3] = &unk_1E52D9FC0;
  BOOL v17 = v5;
  v16[4] = self;
  v8 = (void (**)(void))_Block_copy(v16);
  if (v4)
  {
    if (v5) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = 100000000;
    }
    if (v5) {
      double v10 = 0.8;
    }
    else {
      double v10 = 1.0;
    }
    if (v5) {
      double v11 = 0.4;
    }
    else {
      double v11 = 0.3;
    }
    dispatch_time_t v12 = dispatch_time(0, v9);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___UIBarCustomizationItemReservoirView_setExpanded_animated___block_invoke_3;
    block[3] = &unk_1E52DA040;
    double v15 = v7;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
    v13 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v10 response:v11];
    +[UIView _animateUsingSpringBehavior:v13 tracking:0 animations:v8 completion:0];
  }
  else
  {
    v7[2](v7);
    v8[2](v8);
  }
}

- (void)setResetAction:(id)a3
{
  id v4 = a3;
  v7 = [[UIBarButtonItem alloc] initWithPrimaryAction:v4];

  BOOL v5 = [(_UIBarCustomizationItemReservoirView *)self topBar];
  v6 = [v5 topItem];
  [v6 setLeftBarButtonItem:v7];
}

- (void)setDoneAction:(id)a3
{
  id v4 = a3;
  v7 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:0 primaryAction:v4];

  BOOL v5 = [(_UIBarCustomizationItemReservoirView *)self topBar];
  v6 = [v5 topItem];
  [v6 setRightBarButtonItem:v7];
}

- (void)setItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (NSMutableArray *)a3;
  if (self->_items != v5)
  {
    objc_storeStrong((id *)&self->_items, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = v5;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          dispatch_time_t v12 = [_UIBarCustomizationChiclet alloc];
          v13 = -[_UIBarCustomizationChiclet initWithItem:](v12, "initWithItem:", v11, (void)v15);
          [(_UIBarCustomizationChiclet *)v13 setChicletSize:1];
          [(_UIBarCustomizationChiclet *)v13 setPlatterVisible:1];
          [(_UIBarCustomizationChiclet *)v13 setLabelVisible:1];
          [(_UIBarCustomizationChiclet *)v13 sizeToFit];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    self->_computedInitialSize = 0;
    v14 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
    [v14 reloadData];

    [(_UIBarCustomizationItemReservoirView *)self invalidateLayoutAndForceUpdate:0];
    [(_UIBarCustomizationItemReservoirView *)self _updateEmptyState];
  }
}

- (void)addItem:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 _chiclet];
  [v5 setPlatterVisible:1];
  v6 = [v5 window];

  if (v6)
  {
    uint64_t v7 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48___UIBarCustomizationItemReservoirView_addItem___block_invoke;
    v14[3] = &unk_1E52D9F70;
    id v15 = v5;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v14 completion:0];
  }
  else
  {
    [v5 setLabelVisible:1];
  }
  uint64_t v8 = [(_UIBarCustomizationItemReservoirView *)self items];
  [v8 addObject:v4];

  uint64_t v9 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  double v10 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v11 = [(_UIBarCustomizationItemReservoirView *)self items];
  dispatch_time_t v12 = objc_msgSend(v10, "indexPathForItem:inSection:", objc_msgSend(v11, "count") - 1, 0);
  v16[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v9 insertItemsAtIndexPaths:v13];

  [(_UIBarCustomizationItemReservoirView *)self _updateEmptyState];
}

- (void)removeItem:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_UIBarCustomizationItemReservoirView *)self items];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(_UIBarCustomizationItemReservoirView *)self items];
    [v7 removeObjectAtIndex:v6];

    uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
    uint64_t v9 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
    double v10 = [v9 cellForItemAtIndexPath:v8];

    uint64_t v11 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
    v13[0] = v8;
    dispatch_time_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v11 deleteItemsAtIndexPaths:v12];

    [v10 setChiclet:0];
  }
  [(_UIBarCustomizationItemReservoirView *)self _updateEmptyState];
}

- (void)layoutSubviews
{
  v71.receiver = self;
  v71.super_class = (Class)_UIBarCustomizationItemReservoirView;
  [(UIView *)&v71 layoutSubviews];
  [(UIView *)self bounds];
  CGFloat x = v72.origin.x;
  CGFloat y = v72.origin.y;
  CGFloat width = v72.size.width;
  CGFloat height = v72.size.height;
  double MidX = CGRectGetMidX(v72);
  uint64_t v8 = [(_UIBarCustomizationItemReservoirView *)self arrowView];
  objc_msgSend(v8, "setCenter:", MidX, 0.0);

  uint64_t v9 = [(_UIBarCustomizationItemReservoirView *)self arrowView];
  [v9 frame];
  double MaxY = CGRectGetMaxY(v73);

  v74.origin.CGFloat x = x;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = width;
  v74.size.CGFloat height = height;
  double v11 = CGRectGetMidX(v74);
  dispatch_time_t v12 = [(_UIBarCustomizationItemReservoirView *)self containerView];
  objc_msgSend(v12, "setCenter:", v11, MaxY);

  v75.origin.CGFloat x = x;
  v75.origin.CGFloat y = y;
  v75.size.CGFloat width = width;
  v75.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v75);
  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = y;
  v76.size.CGFloat width = width;
  v76.size.CGFloat height = height;
  CGFloat v14 = CGRectGetHeight(v76) - MaxY;
  id v15 = [(_UIBarCustomizationItemReservoirView *)self containerView];
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, v13, v14);

  long long v16 = [(_UIBarCustomizationItemReservoirView *)self containerView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v77.origin.CGFloat x = v18;
  v77.origin.CGFloat y = v20;
  v77.size.CGFloat width = v22;
  v77.size.CGFloat height = v24;
  double v25 = CGRectGetWidth(v77);
  double v26 = [(_UIBarCustomizationItemReservoirView *)self topBar];
  objc_msgSend(v26, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v28 = v27;

  double v29 = [(_UIBarCustomizationItemReservoirView *)self topBar];
  CGFloat v63 = v28;
  CGFloat v64 = v25;
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v25, v28);

  v30 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  objc_msgSend(v30, "setFrame:", v18, v20, v22, v24);

  v31 = [(_UIBarCustomizationItemReservoirView *)self containerView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v40 = [(_UIBarCustomizationItemReservoirView *)self shadowView];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  v41 = [(_UIBarCustomizationItemReservoirView *)self tipLabel];
  v42 = [(_UIBarCustomizationItemReservoirView *)self noContentLabel];
  v78.origin.CGFloat x = v18;
  v78.origin.CGFloat y = v20;
  v78.size.CGFloat width = v22;
  v78.size.CGFloat height = v24;
  CGFloat v43 = CGRectGetWidth(v78) + -40.0;
  objc_msgSend(v41, "sizeThatFits:", v43, 0.0);
  double v45 = v44;
  double v47 = v46;
  objc_msgSend(v42, "sizeThatFits:", v43, 0.0);
  double v49 = v48;
  double v51 = v50;
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v45, v47);
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v49, v51);
  if (self->_isEmpty)
  {
    v79.origin.CGFloat x = 0.0;
    v79.origin.CGFloat y = 0.0;
    v79.size.CGFloat height = v63;
    v79.size.CGFloat width = v64;
    CGFloat v52 = CGRectGetHeight(v79);
    double v53 = v18 + 0.0 + v22 * 0.5;
    double v54 = v20 + v52 * 0.5 + (v24 - (v52 * 0.5 + 0.0)) * 0.5;
    v55 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
    [v55 contentInset];
    double v57 = v54 - v56;

    objc_msgSend(v41, "setCenter:", v53, v57);
    CGAffineTransformMakeScale(&v70, v49 / v45, v51 / v47);
    CGAffineTransform v69 = v70;
    [v41 setTransform:&v69];
    [v41 setAlpha:0.0];
    objc_msgSend(v42, "setCenter:", v53, v57);
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v68[0] = *MEMORY[0x1E4F1DAB8];
    v68[1] = v58;
    v68[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v59 = 1.0;
    v60 = (CGAffineTransform *)v68;
  }
  else
  {
    v80.origin.CGFloat x = v18;
    v80.origin.CGFloat y = v20;
    v80.size.CGFloat width = v22;
    v80.size.CGFloat height = v24;
    double v61 = CGRectGetMidX(v80);
    objc_msgSend(v41, "setCenter:", v61, v47 * 0.5 + 1.0);
    long long v62 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v67[0] = *MEMORY[0x1E4F1DAB8];
    v67[1] = v62;
    v67[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v41 setTransform:v67];
    [v41 setAlpha:1.0];
    objc_msgSend(v42, "setCenter:", v61, v47 * 0.5 + 1.0);
    CGAffineTransformMakeScale(&v66, v45 / v49, v47 / v51);
    CGAffineTransform v65 = v66;
    v60 = &v65;
    double v59 = 0.0;
  }
  [v42 setTransform:v60];
  [v42 setAlpha:v59];
}

- (void)sizeToFit
{
  v3 = [(_UIBarCustomizationItemReservoirView *)self items];
  double v4 = dbl_186B9ACB0[(unint64_t)[v3 count] > 0xB];

  BOOL v5 = [(_UIBarCustomizationItemReservoirView *)self arrowView];
  [v5 frame];
  double MaxY = CGRectGetMaxY(v21);
  uint64_t v7 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  [v7 contentInset];
  double v9 = MaxY + v8;
  double v10 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  [v10 contentSize];
  double v12 = v9 + v11;

  double v13 = fmax(v12, 188.0);
  CGFloat v14 = [(UIView *)self superview];
  id v19 = v14;
  if (v14)
  {
    [v14 bounds];
    double Width = CGRectGetWidth(v22);
    +[UIViewController _horizontalContentMarginForView:v19];
    double v17 = Width - (v16 + v16);
    if (v4 >= v17) {
      double v4 = v17;
    }
    [v19 bounds];
    double v18 = CGRectGetHeight(v23) * 0.6;
    if (v13 >= v18) {
      double v13 = v18;
    }
  }
  -[UIView setBounds:](self, "setBounds:", 0.0, 0.0, v4, v13);
}

- (void)invalidateLayoutAndForceUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  uint64_t v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];

  [(UIView *)self setNeedsLayout];
  if (v3) {
    [(UIView *)self layoutIfNeeded];
  }
  [(_UIBarCustomizationItemReservoirView *)self sizeToFit];
}

- (id)flowLayout
{
  v2 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  BOOL v3 = [v2 collectionViewLayout];

  return v3;
}

- (void)_updateArrowColor
{
  id v9 = [(_UIBarCustomizationItemReservoirView *)self containerView];
  BOOL v3 = [v9 backgroundColor];
  double v4 = [(UIView *)self traitCollection];
  id v5 = [v3 resolvedColorWithTraitCollection:v4];
  uint64_t v6 = [v5 CGColor];
  uint64_t v7 = [(_UIBarCustomizationItemReservoirView *)self arrowView];
  double v8 = [v7 shapeLayer];
  [v8 setFillColor:v6];
}

- (void)_updateEmptyState
{
  id v3 = [(_UIBarCustomizationItemReservoirView *)self items];
  self->_isEmptCGFloat y = [v3 count] == 0;
}

- (double)_minimumLineSpacing
{
  v2 = [(UIView *)self traitCollection];
  id v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2" compatibleWithTraitCollection:v2];

  [v3 lineHeight];
  double v5 = v4 + v4 + 10.0 + 14.0;

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIBarCustomizationItemReservoirView *)self collectionView];
  id v12 = [v5 collectionViewLayout];

  [v4 contentOffset];
  double v7 = v6;
  [v4 contentInset];
  double v9 = v8;

  double v10 = [(_UIBarCustomizationItemReservoirView *)self topBar];
  double v11 = [v10 topItem];
  objc_msgSend(v11, "_setManualScrollEdgeAppearanceProgress:", fmax(fmin((v7 + v9) / 10.0, 1.0), 0.0));
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  if (!self->_computedInitialSize)
  {
    self->_computedInitialSize = 1;
    [(_UIBarCustomizationItemReservoirView *)self sizeToFit];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(_UIBarCustomizationItemReservoirView *)self items];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"kCustomizationReservoirCellIdentifier" forIndexPath:v6];
  double v8 = [(_UIBarCustomizationItemReservoirView *)self items];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  double v10 = [v9 _chiclet];

  [v7 setChiclet:v10];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v11 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v13 = _UIInternalPreference_BarCustomizationDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_BarCustomizationDebugEnabled)
    {
      while (v11 >= v13)
      {
        _UIInternalPreferenceSync(v11, &_UIInternalPreference_BarCustomizationDebugEnabled, @"BarCustomizationDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v13 = _UIInternalPreference_BarCustomizationDebugEnabled;
        if (v11 == _UIInternalPreference_BarCustomizationDebugEnabled) {
          goto LABEL_4;
        }
      }
      if (byte_1E8FD4F84)
      {
        id v14 = +[UIColor redColor];
        uint64_t v15 = [v14 CGColor];
        double v16 = [v7 layer];
        [v16 setBorderColor:v15];

        double v17 = [v7 layer];
        [v17 setBorderWidth:1.0];
      }
    }
  }
LABEL_4:

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(_UIBarCustomizationItemReservoirView *)self items];
  uint64_t v8 = [v6 item];

  double v9 = [v7 objectAtIndexedSubscript:v8];
  double v10 = [v9 _chiclet];

  [v10 fittingSizeWithChicletSize:1];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a4;
  [a3 bounds];
  double Width = CGRectGetWidth(v21);
  [v7 sectionInset];
  double v10 = Width - v9;
  [v7 sectionInset];
  double v12 = v11;

  double v13 = [(_UIBarCustomizationItemReservoirView *)self tipLabel];
  objc_msgSend(v13, "sizeThatFits:", v10 - v12, 20.0);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  [a3 bounds];
  double Width = CGRectGetWidth(v34);
  [v7 sectionInset];
  double v10 = Width - v9;
  [v7 sectionInset];
  double v12 = v10 - v11;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v13 = [(_UIBarCustomizationItemReservoirView *)self items];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    double v17 = -20.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        double v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) _chiclet];
        [v19 bounds];
        double v20 = CGRectGetWidth(v35);

        if (v17 + 20.0 + v20 <= v12) {
          double v17 = v17 + v20 + 20.0;
        }
        else {
          double v17 = v20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v15);
  }
  else
  {
    double v17 = -20.0;
  }

  v30[0] = &unk_1ED3F54D8;
  v29[0] = @"UIFlowLayoutCommonRowHorizontalAlignmentKey";
  v29[1] = @"UIFlowLayoutLastRowHorizontalAlignmentKey";
  if (v17 <= v12 + -60.0) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 3;
  }
  CGRect v22 = [NSNumber numberWithInt:v21];
  v29[2] = @"UIFlowLayoutRowVerticalAlignmentKey";
  v30[1] = v22;
  v30[2] = &unk_1ED3F54F0;
  CGRect v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

  return v23;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (_UIShapeView)arrowView
{
  return self->_arrowView;
}

- (void)setArrowView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (_UIDiffuseShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UINavigationBar)topBar
{
  return self->_topBar;
}

- (void)setTopBar:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UILabel)tipLabel
{
  return self->_tipLabel;
}

- (void)setTipLabel:(id)a3
{
}

- (UILabel)noContentLabel
{
  return self->_noContentLabel;
}

- (void)setNoContentLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentLabel, 0);
  objc_storeStrong((id *)&self->_tipLabel, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end