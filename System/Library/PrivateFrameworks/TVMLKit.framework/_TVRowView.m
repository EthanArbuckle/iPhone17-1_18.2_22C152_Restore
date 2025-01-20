@interface _TVRowView
+ (CGRect)_boundingRectForComponents:(id)a3 interitemSpacing:(double)a4 boundingSize:(CGSize)a5 horizontalAlignment:(int64_t)a6 allowsOverflow:(BOOL)a7;
+ (CGRect)_leftAlignedFrameForComponent:(id)a3 previousComponent:(id)a4 interitemSpacing:(double)a5;
+ (void)_alignComponents:(id)a3 withLineSize:(CGSize)a4 boundingRect:(CGRect)a5 originYBump:(double)a6 verticalAlignment:(int64_t)a7 horizontalAlignment:(int64_t)a8;
- (BOOL)canBecomeFocused;
- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)allComponents;
- (NSArray)centerComponents;
- (NSArray)components;
- (NSArray)leftComponents;
- (NSArray)rightComponents;
- (UIView)lastFocusedView;
- (UIView)preferredFocusedComponent;
- (_TVRowView)initWithFrame:(CGRect)a3;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_alignmentFromView:(id)a3;
- (int64_t)contentVerticalAlignment;
- (void)_addSubview:(id)a3 maxViewWidth:(double)a4;
- (void)_lineUpComponents:(id)a3 alignment:(int64_t)a4 attribute:(int64_t)a5;
- (void)_resetSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setComponents:(id)a3;
- (void)setContentVerticalAlignment:(int64_t)a3;
- (void)setPreferredFocusedComponent:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _TVRowView

- (_TVRowView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVRowView;
  result = -[_TVFocusRedirectView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_contentVerticalAlignment = 2;
  }
  return result;
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  if (a3)
  {
    if (self->_contentVerticalAlignment != a3)
    {
      self->_contentVerticalAlignment = a3;
      [(_TVRowView *)self setNeedsLayout];
    }
  }
}

- (void)setComponents:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  location = (id *)&self->_components;
  id v42 = a3;
  if (objc_msgSend(*location, "isEqual:"))
  {
    [(_TVRowView *)self setNeedsLayout];
    goto LABEL_51;
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  p_lastFocusedView = (id *)&self->_lastFocusedView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);

  if (WeakRetained)
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __28___TVRowView_setComponents___block_invoke;
    v48[3] = &unk_264BA69F0;
    v48[4] = self;
    v48[5] = &v49;
    [v42 enumerateObjectsUsingBlock:v48];
    if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = *location;
      id v7 = objc_loadWeakRetained(p_lastFocusedView);
      uint64_t v8 = [v6 indexOfObject:v7];
      v50[3] = v8;
    }
  }
  objc_storeStrong(location, a3);
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  v43 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v42, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v42;
  id v12 = 0;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          int64_t v18 = [(_TVRowView *)self _alignmentFromView:v17];
          v19 = v9;
          if (v18 == 1 || (v19 = v10, v18 == 2))
          {
LABEL_16:
            objc_msgSend(v19, "addObject:", v17, p_lastFocusedView);
          }
          else if (v18 == 3)
          {
            v19 = v43;
            goto LABEL_16;
          }
          int v20 = objc_msgSend(v17, "canBecomeFocused", p_lastFocusedView);
          if (v12) {
            int v21 = 0;
          }
          else {
            int v21 = v20;
          }
          if (v21 == 1) {
            id v12 = v17;
          }

          continue;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v13);
  }

  uint64_t v22 = [v9 count];
  if (v22) {
    v23 = (void *)[v9 copy];
  }
  else {
    v23 = 0;
  }
  objc_storeStrong((id *)&self->_leftComponents, v23);
  if (v22) {

  }
  uint64_t v24 = objc_msgSend(v10, "count", p_lastFocusedView);
  if (v24) {
    v25 = (void *)[v10 copy];
  }
  else {
    v25 = 0;
  }
  objc_storeStrong((id *)&self->_centerComponents, v25);
  if (v24) {

  }
  uint64_t v26 = [v43 count];
  if (v26) {
    v27 = (void *)[v43 copy];
  }
  else {
    v27 = 0;
  }
  objc_storeStrong((id *)&self->_rightComponents, v27);
  if (v26) {

  }
  v28 = (void *)MEMORY[0x263EFF980];
  v29 = [(_TVRowView *)self leftComponents];
  v30 = [v28 arrayWithArray:v29];

  v31 = [(_TVRowView *)self centerComponents];
  [v30 addObjectsFromArray:v31];

  v32 = [(_TVRowView *)self rightComponents];
  [v30 addObjectsFromArray:v32];

  uint64_t v33 = [v30 count];
  if (v33) {
    v34 = (void *)[v30 copy];
  }
  else {
    v34 = 0;
  }
  objc_storeStrong((id *)&self->_allComponents, v34);
  if (v33) {

  }
  unint64_t v35 = v50[3];
  if (v35 == 0x7FFFFFFFFFFFFFFFLL
    || v35 >= [*location count]
    || ([*location objectAtIndexedSubscript:v50[3]],
        v36 = objc_claimAutoreleasedReturnValue(),
        int v37 = [v36 canBecomeFocused],
        v36,
        !v37))
  {
    objc_storeWeak(v40, v12);
  }
  else
  {
    v38 = [*location objectAtIndexedSubscript:v50[3]];
    objc_storeWeak(v40, v38);
  }
  [(_TVRowView *)self _resetSubviews];

  _Block_object_dispose(&v49, 8);
LABEL_51:
}

- (void)setPreferredFocusedComponent:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_preferredFocusedComponent, a3);
  id v5 = a3;
  if (a3)
  {
    objc_storeWeak((id *)&self->_lastFocusedView, a3);
    id v5 = a3;
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_components;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v10, "setHighlighted:", v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  p_lastFocusedView = &self->_lastFocusedView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_lastFocusedView);
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [a3 nextFocusedView];
  if ([v5 isDescendantOfView:self])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_allComponents;
    id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v5, "isDescendantOfView:", v10, (void)v11))
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_storeWeak((id *)&self->_lastFocusedView, v7);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_TVRowView _sizeThatFitsComponents:boundingSize:](self, "_sizeThatFitsComponents:boundingSize:", self->_allComponents, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)_TVRowView;
  [(_TVFocusRedirectView *)&v23 layoutSubviews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v3 = self->_allComponents;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        [(_TVRowView *)self bounds];
        [(_TVRowView *)self _addSubview:v8 maxViewWidth:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  v10 = [(_TVRowView *)self leftComponents];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    long long v12 = [(_TVRowView *)self leftComponents];
    [(_TVRowView *)self _lineUpComponents:v12 alignment:[(_TVRowView *)self contentVerticalAlignment] attribute:1];
  }
  long long v13 = [(_TVRowView *)self centerComponents];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [(_TVRowView *)self centerComponents];
    [(_TVRowView *)self _lineUpComponents:v15 alignment:[(_TVRowView *)self contentVerticalAlignment] attribute:9];
  }
  uint64_t v16 = [(_TVRowView *)self rightComponents];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    int64_t v18 = [(_TVRowView *)self rightComponents];
    [(_TVRowView *)self _lineUpComponents:v18 alignment:[(_TVRowView *)self contentVerticalAlignment] attribute:2];
  }
}

- (void)_lineUpComponents:(id)a3 alignment:(int64_t)a4 attribute:(int64_t)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([(_TVRowView *)self effectiveUserInterfaceLayoutDirection] != 1)
  {
    uint64_t v8 = [(_TVRowView *)self leftComponents];
    if ([v8 count])
    {
      double v9 = [(_TVRowView *)self rightComponents];
      goto LABEL_6;
    }
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [(_TVRowView *)self rightComponents];
  if (![v8 count]) {
    goto LABEL_8;
  }
  double v9 = [(_TVRowView *)self leftComponents];
LABEL_6:
  v10 = v9;
  if ([v9 count])
  {
    BOOL v11 = 0;
  }
  else
  {
    long long v12 = [(_TVRowView *)self centerComponents];
    BOOL v11 = [v12 count] == 0;
  }
LABEL_11:

  [(UIView *)self tv_interitemSpacing];
  double v80 = v13;
  uint64_t v14 = (CGFloat *)MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
  double height = *(double *)(MEMORY[0x263F001A8] + 24);
  v81 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v84 objects:v88 count:16];
  int64_t v18 = &stru_26E5657A8;
  if (v17)
  {
    uint64_t v19 = v17;
    id v20 = 0;
    CGFloat x = *v14;
    CGFloat y = v14[1];
    uint64_t v23 = *(void *)v85;
    double v73 = height;
    double v74 = v16;
    double v71 = y;
    double v72 = *v14;
    double v77 = 0.0;
    BOOL v76 = v11;
    do
    {
      uint64_t v24 = 0;
      uint64_t v78 = v19;
      do
      {
        if (*(void *)v85 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v84 + 1) + 8 * v24);
        [(id)objc_opt_class() _leftAlignedFrameForComponent:v25 previousComponent:v20 interitemSpacing:v80];
        double v27 = v26;
        CGFloat v82 = v29;
        CGFloat v83 = v28;
        double v31 = v30;
        objc_msgSend(v25, "tv_nonDirectionalMargin");
        double v33 = v32;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(_TVRowView *)self bounds];
          double v35 = v34;
          if (v11)
          {
            objc_msgSend(v25, "tv_margin");
            double v37 = v35 - v36;
            objc_msgSend(v25, "tv_margin");
            double v39 = v37 - v38;
          }
          else
          {
            v90.origin.CGFloat x = x;
            v90.origin.CGFloat y = y;
            v90.size.width = v16;
            v90.size.double height = height;
            double v39 = v35 - CGRectGetWidth(v90) - v27 - v33;
          }
          double v31 = fmin(v31, v39);
        }
        if (v20) {
          BOOL v40 = 0;
        }
        else {
          BOOL v40 = a5 == 9;
        }
        if (v40) {
          double v27 = 0.0;
        }
        if (v11)
        {
          int64_t v41 = a5;
          if (a5 == 9) {
            double v42 = 0.0;
          }
          else {
            double v42 = v33;
          }
          v91.origin.CGFloat x = x;
          v91.origin.CGFloat y = y;
          v91.size.width = v16;
          v91.size.double height = height;
          double Width = CGRectGetWidth(v91);
          v92.origin.CGFloat x = v27;
          v92.size.double height = v82;
          v92.origin.CGFloat y = v83;
          v92.size.width = v31;
          double v44 = ceil(v42 + Width + CGRectGetMaxX(v92));
          [(_TVRowView *)self bounds];
          double v46 = ceil(v45);
          uint64_t v47 = [v25 valueForTVViewStyle:@"tv-group"];
          v48 = (void *)v47;
          uint64_t v49 = &stru_26E5657A8;
          if (v47) {
            uint64_t v49 = (__CFString *)v47;
          }
          v50 = v49;

          char v51 = [(__CFString *)v18 isEqualToString:v50];
          if (v44 <= v46 && (v51 & 1) != 0)
          {
            int64_t v18 = v50;
            a5 = v41;
          }
          else
          {
            uint64_t v52 = objc_msgSend(v81, "lastObject", *(void *)&v71, *(void *)&v72, *(void *)&v73, *(void *)&v74);
            objc_msgSend(v52, "tv_nonDirectionalMargin");
            double v54 = v16 + v53;

            v55 = objc_opt_class();
            [(_TVRowView *)self bounds];
            objc_msgSend(v55, "_alignComponents:withLineSize:boundingRect:originYBump:verticalAlignment:horizontalAlignment:", v81, a4, v41, v54, height, v56, v57, v58, v59, v77);
            v93.origin.CGFloat x = x;
            v93.origin.CGFloat y = y;
            v93.size.width = v16;
            v93.size.double height = height;
            double v77 = v77 + CGRectGetHeight(v93);

            [v81 removeAllObjects];
            id v20 = 0;
            int64_t v18 = v50;
            a5 = v41;
            double v27 = 0.0;
            double height = v73;
            double v16 = v74;
            CGFloat y = v71;
            CGFloat x = v72;
          }
          uint64_t v19 = v78;
          BOOL v11 = v76;
        }
        v60 = v20;
        v94.origin.CGFloat x = x;
        v94.origin.CGFloat y = y;
        v94.size.width = v16;
        v94.size.double height = height;
        CGFloat v61 = v27 + CGRectGetWidth(v94);
        v95.origin.CGFloat x = x;
        v95.origin.CGFloat y = y;
        v95.size.width = v16;
        v95.size.double height = height;
        v98.origin.CGFloat x = v61;
        v98.origin.CGFloat y = v83;
        v98.size.width = v31;
        v98.size.double height = v82;
        CGRect v96 = CGRectUnion(v95, v98);
        CGFloat x = v96.origin.x;
        CGFloat y = v96.origin.y;
        double v16 = v96.size.width;
        double height = v96.size.height;
        v96.origin.CGFloat x = v61;
        v96.origin.CGFloat y = v83;
        v96.size.width = v31;
        v96.size.double height = v82;
        CGRect v97 = CGRectIntegral(v96);
        objc_msgSend(v25, "setFrame:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
        [v81 addObject:v25];
        id v20 = v25;

        ++v24;
      }
      while (v19 != v24);
      uint64_t v19 = [obj countByEnumeratingWithState:&v84 objects:v88 count:16];
    }
    while (v19);
  }
  else
  {
    id v20 = 0;
    double v77 = 0.0;
  }

  if (!v11)
  {
    [(_TVRowView *)self bounds];
    double height = v62;
  }
  v63 = objc_msgSend(v81, "lastObject", *(void *)&v71, *(void *)&v72, *(void *)&v73, *(void *)&v74);
  objc_msgSend(v63, "tv_nonDirectionalMargin");
  double v65 = v16 + v64;

  v66 = objc_opt_class();
  [(_TVRowView *)self bounds];
  objc_msgSend(v66, "_alignComponents:withLineSize:boundingRect:originYBump:verticalAlignment:horizontalAlignment:", v81, a4, a5, v65, height, v67, v68, v69, v70, v77);
}

- (CGSize)_sizeThatFitsComponents:(id)a3 boundingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v8 = *MEMORY[0x263F001A8];
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  [(UIView *)self tv_interitemSpacing];
  double v12 = v11;
  uint64_t v13 = [(_TVRowView *)self effectiveUserInterfaceLayoutDirection];
  if (v13 == 1)
  {
    uint64_t v14 = [(_TVRowView *)self rightComponents];
    if ([v14 count])
    {
      v15 = [(_TVRowView *)self leftComponents];
      if (![v15 count])
      {
        double v16 = [(_TVRowView *)self centerComponents];
        uint64_t v17 = [v16 count];

        if (!v17)
        {
          BOOL v18 = 1;
          uint64_t v19 = 1;
LABEL_14:
          uint64_t v23 = objc_opt_class();
          uint64_t v24 = [(_TVRowView *)self rightComponents];
          objc_msgSend(v23, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v24, 1, v19, v12, width, height);
          v84.origin.CGFloat x = v25;
          v84.origin.CGFloat y = v26;
          v84.size.double width = v27;
          v84.size.double height = v28;
          v73.origin.CGFloat x = v8;
          v73.origin.CGFloat y = v7;
          v73.size.double width = v10;
          v73.size.double height = v9;
          CGRect v74 = CGRectUnion(v73, v84);
          CGFloat x = v74.origin.x;
          CGFloat y = v74.origin.y;
          CGFloat v31 = v74.size.width;
          CGFloat v32 = v74.size.height;

          double v33 = objc_opt_class();
          double v34 = [(_TVRowView *)self leftComponents];
          objc_msgSend(v33, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v34, 3, v19, v12, width, height);
          uint64_t v36 = v35;
          uint64_t v38 = v37;
          uint64_t v40 = v39;
          uint64_t v42 = v41;
          goto LABEL_18;
        }
        goto LABEL_10;
      }
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v14 = [(_TVRowView *)self leftComponents];
  if (![v14 count]) {
    goto LABEL_9;
  }
  v15 = [(_TVRowView *)self rightComponents];
  if ([v15 count])
  {
LABEL_8:

    goto LABEL_9;
  }
  v43 = [(_TVRowView *)self centerComponents];
  uint64_t v44 = [v43 count];

  if (!v44)
  {
    BOOL v18 = 1;
    uint64_t v22 = 1;
    goto LABEL_17;
  }
LABEL_10:
  id v20 = [(_TVRowView *)self leftComponents];
  if ([v20 count])
  {
    BOOL v18 = 0;
  }
  else
  {
    long long v21 = [(_TVRowView *)self rightComponents];
    BOOL v18 = [v21 count] == 0;
  }
  uint64_t v19 = 0;
  uint64_t v22 = 0;
  if (v13 == 1) {
    goto LABEL_14;
  }
LABEL_17:
  double v45 = objc_opt_class();
  double v46 = [(_TVRowView *)self leftComponents];
  objc_msgSend(v45, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v46, 1, v22, v12, width, height);
  v85.origin.CGFloat x = v47;
  v85.origin.CGFloat y = v48;
  v85.size.double width = v49;
  v85.size.double height = v50;
  v75.origin.CGFloat x = v8;
  v75.origin.CGFloat y = v7;
  v75.size.double width = v10;
  v75.size.double height = v9;
  CGRect v76 = CGRectUnion(v75, v85);
  CGFloat x = v76.origin.x;
  CGFloat y = v76.origin.y;
  CGFloat v31 = v76.size.width;
  CGFloat v32 = v76.size.height;

  char v51 = objc_opt_class();
  double v34 = [(_TVRowView *)self rightComponents];
  objc_msgSend(v51, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v34, 3, v22, v12, width, height);
  uint64_t v36 = v52;
  uint64_t v38 = v53;
  uint64_t v40 = v54;
  uint64_t v42 = v55;
  uint64_t v19 = v22;
LABEL_18:
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.double width = v31;
  v77.size.double height = v32;
  CGRect v78 = CGRectUnion(v77, *(CGRect *)&v36);
  CGFloat v56 = v78.origin.x;
  CGFloat v57 = v78.origin.y;
  CGFloat v58 = v78.size.width;
  CGFloat v59 = v78.size.height;

  v60 = objc_opt_class();
  CGFloat v61 = [(_TVRowView *)self centerComponents];
  objc_msgSend(v60, "_boundingRectForComponents:interitemSpacing:boundingSize:horizontalAlignment:allowsOverflow:", v61, 2, v19, v12, width, height);
  v86.origin.CGFloat x = v62;
  v86.origin.CGFloat y = v63;
  v86.size.double width = v64;
  v86.size.double height = v65;
  v79.origin.CGFloat x = v56;
  v79.origin.CGFloat y = v57;
  v79.size.double width = v58;
  v79.size.double height = v59;
  CGRect v80 = CGRectUnion(v79, v86);
  CGFloat v66 = v80.origin.x;
  CGFloat v67 = v80.origin.y;
  double v68 = v80.size.width;
  double v69 = v80.size.height;

  if ((v19 & 1) == 0)
  {
    if (!v18)
    {
      v81.origin.CGFloat x = v66;
      v81.origin.CGFloat y = v67;
      v81.size.double width = v68;
      v81.size.double height = v69;
      if (CGRectGetWidth(v81) < width) {
        double v68 = width;
      }
    }
    if (height > 0.0)
    {
      v82.origin.CGFloat x = v66;
      v82.origin.CGFloat y = v67;
      v82.size.double width = v68;
      v82.size.double height = v69;
      double v69 = fmin(height, CGRectGetHeight(v82));
    }
    if (width > 0.0)
    {
      v83.origin.CGFloat x = v66;
      v83.origin.CGFloat y = v67;
      v83.size.double width = v68;
      v83.size.double height = v69;
      double v68 = fmin(width, CGRectGetWidth(v83));
    }
  }
  double v70 = v68;
  double v71 = v69;
  result.double height = v71;
  result.double width = v70;
  return result;
}

- (void)_addSubview:(id)a3 maxViewWidth:(double)a4
{
  id v11 = a3;
  uint64_t v6 = [v11 superview];

  if (v6 != self) {
    [(_TVRowView *)self addSubview:v11];
  }
  [(_TVRowView *)self bounds];
  double v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v11, "tv_textSizeForWidth:", a4);
  }
  else {
    objc_msgSend(v11, "sizeThatFits:", a4, v8);
  }
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v9, v10);
}

- (int64_t)_alignmentFromView:(id)a3
{
  int64_t result = objc_msgSend(a3, "tv_alignment");
  if (!result) {
    return 2;
  }
  return result;
}

- (void)_resetSubviews
{
  double v3 = [(_TVRowView *)self subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  [(_TVRowView *)self setNeedsLayout];
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(_TVRowView *)self components];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    double v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (void)_alignComponents:(id)a3 withLineSize:(CGSize)a4 boundingRect:(CGRect)a5 originYBump:(double)a6 verticalAlignment:(int64_t)a7 horizontalAlignment:(int64_t)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v15 = a4.height;
  double v16 = a4.width;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v17 = a3;
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v18 = CGRectGetWidth(v43) - v16;
  if (a8 != 2)
  {
    if (a8 == 9)
    {
      uint64_t v19 = [v17 firstObject];
      [v19 origin];
      double v21 = v20;

      uint64_t v22 = [v17 lastObject];
      objc_msgSend(v22, "tv_nonDirectionalMargin");
      double v24 = v23;

      double v18 = floor((v18 - v21 - v24) * 0.5);
    }
    else
    {
      double v18 = 0.0;
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v17;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (a7 == 3)
        {
          objc_msgSend(v30, "bounds", (void)v37);
          double v33 = v15 - CGRectGetHeight(v44);
          objc_msgSend(v30, "tv_margin");
          double v32 = v33 - v34;
        }
        else if (a7 == 1)
        {
          objc_msgSend(v30, "tv_margin");
          double v32 = v31 + 0.0;
        }
        else
        {
          [v30 bounds];
          double v32 = floor((v15 - CGRectGetHeight(v45)) * 0.5);
        }
        objc_msgSend(v30, "origin", (void)v37);
        double v36 = v18 + v35;
        [v30 bounds];
        objc_msgSend(v30, "setFrame:", v36, v32 + a6);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v27);
  }
}

+ (CGRect)_leftAlignedFrameForComponent:(id)a3 previousComponent:(id)a4 interitemSpacing:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "tv_nonDirectionalMargin");
    double v11 = v10;
  }
  else
  {
    double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  objc_msgSend(v7, "tv_nonDirectionalMargin");
  double v13 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "tv_textSizeForWidth:", 1.79769313e308);
  }
  else {
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  double v16 = v14;
  double v17 = v15;
  double v18 = fmax(v13, v11);
  double v19 = fmax(v18, a5);
  if (v9) {
    double v20 = v19;
  }
  else {
    double v20 = v18;
  }

  double v21 = 0.0;
  double v22 = v20;
  double v23 = v16;
  double v24 = v17;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v22;
  return result;
}

+ (CGRect)_boundingRectForComponents:(id)a3 interitemSpacing:(double)a4 boundingSize:(CGSize)a5 horizontalAlignment:(int64_t)a6 allowsOverflow:(BOOL)a7
{
  BOOL v7 = a7;
  double width = a5.width;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v10 = a3;
  CGFloat v52 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v53 = *MEMORY[0x263F001A8];
  CGFloat v50 = *(double *)(MEMORY[0x263F001A8] + 24);
  CGFloat v51 = *(double *)(MEMORY[0x263F001A8] + 16);
  if ([v10 count])
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v66;
      CGFloat v64 = &stru_26E5657A8;
      CGFloat v15 = v50;
      double v16 = v51;
      double y = v52;
      CGFloat x = v53;
      double v54 = ceil(width);
      double Height = 0.0;
      v56.size.double width = v51;
      v56.size.CGFloat height = v50;
      v56.origin.CGFloat x = v53;
      v56.origin.double y = v52;
      do
      {
        uint64_t v19 = 0;
        uint64_t v58 = v12;
        do
        {
          if (*(void *)v66 != v14) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v65 + 1) + 8 * v19);
          [(id)objc_opt_class() _leftAlignedFrameForComponent:v20 previousComponent:v13 interitemSpacing:a4];
          double v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          objc_msgSend(v20, "tv_nonDirectionalMargin");
          if (a6 == 2) {
            double v30 = 0.0;
          }
          else {
            double v30 = v29;
          }
          if (v13) {
            BOOL v31 = 0;
          }
          else {
            BOOL v31 = a6 == 2;
          }
          if (v31) {
            double v22 = 0.0;
          }
          if (v7)
          {
            double v61 = v30;
            uint64_t v32 = v14;
            id v33 = a1;
            BOOL v34 = v7;
            v71.origin.CGFloat x = x;
            v71.origin.double y = y;
            v71.size.double width = v16;
            v71.size.CGFloat height = v15;
            double v60 = CGRectGetWidth(v71);
            v72.origin.CGFloat x = v22;
            double v62 = v24;
            v72.origin.double y = v24;
            v72.size.double width = v26;
            v72.size.CGFloat height = v28;
            double MaxX = CGRectGetMaxX(v72);
            uint64_t v36 = [v20 valueForTVViewStyle:@"tv-group"];
            long long v37 = (void *)v36;
            long long v38 = &stru_26E5657A8;
            if (v36) {
              long long v38 = (__CFString *)v36;
            }
            long long v39 = v38;

            char v40 = [(__CFString *)v64 isEqualToString:v39];
            if (width == 0.0 || (ceil(v61 + v60 + MaxX) <= v54 ? (char v41 = v40) : (char v41 = 0), (v41 & 1) != 0))
            {
              CGFloat v64 = v39;
            }
            else
            {
              objc_msgSend(v13, "tv_nonDirectionalMargin");
              v79.size.double width = v16 + v43;
              v79.origin.double y = Height + y;
              v79.origin.CGFloat x = x;
              v79.size.CGFloat height = v15;
              CGRect v56 = CGRectUnion(v56, v79);
              double Height = CGRectGetHeight(v56);

              id v13 = 0;
              CGFloat v64 = v39;
              CGFloat v15 = v50;
              double v16 = v51;
              double y = v52;
              CGFloat x = v53;
            }
            BOOL v7 = v34;
            a1 = v33;
            uint64_t v14 = v32;
            uint64_t v12 = v58;
            CGFloat v24 = v62;
          }
          uint64_t v42 = v13;
          v73.origin.CGFloat x = x;
          v73.origin.double y = y;
          v73.size.double width = v16;
          v73.size.CGFloat height = v15;
          v78.origin.CGFloat x = v22 + CGRectGetWidth(v73);
          v74.origin.CGFloat x = x;
          v74.origin.double y = y;
          v74.size.double width = v16;
          v74.size.CGFloat height = v15;
          v78.origin.double y = v24;
          v78.size.double width = v26;
          v78.size.CGFloat height = v28;
          CGRect v75 = CGRectUnion(v74, v78);
          CGFloat x = v75.origin.x;
          double y = v75.origin.y;
          double v16 = v75.size.width;
          CGFloat v15 = v75.size.height;
          id v13 = v20;

          ++v19;
        }
        while (v12 != v19);
        uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
        uint64_t v12 = v44;
      }
      while (v44);
    }
    else
    {
      id v13 = 0;
      CGFloat v64 = &stru_26E5657A8;
      double Height = 0.0;
      CGFloat v15 = v50;
      double v16 = v51;
      double y = v52;
      CGFloat x = v53;
      v56.size.double width = v51;
      v56.size.CGFloat height = v50;
      v56.origin.CGFloat x = v53;
      v56.origin.double y = v52;
    }

    objc_msgSend(v13, "tv_nonDirectionalMargin");
    v80.size.double width = v16 + v45;
    v80.origin.double y = Height + y;
    v80.origin.CGFloat x = x;
    v80.size.CGFloat height = v15;
    CGRect v76 = CGRectUnion(v56, v80);
    CGFloat v52 = v76.origin.y;
    CGFloat v53 = v76.origin.x;
    CGFloat v50 = v76.size.height;
    CGFloat v51 = v76.size.width;
  }
  double v47 = v52;
  double v46 = v53;
  double v49 = v50;
  double v48 = v51;
  result.size.CGFloat height = v49;
  result.size.double width = v48;
  result.origin.double y = v47;
  result.origin.CGFloat x = v46;
  return result;
}

- (NSArray)components
{
  return self->_components;
}

- (UIView)preferredFocusedComponent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredFocusedComponent);
  return (UIView *)WeakRetained;
}

- (int64_t)contentVerticalAlignment
{
  return self->_contentVerticalAlignment;
}

- (NSArray)leftComponents
{
  return self->_leftComponents;
}

- (NSArray)centerComponents
{
  return self->_centerComponents;
}

- (NSArray)rightComponents
{
  return self->_rightComponents;
}

- (NSArray)allComponents
{
  return self->_allComponents;
}

- (UIView)lastFocusedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastFocusedView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastFocusedView);
  objc_storeStrong((id *)&self->_allComponents, 0);
  objc_storeStrong((id *)&self->_rightComponents, 0);
  objc_storeStrong((id *)&self->_centerComponents, 0);
  objc_storeStrong((id *)&self->_leftComponents, 0);
  objc_destroyWeak((id *)&self->_preferredFocusedComponent);
  objc_storeStrong((id *)&self->_components, 0);
}

@end