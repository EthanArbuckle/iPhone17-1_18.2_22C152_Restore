@interface OMTextFieldTableViewCell
- (UITextField)textField;
- (void)setTextField:(id)a3;
@end

@implementation OMTextFieldTableViewCell

- (void)setTextField:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(OMTextFieldTableViewCell *)self textField];

  if (v6 != v5)
  {
    id obj = a3;
    v7 = [(OMTextFieldTableViewCell *)self textField];

    if (v7)
    {
      v8 = [(OMTextFieldTableViewCell *)self textField];
      [v8 removeFromSuperview];
    }
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(OMTextFieldTableViewCell *)self contentView];
    [v9 addSubview:v5];

    v23 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [v5 topAnchor];
    v31 = [(OMTextFieldTableViewCell *)self contentView];
    v30 = [v31 safeAreaLayoutGuide];
    v28 = [v30 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:12.0];
    v33[0] = v27;
    v24 = [v5 bottomAnchor];
    v26 = [(OMTextFieldTableViewCell *)self contentView];
    v25 = [v26 safeAreaLayoutGuide];
    v22 = [v25 bottomAnchor];
    v21 = [v24 constraintEqualToAnchor:v22 constant:-12.0];
    v33[1] = v21;
    v18 = [v5 leadingAnchor];
    v20 = [(OMTextFieldTableViewCell *)self contentView];
    v19 = [v20 safeAreaLayoutGuide];
    v10 = [v19 leadingAnchor];
    v11 = [v18 constraintEqualToAnchor:v10 constant:20.0];
    v33[2] = v11;
    v12 = [v5 trailingAnchor];
    v13 = [(OMTextFieldTableViewCell *)self contentView];
    v14 = [v13 safeAreaLayoutGuide];
    v15 = [v14 trailingAnchor];
    v16 = [v12 constraintEqualToAnchor:v15 constant:-20.0];
    v33[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v23 activateConstraints:v17];

    objc_storeStrong((id *)&self->_textField, obj);
  }
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
}

@end