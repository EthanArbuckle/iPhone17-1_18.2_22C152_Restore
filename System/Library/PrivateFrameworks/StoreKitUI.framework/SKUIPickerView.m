@interface SKUIPickerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIPickerView)initWithCoder:(id)a3;
- (SKUIPickerView)initWithFrame:(CGRect)a3;
- (SKUIPickerView)initWithTitles:(id)a3;
- (SKUIPickerViewDelegate)delegate;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)selectedItemIndex;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
@end

@implementation SKUIPickerView

- (SKUIPickerView)initWithCoder:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIPickerView initWithCoder:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  return [(SKUIPickerView *)self initWithTitles:0];
}

- (SKUIPickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIPickerView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [(SKUIPickerView *)self initWithTitles:0];
  v17 = v16;
  if (v16) {
    -[SKUIPickerView setFrame:](v16, "setFrame:", x, y, width, height);
  }
  return v17;
}

- (SKUIPickerView)initWithTitles:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPickerView initWithTitles:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIPickerView;
  uint64_t v13 = -[SKUIPickerView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v13)
  {
    uint64_t v14 = [v4 copy];
    titles = v13->_titles;
    v13->_titles = (NSArray *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
    backdropView = v13->_backdropView;
    v13->_backdropView = (_UIBackdropView *)v16;

    [(SKUIPickerView *)v13 addSubview:v13->_backdropView];
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v13->_separatorView;
    v13->_separatorView = v18;

    v20 = v13->_separatorView;
    v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    [(UIView *)v20 setBackgroundColor:v21];

    [(SKUIPickerView *)v13 addSubview:v13->_separatorView];
    id v22 = objc_alloc(MEMORY[0x1E4FB1A98]);
    [(SKUIPickerView *)v13 bounds];
    uint64_t v23 = objc_msgSend(v22, "initWithFrame:");
    pickerView = v13->_pickerView;
    v13->_pickerView = (UIPickerView *)v23;

    [(UIPickerView *)v13->_pickerView setDataSource:v13];
    [(UIPickerView *)v13->_pickerView setDelegate:v13];
    [(UIPickerView *)v13->_pickerView setShowsSelectionIndicator:1];
    [(SKUIPickerView *)v13 addSubview:v13->_pickerView];
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIPickerView *)v13 setBackgroundColor:v25];
  }
  return v13;
}

- (void)dealloc
{
  [(UIPickerView *)self->_pickerView setDataSource:0];
  [(UIPickerView *)self->_pickerView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIPickerView;
  [(SKUIPickerView *)&v3 dealloc];
}

- (int64_t)selectedItemIndex
{
  return [(UIPickerView *)self->_pickerView selectedRowInComponent:0];
}

- (void)setSelectedItemIndex:(int64_t)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(SKUIPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v4, v6, v8, v10);
  separatorView = self->_separatorView;
  id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  -[UIView setFrame:](separatorView, "setFrame:", v4, v6, v8, 1.0 / v12);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_titles count];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 pickerView:self didSelectItemAtIndex:a4];
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(NSArray *)self->_titles objectAtIndex:a4];
}

- (SKUIPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTitles:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end