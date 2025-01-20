@interface SUTextViewCell
- (BOOL)resignFirstResponder;
- (BOOL)textContentView:(id)a3 shouldChangeSizeForContentSize:(CGSize)a4;
- (BOOL)textContentView:(id)a3 shouldScrollForPendingContentSize:(CGSize)a4;
- (BOOL)textContentViewShouldBeginEditing:(id)a3;
- (BOOL)textContentViewShouldEndEditing:(id)a3;
- (SUTextContentView)textContentView;
- (SUTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SUTextViewCellDelegate)delegate;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)textContentView:(id)a3 didChangeSize:(CGSize)a4;
- (void)textContentViewDidChange:(id)a3;
@end

@implementation SUTextViewCell

- (SUTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SUTextViewCell;
  v4 = [(SUTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
    v4->_scrollView = v5;
    [(UIScrollView *)v5 setAlwaysBounceVertical:1];
    [(SUTextViewCell *)v4 addSubview:v4->_scrollView];
    v6 = objc_alloc_init(SUTextContentView);
    v4->_textContentView = v6;
    [(SUTextContentView *)v6 setBackgroundColor:[(SUTextViewCell *)v4 backgroundColor]];
    -[UITextContentView setFont:](v4->_textContentView, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:17.0]);
    [(UITextContentView *)v4->_textContentView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView addSubview:v4->_textContentView];
  }
  return v4;
}

- (void)dealloc
{
  self->_scrollView = 0;
  [(UITextContentView *)self->_textContentView setDelegate:0];

  self->_textContentView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTextViewCell;
  [(SUTableCell *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUTextViewCell;
  [(SUTableCell *)&v9 layoutSubviews];
  scrollView = self->_scrollView;
  objc_msgSend((id)-[SUTextViewCell contentView](self, "contentView"), "frame");
  CGRect v11 = CGRectInset(v10, 10.0, 6.0);
  -[UIScrollView setFrame:](scrollView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  [(UIScrollView *)self->_scrollView bounds];
  double v5 = v4;
  double v7 = v6;
  [(SUTextContentView *)self->_textContentView frame];
  if (v8 >= v7) {
    double v7 = v8;
  }
  -[UITextContentView setFrame:](self->_textContentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v7);
}

- (BOOL)resignFirstResponder
{
  return [(SUTextContentView *)self->_textContentView resignFirstResponder];
}

- (void)setBackgroundColor:(id)a3
{
  -[SUTextContentView setBackgroundColor:](self->_textContentView, "setBackgroundColor:");
  v5.receiver = self;
  v5.super_class = (Class)SUTextViewCell;
  [(SUTextViewCell *)&v5 setBackgroundColor:a3];
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUTextViewCell;
  -[SUTextViewCell setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUTextViewCell;
  [(SUTableCell *)&v4 setHighlighted:0 animated:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUTextViewCell;
  [(SUTableCell *)&v4 setSelected:0 animated:0];
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
  [a3 rectForScrollToVisible];
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  if (!CGRectIsEmpty(v11))
  {
    objc_msgSend(a3, "convertRect:toView:", self->_scrollView, x, y, width, height);
    scrollView = self->_scrollView;
    -[UIScrollView scrollRectToVisible:animated:](scrollView, "scrollRectToVisible:animated:", 1);
  }
}

- (BOOL)textContentViewShouldBeginEditing:(id)a3
{
  delegate = self->_delegate;
  if (delegate) {
    return [(SUTextViewCellDelegate *)delegate textViewCellShouldBeginEditing:self];
  }
  else {
    return 1;
  }
}

- (BOOL)textContentViewShouldEndEditing:(id)a3
{
  delegate = self->_delegate;
  if (delegate) {
    return [(SUTextViewCellDelegate *)delegate textViewCellShouldEndEditing:self];
  }
  else {
    return 1;
  }
}

- (SUTextViewCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUTextViewCellDelegate *)a3;
}

- (SUTextContentView)textContentView
{
  return self->_textContentView;
}

@end