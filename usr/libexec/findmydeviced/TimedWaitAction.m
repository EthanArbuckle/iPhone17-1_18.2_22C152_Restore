@interface TimedWaitAction
- (Action)embeddedAction;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDispatchTimer)timer;
- (NSDate)executionDate;
- (NSString)description;
- (TimedWaitAction)initWithAction:(id)a3 executeAt:(id)a4;
- (id)actionType;
- (void)runWithCompletion:(id)a3;
- (void)setEmbeddedAction:(id)a3;
- (void)setExecutionDate:(id)a3;
- (void)setTimer:(id)a3;
- (void)willCancelAction;
@end

@implementation TimedWaitAction

- (TimedWaitAction)initWithAction:(id)a3 executeAt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TimedWaitAction;
  v8 = [(TimedWaitAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TimedWaitAction *)v8 setEmbeddedAction:v6];
    [(TimedWaitAction *)v9 setExecutionDate:v7];
  }

  return v9;
}

- (NSString)description
{
  v3 = [(TimedWaitAction *)self executionDate];
  v4 = +[NSDate date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  id v7 = [(TimedWaitAction *)self embeddedAction];
  v8 = +[NSString stringWithFormat:@"TimedWait(0x%p)-%ld-%@", self, (uint64_t)v6, v7];

  return (NSString *)v8;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(TimedWaitAction *)self executionDate];
  double v6 = +[NSDate date];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  id v9 = objc_alloc((Class)FMDispatchTimer);
  v10 = dispatch_get_global_queue(0, 0);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_10007994C;
  v17 = &unk_1002D97B0;
  v18 = self;
  id v19 = v4;
  id v11 = v4;
  id v12 = [v9 initWithQueue:v10 timeout:&v14 completion:v8];
  -[TimedWaitAction setTimer:](self, "setTimer:", v12, v14, v15, v16, v17, v18);

  v13 = [(TimedWaitAction *)self timer];
  [v13 start];
}

- (id)actionType
{
  return @"TimedWaitAction";
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  double v5 = [(TimedWaitAction *)self embeddedAction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(TimedWaitAction *)self embeddedAction];
    unsigned __int8 v8 = [v7 shouldCancelAction:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4 = a3;
  double v5 = [(TimedWaitAction *)self embeddedAction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(TimedWaitAction *)self embeddedAction];
    unsigned __int8 v8 = [v7 shouldWaitForAction:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)willCancelAction
{
  v3 = [(TimedWaitAction *)self timer];
  [v3 cancel];

  [(TimedWaitAction *)self setTimer:0];
  id v4 = [(TimedWaitAction *)self embeddedAction];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(TimedWaitAction *)self embeddedAction];
    [v6 willCancelAction];
  }
}

- (Action)embeddedAction
{
  return self->_embeddedAction;
}

- (void)setEmbeddedAction:(id)a3
{
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (void)setExecutionDate:(id)a3
{
}

- (FMDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_executionDate, 0);

  objc_storeStrong((id *)&self->_embeddedAction, 0);
}

@end