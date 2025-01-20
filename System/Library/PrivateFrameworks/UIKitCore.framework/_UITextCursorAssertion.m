@interface _UITextCursorAssertion
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)reason;
- (UITextCursorAssertionController)controller;
- (id)_initWithReason:(id)a3 options:(unint64_t)a4 controller:(id)a5 userInfo:(id)a6;
- (unint64_t)options;
- (void)dealloc;
- (void)invalidate;
- (void)setController:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReason:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _UITextCursorAssertion

- (id)_initWithReason:(id)a3 options:(unint64_t)a4 controller:(id)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_UITextCursorAssertion;
  v14 = [(_UITextCursorAssertion *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_reason, a3);
    v15->_options = a4;
    objc_storeWeak((id *)&v15->_controller, v12);
    objc_storeStrong((id *)&v15->_userInfo, a6);
  }

  return v15;
}

- (void)dealloc
{
  [(_UITextCursorAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UITextCursorAssertion;
  [(_UITextCursorAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained _endTrackingAssertion:self];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p %lux %@>", v5, self, self->_options, self->_reason];

  return (NSString *)v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (UITextCursorAssertionController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (UITextCursorAssertionController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end