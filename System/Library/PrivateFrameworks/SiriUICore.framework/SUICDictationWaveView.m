@interface SUICDictationWaveView
- (CGRect)_startingFrameForPipAtIndex:(unint64_t)a3;
- (SUICDictationWaveView)initWithFrame:(CGRect)a3;
- (double)_heightForIntroAnimationPips;
- (double)_intervalForEachPipAnimation;
- (double)_leftMargin;
- (double)_maximumPipHeight;
- (double)_originXForPipAtIndex:(unint64_t)a3;
- (double)_pipWidth;
- (float)_heightMultiplierForPipIndex:(unint64_t)a3;
- (float)_noiseForPipIndex:(unint64_t)a3;
- (float)_sinusoidalTaperForPipIndex:(unint64_t)a3;
- (float)_smoothStepTaperForPipIndex:(unint64_t)a3;
- (float)_smoothStepWithLowerBound:(float)a3 upperBound:(float)a4 innerValue:(float)a5;
- (float)powerLevel;
- (unint64_t)_numberOfPips;
- (void)_addNewPips;
- (void)_animateInPipsBetweenLeftIndex:(unint64_t)a3 rightIndex:(unint64_t)a4;
- (void)_introAnimationTick;
- (void)_removeAllPips;
- (void)_resetPips;
- (void)_showPipsWithoutIntroAnimation;
- (void)_startIntroAnimation;
- (void)_tick:(id)a3;
- (void)_updatePipColor;
- (void)_updatePipHeightAtIndex:(unint64_t)a3 withHeight:(double)a4;
- (void)_updatePipHeights;
- (void)layoutSubviews;
- (void)setAudioPowerLevelDataSource:(id)a3;
- (void)setPipColor:(id)a3;
- (void)setPowerLevel:(float)a3;
@end

@implementation SUICDictationWaveView

- (SUICDictationWaveView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)SUICDictationWaveView;
  v7 = -[SUICDictationWaveView initWithFrame:](&v17, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_cachedFrame.origin.CGFloat x = x;
    v7->_cachedFrame.origin.CGFloat y = y;
    v7->_cachedFrame.size.CGFloat width = width;
    v7->_cachedFrame.size.CGFloat height = height;
    v9 = [SUICAudioLevelSmoother alloc];
    LODWORD(v10) = -1032847360;
    LODWORD(v11) = 1051931443;
    LODWORD(v12) = 1063675494;
    LODWORD(v13) = -10.0;
    uint64_t v14 = [(SUICAudioLevelSmoother *)v9 initWithMinimumPower:5 maximumPower:v10 historyLength:v13 attackSpeed:v11 decaySpeed:v12];
    smoother = v8->_smoother;
    v8->_smoother = (SUICAudioLevelSmoother *)v14;

    v8->_initialOffset = (float)((float)((float)rand() * 4.6566e-10) * 600.0) + -300.0;
    [(SUICDictationWaveView *)v8 _resetPips];
  }
  return v8;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SUICDictationWaveView;
  [(SUICDictationWaveView *)&v11 layoutSubviews];
  [(SUICDictationWaveView *)self frame];
  v12.origin.CGFloat x = v3;
  v12.origin.CGFloat y = v4;
  v12.size.CGFloat width = v5;
  v12.size.CGFloat height = v6;
  if (!CGRectEqualToRect(self->_cachedFrame, v12))
  {
    [(SUICDictationWaveView *)self frame];
    self->_cachedFrame.origin.CGFloat x = v7;
    self->_cachedFrame.origin.CGFloat y = v8;
    self->_cachedFrame.size.CGFloat width = v9;
    self->_cachedFrame.size.CGFloat height = v10;
    [(SUICDictationWaveView *)self _resetPips];
    [(SUICDictationWaveView *)self _showPipsWithoutIntroAnimation];
  }
}

- (void)_showPipsWithoutIntroAnimation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_pipLayers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v2);
        }
        LODWORD(v4) = 1.0;
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setOpacity:", v4, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updatePipColor
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_pipLayers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setBackgroundColor:", -[UIColor CGColor](self->_pipColor, "CGColor", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resetPips
{
  [(SUICDictationWaveView *)self _removeAllPips];

  [(SUICDictationWaveView *)self _addNewPips];
}

- (void)_removeAllPips
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_pipLayers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeFromSuperlayer", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_addNewPips
{
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pipLayers = self->_pipLayers;
  self->_pipLayers = v3;

  if ([(SUICDictationWaveView *)self _numberOfPips])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [MEMORY[0x1E4F39BE8] layer];
      [v6 setOpacity:0.0];
      objc_msgSend(v6, "setBackgroundColor:", -[UIColor CGColor](self->_pipColor, "CGColor"));
      [(SUICDictationWaveView *)self _startingFrameForPipAtIndex:v5];
      objc_msgSend(v6, "setFrame:");
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      long long v7 = [(SUICDictationWaveView *)self layer];
      [v7 addSublayer:v6];

      [(NSMutableArray *)self->_pipLayers addObject:v6];
      [MEMORY[0x1E4F39CF8] commit];

      ++v5;
    }
    while ([(SUICDictationWaveView *)self _numberOfPips] > v5);
  }
}

- (void)_startIntroAnimation
{
  self->_numberOfFrames = 0.0;
}

- (double)_intervalForEachPipAnimation
{
  return (float)(0.25 / (float)([(SUICDictationWaveView *)self _numberOfPips] >> 1));
}

- (void)_animateInPipsBetweenLeftIndex:(unint64_t)a3 rightIndex:(unint64_t)a4
{
  if (a3 <= a4 && [(NSMutableArray *)self->_pipLayers count] > a4)
  {
    unint64_t v7 = a3;
    do
    {
      long long v8 = [(NSMutableArray *)self->_pipLayers objectAtIndex:v7];
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      LODWORD(v9) = 1.0;
      [v8 setOpacity:v9];
      [MEMORY[0x1E4F39CF8] commit];

      ++v7;
    }
    while (v7 <= a4);
    [(SUICDictationWaveView *)self _heightForIntroAnimationPips];
    -[SUICDictationWaveView _updatePipHeightAtIndex:withHeight:](self, "_updatePipHeightAtIndex:withHeight:", a3);
    [(SUICDictationWaveView *)self _heightForIntroAnimationPips];
    -[SUICDictationWaveView _updatePipHeightAtIndex:withHeight:](self, "_updatePipHeightAtIndex:withHeight:", a4);
  }
}

- (void)_introAnimationTick
{
  double v3 = (float)(self->_numberOfFrames / self->_framesPerSecond);
  [(SUICDictationWaveView *)self _intervalForEachPipAnimation];
  *(float *)&double v4 = v3 / v4;
  unint64_t v5 = vcvtms_u32_f32(*(float *)&v4);
  unint64_t v6 = [(SUICDictationWaveView *)self _numberOfPips] >> 1;
  if (v6 >= v5)
  {
    unint64_t v7 = v6 + v5 + ([(SUICDictationWaveView *)self _numberOfPips] & 1) - 1;
    [(SUICDictationWaveView *)self _animateInPipsBetweenLeftIndex:v6 - v5 rightIndex:v7];
  }
}

- (void)_updatePipHeightAtIndex:(unint64_t)a3 withHeight:(double)a4
{
  if ([(NSMutableArray *)self->_pipLayers count] > a3)
  {
    id v12 = [(NSMutableArray *)self->_pipLayers objectAtIndex:a3];
    [(SUICDictationWaveView *)self _originXForPipAtIndex:a3];
    double v8 = v7;
    [(SUICDictationWaveView *)self frame];
    CGFloat v9 = (CGRectGetHeight(v14) - a4) * 0.5;
    [(SUICDictationWaveView *)self _pipWidth];
    [v12 setCornerRadius:v10 * 0.5];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(SUICDictationWaveView *)self _pipWidth];
    objc_msgSend(v12, "setFrame:", v8, v9, v11, a4);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)_updatePipHeights
{
  if ([(NSMutableArray *)self->_pipLayers count])
  {
    unint64_t v3 = 0;
    do
    {
      [(SUICDictationWaveView *)self _maximumPipHeight];
      double v5 = v4;
      [(SUICDictationWaveView *)self _minimumPipHeight];
      double v7 = v5 - v6;
      [(SUICDictationWaveView *)self _heightMultiplierForPipIndex:v3];
      double v9 = v7 * v8;
      [(SUICDictationWaveView *)self _minimumPipHeight];
      double v11 = v10 + v9;
      [(SUICDictationWaveView *)self _minimumPipHeight];
      if (v12 >= v11) {
        double v11 = v12;
      }
      [(SUICDictationWaveView *)self _maximumPipHeight];
      if (v13 >= v11) {
        double v13 = v11;
      }
      [(SUICDictationWaveView *)self _updatePipHeightAtIndex:v3++ withHeight:v13];
    }
    while ([(NSMutableArray *)self->_pipLayers count] > v3);
  }
}

- (void)setPipColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_pipColor = &self->_pipColor;
  if (self->_pipColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_pipColor, a3);
    p_pipColor = (UIColor **)[(SUICDictationWaveView *)self _updatePipColor];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_pipColor, v5);
}

- (void)setPowerLevel:(float)a3
{
  if (a3 < -96.0) {
    a3 = -96.0;
  }
  float v4 = fminf(a3, 0.0);
  *(float *)&double v5 = v4;
  [(SUICAudioLevelSmoother *)self->_smoother smoothedLevelForMicPower:v5];
  float v7 = (float)(v6 * 0.95) + 0.05;
  if (self->_linearPowerLevel != v7)
  {
    self->_linearPowerLevel = v7;
    self->_powerLevel = v4;
  }
}

- (void)setAudioPowerLevelDataSource:(id)a3
{
  double v5 = (SUICAudioPowerLevelDataSource *)a3;
  if (self->_audioPowerLevelDataSource != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_audioPowerLevelDataSource, a3);
    if (self->_audioPowerLevelDataSource)
    {
      float v6 = [MEMORY[0x1E4FB1BA8] _carScreen];
      float v7 = v6;
      if (v6)
      {
        float v8 = v6;
      }
      else
      {
        float v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      }
      double v9 = v8;

      self->_framesPerSecond = (float)[(CADisplayLink *)v9 maximumFramesPerSecond];
      double v10 = [(CADisplayLink *)v9 displayLinkWithTarget:self selector:sel__tick_];
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      double v12 = self->_displayLink;
      if (!v12)
      {
        double v13 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__tick_];
        CGRect v14 = self->_displayLink;
        self->_displayLink = v13;

        double v12 = self->_displayLink;
      }
      v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [(CADisplayLink *)v12 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C3A0]];
    }
    else
    {
      [(CADisplayLink *)self->_displayLink invalidate];
      double v9 = self->_displayLink;
      self->_displayLink = 0;
    }

    double v5 = v16;
  }
}

- (void)_tick:(id)a3
{
  self->_numberOfFrames = self->_numberOfFrames + 1.0;
  self->_runningVolumeSum = self->_linearPowerLevel + self->_runningVolumeSum;
  [(SUICAudioPowerLevelDataSource *)self->_audioPowerLevelDataSource audioPowerLevel];
  -[SUICDictationWaveView setPowerLevel:](self, "setPowerLevel:");
  [(SUICDictationWaveView *)self _updatePipHeights];

  [(SUICDictationWaveView *)self _introAnimationTick];
}

- (float)_noiseForPipIndex:(unint64_t)a3
{
  [(SUICDictationWaveView *)self _numberOfPips];
  noise2();
  return fabsf(v3) / 0.707;
}

- (float)_smoothStepTaperForPipIndex:(unint64_t)a3
{
  float v4 = (float)a3;
  *(float *)&double v5 = (float)a3 / (float)([(SUICDictationWaveView *)self _numberOfPips] - 1);
  LODWORD(v6) = -1102263091;
  LODWORD(v7) = 1050253722;
  [(SUICDictationWaveView *)self _smoothStepWithLowerBound:v6 upperBound:v7 innerValue:v5];
  float v9 = v8;
  *(float *)&double v10 = v4 / (float)([(SUICDictationWaveView *)self _numberOfPips] - 1);
  LODWORD(v11) = 1060320051;
  LODWORD(v12) = 1067030938;
  [(SUICDictationWaveView *)self _smoothStepWithLowerBound:v11 upperBound:v12 innerValue:v10];
  return v9 - v13;
}

- (float)_smoothStepWithLowerBound:(float)a3 upperBound:(float)a4 innerValue:(float)a5
{
  float v5 = (float)(a5 - a3) / (float)(a4 - a3);
  if (v5 < 0.0) {
    float v5 = 0.0;
  }
  float v6 = fminf(v5, 1.0);
  return (float)(v6 * v6) * (float)((float)(v6 * -2.0) + 3.0);
}

- (float)_sinusoidalTaperForPipIndex:(unint64_t)a3
{
  float v3 = (float)((float)a3 / (float)([(SUICDictationWaveView *)self _numberOfPips] - 1))
     * 3.14159265
     * 0.800000012
     + 0.314159244;

  return sinf(v3);
}

- (float)_heightMultiplierForPipIndex:(unint64_t)a3
{
  -[SUICDictationWaveView _noiseForPipIndex:](self, "_noiseForPipIndex:");
  float v6 = v5;
  [(SUICDictationWaveView *)self _sinusoidalTaperForPipIndex:a3];
  float v8 = v7;
  [(SUICDictationWaveView *)self _smoothStepTaperForPipIndex:a3];
  float v10 = (float)(v8 * v9) * (float)(v6 * self->_linearPowerLevel);
  if (v10 < 0.0) {
    float v10 = 0.0;
  }
  return fminf(v10, 1.0);
}

- (unint64_t)_numberOfPips
{
  [(SUICDictationWaveView *)self frame];
  double Width = CGRectGetWidth(v8);
  [(SUICDictationWaveView *)self _pipWidth];
  double v5 = Width - v4;
  [(SUICDictationWaveView *)self _pipWidth];
  return vcvtmd_u64_f64(v5 / (v6 + v6));
}

- (double)_pipWidth
{
  return 2.0;
}

- (double)_maximumPipHeight
{
  [(SUICDictationWaveView *)self frame];
  return CGRectGetHeight(v3) + -20.0;
}

- (double)_leftMargin
{
  [(SUICDictationWaveView *)self frame];
  double Width = CGRectGetWidth(v8);
  [(SUICDictationWaveView *)self _pipWidth];
  double v5 = Width + v4 * (double)[(SUICDictationWaveView *)self _numberOfPips] * -2.0;
  [(SUICDictationWaveView *)self _pipWidth];
  return floor((v6 + v5) * 0.5);
}

- (double)_originXForPipAtIndex:(unint64_t)a3
{
  [(SUICDictationWaveView *)self _leftMargin];
  double v6 = v5;
  [(SUICDictationWaveView *)self _pipWidth];
  return v6 + (v7 + v7) * (double)a3;
}

- (CGRect)_startingFrameForPipAtIndex:(unint64_t)a3
{
  [(SUICDictationWaveView *)self _pipWidth];
  double v6 = v5;
  [(SUICDictationWaveView *)self _minimumPipHeight];
  double v8 = v7;
  [(SUICDictationWaveView *)self _originXForPipAtIndex:a3];
  double v10 = v9;
  [(SUICDictationWaveView *)self frame];
  double v11 = (CGRectGetHeight(v15) - v8) * 0.5;
  double v12 = v10;
  double v13 = v6;
  double v14 = v8;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (double)_heightForIntroAnimationPips
{
  [(SUICDictationWaveView *)self _smoothStepTaperForPipIndex:0];
  float v4 = v3;
  [(SUICDictationWaveView *)self _sinusoidalTaperForPipIndex:0];
  float v6 = v4 * v5;
  [(SUICDictationWaveView *)self _maximumPipHeight];
  double v8 = v7;
  [(SUICDictationWaveView *)self _minimumPipHeight];
  double v10 = (v8 - v9) * v6;
  [(SUICDictationWaveView *)self _minimumPipHeight];
  return v11 + v10;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipLayers, 0);
  objc_storeStrong((id *)&self->_smoother, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioPowerLevelDataSource, 0);

  objc_storeStrong((id *)&self->_pipColor, 0);
}

@end