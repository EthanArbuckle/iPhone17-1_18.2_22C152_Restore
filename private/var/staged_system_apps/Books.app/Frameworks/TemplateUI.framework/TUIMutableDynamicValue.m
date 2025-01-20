@interface TUIMutableDynamicValue
- (void)updateWithTransaction:(id)a3 value:(id)a4;
- (void)updateWithTransaction:(id)a3 valueIfChanged:(id)a4;
- (void)updateWithValue:(id)a3;
- (void)updateWithValueIfChanged:(id)a3;
@end

@implementation TUIMutableDynamicValue

- (void)updateWithTransaction:(id)a3 valueIfChanged:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id value = self->super._value;
  if (value != v6 && ([value isEqual:v6] & 1) == 0) {
    [(TUIMutableDynamicValue *)self updateWithTransaction:v8 value:v6];
  }
}

- (void)updateWithTransaction:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[TUITransaction currentOrImplicitTransaction];
  }
  id v8 = [v6 tx];
  v9 = [[_TUIDynamicValueUpdate alloc] initWithValue:v7 transaction:v8];
  v10 = TUITransactionLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(TUIDynamicValue *)self debugName];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._lastTransactionToken);
    int v16 = 134219010;
    v17 = self;
    __int16 v18 = 2114;
    v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = WeakRetained;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_DEFAULT, "[%p] %{public}@: DynamicValue: updateWithValue (tx=%@, lastToken=%@) value=%@", (uint8_t *)&v16, 0x34u);
  }
  id v13 = objc_loadWeakRetained((id *)&self->super._lastTransactionToken);
  [v6 dependentOn:v13];

  v14 = [(TUIDynamicValue *)self transactionCategory];
  [v6 addCategory:v14];

  v15 = [v6 dependencyToken];
  objc_storeWeak((id *)&self->super._lastTransactionToken, v15);

  [(TUIDynamicValue *)self _enqueueUpdate:v9];
}

- (void)updateWithValue:(id)a3
{
  id v4 = a3;
  id v5 = +[TUITransaction currentOrImplicitTransaction];
  [(TUIMutableDynamicValue *)self updateWithTransaction:v5 value:v4];
}

- (void)updateWithValueIfChanged:(id)a3
{
  id v4 = a3;
  id v5 = +[TUITransaction currentOrImplicitTransaction];
  [(TUIMutableDynamicValue *)self updateWithTransaction:v5 valueIfChanged:v4];
}

@end