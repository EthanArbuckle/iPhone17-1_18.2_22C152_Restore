@interface UIStatusBarExternalForegroundStyleAttributes
- (BOOL)usesVerticalLayout;
- (UIEdgeInsets)edgeInsetsForBatteryInsides;
- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides;
- (double)leftEdgePadding;
- (double)middlePadding;
- (double)rightEdgePadding;
- (double)scale;
- (double)standardPadding;
- (double)textOffsetForStyle:(int64_t)a3;
- (id)makeTextFontForStyle:(int64_t)a3;
- (id)textForNetworkType:(int)a3;
- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3;
@end

@implementation UIStatusBarExternalForegroundStyleAttributes

- (double)scale
{
  v2 = +[UIScreen _carScreen];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIScreen mainScreen];
  }
  v5 = v4;

  [v5 scale];
  double v7 = v6;

  return v7;
}

- (BOOL)usesVerticalLayout
{
  return 1;
}

- (double)standardPadding
{
  return 7.0;
}

- (double)middlePadding
{
  return 0.0;
}

- (double)leftEdgePadding
{
  return 0.0;
}

- (double)rightEdgePadding
{
  return 0.0;
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  [(UIStatusBarExternalForegroundStyleAttributes *)self scale];
  if (v2 <= 2.5) {
    double v3 = 4.5;
  }
  else {
    double v3 = 4.33333333;
  }
  double v4 = 2.0;
  double v5 = 2.0;
  double v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides
{
  double v2 = 6.5;
  double v3 = 1.0;
  double v4 = 6.0;
  double v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3) {
    return 18;
  }
  else {
    return 17;
  }
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  double v6 = 12.0;
  switch(a3)
  {
    case 1:
      goto LABEL_4;
    case 3:
      double v6 = 16.0;
      goto LABEL_4;
    case 4:
      v9 = off_1E52D39B8;
      double v10 = *(double *)off_1E52D6BF8;
      double v11 = 10.0;
      goto LABEL_7;
    case 5:
      v9 = off_1E52D39B8;
      double v10 = *(double *)off_1E52D6C00;
      double v11 = 11.0;
LABEL_7:
      v8 = [v9 monospacedDigitSystemFontOfSize:v11 weight:v10];
      break;
    default:
      double v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 12.0);
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIStatusBarExternalForegroundStyleAttributes.m", 99, @"font requested for style %ld but font size was not determined", a3);

      double v6 = 0.0;
LABEL_4:
      v8 = [off_1E52D39B8 systemFontOfSize:v6];
      break;
  }
  return v8;
}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 1.0;
}

- (id)textForNetworkType:(int)a3
{
  if (!a3)
  {
    double v3 = @"GPRS";
    goto LABEL_5;
  }
  if (a3 == 4)
  {
    double v3 = @"LTE";
LABEL_5:
    double v4 = _UINSLocalizedStringWithDefaultValue(v3, v3);
    goto LABEL_7;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarExternalForegroundStyleAttributes;
  double v4 = -[UIStatusBarForegroundStyleAttributes textForNetworkType:](&v6, sel_textForNetworkType_);
LABEL_7:
  return v4;
}

@end