@interface STHeroWelcomeController
- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 topInset:(double)a7;
- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 topInset:(double)a6;
- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 topInset:(double)a5;
- (double)topInset;
- (void)loadView;
- (void)setTopInset:(double)a3;
- (void)setView:(id)a3;
@end

@implementation STHeroWelcomeController

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 topInset:(double)a5
{
  return [(STHeroWelcomeController *)self initWithTitle:a3 detailText:a4 icon:0 contentLayout:1 topInset:a5];
}

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 topInset:(double)a6
{
  return [(STHeroWelcomeController *)self initWithTitle:a3 detailText:a4 icon:a5 contentLayout:2 topInset:a6];
}

- (STHeroWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 topInset:(double)a7
{
  v9.receiver = self;
  v9.super_class = (Class)STHeroWelcomeController;
  result = [(STHeroWelcomeController *)&v9 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:a6];
  result->_topInset = a7;
  return result;
}

- (void)setView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)STHeroWelcomeController;
    [(STHeroWelcomeController *)&v5 setView:v4];
  }
}

- (void)loadView
{
  v3 = [STOnboardingView alloc];
  [(STHeroWelcomeController *)self topInset];
  id v4 = -[STOnboardingView initWithTopInset:](v3, "initWithTopInset:");
  [(STHeroWelcomeController *)self setView:v4];

  v5.receiver = self;
  v5.super_class = (Class)STHeroWelcomeController;
  [(OBBaseWelcomeController *)&v5 loadView];
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

@end