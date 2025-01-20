@interface SUUIReportAConcernDetailsCell
- (NSString)placeholderText;
- (NSString)text;
- (SUUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (void)layoutSubviews;
- (void)setPlaceholderText:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updatePlaceholderText:(BOOL)a3;
@end

@implementation SUUIReportAConcernDetailsCell

- (SUUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIReportAConcernDetailsCell;
  v4 = [(SUUIReportAConcernDetailsCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F82D60]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = v4->_textView;
    v4->_textView = (UITextView *)v6;

    v8 = [(SUUIReportAConcernDetailsCell *)v4 textLabel];
    v9 = [v8 font];
    [(UITextView *)v4->_textView setFont:v9];

    v10 = [(SUUIReportAConcernDetailsCell *)v4 contentView];
    [v10 addSubview:v4->_textView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SUUIReportAConcernDetailsCell;
  [(SUUIReportAConcernDetailsCell *)&v38 layoutSubviews];
  v3 = [(SUUIReportAConcernDetailsCell *)self contentView];
  v4 = [v3 readableContentGuide];
  [v4 layoutFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(SUUIReportAConcernDetailsCell *)self textView];
  v14 = [v13 textContainer];
  [v14 lineFragmentPadding];
  double v37 = v15;

  v16 = [(SUUIReportAConcernDetailsCell *)self contentView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  CGFloat rect_8 = v21;
  double v24 = v23;

  v25 = [(SUUIReportAConcernDetailsCell *)self textView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  CGFloat v34 = v6;
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v10;
  v39.size.height = v12;
  double MinY = CGRectGetMinY(v39);
  v40.origin.x = v18;
  v40.origin.y = v20;
  v40.size.width = rect_8;
  v40.size.height = v24;
  double v36 = MinY - CGRectGetMinY(v40);
  v41.origin.x = v6;
  v41.origin.y = v8;
  v41.size.width = v10;
  v41.size.height = v12;
  double MinX = CGRectGetMinX(v41);
  v42.origin.x = v18;
  v42.origin.y = v20;
  v42.size.width = rect_8;
  v42.size.height = v24;
  double v35 = MinX - CGRectGetMinX(v42) - v37;
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = rect_8;
  v43.size.height = v24;
  double MaxY = CGRectGetMaxY(v43);
  v44.origin.x = v34;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  double v29 = MaxY - CGRectGetMaxY(v44);
  v45.origin.x = v18;
  v45.origin.y = v20;
  v45.size.width = rect_8;
  v45.size.height = v24;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v34;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  double v31 = MaxX - CGRectGetMaxX(v46) - v37;
  v32 = [(SUUIReportAConcernDetailsCell *)self textView];
  objc_msgSend(v32, "setTextContainerInset:", v36, v35, v29, v31);
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
  if (a3)
  {
    double v5 = [(SUUIReportAConcernDetailsCell *)self textView];
    [v5 setDelegate:self];

    [(SUUIReportAConcernDetailsCell *)self updatePlaceholderText:0];
  }
}

- (NSString)text
{
  v3 = [(SUUIReportAConcernDetailsCell *)self textView];
  v4 = [v3 text];
  double v5 = [(SUUIReportAConcernDetailsCell *)self placeholderText];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    CGFloat v8 = [(SUUIReportAConcernDetailsCell *)self textView];
    double v7 = [v8 text];
  }
  return (NSString *)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
}

- (void)updatePlaceholderText:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SUUIReportAConcernDetailsCell *)self textView];
  char v6 = [v5 text];
  double v7 = v6;
  if (v3)
  {
    CGFloat v8 = [(SUUIReportAConcernDetailsCell *)self placeholderText];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      return;
    }
    CGFloat v10 = [(SUUIReportAConcernDetailsCell *)self textView];
    [v10 setText:&stru_2704F8130];

    id v16 = [(SUUIReportAConcernDetailsCell *)self textLabel];
    double v11 = [v16 textColor];
    CGFloat v12 = [(SUUIReportAConcernDetailsCell *)self textView];
    [v12 setTextColor:v11];
  }
  else
  {
    uint64_t v13 = [v6 length];

    if (v13) {
      return;
    }
    v14 = [(SUUIReportAConcernDetailsCell *)self placeholderText];
    double v15 = [(SUUIReportAConcernDetailsCell *)self textView];
    [v15 setText:v14];

    id v16 = [MEMORY[0x263F825C8] lightGrayColor];
    double v11 = [(SUUIReportAConcernDetailsCell *)self textView];
    [v11 setTextColor:v16];
  }
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

@end