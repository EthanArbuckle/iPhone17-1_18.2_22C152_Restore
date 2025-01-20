@interface PSTextEditingPane
- (BOOL)becomeFirstResponder;
- (PSTextEditingPane)initWithFrame:(CGRect)a3;
- (id)preferenceValue;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setPreferenceSpecifier:(id)a3;
- (void)setPreferenceValue:(id)a3;
@end

@implementation PSTextEditingPane

- (PSTextEditingPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PSTextEditingPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    *((unsigned char *)&v7->super + 424) |= 1u;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 1, x, y, width, height);
    table = v8->_table;
    v8->_table = (UITableView *)v9;

    [(UITableView *)v8->_table setDataSource:v8];
    [(UITableView *)v8->_table setScrollEnabled:0];
    [(UITableView *)v8->_table setAllowsSelection:0];
    [(UITableView *)v8->_table reloadData];
    [(PSTextEditingPane *)v8 addSubview:v8->_table];
    v11 = [[PSTextEditingCell alloc] initWithStyle:1000 reuseIdentifier:&stru_1EFB51FD0];
    cell = v8->_cell;
    v8->_cell = v11;

    [(PSTextEditingCell *)v8->_cell setOpaque:0];
    uint64_t v13 = [(PSTextEditingCell *)v8->_cell editableTextField];
    textField = v8->_textField;
    v8->_textField = (UITextField *)v13;
  }
  return v8;
}

- (void)dealloc
{
  [(UITableView *)self->_table setDataSource:0];
  v3.receiver = self;
  v3.super_class = (Class)PSTextEditingPane;
  [(PSTextEditingPane *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(PSTextEditingPane *)self frame];
  -[UITableView setFrame:](self->_table, "setFrame:");
  [(UITableView *)self->_table frame];
  double v4 = v3;
  [(UITableView *)self->_table rectForSection:0];
  double v6 = v4 - v5;
  [MEMORY[0x1E4F42B08] defaultSize];
  table = self->_table;
  double v9 = floor((v6 - v7) * 0.5);
  -[UITableView setContentInset:](table, "setContentInset:", v9, 0.0, 0.0, 0.0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_cell;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return [(UITextField *)self->_textField becomeFirstResponder];
}

- (void)setPreferenceValue:(id)a3
{
}

- (id)preferenceValue
{
  return [(UITextField *)self->_textField text];
}

- (void)setPreferenceSpecifier:(id)a3
{
  double v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSTextEditingPane;
  [(PSEditingPane *)&v10 setPreferenceSpecifier:v4];
  [(UITextField *)self->_textField setClearButtonStyle:2];
  -[UITextField setClearButtonOffset:](self->_textField, "setClearButtonOffset:", 0.0, -1.0);
  textField = self->_textField;
  if (v4[12])
  {
    [(UITextField *)textField setAutocorrectionType:1];
    [(UITextField *)self->_textField setAutocapitalizationType:0];
    switch(v4[12])
    {
      case 1:
        double v6 = self->_textField;
        uint64_t v7 = 3;
        goto LABEL_14;
      case 2:
        double v6 = self->_textField;
        uint64_t v7 = 11;
        goto LABEL_14;
      case 3:
        double v6 = self->_textField;
        uint64_t v7 = 2;
        goto LABEL_14;
      case 4:
      case 5:
        double v6 = self->_textField;
        uint64_t v7 = 7;
        goto LABEL_14;
      case 6:
        double v6 = self->_textField;
        uint64_t v7 = 8;
LABEL_14:
        [(UITextField *)v6 setKeyboardType:v7];
        break;
      default:
        break;
    }
  }
  else
  {
    if ([(UITextField *)textField autocapitalizationType] != v4[10]) {
      -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:");
    }
    if ([(UITextField *)self->_textField keyboardType] != v4[9]) {
      -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:");
    }
    if ([(UITextField *)self->_textField autocorrectionType] != v4[11]) {
      -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:");
    }
  }
  v8 = [v4 propertyForKey:@"noAutoCorrect"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    [(UITextField *)self->_textField setAutocorrectionType:1];
    [(UITextField *)self->_textField setAutocapitalizationType:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end