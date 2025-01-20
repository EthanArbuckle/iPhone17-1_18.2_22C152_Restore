@interface UIStatusBarSignalStrengthItemView
- (BOOL)_updateWithRaw:(int)a3 bars:(int)a4 enableRSSI:(BOOL)a5 showFailure:(BOOL)a6 useSmallBars:(BOOL)a7;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (id)_signalStrengthBarsImageName;
- (id)_stringForRSSI;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIStatusBarSignalStrengthItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  uint64_t v6 = *(unsigned int *)(v5 + 432);
  int v7 = *(_DWORD *)(v5 + 440);
  if (v7 >= 4) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = (*(unsigned __int8 *)(v5 + 2529) >> 1) & 1;
  BOOL v10 = *(_DWORD *)(v5 + 2072) == 6;
  uint64_t v11 = *(unsigned __int8 *)(v5 + 5);
  return [(UIStatusBarSignalStrengthItemView *)self _updateWithRaw:v6 bars:v8 enableRSSI:v9 showFailure:v10 useSmallBars:v11];
}

- (BOOL)_updateWithRaw:(int)a3 bars:(int)a4 enableRSSI:(BOOL)a5 showFailure:(BOOL)a6 useSmallBars:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  if (self->_enableRSSI == a5)
  {
    BOOL v12 = 0;
  }
  else
  {
    self->_enableRSSI = a5;
    BOOL v12 = self->_showRSSI != a5;
    self->_showRSSI = a5;
    [(UIView *)self setUserInteractionEnabled:self->_enableRSSI];
  }
  if (self->_signalStrengthRaw != a3)
  {
    self->_signalStrengthRaw = a3;
    LOBYTE(v12) = self->_showRSSI || v12;
  }
  if (self->_signalStrengthBars != a4)
  {
    self->_signalStrengthBars = a4;
    if (!self->_showRSSI) {
      LOBYTE(v12) = 1;
    }
  }
  if (self->_showFailure != v8)
  {
    self->_showFailure = v8;
    LOBYTE(v12) = 1;
  }
  if (self->_useSmallBars != v7)
  {
    self->_useSmallBars = v7;
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (id)_signalStrengthBarsImageName
{
  uint64_t signalStrengthBars = self->_signalStrengthBars;
  if ((signalStrengthBars & 0x80000000) != 0)
  {
    v4 = @"Bars_NoSim";
  }
  else
  {
    if (self->_useSmallBars) {
      v3 = @"%d_Bars-DualSIM-card";
    }
    else {
      v3 = @"%d_Bars";
    }
    objc_msgSend(NSString, "stringWithFormat:", v3, signalStrengthBars);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)contentsImage
{
  if (self->_showFailure)
  {
    v3 = [(UIStatusBarItemView *)self imageWithShadowNamed:@"CellularFailure"];
  }
  else
  {
    if (self->_showRSSI)
    {
      v4 = [(UIStatusBarSignalStrengthItemView *)self _stringForRSSI];
      v3 = [(UIStatusBarItemView *)self imageWithText:v4];
    }
    else
    {
      v4 = [(UIStatusBarSignalStrengthItemView *)self _signalStrengthBarsImageName];
      v3 = [(UIStatusBarItemView *)self imageWithShadowNamed:v4];
      if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
      {
        uint64_t v5 = [v3 imageSetWithOrientation:4];

        v3 = (void *)v5;
      }
    }
  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_enableRSSI)
  {
    self->_showRSSI ^= 1u;
    [(UIStatusBarItemView *)self updateContentsAndWidth];
    if (v8 != 0.0)
    {
      double v9 = v8;
      BOOL v10 = [(UIStatusBarItemView *)self layoutManager];
      [v10 itemView:self sizeChangedBy:v9];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarSignalStrengthItemView;
  [(UIResponder *)&v11 touchesEnded:v6 withEvent:v7];
}

- (double)extraRightPadding
{
  v3 = [(UIStatusBarItemView *)self foregroundStyle];
  int v4 = [v3 usesVerticalLayout];

  if (v4)
  {
    [(UIStatusBarItemView *)&v12 extraRightPadding];
  }
  else
  {
    id v6 = [(UIStatusBarItemView *)self layoutManager];
    id v7 = [v6 foregroundView];
    int v8 = [v7 isShowingBreadcrumb];

    if (v8)
    {
      [(UIStatusBarItemView *)&v11 extraRightPadding];
    }
    else if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      [(UIStatusBarItemView *)&v10 extraRightPadding];
    }
    else
    {
      [(UIStatusBarItemView *)self standardPadding];
      return -floor(v9 * 0.5);
    }
  }
  return result;
}

- (double)extraLeftPadding
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarSignalStrengthItemView;
  [(UIStatusBarItemView *)&v3 extraRightPadding];
  return result;
}

- (id)_stringForRSSI
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_signalStrengthRaw);
}

- (id)accessibilityHUDRepresentation
{
  if (self->_showFailure)
  {
    objc_super v3 = @"CellularFailure";
  }
  else
  {
    objc_super v3 = [(UIStatusBarSignalStrengthItemView *)self _signalStrengthBarsImageName];
  }
  int v4 = [(UIStatusBarItemView *)self foregroundStyle];
  uint64_t v5 = [v4 accessibilityHUDImageNamed:v3];

  id v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v5, 1, 0.0, 0.0, 0.0, 0.0);
  return v6;
}

@end