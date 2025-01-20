@interface SUAlertItemDefinition
- (NSArray)buttons;
- (NSString)message;
- (NSString)title;
- (SUAlertItemDefinition)initWithTitle:(id)a3 message:(id)a4 buttons:(id)a5;
- (void)setButtons:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUAlertItemDefinition

- (SUAlertItemDefinition)initWithTitle:(id)a3 message:(id)a4 buttons:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SUAlertItemDefinition;
  v12 = [(SUAlertItemDefinition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_message, a4);
    objc_storeStrong((id *)&v13->_buttons, a5);
  }

  return v13;
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

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end