@interface SUTableCellContentView
- (BOOL)drawAsDisabled;
- (BOOL)highlightsOnlyContentView;
- (BOOL)isDeleteConfirmationVisible;
- (BOOL)isHighlighted;
- (BOOL)usesSubviews;
- (SUCellConfiguration)configuration;
- (id)_clipPath;
- (id)_clippedImageForImage:(id)a3;
- (int)clipCorners;
- (void)_reloadSubviewAlphasAnimated:(BOOL)a3;
- (void)_reloadSubviewsForConfiguration;
- (void)_removeSubviewsForConfiguration;
- (void)_startUsingSubviewLayout;
- (void)_stopUsingSubviewLayout;
- (void)_updateDisabledStyleForSubviews;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)reloadView;
- (void)setClipCorners:(int)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeleteConfirmationVisisble:(BOOL)a3;
- (void)setDrawAsDisabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightsOnlyContentView:(BOOL)a3;
- (void)setUsesSubviews:(BOOL)a3;
- (void)setUsesSubviews:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SUTableCellContentView

- (void)dealloc
{
  self->_clipPath = 0;
  if ((SUTableCellContentView *)[(SUCellConfiguration *)self->_configuration view] == self) {
    [(SUCellConfiguration *)self->_configuration setView:0];
  }

  self->_configuration = 0;
  self->_overlayView = 0;

  self->_subviews = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCellContentView;
  [(SUTableCellContentView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  v52[3] = *MEMORY[0x263EF8340];
  [(SUTableCellContentView *)self bounds];
  double v5 = v4;
  -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v6, v7);
  uint64_t v8 = [(SUTableCellContentView *)self isHighlighted] & 0xFFFFFFF9 | (2 * (*((unsigned char *)self + 432) & 1)) & 0xFB | (4 * (*((unsigned char *)self + 456) & 1));
  if (self->_clipCorners)
  {
    c = UIGraphicsGetCurrentContext();
    CGContextSaveGState(c);
    objc_msgSend(-[SUTableCellContentView _clipPath](self, "_clipPath"), "clip");
    if (*((unsigned char *)self + 456)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  c = 0;
  if ((*((unsigned char *)self + 456) & 1) == 0) {
LABEL_3:
  }
    [(SUCellConfiguration *)self->_configuration drawBackgroundWithModifiers:v8];
LABEL_4:
  [(SUCellConfiguration *)self->_configuration drawWithModifiers:v8];
  if ((*((unsigned char *)self + 456) & 1) == 0)
  {
    unint64_t v9 = [(SUCellConfiguration *)self->_configuration numberOfLabels];
    if (v9)
    {
      unint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v48 = *MEMORY[0x263F1C238];
      uint64_t v47 = *MEMORY[0x263F1C268];
      uint64_t v12 = *MEMORY[0x263F1C240];
      do
      {
        id v13 = [(SUCellConfiguration *)self->_configuration stringForLabelAtIndex:v11];
        if ([v13 length])
        {
          [(SUCellConfiguration *)self->_configuration frameForLabelAtIndex:v11];
          double v18 = v17;
          if (v15 > 0.00000011920929)
          {
            double v19 = v14;
            double v20 = v15;
            double v21 = v16;
            id v22 = [(SUCellConfiguration *)self->_configuration fontForLabelAtIndex:v11];
            int64_t v23 = [(SUCellConfiguration *)self->_configuration textAlignmentForLabelAtIndex:v11];
            double v24 = v5 + v18;
            id v50 = 0;
            *(_OWORD *)v49 = *MEMORY[0x263F001B0];
            if ([(SUCellConfiguration *)self->_configuration getShadowColor:&v50 offset:v49 forLabelAtIndex:v11 withModifiers:v8])
            {
              double v25 = v24 + v49[0];
              double v26 = v19 + v49[1];
              [v50 set];
              objc_msgSend(v13, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v22, 4, v23, v25, v26, v20, v21);
              double v24 = v25 - v49[0];
              double v19 = v26 - v49[1];
            }
            id v27 = objc_alloc_init(MEMORY[0x263F1C350]);
            [v27 setLineBreakMode:4];
            [v27 setAlignment:v23];
            v51[0] = v48;
            v51[1] = v47;
            v52[0] = v22;
            v52[1] = v27;
            v51[2] = v12;
            v52[2] = [(SUCellConfiguration *)self->_configuration colorForLabelAtIndex:v11 withModifiers:v8];
            objc_msgSend(v13, "drawInRect:withAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 3), v24, v19, v20, v21 + 5.0);
          }
        }
        ++v11;
      }
      while (v10 != v11);
    }
    char v28 = *((unsigned char *)self + 432);
    unint64_t v29 = [(SUCellConfiguration *)self->_configuration numberOfImages];
    if (v29)
    {
      unint64_t v30 = v29;
      uint64_t v31 = 0;
      double v32 = *MEMORY[0x263F001B0];
      double v33 = *(double *)(MEMORY[0x263F001B0] + 8);
      if (v28) {
        double v34 = 0.330000013;
      }
      else {
        double v34 = 1.0;
      }
      do
      {
        id v35 = [(SUCellConfiguration *)self->_configuration imageAtIndex:v31 withModifiers:v8];
        if (v35)
        {
          v36 = v35;
          [(SUCellConfiguration *)self->_configuration frameForImageAtIndex:v31];
          double v40 = v39;
          double v42 = v41;
          if (v37 == v32 && v38 == v33)
          {
            [v36 size];
            double v37 = v44;
            double v38 = v45;
          }
          objc_msgSend(v36, "drawInRect:blendMode:alpha:", 0, v40, v42, v37, v38, v34);
        }
        ++v31;
      }
      while (v30 != v31);
    }
  }
  if (c) {
    CGContextRestoreGState(c);
  }
}

- (void)layoutSubviews
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)self + 456))
  {
    [(SUTableCellContentView *)self bounds];
    double v4 = v3;
    -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v5, v6);
    unint64_t v7 = [(SUCellConfiguration *)self->_configuration numberOfImages];
    unint64_t v8 = [(SUCellConfiguration *)self->_configuration numberOfLabels];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    subviews = self->_subviews;
    uint64_t v10 = [(NSMutableArray *)subviews countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      double v13 = *MEMORY[0x263F001A8];
      double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(subviews);
          }
          double v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = [v18 tag];
          if (v19 < 51000)
          {
            BOOL v24 = v19 < 50000 || v19 - 50000 >= v8;
            double v20 = v14;
            double v21 = v15;
            double v22 = v16;
            double v23 = v13;
            if (!v24) {
              -[SUCellConfiguration frameForLabelAtIndex:](self->_configuration, "frameForLabelAtIndex:", v13, v14, v15, v16);
            }
          }
          else
          {
            double v20 = v14;
            double v21 = v15;
            double v22 = v16;
            double v23 = v13;
            if (v19 - 51000 < v7) {
              -[SUCellConfiguration frameForImageAtIndex:](self->_configuration, "frameForImageAtIndex:", v13, v14, v15, v16);
            }
          }
          objc_msgSend(v18, "setFrame:", v4 + v23, v20, v21, v22);
        }
        uint64_t v11 = [(NSMutableArray *)subviews countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SUTableCellContentView;
  [(SUTableCellContentView *)&v25 layoutSubviews];
}

- (void)reloadView
{
  if (*((unsigned char *)self + 456)) {
    [(SUTableCellContentView *)self _reloadSubviewsForConfiguration];
  }
  else {
    [(SUTableCellContentView *)self setNeedsDisplay];
  }
}

- (BOOL)drawAsDisabled
{
  return *((unsigned char *)self + 432) & 1;
}

- (BOOL)highlightsOnlyContentView
{
  return (*((unsigned __int8 *)self + 432) >> 2) & 1;
}

- (BOOL)isDeleteConfirmationVisible
{
  return [(SUCellConfiguration *)self->_configuration isDeleteConfirmationVisible];
}

- (BOOL)isHighlighted
{
  return (*((unsigned __int8 *)self + 432) >> 1) & 1;
}

- (void)setClipCorners:(int)a3
{
  if (self->_clipCorners != a3)
  {
    self->_clipCorners = a3;

    self->_clipPath = 0;
    if ((*((unsigned char *)self + 456) & 1) == 0)
    {
      [(SUTableCellContentView *)self setNeedsDisplay];
    }
  }
}

- (void)setConfiguration:(id)a3
{
  configuration = self->_configuration;
  if (configuration == a3)
  {
    if (![a3 needsDisplay]) {
      return;
    }
  }
  else
  {
    if ((SUTableCellContentView *)[(SUCellConfiguration *)configuration view] == self) {
      [(SUCellConfiguration *)self->_configuration setView:0];
    }

    double v6 = (SUCellConfiguration *)a3;
    self->_configuration = v6;
    [(SUCellConfiguration *)v6 setView:self];
    if (![(SUCellConfiguration *)self->_configuration needsDisplay]) {
      goto LABEL_8;
    }
  }
  [(SUCellConfiguration *)self->_configuration setNeedsDisplay:0];
  [(SUCellConfiguration *)self->_configuration reloadData];
LABEL_8:

  [(SUTableCellContentView *)self reloadView];
}

- (void)setDeleteConfirmationVisisble:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUCellConfiguration *)self->_configuration isDeleteConfirmationVisible] != a3)
  {
    [(SUCellConfiguration *)self->_configuration setIsDeleteConfirmationVisible:v3];
    [(SUTableCellContentView *)self _reloadSubviewAlphasAnimated:0];
  }
}

- (void)setDrawAsDisabled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 432);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 432) = v3 & 0xFE | a3;
    if (*((unsigned char *)self + 456)) {
      [(SUTableCellContentView *)self _updateDisabledStyleForSubviews];
    }
    else {
      [(SUTableCellContentView *)self setNeedsDisplay];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUTableCellContentView *)self frame];
  if (v9 != width || v8 != height)
  {
    if ((*((unsigned char *)self + 456) & 1) == 0) {
      [(SUTableCellContentView *)self setNeedsDisplay];
    }

    self->_clipPath = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUTableCellContentView;
  -[SUTableCellContentView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 432) = *((unsigned char *)self + 432) & 0xFB | v3;
}

- (void)setHighlighted:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 432);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 432) = v3 & 0xFD | v4;
    if ((*((unsigned char *)self + 456) & 1) == 0) {
      [(SUTableCellContentView *)self setNeedsDisplay];
    }
  }
}

- (void)setUsesSubviews:(BOOL)a3
{
}

- (void)setUsesSubviews:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__stopUsingSubviewLayout object:0];
  if (v5)
  {
    [(SUTableCellContentView *)self _startUsingSubviewLayout];
  }
  else if (a4)
  {
    [(SUTableCellContentView *)self setDeleteConfirmationVisisble:0];
    [(SUTableCellContentView *)self performSelector:sel__stopUsingSubviewLayout withObject:0 afterDelay:0.4];
  }
  else
  {
    [(SUTableCellContentView *)self _stopUsingSubviewLayout];
  }
}

- (BOOL)usesSubviews
{
  return *((unsigned char *)self + 456) & 1;
}

- (id)_clipPath
{
  id result = self->_clipPath;
  if (!result)
  {
    if (self->_clipCorners)
    {
      [(SUTableCellContentView *)self bounds];
      CGRect v5 = CGRectInset(v4, -0.25, -0.25);
      id result = (id)objc_msgSend(MEMORY[0x263F1C478], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", self->_clipCorners, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 10.0);
      self->_clipPath = (UIBezierPath *)result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_clippedImageForImage:(id)a3
{
  if (!a3) {
    return 0;
  }
  [(SUTableCellContentView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  CGFloat v12 = v11;
  v15.double width = v10;
  v15.double height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  objc_msgSend(-[SUTableCellContentView _clipPath](self, "_clipPath"), "clip");
  objc_msgSend(a3, "drawInRect:", v6, v8, v10, v10);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (void)_reloadSubviewAlphasAnimated:(BOOL)a3
{
  BOOL v19 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v4 = objc_opt_respondsToSelector();
  double v18 = self;
  char v5 = objc_opt_respondsToSelector();
  if (v5 & 1) != 0 || (v4)
  {
    unint64_t v17 = [(SUCellConfiguration *)self->_configuration numberOfImages];
    unint64_t v16 = [(SUCellConfiguration *)self->_configuration numberOfLabels];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    subviews = self->_subviews;
    uint64_t v7 = [(NSMutableArray *)subviews countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(subviews);
          }
          double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v11 tag];
          if (v12 < 51000)
          {
            double v13 = 1.0;
            if (v12 >= 50000 && (v5 & 1) != 0 && v12 - 50000 < v16)
            {
              -[SUCellConfiguration alphaForLabelAtIndex:fromAlpha:withModifiers:](v18->_configuration, "alphaForLabelAtIndex:fromAlpha:withModifiers:");
              goto LABEL_15;
            }
          }
          else
          {
            double v13 = 1.0;
            if ((v4 & 1) != 0 && v12 - 51000 < v17)
            {
              -[SUCellConfiguration alphaForImageAtIndex:fromAlpha:withModifiers:](v18->_configuration, "alphaForImageAtIndex:fromAlpha:withModifiers:");
LABEL_15:
              double v13 = v14;
            }
          }
          [v11 alpha];
          if (vabdd_f64(v15, v13) > 0.00000011920929)
          {
            [v11 setAlpha:1.0];
            if (v19)
            {
              [MEMORY[0x263F1CB60] beginAnimations:@"subviewAlphaAnimation" context:0];
              [v11 setAlpha:v13];
              [MEMORY[0x263F1CB60] commitAnimations];
            }
            else
            {
              [v11 setAlpha:v13];
            }
          }
        }
        uint64_t v8 = [(NSMutableArray *)subviews countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
}

- (void)_reloadSubviewsForConfiguration
{
  [(NSMutableArray *)self->_subviews makeObjectsPerformSelector:sel_removeFromSuperview];

  self->_subviews = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = (2 * (*((unsigned char *)self + 432) & 1)) | 4;
  [(SUTableCellContentView *)self bounds];
  -[SUCellConfiguration setLayoutSize:](self->_configuration, "setLayoutSize:", v4, v5);
  unint64_t v6 = [(SUCellConfiguration *)self->_configuration numberOfLabels];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      Label = __CreateLabel(self->_configuration, i, v3);
      if (Label)
      {
        double v10 = Label;
        [(SUTableCellContentView *)self addSubview:Label];
        [(NSMutableArray *)self->_subviews addObject:v10];
      }
    }
  }
  unint64_t v11 = [(SUCellConfiguration *)self->_configuration numberOfImages];
  if (v11)
  {
    unint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
    {
      id v14 = [(SUCellConfiguration *)self->_configuration imageAtIndex:j withModifiers:v3];
      id v15 = [(SUCellConfiguration *)self->_configuration imageAtIndex:j withModifiers:v3 | 1];
      if (self->_clipCorners)
      {
        id v14 = [(SUTableCellContentView *)self _clippedImageForImage:v14];
        id v15 = [(SUTableCellContentView *)self _clippedImageForImage:v15];
      }
      if (v14)
      {
        id v16 = objc_alloc(MEMORY[0x263F1C6D0]);
        [(SUCellConfiguration *)self->_configuration frameForImageAtIndex:j];
        unint64_t v17 = objc_msgSend(v16, "initWithFrame:");
        double v18 = v17;
        if (*((unsigned char *)self + 432)) {
          double v19 = 0.330000013;
        }
        else {
          double v19 = 1.0;
        }
        [v17 setAlpha:v19];
        if (v15 == v14) {
          id v20 = 0;
        }
        else {
          id v20 = v15;
        }
        [v18 setHighlightedImage:v20];
        [v18 setImage:v14];
        [v18 setTag:j + 51000];
        [v18 setUserInteractionEnabled:0];
        [(SUTableCellContentView *)self addSubview:v18];
        [(NSMutableArray *)self->_subviews addObject:v18];
      }
    }
  }
  [(SUTableCellContentView *)self _reloadSubviewAlphasAnimated:1];

  [(SUTableCellContentView *)self setNeedsLayout];
}

- (void)_removeSubviewsForConfiguration
{
  self->_subviews = 0;
}

- (void)_startUsingSubviewLayout
{
  if ((*((unsigned char *)self + 456) & 1) == 0)
  {
    *((unsigned char *)self + 456) |= 1u;
    [(SUTableCellContentView *)self _reloadSubviewsForConfiguration];
    uint64_t v3 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v3, sel_drawBackgroundWithModifiers_);
    if (InstanceMethod)
    {
      double v5 = InstanceMethod;
      unint64_t v6 = (objc_class *)objc_opt_class();
      if (v5 != class_getInstanceMethod(v6, sel_drawBackgroundWithModifiers_))
      {
        unint64_t v7 = [SUTableCellContentOverlayView alloc];
        [(SUTableCellContentView *)self bounds];
        uint64_t v8 = -[SUTableCellContentOverlayView initWithFrame:](v7, "initWithFrame:");
        self->_overlayView = v8;
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
        [(UIView *)self->_overlayView setConfiguration:self->_configuration];
        [(SUTableCellContentView *)self addSubview:self->_overlayView];
      }
    }
    [(SUTableCellContentView *)self setNeedsDisplay];
  }
}

- (void)_stopUsingSubviewLayout
{
  if (*((unsigned char *)self + 456))
  {
    *((unsigned char *)self + 456) &= ~1u;
    [(SUTableCellContentView *)self _removeSubviewsForConfiguration];
    [(UIView *)self->_overlayView removeFromSuperview];

    self->_overlayView = 0;
    [(SUTableCellContentView *)self setNeedsDisplay];
  }
}

- (void)_updateDisabledStyleForSubviews
{
  char v3 = *((unsigned char *)self + 432);
  unint64_t v4 = [(SUCellConfiguration *)self->_configuration numberOfLabels];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 2 * (v3 & 1);
    do
    {
      if (objc_msgSend(-[SUCellConfiguration stringForLabelAtIndex:](self->_configuration, "stringForLabelAtIndex:", v6), "length"))
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subviews, "objectAtIndex:", v7++), "setTextColor:", -[SUCellConfiguration colorForLabelAtIndex:withModifiers:](self->_configuration, "colorForLabelAtIndex:withModifiers:", v6, v8));
      }
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v9 = [(SUCellConfiguration *)self->_configuration numberOfImages];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ([(SUCellConfiguration *)self->_configuration imageAtIndex:i withModifiers:0])
      {
        unint64_t v12 = (void *)[(NSMutableArray *)self->_subviews objectAtIndex:v7];
        if (*((unsigned char *)self + 432)) {
          double v13 = 0.330000013;
        }
        else {
          double v13 = 0.0;
        }
        [v12 setAlpha:v13];
        ++v7;
      }
    }
  }
}

- (int)clipCorners
{
  return self->_clipCorners;
}

- (SUCellConfiguration)configuration
{
  return self->_configuration;
}

@end