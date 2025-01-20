@interface JournalPresentationLayer
- (JournalPresentationLayer)init;
- (NSMutableArray)pushedViewControllers;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (id)description;
- (void)setPresentedViewController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPushedViewControllers:(id)a3;
@end

@implementation JournalPresentationLayer

- (JournalPresentationLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)JournalPresentationLayer;
  v2 = [(JournalPresentationLayer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pushedViewControllers = v2->_pushedViewControllers;
    v2->_pushedViewControllers = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)JournalPresentationLayer;
  uint64_t v3 = [(JournalPresentationLayer *)&v8 description];
  presentedViewController = self->_presentedViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_super v6 = +[NSString stringWithFormat:@"%@ presentedViewController = %@ presentingViewController = %@ pushedViewControllers = %@", v3, presentedViewController, WeakRetained, self->_pushedViewControllers];

  return v6;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
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

- (NSMutableArray)pushedViewControllers
{
  return self->_pushedViewControllers;
}

- (void)setPushedViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushedViewControllers, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end