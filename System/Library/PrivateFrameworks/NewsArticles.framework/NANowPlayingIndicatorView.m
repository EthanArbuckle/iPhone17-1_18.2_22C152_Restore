@interface NANowPlayingIndicatorView
- (BOOL)canBecomeFocused;
- (BOOL)showsLevelGutters;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NANowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (UIColor)levelGuttersColor;
- (double)_fixedSeedValueForBarIndex:(unint64_t)a3;
- (double)_randomSeedValueForBar;
- (double)_seedValueForBarIndex:(unint64_t)a3;
- (double)interLevelSpacing;
- (double)levelCornerRadius;
- (double)levelWidth;
- (double)maximumLevelHeight;
- (double)minimumLevelHeight;
- (int64_t)bounceStyle;
- (int64_t)numberOfLevels;
- (int64_t)playbackState;
- (void)_bufferTimerFired;
- (void)_reloadLevelViews;
- (void)_updateLevelAnimations;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounceStyle:(int64_t)a3;
- (void)setInterLevelSpacing:(double)a3;
- (void)setLevelCornerRadius:(double)a3;
- (void)setLevelGuttersColor:(id)a3;
- (void)setLevelWidth:(double)a3;
- (void)setMaximumLevelHeight:(double)a3;
- (void)setMinimumLevelHeight:(double)a3;
- (void)setNumberOfLevels:(int64_t)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setShowsLevelGutters:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation NANowPlayingIndicatorView

- (void)_updateLevelAnimations
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  char v59 = [MEMORY[0x1E4F39CF8] disableActions];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v3 = self->_levelViews;
  uint64_t v63 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v63)
  {
    uint64_t v4 = 0;
    uint64_t v62 = *(void *)v65;
    uint64_t v60 = *MEMORY[0x1E4F3A490];
    uint64_t v61 = *MEMORY[0x1E4F39FA0];
    uint64_t v53 = *MEMORY[0x1E4F39D78];
    uint64_t v54 = *MEMORY[0x1E4F39D68];
    unint64_t v5 = 0x1E4F28000uLL;
    uint64_t v52 = *MEMORY[0x1E4F39D90];
    v55 = v3;
LABEL_3:
    uint64_t v6 = 0;
    uint64_t v58 = v4;
    while (2)
    {
      if (*(void *)v65 != v62) {
        objc_enumerationMutation(v3);
      }
      v7 = *(void **)(*((void *)&v64 + 1) + 8 * v6);
      [v7 setAlpha:1.0];
      v8 = [v7 layer];
      switch(self->_playbackState)
      {
        case 0:
          v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds.size.height"];
          [v9 setDuration:0.45];
          v10 = [MEMORY[0x1E4F39C10] functionWithName:v60];
          [v9 setTimingFunction:v10];

          [v9 setRemovedOnCompletion:0];
          [v9 setFillMode:v61];
          v11 = *(void **)(v5 + 3792);
          v12 = [v8 presentationLayer];
          v13 = v12;
          if (!v12) {
            v12 = v8;
          }
          [v12 bounds];
          v14 = [v11 numberWithDouble:CGRectGetHeight(v74)];
          [v9 setFromValue:v14];

          [v9 setToValue:&unk_1F1B03848];
          goto LABEL_19;
        case 1:
          v9 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.height"];
          v15 = [MEMORY[0x1E4F39C10] functionWithName:v60];
          [v9 setTimingFunction:v15];

          [v9 setRemovedOnCompletion:0];
          [v9 setFillMode:v61];
          [(NANowPlayingIndicatorView *)self _seedValueForBarIndex:v4 + v6];
          double maximumLevelHeight = self->_maximumLevelHeight;
          double v18 = maximumLevelHeight * 0.5 + v17 * (maximumLevelHeight * 0.5);
          [v9 setDuration:maximumLevelHeight / v18 * 0.65];
          v19 = [*(id *)(v5 + 3792) numberWithDouble:self->_minimumLevelHeight];
          v68[0] = v19;
          v20 = [*(id *)(v5 + 3792) numberWithDouble:v18];
          v68[1] = v20;
          v21 = [*(id *)(v5 + 3792) numberWithDouble:self->_minimumLevelHeight];
          v68[2] = v21;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
          [v9 setValues:v22];

          uint64_t v4 = v58;
          LODWORD(v23) = 2139095040;
          [v9 setRepeatCount:v23];
          goto LABEL_19;
        case 2:
          goto LABEL_13;
        case 3:
          if (self->bufferingShouldDisplayAsPaused)
          {
            [v7 setAlpha:0.300000012];
LABEL_13:
            v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds.size.height"];
            [v9 setDuration:0.45];
            v24 = [MEMORY[0x1E4F39C10] functionWithName:v60];
            [v9 setTimingFunction:v24];

            [v9 setRemovedOnCompletion:0];
            [v9 setFillMode:v61];
            v25 = *(void **)(v5 + 3792);
            if (v59)
            {
              v26 = [*(id *)(v5 + 3792) numberWithDouble:self->_minimumLevelHeight];
              [v9 setFromValue:v26];
            }
            else
            {
              v27 = [v8 presentationLayer];
              v28 = v27;
              if (!v27) {
                v27 = v8;
              }
              [v27 bounds];
              v29 = [v25 numberWithDouble:CGRectGetHeight(v75)];
              [v9 setFromValue:v29];
            }
            v30 = [*(id *)(v5 + 3792) numberWithDouble:self->_minimumLevelHeight];
            [v9 setToValue:v30];

LABEL_19:
            [v8 addAnimation:v9 forKey:@"nowPlayingIndicatorAnimation"];
          }
          else
          {
            v9 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.height"];
            [v9 setRemovedOnCompletion:0];
            [v9 setFillMode:v61];
            double v31 = self->_minimumLevelHeight * 1.7;
            [v9 setDuration:0.5];
            [v9 setBeginTime:(double)(unint64_t)(v4 + v6) * 0.175];
            v32 = [NSNumber numberWithDouble:self->_minimumLevelHeight];
            v71[0] = v32;
            v33 = [NSNumber numberWithDouble:v31];
            v71[1] = v33;
            v34 = [NSNumber numberWithDouble:v31];
            v71[2] = v34;
            v35 = [NSNumber numberWithDouble:self->_minimumLevelHeight];
            v71[3] = v35;
            v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
            [v9 setValues:v36];

            LODWORD(v37) = 1.0;
            LODWORD(v38) = 1055622431;
            v57 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v38 :v37];
            [v9 setTimingFunction:v57];
            [v9 setCalculationMode:v54];
            v39 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"hidden"];
            [v39 setFillMode:v61];
            [v39 setValues:&unk_1F1B038B0];
            [v39 setKeyTimes:&unk_1F1B038C8];
            [v39 setCalculationMode:v53];
            [v9 duration];
            objc_msgSend(v39, "setDuration:");
            [v9 beginTime];
            objc_msgSend(v39, "setBeginTime:");
            [v39 setRemovedOnCompletion:1];
            v40 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
            v41 = [v9 timingFunction];
            [v40 setTimingFunction:v41];

            [v40 setRemovedOnCompletion:0];
            [v40 setFillMode:v61];
            [v9 duration];
            objc_msgSend(v40, "setDuration:");
            [v9 beginTime];
            objc_msgSend(v40, "setBeginTime:");
            LODWORD(v42) = 1050253722;
            v56 = [NSNumber numberWithFloat:v42];
            v70[0] = v56;
            LODWORD(v43) = *(_DWORD *)"333?";
            v44 = [NSNumber numberWithFloat:v43];
            v70[1] = v44;
            LODWORD(v45) = 1050253722;
            v46 = [NSNumber numberWithFloat:v45];
            v70[2] = v46;
            v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
            [v40 setValues:v47];

            unint64_t v5 = 0x1E4F28000;
            uint64_t v4 = v58;

            [v40 setCalculationMode:v52];
            v48 = [MEMORY[0x1E4F39B38] animation];
            [v48 setDuration:1.05];
            v69[0] = v9;
            v69[1] = v39;
            v69[2] = v40;
            v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
            [v48 setAnimations:v49];

            LODWORD(v50) = 2139095040;
            [v48 setRepeatCount:v50];
            [v8 addAnimation:v48 forKey:@"nowPlayingIndicatorAnimation"];

            v3 = v55;
          }

LABEL_21:
          if (v63 != ++v6) {
            continue;
          }
          uint64_t v51 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v64 objects:v72 count:16];
          v4 += v6;
          uint64_t v63 = v51;
          if (!v51) {
            goto LABEL_25;
          }
          goto LABEL_3;
        default:
          goto LABEL_21;
      }
    }
  }
LABEL_25:
}

- (void)tintColorDidChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NANowPlayingIndicatorView;
  [(NANowPlayingIndicatorView *)&v14 tintColorDidChange];
  if (self->_showsLevelGutters) {
    [(NANowPlayingIndicatorView *)self setNeedsDisplay];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_levelViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NANowPlayingIndicatorView *)self tintColor];
        [v8 setBackgroundColor:v9];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NANowPlayingIndicatorView;
  [(NANowPlayingIndicatorView *)&v24 layoutSubviews];
  [(NANowPlayingIndicatorView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v11 = self->_levelViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (void)v20);
        double v19 = v18;
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        objc_msgSend(v17, "setFrame:", (self->_levelWidth + self->_interLevelSpacing) * (double)(v14 + i), CGRectGetMaxY(v27), self->_levelWidth, v19);
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      v14 += i;
    }
    while (v13);
  }
}

- (void)_reloadLevelViews
{
  if (self->_numberOfLevels < 1)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = 0;
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      if (v3 >= [(NSMutableArray *)self->_levelViews count]
        || ([(NSMutableArray *)self->_levelViews objectAtIndex:v3],
            (CGFloat v8 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        CGFloat v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
        double v9 = [v8 layer];
        [v9 setCornerRadius:self->_levelCornerRadius];
        objc_msgSend(v9, "setAnchorPoint:", 0.5, 1.0);
        CGFloat v10 = [(NANowPlayingIndicatorView *)self tintColor];
        [v8 setBackgroundColor:v10];

        levelViews = self->_levelViews;
        if (!levelViews)
        {
          uint64_t v12 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_numberOfLevels];
          uint64_t v13 = self->_levelViews;
          self->_levelViews = v12;

          levelViews = self->_levelViews;
        }
        [(NSMutableArray *)levelViews addObject:v8];
        [(NANowPlayingIndicatorView *)self addSubview:v8];
      }
      ++v3;
    }
    while ((int64_t)v3 < self->_numberOfLevels);
  }
  while (v3 < [(NSMutableArray *)self->_levelViews count])
  {
    uint64_t v14 = [(NSMutableArray *)self->_levelViews objectAtIndex:v3];
    [v14 removeFromSuperview];
    [(NSMutableArray *)self->_levelViews removeObjectAtIndex:v3];
  }
  [(NANowPlayingIndicatorView *)self _updateLevelAnimations];
  [(NANowPlayingIndicatorView *)self setNeedsLayout];
}

- (NANowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NANowPlayingIndicatorView;
  unint64_t v3 = -[NANowPlayingIndicatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(NANowPlayingIndicatorView *)v3 setUserInteractionEnabled:0];
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(NANowPlayingIndicatorView *)v4 setBackgroundColor:v5];

    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v8 = v7;

    v4->_interLevelSpacing = 1.0 / v8 + 1.0;
    v4->_levelCornerRadius = 1.0 / v8;
    v4->_levelWidth = 3.0;
    v4->_double maximumLevelHeight = 13.0;
    v4->_minimumLevelHeight = 3.0;
    v4->_numberOfLevels = 3;
    [(NANowPlayingIndicatorView *)v4 _reloadLevelViews];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  if (self->_showsLevelGutters)
  {
    levelGuttersColor = self->_levelGuttersColor;
    if (levelGuttersColor)
    {
      double v5 = levelGuttersColor;
    }
    else
    {
      double v6 = [(NANowPlayingIndicatorView *)self tintColor];
      long long v11 = [v6 colorWithAlphaComponent:0.2];

      double v5 = v11;
    }
    uint64_t v12 = v5;
    [(UIColor *)v5 setFill];
    [(NANowPlayingIndicatorView *)self bounds];
    double levelWidth = self->_levelWidth;
    double MaxY = CGRectGetMaxY(v14);
    if (self->_numberOfLevels >= 1)
    {
      CGFloat v9 = MaxY;
      int64_t v10 = 0;
      do
      {
        v15.origin.x = (self->_levelWidth + self->_interLevelSpacing) * (double)v10;
        v15.origin.y = 0.0;
        v15.size.width = levelWidth;
        v15.size.height = v9;
        UIRectFillUsingBlendMode(v15, kCGBlendModeNormal);
        ++v10;
      }
      while (v10 < self->_numberOfLevels);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfLevels = self->_numberOfLevels;
  if (numberOfLevels)
  {
    double v4 = self->_interLevelSpacing * (double)(numberOfLevels - 1) + (double)numberOfLevels * self->_levelWidth;
    p_double maximumLevelHeight = &self->_maximumLevelHeight;
  }
  else
  {
    p_double maximumLevelHeight = (double *)(MEMORY[0x1E4F1DB30] + 8);
    double v4 = *MEMORY[0x1E4F1DB30];
  }
  double v6 = *p_maximumLevelHeight;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setLevelCornerRadius:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_levelCornerRadius != a3)
  {
    self->_levelCornerRadius = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = self->_levelViews;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          CGFloat v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "layer", (void)v10);
          [v9 setCornerRadius:self->_levelCornerRadius];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setLevelWidth:(double)a3
{
  if (self->_levelWidth != a3)
  {
    self->_double levelWidth = a3;
    [(NANowPlayingIndicatorView *)self setNeedsLayout];
  }
}

- (void)setMaximumLevelHeight:(double)a3
{
  if (self->_maximumLevelHeight != a3)
  {
    self->_double maximumLevelHeight = a3;
    [(NANowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setMinimumLevelHeight:(double)a3
{
  if (self->_minimumLevelHeight != a3)
  {
    self->_minimumLevelHeight = a3;
    [(NANowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setNumberOfLevels:(int64_t)a3
{
  if (self->_numberOfLevels != a3)
  {
    self->_int64_t numberOfLevels = a3;
    [(NANowPlayingIndicatorView *)self _reloadLevelViews];
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    if (a3 == 3)
    {
      self->bufferingShouldDisplayAsPaused = 1;
      [(NANowPlayingIndicatorView *)self performSelector:sel__bufferTimerFired withObject:0 afterDelay:1.0];
    }
    [(NANowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)_bufferTimerFired
{
  if (self->_playbackState == 3)
  {
    self->bufferingShouldDisplayAsPaused = 0;
    [(NANowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  if (self->_showsLevelGutters != a3)
  {
    self->_showsLevelGutters = a3;
    [(NANowPlayingIndicatorView *)self setNeedsDisplay];
  }
}

- (void)setLevelGuttersColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  p_levelGuttersColor = &self->_levelGuttersColor;
  if (self->_levelGuttersColor != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_levelGuttersColor, a3);
    p_levelGuttersColor = (UIColor **)[(NANowPlayingIndicatorView *)self setNeedsDisplay];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_levelGuttersColor, v5);
}

- (double)_seedValueForBarIndex:(unint64_t)a3
{
  if ([(NANowPlayingIndicatorView *)self bounceStyle] == 1)
  {
    [(NANowPlayingIndicatorView *)self _fixedSeedValueForBarIndex:a3];
  }
  else
  {
    [(NANowPlayingIndicatorView *)self _randomSeedValueForBar];
  }
  return result;
}

- (double)_randomSeedValueForBar
{
  return (double)arc4random_uniform(0x64u) / 100.0;
}

- (double)_fixedSeedValueForBarIndex:(unint64_t)a3
{
  if (a3 < 4) {
    return dbl_1BF7E9000[a3];
  }
  [(NANowPlayingIndicatorView *)self _randomSeedValueForBar];
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (double)interLevelSpacing
{
  return self->_interLevelSpacing;
}

- (void)setInterLevelSpacing:(double)a3
{
  self->_interLevelSpacing = a3;
}

- (double)levelCornerRadius
{
  return self->_levelCornerRadius;
}

- (double)levelWidth
{
  return self->_levelWidth;
}

- (double)maximumLevelHeight
{
  return self->_maximumLevelHeight;
}

- (double)minimumLevelHeight
{
  return self->_minimumLevelHeight;
}

- (int64_t)numberOfLevels
{
  return self->_numberOfLevels;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (int64_t)bounceStyle
{
  return self->_bounceStyle;
}

- (void)setBounceStyle:(int64_t)a3
{
  self->_bounceStyle = a3;
}

- (BOOL)showsLevelGutters
{
  return self->_showsLevelGutters;
}

- (UIColor)levelGuttersColor
{
  return self->_levelGuttersColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelGuttersColor, 0);
  objc_storeStrong((id *)&self->_levelViews, 0);
}

@end