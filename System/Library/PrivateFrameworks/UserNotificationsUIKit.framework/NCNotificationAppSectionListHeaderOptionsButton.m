@interface NCNotificationAppSectionListHeaderOptionsButton
- (UIBezierPath)visiblePathForPreview;
@end

@implementation NCNotificationAppSectionListHeaderOptionsButton

- (UIBezierPath)visiblePathForPreview
{
  [(NCNotificationAppSectionListHeaderOptionsButton *)self bounds];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetHeight(v10);
  UIRectCenteredIntegralRect();
  v6 = (void *)MEMORY[0x1E4FB14C0];

  return (UIBezierPath *)objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:");
}

@end