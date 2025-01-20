@interface UIStatusBarDataNetworkItemView
- (BOOL)_updateWithData:(id *)a3 networkType:(int)a4;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (double)maximumOverlap;
- (id)_dataNetworkImage;
- (id)_dataNetworkImageName;
- (id)_stringForRSSI;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIStatusBarDataNetworkItemView

- (double)extraLeftPadding
{
  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarDataNetworkItemView;
  [(UIStatusBarItemView *)&v10 extraLeftPadding];
  double v4 = v3;
  v5 = [(UIStatusBarItemView *)self foregroundStyle];
  int v6 = [v5 usesVerticalLayout];

  int dataNetworkType = self->_dataNetworkType;
  if (v6)
  {
    if (dataNetworkType != 5) {
      return v4 + -3.0;
    }
  }
  else if (dataNetworkType != 5)
  {
    if (dataNetworkType == 6) {
      double v8 = 1.0;
    }
    else {
      double v8 = 4.0;
    }
    return v4 + v8;
  }
  return v4;
}

- (double)extraRightPadding
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarDataNetworkItemView;
  [(UIStatusBarItemView *)&v8 extraRightPadding];
  double v4 = v3;
  v5 = [(UIStatusBarItemView *)self foregroundStyle];
  int v6 = [v5 usesVerticalLayout];

  if (v6 && self->_dataNetworkType != 5) {
    return v4 + -3.0;
  }
  return v4;
}

- (double)maximumOverlap
{
  double v3 = [(UIStatusBarItemView *)self foregroundStyle];
  char v4 = [v3 usesVerticalLayout];

  if (v4) {
    return 0.0;
  }
  [(UIStatusBarItemView *)self standardPadding];
  return result;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  uint64_t v6 = *(unsigned int *)(v5 + 2096);
  return [(UIStatusBarDataNetworkItemView *)self _updateWithData:v5 networkType:v6];
}

- (BOOL)_updateWithData:(id *)a3 networkType:(int)a4
{
  unsigned int v5 = *((unsigned __int8 *)a3 + 3149);
  int var18 = a3->var18;
  if (a3->var19 >= 3) {
    int var19 = 3;
  }
  else {
    int var19 = a3->var19;
  }
  unsigned int v8 = *((unsigned __int8 *)a3 + 2529);
  unsigned int showRSSI = self->_showRSSI;
  int dataNetworkType = self->_dataNetworkType;
  BOOL v11 = dataNetworkType != a4;
  if (dataNetworkType != a4) {
    self->_int dataNetworkType = a4;
  }
  if (((v8 >> 2) & 1) != self->_enableRSSI)
  {
    unsigned int showRSSI = v8 & 4;
    self->_enableRSSI = showRSSI >> 2;
    [(UIView *)self setUserInteractionEnabled:showRSSI != 0];
  }
  if (showRSSI) {
    int v12 = (self->_dataNetworkType - 5) < 2;
  }
  else {
    int v12 = 0;
  }
  int v13 = self->_showRSSI;
  if (v13 != v12)
  {
    self->_unsigned int showRSSI = v12;
    BOOL v11 = 1;
    int v13 = v12;
  }
  int v14 = var19 & ~(var19 >> 31);
  if (var18 != self->_wifiStrengthRaw)
  {
    self->_wifiStrengthRaw = var18;
    BOOL v11 = (v13 | v11) != 0;
  }
  if (v14 != self->_wifiStrengthBars)
  {
    self->_wifiStrengthBars = v14;
    int v15 = v13 ^ 1;
    if (self->_dataNetworkType != 5) {
      int v15 = 0;
    }
    LOBYTE(v11) = (v15 | v11) != 0;
  }
  if (((v5 >> 3) & 1) != self->_wifiLinkWarning)
  {
    self->_wifiLinkWarning = (v5 & 8) != 0;
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (id)contentsImage
{
  double v3 = [(UIStatusBarItemView *)self foregroundStyle];
  char v4 = [v3 textForNetworkType:self->_dataNetworkType];

  if (!self->_showRSSI && v4 == 0)
  {
    v7 = [(UIStatusBarDataNetworkItemView *)self _dataNetworkImage];
  }
  else
  {
    if (self->_showRSSI)
    {
      id v6 = [(UIStatusBarDataNetworkItemView *)self _stringForRSSI];
    }
    else
    {
      id v6 = v4;
    }
    unsigned int v8 = v6;
    v7 = [(UIStatusBarItemView *)self imageWithText:v6];
  }
  return v7;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_enableRSSI && (self->_dataNetworkType - 5) <= 1)
  {
    self->_showRSSI ^= 1u;
    [(UIStatusBarItemView *)self updateContentsAndWidth];
    if (v8 != 0.0)
    {
      double v9 = v8;
      objc_super v10 = [(UIStatusBarItemView *)self layoutManager];
      [v10 itemView:self sizeChangedBy:v9];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarDataNetworkItemView;
  [(UIResponder *)&v11 touchesEnded:v6 withEvent:v7];
}

- (id)_dataNetworkImageName
{
  switch(self->_dataNetworkType)
  {
    case 0:
      v2 = @"DataTypeGPRS";
      break;
    case 1:
      v2 = @"DataTypeEDGE";
      break;
    case 2:
      v2 = @"DataTypeUMTS";
      break;
    case 3:
      v2 = @"DataType4G";
      break;
    case 4:
      v2 = @"DataTypeLTE";
      break;
    case 5:
      if (self->_wifiLinkWarning)
      {
        v2 = @"WiFiWarning";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%d_WifiBars", self->_wifiStrengthBars);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 6:
      v2 = @"DataTypeiOSHotspot";
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

- (id)_dataNetworkImage
{
  double v3 = [(UIStatusBarDataNetworkItemView *)self _dataNetworkImageName];
  char v4 = [(UIStatusBarItemView *)self imageWithShadowNamed:v3];

  return v4;
}

- (id)_stringForRSSI
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_wifiStrengthRaw);
}

- (id)accessibilityHUDRepresentation
{
  double v3 = [(UIStatusBarItemView *)self foregroundStyle];
  char v4 = [v3 textForNetworkType:self->_dataNetworkType];

  if (v4)
  {
LABEL_10:
    id v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    switch(self->_dataNetworkType)
    {
      case 0:
        unsigned int v5 = @"GPRS";
        goto LABEL_8;
      case 4:
        unsigned int v5 = @"LTE";
        goto LABEL_8;
      case 8:
        unsigned int v5 = @"5GE";
        id v6 = @"5G   ";
        goto LABEL_9;
      case 9:
        unsigned int v5 = @"LTE-A";
        goto LABEL_8;
      case 0xA:
        unsigned int v5 = @"LTE+";
LABEL_8:
        id v6 = v5;
LABEL_9:
        char v4 = _UINSLocalizedStringWithDefaultValue(v5, v6);
        if (v4) {
          goto LABEL_10;
        }
        goto LABEL_14;
      default:
LABEL_14:
        objc_super v10 = [(UIStatusBarItemView *)self foregroundStyle];
        objc_super v11 = [(UIStatusBarDataNetworkItemView *)self _dataNetworkImageName];
        char v4 = [v10 accessibilityHUDImageNamed:v11];

        id v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v4, 1, 0.0, 0.0, 0.0, 0.0);
        break;
    }
  }
  double v8 = v7;

  return v8;
}

@end