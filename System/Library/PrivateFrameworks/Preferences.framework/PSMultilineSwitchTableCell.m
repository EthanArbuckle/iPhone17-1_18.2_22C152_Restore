@interface PSMultilineSwitchTableCell
- (BOOL)canReload;
- (BOOL)loading;
- (PSMultilineSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIActivityIndicatorView)activityIndicator;
- (UIControl)control;
- (id)controlValue;
- (id)newControl;
- (id)valueLabel;
- (int64_t)spinnerStyle;
- (void)controlChanged:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setControl:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setValue:(id)a3;
@end

@implementation PSMultilineSwitchTableCell

- (PSMultilineSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PSMultilineSwitchTableCell;
  v5 = [(PSTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PSMultilineSwitchTableCell *)v5 setSelectionStyle:0];
    [(PSMultilineSwitchTableCell *)v6 setAccessoryType:0];
    id v7 = [(PSMultilineSwitchTableCell *)v6 newControl];
    [(PSMultilineSwitchTableCell *)v6 setControl:v7];
    [v7 addTarget:v6 action:sel_controlChanged_ forControlEvents:4096];
    v8 = [(PSMultilineSwitchTableCell *)v6 control];
    [(PSMultilineSwitchTableCell *)v6 setAccessoryView:v8];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PSMultilineSwitchTableCell;
  id v4 = a3;
  [(PSMultilineTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSMultilineSwitchTableCell *)self control];
  [v4 setProperty:v5 forKey:@"control"];

  v6 = [v4 propertyForKey:@"control-loading"];

  if (v6) {
    -[PSMultilineSwitchTableCell setLoading:](self, "setLoading:", [v6 BOOLValue]);
  }
}

- (BOOL)canReload
{
  return 1;
}

- (id)valueLabel
{
  return 0;
}

- (void)dealloc
{
  [(PSTableCell *)self setCellTarget:0];
  v3 = [(PSMultilineSwitchTableCell *)self control];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(PSMultilineSwitchTableCell *)self control];
    [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  }
  v6.receiver = self;
  v6.super_class = (Class)PSMultilineSwitchTableCell;
  [(PSTableCell *)&v6 dealloc];
}

- (void)setControl:(id)a3
{
  v5 = (UIControl *)a3;
  p_control = &self->_control;
  if (self->_control != v5)
  {
    v8 = v5;
    objc_super v7 = [(PSMultilineSwitchTableCell *)self contentView];
    [v7 addSubview:v8];

    if (*p_control) {
      [(UIControl *)*p_control removeFromSuperview];
    }
    objc_storeStrong((id *)p_control, a3);
    v5 = v8;
  }
}

- (void)controlChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSTableCell *)self cellTarget];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    objc_super v7 = [(PSTableCell *)self specifier];

    if (v7)
    {
      [(PSTableCell *)self cellAction];
      v8 = [(PSTableCell *)self cellTarget];
      v9 = [(PSMultilineSwitchTableCell *)self controlValue];
      objc_super v10 = [(PSTableCell *)self specifier];
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
  v6.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell setCellEnabled:](&v6, sel_setCellEnabled_);
  uint64_t v5 = [(PSMultilineSwitchTableCell *)self control];
  [v5 setEnabled:v3];
}

- (void)prepareForReuse
{
  [(PSMultilineSwitchTableCell *)self setLoading:0];
  v3.receiver = self;
  v3.super_class = (Class)PSMultilineSwitchTableCell;
  [(PSTableCell *)&v3 prepareForReuse];
}

- (id)newControl
{
  id v2 = objc_alloc(MEMORY[0x1E4F42E78]);
  return (id)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 51.0, 31.0);
}

- (BOOL)loading
{
  id v2 = [(PSMultilineSwitchTableCell *)self activityIndicator];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)spinnerStyle
{
  return 100;
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PSMultilineSwitchTableCell *)self activityIndicator];

  if (!v3)
  {
    if (!v5) {
      return;
    }
    v26 = [(PSMultilineSwitchTableCell *)self activityIndicator];
    [v26 removeFromSuperview];

    [(PSMultilineSwitchTableCell *)self setActivityIndicator:0];
    v27 = [(PSMultilineSwitchTableCell *)self control];

    if (!v27) {
      return;
    }
    if ([(PSMultilineSwitchTableCell *)self tag] != 6)
    {
      id v30 = [(PSMultilineSwitchTableCell *)self contentView];
      v29 = [(PSMultilineSwitchTableCell *)self control];
      [v30 addSubview:v29];

      goto LABEL_17;
    }
    v28 = [(PSMultilineSwitchTableCell *)self control];
    [(PSMultilineSwitchTableCell *)self setAccessoryView:v28];

    v24 = [(PSMultilineSwitchTableCell *)self control];
    id v30 = v24;
    uint64_t v25 = 0;
LABEL_13:
    [v24 setHidden:v25];
LABEL_17:

    return;
  }
  if (!v5)
  {
    objc_super v6 = [(PSMultilineSwitchTableCell *)self contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    objc_msgSend(MEMORY[0x1E4F42708], "defaultSizeForStyle:", -[PSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    double v12 = v11;
    double v14 = v13;
    double v15 = [(PSMultilineSwitchTableCell *)self _shouldReverseLayoutDirection]? 9.0: v8 + -9.0 - v12;
    float v16 = (v10 - v14) * 0.5;
    double v17 = ceilf(v16);
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42708]), "initWithActivityIndicatorStyle:", -[PSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    [(PSMultilineSwitchTableCell *)self setActivityIndicator:v18];

    v19 = [(PSMultilineSwitchTableCell *)self activityIndicator];
    objc_msgSend(v19, "setFrame:", v15, v17, v12, v14);

    v20 = [(PSMultilineSwitchTableCell *)self activityIndicator];
    [v20 startAnimating];

    v21 = [(PSMultilineSwitchTableCell *)self contentView];
    v22 = [(PSMultilineSwitchTableCell *)self activityIndicator];
    [v21 addSubview:v22];

    v23 = [(PSMultilineSwitchTableCell *)self control];

    if (v23)
    {
      if ([(PSMultilineSwitchTableCell *)self tag] != 6)
      {
        id v30 = [(PSMultilineSwitchTableCell *)self control];
        [v30 removeFromSuperview];
        goto LABEL_17;
      }
      [(PSMultilineSwitchTableCell *)self setAccessoryView:0];
      v24 = [(PSMultilineSwitchTableCell *)self control];
      id v30 = v24;
      uint64_t v25 = 1;
      goto LABEL_13;
    }
  }
}

- (id)controlValue
{
  id v2 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v3 = [(PSMultilineSwitchTableCell *)self control];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isOn"));

  return v4;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PSMultilineSwitchTableCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v10, sel_reloadWithSpecifier_animated_, a3);
  int v6 = [self->super.super._value BOOLValue];
  double v7 = [(PSMultilineSwitchTableCell *)self control];
  int v8 = [v7 isOn];

  if (v6 != v8)
  {
    double v9 = [(PSMultilineSwitchTableCell *)self control];
    objc_msgSend(v9, "setOn:animated:", objc_msgSend(self->super.super._value, "BOOLValue"), v4);
  }
}

- (void)setValue:(id)a3
{
  id v6 = a3;
  if (self->super.super._value != v6)
  {
    objc_storeStrong(&self->super.super._value, a3);
    uint64_t v5 = [(PSMultilineSwitchTableCell *)self control];
    objc_msgSend(v5, "setOn:", objc_msgSend(v6, "intValue") != 0);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = [(PSMultilineSwitchTableCell *)self backgroundColor];
  uint64_t v5 = [(PSMultilineSwitchTableCell *)self selectedBackgroundView];
  [v5 setBackgroundColor:v6];
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIControl)control
{
  return self->_control;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end