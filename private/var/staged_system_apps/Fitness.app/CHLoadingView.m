@interface CHLoadingView
- (CHLoadingView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)indicatorView;
@end

@implementation CHLoadingView

- (CHLoadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CHLoadingView;
  v7 = -[CHLoadingView initWithFrame:](&v12, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:x, y, width, height];
    indicatorView = v7->_indicatorView;
    v7->_indicatorView = v8;

    v10 = +[UIColor systemBackgroundColor];
    [(CHLoadingView *)v7 setBackgroundColor:v10];

    [(CHLoadingView *)v7 addSubview:v7->_indicatorView];
  }
  return v7;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void).cxx_destruct
{
}

@end