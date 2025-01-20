@interface DMDActivationPredicateFalse
- (id)evaluatePredicateWithError:(id *)a3;
@end

@implementation DMDActivationPredicateFalse

- (id)evaluatePredicateWithError:(id *)a3
{
  [(DMDActivationPredicateObserver *)self setLastPredicateEvaluationValue:0];
  v4 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(DMDActivationPredicateObserver *)self predicateType];
    v6 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    int v9 = 138543874;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = [(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d", (uint8_t *)&v9, 0x1Cu);
  }
  v7 = +[NSNumber numberWithBool:[(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue]];

  return v7;
}

@end