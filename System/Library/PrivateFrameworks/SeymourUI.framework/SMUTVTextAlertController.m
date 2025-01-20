@interface SMUTVTextAlertController
- (SMUTVTextAlertController)initWithTitle:(id)a3 text:(id)a4;
- (UIViewController)viewController;
@end

@implementation SMUTVTextAlertController

- (SMUTVTextAlertController)initWithTitle:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SMUTVTextAlertController;
  v8 = [(SMUTVTextAlertController *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    alertController = v8->_alertController;
    v8->_alertController = (UIAlertController *)v9;
  }
  return v8;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_alertController;
}

- (void).cxx_destruct
{
}

@end