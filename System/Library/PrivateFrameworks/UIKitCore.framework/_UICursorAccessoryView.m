@interface _UICursorAccessoryView
+ (CGSize)defaultItemSize;
+ (CGSize)largeItemSize;
+ (double)baseFontSize;
+ (double)glyphHeight;
+ (double)glyphWidth;
+ (double)grayscaleLuminance:(id)a3;
- (BOOL)_applyCornerMaskToSelf;
- (CGRect)_unionRectActiveItems;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessoryIdentifiers;
- (_UICursorAccessoryItemDataSource)dataSource;
- (_UICursorAccessoryView)initWithDataSource:(id)a3;
- (double)activeAccessoryXOffset;
- (id)_displayedItemViewAtIndex:(int64_t)a3;
- (void)_cleanupRemovedItemViews;
- (void)_didRecognizeAccessoryTapGestureRecognizer:(id)a3;
- (void)_ensureNumberOfReusableViews:(unint64_t)a3 inArray:(id)a4 ofClass:(Class)a5;
- (void)_layoutDisplayedAccessoryItemViews;
- (void)_layoutHighlightView;
- (void)_reloadAccessoryItemViews;
- (void)_scheduleRemovedItemViewCleanup;
- (void)layoutSubviews;
- (void)setAccessoryIdentifiers:(id)a3;
- (void)setAccessoryIdentifiers:(id)a3 animated:(BOOL)a4;
- (void)setDataSource:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _UICursorAccessoryView

- (_UICursorAccessoryView)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = +[UIBlurEffect effectWithStyle:9];
  v34.receiver = self;
  v34.super_class = (Class)_UICursorAccessoryView;
  v6 = [(UIVisualEffectView *)&v34 initWithEffect:v5];

  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v4);
    uint64_t v7 = [MEMORY[0x1E4F1C978] array];
    accessoryIdentifiers = v6->_accessoryIdentifiers;
    v6->_accessoryIdentifiers = (NSArray *)v7;

    v9 = [(UIView *)v6 layer];
    [v9 setMasksToBounds:0];

    id v10 = +[UIColor blackColor];
    uint64_t v11 = [v10 CGColor];
    v12 = [(UIView *)v6 layer];
    [v12 setShadowColor:v11];

    v13 = [(UIView *)v6 layer];
    objc_msgSend(v13, "setShadowOffset:", 0.0, 3.0);

    v14 = [(UIView *)v6 layer];
    LODWORD(v15) = 1043878380;
    [v14 setShadowOpacity:v15];

    v16 = [(UIView *)v6 layer];
    [v16 setShadowRadius:9.0];

    v17 = [(UIView *)v6 traitCollection];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if (v18 == 6)
    {
      v19 = [(UIVisualEffectView *)v6 contentView];
      objc_msgSend(v19, "sws_enablePlatter");

      v20 = [(UIView *)v6 layer];
      [v20 setZPosition:4.0];
    }
    else
    {
      v21 = [UIView alloc];
      uint64_t v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      activeHighlightBackgroundView = v6->_activeHighlightBackgroundView;
      v6->_activeHighlightBackgroundView = (UIView *)v22;

      v24 = [(UIView *)v6 tintColor];
      [(UIView *)v6->_activeHighlightBackgroundView setBackgroundColor:v24];

      [(UIView *)v6->_activeHighlightBackgroundView setUserInteractionEnabled:0];
      v20 = [(UIVisualEffectView *)v6 contentView];
      [v20 addSubview:v6->_activeHighlightBackgroundView];
    }

    v25 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    displayedIdentifiers = v6->_displayedIdentifiers;
    v6->_displayedIdentifiers = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemViewsByIdentifier = v6->_itemViewsByIdentifier;
    v6->_itemViewsByIdentifier = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dividerViews = v6->_dividerViews;
    v6->_dividerViews = v29;

    v31 = [[UITapGestureRecognizer alloc] initWithTarget:v6 action:sel__didRecognizeAccessoryTapGestureRecognizer_];
    accessoryItemTapGestureRecognizer = v6->_accessoryItemTapGestureRecognizer;
    v6->_accessoryItemTapGestureRecognizer = v31;

    [(UIView *)v6 addGestureRecognizer:v6->_accessoryItemTapGestureRecognizer];
  }

  return v6;
}

- (CGRect)_unionRectActiveItems
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v4 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = self->_displayedIdentifiers;
  uint64_t v8 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    double height = v5;
    double width = v6;
    double y = v3;
    double x = v4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v16 = -[NSMutableDictionary objectForKey:](self->_itemViewsByIdentifier, "objectForKey:", *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
        if ([v16 isActive])
        {
          if (([v16 collapsed] & 1) == 0)
          {
            [v16 frame];
            v42.origin.double x = v17;
            v42.origin.double y = v18;
            v42.size.double width = v19;
            v42.size.double height = v20;
            v36.origin.double x = x;
            v36.origin.double y = y;
            v36.size.double width = width;
            v36.size.double height = height;
            CGRect v37 = CGRectUnion(v36, v42);
            double x = v37.origin.x;
            double y = v37.origin.y;
            double width = v37.size.width;
            double height = v37.size.height;
          }
          [v16 frame];
          v43.origin.double x = v21;
          v43.origin.double y = v22;
          v43.size.double width = v23;
          v43.size.double height = v24;
          v38.origin.double x = v4;
          v38.origin.double y = v3;
          v38.size.double width = v6;
          v38.size.double height = v5;
          CGRect v39 = CGRectUnion(v38, v43);
          double v4 = v39.origin.x;
          double v3 = v39.origin.y;
          double v6 = v39.size.width;
          double v5 = v39.size.height;
        }
      }
      uint64_t v9 = [(NSMutableOrderedSet *)v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    double height = v5;
    double width = v6;
    double y = v3;
    double x = v4;
  }

  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  BOOL IsNull = CGRectIsNull(v40);
  if (IsNull) {
    double v26 = v4;
  }
  else {
    double v26 = x;
  }
  if (IsNull) {
    double v27 = v3;
  }
  else {
    double v27 = y;
  }
  if (IsNull) {
    double v28 = v6;
  }
  else {
    double v28 = width;
  }
  if (IsNull) {
    double v29 = v5;
  }
  else {
    double v29 = height;
  }
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (double)activeAccessoryXOffset
{
  double v3 = [(UIView *)self layer];
  int v4 = [v3 needsLayout];

  if (v4) {
    [(_UICursorAccessoryView *)self _layoutDisplayedAccessoryItemViews];
  }
  [(_UICursorAccessoryView *)self _unionRectActiveItems];
  double x = v11.origin.x;
  double width = v11.size.width;
  BOOL IsNull = CGRectIsNull(v11);
  double result = 0.0;
  if (!IsNull)
  {
    [(UIView *)self bounds];
    return v10 + v9 * 0.5 - (x + width * 0.5);
  }
  return result;
}

- (void)_ensureNumberOfReusableViews:(unint64_t)a3 inArray:(id)a4 ofClass:(Class)a5
{
  id v15 = a4;
  if ([v15 count] < a3)
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      v12 = objc_msgSend([a5 alloc], "initWithFrame:", v8, v9, v10, v11);
      [v15 addObject:v12];
      v13 = [(UIVisualEffectView *)self contentView];
      [v13 addSubview:v12];
    }
    while ([v15 count] < a3);
  }
  while ([v15 count] > a3)
  {
    v14 = [v15 lastObject];
    [v14 removeFromSuperview];
    [v15 removeObject:v14];
  }
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryView;
  id v4 = a3;
  [(UIView *)&v5 setTintColor:v4];
  -[UIView setBackgroundColor:](self->_activeHighlightBackgroundView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)_cleanupRemovedItemViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_displayedIdentifiers;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (![(NSArray *)self->_accessoryIdentifiers containsObject:v9])
        {
          double v10 = [(NSMutableDictionary *)self->_itemViewsByIdentifier objectForKey:v9];
          [v10 removeFromSuperview];

          [(NSMutableDictionary *)self->_itemViewsByIdentifier removeObjectForKey:v9];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(NSMutableOrderedSet *)self->_displayedIdentifiers removeObjectsInArray:v3];
}

- (void)_scheduleRemovedItemViewCleanup
{
}

- (void)_reloadAccessoryItemViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51___UICursorAccessoryView__reloadAccessoryItemViews__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)setAccessoryIdentifiers:(id)a3
{
}

- (void)setAccessoryIdentifiers:(id)a3 animated:(BOOL)a4
{
  BOOL v57 = a4;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(NSMutableOrderedSet *)self->_displayedIdentifiers array];
  v54 = v5;
  double v8 = [v5 differenceFromArray:v7];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v59 = v8;
  uint64_t v9 = [v8 removals];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v82 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * i), "object", v53);
        [v6 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v11);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = [v59 insertions];
  uint64_t v60 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
  v61 = self;
  v58 = v6;
  if (v60)
  {
    uint64_t v56 = *(void *)v78;
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v78 != v56) {
          objc_enumerationMutation(obj);
        }
        CGFloat v20 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        CGFloat v21 = objc_msgSend(v20, "object", v53);
        if ([v6 containsObject:v21]) {
          [v6 removeObject:v21];
        }
        CGFloat v22 = [(NSMutableDictionary *)self->_itemViewsByIdentifier objectForKey:v21];
        if (!v22)
        {
          CGFloat v22 = -[_UICursorAccessoryItemView initWithFrame:]([_UICursorAccessoryItemView alloc], "initWithFrame:", v15, v16, v17, v18);
          CGFloat v23 = [(UIVisualEffectView *)self contentView];
          [v23 addSubview:v22];

          [(NSMutableDictionary *)self->_itemViewsByIdentifier setObject:v22 forKey:v21];
        }
        unint64_t v24 = [v20 index];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v25 = [v59 removals];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v73 objects:v87 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v74 != v28) {
                objc_enumerationMutation(v25);
              }
              unint64_t v30 = [*(id *)(*((void *)&v73 + 1) + 8 * k) index];
              if (v30 < [v20 index]) {
                ++v24;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v73 objects:v87 count:16];
          }
          while (v27);
        }

        self = v61;
        unint64_t v31 = [(NSMutableOrderedSet *)v61->_displayedIdentifiers count];
        if (v31 >= v24) {
          unint64_t v32 = v24;
        }
        else {
          unint64_t v32 = v31;
        }
        [(NSMutableOrderedSet *)v61->_displayedIdentifiers insertObject:v21 atIndex:v32];
        if (v57) {
          [(_UICursorAccessoryItemView *)v22 setCollapsed:1];
        }

        uint64_t v6 = v58;
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
    }
    while (v60);
  }

  objc_storeStrong((id *)&self->_accessoryIdentifiers, v53);
  uint64_t v33 = [(NSMutableOrderedSet *)self->_displayedIdentifiers count];
  if (v33) {
    uint64_t v34 = v33 - 1;
  }
  else {
    uint64_t v34 = 0;
  }
  [(_UICursorAccessoryView *)self _ensureNumberOfReusableViews:v34 inArray:self->_dividerViews ofClass:objc_opt_class()];
  dividerViews = self->_dividerViews;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke;
  v72[3] = &unk_1E52DA8E8;
  v72[4] = self;
  [(NSMutableArray *)dividerViews enumerateObjectsUsingBlock:v72];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
  if (v57)
  {
    [(_UICursorAccessoryView *)self layoutSubviews];
    [(_UICursorAccessoryView *)self _reloadAccessoryItemViews];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    CGRect v36 = self->_displayedIdentifiers;
    uint64_t v37 = [(NSMutableOrderedSet *)v36 countByEnumeratingWithState:&v68 objects:v86 count:16];
    CGRect v38 = v54;
    if (v37)
    {
      uint64_t v39 = v37;
      char v40 = 0;
      uint64_t v41 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v69 != v41) {
            objc_enumerationMutation(v36);
          }
          CGRect v43 = *(void **)(*((void *)&v68 + 1) + 8 * m);
          v44 = -[NSMutableDictionary objectForKey:](v61->_itemViewsByIdentifier, "objectForKey:", v43, v53);
          [v44 setCollapsed:0];

          if (([v43 isEqualToString:@"dic"] & 1) != 0
            || [v43 isEqualToString:@"mod:2"])
          {
            char v40 = 1;
          }
        }
        uint64_t v39 = [(NSMutableOrderedSet *)v36 countByEnumeratingWithState:&v68 objects:v86 count:16];
      }
      while (v39);
    }
    else
    {
      char v40 = 0;
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v45 = v58;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v85 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v65;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v65 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = -[NSMutableDictionary objectForKey:](v61->_itemViewsByIdentifier, "objectForKey:", *(void *)(*((void *)&v64 + 1) + 8 * n), v53);
          [v50 setCollapsed:1];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v64 objects:v85 count:16];
      }
      while (v47);
    }

    if ([v54 count] == 1) {
      char v51 = 0;
    }
    else {
      char v51 = ([v54 count] != 2) | v40 ^ 1;
    }
    uint64_t v6 = v58;
    v61->_visionShouldColorSelectiouint64_t n = v51 & 1;
    v52 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.9, 0.2, v53);
    v62[4] = v61;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_2;
    v63[3] = &unk_1E52D9F70;
    v63[4] = v61;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __59___UICursorAccessoryView_setAccessoryIdentifiers_animated___block_invoke_3;
    v62[3] = &unk_1E52DA9D0;
    +[UIView _animateUsingSpringBehavior:v52 tracking:0 animations:v63 completion:v62];
  }
  else
  {
    [(_UICursorAccessoryView *)self _reloadAccessoryItemViews];
    [(_UICursorAccessoryView *)self _cleanupRemovedItemViews];
    CGRect v38 = v54;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSMutableDictionary *)self->_itemViewsByIdentifier allValues];
  if ([v6 count])
  {
    uint64_t v7 = [(UIView *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 6)
    {
      long long v37 = 0uLL;
      long long v38 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10)
      {
        int v11 = 0;
        uint64_t v12 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v9);
            }
            v11 += [*(id *)(*((void *)&v35 + 1) + 8 * i) collapsed];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v10);
        uint64_t v10 = v11;
      }

      double v14 = (double)(unint64_t)([v9 count] - v10) * 72.0 + 8.0;
      double v15 = 56.0;
    }
    else
    {
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
        double v20 = 0.0;
        double v14 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v16);
            }
            CGFloat v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if ((objc_msgSend(v22, "collapsed", (void)v31) & 1) == 0)
            {
              objc_msgSend(v22, "sizeThatFits:", width, height);
              double v24 = v23;
              double v26 = v14 + v25;
              [v22 horizontalPadding];
              double v14 = v26 + v27 + v27;
              if (v24 >= v20) {
                double v20 = v24;
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v18);
      }
      else
      {
        double v20 = 0.0;
        double v14 = 0.0;
      }

      [(id)objc_opt_class() defaultItemSize];
      if (v28 >= v20) {
        double v15 = v28;
      }
      else {
        double v15 = v20;
      }
    }
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v29 = v14;
  double v30 = v15;
  result.double height = v30;
  result.double width = v29;
  return result;
}

- (id)_displayedItemViewAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(NSMutableOrderedSet *)self->_displayedIdentifiers count] - 1 < (unint64_t)a3)
  {
    id v5 = 0;
  }
  else
  {
    itemViewsByIdentifier = self->_itemViewsByIdentifier;
    uint64_t v7 = [(NSMutableOrderedSet *)self->_displayedIdentifiers objectAtIndex:a3];
    id v5 = [(NSMutableDictionary *)itemViewsByIdentifier objectForKey:v7];
  }
  return v5;
}

- (void)_layoutDisplayedAccessoryItemViews
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6) {
    v19[3] = 0x4010000000000000;
  }
  [(UIView *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  long long v13 = [(UIView *)self traitCollection];
  BOOL v14 = [v13 layoutDirection] == 1;

  displayedIdentifiers = self->_displayedIdentifiers;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60___UICursorAccessoryView__layoutDisplayedAccessoryItemViews__block_invoke;
  v16[3] = &unk_1E5305B38;
  BOOL v17 = v14;
  v16[6] = v6;
  v16[7] = v8;
  v16[8] = v10;
  v16[9] = v12;
  v16[4] = self;
  v16[5] = &v18;
  [(NSMutableOrderedSet *)displayedIdentifiers enumerateObjectsUsingBlock:v16];
  _Block_object_dispose(&v18, 8);
}

- (void)_layoutHighlightView
{
  [(_UICursorAccessoryView *)self _unionRectActiveItems];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (CGRectIsNull(v12) || ![(NSArray *)self->_accessoryIdentifiers count])
  {
    activeHighlightBackgroundView = self->_activeHighlightBackgroundView;
    [(UIView *)activeHighlightBackgroundView setHidden:1];
  }
  else
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    CGFloat v7 = CGRectGetHeight(v13) * 0.5;
    [(UIView *)self->_activeHighlightBackgroundView setHidden:0];
    uint64_t v8 = [(UIView *)self->_activeHighlightBackgroundView layer];
    [v8 setCornerRadius:v7];

    uint64_t v9 = self->_activeHighlightBackgroundView;
    -[UIView setFrame:](v9, "setFrame:", x, y, width, height);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UICursorAccessoryView;
  [(UIVisualEffectView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  [(UIVisualEffectView *)self _setCornerRadius:CGRectGetHeight(v4) * 0.5];
  [(_UICursorAccessoryView *)self _layoutDisplayedAccessoryItemViews];
  [(_UICursorAccessoryView *)self _layoutHighlightView];
}

- (BOOL)_applyCornerMaskToSelf
{
  return 1;
}

- (void)_didRecognizeAccessoryTapGestureRecognizer:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [v4 locationInView:self];
    CGFloat v7 = v6;
    uint64_t v9 = v8;
    uint64_t v10 = [(UIView *)self traitCollection];
    BOOL v11 = [v10 userInterfaceIdiom] == 6;

    if (v11)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      CGRect v12 = self->_displayedIdentifiers;
      uint64_t v13 = [(NSMutableOrderedSet *)v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v24;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = [(NSMutableDictionary *)self->_itemViewsByIdentifier objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v15)];
            [v16 setSelected:0];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [(NSMutableOrderedSet *)v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }
    }
    itemViewsByIdentifier = self->_itemViewsByIdentifier;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69___UICursorAccessoryView__didRecognizeAccessoryTapGestureRecognizer___block_invoke;
    v19[3] = &unk_1E5305B60;
    objc_copyWeak(v22, &location);
    v22[1] = v7;
    v22[2] = v9;
    id v18 = WeakRetained;
    id v20 = v18;
    uint64_t v21 = self;
    [(NSMutableDictionary *)itemViewsByIdentifier enumerateKeysAndObjectsUsingBlock:v19];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

+ (double)baseFontSize
{
  if (qword_1EB25D548 != -1) {
    dispatch_once(&qword_1EB25D548, &__block_literal_global_491);
  }
  v2 = [(id)UIApp preferredContentSizeCategory];
  objc_super v3 = [(id)_MergedGlobals_7_5 objectForKeyedSubscript:v2];
  [v3 floatValue];
  double v5 = v4 + 17.0;

  return v5;
}

+ (double)glyphWidth
{
  [a1 defaultItemSize];
  return v2 + -20.0;
}

+ (double)glyphHeight
{
  [a1 defaultItemSize];
  return v2 + -8.0;
}

+ (CGSize)defaultItemSize
{
  if (qword_1EB25D560 != -1) {
    dispatch_once(&qword_1EB25D560, &__block_literal_global_34_3);
  }
  double v2 = [(id)UIApp preferredContentSizeCategory];
  objc_super v3 = [(id)qword_1EB25D550 objectForKeyedSubscript:v2];
  [v3 floatValue];
  double v5 = v4 + 37.0;

  uint64_t v6 = [(id)qword_1EB25D558 objectForKeyedSubscript:v2];
  [v6 floatValue];
  double v8 = v7 + 27.0;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)largeItemSize
{
  if (qword_1EB25D578 != -1) {
    dispatch_once(&qword_1EB25D578, &__block_literal_global_48_1);
  }
  double v2 = [(id)UIApp preferredContentSizeCategory];
  objc_super v3 = [(id)qword_1EB25D568 objectForKeyedSubscript:v2];
  [v3 floatValue];
  double v5 = (float)(v4 + 49.0);

  uint64_t v6 = [(id)qword_1EB25D570 objectForKeyedSubscript:v2];
  [v6 floatValue];
  double v8 = (float)(v7 + 33.0);

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (double)grayscaleLuminance:(id)a3
{
  double v4 = 0.0;
  [a3 getWhite:&v4 alpha:0];
  return v4;
}

- (_UICursorAccessoryItemDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (_UICursorAccessoryItemDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)accessoryIdentifiers
{
  return self->_accessoryIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifiers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_accessoryItemTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
  objc_storeStrong((id *)&self->_itemViewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeHighlightBackgroundView, 0);
}

@end