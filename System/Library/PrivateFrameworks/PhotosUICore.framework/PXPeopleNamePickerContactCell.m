@interface PXPeopleNamePickerContactCell
- (CNAvatarView)contactAvatarView;
- (NSArray)constraintsForHiddenSubtitle;
- (NSArray)constraintsForVisibleSubtitle;
- (PXPeopleNamePickerContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)subtitleLabel;
- (UIView)labelsContainer;
- (void)setConstraintsForHiddenSubtitle:(id)a3;
- (void)setConstraintsForVisibleSubtitle:(id)a3;
- (void)setLabelsContainer:(id)a3;
- (void)updateConstraints;
@end

@implementation PXPeopleNamePickerContactCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsForHiddenSubtitle, 0);
  objc_storeStrong((id *)&self->_constraintsForVisibleSubtitle, 0);
  objc_destroyWeak((id *)&self->_labelsContainer);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_contactAvatarView);
}

- (void)setConstraintsForHiddenSubtitle:(id)a3
{
}

- (NSArray)constraintsForHiddenSubtitle
{
  return self->_constraintsForHiddenSubtitle;
}

- (void)setConstraintsForVisibleSubtitle:(id)a3
{
}

- (NSArray)constraintsForVisibleSubtitle
{
  return self->_constraintsForVisibleSubtitle;
}

- (void)setLabelsContainer:(id)a3
{
}

- (UIView)labelsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelsContainer);
  return (UIView *)WeakRetained;
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);
  return (UILabel *)WeakRetained;
}

- (CNAvatarView)contactAvatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactAvatarView);
  return (CNAvatarView *)WeakRetained;
}

- (void)updateConstraints
{
  v3 = [(PXPeopleNamePickerContactCell *)self subtitleLabel];
  v4 = [(PXPeopleNamePickerContactCell *)self constraintsForHiddenSubtitle];
  v5 = [(PXPeopleNamePickerContactCell *)self constraintsForVisibleSubtitle];
  v6 = [v3 text];
  uint64_t v7 = [v6 length];

  BOOL v8 = v7 == 0;
  if (v7) {
    v9 = v4;
  }
  else {
    v9 = v5;
  }
  if (v7) {
    v10 = v5;
  }
  else {
    v10 = v4;
  }
  [v3 setHidden:v8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:v9];
  [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleNamePickerContactCell;
  [(PXPeopleNamePickerContactCell *)&v11 updateConstraints];
}

- (PXPeopleNamePickerContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)PXPeopleNamePickerContactCell;
  v4 = [(PXPeopleNamePickerCell *)&v26 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BB38]);
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    BOOL v8 = [(PXPeopleNamePickerCell *)v4 titleLabel];
    v9 = [(PXPeopleNamePickerContactCell *)v4 contentView];
    [v9 addSubview:v6];
    [v9 addSubview:v5];
    [v6 addSubview:v8];
    [v6 addSubview:v7];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] smallSystemFontSize];
    objc_super v11 = objc_msgSend(v10, "systemFontOfSize:");
    [v7 setFont:v11];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(PXPeopleNamePickerCell *)v4 baseConstraints];
    [v9 removeConstraints:v12];

    [(PXPeopleNamePickerCell *)v4 setBaseConstraints:0];
    v25 = _NSDictionaryOfVariableBindings(&cfstr_AvatarviewLabe.isa, v5, v6, 0);
    v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[avatarView]-20-[labelsContainer]-|" options:1024 metrics:0 views:v25];
    [v9 addConstraints:v13];

    v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[avatarView]-|" options:0 metrics:0 views:v25];
    [v9 addConstraints:v14];

    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:7 relatedBy:0 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];
    [v9 addConstraint:v15];

    v16 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelSubt.isa, v8, v7, 0);
    v17 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[titleLabel]|" options:0 metrics:0 views:v16];
    [v6 addConstraints:v17];

    v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[subtitleLabel]|" options:0 metrics:0 views:v16];
    [v6 addConstraints:v18];

    id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[titleLabel]|" options:0 metrics:0 views:v16];
    v21 = (void *)[v19 initWithArray:v20];

    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v8 attribute:10 multiplier:1.0 constant:0.0];
    [v21 addObject:v22];

    [v6 addConstraints:v21];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v21];
    [(PXPeopleNamePickerContactCell *)v4 setConstraintsForHiddenSubtitle:v21];
    v23 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[titleLabel]-[subtitleLabel]|" options:0 metrics:0 views:v16];
    [v6 addConstraints:v23];
    [(PXPeopleNamePickerContactCell *)v4 setConstraintsForVisibleSubtitle:v23];
    objc_storeWeak((id *)&v4->_contactAvatarView, v5);
    objc_storeWeak((id *)&v4->_subtitleLabel, v7);
    objc_storeWeak((id *)&v4->_labelsContainer, v6);
  }
  return v4;
}

@end