@interface SFPrivacyReportGridTableViewCell
- (SFPrivacyReportGridTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFPrivacyReportGridView)gridView;
- (void)setGridView:(id)a3;
@end

@implementation SFPrivacyReportGridTableViewCell

- (SFPrivacyReportGridTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SFPrivacyReportGridTableViewCell;
  v4 = [(SFPrivacyReportGridTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SFPrivacyReportGridTableViewCell *)v4 setBackgroundView:0];
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(SFPrivacyReportGridTableViewCell *)v5 setBackgroundColor:v6];

    v7 = v5;
  }

  return v5;
}

- (void)setGridView:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v5 = (SFPrivacyReportGridView *)a3;
  p_gridView = &self->_gridView;
  gridView = self->_gridView;
  if (gridView != v5)
  {
    if ([(SFPrivacyReportGridView *)gridView isDescendantOfView:self]) {
      [(SFPrivacyReportGridView *)*p_gridView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_gridView, a3);
    if (*p_gridView)
    {
      [(SFPrivacyReportGridView *)*p_gridView setPreservesSuperviewLayoutMargins:1];
      [(SFPrivacyReportGridView *)*p_gridView setTranslatesAutoresizingMaskIntoConstraints:0];
      v8 = [(SFPrivacyReportGridTableViewCell *)self contentView];
      [v8 addSubview:*p_gridView];
      v17 = (void *)MEMORY[0x1E4F28DC8];
      v22 = [(SFPrivacyReportGridView *)*p_gridView leadingAnchor];
      v21 = [v8 leadingAnchor];
      v20 = [v22 constraintEqualToAnchor:v21];
      v23[0] = v20;
      v19 = [(SFPrivacyReportGridView *)*p_gridView trailingAnchor];
      v18 = [v8 trailingAnchor];
      objc_super v9 = [v19 constraintEqualToAnchor:v18];
      v23[1] = v9;
      v10 = [(SFPrivacyReportGridView *)*p_gridView topAnchor];
      v11 = [v8 topAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      v23[2] = v12;
      v13 = [(SFPrivacyReportGridView *)*p_gridView bottomAnchor];
      v14 = [v8 bottomAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v23[3] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
      [v17 activateConstraints:v16];
    }
  }
}

- (SFPrivacyReportGridView)gridView
{
  return self->_gridView;
}

- (void).cxx_destruct
{
}

@end