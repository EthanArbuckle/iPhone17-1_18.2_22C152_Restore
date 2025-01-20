@interface UIKBAlertController
- (UIKBAlertControllerDelegate)kbDelegate;
- (void)setKbDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation UIKBAlertController

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBAlertController;
  [(UIAlertController *)&v6 viewDidDisappear:a3];
  v4 = [(UIKBAlertController *)self kbDelegate];

  if (v4)
  {
    v5 = [(UIKBAlertController *)self kbDelegate];
    [v5 alertDidDismiss];
  }
}

- (UIKBAlertControllerDelegate)kbDelegate
{
  return self->_kbDelegate;
}

- (void)setKbDelegate:(id)a3
{
  self->_kbDelegate = (UIKBAlertControllerDelegate *)a3;
}

@end