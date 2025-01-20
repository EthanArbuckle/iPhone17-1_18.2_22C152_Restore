@interface MTDownloadsCancelReusableView
- (MTDownloadsCancelReusableView)initWithFrame:(CGRect)a3;
- (UIButton)cancelAllButton;
- (void)layoutSubviews;
- (void)setCancelAllButton:(id)a3;
@end

@implementation MTDownloadsCancelReusableView

- (MTDownloadsCancelReusableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTDownloadsCancelReusableView;
  v3 = -[MTDownloadsCancelReusableView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTDownloadsCancelReusableView *)v3 cancelAllButton];
    [(MTDownloadsCancelReusableView *)v4 addSubview:v5];
  }
  return v4;
}

- (UIButton)cancelAllButton
{
  cancelAllButton = self->_cancelAllButton;
  if (!cancelAllButton)
  {
    v4 = +[UIButton buttonWithType:1];
    v5 = self->_cancelAllButton;
    self->_cancelAllButton = v4;

    v6 = +[UIFont buttonFont];
    objc_super v7 = [(UIButton *)self->_cancelAllButton titleLabel];
    [v7 setFont:v6];

    [(UIButton *)self->_cancelAllButton setAutoresizingMask:45];
    v8 = self->_cancelAllButton;
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Cancel Downloads" value:&stru_10056A8A0 table:0];
    [(UIButton *)v8 setTitle:v10 forState:0];

    [(UIButton *)self->_cancelAllButton sizeToFit];
    cancelAllButton = self->_cancelAllButton;
  }

  return cancelAllButton;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MTDownloadsCancelReusableView;
  [(MTDownloadsCancelReusableView *)&v12 layoutSubviews];
  [(MTDownloadsCancelReusableView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MTDownloadsCancelReusableView *)self cancelAllButton];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)setCancelAllButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end