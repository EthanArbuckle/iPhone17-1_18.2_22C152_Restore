@interface MetaAction
- (Action)embeddedAction;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMSynchronizer)synchronizer;
- (MetaAction)init;
- (MetaAction)initWithAction:(id)a3 id:(id)a4;
- (NSCopying)actionId;
- (NSDate)queueAddedDate;
- (NSString)description;
- (id)_actionStateString;
- (id)actionType;
- (void)dealloc;
- (void)main;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)runWithCompletion:(id)a3;
- (void)setActionId:(id)a3;
- (void)setEmbeddedAction:(id)a3;
- (void)setQueueAddedDate:(id)a3;
- (void)setSynchronizer:(id)a3;
@end

@implementation MetaAction

- (MetaAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MetaAction;
  return [(MetaAction *)&v3 init];
}

- (void)dealloc
{
  [(MetaAction *)self removeObserver:self forKeyPath:@"isCancelled"];
  v3.receiver = self;
  v3.super_class = (Class)MetaAction;
  [(MetaAction *)&v3 dealloc];
}

- (MetaAction)initWithAction:(id)a3 id:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MetaAction;
  v8 = [(MetaAction *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(MetaAction *)v8 setActionId:v7];
    [(MetaAction *)v9 setEmbeddedAction:v6];
    id v10 = objc_alloc((Class)FMSynchronizer);
    v11 = [(MetaAction *)v9 description];
    id v12 = [v10 initWithDescription:v11 andTimeout:-1.0];
    [(MetaAction *)v9 setSynchronizer:v12];

    [(MetaAction *)v9 addObserver:v9 forKeyPath:@"isCancelled" options:1 context:0];
  }

  return v9;
}

- (void)main
{
  objc_initWeak(&location, self);
  if (([(MetaAction *)self isCancelled] & 1) == 0)
  {
    v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    id v6 = sub_10003BD7C;
    id v7 = &unk_1002D93C8;
    objc_copyWeak(&v8, &location);
    [(MetaAction *)self runWithCompletion:&v4];
    if (([(MetaAction *)self isCancelled] & 1) == 0)
    {
      objc_super v3 = [(MetaAction *)self synchronizer];
      [v3 wait];
    }
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a5;
  if ([a3 isEqualToString:@"isCancelled"])
  {
    id v8 = [v14 valueForKey:NSKeyValueChangeNewKey];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      id v10 = [(MetaAction *)self embeddedAction];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = [(MetaAction *)self embeddedAction];
        [v12 willCancelAction];
      }
      v13 = [(MetaAction *)self synchronizer];
      [v13 signal];
    }
  }
}

- (NSString)description
{
  objc_super v3 = [(MetaAction *)self actionId];
  v4 = [(MetaAction *)self _actionStateString];
  uint64_t v5 = [(MetaAction *)self embeddedAction];
  id v6 = +[NSString stringWithFormat:@"#%@-%@-%@", v3, v4, v5];

  return (NSString *)v6;
}

- (id)_actionStateString
{
  if ([(MetaAction *)self isCancelled]) {
    return @"Cancel";
  }
  if ([(MetaAction *)self isFinished]) {
    return @"Finish";
  }
  if ([(MetaAction *)self isExecuting]) {
    return @"Exec";
  }
  if ([(MetaAction *)self isReady]) {
    return @"Ready";
  }
  return @"Wait";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MetaAction *)self embeddedAction];
  [v5 runWithCompletion:v4];
}

- (id)actionType
{
  v2 = [(MetaAction *)self embeddedAction];
  objc_super v3 = [v2 actionType];

  return v3;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  id v5 = [(MetaAction *)self embeddedAction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MetaAction *)self embeddedAction];
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
  id v5 = [(MetaAction *)self embeddedAction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MetaAction *)self embeddedAction];
    unsigned __int8 v8 = [v7 shouldWaitForAction:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSCopying)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
}

- (Action)embeddedAction
{
  return self->_embeddedAction;
}

- (void)setEmbeddedAction:(id)a3
{
}

- (NSDate)queueAddedDate
{
  return self->_queueAddedDate;
}

- (void)setQueueAddedDate:(id)a3
{
}

- (FMSynchronizer)synchronizer
{
  return self->_synchronizer;
}

- (void)setSynchronizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizer, 0);
  objc_storeStrong((id *)&self->_queueAddedDate, 0);
  objc_storeStrong((id *)&self->_embeddedAction, 0);

  objc_storeStrong((id *)&self->_actionId, 0);
}

@end