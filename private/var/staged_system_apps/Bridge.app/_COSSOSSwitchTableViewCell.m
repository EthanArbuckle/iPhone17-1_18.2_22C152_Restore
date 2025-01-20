@interface _COSSOSSwitchTableViewCell
+ (NSString)reuseID;
- (_COSSOSSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (_COSSOSSwitchTableViewCellDelegate)delegate;
- (void)_switchValueDidChange:(id)a3;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
@end

@implementation _COSSOSSwitchTableViewCell

- (_COSSOSSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_COSSOSSwitchTableViewCell;
  v5 = [(_COSSOSSwitchTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(_COSSOSSwitchTableViewCell *)v5 control];
    [v7 addTarget:v6 action:"_switchValueDidChange:" forEvents:4096];
  }
  return v6;
}

+ (NSString)reuseID
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)_switchValueDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 switchCellDidChangeValue:self];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)_COSSOSSwitchTableViewCell;
  [(_COSSOSSwitchTableViewCell *)&v4 prepareForReuse];
  v3 = [(_COSSOSSwitchTableViewCell *)self titleLabel];
  [v3 setText:0];

  [(_COSSOSSwitchTableViewCell *)self setIcon:0];
}

- (_COSSOSSwitchTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_COSSOSSwitchTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end