@interface BFFNavigationObserver
+ (id)observerWithObserver:(id)a3;
- (BFFNavigationControllerDelegate)observer;
- (void)setObserver:(id)a3;
@end

@implementation BFFNavigationObserver

+ (id)observerWithObserver:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObserver:v3];

  return v4;
}

- (BFFNavigationControllerDelegate)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BFFNavigationControllerDelegate *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end