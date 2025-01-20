@interface PUScreenRoutePickerViewController
- (PUScreenRoutePickerViewController)initWithCompletionBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PUScreenRoutePickerViewController

- (void).cxx_destruct
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUScreenRoutePickerViewController;
  [(PUScreenRoutePickerViewController *)&v6 viewDidDisappear:a3];
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    id v5 = self->_completionBlock;
    self->_completionBlock = 0;
  }
}

- (PUScreenRoutePickerViewController)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUScreenRoutePickerViewController;
  id v5 = [(_UIScreenRoutePickerViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id completionBlock = v5->_completionBlock;
    v5->_id completionBlock = (id)v6;
  }
  return v5;
}

@end