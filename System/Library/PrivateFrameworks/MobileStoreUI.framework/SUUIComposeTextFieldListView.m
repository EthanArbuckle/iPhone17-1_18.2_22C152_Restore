@interface SUUIComposeTextFieldListView
- (BOOL)isValid;
- (SUUIComposeTextFieldListView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (SUUIComposeTextFieldListViewDelegate)delegate;
- (UIResponder)initialFirstResponder;
- (double)height;
- (id)textForFieldAtIndex:(unint64_t)a3;
- (int64_t)composeReviewStyle;
- (void)_updateValidity;
- (void)composeTextFieldValidityChanged:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIComposeTextFieldListView

- (SUUIComposeTextFieldListView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIComposeTextFieldListView;
  result = -[SUUIComposeTextFieldListView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_style = a4;
  }
  return result;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_fields makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeTextFieldListView;
  [(SUUIComposeTextFieldListView *)&v3 dealloc];
}

- (double)height
{
  if (![(NSMutableArray *)self->_fields count]) {
    return 0.0;
  }
  objc_super v3 = [(NSMutableArray *)self->_fields lastObject];
  [v3 frame];
  double MaxY = CGRectGetMaxY(v6);

  return MaxY;
}

- (UIResponder)initialFirstResponder
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_fields;
  objc_super v3 = (void *)[(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        CGRect v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "text", (void)v10);
        uint64_t v8 = [v7 length];

        if (!v8)
        {
          objc_super v3 = [v6 textField];
          goto LABEL_11;
        }
      }
      objc_super v3 = (void *)[(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (UIResponder *)v3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)layoutSubviews
{
  [(SUUIComposeTextFieldListView *)self bounds];
  [(SUUIComposeTextFieldListView *)self safeAreaInsets];
  uint64_t v3 = [(NSMutableArray *)self->_fields count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained numberOfColumnsInTextFieldList:self];

  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    float v7 = 0.0;
    do
    {
      uint64_t v8 = [(NSMutableArray *)self->_fields objectAtIndex:v6];
      [v8 frame];
      if (v6 % v5 >= v5 - 1)
      {
        float v10 = v9 + v7;
        float v7 = v10;
      }
      objc_msgSend(v8, "setFrame:");

      ++v6;
    }
    while (v3 != v6);
  }
}

- (void)reloadData
{
  fields = self->_fields;
  if (fields)
  {
    [(NSMutableArray *)fields makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
    [(NSMutableArray *)self->_fields makeObjectsPerformSelector:sel_removeFromSuperview withObject:0];
    [(NSMutableArray *)self->_fields removeAllObjects];
  }
  else
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = self->_fields;
    self->_fields = v4;
  }
  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = [WeakRetained numberOfFieldsInTextFieldList:self];

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = [v11 numberOfColumnsInTextFieldList:self];

  if (v10 >= 1)
  {
    uint64_t v13 = 0;
    double v14 = 1.0 / v8;
    do
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = [v15 textFieldList:self configurationForFieldAtIndex:v13];

      if (v13 % v12 >= v12 - 1) {
        double v17 = 0.0;
      }
      else {
        double v17 = v14;
      }
      if (v13 / v12 == v10 / v12 - 1) {
        double v18 = v14;
      }
      else {
        double v18 = 0.0;
      }
      objc_msgSend(v16, "setBorderInsets:", v14, 0.0, v18, v17);
      v19 = [[SUUIComposeTextField alloc] initWithConfiguration:v16 style:self->_style];
      [(SUUIComposeTextField *)v19 setDelegate:self];
      [(NSMutableArray *)self->_fields addObject:v19];
      [(SUUIComposeTextFieldListView *)self addSubview:v19];

      ++v13;
    }
    while (v10 != v13);
  }
  [(SUUIComposeTextFieldListView *)self _updateValidity];
  [(SUUIComposeTextFieldListView *)self layoutSubviews];
  [(SUUIComposeTextFieldListView *)self frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(SUUIComposeTextFieldListView *)self height];
  -[SUUIComposeTextFieldListView setFrame:](self, "setFrame:", v21, v23, v25, v26);
  [(SUUIComposeTextFieldListView *)self setNeedsLayout];
}

- (id)textForFieldAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_fields count] <= a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_fields objectAtIndex:a3];
    uint64_t v6 = [v5 text];
  }
  return v6;
}

- (void)composeTextFieldValidityChanged:(id)a3
{
  BOOL isValid = self->_isValid;
  [(SUUIComposeTextFieldListView *)self _updateValidity];
  if (self->_isValid != isValid)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 textFieldListValidityDidChange:self];
    }
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 textFieldListValuesDidChange:self];
  }
}

- (void)_updateValidity
{
  uint64_t v3 = [(NSMutableArray *)self->_fields count];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t v5 = 1;
    do
    {
      char v6 = [(NSMutableArray *)self->_fields objectAtIndex:v5 - 1];
      id v7 = [v6 configuration];
      if ([v7 isRequired]) {
        int v8 = [v6 isValid];
      }
      else {
        int v8 = 1;
      }

      if (!v8) {
        break;
      }
    }
    while (v5++ < v4);
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  self->_BOOL isValid = v8;
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SUUIComposeTextFieldListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIComposeTextFieldListViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end