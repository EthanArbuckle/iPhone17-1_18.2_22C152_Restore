@interface SPUINavigationSwipeRecognizerDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (SPUINavigationController)navigationController;
- (SPUINavigationSwipeRecognizerDelegate)initWithNavigationController:(id)a3;
- (void)setNavigationController:(id)a3;
@end

@implementation SPUINavigationSwipeRecognizerDelegate

- (SPUINavigationSwipeRecognizerDelegate)initWithNavigationController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPUINavigationSwipeRecognizerDelegate;
  v5 = [(SPUINavigationSwipeRecognizerDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SPUINavigationSwipeRecognizerDelegate *)v5 setNavigationController:v4];
  }

  return v6;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [(SPUINavigationSwipeRecognizerDelegate *)self navigationController];
  v5 = [v4 viewControllers];
  if ((unint64_t)[v5 count] > 1)
  {
    char v7 = 1;
  }
  else
  {
    v6 = [(SPUINavigationSwipeRecognizerDelegate *)self navigationController];
    char v7 = objc_msgSend(v6, "sui_isTransitioning");
  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SPUINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (SPUINavigationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end