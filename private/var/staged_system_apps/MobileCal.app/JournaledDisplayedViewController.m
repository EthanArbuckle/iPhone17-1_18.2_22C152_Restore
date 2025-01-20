@interface JournaledDisplayedViewController
- (UIViewController)presentingViewController;
- (UIViewController)viewController;
- (id)description;
- (unint64_t)displayType;
- (void)setDisplayType:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation JournaledDisplayedViewController

- (id)description
{
  if (self->_displayType)
  {
    v8.receiver = self;
    v8.super_class = (Class)JournaledDisplayedViewController;
    v3 = [(JournaledDisplayedViewController *)&v8 description];
    viewController = self->_viewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v6 = +[NSString stringWithFormat:@"%@ Recorded PRESENTATION of %@ by %@ ", v3, viewController, WeakRetained];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)JournaledDisplayedViewController;
    v3 = [(JournaledDisplayedViewController *)&v9 description];
    v6 = +[NSString stringWithFormat:@"%@ Recorded PUSH of %@", v3, self->_viewController];
  }

  return v6;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end