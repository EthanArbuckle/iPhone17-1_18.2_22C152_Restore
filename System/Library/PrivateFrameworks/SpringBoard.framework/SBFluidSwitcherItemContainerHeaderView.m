@interface SBFluidSwitcherItemContainerHeaderView
+ (double)distanceFromBoundingLeadingEdgeToIconTrailingEdge;
- (NSArray)titleItems;
- (SBFluidSwitcherItemContainerHeaderView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (SBFluidSwitcherItemContainerHeaderViewDelegate)delegate;
- (double)preferredHeaderHeight;
- (double)textAlpha;
- (id)_makeMultipleWindowsIndicatorView;
- (id)_multiWindowIndicatorAccessibilityIdentifierForDisplayItem:(id)a3;
- (id)_subtitleLabelFont;
- (id)_titleLabelFont;
- (void)_applyPrototypeSettings;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_updateTitleAlpha;
- (void)_updateVisualStylingWithTitleItems:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setTextAlpha:(double)a3;
- (void)setTitleItems:(id)a3;
- (void)setTitleItems:(id)a3 animated:(BOOL)a4;
@end

@implementation SBFluidSwitcherItemContainerHeaderView

- (SBFluidSwitcherItemContainerHeaderView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  v10 = -[SBFluidSwitcherItemContainerHeaderView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    v11->_textAlpha = 1.0;
    uint64_t v12 = objc_opt_new();
    itemsToTitleLabels = v11->_itemsToTitleLabels;
    v11->_itemsToTitleLabels = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    itemsToIconImageViews = v11->_itemsToIconImageViews;
    v11->_itemsToIconImageViews = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    itemsToSubtitleLabelViews = v11->_itemsToSubtitleLabelViews;
    v11->_itemsToSubtitleLabelViews = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    itemsToMultiWindowIndicatorViews = v11->_itemsToMultiWindowIndicatorViews;
    v11->_itemsToMultiWindowIndicatorViews = (NSMutableDictionary *)v18;

    v20 = +[SBAppSwitcherDomain rootSettings];
    [v20 addKeyObserver:v11];
    [(SBFluidSwitcherItemContainerHeaderView *)v11 _applyPrototypeSettings];
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v11 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4F43788] object:0];

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v11 action:sel__handleTapGestureRecognizer_];
    tapGestureRecognizer = v11->_tapGestureRecognizer;
    v11->_tapGestureRecognizer = (UITapGestureRecognizer *)v22;

    [(SBFluidSwitcherItemContainerHeaderView *)v11 addGestureRecognizer:v11->_tapGestureRecognizer];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  [(SBFluidSwitcherItemContainerHeaderView *)&v4 dealloc];
}

+ (double)distanceFromBoundingLeadingEdgeToIconTrailingEdge
{
  v2 = +[SBAppSwitcherDomain rootSettings];
  [v2 spacingBetweenLeadingEdgeAndIcon];
  double v4 = v3;
  [v2 iconSideLength];
  double v6 = v4 + v5;

  return v6;
}

- (double)preferredHeaderHeight
{
  return self->_spacingBetweenSnapshotAndIcon + self->_spacingBetweenSnapshotAndIcon + self->_iconSideLength;
}

- (void)setTitleItems:(id)a3
{
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  BOOL v89 = a4;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(NSArray *)self->_titleItems count])
  {
    v101 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    v101 = 0;
  }
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    v100 = 0;
  }
  else
  {
    v100 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  double v6 = self->_titleItems;
  v7 = (NSArray *)[v5 copy];
  titleItems = self->_titleItems;
  self->_titleItems = v7;

  if ([(NSArray *)self->_titleItems count])
  {
    v102 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    v102 = 0;
  }
  id v95 = v5;
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  v99 = [v102 displayItem];
  v94 = v9;
  v98 = [v9 displayItem];
  v93 = v6;
  v10 = [(NSArray *)v6 bs_map:&__block_literal_global_403];
  v11 = [(NSArray *)self->_titleItems bs_map:&__block_literal_global_11_5];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
  v103 = v11;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v106 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v105 + 1) + 8 * i);
        if (([v11 containsObject:v16] & 1) == 0)
        {
          v17 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v16];
          uint64_t v18 = v17;
          if (v17)
          {
            [v17 setHidden:1];
            [(NSMutableDictionary *)self->_itemsToTitleLabels removeObjectForKey:v16];
            titleLabelReusePool = self->_titleLabelReusePool;
            if (!titleLabelReusePool)
            {
              v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v21 = self->_titleLabelReusePool;
              self->_titleLabelReusePool = v20;

              titleLabelReusePool = self->_titleLabelReusePool;
            }
            [(NSMutableArray *)titleLabelReusePool addObject:v18];
          }
          uint64_t v22 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v16];
          v23 = v22;
          if (v22)
          {
            [v22 setHidden:1];
            [(NSMutableDictionary *)self->_itemsToIconImageViews removeObjectForKey:v16];
            iconImageViewReusePool = self->_iconImageViewReusePool;
            if (!iconImageViewReusePool)
            {
              objc_super v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v26 = self->_iconImageViewReusePool;
              self->_iconImageViewReusePool = v25;

              iconImageViewReusePool = self->_iconImageViewReusePool;
            }
            [(NSMutableArray *)iconImageViewReusePool addObject:v23];
          }
          v27 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v16];
          v28 = v27;
          if (v27)
          {
            [v27 setHidden:1];
            [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews removeObjectForKey:v16];
            subtitleLabelReusePool = self->_subtitleLabelReusePool;
            if (!subtitleLabelReusePool)
            {
              v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v31 = self->_subtitleLabelReusePool;
              self->_subtitleLabelReusePool = v30;

              subtitleLabelReusePool = self->_subtitleLabelReusePool;
            }
            [(NSMutableArray *)subtitleLabelReusePool addObject:v28];
          }
          v32 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v16];
          v33 = v32;
          if (v32)
          {
            [v32 setHidden:1];
            [v33 setAccessibilityIdentifier:0];
            [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews removeObjectForKey:v16];
            multiWindowIndicatorViewReusePool = self->_multiWindowIndicatorViewReusePool;
            if (!multiWindowIndicatorViewReusePool)
            {
              v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v36 = self->_multiWindowIndicatorViewReusePool;
              self->_multiWindowIndicatorViewReusePool = v35;

              multiWindowIndicatorViewReusePool = self->_multiWindowIndicatorViewReusePool;
            }
            [(NSMutableArray *)multiWindowIndicatorViewReusePool addObject:v33];
          }

          v11 = v103;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
    }
    while (v13);
  }

  v37 = v95;
  [(SBFluidSwitcherItemContainerHeaderView *)self _updateVisualStylingWithTitleItems:v95];
  if (v102)
  {
    v38 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v99];
    uint64_t v39 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v99];
    v40 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v99];
    v96 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v99];
    if (BSEqualObjects())
    {
      LOBYTE(v41) = 1;
      v42 = (void *)v39;
      v43 = v96;
    }
    else
    {
      v44 = [v102 image];

      if (v44)
      {
        v45 = v102;
        v42 = (void *)v39;
        if (!v38)
        {
          v38 = [(NSMutableArray *)self->_iconImageViewReusePool _sb_dequeue];
          if (!v38)
          {
            v46 = [SBFluidSwitcherIconImageContainerView alloc];
            v38 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](v46, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v38];
          }
          [(NSMutableDictionary *)self->_itemsToIconImageViews setObject:v38 forKey:v99];
        }
        [(SBFluidSwitcherIconImageContainerView *)v38 setHidden:0];
      }
      else
      {
        [(SBFluidSwitcherIconImageContainerView *)v38 setHidden:1];
        v45 = v102;
        v42 = (void *)v39;
      }
      v47 = [v45 titleText];
      uint64_t v48 = [v47 length];

      if (v48)
      {
        if (!v42)
        {
          v42 = [(NSMutableArray *)self->_titleLabelReusePool _sb_dequeue];
          if (!v42)
          {
            id v49 = objc_alloc(MEMORY[0x1E4F42B38]);
            v42 = objc_msgSend(v49, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            [v42 setClipsToBounds:0];
            [v42 setSizingRule:1];
            [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v42];
          }
          v50 = [(SBFluidSwitcherItemContainerHeaderView *)self _titleLabelFont];
          [v42 setFont:v50];

          [(NSMutableDictionary *)self->_itemsToTitleLabels setObject:v42 forKey:v99];
        }
        [v42 setAlpha:self->_textAlpha];
        v51 = v102;
        v52 = [v102 titleTextColor];
        [v42 setTextColor:v52];

        [v42 setHidden:0];
      }
      else
      {
        [v42 setHidden:1];
        v51 = v102;
      }
      v53 = [v51 subtitleText];
      uint64_t v54 = [v53 length];

      if (v54)
      {
        v55 = v102;
        if (!v40)
        {
          v40 = [(NSMutableArray *)self->_subtitleLabelReusePool _sb_dequeue];
          if (!v40)
          {
            id v56 = objc_alloc(MEMORY[0x1E4F4F8B0]);
            v40 = objc_msgSend(v56, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            [v40 setClipsToBounds:0];
            [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v40];
          }
          v57 = [(SBFluidSwitcherItemContainerHeaderView *)self _subtitleLabelFont];
          [v40 setFont:v57];

          [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews setObject:v40 forKey:v99];
          v55 = v102;
        }
        objc_msgSend(v40, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
        [v40 setAlpha:self->_textAlpha];
        [v40 setHidden:0];
      }
      else
      {
        [v40 setHidden:1];
        v55 = v102;
      }
      v43 = v96;
      if ([v55 showsMultiWindowIndicator])
      {
        if (!v96)
        {
          v43 = [(NSMutableArray *)self->_multiWindowIndicatorViewReusePool _sb_dequeue];
          if (!v43)
          {
            v43 = [(SBFluidSwitcherItemContainerHeaderView *)self _makeMultipleWindowsIndicatorView];
            [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v43];
          }
          [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews setObject:v43 forKey:v99];
        }
        objc_msgSend(v43, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
        v58 = [v55 displayItem];
        v59 = [(SBFluidSwitcherItemContainerHeaderView *)self _multiWindowIndicatorAccessibilityIdentifierForDisplayItem:v58];
        [v43 setAccessibilityIdentifier:v59];

        v55 = v102;
        [v43 setAlpha:self->_textAlpha];
        v60 = v43;
        uint64_t v61 = 0;
      }
      else
      {
        [v96 setAccessibilityIdentifier:0];
        v60 = v96;
        uint64_t v61 = 1;
      }
      [v60 setHidden:v61];
      [v55 image];
      v63 = v62 = v55;
      [(SBFluidSwitcherIconImageContainerView *)v38 setImage:v63 animated:v89];

      [(SBFluidSwitcherIconImageContainerView *)v38 sizeToFit];
      v64 = [v62 titleText];
      [v42 setText:v64];

      [v42 sizeToFit];
      uint64_t v41 = [v62 subtitleText];
      [v40 setText:v41];

      [v40 sizeToFit];
      LOBYTE(v41) = 0;
    }
  }
  else
  {
    uint64_t v41 = BSEqualObjects();
    v38 = 0;
    v42 = 0;
    v40 = 0;
    v43 = 0;
  }
  v90 = v40;
  v91 = v42;
  v92 = v38;
  v65 = v94;
  if (v94)
  {
    v97 = v43;
    v66 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v98];
    v67 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v98];
    v68 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v98];
    v69 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v98];
    if (BSEqualObjects())
    {
      v70 = v103;
      v37 = v95;
      goto LABEL_75;
    }
    v71 = [v94 image];

    if (v71)
    {
      if (!v66)
      {
        v66 = [(NSMutableArray *)self->_iconImageViewReusePool _sb_dequeue];
        if (!v66)
        {
          v72 = [SBFluidSwitcherIconImageContainerView alloc];
          v66 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](v72, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v66];
        }
        [(NSMutableDictionary *)self->_itemsToIconImageViews setObject:v66 forKey:v98];
      }
      v73 = v66;
      uint64_t v74 = 0;
    }
    else
    {
      v73 = v66;
      uint64_t v74 = 1;
    }
    [(SBFluidSwitcherIconImageContainerView *)v73 setHidden:v74];
    v75 = [v94 titleText];
    uint64_t v76 = [v75 length];

    if (v76)
    {
      if (!v67)
      {
        v67 = [(NSMutableArray *)self->_titleLabelReusePool _sb_dequeue];
        if (!v67)
        {
          id v77 = objc_alloc(MEMORY[0x1E4F42B38]);
          v67 = objc_msgSend(v77, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          [v67 setClipsToBounds:0];
          [v67 setSizingRule:1];
          [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v67];
        }
        v78 = [(SBFluidSwitcherItemContainerHeaderView *)self _titleLabelFont];
        [v67 setFont:v78];

        [(NSMutableDictionary *)self->_itemsToTitleLabels setObject:v67 forKey:v98];
      }
      v65 = v94;
      v79 = [v94 titleTextColor];
      [v67 setTextColor:v79];

      [v67 setAlpha:self->_textAlpha];
      [v67 setHidden:0];
    }
    else
    {
      [v67 setHidden:1];
      v65 = v94;
    }
    v80 = [v65 subtitleText];
    uint64_t v81 = [v80 length];

    v37 = v95;
    if (v81)
    {
      v43 = v97;
      if (!v68)
      {
        v68 = [(NSMutableArray *)self->_subtitleLabelReusePool _sb_dequeue];
        if (!v68)
        {
          id v82 = objc_alloc(MEMORY[0x1E4F4F8B0]);
          v68 = objc_msgSend(v82, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          [v68 setClipsToBounds:0];
          [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v68];
        }
        v83 = [(SBFluidSwitcherItemContainerHeaderView *)self _subtitleLabelFont];
        [v68 setFont:v83];

        [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews setObject:v68 forKey:v98];
      }
      objc_msgSend(v68, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
      [v68 setAlpha:self->_textAlpha];
      [v68 setHidden:0];
    }
    else
    {
      [v68 setHidden:1];
      v43 = v97;
    }
    v70 = v103;
    if ([v65 showsMultiWindowIndicator])
    {
      if (!v69)
      {
        v69 = [(NSMutableArray *)self->_multiWindowIndicatorViewReusePool _sb_dequeue];
        if (!v69)
        {
          v69 = [(SBFluidSwitcherItemContainerHeaderView *)self _makeMultipleWindowsIndicatorView];
          [(SBFluidSwitcherItemContainerHeaderView *)self addSubview:v69];
        }
        [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews setObject:v69 forKey:v98];
      }
      objc_msgSend(v69, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
      v84 = [v65 displayItem];
      v85 = [(SBFluidSwitcherItemContainerHeaderView *)self _multiWindowIndicatorAccessibilityIdentifierForDisplayItem:v84];
      [v69 setAccessibilityIdentifier:v85];

      [v69 setAlpha:self->_textAlpha];
      [v69 setHidden:0];
      v43 = v97;
    }
    else
    {
      [v69 setAccessibilityIdentifier:0];
      [v69 setHidden:1];
    }
    v86 = [v65 image];
    [(SBFluidSwitcherIconImageContainerView *)v66 setImage:v86 animated:v89];

    [(SBFluidSwitcherIconImageContainerView *)v66 sizeToFit];
    v87 = [v65 titleText];
    [v67 setText:v87];

    [v67 sizeToFit];
    v88 = [v65 subtitleText];
    [v68 setText:v88];

    [v68 sizeToFit];
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = v103;
    if (BSEqualObjects())
    {
LABEL_75:
      if (v41) {
        goto LABEL_107;
      }
    }
  }
  [(SBFluidSwitcherItemContainerHeaderView *)self setNeedsLayout];
LABEL_107:
}

uint64_t __65__SBFluidSwitcherItemContainerHeaderView_setTitleItems_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayItem];
}

uint64_t __65__SBFluidSwitcherItemContainerHeaderView_setTitleItems_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 displayItem];
}

- (void)setTextAlpha:(double)a3
{
  if (self->_textAlpha != a3)
  {
    self->_textAlpha = a3;
    [(SBFluidSwitcherItemContainerHeaderView *)self _updateTitleAlpha];
  }
}

- (void)layoutSubviews
{
  v193.receiver = self;
  v193.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  [(SBFluidSwitcherItemContainerHeaderView *)&v193 layoutSubviews];
  [(SBFluidSwitcherItemContainerHeaderView *)self bounds];
  CGFloat v185 = v3;
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if ([(NSArray *)self->_titleItems count])
  {
    v10 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    v10 = 0;
  }
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    v11 = 0;
  }
  else
  {
    v11 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  uint64_t v12 = [v10 displayItem];
  uint64_t v13 = [v11 displayItem];
  v150 = (void *)v12;
  if (v10)
  {
    v163 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v12];
    v175 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v12];
    uint64_t v14 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v12];
    v15 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v12];
  }
  else
  {
    v15 = 0;
    v175 = 0;
    v163 = 0;
    uint64_t v14 = 0;
  }
  v151 = v10;
  if (v11)
  {
    v162 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v13];
    uint64_t v16 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v13];
    v17 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v13];
    uint64_t v18 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v13];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    v162 = 0;
    v17 = 0;
  }
  if (v175)
  {
    v19 = v11;
    int v20 = [v175 isHidden] ^ 1;
    if (v14)
    {
LABEL_15:
      int v159 = [v14 isHidden] ^ 1;
      goto LABEL_18;
    }
  }
  else
  {
    v19 = v11;
    int v20 = 0;
    if (v14) {
      goto LABEL_15;
    }
  }
  int v159 = 0;
LABEL_18:
  v149 = (void *)v13;
  if (v16) {
    int v21 = [v16 isHidden] ^ 1;
  }
  else {
    int v21 = 0;
  }
  v164 = v16;
  if (v17) {
    int v160 = [v17 isHidden] ^ 1;
  }
  else {
    int v160 = 0;
  }
  uint64_t v22 = [(SBFluidSwitcherItemContainerHeaderView *)self traitCollection];
  [v22 displayScale];

  double iconSideLength = self->_iconSideLength;
  [v163 frame];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v194.origin.double x = v185;
    v194.origin.double y = v5;
    v194.size.double width = v7;
    v194.size.double height = v9;
    double Width = CGRectGetWidth(v194);
    v195.origin.double x = v24;
    v195.origin.double y = v26;
    v195.size.double width = iconSideLength;
    v195.size.double height = iconSideLength;
    double spacingBetweenLeadingEdgeAndIcon = Width - CGRectGetWidth(v195) - self->_spacingBetweenLeadingEdgeAndIcon;
  }
  else
  {
    double spacingBetweenLeadingEdgeAndIcon = self->_spacingBetweenLeadingEdgeAndIcon;
  }
  CGFloat rect = v5;
  CGFloat v178 = spacingBetweenLeadingEdgeAndIcon;
  [v162 frame];
  CGFloat v183 = v29;
  CGFloat v155 = v30;
  CGFloat v31 = *MEMORY[0x1E4F1DB28];
  CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v186 = v34;
  CGFloat v172 = v33;
  CGFloat v192 = v32;
  double v35 = *MEMORY[0x1E4F1DB28];
  CGFloat v188 = v33;
  if (v20)
  {
    objc_msgSend(v175, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    double v35 = v36;
    CGFloat v32 = v37;
    CGFloat v172 = v38;
    CGFloat v186 = v39;
    double v33 = v188;
  }
  CGFloat v180 = v34;
  double v40 = v33;
  CGFloat v179 = v192;
  CGFloat v157 = v31;
  if (v159)
  {
    objc_msgSend(v14, "sizeThatFits:", v7, v9, v33);
    SBRectWithSize();
    CGFloat v157 = v41;
    CGFloat v179 = v42;
    CGFloat v180 = v43;
    double v33 = v188;
  }
  CGFloat v166 = v40;
  CGFloat v152 = v35;
  double v181 = v34;
  CGFloat v174 = v33;
  CGFloat v176 = v192;
  CGFloat v182 = v31;
  v44 = v19;
  if (v15)
  {
    [v15 frame];
    CGFloat v182 = v45;
    CGFloat v176 = v46;
    CGFloat v174 = v47;
    double v181 = v48;
    double v33 = v188;
  }
  double v49 = v34;
  CGFloat v156 = v33;
  double v50 = v192;
  CGFloat v51 = v31;
  v52 = (id *)MEMORY[0x1E4F43630];
  if (v18)
  {
    [v18 frame];
    CGFloat v51 = v53;
    CGFloat v156 = v54;
    double v33 = v188;
  }
  CGFloat v147 = v50;
  CGFloat v148 = v49;
  CGFloat v189 = v34;
  CGFloat v190 = v33;
  CGFloat v171 = v192;
  CGFloat v187 = v31;
  if (v21)
  {
    objc_msgSend(v164, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    CGFloat v187 = v55;
    CGFloat v171 = v56;
    CGFloat v189 = v58;
    CGFloat v190 = v57;
  }
  if (v160)
  {
    objc_msgSend(v17, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    CGFloat v31 = v59;
    CGFloat v192 = v60;
    CGFloat v188 = v61;
    double v34 = v62;
  }
  v63 = [v14 font];
  v64 = v63;
  if (v63)
  {
    id v65 = v63;
  }
  else
  {
    id v65 = [v17 font];
  }
  v161 = v65;

  v196.origin.double x = v185;
  v196.origin.double y = rect;
  v196.size.double width = v7;
  v196.size.double height = v9;
  CGFloat v66 = CGRectGetWidth(v196) - self->_spacingBetweenLeadingEdgeAndIcon;
  double v67 = self->_iconSideLength;
  double spacingBetweenIconAndLabel = self->_spacingBetweenIconAndLabel;
  double v69 = v66 - v67 - spacingBetweenIconAndLabel;
  CGFloat v165 = v7;
  CGFloat v168 = v9;
  CGFloat v169 = v31;
  CGFloat v170 = v34;
  CGFloat v153 = v32;
  CGFloat v154 = v51;
  if (v44)
  {
    CGFloat v146 = v26;
    double v70 = v69
        - self->_spacingBetweenLabelAndSecondIcon
        - v67
        - spacingBetweenIconAndLabel
        - self->_spacingBetweenTrailingEdgeAndLabels;
    v197.origin.double y = v32;
    double v71 = self->_spacingBetweenLabelAndMultipleWindowsIndicator + self->_multipleWindowsIndicatorSideLength;
    v197.origin.double x = v152;
    v197.size.double width = v172;
    v197.size.double height = v186;
    double v72 = CGRectGetWidth(v197);
    double v73 = 0.0;
    if (v15) {
      double v74 = v71;
    }
    else {
      double v74 = 0.0;
    }
    double v75 = v72 + v74;
    v198.origin.double x = v157;
    v198.origin.double y = v179;
    v198.size.double height = v180;
    v198.size.double width = v166;
    double v76 = CGRectGetWidth(v198);
    if (v75 >= v76) {
      double v77 = v75;
    }
    else {
      double v77 = v76;
    }
    v199.origin.double x = v187;
    v199.origin.double y = v171;
    v199.size.double height = v189;
    v199.size.double width = v190;
    double v78 = CGRectGetWidth(v199);
    if (v18) {
      double v73 = v71;
    }
    double v79 = v73 + v78;
    v200.origin.double x = v31;
    v200.origin.double y = v192;
    v200.size.double width = v188;
    v200.size.double height = v170;
    double v80 = CGRectGetWidth(v200);
    if (v79 < v80) {
      double v79 = v80;
    }
    if (v77 + v79 > v70)
    {
      if (v77 >= v70 * 0.5)
      {
        CGFloat v95 = v165;
        CGFloat v82 = v152;
        if (v79 >= v70 * 0.5)
        {
          CGFloat v96 = v185;
          CGFloat v97 = rect;
          CGFloat v98 = v168;
          double v79 = CGRectGetWidth(*(CGRect *)(&v95 - 2)) * 0.5
              - self->_spacingBetweenBoundsCenterAndSecondIcon
              - self->_spacingBetweenIconAndLabel
              - self->_iconSideLength
              - self->_spacingBetweenTrailingEdgeAndLabels;
        }
        double v77 = v70 - v79;
        CGFloat v81 = v186;
        v52 = (id *)MEMORY[0x1E4F43630];
        goto LABEL_73;
      }
      double v79 = v70 - v77;
    }
    CGFloat v81 = v186;
    v52 = (id *)MEMORY[0x1E4F43630];
    CGFloat v82 = v152;
LABEL_73:
    v209.origin.double x = v82;
    v209.origin.double y = v153;
    v209.size.double width = v172;
    v209.size.double height = v81;
    double v99 = CGRectGetWidth(v209);
    double v100 = v77;
    if (v99 >= v77 - v74) {
      double v101 = v77 - v74;
    }
    else {
      double v101 = v99;
    }
    v210.origin.double x = v187;
    v210.origin.double y = v171;
    v210.size.double height = v189;
    v210.size.double width = v190;
    double v102 = CGRectGetWidth(v210);
    CGFloat v188 = v79;
    if (v102 >= v79 - v73) {
      double v102 = v79 - v73;
    }
    CGFloat v190 = v102;
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v211.origin.double x = v178;
      v211.origin.double y = v146;
      v211.size.double width = iconSideLength;
      v211.size.double height = iconSideLength;
      CGFloat v103 = CGRectGetMinX(v211) - self->_spacingBetweenIconAndLabel;
      v212.origin.double x = v82;
      v212.origin.double y = v153;
      double v104 = v101;
      v212.size.double width = v101;
      v212.size.double height = v81;
      double v105 = v103 - CGRectGetWidth(v212);
    }
    else
    {
      double v104 = v101;
      v213.origin.double x = v178;
      v213.origin.double y = v146;
      v213.size.double width = iconSideLength;
      v213.size.double height = iconSideLength;
      double v105 = CGRectGetMaxX(v213) + self->_spacingBetweenIconAndLabel;
    }
    CGFloat v173 = v105;
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v214.origin.double x = v178;
      v214.origin.double y = v146;
      v214.size.double width = iconSideLength;
      v214.size.double height = iconSideLength;
      CGFloat v106 = CGRectGetMinX(v214) - self->_spacingBetweenIconAndLabel;
      v215.origin.double x = v157;
      v215.origin.double y = v179;
      v215.size.double height = v180;
      v215.size.double width = v100;
      double v107 = v106 - CGRectGetWidth(v215);
    }
    else
    {
      v216.origin.double x = v178;
      v216.origin.double y = v146;
      v216.size.double width = iconSideLength;
      v216.size.double height = iconSideLength;
      double v107 = CGRectGetMaxX(v216) + self->_spacingBetweenIconAndLabel;
    }
    CGFloat v158 = v107;
    double v89 = v181;
    CGFloat v91 = v165;
    CGFloat v94 = v104;
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v217.origin.double x = v185;
      v217.origin.double y = rect;
      v217.size.double width = v165;
      v217.size.double height = v168;
      CGFloat v108 = CGRectGetWidth(v217)
           - self->_spacingBetweenLeadingEdgeAndIcon
           - self->_iconSideLength
           - self->_spacingBetweenIconAndLabel
           - v100
           - self->_spacingBetweenLabelAndSecondIcon;
      v218.origin.double x = v183;
      v218.origin.double y = v155;
      v218.size.double width = iconSideLength;
      v218.size.double height = iconSideLength;
      double v109 = v108 - CGRectGetWidth(v218);
    }
    else
    {
      double v109 = self->_spacingBetweenLabelAndSecondIcon
           + v100
           + self->_spacingBetweenLeadingEdgeAndIcon
           + self->_iconSideLength
           + self->_spacingBetweenIconAndLabel;
    }
    CGFloat v184 = v109;
    CGFloat v167 = v100;
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v219.origin.double x = v184;
      v219.origin.double y = v155;
      v219.size.double width = iconSideLength;
      v219.size.double height = iconSideLength;
      CGFloat v110 = CGRectGetMinX(v219) - self->_spacingBetweenIconAndLabel;
      v220.origin.double x = v187;
      v220.origin.double y = v171;
      v220.size.double height = v189;
      v220.size.double width = v190;
      double v90 = v110 - CGRectGetWidth(v220);
    }
    else
    {
      v221.origin.double x = v184;
      v221.origin.double y = v155;
      v221.size.double width = iconSideLength;
      v221.size.double height = iconSideLength;
      double v90 = CGRectGetMaxX(v221) + self->_spacingBetweenIconAndLabel;
    }
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v222.origin.double x = v184;
      v222.origin.double y = v155;
      v222.size.double width = iconSideLength;
      v222.size.double height = iconSideLength;
      CGFloat v111 = CGRectGetMinX(v222) - self->_spacingBetweenIconAndLabel;
      v223.origin.double x = v169;
      v223.size.double height = v170;
      v223.origin.double y = v192;
      v223.size.double width = v188;
      double v112 = v111 - CGRectGetWidth(v223);
    }
    else
    {
      v224.origin.double x = v184;
      v224.origin.double y = v155;
      v224.size.double width = iconSideLength;
      v224.size.double height = iconSideLength;
      double v112 = CGRectGetMaxX(v224) + self->_spacingBetweenIconAndLabel;
    }
    CGFloat v169 = v112;
    goto LABEL_94;
  }
  double v83 = v69 - self->_spacingBetweenTrailingEdgeAndLabels;
  double v84 = v83;
  if (v15) {
    double v84 = v83 - self->_spacingBetweenLabelAndMultipleWindowsIndicator - self->_multipleWindowsIndicatorSideLength;
  }
  v201.origin.double x = v152;
  v201.origin.double y = v32;
  v201.size.double width = v172;
  v201.size.double height = v186;
  double v85 = CGRectGetWidth(v201);
  if (v85 < v84) {
    double v84 = v85;
  }
  v202.origin.double x = v157;
  v202.origin.double y = v179;
  v202.size.double height = v180;
  v202.size.double width = v166;
  double v86 = CGRectGetWidth(v202);
  if (v86 >= v83) {
    double v86 = v83;
  }
  CGFloat v167 = v86;
  if ([*v52 userInterfaceLayoutDirection] == 1)
  {
    v203.origin.double x = v178;
    v203.origin.double y = v26;
    v203.size.double width = iconSideLength;
    v203.size.double height = iconSideLength;
    CGFloat v87 = CGRectGetMinX(v203) - self->_spacingBetweenIconAndLabel;
    v204.origin.double x = v152;
    v204.origin.double y = v32;
    v204.size.double width = v84;
    v204.size.double height = v186;
    double v88 = v87 - CGRectGetWidth(v204);
  }
  else
  {
    v205.origin.double x = v178;
    v205.origin.double y = v26;
    v205.size.double width = iconSideLength;
    v205.size.double height = iconSideLength;
    double v88 = CGRectGetMaxX(v205) + self->_spacingBetweenIconAndLabel;
  }
  CGFloat v173 = v88;
  double v89 = v181;
  double v90 = v187;
  CGFloat v91 = v7;
  if ([*v52 userInterfaceLayoutDirection] == 1)
  {
    v206.origin.double x = v178;
    v206.origin.double y = v26;
    v206.size.double width = iconSideLength;
    v206.size.double height = iconSideLength;
    CGFloat v92 = CGRectGetMinX(v206) - self->_spacingBetweenIconAndLabel;
    v207.origin.double x = v157;
    v207.origin.double y = v179;
    v207.size.double height = v180;
    v207.size.double width = v167;
    double v93 = v92 - CGRectGetWidth(v207);
  }
  else
  {
    v208.origin.double x = v178;
    v208.origin.double y = v26;
    v208.size.double width = iconSideLength;
    v208.size.double height = iconSideLength;
    double v93 = CGRectGetMaxX(v208) + self->_spacingBetweenIconAndLabel;
  }
  CGFloat v158 = v93;
  CGFloat v94 = v84;
LABEL_94:
  if (v159)
  {
    v113 = [v14 contentLabel];
    v225.origin.double x = v185;
    v225.origin.double y = rect;
    v225.size.double width = v91;
    v225.size.double height = v168;
    CGFloat v114 = CGRectGetMaxY(v225) - self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
    [v113 _firstLineBaseline];
    v226.origin.double y = v114 - v115;
    v226.origin.double x = v158;
    v226.size.double width = v167;
    v226.size.double height = v180;
    CGFloat v116 = v89;
    double MaxY = CGRectGetMaxY(v226);
    [v113 _baselineOffsetFromBottom];
    double v119 = MaxY - v118;
    [v161 _scaledValueForValue:self->_spacingBetweenTitleAndSubtitleBaseline];
    double v121 = v119 - v120;
    [v175 _firstLineBaseline];
    double v123 = v121 - v122;
    v52 = (id *)MEMORY[0x1E4F43630];
    [v175 _capOffsetFromBoundsTop];
  }
  else
  {
    CGFloat v116 = v89;
    v227.origin.double x = v185;
    v227.origin.double y = rect;
    v227.size.double width = v91;
    v227.size.double height = v168;
    CGRectGetMaxY(v227);
    UIRectCenteredYInRectScale();
    CGFloat v173 = v124;
    double v123 = v125;
    CGFloat v94 = v126;
    CGFloat v186 = v127;
  }
  double v128 = v154;
  if (v15)
  {
    if ([*v52 userInterfaceLayoutDirection] == 1)
    {
      v228.origin.double x = v173;
      v228.origin.double y = v123;
      v228.size.double width = v94;
      v228.size.double height = v186;
      CGRectGetMinX(v228);
      v229.origin.double x = v182;
      v229.origin.double y = v176;
      v229.size.double width = v174;
      v229.size.double height = v116;
      CGRectGetWidth(v229);
    }
    else
    {
      v230.origin.double x = v173;
      v230.origin.double y = v123;
      v230.size.double width = v94;
      v230.size.double height = v186;
      CGRectGetMaxX(v230);
    }
    UIRectCenteredYInRectScale();
    CGFloat v129 = v90;
    double v128 = v154;
  }
  else
  {
    CGFloat v129 = v90;
  }
  CGFloat v130 = v128;
  if (v160)
  {
    v131 = [v17 contentLabel];
    v231.origin.double x = v185;
    v231.origin.double y = rect;
    v231.size.double width = v165;
    v231.size.double height = v168;
    CGFloat v132 = CGRectGetMaxY(v231) - self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
    [v131 _firstLineBaseline];
    v232.origin.double y = v132 - v133;
    v232.origin.double x = v169;
    v232.size.double width = v188;
    v232.size.double height = v170;
    double v134 = CGRectGetMaxY(v232);
    [v131 _baselineOffsetFromBottom];
    double v136 = v134 - v135;
    [v161 _scaledValueForValue:self->_spacingBetweenTitleAndSubtitleBaseline];
    double v138 = v136 - v137;
    [v164 _firstLineBaseline];
    double v140 = v138 - v139;
    CGFloat v141 = v189;
  }
  else
  {
    v233.origin.double x = v185;
    v233.origin.double y = rect;
    v233.size.double width = v165;
    v233.size.double height = v168;
    CGRectGetMaxY(v233);
    UIRectCenteredYInRectScale();
    CGFloat v129 = v142;
    double v140 = v143;
    CGFloat v190 = v144;
    CGFloat v141 = v145;
  }
  if (v18)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v234.origin.double x = v129;
      v234.origin.double y = v140;
      v234.size.double width = v190;
      v234.size.double height = v141;
      CGRectGetMinX(v234);
      v235.origin.double x = v130;
      v235.origin.double y = v147;
      v235.size.double width = v156;
      v235.size.double height = v148;
      CGRectGetWidth(v235);
    }
    else
    {
      v236.origin.double x = v129;
      v236.origin.double y = v140;
      v236.size.double width = v190;
      v236.size.double height = v141;
      CGRectGetMaxX(v236);
    }
    UIRectCenteredYInRectScale();
  }
  UIRectIntegralWithScale();
  objc_msgSend(v163, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v175, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v14, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v15, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v18, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v162, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v164, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v17, "sb_setBoundsAndPositionFromFrame:");
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v13 = [(SBFluidSwitcherItemContainerHeaderView *)self _titleLabelFont];
  if ([(NSArray *)self->_titleItems count])
  {
    double v4 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    double v4 = 0;
  }
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    CGFloat v5 = 0;
  }
  else
  {
    CGFloat v5 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  double v6 = [v4 displayItem];
  double v7 = [v5 displayItem];
  if (v4)
  {
    double v8 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v6];
    uint64_t v9 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v6];
    if (v5)
    {
LABEL_9:
      v10 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v7];
      uint64_t v11 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v7];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = 0;
    double v8 = 0;
    if (v5) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = 0;
  v10 = 0;
LABEL_12:
  [v8 setFont:v13];
  [v8 sizeToFit];
  [v10 setFont:v13];
  [v10 sizeToFit];
  if (v9 | v11)
  {
    uint64_t v12 = [(SBFluidSwitcherItemContainerHeaderView *)self _subtitleLabelFont];
    [(id)v9 setFont:v12];
    [(id)v9 sizeToFit];
    [(id)v11 setFont:v12];
    [(id)v11 sizeToFit];
  }
  [(SBFluidSwitcherItemContainerHeaderView *)self setNeedsLayout];
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v49 = a3;
  if ([(NSArray *)self->_titleItems count])
  {
    double v4 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    double v4 = 0;
  }
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    double v50 = 0;
  }
  else
  {
    double v50 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  CGFloat v5 = [v4 displayItem];
  uint64_t v6 = [v50 displayItem];
  double v7 = (void *)v6;
  if (v5)
  {
    double v48 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v5];
    double v47 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v5];
    double v8 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v5];
    double v45 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v5];
    if (v7)
    {
LABEL_9:
      uint64_t v9 = [(NSMutableDictionary *)self->_itemsToIconImageViews objectForKey:v7];
      double v46 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v7];
      v10 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v7];
      uint64_t v11 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v7];
      goto LABEL_12;
    }
  }
  else
  {
    double v45 = 0;
    double v47 = 0;
    double v48 = 0;
    double v8 = 0;
    if (v6) {
      goto LABEL_9;
    }
  }
  uint64_t v11 = 0;
  double v46 = 0;
  uint64_t v9 = 0;
  v10 = 0;
LABEL_12:
  [v49 locationInView:self];
  double v13 = v12;
  double v15 = v14;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    if (v8) {
      uint64_t v16 = v8;
    }
    else {
      uint64_t v16 = v47;
    }
    [v16 frame];
    double MinX = CGRectGetMinX(v53);
    [v48 frame];
    double MaxX = CGRectGetMaxX(v54);
    if (v7) {
      double spacingBetweenTrailingEdgeAndLabels = self->_spacingBetweenLabelAndSecondIcon * 0.5;
    }
    else {
      double spacingBetweenTrailingEdgeAndLabels = self->_spacingBetweenTrailingEdgeAndLabels;
    }
    double spacingBetweenLeadingEdgeAndIcon = self->_spacingBetweenLeadingEdgeAndIcon;
    if (v10) {
      CGFloat v26 = v10;
    }
    else {
      CGFloat v26 = v46;
    }
    [v26 frame];
    double v30 = MaxX + spacingBetweenLeadingEdgeAndIcon;
    double v31 = MinX - spacingBetweenTrailingEdgeAndLabels;
    double v32 = CGRectGetMinX(v57) - self->_spacingBetweenTrailingEdgeAndLabels;
    [v9 frame];
    double v33 = CGRectGetMaxX(v58) + self->_spacingBetweenLabelAndSecondIcon * 0.5;
    if (!v7) {
      goto LABEL_37;
    }
  }
  else
  {
    double v44 = v15;
    [v48 frame];
    double v17 = CGRectGetMinX(v52);
    double v18 = self->_spacingBetweenLeadingEdgeAndIcon;
    if (v8) {
      v19 = v8;
    }
    else {
      v19 = v47;
    }
    [v19 frame];
    double v23 = CGRectGetMaxX(v55);
    if (v7) {
      double v24 = self->_spacingBetweenLabelAndSecondIcon * 0.5;
    }
    else {
      double v24 = self->_spacingBetweenTrailingEdgeAndLabels;
    }
    [v9 frame];
    double v27 = CGRectGetMinX(v56);
    double spacingBetweenLabelAndSecondIcon = self->_spacingBetweenLabelAndSecondIcon;
    if (v10) {
      double v29 = v10;
    }
    else {
      double v29 = v46;
    }
    [v29 frame];
    double v31 = v17 - v18;
    double v30 = v23 + v24;
    double v32 = v27 + spacingBetweenLabelAndSecondIcon * -0.5;
    double v33 = CGRectGetMaxX(v59) + self->_spacingBetweenTrailingEdgeAndLabels;
    double v15 = v44;
    if (!v7)
    {
LABEL_37:
      if (!v5) {
        goto LABEL_45;
      }
      BOOL v36 = v31 <= v13 && v13 < v30;
      double v34 = v4;
      if (!v36)
      {
        double v37 = -[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v13, v15);

        double v34 = v4;
        if (v37 != v45) {
          goto LABEL_45;
        }
      }
      goto LABEL_43;
    }
  }
  if (v32 > v13 || (double v34 = v50, v13 >= v33))
  {
    double v35 = -[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v13, v15);

    double v34 = v50;
    if (v35 != v11) {
      goto LABEL_37;
    }
  }
LABEL_43:
  id v38 = v34;
  if (v38)
  {
    double v39 = v38;
    double v40 = v9;
    double v41 = v4;
    double v42 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained itemContainerHeaderView:self didSelectTitleItem:v39];

    uint64_t v11 = v42;
    double v4 = v41;
    uint64_t v9 = v40;
  }
LABEL_45:
}

- (void)_updateVisualStylingWithTitleItems:(id)a3
{
  double v4 = [a3 firstObject];
  int64_t v5 = [v4 subtitleInterfaceStyle];

  if (self->_subtitleVisualStylingInterfaceStyle != v5)
  {
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (self->_subtitleVisualStyling) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
LABEL_9:
    self->_subtitleVisualStylingInterfaceStyle = v5;
    id v9 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:53 category:2 andUserInterfaceStyle:v5];
    double v7 = [v9 _visualStylingForStyle:0];
    subtitleVisualStyling = self->_subtitleVisualStyling;
    self->_subtitleVisualStyling = v7;

    [(SBFluidSwitcherItemContainerHeaderView *)self _updateTitleAlpha];
    [(SBFluidSwitcherItemContainerHeaderView *)self setNeedsLayout];
  }
}

- (id)_multiWindowIndicatorAccessibilityIdentifierForDisplayItem:(id)a3
{
  double v3 = NSString;
  id v4 = a3;
  int64_t v5 = [v4 bundleIdentifier];
  BOOL v6 = [v4 uniqueIdentifier];

  double v7 = [v3 stringWithFormat:@"multiple-windows-indicator:%@:%@", v5, v6];

  return v7;
}

- (void)_applyPrototypeSettings
{
  id v14 = +[SBAppSwitcherDomain rootSettings];
  [v14 spacingBetweenLeadingEdgeAndIcon];
  self->_double spacingBetweenLeadingEdgeAndIcon = v3;
  [v14 spacingBetweenTrailingEdgeAndLabels];
  self->_double spacingBetweenTrailingEdgeAndLabels = v4;
  [v14 iconSideLength];
  self->_double iconSideLength = v5;
  [v14 spacingBetweenSnapshotAndIcon];
  self->_spacingBetweenSnapshotAndIcon = v6;
  [v14 spacingBetweenSnapshotAndDescriptionLabelBaseline];
  self->_spacingBetweenSnapshotAndDescriptionLabelBaseline = v7;
  [v14 spacingBetweenTitleAndSubtitleBaseline];
  self->_spacingBetweenTitleAndSubtitleBaseline = v8;
  [v14 spacingBetweenIconAndLabel];
  self->_double spacingBetweenIconAndLabel = v9;
  [v14 spacingBetweenLabelAndMultipleWindowsIndicator];
  self->_spacingBetweenLabelAndMultipleWindowsIndicator = v10;
  [v14 multipleWindowsIndicatorSideLength];
  self->_multipleWindowsIndicatorSideLength = v11;
  [v14 spacingBetweenLabelAndSecondIcon];
  self->_double spacingBetweenLabelAndSecondIcon = v12;
  [v14 spacingBetweenBoundsCenterAndSecondIcon];
  self->_spacingBetweenBoundsCenterAndSecondIcon = v13;
}

- (id)_subtitleLabelFont
{
  return (id)[MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438C0] maximumContentSizeCategory:*MEMORY[0x1E4F43780]];
}

- (id)_titleLabelFont
{
  id v4 = (id)*MEMORY[0x1E4F438C0];
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_19;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v6) {
        goto LABEL_19;
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_18;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v10 = v9;
  double v11 = *(double *)(MEMORY[0x1E4FA6E50] + 136);
  if ((v8 & 1) == 0) {

  }
  if ((v6 & 1) == 0) {
  if (v10 >= v11)
  }
  {
    v2 = v4;
    id v4 = (id)*MEMORY[0x1E4F43870];
    goto LABEL_18;
  }
LABEL_19:
  double v12 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  uint64_t v13 = *MEMORY[0x1E4F43780];
  NSComparisonResult v14 = UIContentSizeCategoryCompareToCategory(v12, (UIContentSizeCategory)*MEMORY[0x1E4F43780]);

  double v15 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v16 = v15;
  if (v14 == NSOrderedDescending) {
    [v15 preferredFontForTextStyle:v4 hiFontStyle:4 contentSizeCategory:v13];
  }
  else {
  double v17 = [v15 preferredFontForTextStyle:v4 hiFontStyle:4];
  }

  return v17;
}

- (void)_updateTitleAlpha
{
  if ([(NSArray *)self->_titleItems count])
  {
    id v17 = [(NSArray *)self->_titleItems objectAtIndex:0];
  }
  else
  {
    id v17 = 0;
  }
  if ([(NSArray *)self->_titleItems count] < 2)
  {
    double v3 = 0;
  }
  else
  {
    double v3 = [(NSArray *)self->_titleItems objectAtIndex:1];
  }
  id v4 = [v17 displayItem];
  int v5 = [v3 displayItem];
  if (v17)
  {
    uint64_t v16 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v4];
    char v6 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v4];
    int v7 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v4];
  }
  else
  {
    int v7 = 0;
    uint64_t v16 = 0;
    char v6 = 0;
  }
  double v15 = v3;
  if (v3)
  {
    char v8 = [(NSMutableDictionary *)self->_itemsToTitleLabels objectForKey:v5];
    double v3 = [(NSMutableDictionary *)self->_itemsToSubtitleLabelViews objectForKey:v5];
    double v9 = [(NSMutableDictionary *)self->_itemsToMultiWindowIndicatorViews objectForKey:v5];
  }
  else
  {
    double v9 = 0;
    char v8 = 0;
  }
  [v16 setAlpha:self->_textAlpha];
  [v8 setAlpha:self->_textAlpha];
  [v7 setAlpha:self->_textAlpha];
  [v9 setAlpha:self->_textAlpha];
  subtitleVisualStyling = self->_subtitleVisualStyling;
  if (subtitleVisualStyling)
  {
    [(MTVisualStyling *)subtitleVisualStyling alpha];
    double v12 = v11;
  }
  else
  {
    double v12 = 1.0;
  }
  [v6 setAlpha:self->_textAlpha];
  uint64_t v13 = [v6 contentLabel];
  [v13 setAlpha:v12];

  [v3 setAlpha:self->_textAlpha];
  NSComparisonResult v14 = [v3 contentLabel];
  [v14 setAlpha:v12];
}

- (id)_makeMultipleWindowsIndicatorView
{
  v2 = objc_alloc_init(SBFluidSwitcherMultipleWindowsIndicatorView);
  [(SBFluidSwitcherMultipleWindowsIndicatorView *)v2 sizeToFit];
  return v2;
}

- (SBFluidSwitcherItemContainerHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherItemContainerHeaderViewDelegate *)WeakRetained;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_subtitleVisualStyling, 0);
  objc_storeStrong((id *)&self->_multiWindowIndicatorViewReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToMultiWindowIndicatorViews, 0);
  objc_storeStrong((id *)&self->_subtitleLabelReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToSubtitleLabelViews, 0);
  objc_storeStrong((id *)&self->_titleLabelReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToTitleLabels, 0);
  objc_storeStrong((id *)&self->_iconImageViewReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToIconImageViews, 0);
}

@end