@interface PSDeleteButtonCell
- (PSDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation PSDeleteButtonCell

- (PSDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSDeleteButtonCell;
  v8 = [(PSTableCell *)&v12 initWithStyle:0 reuseIdentifier:a4 specifier:v7];
  if (v8)
  {
    v9 = [v7 propertyForKey:@"buttonColor"];
    v10 = v9;
    if (!v9)
    {
      v10 = [MEMORY[0x1E4F428B8] systemRedColor];
    }
    objc_storeStrong((id *)&v8->_buttonColor, v10);
    if (!v9) {
  }
    }
  return v8;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PSDeleteButtonCell;
  [(PSTableCell *)&v16 layoutSubviews];
  v3 = [(PSDeleteButtonCell *)self textLabel];
  [v3 setTextAlignment:1];

  v4 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v5 = [v4 userInterfaceLayoutDirection];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  id v7 = [WeakRetained propertyForKey:@"alignment"];

  if (v7)
  {
    int v8 = [v7 intValue];
    if (v8 == 3)
    {
      BOOL v9 = v5 == 0;
      goto LABEL_6;
    }
    if (v8 == 1)
    {
      BOOL v9 = v5 != 0;
LABEL_6:
      uint64_t v10 = 2 * v9;
      v11 = [(PSDeleteButtonCell *)self textLabel];
      [v11 setTextAlignment:v10];
    }
  }
  buttonColor = self->_buttonColor;
  v13 = [(PSTableCell *)self titleLabel];
  [v13 setTextColor:buttonColor];

  v14 = self->_buttonColor;
  v15 = [(PSTableCell *)self titleLabel];
  [v15 setHighlightedTextColor:v14];
}

- (void).cxx_destruct
{
}

@end