@interface PDNetworkTask
+ (BOOL)supportsSecureCoding;
- (BOOL)backoffComplete;
- (BOOL)canRequestReauthentication;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSDate)creationDate;
- (NSDate)nextStartDate;
- (PDNetworkTask)init;
- (PDNetworkTask)initWithCoder:(id)a3;
- (PDNetworkTaskManagerProtocol)manager;
- (const)backoffLevels;
- (double)nextBackoffInterval;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (void)cancel;
- (void)deliverResult:(id)a3;
- (void)deliverResult:(id)a3 forSubtask:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fail;
- (void)failForAuthentication;
- (void)incrementBackoff;
- (void)performReset;
- (void)reportError:(id)a3;
- (void)reportError:(id)a3 forSubtask:(id)a4;
- (void)reportStateChange;
- (void)reportWarnings:(id)a3;
- (void)reportWarnings:(id)a3 forSubtask:(id)a4;
- (void)resetBackoff;
- (void)setCanRequestReauthentication:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setNextStartDate:(id)a3;
- (void)start:(BOOL)a3;
- (void)succeed;
@end

@implementation PDNetworkTask

- (PDNetworkTask)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDNetworkTask;
  v2 = [(PDNetworkTask *)&v5 init];
  if (v2)
  {
    v3 = +[NSDate date];
    [(PDNetworkTask *)v2 setCreationDate:v3];
  }
  return v2;
}

- (void)start:(BOOL)a3
{
  if (self->_started)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      v4 = "Cannot start a task that is already started. Ignoring.";
      objc_super v5 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (self->_canceled)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      v4 = "Cannot start a task that is canceled. Ignoring.";
      objc_super v5 = (uint8_t *)&v6;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  self->_started = 1;
  [(PDNetworkTask *)self performStart:a3];
}

- (void)cancel
{
  if (!self->_canceled)
  {
    self->_canceled = 1;
    [(PDNetworkTask *)self performCancel];
  }
}

- (BOOL)backoffComplete
{
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  return nextBackoffLevel >= [(PDNetworkTask *)self numberOfBackoffLevels];
}

- (double)nextBackoffInterval
{
  v3 = [(PDNetworkTask *)self backoffLevels];
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  unint64_t v5 = [(PDNetworkTask *)self numberOfBackoffLevels];
  double result = 0.0;
  if (nextBackoffLevel < v5) {
    return v3[self->_nextBackoffLevel].var1;
  }
  return result;
}

- (void)incrementBackoff
{
  v3 = [(PDNetworkTask *)self backoffLevels];
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  if (nextBackoffLevel < [(PDNetworkTask *)self numberOfBackoffLevels])
  {
    unint64_t v5 = self->_nextBackoffLevel;
    unint64_t v6 = self->_nextBackoffIteration + 1;
    self->_nextBackoffIteration = v6;
    if (v6 >= v3[v5].var0)
    {
      self->_unint64_t nextBackoffLevel = v5 + 1;
      self->_nextBackoffIteration = 0;
    }
  }
}

- (void)resetBackoff
{
  self->_unint64_t nextBackoffLevel = 0;
  self->_nextBackoffIteration = 0;
}

- (void)deliverResult:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled task cannot deliver result. Ignoring.", v7, 2u);
    }
  }
  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self gotResult:v4];
  }
}

- (void)deliverResult:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    id WeakRetained = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Canceled task cannot deliver result. Ignoring.", v9, 2u);
    }
    goto LABEL_6;
  }
  if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:v7 gotResult:v6];
LABEL_6:
  }
}

- (void)reportStateChange
{
  if (self->_canceled)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Canceled task cannot report state change. Ignoring.", buf, 2u);
    }
  }
  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskChangedState:self];
  }
}

- (void)reportError:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled task cannot report error. Ignoring.", v7, 2u);
    }
  }
  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self encounteredError:v4];
  }
}

- (void)reportError:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    id WeakRetained = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Canceled task cannot report error. Ignoring.", v9, 2u);
    }
    goto LABEL_6;
  }
  if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:v7 encounteredError:v6];
LABEL_6:
  }
}

- (void)reportWarnings:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled task cannot report warnings. Ignoring.", v7, 2u);
    }
  }
  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self encounteredWarnings:v4];
  }
}

- (void)reportWarnings:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    id WeakRetained = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Canceled task cannot report warnings. Ignoring.", v9, 2u);
    }
    goto LABEL_6;
  }
  if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:v7 encounteredWarnings:v6];
LABEL_6:
  }
}

- (void)succeed
{
  if (self->_canceled)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Canceled task cannot succeed. Ignoring.", buf, 2u);
    }
  }
  else if (self->_started)
  {
    unint64_t v5 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskSucceeded:v5];

    [(PDNetworkTask *)v5 performReset];
    self->_started = 0;
  }
}

- (void)fail
{
  if (self->_canceled)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Canceled task cannot fail. Ignoring.", buf, 2u);
    }
  }
  else if (self->_started)
  {
    unint64_t v5 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskFailed:v5];

    [(PDNetworkTask *)v5 performReset];
    self->_started = 0;
  }
}

- (void)failForAuthentication
{
  if (self->_canceled)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Canceled task cannot fail. Ignoring.", buf, 2u);
    }
  }
  else if (self->_started)
  {
    unint64_t v5 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskFailedForAuthentication:v5];

    [(PDNetworkTask *)v5 performReset];
    self->_started = 0;
  }
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return 0;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  return 0;
}

- (int64_t)actionForActiveTask:(id)a3
{
  return 0;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_NormalBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 10;
}

- (void)performReset
{
  self->_canceled = 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNetworkTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDNetworkTask;
  unint64_t v5 = [(PDNetworkTask *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextStartDate"];
    [(PDNetworkTask *)v5 setNextStartDate:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    [(PDNetworkTask *)v5 setCreationDate:v7];

    v5->_canRequestReauthentication = [v4 decodeBoolForKey:@"canRequestReauthentication"];
    v5->_unint64_t nextBackoffLevel = (unint64_t)[v4 decodeIntegerForKey:@"nextBackoffLevel"];
    v5->_nextBackoffIteration = (unint64_t)[v4 decodeIntegerForKey:@"nextBackoffIteration"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(PDNetworkTask *)self nextStartDate];
  [v6 encodeObject:v4 forKey:@"nextStartDate"];

  unint64_t v5 = [(PDNetworkTask *)self creationDate];
  [v6 encodeObject:v5 forKey:@"creationDate"];

  [v6 encodeBool:self->_canRequestReauthentication forKey:@"canRequestReauthentication"];
  [v6 encodeInteger:self->_nextBackoffLevel forKey:@"nextBackoffLevel"];
  [v6 encodeInteger:self->_nextBackoffIteration forKey:@"nextBackoffIteration"];
}

- (PDNetworkTaskManagerProtocol)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (PDNetworkTaskManagerProtocol *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (BOOL)canRequestReauthentication
{
  return self->_canRequestReauthentication;
}

- (void)setCanRequestReauthentication:(BOOL)a3
{
  self->_canRequestReauthentication = a3;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextStartDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_destroyWeak((id *)&self->_manager);
}

@end