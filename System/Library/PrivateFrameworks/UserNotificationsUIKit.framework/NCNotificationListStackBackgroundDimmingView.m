@interface NCNotificationListStackBackgroundDimmingView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (void)_updateDimming;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation NCNotificationListStackBackgroundDimmingView

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  double v3 = 2.0;
  if (a3->a >= 0.94) {
    double v3 = 1.0;
  }
  if (a3->a > 0.94) {
    double v3 = 0.0;
  }
  double v4 = dbl_1D7D95950[v3 == 1.0];
  if (a3->a > 0.94) {
    double v4 = 0.0;
  }
  self->_absoluteStackingBrightnessFilterInput = v4;
  [(NCNotificationListStackBackgroundDimmingView *)self _updateDimming];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListStackBackgroundDimmingView;
  [(NCNotificationListStackBackgroundDimmingView *)&v4 setBackgroundColor:a3];
  [(NCNotificationListStackBackgroundDimmingView *)self _updateDimming];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.colorBrightness.inputAmount"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationListStackBackgroundDimmingView;
    BOOL v5 = [(NCNotificationListStackBackgroundDimmingView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_updateDimming
{
  v15[1] = *MEMORY[0x1E4F143B8];
  double absoluteStackingBrightnessFilterInput = self->_absoluteStackingBrightnessFilterInput;
  id v4 = [(NCNotificationListStackBackgroundDimmingView *)self backgroundColor];
  [v4 _luminance];
  double v6 = v5;

  objc_super v7 = [(NCNotificationListStackBackgroundDimmingView *)self layer];
  v8 = [v7 filters];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A000]];
    [v9 setName:@"colorBrightness"];
    v10 = [(NCNotificationListStackBackgroundDimmingView *)self layer];
    v15[0] = v9;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v10 setFilters:v11];
  }
  if (v6 <= 0.5) {
    double v12 = absoluteStackingBrightnessFilterInput;
  }
  else {
    double v12 = -absoluteStackingBrightnessFilterInput;
  }
  v13 = [(NCNotificationListStackBackgroundDimmingView *)self layer];
  v14 = [NSNumber numberWithDouble:v12];
  [v13 setValue:v14 forKeyPath:@"filters.colorBrightness.inputAmount"];
}

@end