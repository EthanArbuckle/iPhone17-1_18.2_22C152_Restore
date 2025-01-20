@interface UITabBarCustomizeView
- (NSArray)availableItems;
- (UINavigationBar)navigationBar;
- (UITabBarCustomizeView)initWithFrame:(CGRect)a3;
- (id)itemInTabBarWithTouches:(id)a3 withEvent:(id)a4;
- (id)titleLabelFont;
- (int64_t)_barMetrics;
- (void)adjustDragImageWithTouches:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAvailableItems:(id)a3;
- (void)setIsBeingDismissed;
- (void)setNavigationBar:(id)a3;
- (void)setTabBar:(id)a3 currentItems:(id)a4 availableItems:(id)a5;
- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4;
- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4;
- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4;
- (void)tintTabBarItemsForEdit:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateProxiesSelection;
@end

@implementation UITabBarCustomizeView

- (UITabBarCustomizeView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UITabBarCustomizeView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v3 setAutoresizingMask:18];
  [(UIView *)v3 setAutoresizesSubviews:1];
  if (v3)
  {
    v3->_itemsInRowCount = 3;
    v4 = objc_alloc_init(UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = v3->_titleLabel;
    v7 = _UINSLocalizedStringWithDefaultValue(@"Drag the icons to organize tabs.", @"Drag the icons to organize tabs.");
    [(UILabel *)v6 setText:v7];

    v8 = v3->_titleLabel;
    v9 = [(UITabBarCustomizeView *)v3 titleLabelFont];
    [(UILabel *)v8 setFont:v9];

    v10 = v3->_titleLabel;
    v11 = +[UIColor secondaryLabelColor];
    [(UILabel *)v10 setTextColor:v11];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:4];
    [(UIView *)v3 addSubview:v3->_titleLabel];
    [(UIView *)v3 setExclusiveTouch:1];
    [(UIView *)v3 setMultipleTouchEnabled:0];
  }
  return v3;
}

- (id)titleLabelFont
{
  v3 = [(UIView *)self traitCollection];
  v4 = [(UIView *)self traitCollection];
  v5 = [v4 preferredContentSizeCategory];
  NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v5, &cfstr_Uictcontentsiz_10.isa);

  if (v6 == NSOrderedDescending)
  {
    uint64_t v7 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryAccessibilityL"];

    v3 = (void *)v7;
  }
  v8 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleTitle2"];
  v9 = [off_1E52D39B8 systemFontOfSize:21.0];
  v10 = [v8 scaledFontForFont:v9 compatibleWithTraitCollection:v3];

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UITabBarCustomizeView;
  id v4 = a3;
  [(UIView *)&v10 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v10.receiver, v10.super_class);

  NSComparisonResult v6 = [(UIView *)self traitCollection];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    v9 = [(UITabBarCustomizeView *)self titleLabelFont];
    [(UILabel *)titleLabel setFont:v9];

    [(UIView *)self setNeedsLayout];
  }
}

- (void)tintTabBarItemsForEdit:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    id v4 = [(UITabBar *)self->_tabBar items];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "_setSelected:", -[NSArray containsObject:](self->_availableItems, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i)));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v15 = 0uLL;
    long long v16 = 0uLL;
    long long v13 = 0uLL;
    long long v14 = 0uLL;
    id v4 = [(UITabBar *)self->_tabBar items];
    uint64_t v9 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * j) _setSelected:*(UITabBarItem **)(*((void *)&v13 + 1) + 8 * j) == self->_selectedBeforeItem];
        }
        uint64_t v10 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)updateProxiesSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_proxies;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(UITabBar *)self->_tabBar items];
        uint64_t v10 = [v8 item];
        objc_msgSend(v8, "setSelected:", objc_msgSend(v9, "containsObject:", v10) ^ 1);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)setIsBeingDismissed
{
  self->_isBeingDismissed = 1;
}

- (int64_t)_barMetrics
{
  return [(UITabBar *)self->_tabBar _barMetrics];
}

- (void)setTabBar:(id)a3 currentItems:(id)a4 availableItems:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v8 = a5;
  objc_storeStrong((id *)&self->_tabBar, a3);
  uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  proxies = self->_proxies;
  self->_proxies = v9;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = [[UITabBarItemProxy alloc] initWithItem:*(void *)(*((void *)&v34 + 1) + 8 * i) inTabBar:v29];
        uint64_t v16 = [(UITabBarItemProxy *)v15 view];
        long long v17 = +[UIColor secondaryLabelColor];
        [v16 _setUnselectedTintColor:v17];

        [(NSMutableArray *)self->_proxies addObject:v15];
        long long v18 = [(UITabBarItemProxy *)v15 view];
        [(UIView *)self addSubview:v18];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  [(UITabBarCustomizeView *)self updateProxiesSelection];
  long long v19 = [v29 items];
  long long v20 = (NSMutableArray *)[v19 mutableCopy];
  fixedItems = self->_fixedItems;
  self->_fixedItems = v20;

  [(NSMutableArray *)self->_fixedItems removeObjectsInArray:obj];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v22 = [(UITabBar *)self->_tabBar items];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if ([v27 _isSelected]) {
          objc_storeStrong((id *)&self->_selectedBeforeItem, v27);
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }

  [(UITabBarCustomizeView *)self setAvailableItems:obj];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  [(UIView *)self->_tabBar bounds];
  [(UIView *)self safeAreaInsets];
  double v4 = v3;
  uint64_t v5 = [(UITabBarCustomizeView *)self navigationBar];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(UITabBarCustomizeView *)self navigationBar];
  objc_msgSend(v10, "setFrame:", 0.0, v4, v7, v9);

  v92.origin.x = 0.0;
  v92.origin.y = v4;
  v92.size.double width = v7;
  v92.size.double height = v9;
  double MaxY = CGRectGetMaxY(v92);
  [(UIView *)self safeAreaInsets];
  double v15 = v14;
  double v17 = v16;
  if (v12 >= MaxY) {
    double v18 = v12;
  }
  else {
    double v18 = MaxY;
  }
  [(UIView *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = v15 + v17;
  uint64_t v28 = [(NSMutableArray *)self->_proxies count];
  id v29 = [(UIView *)self traitCollection];
  uint64_t v30 = [v29 horizontalSizeClass];
  int v31 = dyld_program_sdk_at_least();
  long long v32 = +[UIDevice currentDevice];
  uint64_t v33 = [v32 userInterfaceIdiom];

  BOOL v34 = (v33 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v31) {
    BOOL v34 = (v30 & 0xFFFFFFFFFFFFFFFDLL) == 0 && (v33 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  double v36 = v24 - v27;
  if (v34) {
    double height = 160.0;
  }
  else {
    double height = 80.0;
  }

  int v38 = *((_DWORD *)&self->super._viewFlags + 4);
  v39 = +[UIDevice currentDevice];
  uint64_t v40 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
  uint64_t v41 = v28 << 32;
  if ([v39 userInterfaceIdiom])
  {

    if (v41 >= 0xC00000001)
    {
      BOOL v42 = 0;
LABEL_19:
      int64_t v46 = vcvtmd_s64_f64(v36 / height);
      char v47 = 1;
      goto LABEL_20;
    }
  }
  else
  {
    v43 = [(UIView *)self window];
    v44 = [v43 windowScene];
    unint64_t v45 = [v44 interfaceOrientation] - 3;
    BOOL v42 = v45 < 2;

    if (v41 > 0xC00000000)
    {
      uint64_t v40 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
      goto LABEL_19;
    }
    if (v45 <= 1)
    {
      char v47 = 0;
      BOOL v42 = 1;
      int64_t v46 = 5;
      uint64_t v40 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
LABEL_20:
      self->_itemsInRowCount = v46;
      BOOL v48 = v41 <= 0x900000000;
      BOOL v49 = v41 > 0x900000000;
      if (!v48) {
        BOOL v42 = 1;
      }
      goto LABEL_27;
    }
    uint64_t v40 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
  }
  self->_itemsInRowCount = 3;
  if (v41 <= 0x900000000)
  {
    BOOL v49 = 0;
    char v47 = 0;
    int v50 = v40[41];
    uint64_t v51 = v50;
    goto LABEL_32;
  }
  char v47 = 0;
  BOOL v42 = 1;
  BOOL v49 = 1;
LABEL_27:
  int v50 = v40[41];
  uint64_t v51 = v50;
  v52 = [*(id *)((char *)&self->super.super.super.isa + v50) superview];
  v53 = v52;
  if (v42) {

  }
  if (v53 == self)
  {
    [*(id *)((char *)&self->super.super.super.isa + v50) removeFromSuperview];
    goto LABEL_34;
  }
LABEL_32:
  v54 = [*(id *)((char *)&self->super.super.super.isa + v51) superview];

  if (v54 != self) {
    [(UIView *)self addSubview:*(Class *)((char *)&self->super.super.super.isa + v51)];
  }
LABEL_34:
  [(UITabBarCustomizeView *)self updateProxiesSelection];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __39__UITabBarCustomizeView_layoutSubviews__block_invoke;
  v89[3] = &unk_1E52D9F70;
  v89[4] = self;
  +[UIView performWithoutAnimation:v89];
  if (v47)
  {
    v93.origin.x = v15 + v20;
    v93.origin.y = v22 + v18;
    v93.size.double width = v36;
    v93.size.double height = v26 - (v84 + v18);
    self->_double gridOffset = CGRectGetMinY(v93);
    v94.origin.x = v15 + v20;
    v94.origin.y = v22 + v18;
    v94.size.double width = v36;
    v94.size.double height = v26 - (v84 + v18);
    double MinX = CGRectGetMinX(v94);
    UIRoundToViewScale(self);
    double height = v56;
  }
  else
  {
    [(UIView *)self bounds];
    UIRoundToViewScale(self);
    double MinX = v57;
    [(NSArray *)self->_availableItems count];
    [(UIView *)self bounds];
    double v59 = 0.0;
    if (!v49)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v50), "sizeThatFits:", v58 - (MinX + MinX), 3.40282347e38);
      double v59 = v60;
    }
    [(UIView *)self bounds];
    if ([(NSMutableArray *)self->_proxies count])
    {
      v61 = [(NSMutableArray *)self->_proxies objectAtIndexedSubscript:0];
      v62 = [v61 view];
      [v62 frame];
    }
    UIRoundToViewScale(self);
    if (!v49)
    {
      UIRoundToViewScale(self);
      double v65 = v64;
      v66 = *(Class *)((char *)&self->super.super.super.isa + v50);
      [(UIView *)self bounds];
      UIRoundToViewScale(self);
      objc_msgSend(v66, "setFrame:");
      double v63 = v59 + v65 + 20.0;
    }
    self->_double gridOffset = v63;
  }
  p_firstItemRect = &self->_firstItemRect;
  self->_firstItemRect.size.double width = height;
  self->_firstItemRect.size.double height = height;
  double width = height;
  double v69 = MinX;
  if ((v38 & 0x80000) != 0)
  {
    [(UIView *)self bounds];
    CGFloat v70 = CGRectGetWidth(v95) - MinX;
    v96.origin.x = p_firstItemRect->origin.x;
    v96.origin.y = self->_firstItemRect.origin.y;
    v96.size.double width = self->_firstItemRect.size.width;
    v96.size.double height = self->_firstItemRect.size.height;
    double v69 = v70 - CGRectGetWidth(v96);
    double width = self->_firstItemRect.size.width;
    double height = self->_firstItemRect.size.height;
  }
  p_firstItemRect->origin.x = v69;
  double gridOffset = self->_gridOffset;
  self->_firstItemRect.origin.y = gridOffset;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v72 = self->_proxies;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v85 objects:v90 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    int v75 = 0;
    uint64_t v76 = *(void *)v86;
    double v77 = 0.5;
    do
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v86 != v76) {
          objc_enumerationMutation(v72);
        }
        v79 = [*(id *)(*((void *)&v85 + 1) + 8 * i) view];
        [v79 frame];
        objc_msgSend(v79, "setFrame:", round(width * 0.5 + v69 - v80 * v77), round(height * 0.5 + gridOffset - v81 * v77));
        if ((v75 + 1 + i) % self->_itemsInRowCount)
        {
          if ((v38 & 0x80000) != 0) {
            double v69 = v69 - width;
          }
          else {
            double v69 = width + v69;
          }
        }
        else
        {
          double v82 = MinX;
          if ((v38 & 0x80000) != 0)
          {
            [(UIView *)self bounds];
            CGFloat v83 = CGRectGetWidth(v97) - MinX;
            v98.origin.x = v69;
            v98.origin.y = gridOffset;
            v98.size.double width = width;
            v98.size.double height = height;
            double v82 = v83 - CGRectGetWidth(v98);
            double v77 = 0.5;
          }
          double gridOffset = height + gridOffset;
          double v69 = v82;
        }
      }
      v75 += v74;
      uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v85 objects:v90 count:16];
    }
    while (v74);
  }
}

uint64_t __39__UITabBarCustomizeView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) tintTabBarItemsForEdit:*(unsigned char *)(*(void *)(a1 + 32) + 552) == 0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_draggingProxy)
  {
    int v8 = *((_DWORD *)&self->super._viewFlags + 4);
    double width = self->_firstItemRect.size.width;
    double height = self->_firstItemRect.size.height;
    double x = self->_firstItemRect.origin.x;
    double y = self->_firstItemRect.origin.y;
    if ((v8 & 0x80000) != 0)
    {
      [(UIView *)self bounds];
      double v13 = CGRectGetWidth(v51);
      v52.origin.double x = x;
      v52.origin.double y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      double v14 = v13 - CGRectGetWidth(v52);
      v53.origin.double x = x;
      v53.origin.double y = y;
      v53.size.double width = width;
      v53.size.double height = height;
      double x = v14 - CGRectGetMinX(v53);
    }
    double v15 = [v6 anyObject];
    [v15 locationInView:self];
    double v17 = v16;
    double v19 = v18;

    int v20 = vcvtmd_s64_f64((v17 - x) / width);
    int64_t v21 = v20 & ~(v20 >> 31);
    int64_t itemsInRowCount = self->_itemsInRowCount;
    if (itemsInRowCount <= v21) {
      LODWORD(v21) = itemsInRowCount - 1;
    }
    if ((*(void *)&v8 & 0x80000) != 0) {
      LODWORD(v21) = ~v21 + itemsInRowCount;
    }
    uint64_t v23 = (int)(floor((v19 - y) / height) * (double)itemsInRowCount + (double)(int)v21);
    if ((v23 & 0x80000000) != 0
      || [(NSMutableArray *)self->_proxies count] <= (unint64_t)v23)
    {
      double v24 = 0;
    }
    else
    {
      double v24 = [(NSMutableArray *)self->_proxies objectAtIndex:v23];
    }
    draggingProxdouble y = self->_draggingProxy;
    self->_draggingProxdouble y = v24;

    double v26 = self->_draggingProxy;
    if (v26)
    {
      double v27 = [(UITabBarItemProxy *)v26 view];
      uint64_t v28 = objc_alloc_init(UISnapshotView);
      dragImage = self->_dragImage;
      self->_dragImage = v28;

      [(UISnapshotView *)self->_dragImage captureSnapshotOfView:v27 withSnapshotType:1];
      [(UIView *)self->_dragImage setOpaque:0];
      [(UIView *)self->_dragImage setUserInteractionEnabled:0];
      uint64_t v30 = [(UIView *)self superview];
      [v27 bounds];
      objc_msgSend(v30, "convertRect:fromView:", v27);
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      v39 = [v6 anyObject];
      [v39 locationInView:self];
      double v41 = v40;
      double v43 = v42;

      self->_startPoint.double x = round(v41 - (v32 + v36 * 0.5));
      self->_startPoint.double y = round(v43 - (v34 + v38 * 0.5));
      -[UISnapshotView setFrame:](self->_dragImage, "setFrame:", v32, v34, v36, v38);
      [v30 addSubview:self->_dragImage];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __48__UITabBarCustomizeView_touchesBegan_withEvent___block_invoke;
      v48[3] = &unk_1E52DCB30;
      v48[4] = self;
      id v49 = v6;
      id v50 = v7;
      +[UIView animateWithDuration:32 delay:v48 options:0 animations:0.2 completion:0.0];
      if (!self->_replacementGlow)
      {
        v44 = [UIImageView alloc];
        unint64_t v45 = _UIImageWithName(@"UIButtonBarPressedIndicator.png");
        int64_t v46 = [(UIImageView *)v44 initWithImage:v45];
        replacementGlow = self->_replacementGlow;
        self->_replacementGlow = v46;

        [(UIView *)self->_replacementGlow setUserInteractionEnabled:0];
        [(UIView *)self->_replacementGlow setOpaque:0];
        [(UIView *)self->_replacementGlow setAlpha:0.0];
        [(UIView *)self->_tabBar addSubview:self->_replacementGlow];
      }
    }
  }
}

uint64_t __48__UITabBarCustomizeView_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 408) items];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id **)(*((void *)&v24 + 1) + 8 * i);
        int v8 = -[UITabBarItem _tabBarButton](v7);
        int v9 = [v8 _isSelected];

        if (v9)
        {
          uint64_t v10 = -[UITabBarItem _tabBarButton](v7);
          [v10 setAlpha:0.7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 32) + 416);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = [*(id *)(*((void *)&v20 + 1) + 8 * j) view];
        [v16 setAlpha:0.7];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }

  double v17 = *(void **)(*(void *)(a1 + 32) + 448);
  CGAffineTransformMakeScale(&v19, 2.0, 2.0);
  [v17 setTransform:&v19];
  return [*(id *)(a1 + 32) adjustDragImageWithTouches:*(void *)(a1 + 40) withEvent:*(void *)(a1 + 48)];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (self->_draggingProxy)
  {
    id v6 = a4;
    id v7 = a3;
    [(UITabBarCustomizeView *)self adjustDragImageWithTouches:v7 withEvent:v6];
    int v8 = self->_replaceItem;
    int v9 = [(UITabBarCustomizeView *)self itemInTabBarWithTouches:v7 withEvent:v6];

    replaceItem = self->_replaceItem;
    self->_replaceItem = v9;

    id v11 = self->_replaceItem;
    uint64_t v12 = [(UITabBarItemProxy *)self->_draggingProxy item];

    if (v11 == v12)
    {
      uint64_t v13 = self->_replaceItem;
      self->_replaceItem = 0;
    }
    uint64_t v14 = self->_replaceItem;
    if (v14)
    {
      if (v14 != v8)
      {
        double v15 = v14->_view;
        [(UIView *)v15 frame];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;

        [(UIView *)self->_replacementGlow frame];
        -[UIImageView setFrame:](self->_replacementGlow, "setFrame:", v17 - round((v24 - v21) * 0.5), v19 - round((v25 - v23) * 0.5));
      }
      [(UIView *)self->_replacementGlow alpha];
      if (v28 >= 1.0) {
        goto LABEL_12;
      }
      [(UIView *)self->_tabBar bringSubviewToFront:self->_replacementGlow];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      double v36 = __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke;
      double v37 = &unk_1E52D9F70;
      double v38 = self;
      long long v27 = &v34;
    }
    else
    {
      [(UIView *)self->_replacementGlow alpha];
      if (v26 <= 0.0)
      {
LABEL_12:

        return;
      }
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      double v31 = __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke_2;
      double v32 = &unk_1E52D9F70;
      double v33 = self;
      long long v27 = &v29;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v27, 0, 0.2, 0.0, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_12;
  }
}

uint64_t __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
}

uint64_t __48__UITabBarCustomizeView_touchesMoved_withEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_draggingProxy)
  {
    int v8 = [(UITabBarCustomizeView *)self itemInTabBarWithTouches:v6 withEvent:v7];
    replaceItem = self->_replaceItem;
    self->_replaceItem = v8;

    uint64_t v10 = self->_replaceItem;
    id v11 = [(UITabBarItemProxy *)self->_draggingProxy item];

    if (v10 == v11)
    {
      uint64_t v12 = self->_replaceItem;
      self->_replaceItem = 0;
    }
    if (self->_replaceItem)
    {
      uint64_t v13 = [(UITabBar *)self->_tabBar items];
      uint64_t v14 = [(UITabBarItemProxy *)self->_draggingProxy item];
      uint64_t v15 = [v13 containsObject:v14];

      tabBar = self->_tabBar;
      double v17 = self->_replaceItem;
      double v18 = [(UITabBarItemProxy *)self->_draggingProxy item];
      [(UITabBar *)tabBar _configureTabBarReplacingItem:v17 withNewItem:v18 swapping:v15];

      double v19 = [(UITabBarItemProxy *)self->_draggingProxy item];
      [v19 _setSelected:1];

      [(UIView *)self->_dragImage removeFromSuperview];
    }
    else
    {
      LOBYTE(v15) = 0;
    }
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__21;
    v24[4] = __Block_byref_object_dispose__21;
    id v25 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke;
    v22[3] = &unk_1E52DF440;
    char v23 = v15;
    v22[4] = self;
    v22[5] = v24;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke_2;
    v21[3] = &unk_1E52DF468;
    v21[4] = self;
    v21[5] = v24;
    +[UIView animateWithDuration:4 delay:v22 options:v21 animations:0.2 completion:0.0];
    [(id)UIApp setIgnoresInteractionEvents:1];
    [(UIView *)self->_replacementGlow removeFromSuperview];
    replacementGlow = self->_replacementGlow;
    self->_replacementGlow = 0;

    _Block_object_dispose(v24, 8);
  }
}

void __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 432);
  if (*(void *)(v2 + 464))
  {
    [v3 setSelected:0];
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 464);
      *(void *)(v4 + 464) = 0;
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v28 = *(id *)(*(void *)(a1 + 32) + 416);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v69;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v69 != v31) {
              objc_enumerationMutation(v28);
            }
            double v33 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            uint64_t v34 = *(void **)(*(void *)(a1 + 32) + 464);
            uint64_t v35 = [v33 item];

            if (v34 == v35)
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v33);
              goto LABEL_15;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      double v36 = *(void **)(a1 + 32);
      double v37 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) view];
      [v37 center];
      objc_msgSend(v36, "convertPoint:toView:", *(void *)(*(void *)(a1 + 32) + 408));
      double v39 = v38;
      double v41 = v40;

      double v42 = -[UITabBarItem _tabBarButton](*(id **)(*(void *)(a1 + 32) + 464));
      objc_msgSend(v42, "setCenter:", v39, v41);

      double v43 = -[UITabBarItem _tabBarButton](*(id **)(*(void *)(a1 + 32) + 464));
      [v43 setAlpha:0.5];
    }
  }
  else
  {
    id v6 = [v3 view];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 448) superview];
    double v16 = [*(id *)(*(void *)(a1 + 32) + 432) view];
    double v17 = [v16 superview];
    objc_msgSend(v15, "convertRect:fromView:", v17, v8, v10, v12, v14);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    double v26 = *(void **)(*(void *)(a1 + 32) + 448);
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v67[0] = *MEMORY[0x1E4F1DAB8];
    v67[1] = v27;
    v67[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v26 setTransform:v67];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", v19, v21, v23, v25);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v44 = [*(id *)(*(void *)(a1 + 32) + 408) items];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v64 != v47) {
          objc_enumerationMutation(v44);
        }
        id v49 = *(id **)(*((void *)&v63 + 1) + 8 * j);
        id v50 = -[UITabBarItem _tabBarButton](v49);
        int v51 = [v50 _isSelected];

        if (v51)
        {
          CGRect v52 = -[UITabBarItem _tabBarButton](v49);
          [v52 setAlpha:1.0];
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v46);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v53 = *(id *)(*(void *)(a1 + 32) + 416);
  uint64_t v54 = [v53 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v55; ++k)
      {
        if (*(void *)v60 != v56) {
          objc_enumerationMutation(v53);
        }
        double v58 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * k), "view", (void)v59);
        [v58 setAlpha:1.0];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v55);
  }
}

void __48__UITabBarCustomizeView_touchesEnded_withEvent___block_invoke_2(uint64_t a1)
{
  [(id)UIApp setIgnoresInteractionEvents:0];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 432) view];
  [v2 setAlpha:1.0];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSelected:1];
  uint64_t v3 = -[UITabBarItem _tabBarButton](*(id **)(*(void *)(a1 + 32) + 464));
  [v3 removeFromSuperview];

  uint64_t v4 = -[UITabBarItem _tabBarButton](*(id **)(*(void *)(a1 + 32) + 464));
  [v4 setAlpha:1.0];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = 0;

  [*(id *)(*(void *)(a1 + 32) + 448) removeFromSuperview];
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(void **)(v7 + 448);
  *(void *)(v7 + 448) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 432);
  *(void *)(v9 + 432) = 0;
}

- (void)adjustDragImageWithTouches:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v23 = [(UIView *)self superview];
  [v23 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v5 anyObject];

  [v14 locationInView:self];
  double v16 = v15;
  double v18 = v17;

  if (v16 >= v7) {
    double v19 = v16;
  }
  else {
    double v19 = v7;
  }
  if (v19 >= v7 + v11) {
    double v20 = v7 + v11;
  }
  else {
    double v20 = v19;
  }
  if (v18 >= v9) {
    double v21 = v18;
  }
  else {
    double v21 = v9;
  }
  if (v21 >= v9 + v13) {
    double v22 = v9 + v13;
  }
  else {
    double v22 = v21;
  }
  [(UIView *)self->_dragImage center];
  -[UIView setCenter:](self->_dragImage, "setCenter:", v20 - self->_startPoint.x, v22 - self->_startPoint.y + -32.0);
}

- (id)itemInTabBarWithTouches:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  double v7 = [a3 anyObject];
  [v7 locationInView:self->_tabBar];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(UITabBar *)self->_tabBar items];
  int v13 = [v12 count];
  BOOL v14 = -[UIView pointInside:withEvent:](self->_tabBar, "pointInside:withEvent:", v6, v9, v11);

  BOOL v15 = !v14 || v13 < 1;
  if (v15 || [v7 phase] == 4) {
    goto LABEL_13;
  }
  [(UIView *)self->_tabBar bounds];
  double v16 = 0;
  signed int v18 = vcvtmd_s64_f64(v9 / floor(v17 / (double)v13));
  if ((v18 & 0x80000000) == 0 && v18 < v13)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      signed int v18 = ~v18 + v13;
    }
    double v16 = [v12 objectAtIndex:v18];
  }
  if ([(NSMutableArray *)self->_fixedItems containsObject:v16])
  {

LABEL_13:
    double v16 = 0;
  }

  return v16;
}

- (void)tabBarTouchesBegan:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  -[UITabBarCustomizeView itemInTabBarWithTouches:withEvent:](self, "itemInTabBarWithTouches:withEvent:");
  id v5 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();
  draggingItem = self->_draggingItem;
  self->_draggingItem = v5;

  double v7 = self->_draggingItem;
  if (v7)
  {
    double v8 = v7->_view;
    [(UIView *)v8 frame];
    double v10 = v9;

    double v11 = [v14 anyObject];
    [v11 locationInView:self];
    self->_startPoint.double x = v12;
    self->_startPoint.double y = v13;

    self->_startPoint.double x = self->_startPoint.x - v10;
  }
}

- (void)tabBarTouchesMoved:(id)a3 withEvent:(id)a4
{
  draggingItem = self->_draggingItem;
  if (draggingItem)
  {
    id v7 = a4;
    id v8 = a3;
    double v9 = draggingItem->_view;
    [(UIView *)v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [v8 anyObject];
    [v16 locationInView:self];
    double v18 = v17;

    double v19 = v18 - self->_startPoint.x;
    double v20 = -[UITabBarItem _tabBarButton]((id *)&self->_draggingItem->super.super.isa);
    objc_msgSend(v20, "setFrame:", v19, v11, v13, v15);

    double v22 = [(UITabBarCustomizeView *)self itemInTabBarWithTouches:v8 withEvent:v7];

    double v21 = v22;
    if (v22 && v22 != self->_draggingItem)
    {
      -[UITabBar _configureTabBarReplacingItem:withNewItem:swapping:](self->_tabBar, "_configureTabBarReplacingItem:withNewItem:swapping:", v22);
      double v21 = v22;
    }
  }
}

- (void)tabBarTouchesEnded:(id)a3 withEvent:(id)a4
{
  if (self->_draggingItem)
  {
    objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1, a4);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    +[UIView animateWithDuration:0 delay:v6 options:&__block_literal_global_72 animations:0.2 completion:0.0];
    draggingItem = self->_draggingItem;
    self->_draggingItem = 0;
  }
}

uint64_t __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) _positionAllItems];
}

uint64_t __54__UITabBarCustomizeView_tabBarTouchesEnded_withEvent___block_invoke_2()
{
  return [(id)UIApp setIgnoresInteractionEvents:0];
}

- (NSArray)availableItems
{
  return self->_availableItems;
}

- (void)setAvailableItems:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_availableItems, 0);
  objc_storeStrong((id *)&self->_selectedBeforeItem, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_replaceItem, 0);
  objc_storeStrong((id *)&self->_replacementGlow, 0);
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_draggingItem, 0);
  objc_storeStrong((id *)&self->_draggingProxy, 0);
  objc_storeStrong((id *)&self->_fixedItems, 0);
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
}

@end