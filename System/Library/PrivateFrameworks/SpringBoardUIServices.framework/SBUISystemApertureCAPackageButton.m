@interface SBUISystemApertureCAPackageButton
- (BOOL)_updateStateAnimated:(BOOL)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBUISystemApertureCAPackageButton)initWithPackageProvider:(id)a3 state:(id)a4 primaryAction:(id)a5;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBUISystemApertureCAPackageButton

- (SBUISystemApertureCAPackageButton)initWithPackageProvider:(id)a3 state:(id)a4 primaryAction:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    v13 = v12;
    v14 = [v10 providedView];
    [v14 frame];
    v19.receiver = self;
    v19.super_class = (Class)SBUISystemApertureCAPackageButton;
    v15 = -[SBUISystemApertureCAPackageButton initWithFrame:primaryAction:](&v19, sel_initWithFrame_primaryAction_, v13);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_packageProvider, a3);
      objc_storeStrong((id *)&v16->_state, a4);
      [v14 setUserInteractionEnabled:0];
      [(SBUISystemApertureCAPackageButton *)v16 addSubview:v14];
      if (v11) {
        [(SBUISystemApertureCAPackageButton *)v16 _updateStateAnimated:0];
      }
    }

    return v16;
  }
  else
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"packageProvider != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBUISystemApertureCAPackageButton initWithPackageProvider:state:primaryAction:](a2, (uint64_t)self, (uint64_t)v18);
    }
    [v18 UTF8String];
    result = (SBUISystemApertureCAPackageButton *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_state, a3);
  return [(SBUISystemApertureCAPackageButton *)self _updateStateAnimated:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureCAPackageButton;
  unsigned int v5 = [(SBUISystemApertureCAPackageButton *)&v7 isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)SBUISystemApertureCAPackageButton;
  [(SBUISystemApertureCAPackageButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(SBUISystemApertureCAPackageButton *)self _updateStateAnimated:1];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureCAPackageButton;
  [(SBUISystemApertureCAPackageButton *)&v12 layoutSubviews];
  [(SBUISystemApertureCAPackageButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SBUISystemApertureCustomContentProvider *)self->_packageProvider providedView];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(SBUISystemApertureCustomContentProvider *)self->_packageProvider providedView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(SBUISystemApertureCustomContentProvider *)self->_packageProvider providedView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)_updateStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = self->_state;
  if ([(SBUISystemApertureCAPackageButton *)self isHighlighted])
  {
    uint64_t v6 = [(NSString *)v5 stringByAppendingString:@"-pressed"];

    double v5 = (NSString *)v6;
  }
  BOOL v7 = [(SBUISystemApertureCAPackageContentProvider *)self->_packageProvider setState:v5 animated:v3];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_packageProvider, 0);
}

- (void)initWithPackageProvider:(const char *)a1 state:(uint64_t)a2 primaryAction:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBUISystemApertureCAPackageButton.m";
  __int16 v16 = 1024;
  int v17 = 25;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A7607000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end