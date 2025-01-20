@interface SKUIReportAConcernDetailsCell
- (NSString)placeholderText;
- (NSString)text;
- (SKUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (void)layoutSubviews;
- (void)setPlaceholderText:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)updatePlaceholderText:(BOOL)a3;
@end

@implementation SKUIReportAConcernDetailsCell

- (SKUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIReportAConcernDetailsCell;
  v7 = [(SKUIReportAConcernDetailsCell *)&v15 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v7->_textView;
    v7->_textView = (UITextView *)v9;

    v11 = [(SKUIReportAConcernDetailsCell *)v7 textLabel];
    v12 = [v11 font];
    [(UITextView *)v7->_textView setFont:v12];

    v13 = [(SKUIReportAConcernDetailsCell *)v7 contentView];
    [v13 addSubview:v7->_textView];
  }
  return v7;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SKUIReportAConcernDetailsCell;
  [(SKUIReportAConcernDetailsCell *)&v38 layoutSubviews];
  v3 = [(SKUIReportAConcernDetailsCell *)self contentView];
  v4 = [v3 readableContentGuide];
  [v4 layoutFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v13 = [(SKUIReportAConcernDetailsCell *)self textView];
  v14 = [v13 textContainer];
  [v14 lineFragmentPadding];
  double v37 = v15;

  v16 = [(SKUIReportAConcernDetailsCell *)self contentView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  CGFloat rect_8 = v21;
  double v24 = v23;

  v25 = [(SKUIReportAConcernDetailsCell *)self textView];
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
  v32 = [(SKUIReportAConcernDetailsCell *)self textView];
  objc_msgSend(v32, "setTextContainerInset:", v36, v35, v29, v31);
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
  if (a3)
  {
    double v5 = [(SKUIReportAConcernDetailsCell *)self textView];
    [v5 setDelegate:self];

    [(SKUIReportAConcernDetailsCell *)self updatePlaceholderText:0];
  }
}

- (NSString)text
{
  v3 = [(SKUIReportAConcernDetailsCell *)self textView];
  v4 = [v3 text];
  double v5 = [(SKUIReportAConcernDetailsCell *)self placeholderText];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    CGFloat v8 = [(SKUIReportAConcernDetailsCell *)self textView];
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
  double v5 = [(SKUIReportAConcernDetailsCell *)self textView];
  char v6 = [v5 text];
  double v7 = v6;
  if (v3)
  {
    CGFloat v8 = [(SKUIReportAConcernDetailsCell *)self placeholderText];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      return;
    }
    CGFloat v10 = [(SKUIReportAConcernDetailsCell *)self textView];
    [v10 setText:&stru_1F1C879E8];

    id v16 = [(SKUIReportAConcernDetailsCell *)self textLabel];
    double v11 = [v16 textColor];
    CGFloat v12 = [(SKUIReportAConcernDetailsCell *)self textView];
    [v12 setTextColor:v11];
  }
  else
  {
    uint64_t v13 = [v6 length];

    if (v13) {
      return;
    }
    v14 = [(SKUIReportAConcernDetailsCell *)self placeholderText];
    double v15 = [(SKUIReportAConcernDetailsCell *)self textView];
    [v15 setText:v14];

    id v16 = [MEMORY[0x1E4FB1618] lightGrayColor];
    double v11 = [(SKUIReportAConcernDetailsCell *)self textView];
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

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:]";
}

@end