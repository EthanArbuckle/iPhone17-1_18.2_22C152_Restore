@interface VSJSAlertAction
- (JSValue)callback;
- (NSString)style;
- (NSString)title;
- (VSJSAlertAction)init;
- (void)setCallback:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSJSAlertAction

- (VSJSAlertAction)init
{
  v3 = [MEMORY[0x263F4B3C8] currentAppContext];
  v9.receiver = self;
  v9.super_class = (Class)VSJSAlertAction;
  v4 = [(IKJSObject *)&v9 initWithAppContext:v3];

  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)@"OK";

    style = v4->_style;
    v4->_style = (NSString *)@"default";

    callback = v4->_callback;
    v4->_callback = 0;
  }
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (JSValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end