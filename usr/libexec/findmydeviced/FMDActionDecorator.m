@interface FMDActionDecorator
- (Action)innerAction;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDActionDecorator)initWithAction:(id)a3 usingCompletion:(id)a4;
- (NSString)description;
- (id)actionType;
- (id)completion;
- (void)runWithCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setInnerAction:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDActionDecorator

- (FMDActionDecorator)initWithAction:(id)a3 usingCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDActionDecorator;
  v8 = [(FMDActionDecorator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FMDActionDecorator *)v8 setInnerAction:v6];
    [(FMDActionDecorator *)v9 setCompletion:v7];
  }

  return v9;
}

- (id)actionType
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_1000596B0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMDActionDecorator *)self innerAction];
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ run inner action - %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  id v7 = [(FMDActionDecorator *)self innerAction];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006E430;
  v9[3] = &unk_1002D9DD0;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [v7 runWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  v5 = [(FMDActionDecorator *)self innerAction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(FMDActionDecorator *)self innerAction];
    unsigned __int8 v8 = [v7 shouldCancelAction:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)willCancelAction
{
  v3 = [(FMDActionDecorator *)self innerAction];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = sub_1000596B0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = [(FMDActionDecorator *)self innerAction];
      int v8 = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ will cancel inner action - %@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [(FMDActionDecorator *)self innerAction];
    [v7 willCancelAction];
  }
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4 = a3;
  v5 = [(FMDActionDecorator *)self innerAction];
  unsigned __int8 v6 = [v5 shouldWaitForAction:v4];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(FMDActionDecorator *)self innerAction];
  v5 = +[NSString stringWithFormat:@"%@-%p:%@", v3, self, v4];

  return (NSString *)v5;
}

- (Action)innerAction
{
  return self->_innerAction;
}

- (void)setInnerAction:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_innerAction, 0);
}

@end