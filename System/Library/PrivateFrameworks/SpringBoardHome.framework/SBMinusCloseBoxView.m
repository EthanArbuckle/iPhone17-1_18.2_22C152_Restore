@interface SBMinusCloseBoxView
- (id)defaultContentImage;
- (void)layoutSubviews;
@end

@implementation SBMinusCloseBoxView

- (id)defaultContentImage
{
  if (defaultContentImage_onceToken_172 != -1) {
    dispatch_once(&defaultContentImage_onceToken_172, &__block_literal_global_174);
  }
  v2 = (void *)defaultContentImage___image_171;
  return v2;
}

void __42__SBMinusCloseBoxView_defaultContentImage__block_invoke()
{
  int v2 = __sb__runningInSpringBoard();
  char v3 = v2;
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = @"IconCloseBoxMinus";
      goto LABEL_15;
    }
  }
  else
  {
    v0 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v0 userInterfaceIdiom] != 1)
    {
      v12 = @"IconCloseBoxMinus";
LABEL_14:

      goto LABEL_15;
    }
  }
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v1 _referenceBounds];
  }
  BSSizeRoundForScale();
  v6 = @"IconCloseBoxMinusLarge";
  if (v7 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    v6 = @"IconCloseBoxMinus";
  }
  v12 = v6;
  if ((v5 & 1) == 0) {

  }
  if ((v3 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  v8 = (void *)MEMORY[0x1E4FB1818];
  v9 = SBHBundle();
  uint64_t v10 = [v8 imageNamed:v12 inBundle:v9];
  v11 = (void *)defaultContentImage___image_171;
  defaultContentImage___image_171 = v10;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBMinusCloseBoxView;
  [(SBHomeScreenButton *)&v6 layoutSubviews];
  char v3 = [(SBHomeScreenButton *)self materialView];
  [(SBMinusCloseBoxView *)self bounds];
  objc_msgSend(v3, "setImageSize:", v4, v5);
}

@end