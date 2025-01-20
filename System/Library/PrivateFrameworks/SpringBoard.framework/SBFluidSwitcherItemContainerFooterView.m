@interface SBFluidSwitcherItemContainerFooterView
- (BOOL)_hasTitleShadow;
- (BOOL)_isTextEffectivelyEmpty:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)uniqueIconsOnly;
- (BOOL)wantsIconPointerInteractions;
- (CGSize)intrinsicContentSize;
- (SBFluidSwitcherItemContainerFooterView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (SBFluidSwitcherItemContainerFooterViewDelegate)delegate;
- (double)_maximumTitleLabelHeight;
- (double)iconHitTestOutset;
- (double)textAlpha;
- (id)_attributedTextFromText:(id)a3;
- (id)_makeIconView;
- (id)_makeLabel;
- (id)_makeSubtitleLabel;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)footerStyle;
- (unint64_t)iconAlignment;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_reloadVisibleTitleItems;
- (void)_updateIconPointerInteractions;
- (void)_updateIconViewShadow:(id)a3;
- (void)_updateIconViewsAndLabels;
- (void)_updateLabels;
- (void)_updateSubtitleLabel;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFooterStyle:(unint64_t)a3;
- (void)setIconAlignment:(unint64_t)a3;
- (void)setIconHitTestOutset:(double)a3;
- (void)setTextAlpha:(double)a3;
- (void)setTitleItems:(id)a3 animated:(BOOL)a4;
- (void)setUniqueIconsOnly:(BOOL)a3;
- (void)setWantsIconPointerInteractions:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBFluidSwitcherItemContainerFooterView

- (SBFluidSwitcherItemContainerFooterView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  v10 = -[SBFluidSwitcherItemContainerFooterView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v11 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v11 action:sel__handleTapGestureRecognizer_];
    tapGestureRecognizer = v11->_tapGestureRecognizer;
    v11->_tapGestureRecognizer = (UITapGestureRecognizer *)v13;

    [(SBFluidSwitcherItemContainerFooterView *)v11 addGestureRecognizer:v11->_tapGestureRecognizer];
    uint64_t v15 = +[SBMedusaDomain rootSettings];
    settings = v11->_settings;
    v11->_settings = (SBMedusaSettings *)v15;

    [(PTSettings *)v11->_settings addKeyObserver:v11];
  }

  return v11;
}

- (void)dealloc
{
  [(PTSettings *)self->_settings removeKeyObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  [(SBFluidSwitcherItemContainerFooterView *)&v4 dealloc];
}

- (void)setFooterStyle:(unint64_t)a3
{
  if (self->_footerStyle != a3)
  {
    self->_footerStyle = a3;
    [(SBFluidSwitcherItemContainerFooterView *)self _updateIconViewsAndLabels];
  }
}

- (void)setTextAlpha:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_textAlpha = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = self->_titleLabels;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", a3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(BSUIEmojiLabelView *)self->_subtitleLabel setAlpha:a3];
  }
}

- (void)setIconAlignment:(unint64_t)a3
{
  if (self->_iconAlignment != a3)
  {
    self->_iconAlignment = a3;
    [(SBFluidSwitcherItemContainerFooterView *)self setNeedsLayout];
  }
}

- (void)setUniqueIconsOnly:(BOOL)a3
{
  if (self->_uniqueIconsOnly != a3)
  {
    self->_uniqueIconsOnldouble y = a3;
    [(SBFluidSwitcherItemContainerFooterView *)self _reloadVisibleTitleItems];
  }
}

- (void)setWantsIconPointerInteractions:(BOOL)a3
{
  if (self->_wantsIconPointerInteractions != a3)
  {
    self->_wantsIconPointerInteractions = a3;
    [(SBFluidSwitcherItemContainerFooterView *)self _updateIconPointerInteractions];
  }
}

- (void)setIconHitTestOutset:(double)a3
{
  if (self->_iconHitTestOutset != a3)
  {
    self->_iconHitTestOutset = a3;
    [(SBFluidSwitcherItemContainerFooterView *)self setNeedsLayout];
  }
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  v5 = (NSArray *)[a3 copy];
  titleItems = self->_titleItems;
  self->_titleItems = v5;

  [(SBFluidSwitcherItemContainerFooterView *)self _reloadVisibleTitleItems];
}

- (CGSize)intrinsicContentSize
{
  v3 = (id *)MEMORY[0x1E4F43630];
  uint64_t v4 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  iconViews = self->_iconViews;
  if (v4 == 1) {
    [(NSMutableArray *)iconViews firstObject];
  }
  else {
  uint64_t v6 = [(NSMutableArray *)iconViews lastObject];
  }
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [*v3 userInterfaceLayoutDirection];
  titleLabels = self->_titleLabels;
  if (v11 == 1) {
    [(NSMutableArray *)titleLabels firstObject];
  }
  else {
  long long v13 = [(NSMutableArray *)titleLabels lastObject];
  }
  [v13 frame];
  double v15 = v14;
  double v17 = v16;

  uint64_t v18 = [*v3 userInterfaceLayoutDirection];
  v19 = self->_iconViews;
  if (v18 == 1) {
    [(NSMutableArray *)v19 lastObject];
  }
  else {
  v20 = [(NSMutableArray *)v19 firstObject];
  }
  [v20 frame];
  double v22 = v21;

  uint64_t v23 = [*v3 userInterfaceLayoutDirection];
  v24 = self->_titleLabels;
  if (v23 == 1) {
    [(NSMutableArray *)v24 lastObject];
  }
  else {
  v25 = [(NSMutableArray *)v24 firstObject];
  }
  [v25 frame];
  double v27 = v26;

  double v28 = v15 + v17;
  if (v8 + v10 >= v15 + v17) {
    double v28 = v8 + v10;
  }
  if (v22 >= v27) {
    double v29 = v27;
  }
  else {
    double v29 = v22;
  }
  double v30 = v28 - v29;
  unint64_t footerStyle = self->_footerStyle;
  double v32 = 36.0;
  if (footerStyle != 1) {
    double v32 = 30.0;
  }
  if (footerStyle == 2) {
    double v33 = 46.0;
  }
  else {
    double v33 = v32;
  }
  [(SBFluidSwitcherItemContainerFooterView *)self _maximumTitleLabelHeight];
  double v35 = v34 + v33;
  [(BSUIEmojiLabelView *)self->_subtitleLabel intrinsicContentSize];
  double v37 = v35 + v36;
  double v38 = v30;
  result.double height = v37;
  result.double width = v38;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  [(SBFluidSwitcherItemContainerFooterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  unint64_t footerStyle = self->_footerStyle;
  unint64_t v12 = footerStyle - 1;
  double v13 = 24.0;
  if (footerStyle == 1) {
    double v13 = 30.0;
  }
  if (footerStyle == 2) {
    double v14 = 40.0;
  }
  else {
    double v14 = v13;
  }
  double v15 = +[SBMedusaDomain rootSettings];
  [v15 switcherShelfSplitViewIconInset];
  double v94 = v16;

  double iconHitTestOutset = self->_iconHitTestOutset;
  uint64_t v17 = [(NSMutableArray *)self->_iconViews count];
  uint64_t v18 = v17;
  unint64_t iconAlignment = self->_iconAlignment;
  v20 = (id *)MEMORY[0x1E4F43630];
  double v101 = v8;
  CGFloat v102 = v6;
  double rect = v10;
  if (iconAlignment == 1)
  {
    uint64_t v29 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    CGFloat v30 = v4;
    CGFloat v31 = v6;
    CGFloat v32 = v8;
    CGFloat v33 = v10;
    if (v29 == 1) {
      double MinX = CGRectGetMaxX(*(CGRect *)&v30) - v14;
    }
    else {
      double MinX = CGRectGetMinX(*(CGRect *)&v30);
    }
  }
  else
  {
    double MinX = 0.0;
    if (!iconAlignment)
    {
      if (v12 > 1)
      {
        v110.origin.double x = v4;
        v110.origin.double y = v6;
        v110.size.double width = v8;
        v110.size.double height = v10;
        double v34 = CGRectGetWidth(v110) / (double)v17;
        double MinX = (v34 - v14) * 0.5;
        if ([*v20 userInterfaceLayoutDirection] == 1)
        {
          v111.origin.double x = v4;
          v111.origin.double y = v102;
          v111.size.double width = v8;
          v111.size.double height = v10;
          double MinX = MinX + CGRectGetMaxX(v111) - v34;
        }
      }
      else
      {
        double v22 = -(v94 - (double)v17 * (v14 + v94));
        v109.origin.double x = v4;
        v109.size.double width = v8;
        v109.origin.double y = v102;
        v109.size.double height = v10;
        double MidX = CGRectGetMidX(v109);
        uint64_t v24 = [*v20 userInterfaceLayoutDirection];
        double v25 = 0.5;
        if (v24 == 1) {
          double v25 = -0.5;
        }
        double v26 = MidX - v22 * v25;
        uint64_t v27 = [*v20 userInterfaceLayoutDirection];
        double v28 = 0.0;
        if (v27 == 1) {
          double v28 = v14;
        }
        double MinX = v26 - v28;
      }
    }
  }
  SBFluidSwitcherItemContainerFooterViewIconOffsetForFooterStyle(self->_footerStyle, self->_iconAlignment);
  double v36 = v35;
  double v38 = MinX + v37;
  unint64_t v39 = self->_iconAlignment;
  CGFloat v99 = v4;
  CGFloat v90 = v38;
  if ([(NSMutableArray *)self->_iconViews count])
  {
    unint64_t v40 = 0;
    if (v39) {
      BOOL v41 = 0;
    }
    else {
      BOOL v41 = v12 >= 2;
    }
    char v42 = !v41;
    double v43 = (double)v18;
    double v44 = *MEMORY[0x1E4F437F8];
    double v45 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v95 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v97 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v92 = v14;
    double v91 = v36;
    do
    {
      v46 = [(NSMutableArray *)self->_iconViews objectAtIndex:v40];
      [(SBFluidSwitcherItemContainerFooterView *)self _updateIconViewShadow:v46];
      objc_msgSend(v46, "setFrame:", v38, v36, v14, v14);
      uint64_t v47 = [*v20 userInterfaceLayoutDirection];
      if (v42)
      {
        v112.origin.double x = v38;
        v112.origin.double y = v36;
        v112.size.double width = v14;
        v112.size.double height = v14;
        double v48 = v94 + CGRectGetWidth(v112);
        if (v47 == 1) {
          double v49 = -v48;
        }
        else {
          double v49 = v48;
        }
        if (v12 > 1)
        {
          double v55 = v44;
          double v53 = v45;
          double v54 = v95;
          double v52 = v97;
        }
        else
        {
          if (v40) {
            double v50 = v94 * 0.5;
          }
          else {
            double v50 = iconHitTestOutset;
          }
          if (v40 == [(NSMutableArray *)self->_iconViews count] - 1) {
            double v51 = iconHitTestOutset;
          }
          else {
            double v51 = v94 * 0.5;
          }
          double v52 = -iconHitTestOutset;
          double v36 = v91;
          double v14 = v92;
          double v53 = -v50;
          CGFloat v4 = v99;
          double v54 = -v51;
          double v55 = -iconHitTestOutset;
        }
      }
      else
      {
        v113.origin.double x = v4;
        v113.size.double width = v101;
        v113.origin.double y = v102;
        v113.size.double height = rect;
        double Width = CGRectGetWidth(v113);
        if (v47 == 1) {
          double v57 = -Width;
        }
        else {
          double v57 = Width;
        }
        double v55 = v44;
        double v53 = v45;
        double v54 = v95;
        double v52 = v97;
        double v49 = v57 / v43;
      }
      double v38 = v38 + v49;
      objc_msgSend(v46, "setHitTestInsets:", v55, v53, v52, v54);

      ++v40;
    }
    while (v40 < [(NSMutableArray *)self->_iconViews count]);
  }
  uint64_t v58 = [(NSMutableArray *)self->_titleLabels count];
  v114.origin.double x = v4;
  v114.origin.double y = v102;
  v114.size.double width = v101;
  v114.size.double height = rect;
  double v98 = (double)v58;
  double v59 = CGRectGetWidth(v114) / (double)v58;
  v115.origin.double x = v4;
  v115.origin.double y = v102;
  v115.size.double width = v101;
  v115.size.double height = rect;
  double v96 = CGRectGetWidth(v115);
  v116.origin.double x = v4;
  v116.origin.double y = v102;
  v116.size.double width = v101;
  v116.size.double height = rect;
  double Height = CGRectGetHeight(v116);
  uint64_t v61 = [*v20 userInterfaceLayoutDirection];
  CGFloat v62 = v4;
  CGFloat v63 = v102;
  double v64 = v101;
  double v65 = rect;
  if (v61 == 1) {
    double v66 = CGRectGetMaxX(*(CGRect *)&v62) - v59;
  }
  else {
    double v66 = CGRectGetMinX(*(CGRect *)&v62);
  }
  v117.origin.double x = v90;
  v117.origin.double y = v36;
  v117.size.double width = v14;
  v117.size.double height = v14;
  double v67 = CGRectGetMaxY(v117) + 6.0;
  if ([(SBFluidSwitcherItemContainerFooterView *)self _hasTitleShadow]) {
    double v68 = v67 + -2.0;
  }
  else {
    double v68 = v67;
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v69 = self->_titleLabels;
  uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v103 objects:v107 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v104;
    double v73 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v104 != v72) {
          objc_enumerationMutation(v69);
        }
        v75 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        objc_msgSend(v75, "sizeThatFits:", v96 / v98 + -2.0, Height);
        double v77 = v76;
        double v79 = v78;
        if ([(NSMutableArray *)self->_titleLabels count] == 1) {
          double v77 = v77 + 12.0;
        }
        if ([(SBFluidSwitcherItemContainerFooterView *)self _hasTitleShadow]) {
          double v79 = v79 + 4.0;
        }
        objc_msgSend(v75, "setFrame:", v66 + (v59 - v77) * 0.5, v68, v77, v79);
        uint64_t v80 = [*v20 userInterfaceLayoutDirection];
        v118.origin.double x = v99;
        v118.size.double height = rect;
        v118.size.double width = v101;
        v118.origin.double y = v102;
        double v81 = CGRectGetWidth(v118);
        if (v80 == 1) {
          double v81 = -v81;
        }
        double v66 = v66 + v81 / v98;
        if (v73 < v79) {
          double v73 = v79;
        }
      }
      uint64_t v71 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v103 objects:v107 count:16];
    }
    while (v71);
  }
  else
  {
    double v73 = 0.0;
  }

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[BSUIEmojiLabelView sizeThatFits:](subtitleLabel, "sizeThatFits:", v101, rect);
    double v84 = v83;
    double v85 = v68 + v73;
    double v87 = v86 + 12.0;
    v88 = self->_subtitleLabel;
    v119.origin.double x = v99;
    v119.origin.double y = v102;
    v119.size.double width = v101;
    v119.size.double height = rect;
    double v89 = CGRectGetMinX(v119);
    v120.origin.double x = v99;
    v120.origin.double y = v102;
    v120.size.double width = v101;
    v120.size.double height = rect;
    -[BSUIEmojiLabelView setFrame:](v88, "setFrame:", v89 + (CGRectGetWidth(v120) - v87) * 0.5, v85, v87, v84);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  if (-[SBFluidSwitcherItemContainerFooterView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = [(NSMutableArray *)self->_iconViews count];
      BOOL v8 = v9 < v10;
      if (v9 >= v10) {
        break;
      }
      uint64_t v11 = [(NSMutableArray *)self->_iconViews objectAtIndex:v9];
      objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
      int v12 = objc_msgSend(v11, "pointInside:withEvent:", v7);
      ++v9;
    }
    while (!v12);
  }

  return v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3) {
    [(SBFluidSwitcherItemContainerFooterView *)self _updateLabels];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGFloat v6 = (void *)MEMORY[0x1E4F42CB0];
  id v7 = a3;
  [a5 rect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 view];

  [v16 hitTestInsets];
  double v21 = objc_msgSend(v6, "regionWithRect:identifier:", 0, v9 + v20, v11 + v17, v13 - (v20 + v18), v15 - (v17 + v19));

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  CGFloat v4 = [a3 view];
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  CGFloat v6 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v4 parameters:v5];
  id v7 = [MEMORY[0x1E4F42CA8] effectWithPreview:v6];
  double v8 = [MEMORY[0x1E4F42CC0] styleWithEffect:v7 shape:0];

  return v8;
}

- (void)_reloadVisibleTitleItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_uniqueIconsOnly)
  {
    double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_titleItems, "count"));
    CGFloat v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_titleItems, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_titleItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v11 = objc_msgSend(v10, "displayItem", (void)v13);
          double v12 = [v11 bundleIdentifier];

          if (([v3 containsObject:v12] & 1) == 0)
          {
            [(NSArray *)v4 addObject:v10];
            [v3 addObject:v12];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    CGFloat v4 = self->_titleItems;
  }
  if (-[NSArray isEqualToArray:](self->_visibleTitleItems, "isEqualToArray:", v4, (void)v13))
  {
    [(SBFluidSwitcherItemContainerFooterView *)self _updateSubtitleLabel];
  }
  else
  {
    objc_storeStrong((id *)&self->_visibleTitleItems, v4);
    [(SBFluidSwitcherItemContainerFooterView *)self _updateIconViewsAndLabels];
  }
}

- (void)_updateIconViewsAndLabels
{
  iconViews = self->_iconViews;
  if (!iconViews)
  {
    CGFloat v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
    id v5 = self->_iconViews;
    self->_iconViews = v4;

    iconViews = self->_iconViews;
  }
  uint64_t v6 = [(NSMutableArray *)iconViews count];
  uint64_t v7 = v6 - [(NSArray *)self->_visibleTitleItems count];
  if (v7 < 1)
  {
    if (v7 < 0)
    {
      if (-v7 > 1) {
        uint64_t v10 = -v7;
      }
      else {
        uint64_t v10 = 1;
      }
      do
      {
        double v11 = [(SBFluidSwitcherItemContainerFooterView *)self _makeIconView];
        [(SBFluidSwitcherItemContainerFooterView *)self addSubview:v11];
        [(NSMutableArray *)self->_iconViews addObject:v11];

        --v10;
      }
      while (v10);
    }
  }
  else
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      double v9 = [(NSMutableArray *)self->_iconViews objectAtIndex:[(NSArray *)self->_visibleTitleItems count] + i];
      [v9 removeFromSuperview];
    }
    -[NSMutableArray removeObjectsInRange:](self->_iconViews, "removeObjectsInRange:", [(NSArray *)self->_visibleTitleItems count], v7);
  }
  if (!self->_titleLabels)
  {
    double v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
    titleLabels = self->_titleLabels;
    self->_titleLabels = v12;
  }
  unint64_t footerStyle = self->_footerStyle;
  if (footerStyle) {
    NSUInteger v15 = 1;
  }
  else {
    NSUInteger v15 = [(NSArray *)self->_visibleTitleItems count];
  }
  uint64_t v16 = [(NSMutableArray *)self->_titleLabels count];
  NSUInteger v17 = v16 - v15;
  if ((uint64_t)(v16 - v15) < 1)
  {
    if ((v17 & 0x8000000000000000) != 0)
    {
      if ((uint64_t)(v15 - v16) > 1) {
        uint64_t v22 = v15 - v16;
      }
      else {
        uint64_t v22 = 1;
      }
      do
      {
        uint64_t v23 = [(SBFluidSwitcherItemContainerFooterView *)self _makeLabel];
        [(SBFluidSwitcherItemContainerFooterView *)self addSubview:v23];
        [(NSMutableArray *)self->_titleLabels addObject:v23];

        --v22;
      }
      while (v22);
    }
  }
  else
  {
    uint64_t v18 = v16;
    unint64_t v19 = footerStyle;
    NSUInteger v20 = v15;
    do
    {
      double v21 = [(NSMutableArray *)self->_titleLabels objectAtIndex:v20];
      [v21 removeFromSuperview];

      ++v20;
    }
    while (v18 != v20);
    -[NSMutableArray removeObjectsInRange:](self->_titleLabels, "removeObjectsInRange:", v15, v17);
    unint64_t footerStyle = v19;
  }
  id v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
  if ([(NSArray *)self->_visibleTitleItems count])
  {
    unint64_t v24 = 0;
    do
    {
      double v25 = [(NSArray *)self->_visibleTitleItems objectAtIndex:v24];
      double v26 = [(NSMutableArray *)self->_iconViews objectAtIndex:v24];
      uint64_t v27 = [v25 image];
      [v26 setImage:v27];

      if (footerStyle)
      {
        double v28 = [v25 titleText];
        if (![(SBFluidSwitcherItemContainerFooterView *)self _isTextEffectivelyEmpty:v28]) {
          [v35 addObject:v28];
        }
      }
      else
      {
        double v28 = [(NSMutableArray *)self->_titleLabels objectAtIndex:v24];
        uint64_t v29 = [v25 subtitleText];
        if ([(SBFluidSwitcherItemContainerFooterView *)self _isTextEffectivelyEmpty:v29])
        {
          uint64_t v30 = [v25 titleText];

          uint64_t v29 = (void *)v30;
        }
        CGFloat v31 = [(SBFluidSwitcherItemContainerFooterView *)self _attributedTextFromText:v29];
        [v28 setAttributedText:v31];

        unint64_t footerStyle = 0;
      }

      ++v24;
    }
    while (v24 < [(NSArray *)self->_visibleTitleItems count]);
  }
  if (footerStyle)
  {
    CGFloat v32 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v35];
    CGFloat v33 = [(NSMutableArray *)self->_titleLabels firstObject];
    double v34 = [(SBFluidSwitcherItemContainerFooterView *)self _attributedTextFromText:v32];
    [v33 setAttributedText:v34];
  }
  [(SBFluidSwitcherItemContainerFooterView *)self _updateSubtitleLabel];
  [(SBFluidSwitcherItemContainerFooterView *)self setNeedsLayout];
}

- (void)_updateSubtitleLabel
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CGFloat v4 = self->_titleItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "subtitleText", (void)v20);
        if (![(SBFluidSwitcherItemContainerFooterView *)self _isTextEffectivelyEmpty:v9]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  subtitleLabel = self->_subtitleLabel;
  if (self->_footerStyle - 1 <= 1)
  {
    if (!subtitleLabel)
    {
      double v11 = [(SBFluidSwitcherItemContainerFooterView *)self _makeSubtitleLabel];
      double v12 = self->_subtitleLabel;
      self->_subtitleLabel = v11;

      [(SBFluidSwitcherItemContainerFooterView *)self addSubview:self->_subtitleLabel];
    }
    long long v13 = objc_msgSend(MEMORY[0x1E4F28DF8], "localizedStringByJoiningStrings:", v3, (void)v20);
    [(BSUIEmojiLabelView *)self->_subtitleLabel setText:v13];
    long long v14 = [(NSArray *)self->_titleItems firstObject];
    int64_t v15 = [v14 subtitleInterfaceStyle];

    if (v15) {
      BOOL v16 = self->_subtitleStylingUserInterfaceStyle == v15;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      self->_subtitleStylingUserInterfaceStyle = v15;
      NSUInteger v17 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:53 category:2 andUserInterfaceStyle:v15];
      uint64_t v18 = [v17 _visualStylingForStyle:0];
      [(BSUIEmojiLabelView *)self->_subtitleLabel mt_replaceVisualStyling:v18];
      [(BSUIEmojiLabelView *)self->_subtitleLabel setAlpha:self->_textAlpha];
      unint64_t v19 = [(BSUIEmojiLabelView *)self->_subtitleLabel contentLabel];
      [v18 alpha];
      objc_msgSend(v19, "setAlpha:");
    }
    [(SBFluidSwitcherItemContainerFooterView *)self setNeedsLayout];
    goto LABEL_21;
  }
  if (subtitleLabel)
  {
    [(BSUIEmojiLabelView *)subtitleLabel removeFromSuperview];
    long long v13 = self->_subtitleLabel;
    self->_subtitleLabel = 0;
LABEL_21:
  }
}

- (id)_attributedTextFromText:(id)a3
{
  CGFloat v4 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v5 = *MEMORY[0x1E4F43888];
  double v6 = *MEMORY[0x1E4F43930];
  id v7 = a3;
  uint64_t v8 = [v4 _preferredFontForTextStyle:v5 addingSymbolicTraits:0x8000 weight:v6];
  [v8 pointSize];
  uint64_t v10 = objc_msgSend(v8, "fontWithSize:", fmin(fmax(v9, 13.0), 16.0));

  id v11 = objc_alloc_init(MEMORY[0x1E4F42670]);
  [v11 setAlignment:1];
  [v11 setAllowsDefaultTighteningForTruncation:1];
  [v11 setLineBreakMode:4];
  [v11 setLineBreakStrategy:0xFFFFLL];
  [(SBMedusaSettings *)self->_settings switcherShelfLabelLineSpacing];
  objc_msgSend(v11, "setLineSpacing:");
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v10 forKey:*MEMORY[0x1E4F42508]];
  [v12 setObject:v11 forKey:*MEMORY[0x1E4F42540]];
  if ([(SBFluidSwitcherItemContainerFooterView *)self _hasTitleShadow])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F42680]);
    long long v14 = [MEMORY[0x1E4F428B8] blackColor];
    int64_t v15 = [v14 colorWithAlphaComponent:0.52];
    [v13 setShadowColor:v15];

    [v13 setShadowBlurRadius:3.0];
    objc_msgSend(v13, "setShadowOffset:", 0.0, 0.5);
    [v12 setObject:v13 forKey:*MEMORY[0x1E4F42560]];
  }
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];

  return v16;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  unint64_t footerStyle = self->_footerStyle;
  [a3 locationInView:self];
  double v7 = v6;
  if (footerStyle)
  {
    double v8 = v5;
    if ([(NSArray *)self->_visibleTitleItems count])
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = [(NSMutableArray *)self->_iconViews objectAtIndex:v9];
        objc_msgSend(v10, "convertPoint:fromView:", self, v7, v8);
        if (objc_msgSend(v10, "pointInside:withEvent:", 0)) {
          break;
        }

        if (++v9 >= [(NSArray *)self->_visibleTitleItems count]) {
          return;
        }
      }
      id v15 = [(NSArray *)self->_visibleTitleItems objectAtIndex:v9];

      uint64_t v13 = (uint64_t)v15;
      if (v15) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    [(SBFluidSwitcherItemContainerFooterView *)self bounds];
    double Width = CGRectGetWidth(v18);
    NSUInteger v12 = (uint64_t)(v7 / (Width / (double)[(NSArray *)self->_visibleTitleItems count]));
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      NSUInteger v12 = [(NSArray *)self->_visibleTitleItems count] + ~v12;
    }
    if ((v12 & 0x8000000000000000) == 0 && v12 < [(NSArray *)self->_visibleTitleItems count])
    {
      uint64_t v13 = [(NSArray *)self->_visibleTitleItems objectAtIndex:v12];
      if (v13)
      {
LABEL_14:
        id v16 = (id)v13;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained itemContainerFooterView:self didSelectTitleItem:v16];
      }
    }
  }
}

- (id)_makeIconView
{
  double v3 = objc_alloc_init(SBFluidSwitcherIconImageContainerView);
  CGFloat v4 = [(SBFluidSwitcherIconImageContainerView *)v3 layer];
  id v5 = [MEMORY[0x1E4F428B8] systemBlackColor];
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  [v4 setShadowPathIsBounds:1];
  [(SBFluidSwitcherItemContainerFooterView *)self _updateIconViewShadow:v3];
  if (self->_wantsIconPointerInteractions)
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
    [(SBFluidSwitcherIconImageContainerView *)v3 addInteraction:v6];
  }
  return v3;
}

- (void)_updateIconViewShadow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 layer];
  double v6 = 4.0;
  if (self->_footerStyle - 1 >= 2) {
    double v6 = -1.0;
  }
  id v10 = v5;
  objc_msgSend(v5, "setShadowOffset:", 0.0, v6);
  double v7 = [v4 image];

  if (v7) {
    LODWORD(v8) = dword_1D8FD13D0[self->_footerStyle - 1 < 2];
  }
  else {
    double v8 = 0.0;
  }
  [v10 setShadowOpacity:v8];

  double v9 = 6.0;
  if (self->_footerStyle - 1 < 2) {
    double v9 = 12.0;
  }
  [v10 setShadowRadius:v9];
}

- (id)_makeLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v3 setNumberOfLines:2];
  [v3 setText:&stru_1F3084718];
  id v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v3 setTextColor:v4];

  [v3 setAlpha:self->_textAlpha];
  [v3 setSizingRule:1];
  id v5 = [v3 layer];
  id v6 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

- (id)_makeSubtitleLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F8B0]);
  id v4 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43888] addingSymbolicTraits:0x8000 weight:*MEMORY[0x1E4F43928]];
  [v4 pointSize];
  id v6 = objc_msgSend(v4, "fontWithSize:", fmin(fmax(v5, 13.0), 16.0));

  [v3 setFont:v6];
  [v3 setTextAlignment:1];
  [v3 setLineBreakMode:4];
  [v3 setUserInteractionEnabled:1];
  [v3 setNumberOfLines:2];
  [v3 setAlpha:self->_textAlpha];

  return v3;
}

- (void)_updateLabels
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_titleLabels;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "text", (void)v14);
        id v10 = [(SBFluidSwitcherItemContainerFooterView *)self _attributedTextFromText:v9];

        [v8 setAttributedText:v10];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    NSUInteger v12 = [(BSUIEmojiLabelView *)subtitleLabel text];
    if (v12)
    {
      uint64_t v13 = [(BSUIEmojiLabelView *)self->_subtitleLabel text];
    }
    else
    {
      uint64_t v13 = &stru_1F3084718;
    }

    [(BSUIEmojiLabelView *)self->_subtitleLabel setText:v13];
  }
  [(SBFluidSwitcherItemContainerFooterView *)self setNeedsLayout];
}

- (double)_maximumTitleLabelHeight
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_titleLabels;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "intrinsicContentSize", (void)v10);
        if (v6 < v8) {
          double v6 = v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)_isTextEffectivelyEmpty:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceCharacterSet];
  double v6 = [v4 stringByTrimmingCharactersInSet:v5];

  LOBYTE(v4) = [v6 length] == 0;
  return (char)v4;
}

- (BOOL)_hasTitleShadow
{
  return self->_footerStyle == 0;
}

- (void)_updateIconPointerInteractions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_wantsIconPointerInteractions)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v3 = self->_iconViews;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
          [v8 addInteraction:v9];
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v3 = self->_iconViews;
    uint64_t v10 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v3);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          uint64_t v15 = objc_msgSend(v14, "interactions", (void)v17);
          long long v16 = [v15 firstObject];

          [v14 removeInteraction:v16];
        }
        uint64_t v11 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }
  }
}

- (SBFluidSwitcherItemContainerFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherItemContainerFooterViewDelegate *)WeakRetained;
}

- (unint64_t)footerStyle
{
  return self->_footerStyle;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (BOOL)uniqueIconsOnly
{
  return self->_uniqueIconsOnly;
}

- (BOOL)wantsIconPointerInteractions
{
  return self->_wantsIconPointerInteractions;
}

- (double)iconHitTestOutset
{
  return self->_iconHitTestOutset;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visibleTitleItems, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabels, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
}

@end