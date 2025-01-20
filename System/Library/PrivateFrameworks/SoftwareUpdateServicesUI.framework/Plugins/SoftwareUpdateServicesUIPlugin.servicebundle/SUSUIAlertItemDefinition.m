@interface SUSUIAlertItemDefinition
- (NSArray)buttons;
- (NSString)message;
- (NSString)title;
- (SUSUIAlertItemDefinition)init;
- (SUSUIAlertItemDefinition)initWithTitle:(id)a3 message:(id)a4 buttons:(id)a5;
- (void)setButtons:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUSUIAlertItemDefinition

- (SUSUIAlertItemDefinition)init
{
  v4 = 0;
  v4 = -[SUSUIAlertItemDefinition initWithTitle:message:buttons:](self, "initWithTitle:message:buttons:", 0, 0);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (SUSUIAlertItemDefinition)initWithTitle:(id)a3 message:(id)a4 buttons:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSUIAlertItemDefinition;
  v10 = [(SUSUIAlertItemDefinition *)&v11 init];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_title, location[0]);
    objc_storeStrong((id *)&v15->_message, v13);
    objc_storeStrong((id *)&v15->_buttons, v12);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
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
}

@end