@interface _UIStatusBarSignalView
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

@implementation _UIStatusBarSignalView

- (void)setNumberOfBars:(int64_t)a3
{
  if (self->_numberOfBars != a3)
  {
    self->_numberOfBars = a3;
    [(_UIStatusBarSignalView *)self _updateBars];
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
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
    if ([(_UIStatusBarSignalView *)self signalMode] == 2)
    {
      [(_UIStatusBarSignalView *)self _updateActiveBars];
    }
  }
}

- (void)setSignalMode:(int64_t)a3
{
  int64_t signalMode = self->_signalMode;
  if (signalMode != a3)
  {
    self->_int64_t signalMode = a3;
    [(_UIStatusBarSignalView *)self _updateFromMode:signalMode];
  }
}

- (void)setSmallSize:(BOOL)a3
{
  if (self->_smallSize != a3)
  {
    self->_smallSize = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setInactiveColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    [(_UIStatusBarSignalView *)self _colorsDidChange];
    v5 = v6;
  }
}

- (void)setActiveColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_activeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeColor, a3);
    [(_UIStatusBarSignalView *)self _colorsDidChange];
    v5 = v6;
  }
}

- (void)_iconSizeDidChange
{
  [(_UIStatusBarSignalView *)self _updateBars];
  [(UIView *)self setNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_updateBars
{
  id v3 = [(UIView *)self layer];
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
    [(_UIStatusBarSignalView *)self setRounded:v5];
    [(_UIStatusBarSignalView *)self setIconSize:v6];
    if (rounded == v5) {
      return;
    }
  }
  else
  {
    [(_UIStatusBarSignalView *)self setRounded:v5];
    [(_UIStatusBarSignalView *)self setIconSize:v6];
  }
  [(_UIStatusBarSignalView *)self _iconSizeDidChange];
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)numberOfBars
{
  return self->_numberOfBars;
}

- (int64_t)numberOfActiveBars
{
  return self->_numberOfActiveBars;
}

- (int64_t)signalMode
{
  return self->_signalMode;
}

- (UIColor)inactiveColor
{
  return self->_inactiveColor;
}

- (UIColor)activeColor
{
  return self->_activeColor;
}

- (BOOL)smallSize
{
  return self->_smallSize;
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_int rounded = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
}

@end