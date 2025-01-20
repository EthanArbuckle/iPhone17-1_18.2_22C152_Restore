@interface _UIAlertControllerActionViewInterfaceAction
+ (id)actionWithAlertControllerActionView:(id)a3;
- (BOOL)valid;
- (UIAlertAction)underlyingAlertAction;
- (id)classificationTitle;
- (id)leadingImage;
- (int64_t)_typeForDeterminingViewRepresentation;
- (int64_t)type;
- (void)_action:(id)a3 changedToBePreferred:(BOOL)a4;
- (void)_action:(id)a3 changedToEnabled:(BOOL)a4;
- (void)_action:(id)a3 changedToTitle:(id)a4;
- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4;
- (void)_action:(id)a3 updatedImageTintColor:(id)a4;
- (void)_action:(id)a3 updatedTitleTextColor:(id)a4;
- (void)_initializeStateFromUnderlyingAlertAction;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _UIAlertControllerActionViewInterfaceAction

+ (id)actionWithAlertControllerActionView:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIAlertControllerActionViewInterfaceAction;
  v3 = objc_msgSendSuper2(&v5, sel_actionWithCustomContentView_handler_, a3, 0);
  [v3 _initializeStateFromUnderlyingAlertAction];
  return v3;
}

- (void)_initializeStateFromUnderlyingAlertAction
{
  id v8 = [(_UIAlertControllerActionViewInterfaceAction *)self alertControllerActionView];
  v3 = [v8 action];
  underlyingAlertAction = self->_underlyingAlertAction;
  self->_underlyingAlertAction = v3;

  [(UIAlertAction *)self->_underlyingAlertAction _setInterfaceActionRepresentation:self];
  [(UIInterfaceAction *)self setEnabled:[(UIAlertAction *)self->_underlyingAlertAction isEnabled]];
  objc_super v5 = [(UIAlertAction *)self->_underlyingAlertAction title];
  [(UIInterfaceAction *)self setTitle:v5];

  [(UIInterfaceAction *)self setTitleAlignment:[(UIAlertAction *)self->_underlyingAlertAction _titleTextAlignment]];
  v6 = [(UIAlertAction *)self->_underlyingAlertAction _titleTextColor];
  [(UIInterfaceAction *)self _setTitleTextColor:v6];

  v7 = [(UIAlertAction *)self->_underlyingAlertAction _imageTintColor];
  [(UIInterfaceAction *)self _setImageTintColor:v7];

  [(UIInterfaceAction *)self _setIsPreferred:[(UIAlertAction *)self->_underlyingAlertAction _isPreferred]];
  [v8 underlyingInterfaceActionRepresentationDidChange];
  self->_valid = 1;
}

- (void)invalidate
{
  self->_valid = 0;
  id v5 = [(_UIAlertControllerActionViewInterfaceAction *)self underlyingAlertAction];
  v3 = [v5 _interfaceActionRepresentation];

  if (v3 == self) {
    [v5 _setInterfaceActionRepresentation:0];
  }
  underlyingAlertAction = self->_underlyingAlertAction;
  self->_underlyingAlertAction = 0;
}

- (void)dealloc
{
  [(_UIAlertControllerActionViewInterfaceAction *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerActionViewInterfaceAction;
  [(_UIAlertControllerActionViewInterfaceAction *)&v3 dealloc];
}

- (id)classificationTitle
{
  v2 = [(_UIAlertControllerActionViewInterfaceAction *)self underlyingAlertAction];
  objc_super v3 = [v2 _descriptiveText];

  return v3;
}

- (id)leadingImage
{
  v2 = [(_UIAlertControllerActionViewInterfaceAction *)self underlyingAlertAction];
  objc_super v3 = [v2 image];

  return v3;
}

- (int64_t)_typeForDeterminingViewRepresentation
{
  return 100;
}

- (int64_t)type
{
  v2 = [(_UIAlertControllerActionViewInterfaceAction *)self underlyingAlertAction];
  uint64_t v3 = [v2 style];

  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (void)_action:(id)a3 changedToTitle:(id)a4
{
}

- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4
{
}

- (void)_action:(id)a3 changedToEnabled:(BOOL)a4
{
}

- (void)_action:(id)a3 changedToBePreferred:(BOOL)a4
{
}

- (void)_action:(id)a3 updatedImageTintColor:(id)a4
{
}

- (void)_action:(id)a3 updatedTitleTextColor:(id)a4
{
}

- (UIAlertAction)underlyingAlertAction
{
  return self->_underlyingAlertAction;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void).cxx_destruct
{
}

@end