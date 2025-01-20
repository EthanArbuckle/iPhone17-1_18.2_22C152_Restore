@interface NCNotificationListStackDimmingOverlayView
- (NCNotificationListStackDimmingOverlayView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateStackDimmingVisualStyling;
@end

@implementation NCNotificationListStackDimmingOverlayView

- (NCNotificationListStackDimmingOverlayView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListStackDimmingOverlayView;
  v5 = -[NCNotificationListStackDimmingOverlayView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(NCNotificationListStackDimmingOverlayView *)v5 setUserInteractionEnabled:0];
    [(NCNotificationListStackDimmingOverlayView *)v6 _setContinuousCornerRadius:a4];
    [(NCNotificationListStackDimmingOverlayView *)v6 setAutoresizingMask:18];
    [(NCNotificationListStackDimmingOverlayView *)v6 setAlpha:0.0];
    [(NCNotificationListStackDimmingOverlayView *)v6 _updateStackDimmingVisualStyling];
  }
  return v6;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListStackDimmingOverlayView;
  [(NCNotificationListStackDimmingOverlayView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(NCNotificationListStackDimmingOverlayView *)self _updateStackDimmingVisualStyling];
}

- (void)_updateStackDimmingVisualStyling
{
  objc_super v3 = [(NCNotificationListStackDimmingOverlayView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  v5 = @"stackDimmingLight";
  if (v4 == 2) {
    v5 = @"stackDimmingDark";
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E4F743E8];
  objc_super v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [v7 _visualStylingProviderForStyleSetNamed:v6 inBundle:v8];

  [(NCNotificationListStackDimmingOverlayView *)self alpha];
  double v10 = v9;
  v11 = [v12 _visualStylingForStyle:1];
  [(NCNotificationListStackDimmingOverlayView *)self mt_replaceVisualStyling:v11];

  [(NCNotificationListStackDimmingOverlayView *)self setAlpha:v10];
}

@end