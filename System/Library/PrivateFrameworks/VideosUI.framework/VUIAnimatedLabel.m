@interface VUIAnimatedLabel
- (BOOL)_isRTL;
- (BOOL)_shouldCycle;
- (BOOL)isAnimating;
- (BOOL)isPaused;
- (NSArray)attributedStrings;
- (UIImage)marqueeContentImage;
- (VUIAnimatedLabel)initWithFrame:(CGRect)a3;
- (__TVAnimatedImageView)currentMarqueeView;
- (__TVAnimatedImageView)nextMarqueeView;
- (double)animationDuration;
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
- (void)setMarqueeContentImage:(id)a3;
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

@implementation VUIAnimatedLabel

- (VUIAnimatedLabel)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VUIAnimatedLabel;
  v3 = -[VUILabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[__TVAnimatedImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(VUIAnimatedLabel *)v4 addSubview:v10];
    objc_storeWeak((id *)&v4->_currentMarqueeView, v10);
    [(__TVAnimatedImageView *)v10 setHidden:1];
    v11 = -[__TVAnimatedImageView initWithFrame:]([__TVAnimatedImageView alloc], "initWithFrame:", v6, v7, v8, v9);
    [(VUIAnimatedLabel *)v4 addSubview:v11];
    objc_storeWeak((id *)&v4->_nextMarqueeView, v11);
    [(__TVAnimatedImageView *)v11 setHidden:1];
  }
  return v4;
}

- (void)dealloc
{
  [(VUIAnimatedLabel *)self _clearAnimations];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  [(VUILabel *)&v4 dealloc];
}

- (void)setText:(id)a3
{
  if (a3)
  {
    objc_super v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(VUIAnimatedLabel *)self setAttributedText:v6];
}

- (void)setAttributedText:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    objc_super v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v6 = 0;
  }
  -[VUIAnimatedLabel setAttributedStrings:](self, "setAttributedStrings:", v6, v7, v8);
}

- (void)_clearAttributedStrings
{
  attributedStrings = self->_attributedStrings;
  self->_attributedStrings = 0;

  self->_currentAttributedStringIndex = 0;
  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  [(VUILabel *)&v4 setAttributedText:0];
  [(VUIAnimatedLabel *)self setNeedsDisplay];
}

- (void)setAttributedStrings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
      uint64_t v9 = *MEMORY[0x1E4FB06B8];
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
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __41__VUIAnimatedLabel_setAttributedStrings___block_invoke;
          v20[3] = &unk_1E6DFA8A0;
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

    [(VUIAnimatedLabel *)self _clearAnimations];
    objc_super v13 = [(VUIAnimatedLabel *)self currentMarqueeView];
    [v13 setHidden:1];

    v14 = [(VUIAnimatedLabel *)self nextMarqueeView];
    [v14 setHidden:1];

    self->_currentAttributedStringIndex = 0;
    v15 = [(NSArray *)self->_attributedStrings firstObject];
    v16 = (void *)[v15 copy];
    v19.receiver = self;
    v19.super_class = (Class)VUIAnimatedLabel;
    [(VUILabel *)&v19 setAttributedText:v16];

    [(VUILabel *)self setLineBreakMode:2];
    [(VUIAnimatedLabel *)self setNeedsDisplay];
    id v4 = v17;
  }
}

void __41__VUIAnimatedLabel_setAttributedStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [*(id *)(a1 + 32) effectiveUserInterfaceLayoutDirection] == 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__VUIAnimatedLabel_setAttributedStrings___block_invoke_2;
    v6[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v6);
    objc_destroyWeak(&v7);
  }
}

void __41__VUIAnimatedLabel_setAttributedStrings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIAnimatedLabel;
  [(VUILabel *)&v6 setHighlighted:a3];
  [(VUIAnimatedLabel *)self setNeedsDisplay];
  if (self->_animating && self->_marqueeing)
  {
    id v4 = [(VUIAnimatedLabel *)self currentMarqueeView];
    BOOL v5 = [(VUIAnimatedLabel *)self _rasterizedTextWithMarquee:self->_marqueeNeeded];
    [v4 setImage:v5];
  }
}

- (void)setNeedsDisplay
{
  if (!self->_marqueeing)
  {
    v2.receiver = self;
    v2.super_class = (Class)VUIAnimatedLabel;
    [(VUIAnimatedLabel *)&v2 setNeedsDisplay];
  }
}

- (void)_clearAnimations
{
  id v3 = [(VUIAnimatedLabel *)self currentMarqueeView];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  BOOL v5 = [(VUIAnimatedLabel *)self nextMarqueeView];
  objc_super v6 = [v5 layer];
  [v6 removeAllAnimations];

  [(CALayer *)self->_maskLayer removeAllAnimations];
  id v7 = [(VUIAnimatedLabel *)self layer];
  [v7 setMask:0];

  self->_marqueeing = 0;
  self->_crossfading = 0;
}

- (void)setAnimating:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_animating == a3)
  {
    if (a3 && self->_stopping) {
      self->_stopping = 0;
    }
    return;
  }
  self->_animating = a3;
  if (!self->_marqueeNeeded) {
    return;
  }
  id v4 = [(VUIAnimatedLabel *)self currentMarqueeView];
  [v4 setHidden:1];

  BOOL v5 = [(VUIAnimatedLabel *)self nextMarqueeView];
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
    goto LABEL_13;
  }
  if (self->_animating)
  {
LABEL_13:
    objc_super v6 = [(VUIAnimatedLabel *)self layer];
    [v6 setOpaque:0];

    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(VUIAnimatedLabel *)self text];
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "AL(%@): starting timeout begin", buf, 0xCu);
    }
    self->_starting = 1;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v9 = dispatch_time(0, 100000000);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__VUIAnimatedLabel_setAnimating___block_invoke;
    v12[3] = &unk_1E6DF5490;
    objc_copyWeak(&v13, (id *)buf);
    v12[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    return;
  }
  [(VUIAnimatedLabel *)self _clearAnimations];
  self->_stopping = 0;
  self->_starting = 0;
  self->_currentAttributedStringIndex = 0;
  v10 = [(NSArray *)self->_attributedStrings firstObject];
  v11 = (void *)[v10 copy];
  [(VUIAnimatedLabel *)self setAttributedText:v11];

  [(VUIAnimatedLabel *)self setNeedsDisplay];
}

void __33__VUIAnimatedLabel_setAnimating___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 1011))
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = [*(id *)(a1 + 32) text];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "AL(%@): starting timeout end", (uint8_t *)&v6, 0xCu);
    }
    [v3 setNeedsDisplay];
  }
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
      [(VUIAnimatedLabel *)self _startMarqueeIfNeeded];
    }
  }
}

- (void)stopAnimatingWithoutResetWithDuration:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(VUIAnimatedLabel *)self isAnimating])
  {
    if (self->_marqueeNeeded)
    {
      BOOL v5 = VUIDefaultLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = [(VUIAnimatedLabel *)self text];
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "AL(%@): stopping timeout begin", buf, 0xCu);
      }
      self->_stopping = 1;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __58__VUIAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke;
      v8[3] = &unk_1E6DF5490;
      objc_copyWeak(&v9, (id *)buf);
      v8[4] = self;
      dispatch_after(v7, MEMORY[0x1E4F14428], v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(VUIAnimatedLabel *)self stopAnimating];
    }
  }
}

void __58__VUIAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1012])
  {
    id v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = [*(id *)(a1 + 32) text];
      int v6 = 138412290;
      dispatch_time_t v7 = v5;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "AL(%@): stopping timeout end", (uint8_t *)&v6, 0xCu);
    }
    v3[1012] = 0;
    [v3 stopAnimating];
  }
}

- (void)stopAndResetScrollWithDuration:(double)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0 && self->_marqueeNeeded)
  {
    [(VUIAnimatedLabel *)self bounds];
    uint64_t v52 = v6;
    uint64_t v53 = v5;
    double v8 = v7;
    uint64_t v50 = v9;
    [(VUIAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    double v48 = v10;
    uint64_t v49 = v11;
    double v51 = v8;
    double v12 = v10 + v8;
    [(VUIAnimatedLabel *)self replicationPadding];
    double v47 = v13 + v12;
    v14 = [(VUIAnimatedLabel *)self currentMarqueeView];
    v15 = [v14 layer];
    uint64_t v16 = [v15 presentationLayer];
    [v16 contentsRect];
    double v18 = v17;
    double v45 = v20;
    double v46 = v19;
    double v44 = v21;

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

    v36 = [v14 layer];
    [v36 removeAllAnimations];

    [(CALayer *)self->_maskLayer removeAllAnimations];
    v37 = [v14 layer];
    objc_msgSend(v37, "setContentsRect:", v18, v46, v45, v44);

    -[CALayer setBounds:](self->_maskLayer, "setBounds:", v24, v26, v28, v30);
    -[CALayer setPosition:](self->_maskLayer, "setPosition:", v33, v35);
    v38 = (void *)MEMORY[0x1E4FB1EB0];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke;
    v56[3] = &unk_1E6DFA8C8;
    double v59 = v48;
    uint64_t v60 = v49;
    double v61 = v47;
    id v57 = v14;
    v58 = self;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2;
    v55[3] = &unk_1E6DF5B20;
    v55[4] = self;
    id v39 = v14;
    [v38 animateWithDuration:327686 delay:v56 options:v55 animations:a3 completion:0.0];
    v40 = VUIDefaultLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = [(VUIAnimatedLabel *)self text];
      *(_DWORD *)buf = 138412290;
      v63 = v41;
      _os_log_impl(&dword_1E2BD7000, v40, OS_LOG_TYPE_INFO, "AL(%@): stop-and-reset timeout begin", buf, 0xCu);
    }
    double v42 = 100000000.0;
    if (a3 + -0.2 >= 0.1) {
      double v42 = (a3 + -0.2) * 1000000000.0;
    }
    dispatch_time_t v43 = dispatch_time(0, (uint64_t)v42);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_35;
    block[3] = &unk_1E6DF74D8;
    block[4] = self;
    block[5] = v53;
    block[6] = v52;
    *(double *)&block[7] = v51;
    block[8] = v50;
    dispatch_after(v43, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(VUIAnimatedLabel *)self setAnimating:0];
  }
}

void __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) layer];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = *(double *)(a1 + 48);
  double v12 = 0.0;
  if (v4 > v11 / *(double *)(a1 + 64) - v4)
  {
    [*(id *)(a1 + 40) replicationPadding];
    double v12 = (v11 + v13) / *(double *)(a1 + 64);
  }
  id v14 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v14, "setContentsRect:", v12, v6, v8, v10);
}

uint64_t __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnimating:0];
}

uint64_t __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_35(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = [*(id *)(a1 + 32) text];
    int v9 = 138412290;
    double v10 = v3;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "AL(%@): stop-and-reset timeout end", (uint8_t *)&v9, 0xCu);
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.2];
  double v4 = *(void **)(*(void *)(a1 + 32) + 1016);
  double v5 = *(double *)(a1 + 56) + 20.0;
  [v4 bounds];
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v5);
  double v6 = *(void **)(*(void *)(a1 + 32) + 1016);
  double v7 = (*(double *)(a1 + 56) + -20.0) * 0.5;
  [v6 position];
  [v6 setPosition:v7];
  return [MEMORY[0x1E4F39CF8] commit];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  [(VUIAnimatedLabel *)&v4 didMoveToWindow];
  double v3 = [(VUIAnimatedLabel *)self window];

  if (!v3) {
    [(VUIAnimatedLabel *)self stopAnimating];
  }
}

- (BOOL)_isRTL
{
  objc_super v2 = [(VUIAnimatedLabel *)self text];
  char v3 = [v2 _isNaturallyRTL];

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
    [(VUIAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    self->_marqueeNeeded = v8 > width + self->_underPosterOutset * -2.0;
    BOOL v9 = [(VUIAnimatedLabel *)self _isRTL];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    CGContextClipToRect(CurrentContext, v17);
    if (self->_marqueeNeeded && [(VUIAnimatedLabel *)self isAnimating])
    {
      CGContextClear();
      if (self->_starting || self->_marqueeNeeded && [(VUIAnimatedLabel *)self isAnimating])
      {
        self->_starting = 0;
        [(VUIAnimatedLabel *)self setMarqueeContentImage:0];
        [(VUIAnimatedLabel *)self _startMarqueeIfNeeded];
      }
    }
    else
    {
      -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:");
    }
    CGContextRestoreGState(CurrentContext);
    if (self->_marqueeNeeded)
    {
      if (drawTextInRect____once != -1) {
        dispatch_once(&drawTextInRect____once, &__block_literal_global_114);
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

void __35__VUIAnimatedLabel_drawTextInRect___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  id v3 = +[VUIUtilities VideosUIBundle];
  uint64_t v1 = [v0 imageNamed:@"UILabelMarqueeRightFade.png" inBundle:v3];
  objc_super v2 = (void *)drawTextInRect____maskImage;
  drawTextInRect____maskImage = v1;
}

- (id)_rasterizedTextWithMarquee:(BOOL)a3
{
  BOOL v3 = a3;
  [(VUIAnimatedLabel *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(VUIAnimatedLabel *)self textSizeForWidth:3.40282347e38];
  double v14 = v13;
  double v15 = 0.0;
  if (v3)
  {
    [(VUIAnimatedLabel *)self replicationPadding];
    double v15 = v14 + v16;
  }
  CGRect v17 = [(VUIAnimatedLabel *)self backgroundColor];
  BOOL v18 = [(VUIAnimatedLabel *)self _isRTL];
  double v19 = 0;
  if (v12 > 0.0)
  {
    double v20 = v10 + v15;
    if (v20 > 0.0)
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
        -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", underPosterOutset, 0.0, v14, v12);
        uint64_t v23 = 0;
        double v24 = underPosterOutset;
        double v25 = v14;
        double v26 = v12;
        if (v21)
        {
          double MinX = CGRectGetMinX(*(CGRect *)&v24);
          [(VUIAnimatedLabel *)self replicationPadding];
          double v29 = MinX - v28 - v14;
        }
        else
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
          [(VUIAnimatedLabel *)self replicationPadding];
          double v29 = MaxX + v32;
        }
        -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v29, 0.0, v14, v12);
      }
      else
      {
        BOOL animating = self->_animating;
        self->_BOOL animating = 0;
        -[VUIAnimatedLabel drawTextInRect:](self, "drawTextInRect:", v6, v8, v10, v12);
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
  double v5 = [(VUIAnimatedLabel *)self currentMarqueeView];
  double v6 = [(VUIAnimatedLabel *)self nextMarqueeView];
  unint64_t v7 = [(VUIAnimatedLabel *)self currentAttributedStringIndex] + 1;
  double v8 = [(VUIAnimatedLabel *)self attributedStrings];
  unint64_t v9 = v7 % [v8 count];

  self->_currentAttributedStringIndedouble x = v9;
  double v10 = [(VUIAnimatedLabel *)self attributedStrings];
  double v11 = [v10 objectAtIndex:self->_currentAttributedStringIndex];
  double v12 = (void *)[v11 copy];

  self->_BOOL animating = 0;
  v31.receiver = self;
  v31.super_class = (Class)VUIAnimatedLabel;
  [(VUILabel *)&v31 setAttributedText:v12];
  [(VUILabel *)self setLineBreakMode:2];
  self->_BOOL animating = 1;
  double v13 = [(VUIAnimatedLabel *)self _rasterizedTextWithMarquee:0];
  [v6 setImage:v13];

  double v14 = [v6 layer];
  objc_msgSend(v14, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  [v6 sizeToFit];
  [(VUIAnimatedLabel *)self bounds];
  objc_msgSend(v6, "setFrame:");
  [v6 setHidden:0];
  [v6 setAlpha:0.0];
  self->_crossfading = 1;
  objc_initWeak(&location, self);
  double v15 = (void *)MEMORY[0x1E4FB1EB0];
  [(VUIAnimatedLabel *)self crossfadeDuration];
  double v17 = v16;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke;
  v27[3] = &unk_1E6DF3F68;
  id v18 = v5;
  id v28 = v18;
  id v19 = v6;
  id v29 = v19;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2;
  v22[3] = &unk_1E6DFA8F0;
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

uint64_t __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  objc_super v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

void __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2(id *a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    WeakRetained[1008] = 0;
    double v8 = WeakRetained;
    double v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_storeWeak(v5 + 136, a1[4]);
    objc_storeWeak(v5 + 137, a1[5]);
    objc_sync_exit(v5);

    double v6 = [v5 nextMarqueeView];
    [v6 setAlpha:0.0];
    [v6 setHidden:1];
    unint64_t v7 = [a1[6] currentMarqueeView];
    [v5 bringSubviewToFront:v7];

    if (a2) {
      [a1[6] _startMarqueeIfNeeded];
    }

    id WeakRetained = v8;
  }
}

- (BOOL)_shouldCycle
{
  objc_super v2 = [(VUIAnimatedLabel *)self attributedStrings];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (double)animationDuration
{
  if (!self->_marqueeNeeded) {
    return 0.0;
  }
  [(VUIAnimatedLabel *)self bounds];
  [(VUIAnimatedLabel *)self textSizeForWidth:3.40282347e38];
  double v4 = v3;
  [(VUIAnimatedLabel *)self replicationPadding];
  double v6 = v4 + v5;
  [(VUIAnimatedLabel *)self scrollRate];
  double v8 = v6 / v7;
  [(VUIAnimatedLabel *)self marqueeDelay];
  return v9 + v8;
}

- (void)_startMarqueeIfNeeded
{
  v101[5] = *MEMORY[0x1E4F143B8];
  if (!self->_marqueeing && (self->_marqueeNeeded || [(VUIAnimatedLabel *)self _shouldCycle]))
  {
    BOOL v3 = [(VUIAnimatedLabel *)self _isRTL];
    self->_marqueeing = 1;
    [(VUIAnimatedLabel *)self bounds];
    double v96 = v4;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(VUIAnimatedLabel *)self textSizeForWidth:3.40282347e38];
    double v12 = v11;
    double v13 = v8;
    if (self->_marqueeNeeded)
    {
      [(VUIAnimatedLabel *)self replicationPadding];
      double v13 = v12 + v8 + v14;
    }
    [(VUIAnimatedLabel *)self replicationPadding];
    double v16 = v12 + v15;
    [(VUIAnimatedLabel *)self scrollRate];
    double v18 = v16 / v17;
    [(VUIAnimatedLabel *)self marqueeDelay];
    double v20 = v19;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke;
    aBlock[3] = &unk_1E6DFA918;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v19;
    *(double *)&aBlock[6] = v18;
    id v21 = (void (**)(void))_Block_copy(aBlock);
    v22 = [(VUIAnimatedLabel *)self currentMarqueeView];
    id v23 = [(VUIAnimatedLabel *)self marqueeContentImage];

    if (!v23)
    {
      id v24 = [(VUIAnimatedLabel *)self _rasterizedTextWithMarquee:self->_marqueeNeeded];
      [(VUIAnimatedLabel *)self setMarqueeContentImage:v24];
    }
    double v25 = [(VUIAnimatedLabel *)self marqueeContentImage];
    [v22 setImage:v25];

    objc_msgSend(v22, "setFrame:", v96, v6, v8, v10);
    id v26 = [v22 layer];
    double v27 = v8 / v13;
    objc_msgSend(v26, "setContentsRect:", 0.0, 0.0, v8 / v13, 1.0);

    [v22 setHidden:0];
    id v28 = [v22 layer];
    [v28 removeAllAnimations];

    [(CALayer *)self->_maskLayer removeAllAnimations];
    if (self->_marqueeNeeded)
    {
      double v93 = v12;
      double v95 = v20 + v18;
      double v91 = v13;
      if (_startMarqueeIfNeeded___once != -1) {
        dispatch_once(&_startMarqueeIfNeeded___once, &__block_literal_global_45);
      }
      [(id)_startMarqueeIfNeeded___maskImage size];
      double v30 = 1.0 / v29;
      objc_super v31 = [MEMORY[0x1E4F39BE8] layer];
      maskLayer = self->_maskLayer;
      self->_maskLayer = v31;

      -[CALayer setContents:](self->_maskLayer, "setContents:", [(id)_startMarqueeIfNeeded___maskImage CGImage]);
      double v33 = 0.0;
      -[CALayer setContentsCenter:](self->_maskLayer, "setContentsCenter:", 0.5 - v30 * 0.5, 0.0, v30, 1.0);
      [(id)_startMarqueeIfNeeded___maskImage scale];
      -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v96, v6, v8, v10);
      double v34 = self->_maskLayer;
      CGSize v35 = [(VUIAnimatedLabel *)self layer];
      [v35 setMask:v34];

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setCompletionBlock:v21];
      CGRect v36 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contentsRect.origin.x"];
      [v36 setDuration:v95];
      uint64_t v37 = *MEMORY[0x1E4F39FA0];
      [v36 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v36 setBeginTime:v20 + CACurrentMediaTime()];
      [v36 setDuration:v18];
      double v38 = 1.0 - v27;
      if (!v3) {
        double v38 = 0.0;
      }
      id v39 = [MEMORY[0x1E4F28ED0] numberWithDouble:v38];
      [v36 setFromValue:v39];

      v40 = (void *)MEMORY[0x1E4F28ED0];
      if (!v3)
      {
        [(VUIAnimatedLabel *)self replicationPadding];
        double v33 = (v93 + v41) / v91;
      }
      double v42 = [v40 numberWithDouble:v33];
      [v36 setToValue:v42];

      dispatch_time_t v43 = [v22 layer];
      [v43 addAnimation:v36 forKey:@"VUIAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

      if (self->_underPosterOutset == 0.0)
      {
        [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
        v89 = v94 = v21;
        v101[0] = v89;
        double v44 = v20 / v95;
        *(float *)&double v44 = v20 / v95;
        [MEMORY[0x1E4F28ED0] numberWithFloat:v44];
        double v45 = v88 = v3;
        v101[1] = v45;
        double v46 = (void *)MEMORY[0x1E4F28ED0];
        [(VUIAnimatedLabel *)self scrollRate];
        double v48 = (v20 + 20.0 / v47) / v95;
        *(float *)&double v48 = v48;
        [v46 numberWithFloat:v48];
        uint64_t v49 = v37;
        uint64_t v50 = v87 = v37;
        v101[2] = v50;
        double v51 = (void *)MEMORY[0x1E4F28ED0];
        [(VUIAnimatedLabel *)self scrollRate];
        double v53 = -20.0 / v52 / v95 + 1.0;
        *(float *)&double v53 = v53;
        [v51 numberWithFloat:v53];
        v54 = v92 = v22;
        v101[3] = v54;
        LODWORD(v55) = 1.0;
        v56 = [MEMORY[0x1E4F28ED0] numberWithFloat:v55];
        v101[4] = v56;
        v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:5];

        [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
        id v57 = v90 = v36;
        [v57 setDuration:v95];
        [v57 setFillMode:v49];
        [v57 setRemovedOnCompletion:0];
        double v58 = v8 + 20.0;
        float v59 = v8 + 20.0;
        *(float *)&double v58 = v59;
        uint64_t v60 = [MEMORY[0x1E4F28ED0] numberWithFloat:v58];
        v100[0] = v60;
        *(float *)&double v61 = v59;
        v62 = [MEMORY[0x1E4F28ED0] numberWithFloat:v61];
        v100[1] = v62;
        float v63 = v8;
        *(float *)&double v64 = v63;
        v65 = [MEMORY[0x1E4F28ED0] numberWithFloat:v64];
        v100[2] = v65;
        *(float *)&double v66 = v8;
        v67 = [MEMORY[0x1E4F28ED0] numberWithFloat:v66];
        v100[3] = v67;
        *(float *)&double v68 = v59;
        v69 = [MEMORY[0x1E4F28ED0] numberWithFloat:v68];
        v100[4] = v69;
        v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:5];
        [v57 setValues:v70];

        [v57 setKeyTimes:v97];
        [(CALayer *)self->_maskLayer addAnimation:v57 forKey:@"VUIAnimatedLabelMarqueeMaskLayerWidthAnimationKey"];
        v71 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
        [v71 setDuration:v95];
        [v71 setFillMode:v87];
        [v71 setRemovedOnCompletion:0];
        if (v88) {
          double v72 = 20.0;
        }
        else {
          double v72 = -20.0;
        }
        double v73 = (v72 + v8) * 0.5;
        float v74 = v73;
        *(float *)&double v73 = v74;
        v75 = [MEMORY[0x1E4F28ED0] numberWithFloat:v73];
        v99[0] = v75;
        *(float *)&double v76 = v74;
        v77 = [MEMORY[0x1E4F28ED0] numberWithFloat:v76];
        v99[1] = v77;
        double v78 = v8 * 0.5;
        float v79 = v8 * 0.5;
        *(float *)&double v78 = v79;
        v80 = [MEMORY[0x1E4F28ED0] numberWithFloat:v78];
        v99[2] = v80;
        *(float *)&double v81 = v79;
        v82 = [MEMORY[0x1E4F28ED0] numberWithFloat:v81];
        v99[3] = v82;
        *(float *)&double v83 = v74;
        v84 = [MEMORY[0x1E4F28ED0] numberWithFloat:v83];
        v99[4] = v84;
        v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:5];
        [v71 setValues:v85];

        id v21 = v94;
        v22 = v92;
        [v71 setKeyTimes:v97];
        [(CALayer *)self->_maskLayer addAnimation:v71 forKey:@"VUIAnimatedLabelMarqueeMaskLayerPositionXAnimationKey"];

        CGRect v36 = v90;
      }
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      v86 = [(VUIAnimatedLabel *)self layer];
      [v86 setMask:0];

      v21[2](v21);
    }
  }
}

uint64_t __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1010) = 0;
  uint64_t result = [*(id *)(a1 + 32) isAnimating];
  if (result)
  {
    int v3 = [*(id *)(a1 + 32) _shouldCycle];
    double v4 = *(unsigned char **)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = 40;
      if (!v4[1009]) {
        uint64_t v5 = 48;
      }
      double v6 = *(double *)(a1 + v5);
      return [v4 _prepareNextMarqueeWithDelay:v6];
    }
    else
    {
      uint64_t result = [v4 isPaused];
      if ((result & 1) == 0)
      {
        double v7 = *(void **)(a1 + 32);
        return [v7 _startMarqueeIfNeeded];
      }
    }
  }
  return result;
}

void __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  id v3 = +[VUIUtilities VideosUIBundle];
  uint64_t v1 = [v0 imageNamed:@"UILabelMarqueeMask.png" inBundle:v3];
  objc_super v2 = (void *)_startMarqueeIfNeeded___maskImage;
  _startMarqueeIfNeeded___maskImage = v1;
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

- (UIImage)marqueeContentImage
{
  return self->_marqueeContentImage;
}

- (void)setMarqueeContentImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeContentImage, 0);
  objc_destroyWeak((id *)&self->_nextMarqueeView);
  objc_destroyWeak((id *)&self->_currentMarqueeView);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end