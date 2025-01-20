@interface ICSMultilineSwitchTableCell
- (BOOL)canReload;
- (BOOL)loading;
- (ICSMultilineSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
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

@implementation ICSMultilineSwitchTableCell

- (ICSMultilineSwitchTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ICSMultilineSwitchTableCell;
  v5 = [(ICSDataclassWithSubtitleTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(ICSMultilineSwitchTableCell *)v5 setSelectionStyle:0];
    [(ICSMultilineSwitchTableCell *)v6 setAccessoryType:0];
    id v7 = [(ICSMultilineSwitchTableCell *)v6 newControl];
    [(ICSMultilineSwitchTableCell *)v6 setControl:v7];
    [v7 addTarget:v6 action:sel_controlChanged_ forControlEvents:4096];
    v8 = [(ICSMultilineSwitchTableCell *)v6 control];
    [(ICSMultilineSwitchTableCell *)v6 setAccessoryView:v8];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ICSMultilineSwitchTableCell;
  [(PSTableCell *)&v27 refreshCellContentsWithSpecifier:v4];
  v5 = [(ICSMultilineSwitchTableCell *)self control];
  [v4 setProperty:v5 forKey:*MEMORY[0x263F60028]];

  v6 = [v4 propertyForKey:*MEMORY[0x263F60020]];
  id v7 = v6;
  if (v6) {
    -[ICSMultilineSwitchTableCell setLoading:](self, "setLoading:", [v6 BOOLValue]);
  }
  v8 = [v4 name];
  v9 = [(ICSDataclassWithSubtitleTableViewCell *)self primaryLabel];
  [v9 setText:v8];

  objc_super v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
  v11 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  [v11 setText:v10];

  v12 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  uint64_t v13 = [v12 text];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
    v16 = [v15 text];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      v18 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
      v19 = v18;
      uint64_t v20 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v18 = [(ICSDataclassWithSubtitleTableViewCell *)self secondaryLabel];
  v19 = v18;
  uint64_t v20 = 1;
LABEL_8:
  [v18 setHidden:v20];

  if ([v4 hasValidGetter])
  {
    v21 = [v4 performGetter];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
      [v22 setHidden:0];

      v23 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
      [v23 setText:v21];

      [(ICSMultilineSwitchTableCell *)self setAccessoryView:0];
      v24 = [(ICSMultilineSwitchTableCell *)self control];
      v25 = v24;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v24 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
      v25 = v24;
      if ((isKindOfClass & 1) == 0)
      {
        [v24 setText:&stru_270DEF3F8];
        goto LABEL_15;
      }
    }
    [v24 setHidden:1];
LABEL_15:

    goto LABEL_16;
  }
  v21 = [(ICSDataclassWithSubtitleTableViewCell *)self tertiaryLabel];
  [v21 setText:&stru_270DEF3F8];
LABEL_16:

  [(ICSMultilineSwitchTableCell *)self setNeedsLayout];
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
  v3 = [(ICSMultilineSwitchTableCell *)self control];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(ICSMultilineSwitchTableCell *)self control];
    [v5 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICSMultilineSwitchTableCell;
  [(PSTableCell *)&v6 dealloc];
}

- (void)setControl:(id)a3
{
  v5 = (UIControl *)a3;
  p_control = &self->_control;
  if (self->_control != v5)
  {
    v8 = v5;
    id v7 = [(ICSMultilineSwitchTableCell *)self contentView];
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
  uint64_t v4 = [(PSTableCell *)self cellTarget];
  if (v4)
  {
    v5 = (void *)v4;
    objc_super v6 = [(PSTableCell *)self specifier];

    if (v6)
    {
      [(PSTableCell *)self cellAction];
      id v10 = [(PSTableCell *)self cellTarget];
      id v7 = [(ICSMultilineSwitchTableCell *)self controlValue];
      v8 = [(PSTableCell *)self specifier];
      id v9 = (id)SFPerformSelector2();
    }
  }
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICSMultilineSwitchTableCell;
  -[PSTableCell setCellEnabled:](&v6, sel_setCellEnabled_);
  v5 = [(ICSMultilineSwitchTableCell *)self control];
  [v5 setEnabled:v3];
}

- (void)prepareForReuse
{
  [(ICSMultilineSwitchTableCell *)self setLoading:0];
  v3.receiver = self;
  v3.super_class = (Class)ICSMultilineSwitchTableCell;
  [(PSTableCell *)&v3 prepareForReuse];
}

- (id)newControl
{
  id v2 = objc_alloc(MEMORY[0x263F82C40]);

  return (id)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 51.0, 31.0);
}

- (BOOL)loading
{
  id v2 = [(ICSMultilineSwitchTableCell *)self activityIndicator];
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
  v5 = [(ICSMultilineSwitchTableCell *)self activityIndicator];

  if (!v3)
  {
    if (!v5) {
      return;
    }
    v26 = [(ICSMultilineSwitchTableCell *)self activityIndicator];
    [v26 removeFromSuperview];

    [(ICSMultilineSwitchTableCell *)self setActivityIndicator:0];
    objc_super v27 = [(ICSMultilineSwitchTableCell *)self control];

    if (!v27) {
      return;
    }
    if ([(ICSMultilineSwitchTableCell *)self tag] != 6)
    {
      id v30 = [(ICSMultilineSwitchTableCell *)self contentView];
      v29 = [(ICSMultilineSwitchTableCell *)self control];
      [v30 addSubview:v29];

      goto LABEL_17;
    }
    v28 = [(ICSMultilineSwitchTableCell *)self control];
    [(ICSMultilineSwitchTableCell *)self setAccessoryView:v28];

    v24 = [(ICSMultilineSwitchTableCell *)self control];
    id v30 = v24;
    uint64_t v25 = 0;
LABEL_13:
    [v24 setHidden:v25];
LABEL_17:

    return;
  }
  if (!v5)
  {
    objc_super v6 = [(ICSMultilineSwitchTableCell *)self contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    objc_msgSend(MEMORY[0x263F823E8], "defaultSizeForStyle:", -[ICSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    double v12 = v11;
    double v14 = v13;
    double v15 = [(ICSMultilineSwitchTableCell *)self _shouldReverseLayoutDirection]? 9.0: v8 + -9.0 - v12;
    float v16 = (v10 - v14) * 0.5;
    double v17 = ceilf(v16);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263F823E8]), "initWithActivityIndicatorStyle:", -[ICSMultilineSwitchTableCell spinnerStyle](self, "spinnerStyle"));
    [(ICSMultilineSwitchTableCell *)self setActivityIndicator:v18];

    v19 = [(ICSMultilineSwitchTableCell *)self activityIndicator];
    objc_msgSend(v19, "setFrame:", v15, v17, v12, v14);

    uint64_t v20 = [(ICSMultilineSwitchTableCell *)self activityIndicator];
    [v20 startAnimating];

    v21 = [(ICSMultilineSwitchTableCell *)self contentView];
    v22 = [(ICSMultilineSwitchTableCell *)self activityIndicator];
    [v21 addSubview:v22];

    v23 = [(ICSMultilineSwitchTableCell *)self control];

    if (v23)
    {
      if ([(ICSMultilineSwitchTableCell *)self tag] != 6)
      {
        id v30 = [(ICSMultilineSwitchTableCell *)self control];
        [v30 removeFromSuperview];
        goto LABEL_17;
      }
      [(ICSMultilineSwitchTableCell *)self setAccessoryView:0];
      v24 = [(ICSMultilineSwitchTableCell *)self control];
      id v30 = v24;
      uint64_t v25 = 1;
      goto LABEL_13;
    }
  }
}

- (id)controlValue
{
  id v2 = NSNumber;
  BOOL v3 = [(ICSMultilineSwitchTableCell *)self control];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isOn"));

  return v4;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICSMultilineSwitchTableCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v11, sel_reloadWithSpecifier_animated_, a3);
  uint64_t v6 = (int)*MEMORY[0x263F5FE68];
  int v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v6) BOOLValue];
  double v8 = [(ICSMultilineSwitchTableCell *)self control];
  int v9 = [v8 isOn];

  if (v7 != v9)
  {
    double v10 = [(ICSMultilineSwitchTableCell *)self control];
    objc_msgSend(v10, "setOn:animated:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "BOOLValue"), v4);
  }
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE68]);
  id v8 = v5;
  if (*v6 != v5)
  {
    objc_storeStrong(v6, a3);
    int v7 = [(ICSMultilineSwitchTableCell *)self control];
    objc_msgSend(v7, "setOn:", objc_msgSend(v8, "intValue") != 0);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  id v6 = [(ICSMultilineSwitchTableCell *)self backgroundColor];
  id v5 = [(ICSMultilineSwitchTableCell *)self selectedBackgroundView];
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