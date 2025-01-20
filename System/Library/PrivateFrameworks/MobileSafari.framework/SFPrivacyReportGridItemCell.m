@interface SFPrivacyReportGridItemCell
- (UIView)reportView;
- (void)setReportView:(id)a3;
@end

@implementation SFPrivacyReportGridItemCell

- (void)setReportView:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v5 = (UIView *)a3;
  v6 = [(SFPrivacyReportGridItemCell *)self contentView];
  p_reportView = (id *)&self->_reportView;
  reportView = self->_reportView;
  if (reportView == v5)
  {
    if ([(UIView *)v5 isDescendantOfView:v6]) {
      goto LABEL_8;
    }
    reportView = (UIView *)*p_reportView;
  }
  v9 = [(UIView *)reportView superview];

  if (v9 == v6) {
    [*p_reportView removeFromSuperview];
  }
  objc_storeStrong(p_reportView, a3);
  if (*p_reportView)
  {
    [*p_reportView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:*p_reportView];
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [*p_reportView topAnchor];
    v22 = [v6 topAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v24[0] = v21;
    v20 = [*p_reportView leftAnchor];
    v19 = [v6 leftAnchor];
    v10 = [v20 constraintEqualToAnchor:v19];
    v24[1] = v10;
    v11 = [*p_reportView bottomAnchor];
    v12 = [v6 bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    v14 = [*p_reportView rightAnchor];
    v15 = [v6 rightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v18 activateConstraints:v17];
  }
LABEL_8:
}

- (UIView)reportView
{
  return self->_reportView;
}

- (void).cxx_destruct
{
}

@end