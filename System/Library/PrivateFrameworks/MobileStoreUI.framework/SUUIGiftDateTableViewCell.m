@interface SUUIGiftDateTableViewCell
- (BOOL)isChecked;
- (BOOL)leftToRight;
- (NSDate)date;
- (NSString)label;
- (NSString)placeholder;
- (SUUIGiftConfiguration)giftConfiguration;
- (SUUIGiftDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SUUIGiftDateTableViewCellDelegate)delegate;
- (id)_labelColor;
- (id)_labelForDate:(id)a3;
- (id)_newLabel;
- (void)_datePickerDateDidChange;
- (void)_datePickerEditingDidBegin;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGiftConfiguration:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLeftToRight:(BOOL)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation SUUIGiftDateTableViewCell

- (SUUIGiftDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIGiftDateTableViewCell;
  v4 = [(SUUIGiftDateTableViewCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomBorderView = v4->_bottomBorderView;
    v4->_bottomBorderView = v5;

    v7 = v4->_bottomBorderView;
    v8 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v7 setBackgroundColor:v8];

    v9 = [(SUUIGiftDateTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_bottomBorderView];

    v10 = (UIDatePicker *)objc_alloc_init(MEMORY[0x263F82650]);
    datePicker = v4->_datePicker;
    v4->_datePicker = v10;

    [(UIDatePicker *)v4->_datePicker setDatePickerMode:1];
    [(UIDatePicker *)v4->_datePicker setPreferredDatePickerStyle:2];
    v12 = v4->_datePicker;
    v13 = [MEMORY[0x263F825C8] systemBlueColor];
    [(UIDatePicker *)v12 setTintColor:v13];

    uint64_t v14 = *MEMORY[0x263F83470];
    [(UIDatePicker *)v4->_datePicker setMaximumContentSizeCategory:*MEMORY[0x263F83470]];
    [(UIDatePicker *)v4->_datePicker setMinimumContentSizeCategory:v14];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel__datePickerDateDidChange forControlEvents:4096];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel__datePickerEditingDidBegin forControlEvents:0x10000];
    v15 = [MEMORY[0x263EFF910] now];
    [(UIDatePicker *)v4->_datePicker setMinimumDate:v15];
    [(UIDatePicker *)v4->_datePicker setDate:v15];
    v16 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topBorderView = v4->_topBorderView;
    v4->_topBorderView = v16;

    v18 = v4->_topBorderView;
    v19 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v18 setBackgroundColor:v19];

    v20 = [(SUUIGiftDateTableViewCell *)v4 contentView];
    [v20 addSubview:v4->_topBorderView];

    v21 = [MEMORY[0x263F82438] sharedApplication];
    v4->_leftToRight = [v21 userInterfaceLayoutDirection] == 0;
  }
  return v4;
}

- (NSDate)date
{
  return [(UIDatePicker *)self->_datePicker date];
}

- (NSString)label
{
  return [(UILabel *)self->_labelLabel text];
}

- (NSString)placeholder
{
  return [(UILabel *)self->_placeholderLabel text];
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked == a3) {
    return;
  }
  self->_checked = a3;
  checkmarkView = self->_checkmarkView;
  if (!a3)
  {
    [(UIImageView *)checkmarkView removeFromSuperview];
    v5 = self->_checkmarkView;
    self->_checkmarkView = 0;
    goto LABEL_6;
  }
  if (!checkmarkView)
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [MEMORY[0x263F827E8] imageNamed:@"GiftCheckmark" inBundle:v5];
    v7 = [(SUUIGiftDateTableViewCell *)self tintColor];
    v8 = [v6 _flatImageWithColor:v7];

    v9 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v8 highlightedImage:0];
    v10 = self->_checkmarkView;
    self->_checkmarkView = v9;

    [(SUUIGiftDateTableViewCell *)self addSubview:self->_checkmarkView];
LABEL_6:
  }
  labelLabel = self->_labelLabel;
  v12 = [(SUUIGiftDateTableViewCell *)self _labelColor];
  [(UILabel *)labelLabel setTextColor:v12];

  [(SUUIGiftDateTableViewCell *)self setNeedsLayout];
}

- (void)setDate:(id)a3
{
  id v10 = a3;
  id v4 = [(SUUIGiftDateTableViewCell *)self date];
  id v5 = v10;
  v6 = v4;
  if (v4 != v10)
  {
    char v7 = [v4 isEqualToDate:v10];
    id v5 = v10;
    if ((v7 & 1) == 0)
    {
      if (v10)
      {
        v8 = [(SUUIGiftDateTableViewCell *)self contentView];
        [v8 addSubview:self->_datePicker];

        [(UIDatePicker *)self->_datePicker setDate:v10];
        [(UIDatePicker *)self->_datePicker sizeToFit];
      }
      else
      {
        [(UIDatePicker *)self->_datePicker removeFromSuperview];
      }
      [(SUUIGiftDateTableViewCell *)self setNeedsLayout];
      id v5 = v10;
    }
  }
  v9 = [(SUUIGiftDateTableViewCell *)self _labelForDate:v5];
  [(SUUIGiftDateTableViewCell *)self setLabel:v9];
}

- (void)setLabel:(id)a3
{
  id v10 = a3;
  id v4 = [(SUUIGiftDateTableViewCell *)self label];
  if (v4 != v10 && ([v4 isEqualToString:v10] & 1) == 0)
  {
    labelLabel = self->_labelLabel;
    if (v10)
    {
      if (!labelLabel)
      {
        v6 = [(SUUIGiftDateTableViewCell *)self _newLabel];
        char v7 = self->_labelLabel;
        self->_labelLabel = v6;

        v8 = [(SUUIGiftDateTableViewCell *)self contentView];
        [v8 addSubview:self->_labelLabel];

        labelLabel = self->_labelLabel;
      }
      -[UILabel setText:](labelLabel, "setText:");
      [(UILabel *)self->_labelLabel sizeToFit];
    }
    else
    {
      [(UILabel *)labelLabel removeFromSuperview];
      v9 = self->_labelLabel;
      self->_labelLabel = 0;
    }
    [(SUUIGiftDateTableViewCell *)self setNeedsLayout];
  }
}

- (void)setPlaceholder:(id)a3
{
  id v16 = a3;
  id v4 = [(SUUIGiftDateTableViewCell *)self label];
  if (v4 != v16 && ([v4 isEqualToString:v16] & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v16)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        char v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        v9 = [MEMORY[0x263F825C8] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        id v10 = self->_placeholderLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_placeholderLabel setNumberOfLines:2];
        v12 = self->_placeholderLabel;
        v13 = [MEMORY[0x263F825C8] placeholderTextColor];
        [(UILabel *)v12 setTextColor:v13];

        uint64_t v14 = [(SUUIGiftDateTableViewCell *)self contentView];
        [v14 addSubview:self->_placeholderLabel];

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setText:](placeholderLabel, "setText:");
      [(UILabel *)self->_placeholderLabel sizeToFit];
    }
    else
    {
      [(UILabel *)placeholderLabel removeFromSuperview];
      v15 = self->_placeholderLabel;
      self->_placeholderLabel = 0;
    }
    [(SUUIGiftDateTableViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v68.receiver = self;
  v68.super_class = (Class)SUUIGiftDateTableViewCell;
  [(SUUIGiftDateTableViewCell *)&v68 layoutSubviews];
  v3 = [(SUUIGiftDateTableViewCell *)self contentView];
  [v3 bounds];
  double v66 = v4;
  double v67 = v5;
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 + -15.0;
  checkmarkView = self->_checkmarkView;
  if (checkmarkView)
  {
    [(UIImageView *)checkmarkView frame];
    double v13 = v12;
    double v15 = v14;
    double v16 = v10 - v12;
    float v17 = (v9 - v14) * 0.5;
    double v18 = floorf(v17);
    -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v10 - v12, v18);
    BOOL v19 = [(SUUIGiftDateTableViewCell *)self leftToRight];
    v20 = self->_checkmarkView;
    if (v19)
    {
      double v21 = v16;
    }
    else
    {
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v16, v18, v13, v15, v66, v67, v7, v9);
      double v18 = v22;
      double v13 = v23;
      double v15 = v24;
    }
    double v10 = v16 + -7.0;
    -[UIImageView setFrame:](v20, "setFrame:", v21, v18, v13, v15, *(void *)&v66, *(void *)&v67);
  }
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    [(UILabel *)labelLabel frame];
    double width = v69.size.width;
    double height = v69.size.height;
    double v28 = 15.0;
    v69.origin.x = 15.0;
    double MaxX = CGRectGetMaxX(v69);
    float v30 = (v9 - height) * 0.5;
    double v31 = floorf(v30);
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", 15.0, v31, width, height);
    BOOL v32 = [(SUUIGiftDateTableViewCell *)self leftToRight];
    v33 = self->_labelLabel;
    if (!v32)
    {
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v31, width, height, v66, v67, v7, v9);
      double v28 = v34;
      double v31 = v35;
      double width = v36;
      double height = v37;
    }
    double v38 = MaxX + 7.0;
    -[UILabel setFrame:](v33, "setFrame:", v28, v31, width, height, *(void *)&v66, *(void *)&v67);
  }
  else
  {
    double v38 = 15.0;
  }
  datePicker = self->_datePicker;
  if (datePicker)
  {
    [(UIDatePicker *)datePicker frame];
    double v41 = v40;
    double v43 = v42;
    double v44 = v10 - v40;
    float v45 = (v9 - v42) * 0.5;
    double v46 = floorf(v45);
    [(UILabel *)self->_placeholderLabel setHidden:1];
    BOOL v47 = [(SUUIGiftDateTableViewCell *)self leftToRight];
    v48 = self->_datePicker;
    if (v47)
    {
      v49 = self->_datePicker;
      double v50 = v44;
      double v51 = v46;
      double v52 = v41;
LABEL_17:
      double v59 = v43;
LABEL_21:
      objc_msgSend(v49, "setFrame:", v50, v51, v52, v59, *(void *)&v66, *(void *)&v67);
      goto LABEL_22;
    }
    double v60 = v44;
    double v61 = v46;
    double v62 = v41;
    goto LABEL_20;
  }
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    [(UILabel *)placeholderLabel frame];
    -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v10 - v38, 1.79769313e308);
    double v55 = v54;
    double v43 = v56;
    *(float *)&double v54 = (v9 - v56) * 0.5;
    double v57 = floorf(*(float *)&v54);
    [(UILabel *)self->_placeholderLabel setHidden:0];
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v38, v57, v55, v43);
    BOOL v58 = [(SUUIGiftDateTableViewCell *)self leftToRight];
    v48 = self->_placeholderLabel;
    if (v58)
    {
      v49 = self->_placeholderLabel;
      double v50 = v38;
      double v51 = v57;
      double v52 = v55;
      goto LABEL_17;
    }
    double v60 = v38;
    double v61 = v57;
    double v62 = v55;
LABEL_20:
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v60, v61, v62, v43, v66, v67, v7, v9, *(void *)&v66, *(void *)&v67);
    v49 = v48;
    goto LABEL_21;
  }
LABEL_22:
  v63 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(void *)&v66, *(void *)&v67);
  [v63 scale];
  double v65 = 1.0 / v64;

  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v7, v65);
  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v9 - v65, v7, v65);
}

- (void)_datePickerDateDidChange
{
  id v5 = [(UIDatePicker *)self->_datePicker date];
  v3 = [(SUUIGiftDateTableViewCell *)self _labelForDate:v5];
  [(SUUIGiftDateTableViewCell *)self setLabel:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained giftDateTableViewCell:self didChangeDate:v5];
}

- (void)_datePickerEditingDidBegin
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SUUIGiftDateTableViewCell__datePickerEditingDidBegin__block_invoke;
  v2[3] = &unk_265400980;
  v2[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v2];
}

void __55__SUUIGiftDateTableViewCell__datePickerEditingDidBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) window];
  [v1 endEditing:1];
}

- (id)_labelColor
{
  if (self->_checked) {
    [(SUUIGiftDateTableViewCell *)self tintColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] labelColor];
  }
  return v2;
}

- (id)_labelForDate:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIGiftDateTableViewCell *)self giftConfiguration];
  double v6 = [v5 clientContext];

  double v7 = [(UIDatePicker *)self->_datePicker calendar];
  LODWORD(v5) = [v7 isDateInToday:v4];

  if (v5)
  {
    if (v6)
    {
      double v8 = @"GIFTING_FIELD_LABEL_TODAY";
LABEL_6:
      uint64_t v9 = [v6 localizedStringForKey:v8 inTable:@"Gifting"];
      goto LABEL_10;
    }
    double v10 = @"GIFTING_FIELD_LABEL_TODAY";
  }
  else
  {
    if (v6)
    {
      double v8 = @"GIFTING_FIELD_LABEL_OTHER_DATE";
      goto LABEL_6;
    }
    double v10 = @"GIFTING_FIELD_LABEL_OTHER_DATE";
  }
  uint64_t v9 = +[SUUIClientContext localizedStringForKey:v10 inBundles:0 inTable:@"Gifting"];
LABEL_10:
  v11 = (void *)v9;

  return v11;
}

- (id)_newLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v4 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v4];

  id v5 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  [v3 setFont:v5];

  double v6 = [(SUUIGiftDateTableViewCell *)self _labelColor];
  [v3 setTextColor:v6];

  return v3;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (SUUIGiftDateTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIGiftDateTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end