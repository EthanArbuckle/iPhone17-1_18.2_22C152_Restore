@interface MFCardAction
+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handler:(id)a7;
+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handlerEnabled:(BOOL)a7 handler:(id)a8;
- (BOOL)handlerEnabled;
- (BOOL)shouldDeferDismissHandler;
- (BOOL)shouldDismissCardBeforeExecuteHandler;
- (NSString)accessibilityIdentifer;
- (NSString)imageName;
- (NSString)shortTitle;
- (NSString)title;
- (UIColor)tintColor;
- (id)dismissHandler;
- (id)handler;
- (void)executeHandler;
- (void)executeHandlerIfEnabled;
- (void)setAccessibilityIdentifer:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHandlerEnabled:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setShortTitle:(id)a3;
- (void)setShouldDeferDismissHandler:(BOOL)a3;
- (void)setShouldDismissCardBeforeExecuteHandler:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MFCardAction

+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handler:(id)a7
{
  v7 = [a1 cardActionWithTitle:a3 shortTitle:a4 imageName:a5 tintColor:a6 handlerEnabled:1 handler:a7];
  return v7;
}

+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handlerEnabled:(BOOL)a7 handler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = objc_alloc_init((Class)a1);
  [v19 setTitle:v14];
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = v14;
  }
  [v19 setShortTitle:v20];
  [v19 setImageName:v16];
  [v19 setTintColor:v17];
  [v19 setHandler:v18];
  [v19 setHandlerEnabled:v9];

  return v19;
}

- (void)executeHandlerIfEnabled
{
  if ([(MFCardAction *)self handlerEnabled])
  {
    [(MFCardAction *)self executeHandler];
  }
}

- (void)executeHandler
{
  v3 = [(MFCardAction *)self handler];
  if (v3) {
    v3[2](v3, self);
  }
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)accessibilityIdentifer
{
  return self->_accessibilityIdentifer;
}

- (void)setAccessibilityIdentifer:(id)a3
{
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (void)setShortTitle:(id)a3
{
}

- (BOOL)handlerEnabled
{
  return self->_handlerEnabled;
}

- (void)setHandlerEnabled:(BOOL)a3
{
  self->_handlerEnabled = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)shouldDismissCardBeforeExecuteHandler
{
  return self->_shouldDismissCardBeforeExecuteHandler;
}

- (void)setShouldDismissCardBeforeExecuteHandler:(BOOL)a3
{
  self->_shouldDismissCardBeforeExecuteHandler = a3;
}

- (BOOL)shouldDeferDismissHandler
{
  return self->_shouldDeferDismissHandler;
}

- (void)setShouldDeferDismissHandler:(BOOL)a3
{
  self->_shouldDeferDismissHandler = a3;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end