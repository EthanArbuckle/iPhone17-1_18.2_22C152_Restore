@interface SCRCArgumentHolder
- (BOOL)isEqual:(id)a3;
- (BOOL)process;
- (BOOL)required;
- (NSString)argument;
- (NSString)argumentDescription;
- (NSString)option;
- (SCRCArgumentHolder)init;
- (SCRCArgumentHolder)initWithArgument:(id)a3 option:(id)a4 description:(id)a5 target:(id)a6 action:(SEL)a7 required:(BOOL)a8;
- (SEL)action;
- (id)target;
- (int64_t)compare:(id)a3;
- (void)setArgument:(id)a3;
@end

@implementation SCRCArgumentHolder

- (SCRCArgumentHolder)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCRCArgumentHolder;
  result = [(SCRCArgumentHolder *)&v3 init];
  if (result) {
    result->_action = 0;
  }
  return result;
}

- (SCRCArgumentHolder)initWithArgument:(id)a3 option:(id)a4 description:(id)a5 target:(id)a6 action:(SEL)a7 required:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SCRCArgumentHolder;
  v18 = [(SCRCArgumentHolder *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_argument, a3);
    objc_storeStrong((id *)&v19->_option, a4);
    objc_storeStrong((id *)&v19->_argumentDescription, a5);
    objc_storeWeak(&v19->_target, v17);
    if (a7) {
      SEL v20 = a7;
    }
    else {
      SEL v20 = 0;
    }
    v19->_action = v20;
    v19->_required = a8;
  }

  return v19;
}

- (BOOL)process
{
  uint64_t v3 = [(SCRCArgumentHolder *)self target];
  if (v3 && (v4 = (void *)v3, v5 = [(SCRCArgumentHolder *)self action], v4, v5))
  {
    v6 = [(SCRCArgumentHolder *)self target];
    v7 = [(SCRCArgumentHolder *)self action];
    v8 = [(SCRCArgumentHolder *)self argument];
    v9 = SCRCPerformSelector(v6, v7);
    char v10 = [v9 BOOLValue];
  }
  else
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SCRCArgumentHolder required](self, "required") ^ 1);
    char v10 = [v6 BOOLValue];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(SCRCArgumentHolder *)self option];
  v6 = [v4 option];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(SCRCArgumentHolder *)self option];
  v6 = [v4 option];

  int64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)argument
{
  return self->_argument;
}

- (void)setArgument:(id)a3
{
}

- (NSString)argumentDescription
{
  return self->_argumentDescription;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (BOOL)required
{
  return self->_required;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_argumentDescription, 0);
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end