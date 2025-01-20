@interface DimmingContainerView
- (DimmingContainerView)initWithFrame:(CGRect)a3;
@end

@implementation DimmingContainerView

- (DimmingContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DimmingContainerView;
  v3 = -[DimmingContainerView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(DimmingContainerView *)v3 setUserInteractionEnabled:0];
    v5 = +[UIColor colorWithWhite:0.0 alpha:0.400000006];
    [(DimmingContainerView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

@end