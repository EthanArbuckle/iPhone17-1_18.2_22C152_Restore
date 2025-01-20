@interface _PXAlertContentViewController
- (_PXAlertContentViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation _PXAlertContentViewController

- (void).cxx_destruct
{
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)_PXAlertContentViewController;
  [(_PXAlertContentViewController *)&v9 viewDidLoad];
  v3 = [(_PXAlertContentViewController *)self view];
  [v3 addSubview:self->_contentView];
  [v3 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  -[UIView setCenter:](self->_contentView, "setCenter:", MidX, CGRectGetMidY(v11));
  [(UIView *)self->_contentView setAutoresizingMask:45];
}

- (_PXAlertContentViewController)initWithContentView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAlertContentViewController;
  v6 = [(_PXAlertContentViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentView, a3);
  }

  return v7;
}

@end