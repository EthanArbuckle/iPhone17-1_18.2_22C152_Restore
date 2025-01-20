@interface _SBAlertItemHeaderViewController
- (CGSize)_expectedSize;
- (UIImage)image;
- (_SBAlertItemHeaderViewController)initWithImage:(id)a3;
- (double)_bottomMarginOffset;
- (double)_topMarginOffset;
- (void)loadView;
@end

@implementation _SBAlertItemHeaderViewController

- (_SBAlertItemHeaderViewController)initWithImage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBAlertItem.m", 500, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_SBAlertItemHeaderViewController;
  v6 = [(_SBAlertItemHeaderViewController *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v5];
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v7;
  }
  return v6;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)loadView
{
  id v14 = [(_SBAlertItemHeaderViewController *)self image];
  [v14 size];
  double v4 = v3;
  double v6 = v5;
  [(_SBAlertItemHeaderViewController *)self _expectedSize];
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, v7, v9);
  objc_msgSend(v11, "setSize:", v8, v10);
  [v11 setBackgroundColor:0];
  [v11 addSubview:self->_imageView];
  imageView = self->_imageView;
  [(_SBAlertItemHeaderViewController *)self _topMarginOffset];
  -[UIImageView setFrame:](imageView, "setFrame:", 0.0, v13, v4, v6);
  [v11 size];
  -[_SBAlertItemHeaderViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(_SBAlertItemHeaderViewController *)self setView:v11];
}

- (CGSize)_expectedSize
{
  [(UIImageView *)self->_imageView size];
  double v4 = v3;
  [(UIImageView *)self->_imageView size];
  double v6 = v5;
  [(_SBAlertItemHeaderViewController *)self _topMarginOffset];
  double v8 = v6 + v7;
  [(_SBAlertItemHeaderViewController *)self _bottomMarginOffset];
  double v10 = v8 + v9;
  double v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)_topMarginOffset
{
  return 20.0;
}

- (double)_bottomMarginOffset
{
  return 0.0;
}

- (void).cxx_destruct
{
}

@end