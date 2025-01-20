@interface VSJSAlert
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (VSJSAlert)init;
- (void)setActions:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSJSAlert

- (VSJSAlert)init
{
  v3 = [MEMORY[0x263F4B3C8] currentAppContext];
  v9.receiver = self;
  v9.super_class = (Class)VSJSAlert;
  v4 = [(IKJSObject *)&v9 initWithAppContext:v3];

  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)@"Error";

    message = v4->_message;
    v4->_message = (NSString *)&stru_26F361E90;

    actions = v4->_actions;
    v4->_actions = 0;
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

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end