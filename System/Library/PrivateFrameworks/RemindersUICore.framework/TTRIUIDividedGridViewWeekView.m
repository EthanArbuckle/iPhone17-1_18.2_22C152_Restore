@interface TTRIUIDividedGridViewWeekView
- (NSLayoutConstraint)heightConstraint;
- (NSMutableArray)buttonViews;
- (TTRIUIDividedGridViewWeekView)init;
- (void)setButtonViews:(id)a3;
- (void)setHeightConstraint:(id)a3;
@end

@implementation TTRIUIDividedGridViewWeekView

- (TTRIUIDividedGridViewWeekView)init
{
  v5.receiver = self;
  v5.super_class = (Class)TTRIUIDividedGridViewWeekView;
  v2 = [(TTRIUIDividedGridViewWeekView *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TTRIUIDividedGridViewWeekView *)v2 setButtonViews:v3];
  }
  return v2;
}

- (NSMutableArray)buttonViews
{
  return (NSMutableArray *)objc_getProperty(self, a2, 408, 1);
}

- (void)setButtonViews:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heightConstraint);

  objc_storeStrong((id *)&self->_buttonViews, 0);
}

@end