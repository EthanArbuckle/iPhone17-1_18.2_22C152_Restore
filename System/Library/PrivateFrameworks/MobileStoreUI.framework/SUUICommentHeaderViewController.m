@interface SUUICommentHeaderViewController
- (SUUICommentHeaderViewController)initWithTitle:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SUUICommentHeaderViewController

- (SUUICommentHeaderViewController)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICommentHeaderViewController;
  v6 = [(SUUICommentHeaderViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_title, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SUUICommentHeaderViewController;
  [(SUUICommentHeaderViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  [(UILabel *)self->_titleLabel setText:self->_title];
  v6 = self->_titleLabel;
  v7 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(UILabel *)v6 setTextColor:v7];

  v8 = self->_titleLabel;
  objc_super v9 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  [(UILabel *)v8 setFont:v9];

  v10 = [(SUUICommentHeaderViewController *)self view];
  [v10 addSubview:self->_titleLabel];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SUUICommentHeaderViewController;
  [(SUUICommentHeaderViewController *)&v15 viewWillLayoutSubviews];
  id v3 = [(SUUICommentHeaderViewController *)self view];
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

@end