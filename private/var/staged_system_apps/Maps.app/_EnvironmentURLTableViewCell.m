@interface _EnvironmentURLTableViewCell
- (_EnvironmentURLTableViewCell)initWithReuseIdentifier:(id)a3;
- (_EnvironmentURLTableViewCellDelegate)delegate;
- (unint64_t)urlType;
- (void)setDelegate:(id)a3;
- (void)setUrlType:(unint64_t)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation _EnvironmentURLTableViewCell

- (_EnvironmentURLTableViewCell)initWithReuseIdentifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_EnvironmentURLTableViewCell;
  v3 = [(_EnvironmentURLTableViewCell *)&v13 initWithStyle:1000 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(_EnvironmentURLTableViewCell *)v3 editableTextField];
    [v5 setReturnKeyType:9];

    v6 = [(_EnvironmentURLTableViewCell *)v4 editableTextField];
    [v6 setClearButtonMode:1];

    v7 = [(_EnvironmentURLTableViewCell *)v4 editableTextField];
    [v7 setKeyboardType:3];

    v8 = [(_EnvironmentURLTableViewCell *)v4 editableTextField];
    [v8 setAutocorrectionType:1];

    v9 = [(_EnvironmentURLTableViewCell *)v4 editableTextField];
    [v9 setAutocapitalizationType:0];

    [(_EnvironmentURLTableViewCell *)v4 setSelectionStyle:0];
    [(_EnvironmentURLTableViewCell *)v4 setTextFieldOffset:0.0];
    v10 = [(_EnvironmentURLTableViewCell *)v4 editableTextField];
    [v10 setDelegate:v4];

    v11 = v4;
  }

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  self->_editing = 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  self->_editing = 0;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = [v5 text];

  [WeakRetained urlCell:self didChangeURLString:v6];
}

- (unint64_t)urlType
{
  return self->_urlType;
}

- (void)setUrlType:(unint64_t)a3
{
  self->_urlType = a3;
}

- (_EnvironmentURLTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_EnvironmentURLTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end