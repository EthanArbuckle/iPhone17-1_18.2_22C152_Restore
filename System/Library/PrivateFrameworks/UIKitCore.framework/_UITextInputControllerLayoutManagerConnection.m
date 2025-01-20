@interface _UITextInputControllerLayoutManagerConnection
- (UITextInputController)textInputController;
- (_UITextInputControllerLayoutManagerConnection)initWithTextInputController:(id)a3;
- (void)dealloc;
- (void)setTextInputController:(id)a3;
@end

@implementation _UITextInputControllerLayoutManagerConnection

- (_UITextInputControllerLayoutManagerConnection)initWithTextInputController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITextInputControllerLayoutManagerConnection;
  v6 = [(_UITextInputControllerLayoutManagerConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textInputController, a3);
  }

  return v7;
}

- (UITextInputController)textInputController
{
  return self->_textInputController;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(UITextInputController *)self->_textInputController _detachFromLayoutManager];
  v3.receiver = self;
  v3.super_class = (Class)_UITextInputControllerLayoutManagerConnection;
  [(_UITextInputControllerLayoutManagerConnection *)&v3 dealloc];
}

- (void)setTextInputController:(id)a3
{
}

@end