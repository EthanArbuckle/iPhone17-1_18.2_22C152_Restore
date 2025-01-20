@interface _UIPrototypingMenuBoolCell
+ (int64_t)_layoutAxis;
- (UISwitch)valueSwitch;
- (_UIPrototypingMenuBoolCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_prototypingSettingDidChange;
- (void)_switchDidChangeValue:(id)a3;
- (void)setValueSwitch:(id)a3;
@end

@implementation _UIPrototypingMenuBoolCell

- (_UIPrototypingMenuBoolCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuBoolCell;
  v4 = [(_UIPrototypingMenuCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [UISwitch alloc];
    uint64_t v6 = -[UISwitch initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    valueSwitch = v4->_valueSwitch;
    v4->_valueSwitch = (UISwitch *)v6;

    [(UIView *)v4->_valueSwitch sizeToFit];
    [(UIControl *)v4->_valueSwitch addTarget:v4 action:sel__switchDidChangeValue_ forControlEvents:4096];
    v8 = [(_UIPrototypingMenuCell *)v4 stackView];
    [v8 addArrangedSubview:v4->_valueSwitch];

    [(UITableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

+ (int64_t)_layoutAxis
{
  return 0;
}

- (void)_prototypingSettingDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPrototypingMenuBoolCell;
  [(_UIPrototypingMenuCell *)&v7 _prototypingSettingDidChange];
  v3 = [(_UIPrototypingMenuCell *)self prototypingSetting];
  v4 = [v3 currentValue];
  uint64_t v5 = [v4 BOOLValue];
  uint64_t v6 = [(_UIPrototypingMenuBoolCell *)self valueSwitch];
  [v6 setOn:v5];
}

- (void)_switchDidChangeValue:(id)a3
{
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isOn"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(_UIPrototypingMenuCell *)self prototypingSetting];
  [v4 setCurrentValue:v5];
}

- (UISwitch)valueSwitch
{
  return self->_valueSwitch;
}

- (void)setValueSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end