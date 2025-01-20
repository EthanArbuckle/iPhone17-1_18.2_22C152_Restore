@interface ICTableContentView
- (BOOL)splitStroke:(id)a3 atRect:(CGRect)a4;
- (CGRect)exclusionRect;
- (ICTableContentView)initWithCoder:(id)a3;
- (ICTableContentView)initWithFrame:(CGRect)a3;
- (NSMutableDictionary)horizontalStrokes;
- (NSMutableDictionary)verticalStrokes;
- (UIColor)highlightColor;
- (UIColor)innerBorderColor;
- (UIView)bottomBorder;
- (UIView)leftBorder;
- (UIView)rightBorder;
- (UIView)topBorder;
- (double)alignedPosition:(double)a3;
- (double)outerBorderWidth;
- (id)addSubstrokeWithFrame:(CGRect)a3 toStroke:(id)a4;
- (id)createStroke;
- (id)outerBorderColor;
- (void)layoutSubviews;
- (void)recursivelyUpdateLayer:(id)a3 toColor:(CGColor *)a4 ignoreIfClear:(BOOL)a5;
- (void)registerForTraitChanges;
- (void)setBottomBorder:(id)a3;
- (void)setExclusionRect:(CGRect)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHorizontalLinePosition:(id)a3 forKey:(id)a4;
- (void)setHorizontalStrokes:(id)a3;
- (void)setLeftBorder:(id)a3;
- (void)setRightBorder:(id)a3;
- (void)setTopBorder:(id)a3;
- (void)setVerticalLinePosition:(id)a3 forKey:(id)a4;
- (void)setVerticalStrokes:(id)a3;
- (void)sharedInit;
- (void)unsplitStroke:(id)a3;
- (void)updateColors;
- (void)updateLayout;
@end

@implementation ICTableContentView

- (ICTableContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableContentView;
  v3 = -[ICTableContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICTableContentView *)v3 sharedInit];
  }
  return v4;
}

- (ICTableContentView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableContentView;
  v3 = [(ICTableContentView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICTableContentView *)v3 sharedInit];
  }
  return v4;
}

- (void)sharedInit
{
  v3 = [MEMORY[0x263F825C8] clearColor];
  [(ICTableContentView *)self setBackgroundColor:v3];

  [(ICTableContentView *)self registerForTraitChanges];
  v4 = [(ICTableContentView *)self layer];
  [v4 setMasksToBounds:1];

  v5 = [MEMORY[0x263EFF9A0] dictionary];
  horizontalStrokes = self->_horizontalStrokes;
  self->_horizontalStrokes = v5;

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  verticalStrokes = self->_verticalStrokes;
  self->_verticalStrokes = v7;

  v9 = [(ICTableContentView *)self createStroke];
  topBorder = self->_topBorder;
  self->_topBorder = v9;

  v11 = [(ICTableContentView *)self createStroke];
  bottomBorder = self->_bottomBorder;
  self->_bottomBorder = v11;

  v13 = [(ICTableContentView *)self createStroke];
  leftBorder = self->_leftBorder;
  self->_leftBorder = v13;

  v15 = [(ICTableContentView *)self createStroke];
  rightBorder = self->_rightBorder;
  self->_rightBorder = v15;

  v17 = [(ICTableContentView *)self horizontalStrokes];
  v18 = self->_topBorder;
  v19 = [MEMORY[0x263F08C38] UUID];
  [v17 setObject:v18 forKey:v19];

  v20 = [(ICTableContentView *)self horizontalStrokes];
  v21 = self->_bottomBorder;
  v22 = [MEMORY[0x263F08C38] UUID];
  [v20 setObject:v21 forKey:v22];

  v23 = [(ICTableContentView *)self verticalStrokes];
  v24 = self->_leftBorder;
  v25 = [MEMORY[0x263F08C38] UUID];
  [v23 setObject:v24 forKey:v25];

  id v28 = [(ICTableContentView *)self verticalStrokes];
  v26 = self->_rightBorder;
  v27 = [MEMORY[0x263F08C38] UUID];
  [v28 setObject:v26 forKey:v27];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableContentView;
  [(ICTableContentView *)&v3 layoutSubviews];
  [(ICTableContentView *)self updateLayout];
}

- (void)updateLayout
{
  [(ICTableContentView *)self outerBorderWidth];
  double v4 = v3;
  [(ICTableContentView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  v9 = [(ICTableContentView *)self topBorder];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, v4);

  [(ICTableContentView *)self alignedPosition:v8 - v4];
  double v11 = v10;
  v12 = [(ICTableContentView *)self bottomBorder];
  objc_msgSend(v12, "setFrame:", 0.0, v11, v6, v4);

  v13 = [(ICTableContentView *)self leftBorder];
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v4, v8);

  v14 = [(ICTableContentView *)self rightBorder];
  objc_msgSend(v14, "setFrame:", v6 - v4, 0.0, v4, v8);

  [(ICTableContentView *)self updateColors];
}

- (void)setExclusionRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v57 = *MEMORY[0x263EF8340];
  self->_exclusionRect = a3;
  if (CGRectIsEmpty(a3))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v8 = [(ICTableContentView *)self horizontalStrokes];
    v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          [(ICTableContentView *)self unsplitStroke:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v11);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = [(ICTableContentView *)self verticalStrokes];
    v15 = [v14 allValues];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          [(ICTableContentView *)self unsplitStroke:*(void *)(*((void *)&v37 + 1) + 8 * j)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.double width = width;
    v58.size.double height = height;
    if (CGRectGetMinX(v58) < 2.0)
    {
      double width = width + x + 1.0;
      double x = -1.0;
    }
    v59.origin.double x = x;
    v59.origin.double y = y;
    v59.size.double width = width;
    v59.size.double height = height;
    if (CGRectGetMinY(v59) < 2.0)
    {
      double height = height + y + 1.0;
      double y = -1.0;
    }
    v60.origin.double x = x;
    v60.origin.double y = y;
    v60.size.double width = width;
    v60.size.double height = height;
    double MaxX = CGRectGetMaxX(v60);
    [(ICTableContentView *)self bounds];
    if (MaxX > v21 + -2.0)
    {
      [(ICTableContentView *)self bounds];
      double width = v22 + 1.0 - x;
    }
    v61.origin.double x = x;
    v61.origin.double y = y;
    v61.size.double width = width;
    v61.size.double height = height;
    double MaxY = CGRectGetMaxY(v61);
    [(ICTableContentView *)self bounds];
    if (MaxY > v24 + -2.0)
    {
      [(ICTableContentView *)self bounds];
      double height = v25 + 1.0 - y;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v26 = [(ICTableContentView *)self horizontalStrokes];
    v27 = [v26 allValues];

    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          -[ICTableContentView splitStroke:atRect:](self, "splitStroke:atRect:", *(void *)(*((void *)&v49 + 1) + 8 * k), x, y, width, height);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v29);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v32 = [(ICTableContentView *)self verticalStrokes];
    v15 = [v32 allValues];

    uint64_t v33 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v46;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(v15);
          }
          -[ICTableContentView splitStroke:atRect:](self, "splitStroke:atRect:", *(void *)(*((void *)&v45 + 1) + 8 * m), x, y, width, height);
        }
        uint64_t v34 = [v15 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v34);
    }
  }
}

- (UIColor)innerBorderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ic_systemGray4Color");
}

- (id)outerBorderColor
{
  double v3 = [(ICTableContentView *)self innerBorderColor];
  double v4 = [(ICTableContentView *)self highlightColor];
  double v5 = objc_msgSend(v3, "ic_colorBlendedWithColor:", v4);

  return v5;
}

- (double)outerBorderWidth
{
  double v3 = *MEMORY[0x263F5B058];
  double v4 = [(ICTableContentView *)self highlightColor];
  [v4 alphaComponent];
  double v6 = v5;
  [(ICTableContentView *)self innerBorderWidth];
  double v8 = v7;
  v9 = [(ICTableContentView *)self highlightColor];
  [v9 alphaComponent];
  double v11 = v8 * (1.0 - v10) + v3 * v6;

  return v11;
}

- (void)updateColors
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(ICTableContentView *)self innerBorderColor];
  uint64_t v4 = [v3 CGColor];

  id v5 = [(ICTableContentView *)self outerBorderColor];
  uint64_t v6 = [v5 CGColor];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v7 = [(ICTableContentView *)self horizontalStrokes];
  double v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v33 + 1) + 8 * v12) layer];
        [(ICTableContentView *)self recursivelyUpdateLayer:v13 toColor:v4 ignoreIfClear:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = [(ICTableContentView *)self verticalStrokes];
  v15 = [v14 allValues];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v29 + 1) + 8 * v19) layer];
        [(ICTableContentView *)self recursivelyUpdateLayer:v20 toColor:v4 ignoreIfClear:0];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }

  double v21 = [(ICTableContentView *)self topBorder];
  double v22 = [v21 layer];
  [(ICTableContentView *)self recursivelyUpdateLayer:v22 toColor:v6 ignoreIfClear:1];

  v23 = [(ICTableContentView *)self bottomBorder];
  double v24 = [v23 layer];
  [(ICTableContentView *)self recursivelyUpdateLayer:v24 toColor:v6 ignoreIfClear:1];

  double v25 = [(ICTableContentView *)self rightBorder];
  v26 = [v25 layer];
  [(ICTableContentView *)self recursivelyUpdateLayer:v26 toColor:v6 ignoreIfClear:1];

  v27 = [(ICTableContentView *)self leftBorder];
  uint64_t v28 = [v27 layer];
  [(ICTableContentView *)self recursivelyUpdateLayer:v28 toColor:v6 ignoreIfClear:1];
}

- (void)recursivelyUpdateLayer:(id)a3 toColor:(CGColor *)a4 ignoreIfClear:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v10 = (CGColor *)[v9 CGColor];

  if (!v5 || !CGColorEqualToColor((CGColorRef)[v8 backgroundColor], v10)) {
    [v8 setBackgroundColor:a4];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = objc_msgSend(v8, "sublayers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(ICTableContentView *)self recursivelyUpdateLayer:*(void *)(*((void *)&v16 + 1) + 8 * v15++) toColor:a4 ignoreIfClear:v5];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)createStroke
{
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v4 = [(ICTableContentView *)self innerBorderColor];
  uint64_t v5 = [v4 CGColor];
  uint64_t v6 = [v3 layer];
  [v6 setBackgroundColor:v5];

  [(ICTableContentView *)self insertSubview:v3 atIndex:0];

  return v3;
}

- (void)setVerticalLinePosition:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  double v7 = [(ICTableContentView *)self verticalStrokes];
  id v8 = [v7 objectForKey:v6];

  if (v15)
  {
    if (!v8)
    {
      id v8 = [(ICTableContentView *)self createStroke];
      [v8 setAutoresizingMask:20];
      id v9 = [(ICTableContentView *)self verticalStrokes];
      [v9 setObject:v8 forKey:v6];
    }
    [(ICTableContentView *)self innerBorderWidth];
    double v11 = v10;
    [v15 doubleValue];
    -[ICTableContentView alignedPosition:](self, "alignedPosition:");
    double v13 = v12;
    [(ICTableContentView *)self bounds];
    objc_msgSend(v8, "setFrame:", v13, 0.0, v11);
  }
  else if (v8)
  {
    [v8 removeFromSuperview];
    uint64_t v14 = [(ICTableContentView *)self verticalStrokes];
    [v14 removeObjectForKey:v6];
  }
}

- (void)setHorizontalLinePosition:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(ICTableContentView *)self horizontalStrokes];
  id v8 = [v7 objectForKey:v6];

  if (v13)
  {
    if (!v8)
    {
      id v8 = [(ICTableContentView *)self createStroke];
      [v8 setAutoresizingMask:34];
      id v9 = [(ICTableContentView *)self horizontalStrokes];
      [v9 setObject:v8 forKey:v6];
    }
    [(ICTableContentView *)self innerBorderWidth];
    [v13 doubleValue];
    -[ICTableContentView alignedPosition:](self, "alignedPosition:");
    double v11 = v10;
    [(ICTableContentView *)self bounds];
    objc_msgSend(v8, "setFrame:", 0.0, v11);
  }
  else if (v8)
  {
    [v8 removeFromSuperview];
    double v12 = [(ICTableContentView *)self horizontalStrokes];
    [v12 removeObjectForKey:v6];
  }
}

- (id)addSubstrokeWithFrame:(CGRect)a3 toStroke:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  objc_msgSend(v9, "convertRect:fromView:", self, x, y, width, height);
  double v10 = v19.origin.x;
  double v11 = v19.origin.y;
  double v12 = v19.size.width;
  double v13 = v19.size.height;
  if (CGRectIsEmpty(v19))
  {
    id v14 = 0;
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x263F157E8]);
    objc_msgSend(v14, "setFrame:", v10, v11, v12, v13);
    id v15 = [(ICTableContentView *)self innerBorderColor];
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    long long v16 = [v9 layer];
    [v16 addSublayer:v14];
  }

  return v14;
}

- (BOOL)splitStroke:(id)a3 atRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [(ICTableContentView *)self unsplitStroke:v9];
  [v9 frame];
  v63.origin.double x = v10;
  v63.origin.CGFloat y = v11;
  v63.size.CGFloat width = v12;
  v63.size.CGFloat height = v13;
  v52.origin.double x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  if (!CGRectIntersectsRect(v52, v63)) {
    goto LABEL_10;
  }
  [v9 bounds];
  double v15 = v14;
  [v9 bounds];
  double v17 = v16;
  [v9 frame];
  if (v15 <= v17)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v18);
    v58.origin.double x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    if (MaxX > CGRectGetMinX(v58) + 1.0)
    {
      [v9 frame];
      double MinX = CGRectGetMinX(v59);
      v60.origin.double x = x;
      v60.origin.CGFloat y = y;
      v60.size.CGFloat width = width;
      v60.size.CGFloat height = height;
      if (MinX < CGRectGetMaxX(v60) + -1.0)
      {
        id v39 = [MEMORY[0x263F825C8] clearColor];
        uint64_t v40 = [v39 CGColor];
        long long v41 = [v9 layer];
        [v41 setBackgroundColor:v40];

        [v9 frame];
        double v43 = v42;
        [v9 bounds];
        id v44 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, v43, 0.0);
        [v9 frame];
        double v30 = v45;
        v61.origin.double x = x;
        v61.origin.CGFloat y = y;
        v61.size.CGFloat width = width;
        v61.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v61);
        [v9 bounds];
        double v35 = v46;
        [(ICTableContentView *)self bounds];
        double v48 = v47;
        v62.origin.double x = x;
        v62.origin.CGFloat y = y;
        v62.size.CGFloat width = width;
        v62.size.CGFloat height = height;
        double v36 = v48 - CGRectGetMaxY(v62);
        goto LABEL_9;
      }
    }
LABEL_10:
    BOOL v50 = 0;
    goto LABEL_11;
  }
  double v22 = CGRectGetMaxY(*(CGRect *)&v18);
  v53.origin.double x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  if (v22 <= CGRectGetMinY(v53) + 1.0) {
    goto LABEL_10;
  }
  [v9 frame];
  double MinY = CGRectGetMinY(v54);
  v55.origin.double x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  if (MinY >= CGRectGetMaxY(v55) + -1.0) {
    goto LABEL_10;
  }
  id v24 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v25 = [v24 CGColor];
  v26 = [v9 layer];
  [v26 setBackgroundColor:v25];

  [v9 frame];
  double v28 = v27;
  [v9 bounds];
  id v29 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, 0.0, v28, x);
  v56.origin.double x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  double v30 = CGRectGetMaxX(v56);
  [v9 frame];
  double MaxY = v31;
  [(ICTableContentView *)self bounds];
  double v34 = v33;
  v57.origin.double x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  double v35 = v34 - CGRectGetMaxX(v57);
  [v9 bounds];
LABEL_9:
  id v49 = -[ICTableContentView addSubstrokeWithFrame:toStroke:](self, "addSubstrokeWithFrame:toStroke:", v9, v30, MaxY, v35, v36);
  BOOL v50 = 1;
LABEL_11:

  return v50;
}

- (void)unsplitStroke:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICTableContentView *)self innerBorderColor];
  uint64_t v6 = [v5 CGColor];
  double v7 = [v4 layer];
  [v7 setBackgroundColor:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = objc_msgSend(v4, "layer", 0);
  id v9 = [v8 sublayers];
  CGFloat v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) removeFromSuperlayer];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (double)alignedPosition:(double)a3
{
  [(ICTableContentView *)self ic_backingScaleFactor];
  return round(v4 * a3) / v4;
}

- (void)registerForTraitChanges
{
  id v4 = [MEMORY[0x263F82DA0] systemTraitsAffectingColorAppearance];
  id v3 = (id)[(ICTableContentView *)self registerForTraitChanges:v4 withAction:sel_updateColors];
}

- (CGRect)exclusionRect
{
  double x = self->_exclusionRect.origin.x;
  double y = self->_exclusionRect.origin.y;
  double width = self->_exclusionRect.size.width;
  double height = self->_exclusionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (NSMutableDictionary)horizontalStrokes
{
  return self->_horizontalStrokes;
}

- (void)setHorizontalStrokes:(id)a3
{
}

- (NSMutableDictionary)verticalStrokes
{
  return self->_verticalStrokes;
}

- (void)setVerticalStrokes:(id)a3
{
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
}

- (UIView)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
}

- (UIView)leftBorder
{
  return self->_leftBorder;
}

- (void)setLeftBorder:(id)a3
{
}

- (UIView)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_verticalStrokes, 0);
  objc_storeStrong((id *)&self->_horizontalStrokes, 0);

  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end