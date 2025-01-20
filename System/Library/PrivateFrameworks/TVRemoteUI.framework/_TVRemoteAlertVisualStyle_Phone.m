@interface _TVRemoteAlertVisualStyle_Phone
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

@implementation _TVRemoteAlertVisualStyle_Phone

- (double)remoteWidth
{
  return 1.79769313e308;
}

- (double)remoteHeight
{
  return 1.79769313e308;
}

- (double)minimizedCornerRadius
{
  [(_TVRemoteAlertVisualStyle_Phone *)self maximizedCornerRadius];
  return v2 * 0.5;
}

- (double)maximizedCornerRadius
{
  return 0.0;
}

- (CGRect)frameForParentView:(id)a3
{
  [a3 bounds];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)foregroundVisualEffect
{
  return (id)[MEMORY[0x263F824D8] effectWithBlurRadius:20.0];
}

- (id)backgroundMaterialView
{
  return 0;
}

- (BOOL)allowsTapToDismiss
{
  return 0;
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