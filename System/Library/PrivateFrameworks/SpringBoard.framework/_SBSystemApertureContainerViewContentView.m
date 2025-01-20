@interface _SBSystemApertureContainerViewContentView
- (UIView)contentView;
- (void)setBounds:(CGRect)a3;
- (void)setContentView:(id)a3;
@end

@implementation _SBSystemApertureContainerViewContentView

- (UIView)contentView
{
  v2 = [(_SBSystemApertureContainerViewContentView *)self subviews];
  v3 = objc_msgSend(v2, "sbsa_onlyObjectOrNilAssert");

  return (UIView *)v3;
}

- (void)setContentView:(id)a3
{
  id v4 = a3;
  v5 = [(_SBSystemApertureContainerViewContentView *)self contentView];
  if ((BSEqualObjects() & 1) == 0)
  {
    [v5 removeFromSuperview];
    [(_SBSystemApertureContainerViewContentView *)self addSubview:v4];
    [(_SBSystemApertureContainerViewContentView *)self bounds];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    v14 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60___SBSystemApertureContainerViewContentView_setContentView___block_invoke;
    v15[3] = &unk_1E6AF8568;
    id v16 = v4;
    uint64_t v17 = v7;
    uint64_t v18 = v9;
    uint64_t v19 = v11;
    uint64_t v20 = v13;
    [v14 performWithoutAnimation:v15];
  }
}

- (void)setBounds:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_SBSystemApertureContainerViewContentView;
  -[_SBSystemApertureContainerViewContentView setBounds:](&v18, sel_setBounds_);
  id v4 = [(_SBSystemApertureContainerViewContentView *)self contentView];
  v5 = v4;
  memset(&v17, 0, sizeof(v17));
  if (v4) {
    [v4 transform];
  }
  BSRectWithSize();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGAffineTransform v15 = v17;
  CGAffineTransformInvert(&v16, &v15);
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  CGRectApplyAffineTransform(v19, &v16);
  v14 = [(_SBSystemApertureContainerViewContentView *)self traitCollection];
  [v14 displayScale];
  UIRectRoundToScale();
  objc_msgSend(v5, "setBounds:");

  UIRectGetCenter();
  objc_msgSend(v5, "setCenter:");
}

@end