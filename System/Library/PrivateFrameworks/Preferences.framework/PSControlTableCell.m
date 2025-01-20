@interface PSControlTableCell
- (BOOL)canReload;
- (PSControlTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIControl)control;
- (id)controlValue;
- (id)newControl;
- (id)valueLabel;
- (void)controlChanged:(id)a3;
- (void)dealloc;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setControl:(id)a3;
@end

@implementation PSControlTableCell

- (PSControlTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PSControlTableCell;
  v5 = [(PSTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PSControlTableCell *)v5 setSelectionStyle:0];
    [(PSControlTableCell *)v6 setAccessoryType:0];
    id v7 = [(PSControlTableCell *)v6 newControl];
    [(PSControlTableCell *)v6 setControl:v7];
    [v7 addTarget:v6 action:sel_controlChanged_ forControlEvents:4096];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSControlTableCell;
  id v4 = a3;
  [(PSTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSControlTableCell *)self control];
  [v4 setProperty:v5 forKey:@"control"];
}

- (id)newControl
{
  return 0;
}

- (BOOL)canReload
{
  return 0;
}

- (id)valueLabel
{
  return 0;
}

- (void)dealloc
{
  [(PSTableCell *)self setCellTarget:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIControl *)self->_control removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  }
  v3.receiver = self;
  v3.super_class = (Class)PSControlTableCell;
  [(PSTableCell *)&v3 dealloc];
}

- (UIControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  v5 = (UIControl *)a3;
  p_control = &self->_control;
  if (self->_control != v5)
  {
    v8 = v5;
    id v7 = [(PSControlTableCell *)self contentView];
    [v7 addSubview:v8];

    if (*p_control) {
      [(UIControl *)*p_control removeFromSuperview];
    }
    objc_storeStrong((id *)p_control, a3);
    v5 = v8;
  }
}

- (id)controlValue
{
  return 0;
}

- (void)controlChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSTableCell *)self cellTarget];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    id v7 = [(PSTableCell *)self specifier];

    if (v7)
    {
      [(PSTableCell *)self cellAction];
      v8 = [(PSTableCell *)self cellTarget];
      objc_super v9 = [(PSControlTableCell *)self controlValue];
      v10 = [(PSTableCell *)self specifier];
      id v11 = (id)SFPerformSelector2();
    }
  }
  v12 = [(PSTableCell *)self cellTarget];

  if (v12)
  {
    v13 = [(PSTableCell *)self cellTarget];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = (objc_class *)objc_opt_class();

  v17 = NSStringFromClass(v16);
  [MEMORY[0x1E4F9AA08] trackingControlValueChanged:v18 sender:v17];
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PSControlTableCell;
  -[PSTableCell setCellEnabled:](&v6, sel_setCellEnabled_);
  uint64_t v5 = [(PSControlTableCell *)self control];
  [v5 setEnabled:v3];
}

- (void).cxx_destruct
{
}

@end