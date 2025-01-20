@interface UIStatusBarThermalColorItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (id)_color;
- (id)contentsImage;
@end

@implementation UIStatusBarThermalColorItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  int v6 = *(_DWORD *)(v5 + 2268);
  BOOL v7 = *(unsigned char *)(v5 + 2272) & 1;
  int thermalColor = self->_thermalColor;
  BOOL result = v6 != thermalColor;
  if (v6 != thermalColor) {
    self->_int thermalColor = v6;
  }
  if (v7 != self->_sunlightMode)
  {
    self->_sunlightMode = v7;
    return 1;
  }
  return result;
}

- (id)contentsImage
{
  [(UIView *)self bounds];
  double v4 = (v3 + -10.0) * 0.5;
  [(UIStatusBarItemView *)self shadowPadding];
  CGFloat v6 = v5;
  double v7 = v5 + v5 + 10.0;
  [(UIStatusBarItemView *)self beginImageContextWithMinimumWidth:v7];
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v9 = 0;
  }
  else {
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v10 = floor(v4);
  CGContextSaveGState(v9);
  CGContextTranslateCTM(v9, v6, 0.0);
  v11 = [(UIStatusBarThermalColorItemView *)self _color];
  [v11 set];

  if (self->_sunlightMode)
  {
    v12 = GetContextStack(0);
    if (*(int *)v12 < 1) {
      v13 = 0;
    }
    else {
      v13 = (CGContext *)v12[3 * (*(_DWORD *)v12 - 1) + 1];
    }
    CGContextSetLineWidth(v13, 3.0);
    UIRectFrameUsingOperation(1, 0.0, v10, 10.0, 10.0);
  }
  else
  {
    UIRectFillUsingOperation(1, 0.0, v10, 10.0, 10.0);
  }
  v14 = [(UIStatusBarItemView *)self imageFromImageContextClippedToWidth:v7];
  CGContextRestoreGState(v9);
  [(UIStatusBarItemView *)self endImageContext];
  v15 = +[_UILegibilityImageSet imageFromImage:v14 withShadowImage:0];

  return v15;
}

- (id)_color
{
  switch(self->_thermalColor)
  {
    case 1:
      v2 = +[UIColor yellowColor];
      break;
    case 2:
      v2 = +[UIColor orangeColor];
      break;
    case 3:
      v2 = +[UIColor redColor];
      break;
    case 4:
      v2 = +[UIColor purpleColor];
      break;
    case 5:
      v2 = +[UIColor blueColor];
      break;
    case 6:
      v2 = +[UIColor whiteColor];
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

@end