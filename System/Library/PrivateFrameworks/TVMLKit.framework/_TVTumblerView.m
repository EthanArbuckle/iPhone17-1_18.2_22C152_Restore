@interface _TVTumblerView
- (BOOL)canMove;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)itemViewClass;
- (NSMutableDictionary)itemViewsByIndex;
- (UIImageView)arrowLeading;
- (UIImageView)arrowLeft;
- (UIImageView)arrowRight;
- (UIImageView)arrowTrailing;
- (UISwipeGestureRecognizer)leftSwipeGesture;
- (UISwipeGestureRecognizer)rightSwipeGesture;
- (UITapGestureRecognizer)leftTapGesture;
- (UITapGestureRecognizer)rightTapGesture;
- (UIView)containerView;
- (UIView)focusedItemView;
- (UIView)gestureTargetView;
- (UIView)headerView;
- (UIView)referredFocusedItemView;
- (UIView)spareItemView;
- (_TVTumblerView)initWithFrame:(CGRect)a3;
- (_TVTumblerViewDataSource)dataSource;
- (_TVTumblerViewDelegate)delegate;
- (double)interitemSpacing;
- (id)_itemViewAtIndex:(int64_t)a3;
- (id)dequeueReusableItemView;
- (int64_t)focusedItemIndex;
- (int64_t)unfocusedItemIndex;
- (void)_disableMove;
- (void)_enableMove;
- (void)_leftAction:(id)a3;
- (void)_markItemViewForInUse:(id)a3 forIndex:(int64_t)a4;
- (void)_markItemViewForReuse:(id)a3;
- (void)_rightAction:(id)a3;
- (void)_scheduleMoveToIndex:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)registerItemViewClass:(Class)a3;
- (void)reloadData;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusedItemIndex:(int64_t)a3;
- (void)setGestureTargetView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setItemViewClass:(Class)a3;
- (void)setReferredFocusedItemView:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSpareItemView:(id)a3;
- (void)setUnfocusedItemIndex:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _TVTumblerView

- (_TVTumblerView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)_TVTumblerView;
  v3 = -[_TVTumblerView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v5;

    [(UIView *)v3->_containerView setClipsToBounds:1];
    [(_TVTumblerView *)v3 addSubview:v3->_containerView];
    uint64_t v7 = [(_TVTumblerView *)v3 effectiveUserInterfaceLayoutDirection];
    if (v7 == 1) {
      v8 = sel__rightAction_;
    }
    else {
      v8 = sel__leftAction_;
    }
    if (v7 == 1) {
      v9 = sel__leftAction_;
    }
    else {
      v9 = sel__rightAction_;
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:v8];
    leftTapGesture = v3->_leftTapGesture;
    v3->_leftTapGesture = (UITapGestureRecognizer *)v10;

    [(UITapGestureRecognizer *)v3->_leftTapGesture setAllowedPressTypes:&unk_26E59EB00];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:v9];
    rightTapGesture = v3->_rightTapGesture;
    v3->_rightTapGesture = (UITapGestureRecognizer *)v12;

    [(UITapGestureRecognizer *)v3->_rightTapGesture setAllowedPressTypes:&unk_26E59EB18];
    uint64_t v14 = [objc_alloc(MEMORY[0x263F1CA00]) initWithTarget:v3 action:v8];
    leftSwipeGesture = v3->_leftSwipeGesture;
    v3->_leftSwipeGesture = (UISwipeGestureRecognizer *)v14;

    [(UISwipeGestureRecognizer *)v3->_leftSwipeGesture setDirection:2];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1CA00]) initWithTarget:v3 action:v9];
    rightSwipeGesture = v3->_rightSwipeGesture;
    v3->_rightSwipeGesture = (UISwipeGestureRecognizer *)v16;

    [(UISwipeGestureRecognizer *)v3->_rightSwipeGesture setDirection:1];
    v3->_unfocusedItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    itemViewsByIndex = v3->_itemViewsByIndex;
    v3->_itemViewsByIndex = (NSMutableDictionary *)v18;

    *((unsigned char *)&v3->_delegateFlags + 1) = 1;
    v20 = (void *)MEMORY[0x263F1C6B0];
    v21 = +[TVMLUtilities TVMLKitBundle];
    v22 = [v20 imageNamed:@"tumbler-chevron" inBundle:v21];

    v23 = [(_TVTumblerView *)v3 traitCollection];
    if ([v23 userInterfaceStyle] == 2) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    v24 = [MEMORY[0x263F1C550] blackColor];
    }

    id v25 = objc_alloc(MEMORY[0x263F1C6D0]);
    v26 = [v22 imageWithRenderingMode:2];
    uint64_t v27 = [v25 initWithImage:v26];
    arrowLeft = v3->_arrowLeft;
    v3->_arrowLeft = (UIImageView *)v27;

    v29 = v3->_arrowLeft;
    CGAffineTransformMakeRotation(&v35, 3.14159265);
    [(UIImageView *)v29 setTransform:&v35];
    [(UIImageView *)v3->_arrowLeft setTintColor:v24];
    [(_TVTumblerView *)v3 addSubview:v3->_arrowLeft];
    id v30 = objc_alloc(MEMORY[0x263F1C6D0]);
    v31 = [v22 imageWithRenderingMode:2];
    uint64_t v32 = [v30 initWithImage:v31];
    arrowRight = v3->_arrowRight;
    v3->_arrowRight = (UIImageView *)v32;

    [(UIImageView *)v3->_arrowRight setTintColor:v24];
    [(_TVTumblerView *)v3 addSubview:v3->_arrowRight];
  }
  return v3;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__enableMove object:0];
  v3.receiver = self;
  v3.super_class = (Class)_TVTumblerView;
  [(_TVTumblerView *)&v3 dealloc];
}

- (UIImageView)arrowLeading
{
  uint64_t v3 = [(_TVTumblerView *)self effectiveUserInterfaceLayoutDirection];
  id v4 = &OBJC_IVAR____TVTumblerView__arrowLeft;
  if (v3 == 1) {
    id v4 = &OBJC_IVAR____TVTumblerView__arrowRight;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  return (UIImageView *)v5;
}

- (UIImageView)arrowTrailing
{
  uint64_t v3 = [(_TVTumblerView *)self effectiveUserInterfaceLayoutDirection];
  id v4 = &OBJC_IVAR____TVTumblerView__arrowRight;
  if (v3 == 1) {
    id v4 = &OBJC_IVAR____TVTumblerView__arrowLeft;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  return (UIImageView *)v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_TVTumblerView *)self traitCollection];
  if (![v5 userInterfaceStyle])
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v6 = [v4 userInterfaceStyle];
  uint64_t v7 = [(_TVTumblerView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    v9 = [(_TVTumblerView *)self traitCollection];
    if ([v9 userInterfaceStyle] == 2) {
      [MEMORY[0x263F1C550] whiteColor];
    }
    else {
    uint64_t v5 = [MEMORY[0x263F1C550] blackColor];
    }

    [(UIImageView *)self->_arrowLeft setTintColor:v5];
    [(UIImageView *)self->_arrowRight setTintColor:v5];
    goto LABEL_7;
  }
LABEL_8:
  v10.receiver = self;
  v10.super_class = (Class)_TVTumblerView;
  [(_TVTumblerView *)&v10 traitCollectionDidChange:v4];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  if ([(_TVTumblerView *)self semanticContentAttribute] != a3)
  {
    [(UITapGestureRecognizer *)self->_leftTapGesture removeTarget:self action:0];
    [(UITapGestureRecognizer *)self->_rightTapGesture removeTarget:self action:0];
    [(UISwipeGestureRecognizer *)self->_leftSwipeGesture removeTarget:self action:0];
    [(UISwipeGestureRecognizer *)self->_rightSwipeGesture removeTarget:self action:0];
    uint64_t v5 = [MEMORY[0x263F1CB60] userInterfaceLayoutDirectionForSemanticContentAttribute:a3];
    if (v5 == 1) {
      uint64_t v6 = sel__rightAction_;
    }
    else {
      uint64_t v6 = sel__leftAction_;
    }
    if (v5 == 1) {
      uint64_t v7 = sel__leftAction_;
    }
    else {
      uint64_t v7 = sel__rightAction_;
    }
    [(UITapGestureRecognizer *)self->_leftTapGesture addTarget:self action:v6];
    [(UITapGestureRecognizer *)self->_rightTapGesture addTarget:self action:v7];
    [(UISwipeGestureRecognizer *)self->_leftSwipeGesture addTarget:self action:v6];
    [(UISwipeGestureRecognizer *)self->_rightSwipeGesture addTarget:self action:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)_TVTumblerView;
  [(_TVTumblerView *)&v8 setSemanticContentAttribute:a3];
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  [(_TVTumblerView *)self reloadData];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (void)setGestureTargetView:(id)a3
{
  p_gestureTargetView = &self->_gestureTargetView;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_gestureTargetView);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_gestureTargetView);
    uint64_t v7 = [(_TVTumblerView *)self leftTapGesture];
    [v6 removeGestureRecognizer:v7];

    id v8 = objc_loadWeakRetained((id *)p_gestureTargetView);
    v9 = [(_TVTumblerView *)self rightTapGesture];
    [v8 removeGestureRecognizer:v9];

    id v10 = objc_loadWeakRetained((id *)p_gestureTargetView);
    v11 = [(_TVTumblerView *)self leftSwipeGesture];
    [v10 removeGestureRecognizer:v11];

    id v12 = objc_loadWeakRetained((id *)p_gestureTargetView);
    v13 = [(_TVTumblerView *)self rightSwipeGesture];
    [v12 removeGestureRecognizer:v13];
  }
  id v14 = objc_storeWeak((id *)p_gestureTargetView, obj);
  v15 = [(_TVTumblerView *)self leftTapGesture];
  [obj addGestureRecognizer:v15];

  id v16 = objc_loadWeakRetained((id *)p_gestureTargetView);
  v17 = [(_TVTumblerView *)self rightTapGesture];
  [v16 addGestureRecognizer:v17];

  id v18 = objc_loadWeakRetained((id *)p_gestureTargetView);
  v19 = [(_TVTumblerView *)self leftSwipeGesture];
  [v18 addGestureRecognizer:v19];

  id v20 = objc_loadWeakRetained((id *)p_gestureTargetView);
  v21 = [(_TVTumblerView *)self rightSwipeGesture];
  [v20 addGestureRecognizer:v21];
}

- (void)setFocusedItemIndex:(int64_t)a3
{
  if (self->_focusedItemIndex != a3)
  {
    self->_focusedItemIndex = a3;
    [(_TVTumblerView *)self setUnfocusedItemIndex:0x7FFFFFFFFFFFFFFFLL];
    [(_TVTumblerView *)self setNeedsLayout];
  }
}

- (UIView)focusedItemView
{
  int64_t v3 = [(_TVTumblerView *)self focusedItemIndex];
  if (v3 < 0
    || (int64_t v4 = v3,
        [(_TVTumblerView *)self dataSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 numberOfItemsInTumblerView:self],
        v5,
        v4 >= v6))
  {
    v9 = 0;
  }
  else
  {
    uint64_t v7 = [(_TVTumblerView *)self itemViewsByIndex];
    id v8 = [NSNumber numberWithInteger:v4];
    v9 = [v7 objectForKey:v8];
  }
  return (UIView *)v9;
}

- (void)registerItemViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_itemViewClass, a3);
  [(_TVTumblerView *)self reloadData];
}

- (id)dequeueReusableItemView
{
  int64_t v3 = [(_TVTumblerView *)self spareItemView];

  if (!v3)
  {
    [(UIView *)self tv_padding];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(_TVTumblerView *)self bounds];
    id v16 = objc_msgSend(objc_alloc(-[_TVTumblerView itemViewClass](self, "itemViewClass")), "initWithFrame:", v7 + v12, v5 + v13, v14 - (v7 + v11), v15 - (v5 + v9));
    [(_TVTumblerView *)self setSpareItemView:v16];
  }
  return [(_TVTumblerView *)self spareItemView];
}

- (void)reloadData
{
  int64_t v3 = [(_TVTumblerView *)self dataSource];
  uint64_t v4 = [v3 numberOfItemsInTumblerView:self];

  if ([(_TVTumblerView *)self focusedItemIndex] >= v4)
  {
    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
    [(_TVTumblerView *)self setFocusedItemIndex:v5 - 1];
  }
  id v6 = [(_TVTumblerView *)self focusedItemView];
  if (v6) {
    [(_TVTumblerView *)self _markItemViewForReuse:v6];
  }
  [(_TVTumblerView *)self setReferredFocusedItemView:0];
  [(_TVTumblerView *)self setUnfocusedItemIndex:0x7FFFFFFFFFFFFFFFLL];
  [(_TVTumblerView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(_TVTumblerView *)self bounds];
  double v6 = fmax(width, v5);
  [(_TVTumblerView *)self bounds];
  double v8 = v7;
  double v9 = v6;
  result.height = v8;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  int64_t v3 = [(_TVTumblerView *)self dataSource];
  uint64_t v4 = [v3 numberOfItemsInTumblerView:self];

  if (([(_TVTumblerView *)self focusedItemIndex] & 0x8000000000000000) == 0
    && [(_TVTumblerView *)self focusedItemIndex] < v4)
  {
    [(_TVTumblerView *)self bounds];
    double v6 = v5;
    CGFloat v57 = v7;
    CGFloat v58 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(_TVTumblerView *)self arrowLeft];
    objc_msgSend(v13, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v15 = v14;
    double v17 = v16;

    [(UIView *)self tv_padding];
    if (v19 < v15 + 56.0) {
      double v19 = v15 + 56.0;
    }
    if (v21 < v15 + 56.0) {
      double v21 = v15 + 56.0;
    }
    CGFloat v22 = v6 + v19;
    CGFloat v23 = v8 + v18;
    double v24 = v10 - (v19 + v21);
    double v25 = v12 - (v18 + v20);
    v26 = [(_TVTumblerView *)self containerView];
    objc_msgSend(v26, "setFrame:", v22, v23, v24, v25);

    v81.origin.x = v22;
    v81.origin.y = v23;
    double v55 = v25;
    double v56 = v24;
    v81.size.double width = v24;
    v81.size.height = v25;
    CGFloat v27 = CGRectGetMidY(v81) + v17 * -0.5;
    v28 = [(_TVTumblerView *)self arrowLeft];
    v82.origin.x = v58;
    v82.origin.y = v57;
    v82.size.double width = v10;
    v82.size.height = v12;
    objc_msgSend(v28, "setFrame:", CGRectGetMinX(v82) + 28.0, v27, v15, v17);

    v29 = [(_TVTumblerView *)self arrowRight];
    v83.origin.x = v58;
    v83.origin.y = v57;
    v83.size.double width = v10;
    v83.size.height = v12;
    objc_msgSend(v29, "setFrame:", CGRectGetMaxX(v83) - (v15 + 28.0), v27, v15, v17);

    id v30 = [(_TVTumblerView *)self _itemViewAtIndex:[(_TVTumblerView *)self focusedItemIndex]];
    v31 = [(_TVTumblerView *)self focusedItemView];

    if (v30 != v31)
    {
      if ([(_TVTumblerView *)self unfocusedItemIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v30, "setFrame:", 0.0, 0.0, v24, v25);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v32 = [(_TVTumblerView *)self itemViewsByIndex];
        v33 = [v32 allValues];

        uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v79 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v60 != v36) {
                objc_enumerationMutation(v33);
              }
              if (*(void **)(*((void *)&v59 + 1) + 8 * i) != v30) {
                -[_TVTumblerView _markItemViewForReuse:](self, "_markItemViewForReuse:");
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v79 count:16];
          }
          while (v35);
        }

        v38 = [(_TVTumblerView *)self arrowLeading];
        if ([(_TVTumblerView *)self focusedItemIndex] <= 0) {
          double v39 = 0.0;
        }
        else {
          double v39 = 1.0;
        }
        objc_msgSend(v38, "setAlpha:", v39, *(void *)&v25);

        v40 = [(_TVTumblerView *)self arrowTrailing];
        if ([(_TVTumblerView *)self focusedItemIndex] >= v4 - 1) {
          double v41 = 0.0;
        }
        else {
          double v41 = 1.0;
        }
        [v40 setAlpha:v41];

        [(_TVTumblerView *)self _enableMove];
      }
      else
      {
        int64_t v42 = [(_TVTumblerView *)self unfocusedItemIndex];
        v43 = [(_TVTumblerView *)self _itemViewAtIndex:v42];
        if ([(_TVTumblerView *)self effectiveUserInterfaceLayoutDirection] == 1) {
          uint64_t v44 = -1;
        }
        else {
          uint64_t v44 = 1;
        }
        double v45 = (double)v44;
        if (v42 >= [(_TVTumblerView *)self focusedItemIndex]) {
          double v46 = (double)v44;
        }
        else {
          double v46 = -(double)v44;
        }
        [(_TVTumblerView *)self interitemSpacing];
        double v48 = v46 * (v56 + v47) + 0.0;
        if (v42 >= [(_TVTumblerView *)self focusedItemIndex]) {
          double v45 = -(double)v44;
        }
        [(_TVTumblerView *)self interitemSpacing];
        objc_msgSend(v30, "setFrame:", v45 * (v56 + v49) + 0.0, 0.0, v56, v55);
        v50 = (void *)MEMORY[0x263F1CB60];
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __32___TVTumblerView_layoutSubviews__block_invoke;
        v66[3] = &unk_264BA6F70;
        id v67 = v43;
        double v70 = v48;
        uint64_t v71 = 0;
        double v72 = v56;
        double v73 = v55;
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        double v76 = v56;
        double v77 = v55;
        id v68 = v30;
        v69 = self;
        uint64_t v78 = v4;
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __32___TVTumblerView_layoutSubviews__block_invoke_2;
        v63[3] = &unk_264BA6F98;
        id v64 = v67;
        int64_t v65 = v42;
        v63[4] = self;
        id v51 = v67;
        [v50 animateWithDuration:v66 animations:v63 completion:0.3];
      }
      [(_TVTumblerView *)self setReferredFocusedItemView:v30];
      v52 = [(_TVTumblerView *)self containerView];
      [v52 addSubview:v30];

      [(_TVTumblerView *)self _markItemViewForInUse:v30 forIndex:[(_TVTumblerView *)self focusedItemIndex]];
      if (*(unsigned char *)&self->_delegateFlags)
      {
        v53 = [(_TVTumblerView *)self delegate];
        objc_msgSend(v53, "tumblerView:didFocusItemAtIndex:", self, -[_TVTumblerView focusedItemIndex](self, "focusedItemIndex"));
      }
    }
    v54 = [(_TVTumblerView *)self gestureTargetView];

    if (!v54) {
      [(_TVTumblerView *)self setGestureTargetView:self];
    }
  }
}

- (void)_leftAction:(id)a3
{
  int64_t v4 = [(_TVTumblerView *)self focusedItemIndex];
  int64_t v5 = [(_TVTumblerView *)self unfocusedItemIndex];
  if ((v5 >= v4 || v5 == 0x7FFFFFFFFFFFFFFFLL) && v4 >= 1)
  {
    [(_TVTumblerView *)self _scheduleMoveToIndex:v4 - 1];
  }
}

- (void)_rightAction:(id)a3
{
  int64_t v4 = [(_TVTumblerView *)self focusedItemIndex];
  int64_t v5 = [(_TVTumblerView *)self unfocusedItemIndex];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 <= v4)
  {
    double v6 = [(_TVTumblerView *)self dataSource];
    uint64_t v7 = [v6 numberOfItemsInTumblerView:self] - 1;

    if (v4 < v7)
    {
      [(_TVTumblerView *)self _scheduleMoveToIndex:v4 + 1];
    }
  }
}

- (void)_scheduleMoveToIndex:(int64_t)a3
{
  if ([(_TVTumblerView *)self canMove])
  {
    int64_t v5 = [(_TVTumblerView *)self focusedItemIndex];
    [(_TVTumblerView *)self setFocusedItemIndex:a3];
    [(_TVTumblerView *)self setUnfocusedItemIndex:v5];
    [(_TVTumblerView *)self _disableMove];
  }
}

- (void)_enableMove
{
  *((unsigned char *)&self->_delegateFlags + 1) = 1;
}

- (void)_disableMove
{
  *((unsigned char *)&self->_delegateFlags + 1) = 0;
}

- (id)_itemViewAtIndex:(int64_t)a3
{
  int64_t v5 = [(_TVTumblerView *)self itemViewsByIndex];
  double v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    double v8 = [(_TVTumblerView *)self dataSource];
    uint64_t v7 = [v8 tumblerView:self viewForItemAtIndex:a3];
  }
  return v7;
}

- (void)_markItemViewForInUse:(id)a3 forIndex:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(_TVTumblerView *)self spareItemView];

  if (v6 == v9) {
    [(_TVTumblerView *)self setSpareItemView:0];
  }
  uint64_t v7 = [(_TVTumblerView *)self itemViewsByIndex];
  double v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v9 forKey:v8];

  [v9 setHidden:0];
}

- (void)_markItemViewForReuse:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_TVTumblerView *)self spareItemView];

  if (v5)
  {
    id v6 = [(_TVTumblerView *)self spareItemView];
    [v6 removeFromSuperview];
  }
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy_;
  double v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v7 = [(_TVTumblerView *)self itemViewsByIndex];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __40___TVTumblerView__markItemViewForReuse___block_invoke;
  double v13 = &unk_264BA6FC0;
  id v8 = v4;
  id v14 = v8;
  double v15 = &v16;
  [v7 enumerateKeysAndObjectsUsingBlock:&v10];

  id v9 = [(_TVTumblerView *)self itemViewsByIndex];
  [v9 removeObjectForKey:v17[5]];

  [v8 setHidden:1];
  _Block_object_dispose(&v16, 8);
}

- (_TVTumblerViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (_TVTumblerViewDataSource *)WeakRetained;
}

- (_TVTumblerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVTumblerViewDelegate *)WeakRetained;
}

- (UIView)gestureTargetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureTargetView);
  return (UIView *)WeakRetained;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (int64_t)focusedItemIndex
{
  return self->_focusedItemIndex;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (Class)itemViewClass
{
  return self->_itemViewClass;
}

- (void)setItemViewClass:(Class)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)referredFocusedItemView
{
  return self->_referredFocusedItemView;
}

- (void)setReferredFocusedItemView:(id)a3
{
}

- (UIImageView)arrowLeft
{
  return self->_arrowLeft;
}

- (UIImageView)arrowRight
{
  return self->_arrowRight;
}

- (UIView)spareItemView
{
  return self->_spareItemView;
}

- (void)setSpareItemView:(id)a3
{
}

- (NSMutableDictionary)itemViewsByIndex
{
  return self->_itemViewsByIndex;
}

- (int64_t)unfocusedItemIndex
{
  return self->_unfocusedItemIndex;
}

- (void)setUnfocusedItemIndex:(int64_t)a3
{
  self->_unfocusedItemIndex = a3;
}

- (BOOL)canMove
{
  return *((unsigned char *)&self->_delegateFlags + 1);
}

- (UITapGestureRecognizer)leftTapGesture
{
  return self->_leftTapGesture;
}

- (UITapGestureRecognizer)rightTapGesture
{
  return self->_rightTapGesture;
}

- (UISwipeGestureRecognizer)leftSwipeGesture
{
  return self->_leftSwipeGesture;
}

- (UISwipeGestureRecognizer)rightSwipeGesture
{
  return self->_rightSwipeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSwipeGesture, 0);
  objc_storeStrong((id *)&self->_leftSwipeGesture, 0);
  objc_storeStrong((id *)&self->_rightTapGesture, 0);
  objc_storeStrong((id *)&self->_leftTapGesture, 0);
  objc_storeStrong((id *)&self->_itemViewsByIndex, 0);
  objc_storeStrong((id *)&self->_spareItemView, 0);
  objc_storeStrong((id *)&self->_arrowRight, 0);
  objc_storeStrong((id *)&self->_arrowLeft, 0);
  objc_storeStrong((id *)&self->_referredFocusedItemView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_itemViewClass, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_gestureTargetView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end