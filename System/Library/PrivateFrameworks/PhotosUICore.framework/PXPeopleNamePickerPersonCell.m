@interface PXPeopleNamePickerPersonCell
- (PHPerson)person;
- (PXPeopleNamePickerPersonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PXPeopleScalableAvatarView)personAvatarView;
- (void)setPerson:(id)a3;
@end

@implementation PXPeopleNamePickerPersonCell

- (void).cxx_destruct
{
}

- (PXPeopleScalableAvatarView)personAvatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personAvatarView);
  return (PXPeopleScalableAvatarView *)WeakRetained;
}

- (PHPerson)person
{
  v4 = [(PXPeopleNamePickerPersonCell *)self personAvatarView];
  v5 = [v4 person];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v10);
    v11 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PXPeopleNamePickerCell.m", 89, @"%@ should be an instance inheriting from %@, but it is %@", @"self.personAvatarView.person", v9, v11 object file lineNumber description];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PXPeopleNamePickerCell.m", 89, @"%@ should be an instance inheriting from %@, but it is nil", @"self.personAvatarView.person", v9 object file lineNumber description];
  }

LABEL_3:
  return (PHPerson *)v5;
}

- (void)setPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleNamePickerPersonCell *)self personAvatarView];
  [v5 setPerson:v4];
}

- (PXPeopleNamePickerPersonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleNamePickerPersonCell;
  id v4 = [(PXPeopleNamePickerCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(PXPeopleScalableAvatarView);
    v6 = [(PXPeopleNamePickerCell *)v4 titleLabel];
    v7 = [(PXPeopleNamePickerPersonCell *)v4 contentView];
    [v7 addSubview:v5];
    [(PXPeopleScalableAvatarView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXPeopleScalableAvatarView *)v5 setAccessibilityIgnoresInvertColors:1];
    v8 = [(PXPeopleNamePickerCell *)v4 baseConstraints];
    [v7 removeConstraints:v8];

    [(PXPeopleNamePickerCell *)v4 setBaseConstraints:0];
    v9 = _NSDictionaryOfVariableBindings(&cfstr_AvatarviewTitl.isa, v5, v6, 0);
    v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[avatarView]-20-[titleLabel]-|" options:1024 metrics:0 views:v9];
    [v7 addConstraints:v10];

    v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[avatarView]-|" options:0 metrics:0 views:v9];
    [v7 addConstraints:v11];

    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:7 relatedBy:0 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];
    [v7 addConstraint:v12];

    objc_storeWeak((id *)&v4->_personAvatarView, v5);
  }
  return v4;
}

@end