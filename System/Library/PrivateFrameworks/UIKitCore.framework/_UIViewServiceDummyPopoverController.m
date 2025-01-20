@interface _UIViewServiceDummyPopoverController
+ (Class)_popoverViewClass;
- (BOOL)_attemptsToAvoidKeyboard;
- (_UIViewServiceDummyPopoverControllerDelegate)dummyPopoverControllerDelegate;
- (void)_popoverView:(id)a3 didSetUseToolbarShine:(BOOL)a4;
- (void)_super_setPopoverContentSize:(CGSize)a3;
- (void)setDummyPopoverControllerDelegate:(id)a3;
- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4;
@end

@implementation _UIViewServiceDummyPopoverController

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
}

- (void)_popoverView:(id)a3 didSetUseToolbarShine:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIPopoverController *)self popoverView];

  if (v7 == v6)
  {
    id v8 = [(_UIViewServiceDummyPopoverController *)self dummyPopoverControllerDelegate];
    if (objc_opt_respondsToSelector()) {
      [v8 dummyPopoverController:self popoverViewDidSetUseToolbarShine:v4];
    }
  }
}

- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id v8 = [(_UIViewServiceDummyPopoverController *)self dummyPopoverControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "dummyPopoverController:didChangeContentSize:animated:", self, v4, width, height);
  }
  v9.receiver = self;
  v9.super_class = (Class)_UIViewServiceDummyPopoverController;
  -[UIPopoverController setPopoverContentSize:animated:](&v9, sel_setPopoverContentSize_animated_, v4, width, height);
}

- (BOOL)_attemptsToAvoidKeyboard
{
  return 0;
}

- (void)_super_setPopoverContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceDummyPopoverController;
  -[UIPopoverController setPopoverContentSize:animated:](&v3, sel_setPopoverContentSize_animated_, 0, a3.width, a3.height);
}

- (_UIViewServiceDummyPopoverControllerDelegate)dummyPopoverControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dummyPopoverControllerDelegate);
  return (_UIViewServiceDummyPopoverControllerDelegate *)WeakRetained;
}

- (void)setDummyPopoverControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end