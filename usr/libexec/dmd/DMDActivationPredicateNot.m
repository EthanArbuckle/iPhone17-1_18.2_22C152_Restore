@interface DMDActivationPredicateNot
- (DMDActivationPredicateNot)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObserver:(id)a5 predicate:(id)a6;
- (DMDActivationPredicateObserver)subPredicateObserver;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)setSubPredicateObserver:(id)a3;
@end

@implementation DMDActivationPredicateNot

- (DMDActivationPredicateNot)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObserver:(id)a5 predicate:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DMDActivationPredicateNot;
  v12 = [(DMDActivationPredicateObserver *)&v15 initWithDelegate:a3 uniqueIdentifier:a4 predicate:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_subPredicateObserver, a5);
  }

  return v13;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v5 = [(DMDActivationPredicateNot *)self subPredicateObserver];
  v6 = [v5 evaluatePredicateWithError:a3];

  if (v6)
  {
    -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", [v6 BOOLValue] ^ 1);
    v7 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(DMDActivationPredicateObserver *)self predicateType];
      v9 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      int v12 = 138543874;
      v13 = v8;
      __int16 v14 = 2114;
      objc_super v15 = v9;
      __int16 v16 = 1024;
      unsigned int v17 = [(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d", (uint8_t *)&v12, 0x1Cu);
    }
    v10 = +[NSNumber numberWithBool:[(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue]];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)metadata
{
  v8.receiver = self;
  v8.super_class = (Class)DMDActivationPredicateNot;
  v3 = [(DMDActivationPredicateObserver *)&v8 metadata];
  v4 = [(DMDActivationPredicateNot *)self subPredicateObserver];
  v5 = [v4 metadata];

  if (v5)
  {
    v9 = v5;
    v6 = +[NSArray arrayWithObjects:&v9 count:1];
    [v3 setObject:v6 forKeyedSubscript:DMFDeclarationStatePredicateSubPredicatesKey];
  }

  return v3;
}

- (DMDActivationPredicateObserver)subPredicateObserver
{
  return self->_subPredicateObserver;
}

- (void)setSubPredicateObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end