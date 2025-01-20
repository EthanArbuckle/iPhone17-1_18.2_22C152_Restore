@interface SKUICommentHeaderViewController
- (SKUICommentHeaderViewController)initWithTitle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SKUICommentHeaderViewController

- (SKUICommentHeaderViewController)initWithTitle:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUICommentHeaderViewController initWithTitle:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICommentHeaderViewController;
  v14 = [(SKUICommentHeaderViewController *)&v17 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_title, a3);
  }

  return v15;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SKUICommentHeaderViewController;
  [(SKUICommentHeaderViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  [(UILabel *)self->_titleLabel setText:self->_title];
  BOOL v6 = self->_titleLabel;
  uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(UILabel *)v6 setTextColor:v7];

  uint64_t v8 = self->_titleLabel;
  uint64_t v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  [(UILabel *)v8 setFont:v9];

  uint64_t v10 = [(SKUICommentHeaderViewController *)self view];
  [v10 addSubview:self->_titleLabel];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SKUICommentHeaderViewController;
  [(SKUICommentHeaderViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [(SKUICommentHeaderViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  [(UILabel *)self->_titleLabel frame];
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v16) + -10.0 + -10.0, v11);
  double v13 = v12;
  *(float *)&double v12 = (v11 - v14) * 0.5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 10.0, floorf(*(float *)&v12), v13, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end