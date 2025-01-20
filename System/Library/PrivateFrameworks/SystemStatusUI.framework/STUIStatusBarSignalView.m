@interface STUIStatusBarSignalView
+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4;
- (BOOL)rounded;
- (BOOL)smallSize;
- (UIColor)activeColor;
- (UIColor)inactiveColor;
- (int64_t)iconSize;
- (int64_t)numberOfActiveBars;
- (int64_t)numberOfBars;
- (int64_t)signalMode;
- (void)_iconSizeDidChange;
- (void)_updateBars;
- (void)applyStyleAttributes:(id)a3;
- (void)setActiveColor:(id)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setInactiveColor:(id)a3;
- (void)setNumberOfActiveBars:(int64_t)a3;
- (void)setNumberOfBars:(int64_t)a3;
- (void)setRounded:(BOOL)a3;
- (void)setSignalMode:(int64_t)a3;
- (void)setSmallSize:(BOOL)a3;
@end

@implementation STUIStatusBarSignalView

- (void)setInactiveColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_inactiveColor = &self->_inactiveColor;
  if (self->_inactiveColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_inactiveColor, a3);
    p_inactiveColor = (UIColor **)[(STUIStatusBarSignalView *)self _colorsDidChange];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_inactiveColor, v5);
}

- (void)setActiveColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_activeColor = &self->_activeColor;
  if (self->_activeColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_activeColor, a3);
    p_activeColor = (UIColor **)[(STUIStatusBarSignalView *)self _colorsDidChange];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_activeColor, v5);
}

- (void)setSignalMode:(int64_t)a3
{
  int64_t signalMode = self->_signalMode;
  if (signalMode != a3)
  {
    self->_int64_t signalMode = a3;
    [(STUIStatusBarSignalView *)self _updateFromMode:signalMode];
  }
}

- (void)setNumberOfActiveBars:(int64_t)a3
{
  if (self->_numberOfActiveBars != a3)
  {
    int64_t numberOfBars = self->_numberOfBars;
    if (numberOfBars >= (a3 & ~(a3 >> 63))) {
      int64_t numberOfBars = a3 & ~(a3 >> 63);
    }
    self->_numberOfActiveBars = numberOfBars;
    if ([(STUIStatusBarSignalView *)self signalMode] == 2)
    {
      [(STUIStatusBarSignalView *)self _updateActiveBars];
    }
  }
}

- (UIColor)activeColor
{
  return self->_activeColor;
}

- (int64_t)numberOfActiveBars
{
  return self->_numberOfActiveBars;
}

- (int64_t)numberOfBars
{
  return self->_numberOfBars;
}

- (int64_t)signalMode
{
  return self->_signalMode;
}

- (UIColor)inactiveColor
{
  return self->_inactiveColor;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)_updateBars
{
  id v3 = [(STUIStatusBarSignalView *)self layer];
  v2 = [v3 sublayers];
  [v2 makeObjectsPerformSelector:sel_removeFromSuperlayer];
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isRounded];
  uint64_t v6 = [v4 iconSize];

  if (self->_iconSize == v6)
  {
    int rounded = self->_rounded;
    [(STUIStatusBarSignalView *)self setRounded:v5];
    [(STUIStatusBarSignalView *)self setIconSize:v6];
    if (rounded == v5) {
      return;
    }
  }
  else
  {
    [(STUIStatusBarSignalView *)self setRounded:v5];
    [(STUIStatusBarSignalView *)self setIconSize:v6];
  }
  [(STUIStatusBarSignalView *)self _iconSizeDidChange];
}

- (void)setRounded:(BOOL)a3
{
  self->_int rounded = a3;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void)_iconSizeDidChange
{
  [(STUIStatusBarSignalView *)self _updateBars];
  [(STUIStatusBarSignalView *)self setNeedsLayout];
  [(STUIStatusBarSignalView *)self invalidateIntrinsicContentSize];
}

- (void)setNumberOfBars:(int64_t)a3
{
  if (self->_numberOfBars != a3)
  {
    self->_int64_t numberOfBars = a3;
    [(STUIStatusBarSignalView *)self _updateBars];
    [(STUIStatusBarSignalView *)self setNeedsLayout];
    [(STUIStatusBarSignalView *)self invalidateIntrinsicContentSize];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
}

- (void)setSmallSize:(BOOL)a3
{
  if (self->_smallSize != a3)
  {
    self->_smallSize = a3;
    [(STUIStatusBarSignalView *)self setNeedsLayout];
  }
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)smallSize
{
  return self->_smallSize;
}

@end