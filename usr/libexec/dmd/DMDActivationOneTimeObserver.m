@interface DMDActivationOneTimeObserver
- (BOOL)_extractComponentsFromPredicate:(id)a3;
- (DMDActivationOneTimeObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 oneTimePredicate:(id)a5;
- (NSDate)endDate;
- (id)evaluatePredicateWithError:(id *)a3;
- (void)_registerPredicateObserver;
- (void)invalidate;
- (void)setEndDate:(id)a3;
@end

@implementation DMDActivationOneTimeObserver

- (DMDActivationOneTimeObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 oneTimePredicate:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DMDActivationOneTimeObserver;
  v9 = [(DMDActivationPredicateObserver *)&v13 initWithDelegate:a3 uniqueIdentifier:a4 predicate:v8];
  v10 = v9;
  if (v9)
  {
    if (![(DMDActivationOneTimeObserver *)v9 _extractComponentsFromPredicate:v8])
    {
      v11 = 0;
      goto LABEL_6;
    }
    [(DMDActivationOneTimeObserver *)v10 _registerPredicateObserver];
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v4 = objc_opt_new();
  v5 = [(DMDActivationOneTimeObserver *)self endDate];
  -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", [v4 compare:v5] == (id)-1);

  v6 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(DMDActivationPredicateObserver *)self predicateType];
    id v8 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    unsigned int v9 = [(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue];
    v10 = [(DMDActivationOneTimeObserver *)self endDate];
    int v13 = 138544386;
    v14 = v7;
    __int16 v15 = 2114;
    v16 = v8;
    __int16 v17 = 1024;
    unsigned int v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    __int16 v21 = 2114;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, end date: %{public}@, now: %{public}@", (uint8_t *)&v13, 0x30u);
  }
  v11 = +[NSNumber numberWithBool:[(DMDActivationPredicateObserver *)self lastPredicateEvaluationValue]];

  return v11;
}

- (void)invalidate
{
  [@"com.apple.alarm" UTF8String];
  id v3 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
  [v3 UTF8String];
  xpc_set_event();

  v4.receiver = self;
  v4.super_class = (Class)DMDActivationOneTimeObserver;
  [(DMDActivationPredicateObserver *)&v4 invalidate];
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 payloadDateTime];

  if (!v6)
  {
    v7 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10007EFC8(self);
    }
    goto LABEL_10;
  }
  v7 = objc_opt_new();
  [v7 setFormatOptions:1907];
  id v8 = [v7 dateFromString:v6];
  [(DMDActivationOneTimeObserver *)self setEndDate:v8];

  unsigned int v9 = [(DMDActivationOneTimeObserver *)self endDate];

  if (!v9)
  {
    v14 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10007F084(self);
    }

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }

  v7 = DMFConfigurationEngineLog();
  BOOL v10 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = [(DMDActivationPredicateObserver *)self predicateType];
    v12 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    int v13 = [(DMDActivationOneTimeObserver *)self endDate];
    int v16 = 138544642;
    __int16 v17 = v11;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2114;
    v23 = v6;
    __int16 v24 = 2114;
    v25 = v13;
    __int16 v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted seconds: %f, end time string: %{public}@, end date: %{public}@, now: %{public}@", (uint8_t *)&v16, 0x3Eu);
  }
LABEL_11:

  return v10;
}

- (void)_registerPredicateObserver
{
  id v3 = objc_opt_new();
  id v4 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
  v5 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.dmd.alarm", v4];

  v6 = [(DMDActivationOneTimeObserver *)self endDate];
  [v6 timeIntervalSinceDate:v3];
  double v8 = v7;

  if (v8 <= 0.0)
  {
    int v16 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10007F140(self);
    }
  }
  else
  {
    unsigned int v9 = [(DMDActivationOneTimeObserver *)self endDate];
    [v9 timeIntervalSince1970];
    int64_t v11 = (uint64_t)(v10 * 1000000000.0);

    v12 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(DMDActivationPredicateObserver *)self predicateType];
      v14 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      __int16 v15 = [(DMDActivationOneTimeObserver *)self endDate];
      *(_DWORD *)buf = 138544642;
      __int16 v18 = v13;
      __int16 v19 = 2114;
      __int16 v20 = v14;
      __int16 v21 = 2114;
      __int16 v22 = v5;
      __int16 v23 = 2114;
      __int16 v24 = v15;
      __int16 v25 = 2048;
      int64_t v26 = v11;
      __int16 v27 = 2114;
      v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public}@ to fire at date: %{public}@, epoch time in nano seconds: %lld, now: %{public}@", buf, 0x3Eu);
    }
    int v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v16, (const char *)[@"ShouldWake" UTF8String], 0);
    xpc_dictionary_set_date(v16, (const char *)[@"Date" UTF8String], v11);
    [@"com.apple.alarm" UTF8String];
    [v5 UTF8String];
    xpc_set_event();
  }
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end