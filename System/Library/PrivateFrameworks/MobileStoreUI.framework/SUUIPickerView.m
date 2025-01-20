@interface SUUIPickerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIPickerView)initWithCoder:(id)a3;
- (SUUIPickerView)initWithFrame:(CGRect)a3;
- (SUUIPickerView)initWithTitles:(id)a3;
- (SUUIPickerViewDelegate)delegate;
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

@implementation SUUIPickerView

- (SUUIPickerView)initWithCoder:(id)a3
{
  return [(SUUIPickerView *)self initWithTitles:0];
}

- (SUUIPickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(SUUIPickerView *)self initWithTitles:0];
  v8 = v7;
  if (v7) {
    -[SUUIPickerView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (SUUIPickerView)initWithTitles:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIPickerView;
  v5 = -[SUUIPickerView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    titles = v5->_titles;
    v5->_titles = (NSArray *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:2010];
    backdropView = v5->_backdropView;
    v5->_backdropView = (_UIBackdropView *)v8;

    [(SUUIPickerView *)v5 addSubview:v5->_backdropView];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v5->_separatorView;
    v5->_separatorView = v10;

    v12 = v5->_separatorView;
    v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
    [(UIView *)v12 setBackgroundColor:v13];

    [(SUUIPickerView *)v5 addSubview:v5->_separatorView];
    id v14 = objc_alloc(MEMORY[0x263F82A38]);
    [(SUUIPickerView *)v5 bounds];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:");
    pickerView = v5->_pickerView;
    v5->_pickerView = (UIPickerView *)v15;

    [(UIPickerView *)v5->_pickerView setDataSource:v5];
    [(UIPickerView *)v5->_pickerView setDelegate:v5];
    [(UIPickerView *)v5->_pickerView setShowsSelectionIndicator:1];
    [(SUUIPickerView *)v5 addSubview:v5->_pickerView];
    v17 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIPickerView *)v5 setBackgroundColor:v17];
  }
  return v5;
}

- (void)dealloc
{
  [(UIPickerView *)self->_pickerView setDataSource:0];
  [(UIPickerView *)self->_pickerView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIPickerView;
  [(SUUIPickerView *)&v3 dealloc];
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
  [(SUUIPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v4, v6, v8, v10);
  separatorView = self->_separatorView;
  id v13 = [MEMORY[0x263F82B60] mainScreen];
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

- (SUUIPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIPickerViewDelegate *)WeakRetained;
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

@end