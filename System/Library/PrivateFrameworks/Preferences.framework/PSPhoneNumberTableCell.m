@interface PSPhoneNumberTableCell
- (void)layoutSubviews;
@end

@implementation PSPhoneNumberTableCell

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PSPhoneNumberTableCell;
  [(PSEditableTableCell *)&v24 layoutSubviews];
  v3 = [(PSPhoneNumberTableCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(PSEditableTableCell *)self textField];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v20 = [v19 userInterfaceLayoutDirection];

  v21 = [(PSEditableTableCell *)self textField];
  if (v20)
  {
    [v21 setTextAlignment:0];

    double v22 = 35.0;
  }
  else
  {
    [v21 setTextAlignment:2];

    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    double v22 = CGRectGetMaxX(v25) + -35.0 - v16;
  }
  v23 = [(PSEditableTableCell *)self textField];
  objc_msgSend(v23, "setFrame:", v22, v14, v16, v18);
}

@end