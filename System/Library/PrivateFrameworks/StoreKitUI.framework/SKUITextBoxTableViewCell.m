@interface SKUITextBoxTableViewCell
- (SKUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SKUITextBoxView)textBoxView;
- (UIEdgeInsets)textBoxInsets;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setTextBoxInsets:(UIEdgeInsets)a3;
@end

@implementation SKUITextBoxTableViewCell

- (SKUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUITextBoxTableViewCell;
  v7 = [(SKUITableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(SKUITextBoxTableViewCell *)v7 contentView];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v8->_textBoxInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v8->_textBoxInsets.bottom = v10;
    v11 = [SKUITextBoxView alloc];
    [v9 bounds];
    uint64_t v12 = -[SKUITextBoxView initWithFrame:](v11, "initWithFrame:");
    textBoxView = v8->_textBoxView;
    v8->_textBoxView = (SKUITextBoxView *)v12;

    [(SKUITextBoxView *)v8->_textBoxView setEnabled:0];
    [v9 addSubview:v8->_textBoxView];
  }
  return v8;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SKUITextBoxTableViewCell;
  [(SKUITableViewCell *)&v4 prepareForReuse];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)&self->_textBoxInsets.top = *MEMORY[0x1E4FB2848];
  *(_OWORD *)&self->_textBoxInsets.bottom = v3;
}

- (void)setBackgroundColor:(id)a3
{
  textBoxView = self->_textBoxView;
  id v5 = a3;
  [(SKUITextBoxView *)textBoxView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUITextBoxTableViewCell;
  [(SKUITextBoxTableViewCell *)&v6 setBackgroundColor:v5];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SKUITextBoxTableViewCell;
  [(SKUITableViewCell *)&v8 layoutSubviews];
  textBoxView = self->_textBoxView;
  [(SKUITextBoxTableViewCell *)self bounds];
  -[SKUITextBoxView setFrame:](textBoxView, "setFrame:", v4 + self->_textBoxInsets.left, v5 + self->_textBoxInsets.top, v6 - (self->_textBoxInsets.left + self->_textBoxInsets.right), v7 - (self->_textBoxInsets.top + self->_textBoxInsets.bottom));
}

- (SKUITextBoxView)textBoxView
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

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:]";
}

@end