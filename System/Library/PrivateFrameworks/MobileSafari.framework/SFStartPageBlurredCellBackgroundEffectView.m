@interface SFStartPageBlurredCellBackgroundEffectView
- (SFStartPageBlurredCellBackgroundEffectView)init;
- (void)setUsesDefaultCaptureGroup:(BOOL)a3;
@end

@implementation SFStartPageBlurredCellBackgroundEffectView

- (SFStartPageBlurredCellBackgroundEffectView)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultStartPageBackgroundEffect");
  v9.receiver = self;
  v9.super_class = (Class)SFStartPageBlurredCellBackgroundEffectView;
  v4 = [(SFStartPageBlurredCellBackgroundEffectView *)&v9 initWithEffect:v3];

  if (v4)
  {
    [(SFStartPageBlurredCellBackgroundEffectView *)v4 setUsesDefaultCaptureGroup:1];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    id v6 = (id)[(SFStartPageBlurredCellBackgroundEffectView *)v4 registerForTraitChanges:v5 withAction:sel_sf_configureAsStartPageBackground];

    [(UIVisualEffectView *)v4 sf_configureAsStartPageBackground];
    v7 = v4;
  }

  return v4;
}

- (void)setUsesDefaultCaptureGroup:(BOOL)a3
{
  if (a3) {
    v3 = @"start-page-cell";
  }
  else {
    v3 = 0;
  }
  [(SFStartPageBlurredCellBackgroundEffectView *)self _setGroupName:v3];
}

@end