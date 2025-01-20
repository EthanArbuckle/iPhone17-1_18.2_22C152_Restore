@interface SFAvailableAppTableViewCell
- (ASCLockupView)lockupView;
- (SFAvailableAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setLockupView:(id)a3;
@end

@implementation SFAvailableAppTableViewCell

- (SFAvailableAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)SFAvailableAppTableViewCell;
  v4 = [(SFAvailableAppTableViewCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFAvailableAppTableViewCell *)v4 contentView];
    v7 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v5->_stackView;
    v5->_stackView = v7;

    [(UIStackView *)v5->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v5->_stackView setAxis:1];
    [v6 addSubview:v5->_stackView];
    v21 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UIStackView *)v5->_stackView topAnchor];
    v28 = [v6 layoutMarginsGuide];
    v26 = [v28 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v23 = [(UIStackView *)v5->_stackView bottomAnchor];
    v24 = [v6 layoutMarginsGuide];
    v22 = [v24 bottomAnchor];
    v20 = [v23 constraintEqualToAnchor:v22];
    v30[1] = v20;
    v19 = [(UIStackView *)v5->_stackView leadingAnchor];
    v9 = [v6 layoutMarginsGuide];
    v10 = [v9 leadingAnchor];
    v11 = [v19 constraintEqualToAnchor:v10];
    v30[2] = v11;
    v12 = [(UIStackView *)v5->_stackView trailingAnchor];
    v13 = [v6 layoutMarginsGuide];
    v14 = [v13 trailingAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    v30[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v21 activateConstraints:v16];

    v17 = v5;
  }

  return v5;
}

- (void)setLockupView:(id)a3
{
  id v7 = a3;
  p_lockupView = &self->_lockupView;
  lockupView = self->_lockupView;
  if (lockupView
    && [(ASCLockupView *)lockupView isDescendantOfView:self->_stackView])
  {
    [(UIStackView *)self->_stackView removeArrangedSubview:*p_lockupView];
    [(ASCLockupView *)*p_lockupView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_lockupView, a3);
  if (*p_lockupView)
  {
    [(ASCLockupView *)*p_lockupView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_stackView addArrangedSubview:*p_lockupView];
  }
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end