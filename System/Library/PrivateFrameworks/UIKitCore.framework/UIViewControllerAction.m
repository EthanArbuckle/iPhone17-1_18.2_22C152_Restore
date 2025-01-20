@interface UIViewControllerAction
- (UIViewControllerAction)initWithViewController:(id)a3 name:(id)a4 transition:(int)a5;
@end

@implementation UIViewControllerAction

- (UIViewControllerAction)initWithViewController:(id)a3 name:(id)a4 transition:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIViewControllerAction;
  v10 = [(UIViewControllerAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v11->_name, a4);
    v11->_transition = a5;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end