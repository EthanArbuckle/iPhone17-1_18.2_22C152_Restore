@interface DimmingView
- (BOOL)transparent;
- (DimmingView)initWithFrame:(CGRect)a3;
- (DimmingViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setTransparent:(BOOL)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DimmingView

- (DimmingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DimmingView;
  v3 = -[DimmingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor colorWithRed:0.0274509806 green:0.0431372561 blue:0.0666666701 alpha:0.5];
    [(DimmingView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [(DimmingView *)self delegate];
  [v5 dimmingViewWasTapped:self];
}

- (BOOL)transparent
{
  v2 = [(DimmingView *)self backgroundColor];
  v3 = +[UIColor clearColor];
  unsigned __int8 v4 = [v2 isEqual:v3];

  return v4;
}

- (void)setTransparent:(BOOL)a3
{
  if (a3) {
    +[UIColor clearColor];
  }
  else {
  id v4 = +[UIColor colorWithRed:0.0274509806 green:0.0431372561 blue:0.0666666701 alpha:0.5];
  }
  [(DimmingView *)self setBackgroundColor:v4];
}

- (DimmingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DimmingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end