@interface ErrorAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)shouldResetUI;
- (ErrorAction)initWithTitle:(id)a3 message:(id)a4 options:(id)a5;
- (NSArray)options;
- (NSString)message;
- (NSString)title;
- (int)analyticsLaunchActionType;
@end

@implementation ErrorAction

- (ErrorAction)initWithTitle:(id)a3 message:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ErrorAction;
  v11 = [(ErrorAction *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    title = v11->_title;
    v11->_title = v12;

    v14 = (NSString *)[v9 copy];
    message = v11->_message;
    v11->_message = v14;

    objc_storeStrong((id *)&v11->_options, a5);
  }

  return v11;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (BOOL)shouldResetUI
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end