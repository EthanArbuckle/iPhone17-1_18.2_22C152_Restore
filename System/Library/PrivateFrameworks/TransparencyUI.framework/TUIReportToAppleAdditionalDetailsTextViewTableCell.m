@interface TUIReportToAppleAdditionalDetailsTextViewTableCell
- (BOOL)placeholderDisplayed;
- (BOOL)resignFirstResponder;
- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4;
- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4;
- (BOOL)textContentViewShouldBeginEditing:(id)a3;
- (TUIReportToAppleAdditionalDetailsTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_updateInterfaceColorForTextView;
- (void)layoutSubviews;
- (void)setPlaceholderDisplayed:(BOOL)a3;
- (void)textContentView:(id)a3 didChangeSize:(CGSize)a4;
- (void)textContentViewDidChange:(id)a3;
@end

@implementation TUIReportToAppleAdditionalDetailsTextViewTableCell

- (TUIReportToAppleAdditionalDetailsTextViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  v9 = [(PSTextViewTableCell *)&v20 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
    scrollView = v9->_scrollView;
    v9->_scrollView = v10;

    [(UIScrollView *)v9->_scrollView setAlwaysBounceVertical:1];
    [(TUIReportToAppleAdditionalDetailsTextViewTableCell *)v9 addSubview:v9->_scrollView];
    uint64_t v12 = (int)*MEMORY[0x263F5FE70];
    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) removeFromSuperview];
    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) setHidden:1];
    uint64_t v13 = objc_opt_new();
    v14 = *(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12);
    *(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12) = (Class)v13;

    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) setCell:v9];
    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) setDelegate:v9];
    v15 = (void *)MEMORY[0x263F1C658];
    [MEMORY[0x263F1C658] systemFontSize];
    v16 = objc_msgSend(v15, "systemFontOfSize:");
    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) setFont:v16];

    [(UIScrollView *)v9->_scrollView addSubview:*(Class *)((char *)&v9->super.super.super.super.super.super.isa + v12)];
    uint64_t v17 = [v8 propertyForKey:*MEMORY[0x263F602D0]];
    placeholderText = v9->_placeholderText;
    v9->_placeholderText = (NSString *)v17;

    [*(id *)((char *)&v9->super.super.super.super.super.super.isa + v12) setText:v9->_placeholderText];
    [(TUIReportToAppleAdditionalDetailsTextViewTableCell *)v9 setPlaceholderDisplayed:1];
  }

  return v9;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  [(PSTextViewTableCell *)&v6 layoutSubviews];
  uint64_t v3 = (int)*MEMORY[0x263F5FE70];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) frame];
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) frame];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v4, v5);
  [(TUIReportToAppleAdditionalDetailsTextViewTableCell *)self _updateInterfaceColorForTextView];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)TUIReportToAppleAdditionalDetailsTextViewTableCell;
  [(PSTextViewTableCell *)&v4 resignFirstResponder];
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]) resignFirstResponder];
}

- (void)setPlaceholderDisplayed:(BOOL)a3
{
  self->_placeholderDisplayed = a3;
  if (a3) {
    [MEMORY[0x263F1C550] placeholderTextColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] labelColor];
  }
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]) setTextColor:v4];
}

- (void)textContentView:(id)a3 didChangeSize:(CGSize)a4
{
}

- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4
{
  return 1;
}

- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4
{
  return 0;
}

- (void)textContentViewDidChange:(id)a3
{
  id v8 = a3;
  [v8 rectForScrollToVisible];
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  if (!CGRectIsEmpty(v10))
  {
    objc_msgSend(v8, "convertRect:toView:", self->_scrollView, x, y, width, height);
    -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1);
  }
}

- (BOOL)textContentViewShouldBeginEditing:(id)a3
{
  BOOL placeholderDisplayed = self->_placeholderDisplayed;
  if (self->_placeholderDisplayed)
  {
    double v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]);
    placeholderText = &stru_270C3F140;
  }
  else
  {
    v7 = [a3 text];
    uint64_t v8 = [v7 length];

    if (v8) {
      return 1;
    }
    placeholderText = (__CFString *)self->_placeholderText;
    double v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]);
  }
  [v5 setText:placeholderText];
  [(TUIReportToAppleAdditionalDetailsTextViewTableCell *)self setPlaceholderDisplayed:!placeholderDisplayed];
  return 1;
}

- (void)_updateInterfaceColorForTextView
{
  uint64_t v3 = [(TUIReportToAppleAdditionalDetailsTextViewTableCell *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2)
  {
    double v5 = [MEMORY[0x263F1C550] tableCellGroupedBackgroundColor];
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]) setBackgroundColor:v5];

    [MEMORY[0x263F1C550] tableCellGroupedBackgroundColor];
  }
  else
  {
    objc_super v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE70]) setBackgroundColor:v6];

    [MEMORY[0x263F1C550] systemBackgroundColor];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UIScrollView *)self->_scrollView setBackgroundColor:v7];
}

- (BOOL)placeholderDisplayed
{
  return self->_placeholderDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end