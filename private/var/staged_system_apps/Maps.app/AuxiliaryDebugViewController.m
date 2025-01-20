@interface AuxiliaryDebugViewController
+ (BOOL)isSearchable;
+ (id)navigationDestinationTitle;
- (AuxiliaryDebugViewController)init;
- (id)delegate;
- (id)navigationDelegate;
- (void)_done;
- (void)segueToViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)willNavigateToSubsequentController:(id)a3;
@end

@implementation AuxiliaryDebugViewController

+ (id)navigationDestinationTitle
{
  return 0;
}

- (AuxiliaryDebugViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AuxiliaryDebugViewController;
  v2 = [(AuxiliaryDebugViewController *)&v7 initWithStyle:1];
  if (v2)
  {
    v3 = [(id)objc_opt_class() navigationDestinationTitle];
    [(AuxiliaryDebugViewController *)v2 setTitle:v3];

    id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"_done"];
    v5 = [(AuxiliaryDebugViewController *)v2 navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  return v2;
}

+ (BOOL)isSearchable
{
  return 0;
}

- (void)segueToViewController:(id)a3
{
  id v4 = a3;
  [(AuxiliaryDebugViewController *)self willNavigateToSubsequentController:v4];
  v5 = [(AuxiliaryDebugViewController *)self navigationDelegate];

  if (v5)
  {
    id v6 = [(AuxiliaryDebugViewController *)self navigationDelegate];
    [v6 debugViewController:self segueToViewController:v4];
  }
  else
  {
    id v6 = [(AuxiliaryDebugViewController *)self navigationController];
    [v6 pushViewController:v4 animated:1];
  }
}

- (void)willNavigateToSubsequentController:(id)a3
{
  id v4 = a3;
  id v5 = [(AuxiliaryDebugViewController *)self delegate];
  [v4 setDelegate:v5];
}

- (void)_done
{
  id v3 = [(AuxiliaryDebugViewController *)self delegate];
  [v3 debugControllerDidFinish:self];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end