@interface _UIHighlightView
- (_UIHighlightView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (void)cleanUp;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadii:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrames:(id)a3 boundaryRect:(CGRect)a4;
- (void)setInvertHighlight:(BOOL)a3 clipRect:(CGRect)a4;
- (void)setQuads:(id)a3 boundaryRect:(CGRect)a4;
@end

@implementation _UIHighlightView

- (_UIHighlightView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHighlightView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setNeedsDisplayOnBoundsChange:1];
    color = v4->_color;
    v4->_color = 0;
  }
  return v4;
}

- (void)cleanUp
{
  innerBounds = self->_innerBounds;
  self->_innerBounds = 0;

  innerQuads = self->_innerQuads;
  self->_innerQuads = 0;
}

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    v5 = v6;
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerRadii:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_cornerRadii != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cornerRadii, a3);
    v5 = v6;
  }
}

- (void)setFrames:(id)a3 boundaryRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(_UIHighlightView *)self cleanUp];
  if (v9 && [v9 count])
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    -[_UIHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v57 + 1) + 8 * i) rectValue];
        uint64_t v24 = v20;
        uint64_t v25 = v21;
        uint64_t v26 = v22;
        uint64_t v27 = v23;
        if (v17)
        {
          v64.origin.double x = v10;
          v64.origin.double y = v11;
          v64.size.double width = v12;
          v64.size.double height = v13;
          uint64_t v28 = v24;
          CGRect v65 = CGRectUnion(v64, *(CGRect *)(&v25 - 1));
        }
        else
        {
          CGRect v65 = CGRectInset(*(CGRect *)&v20, -self->_cornerRadius, -self->_cornerRadius);
        }
        double v10 = v65.origin.x;
        double v11 = v65.origin.y;
        double v12 = v65.size.width;
        double v13 = v65.size.height;
        char v17 = 1;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v16);
  }

  if (self->_invertHighlight) {
    double v29 = height;
  }
  else {
    double v29 = v13;
  }
  if (self->_invertHighlight) {
    double v30 = width;
  }
  else {
    double v30 = v12;
  }
  *(double *)&v52[16] = v30;
  *(double *)&v52[24] = v29;
  if (self->_invertHighlight) {
    double v31 = y;
  }
  else {
    double v31 = v11;
  }
  if (self->_invertHighlight) {
    double v32 = x;
  }
  else {
    double v32 = v10;
  }
  *(double *)v52 = v32;
  *(double *)&v52[8] = v31;
  v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  innerBounds = self->_innerBounds;
  self->_innerBounds = v33;

  long long v55 = 0u;
  long long v56 = 0u;
  *(_OWORD *)&rect[3] = 0u;
  long long v54 = 0u;
  id v35 = v14;
  uint64_t v36 = [v35 countByEnumeratingWithState:&rect[3] objects:v61 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v54 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = self->_innerBounds;
        v41 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(rect[4] + 8 * j) rectValue];
        rect[0] = v42;
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        CGFloat v49 = -CGRectGetMinX(*(CGRect *)v52);
        CGFloat v50 = -CGRectGetMinY(*(CGRect *)v52);
        *(void *)&v66.origin.double x = rect[0];
        v66.origin.double y = v44;
        v66.size.double width = v46;
        v66.size.double height = v48;
        CGRect v67 = CGRectOffset(v66, v49, v50);
        v51 = objc_msgSend(v41, "valueWithCGRect:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
        [(NSMutableArray *)v40 addObject:v51];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&rect[3] objects:v61 count:16];
    }
    while (v37);
  }

  rect[1] = self;
  rect[2] = _UIHighlightView;
  objc_msgSendSuper2((objc_super *)&rect[1], sel_setFrame_, *(double *)v52, *(double *)&v52[8], *(double *)&v52[16], *(double *)&v52[24]);
  if ([(UIView *)self needsDisplayOnBoundsChange]) {
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setQuads:(id)a3 boundaryRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(_UIHighlightView *)self cleanUp];
  if (!v9 || ![v9 count]) {
    -[_UIHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v45;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * i) CGPointValue];
        if (v13) {
          double v22 = v15;
        }
        else {
          double v22 = v21;
        }
        if (v13) {
          double v23 = v16;
        }
        else {
          double v23 = v21;
        }
        if (v13) {
          double v24 = v17;
        }
        else {
          double v24 = v20;
        }
        if (v13) {
          double v25 = v18;
        }
        else {
          double v25 = v20;
        }
        if (v20 >= v25) {
          double v18 = v20;
        }
        else {
          double v18 = v25;
        }
        if (v20 >= v24) {
          double v17 = v24;
        }
        else {
          double v17 = v20;
        }
        if (v21 >= v23) {
          double v16 = v21;
        }
        else {
          double v16 = v23;
        }
        if (v21 >= v22) {
          double v15 = v22;
        }
        else {
          double v15 = v21;
        }
        char v13 = 1;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v12);
  }
  else
  {
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
  }

  if (!self->_invertHighlight)
  {
    v51.size.double width = v18 - v17;
    v51.size.double height = v16 - v15;
    v51.origin.double x = v17;
    v51.origin.double y = v15;
    CGRect v52 = CGRectInset(v51, self->_cornerRadius * -4.0, self->_cornerRadius * -4.0);
    v56.origin.double x = x;
    v56.origin.double y = y;
    v56.size.double width = width;
    v56.size.double height = height;
    CGRect v53 = CGRectIntersection(v52, v56);
    double x = v53.origin.x;
    double y = v53.origin.y;
    double width = v53.size.width;
    double height = v53.size.height;
  }
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  v54.size.double height = height;
  double MinX = CGRectGetMinX(v54);
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  double MinY = CGRectGetMinY(v55);
  uint64_t v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  innerQuads = self->_innerQuads;
  self->_innerQuads = v28;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v30 = v10;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * j) CGPointValue];
        uint64_t v37 = self->_innerQuads;
        uint64_t v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v35 - MinX, v36 - MinY);
        [(NSMutableArray *)v37 addObject:v38];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v32);
  }

  v39.receiver = self;
  v39.super_class = (Class)_UIHighlightView;
  -[UIView setFrame:](&v39, sel_setFrame_, x, y, width, height);
  if ([(UIView *)self needsDisplayOnBoundsChange]) {
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIHighlightView *)self cleanUp];
  v8.receiver = self;
  v8.super_class = (Class)_UIHighlightView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setInvertHighlight:(BOOL)a3 clipRect:(CGRect)a4
{
  self->_invertHighlight = a3;
  self->_invertedHighlightClipRect = a4;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (self->_innerBounds || self->_innerQuads)
  {
    if (self->_invertHighlight)
    {
      v4 = +[UIBezierPath bezierPath];
      [(UIView *)self bounds];
      objc_msgSend(v4, "appendBezierPathWithRect:");
      v5 = +[UIColor colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.3];
      [v5 set];

      [v4 fill];
    }
    v6 = +[UIBezierPath bezierPath];
    innerBounds = self->_innerBounds;
    if (innerBounds)
    {
      if ((unint64_t)[(NSMutableArray *)innerBounds count] < 2)
      {
LABEL_24:
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v45 = self->_innerBounds;
        uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v72 != v48) {
                objc_enumerationMutation(v45);
              }
              [*(id *)(*((void *)&v71 + 1) + 8 * i) rectValue];
              uint64_t v50 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadii:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadii:", -1, self->_cornerRadii);
              [v6 appendBezierPath:v50];
            }
            uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v71 objects:v79 count:16];
          }
          while (v47);
        }
      }
      else
      {
        objc_super v8 = self->_cornerRadii;
        id v9 = [(NSArray *)v8 firstObject];
        [v9 CGSizeValue];
        double v11 = v10;

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v12 = v8;
        uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v76 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v75 + 1) + 8 * j) CGSizeValue];
              if (v18 != v11 || v17 != v11)
              {

                goto LABEL_24;
              }
            }
            uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v75 objects:v80 count:16];
          }
          while (v14);
        }

        PathWithShrinkWrappedRects = (const CGPath *)WebKitCreatePathWithShrinkWrappedRects();
        double v21 = +[UIBezierPath bezierPathWithCGPath:PathWithShrinkWrappedRects];
        [v6 appendBezierPath:v21];

        CGPathRelease(PathWithShrinkWrappedRects);
      }
    }
    else
    {
      double v22 = [(NSMutableArray *)self->_innerQuads objectEnumerator];
      uint64_t v23 = [v22 nextObject];
      if (v23)
      {
        double v24 = (void *)v23;
        do
        {
          [v24 CGPointValue];
          double v26 = v25;
          double v28 = v27;
          double v29 = [v22 nextObject];

          [v29 CGPointValue];
          double v31 = v30;
          double v33 = v32;
          v34 = [v22 nextObject];

          [v34 CGPointValue];
          double v36 = v35;
          double v38 = v37;
          objc_super v39 = [v22 nextObject];

          [v39 CGPointValue];
          double v41 = v40;
          double v43 = v42;
          long long v44 = +[UIBezierPath bezierPath];
          objc_msgSend(v44, "moveToPoint:", v26, v28);
          objc_msgSend(v44, "lineToPoint:", v31, v33);
          objc_msgSend(v44, "lineToPoint:", v36, v38);
          objc_msgSend(v44, "lineToPoint:", v41, v43);
          [v44 closePath];
          [v6 appendBezierPath:v44];

          double v24 = [v22 nextObject];
        }
        while (v24);
      }
    }
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      CGRect v52 = 0;
    }
    else {
      CGRect v52 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v52);
    if (self->_innerQuads) {
      CGContextSetLineWidth(v52, self->_cornerRadius * 4.0);
    }
    CGContextSetLineJoin(v52, kCGLineJoinRound);
    if (self->_invertHighlight)
    {
      CGRect v53 = +[UIColor clearColor];
      [v53 set];

      CGContextSetBlendMode(v52, kCGBlendModeClear);
      double v54 = *MEMORY[0x1E4F1DAD8];
      double v55 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGRect v56 = [(UIView *)self _screen];
      [v56 bounds];
      double v58 = v57;
      double v60 = v59;

      v61 = [(UIView *)self window];
      v62 = __UIStatusBarManagerForWindow(v61);
      [v62 statusBarHeight];
      double v64 = v63;

      CGRect v65 = [(UIView *)self window];
      CGRect v66 = [v65 windowScene];
      uint64_t v67 = [v66 interfaceOrientation];

      switch(v67)
      {
        case 1:
          double v55 = v55 + v64;
          goto LABEL_40;
        case 2:
LABEL_40:
          double v60 = v60 - v64;
          break;
        case 3:
          goto LABEL_46;
        case 4:
          double v54 = v54 + v64;
LABEL_46:
          double v58 = v58 - v64;
          break;
        default:
          break;
      }
      v83.origin.double x = v54;
      v83.origin.double y = v55;
      v83.size.double width = v58;
      v83.size.double height = v60;
      CGRect v84 = CGRectIntersection(v83, self->_invertedHighlightClipRect);
      CGContextClipToRect(v52, v84);
      CGContextAddPath(v52, (CGPathRef)[v6 _pathRef]);
      CGContextDrawPath(v52, kCGPathFillStroke);
    }
    else
    {
      CGFloat Alpha = CGColorGetAlpha([(UIColor *)self->_color CGColor]);
      v69 = [(UIColor *)self->_color colorWithAlphaComponent:1.0];
      [v69 set];

      CGContextSetAlpha(v52, Alpha);
      CGContextBeginTransparencyLayer(v52, 0);
      CGContextAddPath(v52, (CGPathRef)[v6 _pathRef]);
      CGContextDrawPath(v52, kCGPathFillStroke);
      CGContextEndTransparencyLayer(v52);
    }
    CGContextRestoreGState(v52);
  }
  else
  {
    [(UIColor *)self->_color set];
    [(UIView *)self bounds];
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    [v70 fill];
  }
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerQuads, 0);
  objc_storeStrong((id *)&self->_innerBounds, 0);
  objc_storeStrong((id *)&self->_cornerRadii, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end