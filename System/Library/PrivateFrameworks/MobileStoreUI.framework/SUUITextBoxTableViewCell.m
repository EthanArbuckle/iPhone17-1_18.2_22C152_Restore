@interface SUUITextBoxTableViewCell
- (SUUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SUUITextBoxView)textBoxView;
- (UIEdgeInsets)textBoxInsets;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setTextBoxInsets:(UIEdgeInsets)a3;
@end

@implementation SUUITextBoxTableViewCell

- (SUUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SUUITextBoxTableViewCell;
  v4 = [(SUUITableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUITextBoxTableViewCell *)v4 contentView];
    long long v7 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v5->_textBoxInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v5->_textBoxInsets.bottom = v7;
    v8 = [SUUITextBoxView alloc];
    [v6 bounds];
    uint64_t v9 = -[SUUITextBoxView initWithFrame:](v8, "initWithFrame:");
    textBoxView = v5->_textBoxView;
    v5->_textBoxView = (SUUITextBoxView *)v9;

    [(SUUITextBoxView *)v5->_textBoxView setEnabled:0];
    [v6 addSubview:v5->_textBoxView];
  }
  return v5;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SUUITextBoxTableViewCell;
  [(SUUITableViewCell *)&v4 prepareForReuse];
  long long v3 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)&self->_textBoxInsets.top = *MEMORY[0x263F834E8];
  *(_OWORD *)&self->_textBoxInsets.bottom = v3;
}

- (void)setBackgroundColor:(id)a3
{
  textBoxView = self->_textBoxView;
  id v5 = a3;
  [(SUUITextBoxView *)textBoxView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxTableViewCell;
  [(SUUITextBoxTableViewCell *)&v6 setBackgroundColor:v5];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SUUITextBoxTableViewCell;
  [(SUUITableViewCell *)&v8 layoutSubviews];
  textBoxView = self->_textBoxView;
  [(SUUITextBoxTableViewCell *)self bounds];
  -[SUUITextBoxView setFrame:](textBoxView, "setFrame:", v4 + self->_textBoxInsets.left, v5 + self->_textBoxInsets.top, v6 - (self->_textBoxInsets.left + self->_textBoxInsets.right), v7 - (self->_textBoxInsets.top + self->_textBoxInsets.bottom));
}

- (SUUITextBoxView)textBoxView
{
  return self->_textBoxView;
}

- (UIEdgeInsets)textBoxInsets
{
  double top = self->_textBoxInsets.top;
  double left = self->_textBoxInsets.left;
  double bottom = self->_textBoxInsets.bottom;
  double right = self->_textBoxInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextBoxInsets:(UIEdgeInsets)a3
{
  self->_textBoxInsets = a3;
}

- (void).cxx_destruct
{
}

@end