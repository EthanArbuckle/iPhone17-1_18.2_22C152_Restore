@interface PKSwitchSpinnerTableCell
- (BOOL)canReload;
- (PKSwitchSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_switchToggled:(id)a3;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSwitchIsOn:(BOOL)a3;
@end

@implementation PKSwitchSpinnerTableCell

- (PKSwitchSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKSwitchSpinnerTableCell;
  v9 = [(PKSwitchSpinnerTableCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v9)
  {
    v10 = [v8 target];
    objc_storeWeak((id *)&v9->_delegate, v10);

    v11 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    v12 = v9->_switch;
    v9->_switch = v11;

    [(UISwitch *)v9->_switch addTarget:v9 action:sel__switchToggled_ forEvents:4096];
    v13 = [v8 objectForKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];
    -[PKSwitchSpinnerTableCell setSwitchIsOn:](v9, "setSwitchIsOn:", [v13 BOOLValue]);

    v14 = v9->_switch;
    v15 = [v8 objectForKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsDisabled"];
    -[UISwitch setEnabled:](v14, "setEnabled:", [v15 BOOLValue] ^ 1);

    [(UISwitch *)v9->_switch sizeToFit];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v16;

    [(UIActivityIndicatorView *)v9->_spinner sizeToFit];
    v18 = [(PSTableCell *)v9 titleLabel];
    [v18 setLineBreakMode:4];

    [(PKSwitchSpinnerTableCell *)v9 _updateSubviews];
    [(PKSwitchSpinnerTableCell *)v9 setSelectionStyle:0];
  }

  return v9;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSwitchSpinnerTableCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", @"PKSwitchSpinnerTableCellSwitchIsOn", v7.receiver, v7.super_class);
  -[PKSwitchSpinnerTableCell setSwitchIsOn:](self, "setSwitchIsOn:", [v5 BOOLValue]);

  v6 = [v4 objectForKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];

  -[PKSwitchSpinnerTableCell setShowSpinner:](self, "setShowSpinner:", [v6 BOOLValue]);
}

- (void)setSwitchIsOn:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)PKSwitchSpinnerTableCell;
  [(PSTableCell *)&v34 layoutSubviews];
  double v3 = PKTableViewCellTextInset();
  id v4 = [(PKSwitchSpinnerTableCell *)self contentView];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  int v13 = [(PKSwitchSpinnerTableCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v31, 0, sizeof(v31));
  if (v13) {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  CGRectDivide(v35, &slice, &remainder, v3, v14);
  if (self->_showSpinner) {
    uint64_t v15 = 1192;
  }
  else {
    uint64_t v15 = 1200;
  }
  uint64_t v16 = (id *)((char *)&self->super.super.super.super.super.isa + v15);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v15), "frame", *(_OWORD *)&v31.origin);
  CGRectDivide(remainder, &slice, &remainder, v17, v14);
  UIRectCenteredIntegralRect();
  slice.origin.x = v18;
  slice.origin.y = v19;
  slice.size.width = v20;
  slice.size.height = v21;
  objc_msgSend(*v16, "setFrame:");
  if (v13) {
    CGRectEdge v22 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v22 = CGRectMinXEdge;
  }
  v23 = [(PSTableCell *)self titleLabel];
  CGRectDivide(remainder, &slice, &v31, v3, v22);
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  objc_msgSend(v23, "sizeThatFits:", v31.size.width, v28);
  objc_msgSend(v23, "setFrame:", v25, v27, v30, v29);
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    [(PKSwitchSpinnerTableCell *)self _updateSubviews];
  }
}

- (void)_updateSubviews
{
  if (self->_showSpinner)
  {
    [(UISwitch *)self->_switch removeFromSuperview];
    double v3 = [(PKSwitchSpinnerTableCell *)self contentView];
    [v3 addSubview:self->_spinner];

    [(UIActivityIndicatorView *)self->_spinner startAnimating];
  }
  else
  {
    [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
    id v4 = [(PKSwitchSpinnerTableCell *)self contentView];
    [v4 addSubview:self->_switch];
  }

  [(PKSwitchSpinnerTableCell *)self setNeedsLayout];
}

- (void)_switchToggled:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = [v5 isOn];

  [WeakRetained switchSpinnerCell:self hasToggledSwitch:v6];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end