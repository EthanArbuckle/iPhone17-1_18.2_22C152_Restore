@interface SUUIEditorTemplateView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)isDisabled;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (NSString)text;
- (SUUIEditorTemplateView)initWithFrame:(CGRect)a3;
- (SUUIEditorTemplateViewDelegate)delegate;
- (double)bottomInset;
- (id)_textFromViewElement:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_reloadSubviews;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBottomInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation SUUIEditorTemplateView

- (SUUIEditorTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorTemplateView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUUIEditorTemplateView *)v3 _reloadSubviews];
  }
  return v4;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  textView = self->_textView;
  v8 = [(SUUIEditorTemplateView *)self _textFromViewElement:v6];
  [(UITextView *)textView setText:v8];

  v9 = [v6 style];
  v10 = SUUIViewElementFontWithStyle(v9);
  v11 = self->_textView;
  if (v10)
  {
    [(UITextView *)self->_textView setFont:v10];
  }
  else
  {
    v12 = SUUIFontPreferredFontForTextStyle(1);
    [(UITextView *)v11 setFont:v12];
  }
  v13 = [v9 ikColor];
  v14 = [v13 color];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x263F825C8] blackColor];
  }
  objc_storeStrong((id *)&self->_textColor, v15);
  if (!v14) {

  }
  [(UITextView *)self->_textView setTextColor:self->_textColor];
  char v28 = 0;
  v16 = [v6 style];
  double v17 = SUUIViewElementPaddingForStyle(v16, &v28);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = 15.0;
  double v25 = 18.0;
  if (v28) {
    double v26 = v17;
  }
  else {
    double v26 = 18.0;
  }
  if (v28) {
    double v27 = v19;
  }
  else {
    double v27 = 15.0;
  }
  if (v28)
  {
    double v25 = v21;
    double v24 = v23;
  }
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v26, v27, v25, v24);
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)textViewDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 didChangeTextInEditorTemplateView:self];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIEditorTemplateView;
  [(SUUIEditorTemplateView *)&v5 layoutSubviews];
  textView = self->_textView;
  [(SUUIEditorTemplateView *)self bounds];
  -[UITextView setFrame:](textView, "setFrame:");
  if (self->_disabled)
  {
    double v4 = [(UIColor *)self->_textColor colorWithAlphaComponent:0.2];
    [(UITextView *)self->_textView setTextColor:v4];
    [(UITextView *)self->_textView setEditable:0];
  }
  else
  {
    [(UITextView *)self->_textView setTextColor:self->_textColor];
    [(UITextView *)self->_textView setEditable:1];
  }
}

- (void)setBottomInset:(double)a3
{
  [(UITextView *)self->_textView contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UITextView setContentInset:](self->_textView, "setContentInset:");
  textView = self->_textView;
  -[UITextView setScrollIndicatorInsets:](textView, "setScrollIndicatorInsets:", v6, v8, a3, v10);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(SUUIEditorTemplateView *)self setNeedsLayout];
  }
}

- (NSString)text
{
  return [(UITextView *)self->_textView text];
}

- (void)_reloadSubviews
{
  if (!self->_textView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82D60]);
    double v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = self->_textView;
    self->_textView = v4;

    [(UITextView *)self->_textView setDelegate:self];
    [(UITextView *)self->_textView setKeyboardDismissMode:2];
    [(UITextView *)self->_textView setAlwaysBounceVertical:1];
    double v6 = [(UITextView *)self->_textView layoutManager];
    [v6 setAllowsNonContiguousLayout:0];

    double v7 = self->_textView;
    [(SUUIEditorTemplateView *)self addSubview:v7];
  }
}

- (id)_textFromViewElement:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIEditorTemplateView__textFromViewElement___block_invoke;
  v9[3] = &unk_2654008B8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateChildrenUsingBlock:v9];

  double v7 = [v6 componentsJoinedByString:@"\n"];

  return v7;
}

void __47__SUUIEditorTemplateView__textFromViewElement___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 elementType] == 138)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v6 text];
    id v5 = [v4 string];
    [v3 addObject:v5];
  }
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (SUUIEditorTemplateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIEditorTemplateViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end