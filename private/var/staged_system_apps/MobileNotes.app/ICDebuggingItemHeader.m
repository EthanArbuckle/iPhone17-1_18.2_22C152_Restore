@interface ICDebuggingItemHeader
- (NSString)title;
- (UIButton)clearButton;
- (id)clearButtonHandler;
- (void)setClearButton:(id)a3;
- (void)setClearButtonHandler:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation ICDebuggingItemHeader

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);

  [(ICDebuggingItemHeader *)self setNeedsUpdateConfiguration];
}

- (void)setClearButtonHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id clearButtonHandler = self->_clearButtonHandler;
  self->_id clearButtonHandler = v4;

  [(ICDebuggingItemHeader *)self setNeedsUpdateConfiguration];
}

- (void)updateConfigurationUsingState:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICDebuggingItemHeader;
  [(ICDebuggingItemHeader *)&v11 updateConfigurationUsingState:a3];
  id v4 = +[UIListContentConfiguration groupedHeaderConfiguration];
  v5 = [(ICDebuggingItemHeader *)self title];
  [v4 setText:v5];

  v6 = [(ICDebuggingItemHeader *)self clearButtonHandler];

  if (v6)
  {
    id v7 = objc_alloc((Class)UICellAccessoryCustomView);
    v8 = [(ICDebuggingItemHeader *)self clearButton];
    id v9 = [v7 initWithCustomView:v8 placement:1];

    id v12 = v9;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [(ICDebuggingItemHeader *)self setAccessories:v10];
  }
  else
  {
    [(ICDebuggingItemHeader *)self setAccessories:&__NSArray0__struct];
  }
  [(ICDebuggingItemHeader *)self setContentConfiguration:v4];
}

- (UIButton)clearButton
{
  clearButton = self->_clearButton;
  if (clearButton)
  {
    v3 = clearButton;
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C17E8;
    v10[3] = &unk_100627268;
    v10[4] = self;
    v5 = +[UIAction actionWithHandler:v10];
    v6 = +[UIButtonConfiguration plainButtonConfiguration];
    [v6 setTitle:@"Clear"];
    [v6 setButtonSize:2];
    id v7 = +[UIButton buttonWithConfiguration:v6 primaryAction:v5];
    v8 = self->_clearButton;
    self->_clearButton = v7;

    v3 = self->_clearButton;
  }

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (id)clearButtonHandler
{
  return self->_clearButtonHandler;
}

- (void)setClearButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong(&self->_clearButtonHandler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end