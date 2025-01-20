@interface UISnapshotModalViewController
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (UISnapshotModalViewController)initWithInterfaceOrientation:(int64_t)a3;
- (UIViewController)disappearingViewController;
- (void)setDisappearingViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UISnapshotModalViewController

- (UISnapshotModalViewController)initWithInterfaceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISnapshotModalViewController;
  result = [(UIViewController *)&v5 init];
  if (result) {
    result->_interfaceOrientation = a3;
  }
  return result;
}

- (void)setDisappearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingViewController, a3);
  id v7 = a3;
  objc_super v5 = [v7 navigationController];
  parentController = self->_parentController;
  self->_parentController = v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISnapshotModalViewController;
  -[UIViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    parentController = self->_parentController;
    if (parentController) {
      [(UIViewController *)parentController _addChildViewController:self->_disappearingViewController];
    }
    [(UIViewController *)self->_disappearingViewController willMoveToParentViewController:0];
    -[UIViewController __viewWillDisappear:]((uint64_t)self->_disappearingViewController, v3);
    v6 = self->_parentController;
    if (v6) {
      [(UIViewController *)v6 _removeChildViewController:self->_disappearingViewController];
    }
    goto LABEL_8;
  }
  if (self) {
LABEL_8:
  }
    -[UIViewController _invalidatePreferences:excluding:](self, -1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISnapshotModalViewController;
  -[UIViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_super v5 = [(UISnapshotModalViewController *)self disappearingViewController];
    -[UIViewController __viewDidDisappear:]((uint64_t)v5, v3);

    v6 = [(UISnapshotModalViewController *)self disappearingViewController];
    [v6 didMoveToParentViewController:0];
  }
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  return self->_interfaceOrientation == a3;
}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
}

@end