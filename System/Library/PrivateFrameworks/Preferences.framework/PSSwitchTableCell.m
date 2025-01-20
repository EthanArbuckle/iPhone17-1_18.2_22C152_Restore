@interface PSSwitchTableCell
- (BOOL)canReload;
- (BOOL)loading;
- (BOOL)shouldUseModernLayout;
- (PSSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)controlValue;
- (id)newControl;
- (int64_t)spinnerStyle;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setCellEnabled:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setValue:(id)a3;
@end

@implementation PSSwitchTableCell

- (PSSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PSSwitchTableCell;
  v5 = [(PSControlTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSControlTableCell *)v5 control];
    [(PSSwitchTableCell *)v6 setAccessoryView:v7];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSSwitchTableCell;
  id v4 = a3;
  [(PSControlTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"control-loading", v6.receiver, v6.super_class);

  if (v5) {
    -[PSSwitchTableCell setLoading:](self, "setLoading:", [v5 BOOLValue]);
  }
}

- (void)prepareForReuse
{
  [(PSSwitchTableCell *)self setLoading:0];
  v3.receiver = self;
  v3.super_class = (Class)PSSwitchTableCell;
  [(PSTableCell *)&v3 prepareForReuse];
}

- (id)newControl
{
  id v2 = objc_alloc(MEMORY[0x1E4F42E78]);
  return (id)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 51.0, 31.0);
}

- (BOOL)canReload
{
  int v3 = [(PSSwitchTableCell *)self isMemberOfClass:objc_opt_class()];
  if (v3) {
    LOBYTE(v3) = [(PSSwitchTableCell *)self tag] == 6;
  }
  return v3;
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSSwitchTableCell;
  -[PSControlTableCell setCellEnabled:](&v5, sel_setCellEnabled_);
  [(UIControl *)self->super._control setEnabled:v3];
}

- (BOOL)loading
{
  return self->_activityIndicator != 0;
}

- (int64_t)spinnerStyle
{
  return 100;
}

- (void)setLoading:(BOOL)a3
{
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    if (!activityIndicator)
    {
      objc_super v5 = [(PSSwitchTableCell *)self contentView];
      [v5 bounds];
      double v7 = v6;
      double v9 = v8;

      objc_msgSend(MEMORY[0x1E4F42708], "defaultSizeForStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      double v11 = v10;
      double v13 = v12;
      double v14 = [(PSSwitchTableCell *)self _shouldReverseLayoutDirection]
          ? 9.0
          : v7 + -9.0 - v11;
      float v15 = (v9 - v13) * 0.5;
      double v16 = ceilf(v15);
      v17 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42708]), "initWithActivityIndicatorStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
      v18 = self->_activityIndicator;
      self->_activityIndicator = v17;

      -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v14, v16, v11, v13);
      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
      v19 = [(PSSwitchTableCell *)self contentView];
      [v19 addSubview:self->_activityIndicator];

      if (self->super._control)
      {
        if ([(PSSwitchTableCell *)self tag] == 6)
        {
          [(PSSwitchTableCell *)self setAccessoryView:0];
          control = self->super._control;
          uint64_t v21 = 1;
LABEL_13:
          [(UIControl *)control setHidden:v21];
          return;
        }
        v23 = self->super._control;
        [(UIControl *)v23 removeFromSuperview];
      }
    }
  }
  else
  {
    if (!activityIndicator) {
      return;
    }
    [(UIActivityIndicatorView *)activityIndicator removeFromSuperview];
    v22 = self->_activityIndicator;
    self->_activityIndicator = 0;

    if (!self->super._control) {
      return;
    }
    if ([(PSSwitchTableCell *)self tag] == 6)
    {
      [(PSSwitchTableCell *)self setAccessoryView:self->super._control];
      control = self->super._control;
      uint64_t v21 = 0;
      goto LABEL_13;
    }
    id v24 = [(PSSwitchTableCell *)self contentView];
    [v24 addSubview:self->super._control];
  }
}

- (id)controlValue
{
  id v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [(UIControl *)self->super._control isOn];
  return (id)[v2 numberWithBool:v3];
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)PSSwitchTableCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v7, sel_reloadWithSpecifier_animated_, a3);
  int v6 = [self->super.super._value BOOLValue];
  if (v6 != [(UIControl *)self->super._control isOn]) {
    -[UIControl setOn:animated:](self->super._control, "setOn:animated:", [self->super.super._value BOOLValue], v4);
  }
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (self->super.super._value != v5)
  {
    objc_storeStrong(&self->super.super._value, a3);
    -[UIControl setOn:](self->super._control, "setOn:", [v5 intValue] != 0);
  }
}

- (BOOL)shouldUseModernLayout
{
  int v3 = [(PSSwitchTableCell *)self isMemberOfClass:objc_opt_class()];
  if (v3) {
    LOBYTE(v3) = self->_activityIndicator == 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PSSwitchTableCell;
  [(PSTableCell *)&v15 layoutSubviews];
  if (self->_activityIndicator)
  {
    int v3 = [(PSSwitchTableCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    objc_msgSend(MEMORY[0x1E4F42708], "defaultSizeForStyle:", -[PSSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    double v9 = v8;
    double v11 = v10;
    int v12 = [(PSSwitchTableCell *)self _shouldReverseLayoutDirection];
    double v13 = v5 + -9.0 - v9;
    if (v12) {
      double v13 = 9.0;
    }
    float v14 = (v7 - v11) * 0.5;
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v13, ceilf(v14), v9, v11);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = [(PSSwitchTableCell *)self backgroundColor];
  double v5 = [(PSSwitchTableCell *)self selectedBackgroundView];
  [v5 setBackgroundColor:v6];
}

- (void).cxx_destruct
{
}

@end