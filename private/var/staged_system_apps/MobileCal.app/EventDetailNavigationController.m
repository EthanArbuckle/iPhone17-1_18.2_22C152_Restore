@interface EventDetailNavigationController
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (id)doneBlock;
- (void)setDoneBlock:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EventDetailNavigationController

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EventDetailNavigationController;
  [(EventDetailNavigationController *)&v6 viewWillDisappear:a3];
  v4 = [(EventDetailNavigationController *)self doneBlock];

  if (v4)
  {
    v5 = [(EventDetailNavigationController *)self doneBlock];
    ((void (**)(void, EventDetailNavigationController *, void))v5)[2](v5, self, 0);
  }
}

- (CGSize)preferredContentSize
{
  v3 = [(EventDetailNavigationController *)self viewControllers];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(EventDetailNavigationController *)self viewControllers];
    objc_super v6 = [v5 objectAtIndexedSubscript:0];

    [v6 preferredContentSize];
    CGFloat width = v7;
    CGFloat height = v9;
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  double v11 = width;
  double v12 = height;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (EKEvent)event
{
  v3 = [(EventDetailNavigationController *)self viewControllers];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(EventDetailNavigationController *)self viewControllers];
    objc_super v6 = [v5 objectAtIndexedSubscript:0];

    double v7 = 0;
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v6 performSelector:"event"];
    }
  }
  else
  {
    double v7 = 0;
  }

  return (EKEvent *)v7;
}

- (id)doneBlock
{
  return self->_doneBlock;
}

- (void)setDoneBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end