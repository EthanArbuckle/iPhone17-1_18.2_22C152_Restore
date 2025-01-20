@interface PKAddressEditorTableViewCell
- (PKAddressEditorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIStackView)stackView;
- (void)prepareForReuse;
@end

@implementation PKAddressEditorTableViewCell

- (PKAddressEditorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PKAddressEditorTableViewCell;
  v4 = [(PKAddressEditorTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKAddressEditorTableViewCell *)v4 setBackgroundColor:v5];

    [(PKAddressEditorTableViewCell *)v4 setOpaque:0];
    [(PKAddressEditorTableViewCell *)v4 setSelectionStyle:0];
    id v6 = objc_alloc(MEMORY[0x1E4FB1C60]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v7;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView setDistribution:1];
    [(UIStackView *)v4->_stackView setAxis:0];
    [(UIStackView *)v4->_stackView setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v4->_stackView setSpacing:10.0];
    [(UIStackView *)v4->_stackView setPreservesSuperviewLayoutMargins:1];
    v9 = v4->_stackView;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIStackView *)v9 setBackgroundColor:v10];

    v11 = [(PKAddressEditorTableViewCell *)v4 contentView];
    [v11 addSubview:v4->_stackView];
    [v11 setPreservesSuperviewLayoutMargins:1];
    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_stackView attribute:6 relatedBy:0 toItem:v11 attribute:6 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v12];

    v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_stackView attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v13];

    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_stackView attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v14];

    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_stackView attribute:4 relatedBy:0 toItem:v11 attribute:4 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v15];

    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4->_stackView attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
    [v11 addConstraint:v16];

    [(PKAddressEditorTableViewCell *)v4 setNeedsUpdateConstraints];
    [(PKAddressEditorTableViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F851F8]];
  }
  return v4;
}

- (void)prepareForReuse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKAddressEditorTableViewCell;
  [(PKAddressEditorTableViewCell *)&v13 prepareForReuse];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [(UIStackView *)self->_stackView removeArrangedSubview:v8];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
}

@end