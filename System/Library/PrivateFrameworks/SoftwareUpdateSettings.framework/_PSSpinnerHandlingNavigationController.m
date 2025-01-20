@interface _PSSpinnerHandlingNavigationController
- (_PSSpinnerHandlingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_removeSpinnerViewControllerIfNeeded;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation _PSSpinnerHandlingNavigationController

- (_PSSpinnerHandlingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)_PSSpinnerHandlingNavigationController;
  v11 = [(_PSSpinnerHandlingNavigationController *)&v8 initWithNibName:location[0] bundle:v9];
  objc_storeStrong((id *)&v11, v11);
  if (v11) {
    [(_PSSpinnerHandlingNavigationController *)v11 setDelegate:v11];
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_removeSpinnerViewControllerIfNeeded
{
  v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  id v3 = (id)[(_PSSpinnerHandlingNavigationController *)self viewControllers];
  char v8 = 0;
  char v6 = 0;
  char isKindOfClass = 0;
  if ((unint64_t)[v3 count] > 1)
  {
    id v9 = (id)[(_PSSpinnerHandlingNavigationController *)v12 viewControllers];
    char v8 = 1;
    id v7 = (id)[v9 firstObject];
    char v6 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v6) {

  }
  if (v8) {
  char v10 = isKindOfClass & 1;
  }
  if (isKindOfClass)
  {
    id v2 = (id)[(_PSSpinnerHandlingNavigationController *)v12 viewControllers];
    id v5 = (id)[v2 mutableCopy];

    [v5 removeObjectAtIndex:0];
    [(_PSSpinnerHandlingNavigationController *)v12 setViewControllers:v5 animated:0];
    objc_storeStrong(&v5, 0);
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  char v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  id v5 = (id)[(_PSSpinnerHandlingNavigationController *)v10 topViewController];
  objc_opt_class();
  char isKindOfClass = 0;
  if (objc_opt_isKindOfClass())
  {
    getRUIPageClass();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  if (isKindOfClass)
  {
    BOOL v8 = 0;
    [(_PSSpinnerHandlingNavigationController *)v10 setToolbarHidden:1];
  }
  v7.receiver = v10;
  v7.super_class = (Class)_PSSpinnerHandlingNavigationController;
  [(_PSSpinnerHandlingNavigationController *)&v7 pushViewController:location[0] animated:v8];
  objc_storeStrong(location, 0);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  [(_PSSpinnerHandlingNavigationController *)v8 _removeSpinnerViewControllerIfNeeded];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

@end