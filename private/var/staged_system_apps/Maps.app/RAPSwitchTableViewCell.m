@interface RAPSwitchTableViewCell
- (BOOL)switchState;
- (RAPPlaceCorrectableFlag)correctableFlag;
- (RAPSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 delegate:(id)a5;
- (int64_t)kind;
- (void)_updateContent;
- (void)setCorrectableFlag:(id)a3;
- (void)updateSwitchState:(BOOL)a3;
- (void)updateValue:(id)a3;
@end

@implementation RAPSwitchTableViewCell

- (RAPSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RAPSwitchTableViewCell;
  v9 = [(RAPSingleLineTableViewCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    toggle = v10->_toggle;
    v10->_toggle = v11;

    [(UISwitch *)v10->_toggle addTarget:v10 action:"updateValue:" forControlEvents:4096];
    [(RAPSwitchTableViewCell *)v10 setAccessoryView:v10->_toggle];
    [(RAPSwitchTableViewCell *)v10 setSelectionStyle:0];
  }

  return v10;
}

- (void)setCorrectableFlag:(id)a3
{
  v5 = (RAPPlaceCorrectableFlag *)a3;
  if (self->_correctableFlag != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctableFlag, a3);
    [(RAPSwitchTableViewCell *)self _updateContent];
    v5 = v6;
  }
}

- (void)_updateContent
{
  [(UISwitch *)self->_toggle setOn:[(RAPPlaceCorrectableFlag *)self->_correctableFlag value] animated:0];
  id v4 = [(RAPPlaceCorrectableFlag *)self->_correctableFlag localizedTitle];
  v3 = [(RAPSingleLineTableViewCell *)self textLabel];
  [v3 setText:v4];
}

- (int64_t)kind
{
  return [(RAPPlaceCorrectableFlag *)self->_correctableFlag kind];
}

- (void)updateValue:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 isOn];

  [WeakRetained switchTableViewCell:self changedValue:v6];
}

- (void)updateSwitchState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISwitch *)self->_toggle isOn] != a3)
  {
    toggle = self->_toggle;
    [(UISwitch *)toggle setOn:v3 animated:1];
  }
}

- (RAPPlaceCorrectableFlag)correctableFlag
{
  return self->_correctableFlag;
}

- (BOOL)switchState
{
  return self->_switchState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableFlag, 0);
  objc_storeStrong((id *)&self->_toggle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end