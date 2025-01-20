@interface _TVAnimatedLabel
- (BOOL)_isRTL;
- (BOOL)_shouldCycle;
- (BOOL)isAnimating;
- (BOOL)isPaused;
- (NSArray)attributedStrings;
- (_TVAnimatedLabel)initWithFrame:(CGRect)a3;
- (__TVAnimatedImageView)currentMarqueeView;
- (__TVAnimatedImageView)nextMarqueeView;
- (double)crossfadeDuration;
- (double)marqueeDelay;
- (double)maskCapWidth;
- (double)replicationPadding;
- (double)underPosterOutset;
- (float)scrollRate;
- (id)_rasterizedTextWithMarquee:(BOOL)a3;
- (unint64_t)currentAttributedStringIndex;
- (void)_clearAnimations;
- (void)_clearAttributedStrings;
- (void)_prepareNextMarqueeWithDelay:(double)a3;
- (void)_startMarqueeIfNeeded;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)drawTextInRect:(CGRect)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAttributedStrings:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setCrossfadeDuration:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMarqueeDelay:(double)a3;
- (void)setMaskCapWidth:(double)a3;
- (void)setNeedsDisplay;
- (void)setPaused:(BOOL)a3;
- (void)setReplicationPadding:(double)a3;
- (void)setScrollRate:(float)a3;
- (void)setText:(id)a3;
- (void)setUnderPosterOutset:(double)a3;
- (void)stopAndResetScrollWithDuration:(double)a3;
- (void)stopAnimating;
- (void)stopAnimatingWithoutResetWithDuration:(double)a3;
@end

@implementation _TVAnimatedLabel

- (_TVAnimatedLabel)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_TVAnimatedLabel;
  v3 = -[_TVLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_marqueeing = 0;
    v3->_animating = 0;
    v3->_crossfading = 0;
    v3->_marqueeDelay = 2.0;
    v3->_replicationPadding = 40.0;
    v3->_maskCapWidth = 20.0;
    v3->_scrollRate = 45.0;
    v3->_crossfadeDuration = 1.5;
    v5 = [__TVAnimatedImageView alloc];
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    v10 = -[__TVAnimatedImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    [(_TVAnimatedLabel *)v4 addSubview:v10];
    objc_storeWeak((id *)&v4->_currentMarqueeView, v10);
    [(__TVAnimatedImageView *)v10 setHidden:1];
    v11 = -[__TVAnimatedImageView initWithFrame:]([__TVAnimatedImageView alloc], "initWithFrame:", v6, v7, v8, v9);
    [(_TVAnimatedLabel *)v4 addSubview:v11];
    objc_storeWeak((id *)&v4->_nextMarqueeView, v11);
    [(__TVAnimatedImageView *)v11 setHidden:1];
  }
  return v4;
}

- (void)dealloc
{
  [(_TVAnimatedLabel *)self _clearAnimations];
  v3.receiver = self;
  v3.super_class = (Class)_TVAnimatedLabel;
  [(_TVAnimatedLabel *)&v3 dealloc];
}

- (void)setText:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x263F086A0];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(_TVAnimatedLabel *)self setAttributedText:v6];
}

- (void)setAttributedText:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v7 = a3;
    v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v6 = 0;
  }
  -[_TVAnimatedLabel setAttributedStrings:](self, "setAttributedStrings:", v6, v7, v8);
}

- (void)_clearAttributedStrings
{
  attributedStrings = self->_attributedStrings;
  self->_attributedStrings = 0;

  self->_currentAttributedStringIndex = 0;
  v4.receiver = self;
  v4.super_class = (Class)_TVAnimatedLabel;
  [(_TVLabel *)&v4 setAttributedText:0];
  [(_TVAnimatedLabel *)self setNeedsDisplay];
}

- (void)setAttributedStrings:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(NSArray *)self->_attributedStrings isEqual:v4] & 1) == 0)
  {
    id v17 = v4;
    id v5 = (NSArray *)[v4 copy];
    attributedStrings = self->_attributedStrings;
    self->_attributedStrings = v5;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = self->_attributedStrings;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      uint64_t v9 = *MEMORY[0x263F1C208];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_initWeak(&location, self);
          uint64_t v12 = [v11 length];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __41___TVAnimatedLabel_setAttributedStrings___block_invoke;
          v20[3] = &unk_264BA72F8;
          v20[4] = self;
          objc_copyWeak(&v21, &location);
          objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v12, 0, v20);
          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
        uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    [(_TVAnimatedLabel *)self _clearAnimations];
    objc_super v13 = [(_TVAnimatedLabel *)self currentMarqueeView];
    [v13 setHidden:1];

    v14 = [(_TVAnimatedLabel *)self nextMarqueeView];
    [v14 setHidden:1];

    self->_currentAttributedStringIndex = 0;
    v15 = [(NSArray *)self->_attributedStrings firstObject];
    v16 = (void *)[v15 copy];
    v19.receiver = self;
    v19.super_class = (Class)_TVAnimatedLabel;
    [(_TVLabel *)&v19 setAttributedText:v16];

    [(_TVLabel *)self setLineBreakMode:2];
    [(_TVAnimatedLabel *)self setNeedsDisplay];
    id v4 = v17;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAnimatedLabel;
  [(_TVLabel *)&v6 setHighlighted:a3];
  [(_TVAnimatedLabel *)self setNeedsDisplay];
  if (self->_animating && self->_marqueeing)
  {
    id v4 = [(_TVAnimatedLabel *)self currentMarqueeView];
    id v5 = [(_TVAnimatedLabel *)self _rasterizedTextWithMarquee:self->_marqueeNeeded];
    [v4 setImage:v5];
  }
}

- (void)setNeedsDisplay
{
  if (!self->_marqueeing)
  {
    v2.receiver = self;
    v2.super_class = (Class)_TVAnimatedLabel;
    [(_TVAnimatedLabel *)&v2 setNeedsDisplay];
  }
}

- (void)_clearAnimations
{
  objc_super v3 = [(_TVAnimatedLabel *)self currentMarqueeView];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  id v5 = [(_TVAnimatedLabel *)self nextMarqueeView];
  objc_super v6 = [v5 layer];
  [v6 removeAllAnimations];

  [(CALayer *)self->_maskLayer removeAllAnimations];
  uint64_t v7 = [(_TVAnimatedLabel *)self layer];
  [v7 setMask:0];

  self->_marqueeing = 0;
  self->_crossfading = 0;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating == a3) {
    return;
  }
  self->_animating = a3;
  if (!self->_marqueeNeeded) {
    return;
  }
  id v4 = [(_TVAnimatedLabel *)self currentMarqueeView];
  [v4 setHidden:1];

  id v5 = [(_TVAnimatedLabel *)self nextMarqueeView];
  [v5 setHidden:1];

  if (self->_stopping && self->_animating)
  {
    self->_stopping = 0;
    return;
  }
  if (self->_starting)
  {
    if (!self->_animating)
    {
      self->_starting = 0;
      return;
    }
    goto LABEL_10;
  }
  if (self->_animating)
  {
LABEL_10:
    objc_super v6 = [(_TVAnimatedLabel *)self layer];
    [v6 setOpaque:0];

    uint64_t v7 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      -[_TVAnimatedLabel setAnimating:](v7);
    }
    self->_starting = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33___TVAnimatedLabel_setAnimating___block_invoke;
    block[3] = &unk_264BA6918;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    return;
  }
  [(_TVAnimatedLabel *)self _clearAnimations];
  self->_stopping = 0;
  self->_starting = 0;
  self->_currentAttributedStringIndex = 0;
  uint64_t v9 = [(NSArray *)self->_attributedStrings firstObject];
  v10 = (void *)[v9 copy];
  [(_TVAnimatedLabel *)self setAttributedText:v10];

  [(_TVAnimatedLabel *)self setNeedsDisplay];
}

- (void)stopAnimating
{
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!a3) {
      [(_TVAnimatedLabel *)self _startMarqueeIfNeeded];
    }
  }
}

- (void)stopAnimatingWithoutResetWithDuration:(double)a3
{
  if ([(_TVAnimatedLabel *)self isAnimating])
  {
    if (self->_marqueeNeeded)
    {
      id v5 = (void *)TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
        -[_TVAnimatedLabel stopAnimatingWithoutResetWithDuration:](v5);
      }
      self->_stopping = 1;
      objc_initWeak(&location, self);
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke;
      block[3] = &unk_264BA6918;
      objc_copyWeak(&v8, &location);
      block[4] = self;
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      [(_TVAnimatedLabel *)self stopAnimating];
    }
  }
}

- (void)stopAndResetScrollWithDuration:(double)a3
{
  if (a3 > 0.0 && self->_marqueeNeeded)
  {
    [(_TVAnimatedLabel *)self bounds];
    uint64_t v51 = v6;
    uint64_t v52 = v5;
    double v8 = v7;
    uint64_t v49 = v9;
    [(_TVAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    double v47 = v10;
    uint64_t v48 = v11;
    double v50 = v8;
    double v12 = v10 + v8;
    [(_TVAnimatedLabel *)self replicationPadding];
    double v46 = v13 + v12;
    v14 = [(_TVAnimatedLabel *)self currentMarqueeView];
    v15 = [v14 layer];
    v16 = [v15 presentationLayer];
    [v16 contentsRect];
    double v18 = v17;
    double v44 = v20;
    double v45 = v19;
    double v43 = v21;

    v22 = [(CALayer *)self->_maskLayer presentationLayer];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    v31 = [(CALayer *)self->_maskLayer presentationLayer];
    [v31 position];
    double v33 = v32;
    double v35 = v34;

    v36 = [(_TVAnimatedLabel *)self currentMarqueeView];
    v37 = [v36 layer];
    [v37 removeAllAnimations];

    [(CALayer *)self->_maskLayer removeAllAnimations];
    v38 = [(_TVAnimatedLabel *)self currentMarqueeView];
    v39 = [v38 layer];
    objc_msgSend(v39, "setContentsRect:", v18, v45, v44, v43);

    -[CALayer setBounds:](self->_maskLayer, "setBounds:", v24, v26, v28, v30);
    -[CALayer setPosition:](self->_maskLayer, "setPosition:", v33, v35);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke;
    v55[3] = &unk_264BA7320;
    v55[4] = self;
    *(double *)&v55[5] = v47;
    v55[6] = v48;
    *(double *)&v55[7] = v46;
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2;
    v54[3] = &unk_264BA6D78;
    v54[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:327686 delay:v55 options:v54 animations:a3 completion:0.0];
    v40 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      -[_TVAnimatedLabel stopAndResetScrollWithDuration:](v40);
    }
    double v41 = 100000000.0;
    if (a3 + -0.2 >= 0.1) {
      double v41 = (a3 + -0.2) * 1000000000.0;
    }
    dispatch_time_t v42 = dispatch_time(0, (uint64_t)v41);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_34;
    block[3] = &unk_264BA6C60;
    block[4] = self;
    void block[5] = v52;
    block[6] = v51;
    *(double *)&block[7] = v50;
    block[8] = v49;
    dispatch_after(v42, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(_TVAnimatedLabel *)self setAnimating:0];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAnimatedLabel;
  [(_TVAnimatedLabel *)&v4 didMoveToWindow];
  objc_super v3 = [(_TVAnimatedLabel *)self window];

  if (!v3) {
    [(_TVAnimatedLabel *)self stopAnimating];
  }
}

- (BOOL)_isRTL
{
  objc_super v2 = [(_TVAnimatedLabel *)self text];
  char v3 = [v2 isNaturallyRTL];

  return v3;
}

- (void)drawTextInRect:(CGRect)a3
{
  if (!self->_crossfading)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [(_TVAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    self->_marqueeNeeded = v8 > width + self->_underPosterOutset * -2.0;
    BOOL v9 = [(_TVAnimatedLabel *)self _isRTL];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    CGContextClipToRect(CurrentContext, v17);
    if (self->_marqueeNeeded && [(_TVAnimatedLabel *)self isAnimating])
    {
      CGContextClear();
      if (self->_starting || self->_marqueeNeeded && [(_TVAnimatedLabel *)self isAnimating])
      {
        self->_starting = 0;
        [(_TVAnimatedLabel *)self _startMarqueeIfNeeded];
      }
    }
    else
    {
      -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:");
    }
    CGContextRestoreGState(CurrentContext);
    if (self->_marqueeNeeded)
    {
      if (drawTextInRect____once != -1) {
        dispatch_once(&drawTextInRect____once, &__block_literal_global_19);
      }
      if (v9)
      {
        id v11 = [(id)drawTextInRect____maskImage imageWithHorizontallyFlippedOrientation];
      }
      else
      {
        id v11 = (id)drawTextInRect____maskImage;
      }
      id v15 = v11;
      [v11 size];
      double v13 = v12;
      double v14 = x + width - v12;
      if (v9) {
        double v14 = 0.0;
      }
      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 22, v14, y, v13, height, 1.0);
    }
  }
}

- (id)_rasterizedTextWithMarquee:(BOOL)a3
{
  BOOL v3 = a3;
  [(_TVAnimatedLabel *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(_TVAnimatedLabel *)self textSizeForWidth:3.40282347e38];
  double v14 = v13;
  double v15 = 0.0;
  if (v3)
  {
    [(_TVAnimatedLabel *)self replicationPadding];
    double v15 = v14 + v16;
  }
  CGRect v17 = [(_TVAnimatedLabel *)self backgroundColor];
  BOOL v18 = [(_TVAnimatedLabel *)self _isRTL];
  double v19 = 0;
  if (v12 != 0.0)
  {
    double v20 = v10 + v15;
    if (v20 != 0.0)
    {
      BOOL v21 = v18;
      v35.double width = v20;
      v35.double height = v12;
      UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
      if (v17)
      {
        [v17 set];
        v36.origin.double x = 0.0;
        v36.origin.double y = 0.0;
        v36.size.double width = v20;
        v36.size.double height = v12;
        UIRectFill(v36);
      }
      if (v3)
      {
        if (v21) {
          double underPosterOutset = v20 - self->_underPosterOutset - v14;
        }
        else {
          double underPosterOutset = self->_underPosterOutset;
        }
        -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", underPosterOutset, 0.0, v14, v12);
        uint64_t v23 = 0;
        double v24 = underPosterOutset;
        double v25 = v14;
        double v26 = v12;
        if (v21)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v24);
          [(_TVAnimatedLabel *)self replicationPadding];
          double v29 = MinX - v28 - v14;
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
          [(_TVAnimatedLabel *)self replicationPadding];
          double v29 = MaxX + v32;
        }
        -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v29, 0.0, v14, v12);
      }
      else
      {
        BOOL animating = self->_animating;
        self->_BOOL animating = 0;
        -[_TVAnimatedLabel drawTextInRect:](self, "drawTextInRect:", v6, v8, v10, v12);
        self->_BOOL animating = animating;
      }
      double v19 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
  }

  return v19;
}

- (void)_prepareNextMarqueeWithDelay:(double)a3
{
  double v5 = [(_TVAnimatedLabel *)self currentMarqueeView];
  double v6 = [(_TVAnimatedLabel *)self nextMarqueeView];
  unint64_t v7 = [(_TVAnimatedLabel *)self currentAttributedStringIndex] + 1;
  double v8 = [(_TVAnimatedLabel *)self attributedStrings];
  unint64_t v9 = v7 % [v8 count];

  self->_currentAttributedStringIndedouble x = v9;
  double v10 = [(_TVAnimatedLabel *)self attributedStrings];
  double v11 = [v10 objectAtIndex:self->_currentAttributedStringIndex];
  double v12 = (void *)[v11 copy];

  self->_BOOL animating = 0;
  v31.receiver = self;
  v31.super_class = (Class)_TVAnimatedLabel;
  [(_TVLabel *)&v31 setAttributedText:v12];
  [(_TVLabel *)self setLineBreakMode:2];
  self->_BOOL animating = 1;
  double v13 = [(_TVAnimatedLabel *)self _rasterizedTextWithMarquee:0];
  [v6 setImage:v13];

  double v14 = [v6 layer];
  objc_msgSend(v14, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  [v6 sizeToFit];
  [(_TVAnimatedLabel *)self bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setHidden:0];
  [v6 setAlpha:0.0];
  self->_crossfading = 1;
  objc_initWeak(&location, self);
  double v15 = (void *)MEMORY[0x263F1CB60];
  [(_TVAnimatedLabel *)self crossfadeDuration];
  double v17 = v16;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke;
  v27[3] = &unk_264BA64A0;
  id v18 = v5;
  id v28 = v18;
  id v19 = v6;
  id v29 = v19;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2;
  v22[3] = &unk_264BA7348;
  objc_copyWeak(&v26, &location);
  id v20 = v19;
  id v23 = v20;
  id v21 = v18;
  id v24 = v21;
  double v25 = self;
  [v15 animateWithDuration:0 delay:v27 options:v22 animations:v17 completion:a3];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldCycle
{
  objc_super v2 = [(_TVAnimatedLabel *)self attributedStrings];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)_startMarqueeIfNeeded
{
  v99[5] = *MEMORY[0x263EF8340];
  if (!self->_marqueeing && (self->_marqueeNeeded || [(_TVAnimatedLabel *)self _shouldCycle]))
  {
    BOOL v3 = [(_TVAnimatedLabel *)self _isRTL];
    self->_marqueeing = 1;
    [(_TVAnimatedLabel *)self bounds];
    double v94 = v4;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(_TVAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    double v12 = v11;
    double v13 = v8;
    if (self->_marqueeNeeded)
    {
      [(_TVAnimatedLabel *)self replicationPadding];
      double v13 = v12 + v8 + v14;
    }
    [(_TVAnimatedLabel *)self replicationPadding];
    double v16 = v12 + v15;
    [(_TVAnimatedLabel *)self scrollRate];
    double v18 = v16 / v17;
    [(_TVAnimatedLabel *)self marqueeDelay];
    double v20 = v19;
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke;
    v96[3] = &unk_264BA7370;
    v96[4] = self;
    *(double *)&v96[5] = v19;
    *(double *)&v96[6] = v18;
    id v21 = (void (**)(void))MEMORY[0x230FC9DC0](v96);
    v22 = [(_TVAnimatedLabel *)self currentMarqueeView];
    id v23 = [(_TVAnimatedLabel *)self _rasterizedTextWithMarquee:self->_marqueeNeeded];
    [v22 setImage:v23];

    objc_msgSend(v22, "setFrame:", v94, v6, v8, v10);
    id v24 = [v22 layer];
    double v25 = v8 / v13;
    objc_msgSend(v24, "setContentsRect:", 0.0, 0.0, v8 / v13, 1.0);

    [v22 setHidden:0];
    id v26 = [v22 layer];
    [v26 removeAllAnimations];

    [(CALayer *)self->_maskLayer removeAllAnimations];
    if (self->_marqueeNeeded)
    {
      double v91 = v12;
      double v93 = v20 + v18;
      double v89 = v13;
      if (_startMarqueeIfNeeded___once != -1) {
        dispatch_once(&_startMarqueeIfNeeded___once, &__block_literal_global_44);
      }
      [(id)_startMarqueeIfNeeded___maskImage size];
      double v28 = 1.0 / v27;
      id v29 = [MEMORY[0x263F157E8] layer];
      maskLayer = self->_maskLayer;
      self->_maskLayer = v29;

      -[CALayer setContents:](self->_maskLayer, "setContents:", [(id)_startMarqueeIfNeeded___maskImage CGImage]);
      double v31 = 0.0;
      -[CALayer setContentsCenter:](self->_maskLayer, "setContentsCenter:", 0.5 - v28 * 0.5, 0.0, v28, 1.0);
      [(id)_startMarqueeIfNeeded___maskImage scale];
      -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v94, v6, v8, v10);
      double v32 = self->_maskLayer;
      double v33 = [(_TVAnimatedLabel *)self layer];
      [v33 setMask:v32];

      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setCompletionBlock:v21];
      double v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"contentsRect.origin.x"];
      [v34 setDuration:v93];
      uint64_t v35 = *MEMORY[0x263F15AA8];
      [v34 setFillMode:*MEMORY[0x263F15AA8]];
      [v34 setBeginTime:v20 + CACurrentMediaTime()];
      [v34 setDuration:v18];
      double v36 = 1.0 - v25;
      if (!v3) {
        double v36 = 0.0;
      }
      v37 = [NSNumber numberWithDouble:v36];
      [v34 setFromValue:v37];

      v38 = NSNumber;
      if (!v3)
      {
        [(_TVAnimatedLabel *)self replicationPadding];
        double v31 = (v91 + v39) / v89;
      }
      v40 = [v38 numberWithDouble:v31];
      [v34 setToValue:v40];

      double v41 = [v22 layer];
      [v41 addAnimation:v34 forKey:@"TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

      if (self->_underPosterOutset == 0.0)
      {
        [NSNumber numberWithFloat:0.0];
        v87 = v92 = v21;
        v99[0] = v87;
        double v42 = v20 / v93;
        *(float *)&double v42 = v20 / v93;
        [NSNumber numberWithFloat:v42];
        double v43 = v86 = v3;
        v99[1] = v43;
        double v44 = NSNumber;
        [(_TVAnimatedLabel *)self scrollRate];
        double v46 = (v20 + 20.0 / v45) / v93;
        *(float *)&double v46 = v46;
        [v44 numberWithFloat:v46];
        uint64_t v47 = v35;
        uint64_t v48 = v85 = v35;
        v99[2] = v48;
        uint64_t v49 = NSNumber;
        [(_TVAnimatedLabel *)self scrollRate];
        double v51 = -20.0 / v50 / v93 + 1.0;
        *(float *)&double v51 = v51;
        [v49 numberWithFloat:v51];
        uint64_t v52 = v90 = v22;
        v99[3] = v52;
        LODWORD(v53) = 1.0;
        v54 = [NSNumber numberWithFloat:v53];
        v99[4] = v54;
        v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:5];

        [MEMORY[0x263F157D8] animationWithKeyPath:@"bounds.size.width"];
        v55 = v88 = v34;
        [v55 setDuration:v93];
        [v55 setFillMode:v47];
        [v55 setRemovedOnCompletion:0];
        double v56 = v8 + 20.0;
        float v57 = v8 + 20.0;
        *(float *)&double v56 = v57;
        v58 = [NSNumber numberWithFloat:v56];
        v98[0] = v58;
        *(float *)&double v59 = v57;
        v60 = [NSNumber numberWithFloat:v59];
        v98[1] = v60;
        float v61 = v8;
        *(float *)&double v62 = v61;
        v63 = [NSNumber numberWithFloat:v62];
        v98[2] = v63;
        *(float *)&double v64 = v8;
        v65 = [NSNumber numberWithFloat:v64];
        v98[3] = v65;
        *(float *)&double v66 = v57;
        v67 = [NSNumber numberWithFloat:v66];
        v98[4] = v67;
        v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:5];
        [v55 setValues:v68];

        [v55 setKeyTimes:v95];
        [(CALayer *)self->_maskLayer addAnimation:v55 forKey:@"TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey"];
        v69 = [MEMORY[0x263F157D8] animationWithKeyPath:@"position.x"];
        [v69 setDuration:v93];
        [v69 setFillMode:v85];
        [v69 setRemovedOnCompletion:0];
        if (v86) {
          double v70 = 20.0;
        }
        else {
          double v70 = -20.0;
        }
        double v71 = (v70 + v8) * 0.5;
        float v72 = v71;
        *(float *)&double v71 = v72;
        v73 = [NSNumber numberWithFloat:v71];
        v97[0] = v73;
        *(float *)&double v74 = v72;
        v75 = [NSNumber numberWithFloat:v74];
        v97[1] = v75;
        double v76 = v8 * 0.5;
        float v77 = v8 * 0.5;
        *(float *)&double v76 = v77;
        v78 = [NSNumber numberWithFloat:v76];
        v97[2] = v78;
        *(float *)&double v79 = v77;
        v80 = [NSNumber numberWithFloat:v79];
        v97[3] = v80;
        *(float *)&double v81 = v72;
        v82 = [NSNumber numberWithFloat:v81];
        v97[4] = v82;
        v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:5];
        [v69 setValues:v83];

        id v21 = v92;
        v22 = v90;
        [v69 setKeyTimes:v95];
        [(CALayer *)self->_maskLayer addAnimation:v69 forKey:@"TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey"];

        double v34 = v88;
      }
      [MEMORY[0x263F158F8] commit];
    }
    else
    {
      v84 = [(_TVAnimatedLabel *)self layer];
      [v84 setMask:0];

      v21[2](v21);
    }
  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (void)setMarqueeDelay:(double)a3
{
  self->_marqueeDeladouble y = a3;
}

- (double)replicationPadding
{
  return self->_replicationPadding;
}

- (void)setReplicationPadding:(double)a3
{
  self->_replicationPadding = a3;
}

- (double)maskCapWidth
{
  return self->_maskCapWidth;
}

- (void)setMaskCapWidth:(double)a3
{
  self->_maskCapWidth = a3;
}

- (float)scrollRate
{
  return self->_scrollRate;
}

- (void)setScrollRate:(float)a3
{
  self->_scrollRate = a3;
}

- (double)crossfadeDuration
{
  return self->_crossfadeDuration;
}

- (void)setCrossfadeDuration:(double)a3
{
  self->_crossfadeDuration = a3;
}

- (NSArray)attributedStrings
{
  return self->_attributedStrings;
}

- (unint64_t)currentAttributedStringIndex
{
  return self->_currentAttributedStringIndex;
}

- (double)underPosterOutset
{
  return self->_underPosterOutset;
}

- (void)setUnderPosterOutset:(double)a3
{
  self->_double underPosterOutset = a3;
}

- (__TVAnimatedImageView)currentMarqueeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentMarqueeView);
  return (__TVAnimatedImageView *)WeakRetained;
}

- (__TVAnimatedImageView)nextMarqueeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextMarqueeView);
  return (__TVAnimatedImageView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextMarqueeView);
  objc_destroyWeak((id *)&self->_currentMarqueeView);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

- (void)setAnimating:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v4, v5, "AL(%@): starting timeout begin", v6, v7, v8, v9, v10);
}

- (void)stopAnimatingWithoutResetWithDuration:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v4, v5, "AL(%@): stopping timeout begin", v6, v7, v8, v9, v10);
}

- (void)stopAndResetScrollWithDuration:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v4, v5, "AL(%@): stop-and-reset timeout begin", v6, v7, v8, v9, v10);
}

@end