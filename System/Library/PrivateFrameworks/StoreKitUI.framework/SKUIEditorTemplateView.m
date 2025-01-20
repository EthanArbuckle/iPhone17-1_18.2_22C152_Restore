@interface SKUIEditorTemplateView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)isDisabled;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (NSString)text;
- (SKUIEditorTemplateView)initWithFrame:(CGRect)a3;
- (SKUIEditorTemplateViewDelegate)delegate;
- (double)bottomInset;
- (id)_textFromViewElement:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_reloadSubviews;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBottomInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)text;
- (void)textViewDidChange:(id)a3;
@end

@implementation SKUIEditorTemplateView

- (SKUIEditorTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorTemplateView;
  v3 = -[SKUIViewReuseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SKUIEditorTemplateView *)v3 _reloadSubviews];
  }
  return v4;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIEditorTemplateView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIEditorTemplateView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIEditorTemplateView requestLayoutForViewElement:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIEditorTemplateView sizeThatFitsWidth:viewElement:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIEditorTemplateView reloadWithViewElement:width:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  textView = self->_textView;
  v16 = [(SKUIEditorTemplateView *)self _textFromViewElement:v6];
  [(UITextView *)textView setText:v16];

  v17 = [v6 style];
  v18 = SKUIViewElementFontWithStyle(v17);
  v19 = self->_textView;
  if (v18)
  {
    [(UITextView *)self->_textView setFont:v18];
  }
  else
  {
    v20 = SKUIFontPreferredFontForTextStyle(1);
    [(UITextView *)v19 setFont:v20];
  }
  v21 = [v17 ikColor];
  v22 = [v21 color];
  v23 = v22;
  if (!v22)
  {
    v23 = [MEMORY[0x1E4FB1618] blackColor];
  }
  objc_storeStrong((id *)&self->_textColor, v23);
  if (!v22) {

  }
  [(UITextView *)self->_textView setTextColor:self->_textColor];
  char v36 = 0;
  v24 = [v6 style];
  double v25 = SKUIViewElementPaddingForStyle(v24, &v36);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = 15.0;
  double v33 = 18.0;
  if (v36) {
    double v34 = v25;
  }
  else {
    double v34 = 18.0;
  }
  if (v36) {
    double v35 = v27;
  }
  else {
    double v35 = 15.0;
  }
  if (v36)
  {
    double v33 = v29;
    double v32 = v31;
  }
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v34, v35, v33, v32);
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorTemplateView setImage:forArtworkRequest:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorTemplateView updateWithItemState:context:animated:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIEditorTemplateView viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)textViewDidChange:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIEditorTemplateView textViewDidChange:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 didChangeTextInEditorTemplateView:self];
  }
}

- (void)layoutSubviews
{
}

- (void)setBottomInset:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIEditorTemplateView setBottomInset:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  [(UITextView *)self->_textView contentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UITextView setContentInset:](self->_textView, "setContentInset:");
  -[UITextView setScrollIndicatorInsets:](self->_textView, "setScrollIndicatorInsets:", v14, v16, a3, v18);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(SKUIEditorTemplateView *)self setNeedsLayout];
  }
}

- (NSString)text
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIEditorTemplateView *)v3 text];
      }
    }
  }
  uint64_t v11 = [(UITextView *)self->_textView text];

  return (NSString *)v11;
}

- (void)_reloadSubviews
{
  if (!self->_textView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    uint64_t v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = self->_textView;
    self->_textView = v4;

    [(UITextView *)self->_textView setDelegate:self];
    [(UITextView *)self->_textView setKeyboardDismissMode:2];
    [(UITextView *)self->_textView setAlwaysBounceVertical:1];
    uint64_t v6 = [(UITextView *)self->_textView layoutManager];
    [v6 setAllowsNonContiguousLayout:0];

    uint64_t v7 = self->_textView;
    [(SKUIEditorTemplateView *)self addSubview:v7];
  }
}

- (id)_textFromViewElement:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIEditorTemplateView__textFromViewElement___block_invoke;
  v9[3] = &unk_1E6423570;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateChildrenUsingBlock:v9];

  uint64_t v7 = [v6 componentsJoinedByString:@"\n"];

  return v7;
}

void __47__SKUIEditorTemplateView__textFromViewElement___block_invoke(uint64_t a1, void *a2)
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

- (SKUIEditorTemplateViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIEditorTemplateViewDelegate *)WeakRetained;
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

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)textViewDidChange:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBottomInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)text
{
}

@end