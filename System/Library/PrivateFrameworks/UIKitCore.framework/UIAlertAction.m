@interface UIAlertAction
+ (UIAlertAction)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void *)handler;
+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4;
+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)_actionWithTitle:(id)a3 descriptiveText:(id)a4 image:(id)a5 style:(int64_t)a6 handler:(id)a7 shouldDismissHandler:(id)a8;
+ (id)_actionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6 shouldDismissHandler:(id)a7;
- (BOOL)_isChecked;
- (BOOL)_isPreferred;
- (BOOL)isEnabled;
- (NSString)_descriptiveText;
- (NSString)_keyCommandInput;
- (NSString)title;
- (UIAlertActionStyle)style;
- (UIAlertController)_alertController;
- (UIImage)image;
- (UIViewController)_contentViewController;
- (_UIAlertActionMutablePropertyObservering)_interfaceActionRepresentation;
- (_UIAlertActionViewRepresentation)_representer;
- (id)_imageTintColor;
- (id)_titleTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)handler;
- (id)shouldDismissHandler;
- (id)simpleHandler;
- (int64_t)_keyCommandModifierFlags;
- (int64_t)_titleTextAlignment;
- (void)_didAddContentViewController;
- (void)_setAlertController:(id)a3;
- (void)_setChecked:(BOOL)a3;
- (void)_setContentViewController:(id)a3;
- (void)_setDescriptiveText:(id)a3;
- (void)_setImageTintColor:(id)a3;
- (void)_setInterfaceActionRepresentation:(id)a3;
- (void)_setIsPreferred:(BOOL)a3;
- (void)_setKeyCommandInput:(id)a3;
- (void)_setKeyCommandInput:(id)a3 modifierFlags:(int64_t)a4;
- (void)_setKeyCommandModifierFlags:(int64_t)a3;
- (void)_setRepresenter:(id)a3;
- (void)_setTitleTextAlignment:(int64_t)a3;
- (void)_setTitleTextColor:(id)a3;
- (void)_willAddContentViewController;
- (void)setEnabled:(BOOL)enabled;
- (void)setHandler:(id)a3;
- (void)setImage:(id)a3;
- (void)setShouldDismissHandler:(id)a3;
- (void)setSimpleHandler:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIAlertAction

+ (id)_actionWithTitle:(id)a3 descriptiveText:(id)a4 image:(id)a5 style:(int64_t)a6 handler:(id)a7 shouldDismissHandler:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  v20 = +[UIDevice currentDevice];
  v21 = _NSStringFromUIUserInterfaceIdiom([v20 userInterfaceIdiom]);

  if (!v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = v25;
    v27 = @"UIAlertActionStyleDefault";
    if (a6 == 1) {
      v27 = @"UIAlertActionStyleCancel";
    }
    if (a6 == 2) {
      v27 = @"UIAlertActionStyleDestructive";
    }
    [v25 handleFailureInMethod:a2, a1, @"UIAlertAction.m", 42, @"Actions added to UIAlertController of style %@ must have a title when running in %@", v27, v21 object file lineNumber description];
  }
  id v22 = objc_alloc_init((Class)objc_opt_class());
  if ((unint64_t)[v15 length] >= 0x3E8)
  {
    uint64_t v23 = [v15 substringToIndex:999];

    id v15 = (id)v23;
  }
  [v22 setTitle:v15];
  [v22 _setDescriptiveText:v19];

  [v22 _setTitleTextAlignment:1];
  [v22 setImage:v18];

  [v22 setStyle:a6];
  [v22 setHandler:v17];

  [v22 setShouldDismissHandler:v16];
  [v22 setEnabled:1];
  [v22 _setChecked:0];
  [v22 _setIsPreferred:0];

  return v22;
}

+ (id)_actionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6 shouldDismissHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(id)objc_opt_class() _actionWithTitle:v14 descriptiveText:0 image:v13 style:a5 handler:v12 shouldDismissHandler:v11];

  return v15;
}

+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4
{
  return (id)[a1 _actionWithContentViewController:a3 style:a4 handler:0];
}

+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  [v9 _setContentViewController:v8];

  [v9 setStyle:a4];
  [v9 setEnabled:1];
  [v9 _setChecked:0];
  [v9 _setIsPreferred:0];
  [v9 setHandler:v7];

  return v9;
}

+ (UIAlertAction)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void *)handler
{
  id v7 = handler;
  id v8 = title;
  id v9 = [(id)objc_opt_class() _actionWithTitle:v8 image:0 style:style handler:v7 shouldDismissHandler:0];

  return (UIAlertAction *)v9;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  if ((unint64_t)[v10 length] < 0x3E8)
  {
    v5 = v10;
  }
  else
  {
    uint64_t v4 = [v10 substringToIndex:999];

    v5 = (void *)v4;
  }
  id v11 = v5;
  if (([v5 isEqualToString:self->_title] & 1) == 0)
  {
    v6 = (NSString *)[v11 copy];
    title = self->_title;
    self->_title = v6;

    id v8 = [(UIAlertAction *)self _interfaceActionRepresentation];
    [v8 _action:self changedToTitle:self->_title];

    id v9 = [(UIAlertAction *)self _representer];
    [v9 _action:self changedToTitle:self->_title];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UIAlertAction *)self title];
  [v4 setTitle:v5];

  objc_msgSend(v4, "setStyle:", -[UIAlertAction style](self, "style"));
  v6 = [(UIAlertAction *)self handler];
  [v4 setHandler:v6];

  objc_msgSend(v4, "setEnabled:", -[UIAlertAction isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "_setIsPreferred:", -[UIAlertAction _isPreferred](self, "_isPreferred"));
  id v7 = [(UIAlertAction *)self simpleHandler];
  [v4 setSimpleHandler:v7];

  id v8 = [(UIAlertAction *)self shouldDismissHandler];
  [v4 setShouldDismissHandler:v8];

  objc_msgSend(v4, "_setChecked:", -[UIAlertAction _isChecked](self, "_isChecked"));
  id v9 = [(UIAlertAction *)self _descriptiveText];
  [v4 _setDescriptiveText:v9];

  objc_msgSend(v4, "_setTitleTextAlignment:", -[UIAlertAction _titleTextAlignment](self, "_titleTextAlignment"));
  id v10 = [(UIAlertAction *)self image];
  [v4 setImage:v10];

  id v11 = [(UIAlertAction *)self _imageTintColor];
  [v4 _setImageTintColor:v11];

  id v12 = [(UIAlertAction *)self _titleTextColor];
  [v4 _setTitleTextColor:v12];

  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UIAlertAction *)self title];
  v6 = [(UIAlertAction *)self _descriptiveText];
  id v7 = [(UIAlertAction *)self image];
  id v8 = [v3 stringWithFormat:@"<%@: %p Title = \"%@\" Descriptive = \"%@\" Image = %p>", v4, self, v5, v6, v7];

  return v8;
}

- (int64_t)_titleTextAlignment
{
  return self->_titleTextAlignment;
}

- (void)_setTitleTextAlignment:(int64_t)a3
{
  self->_titleTextAlignment = a3;
  uint64_t v4 = [(UIAlertAction *)self _interfaceActionRepresentation];
  [v4 _action:self changedToTitleTextAlignment:self->_titleTextAlignment];

  id v5 = [(UIAlertAction *)self _representer];
  [v5 _action:self changedToTitleTextAlignment:self->_titleTextAlignment];
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  self->_enabled = enabled;
  id v5 = [(UIAlertAction *)self _interfaceActionRepresentation];
  [v5 _action:self changedToEnabled:v3];

  id v6 = [(UIAlertAction *)self _representer];
  [v6 _action:self changedToEnabled:self->_titleTextAlignment != 0];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_setChecked:(BOOL)a3
{
  self->_checked = a3;
  uint64_t v4 = [(UIAlertAction *)self _interfaceActionRepresentation];
  [v4 _action:self changedToChecked:self->_checked];

  id v5 = [(UIAlertAction *)self _representer];
  [v5 _action:self changedToChecked:self->_checked];
}

- (BOOL)_isChecked
{
  return self->_checked;
}

- (void)_setIsPreferred:(BOOL)a3
{
  if (self->_isPreferred != a3)
  {
    self->_isPreferred = a3;
    uint64_t v4 = [(UIAlertAction *)self _interfaceActionRepresentation];
    [v4 _action:self changedToBePreferred:self->_isPreferred];

    id v5 = [(UIAlertAction *)self _representer];
    [v5 _action:self changedToBePreferred:self->_isPreferred];
  }
}

- (BOOL)_isPreferred
{
  return self->_isPreferred;
}

- (void)_setImageTintColor:(id)a3
{
  id v7 = (UIColor *)a3;
  if (self->_imageTintColor != v7)
  {
    objc_storeStrong((id *)&self->_imageTintColor, a3);
    id v5 = [(UIAlertAction *)self _interfaceActionRepresentation];
    [v5 _action:self updatedImageTintColor:v7];

    id v6 = [(UIAlertAction *)self _representer];
    [v6 _action:self updatedImageTintColor:v7];
  }
}

- (id)_imageTintColor
{
  return self->_imageTintColor;
}

- (void)_setTitleTextColor:(id)a3
{
  id v7 = (UIColor *)a3;
  if (self->_titleTextColor != v7)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    id v5 = [(UIAlertAction *)self _interfaceActionRepresentation];
    [v5 _action:self updatedTitleTextColor:v7];

    id v6 = [(UIAlertAction *)self _representer];
    [v6 _action:self updatedTitleTextColor:v7];
  }
}

- (id)_titleTextColor
{
  return self->_titleTextColor;
}

- (void)_willAddContentViewController
{
  id v4 = [(UIAlertAction *)self _contentViewController];
  BOOL v3 = [(UIAlertAction *)self _alertController];
  [v4 willMoveToParentViewController:v3];
  [v3 addChildViewController:v4];
}

- (void)_didAddContentViewController
{
  id v4 = [(UIAlertAction *)self _contentViewController];
  BOOL v3 = [(UIAlertAction *)self _alertController];
  [v4 didMoveToParentViewController:v3];
}

- (void)_setKeyCommandInput:(id)a3 modifierFlags:(int64_t)a4
{
  id v7 = a3;
  if ([v7 length])
  {
    [(UIAlertAction *)self _setKeyCommandInput:v7];
    [(UIAlertAction *)self _setKeyCommandModifierFlags:a4];
    id v6 = [(UIAlertAction *)self _alertController];
    [v6 _action:self changedToKeyCommandWithInput:v7 modifierFlags:a4];
  }
}

- (NSString)title
{
  return self->_title;
}

- (UIAlertActionStyle)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)simpleHandler
{
  return self->_simpleHandler;
}

- (void)setSimpleHandler:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (id)shouldDismissHandler
{
  return self->_shouldDismissHandler;
}

- (void)setShouldDismissHandler:(id)a3
{
}

- (NSString)_descriptiveText
{
  return self->__descriptiveText;
}

- (void)_setDescriptiveText:(id)a3
{
}

- (UIViewController)_contentViewController
{
  return self->_contentViewController;
}

- (void)_setContentViewController:(id)a3
{
}

- (NSString)_keyCommandInput
{
  return self->_keyCommandInput;
}

- (void)_setKeyCommandInput:(id)a3
{
}

- (int64_t)_keyCommandModifierFlags
{
  return self->_keyCommandModifierFlags;
}

- (void)_setKeyCommandModifierFlags:(int64_t)a3
{
  self->_keyCommandModifierFlags = a3;
}

- (_UIAlertActionMutablePropertyObservering)_interfaceActionRepresentation
{
  return self->__interfaceActionRepresentation;
}

- (void)_setInterfaceActionRepresentation:(id)a3
{
  self->__interfaceActionRepresentation = (_UIAlertActionMutablePropertyObservering *)a3;
}

- (UIAlertController)_alertController
{
  return self->__alertController;
}

- (void)_setAlertController:(id)a3
{
  self->__alertController = (UIAlertController *)a3;
}

- (_UIAlertActionViewRepresentation)_representer
{
  return self->__representer;
}

- (void)_setRepresenter:(id)a3
{
  self->__representer = (_UIAlertActionViewRepresentation *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommandInput, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->__descriptiveText, 0);
  objc_storeStrong(&self->_shouldDismissHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_simpleHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end