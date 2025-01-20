@interface MTSettingHeaderAction
+ (MTSettingHeaderAction)headerActionWithTitle:(id)a3 actionHandler:(id)a4;
- (MTSettingHeaderAction)initWithTitle:(id)a3 actionHandler:(id)a4;
- (NSString)title;
- (id)actionHandler;
- (void)performAction;
@end

@implementation MTSettingHeaderAction

+ (MTSettingHeaderAction)headerActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithTitle:v7 actionHandler:v6];

  return (MTSettingHeaderAction *)v8;
}

- (MTSettingHeaderAction)initWithTitle:(id)a3 actionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTSettingHeaderAction;
  v9 = [(MTSettingHeaderAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    id v11 = objc_retainBlock(v8);
    id actionHandler = v10->_actionHandler;
    v10->_id actionHandler = v11;
  }
  return v10;
}

- (void)performAction
{
  v3 = [(MTSettingHeaderAction *)self actionHandler];

  if (v3)
  {
    v4 = [(MTSettingHeaderAction *)self actionHandler];
    v4[2]();
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_actionHandler, 0);
}

@end