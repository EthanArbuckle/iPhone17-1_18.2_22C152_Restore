@interface _TVRemoteAlertVisualStyle_Pad
- (BOOL)allowsSwipeToDismiss;
- (BOOL)allowsTapToDismiss;
- (CGRect)frameForParentView:(id)a3;
- (double)crossfadeDuration;
- (double)maximizedCornerRadius;
- (double)minimizedCornerRadius;
- (double)remoteHeight;
- (double)remoteWidth;
- (id)backgroundMaterialView;
- (id)foregroundVisualEffect;
@end

@implementation _TVRemoteAlertVisualStyle_Pad

- (double)remoteWidth
{
  return 375.0;
}

- (double)remoteHeight
{
  return 812.0;
}

- (double)minimizedCornerRadius
{
  return 10.0;
}

- (double)maximizedCornerRadius
{
  return 40.0;
}

- (CGRect)frameForParentView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v5 = CGRectGetHeight(v27) + -27.0 + -27.0;
  [(_TVRemoteAlertVisualStyle_Pad *)self remoteHeight];
  if (v5 > v6)
  {
    [(_TVRemoteAlertVisualStyle_Pad *)self remoteHeight];
    double v5 = v7;
  }
  [v4 bounds];
  CGFloat v8 = CGRectGetWidth(v28) * 0.5;
  [(_TVRemoteAlertVisualStyle_Pad *)self remoteWidth];
  double v10 = v8 - v9 * 0.5;
  [v4 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v29.origin.x = v12;
  v29.origin.y = v14;
  v29.size.width = v16;
  v29.size.height = v18;
  CGFloat v19 = CGRectGetHeight(v29) * 0.5;
  [(_TVRemoteAlertVisualStyle_Pad *)self remoteHeight];
  double v21 = v19 - v20 * 0.5;
  [(_TVRemoteAlertVisualStyle_Pad *)self remoteWidth];
  double v23 = v22;
  double v24 = v10;
  double v25 = v21;
  double v26 = v5;
  result.size.height = v26;
  result.size.width = v23;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)foregroundVisualEffect
{
  return (id)[MEMORY[0x263F824D8] effectWithBlurRadius:20.0];
}

- (id)backgroundMaterialView
{
  return +[TVRMaterialView backgroundMaterialViewWithWeighting:0.0];
}

- (BOOL)allowsTapToDismiss
{
  return 1;
}

- (BOOL)allowsSwipeToDismiss
{
  return 0;
}

- (double)crossfadeDuration
{
  return 0.2;
}

@end