@interface _TUITransactionControllerJSObserver
- (JSManagedValue)didUpdate;
- (JSManagedValue)willUpdate;
- (_TUITransactionControllerJSObserver)initWithWillUpdateValue:(id)a3 didUpdateValue:(id)a4;
- (void)transactionControllerDidProcessUpdate:(id)a3;
- (void)transactionControllerWillProcessUpdate:(id)a3;
@end

@implementation _TUITransactionControllerJSObserver

- (_TUITransactionControllerJSObserver)initWithWillUpdateValue:(id)a3 didUpdateValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_TUITransactionControllerJSObserver;
  v8 = [(_TUITransactionControllerJSObserver *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = +[JSManagedValue managedValueWithValue:v6];
      willUpdate = v9->_willUpdate;
      v9->_willUpdate = (JSManagedValue *)v10;
    }
    else
    {
      willUpdate = v8->_willUpdate;
      v8->_willUpdate = 0;
    }

    if (v7)
    {
      uint64_t v12 = +[JSManagedValue managedValueWithValue:v7];
      didUpdate = v9->_didUpdate;
      v9->_didUpdate = (JSManagedValue *)v12;
    }
    else
    {
      didUpdate = v9->_didUpdate;
      v9->_didUpdate = 0;
    }
  }
  return v9;
}

- (void)transactionControllerWillProcessUpdate:(id)a3
{
  v4 = TUIDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    v9 = "-[_TUITransactionControllerJSObserver transactionControllerWillProcessUpdate:]";
    _os_log_impl(&def_141F14, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v5 = [(JSManagedValue *)self->_willUpdate value];
  id v6 = v5;
  if (v5) {
    id v7 = [v5 callWithArguments:0];
  }
}

- (void)transactionControllerDidProcessUpdate:(id)a3
{
  v4 = TUIDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    v9 = "-[_TUITransactionControllerJSObserver transactionControllerDidProcessUpdate:]";
    _os_log_impl(&def_141F14, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v5 = [(JSManagedValue *)self->_didUpdate value];
  id v6 = v5;
  if (v5) {
    id v7 = [v5 callWithArguments:0];
  }
}

- (JSManagedValue)willUpdate
{
  return self->_willUpdate;
}

- (JSManagedValue)didUpdate
{
  return self->_didUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didUpdate, 0);

  objc_storeStrong((id *)&self->_willUpdate, 0);
}

@end