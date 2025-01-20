@interface TUITrigger
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (TUIElementActionTriggerHandler)actionHandler;
- (TUITrigger)initWithName:(id)a3;
- (TUITrigger)initWithName:(id)a3 observationMode:(unint64_t)a4;
- (unint64_t)observationMode;
@end

@implementation TUITrigger

- (TUITrigger)initWithName:(id)a3
{
  return [(TUITrigger *)self initWithName:a3 observationMode:0];
}

- (TUITrigger)initWithName:(id)a3 observationMode:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUITrigger;
  v8 = [(TUITrigger *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_observationMode = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (v6)
  {
    id v7 = [(TUITrigger *)self name];
    v8 = [v6 name];
    if ([v7 isEqual:v8])
    {
      id v9 = [(TUITrigger *)self observationMode];
      BOOL v10 = v9 == [v6 observationMode];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)observationMode
{
  return self->_observationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_actionHandler, 0);
}

@end