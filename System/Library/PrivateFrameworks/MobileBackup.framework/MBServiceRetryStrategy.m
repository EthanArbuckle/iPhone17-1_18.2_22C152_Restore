@interface MBServiceRetryStrategy
- (BOOL)_shouldForceRetry;
- (BOOL)_shouldResetConsecutiveRetryCounter;
- (BOOL)canRetryAfterError:(id)a3;
- (BOOL)shouldRetryAfterError:(id)a3 hard:(BOOL)a4;
- (BOOL)wouldRetry;
- (MBServiceAccount)account;
- (MBServiceRetryStrategy)initWithEngine:(id)a3 account:(id)a4;
- (double)_sleepIntervalAfterError:(id)a3;
- (double)forcedRetryTimeInterval;
- (double)maximumServiceUnavailableRetryInterval;
- (double)networkRetryTimeInterval;
- (double)resetConsecutiveRetriesTimeInterval;
- (id)_updateAccountIfNeededAfterError:(id)a3;
- (unint64_t)consecutiveRetryCount;
- (unint64_t)hardConsecutiveRetryLimit;
- (unint64_t)softConsecutiveRetryLimit;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setConsecutiveRetryCount:(unint64_t)a3;
- (void)setForcedRetryTimeInterval:(double)a3;
- (void)setHardConsecutiveRetryLimit:(unint64_t)a3;
- (void)setMaximumServiceUnavailableRetryInterval:(double)a3;
- (void)setNetworkRetryTimeInterval:(double)a3;
- (void)setResetConsecutiveRetriesTimeInterval:(double)a3;
- (void)setSoftConsecutiveRetryLimit:(unint64_t)a3;
@end

@implementation MBServiceRetryStrategy

- (MBServiceRetryStrategy)initWithEngine:(id)a3 account:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MBServiceRetryStrategy;
  v6 = [(MBServiceRetryStrategy *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_engine = (MBEngine *)a3;
    v6->_account = (MBServiceAccount *)a4;
    v7->_lastAttemptStartTime = (double)(uint64_t)objc_msgSend(objc_msgSend(a3, "debugContext"), "time");
    v7->_consecutiveRetryCount = 0;
    v7->_consecutiveRetryStartTime = (double)(uint64_t)objc_msgSend(objc_msgSend(a3, "debugContext"), "time");
    *(_OWORD *)&v7->_softConsecutiveRetryLimit = xmmword_1003B3730;
    unsigned int v8 = [(MBEngine *)v7->_engine isBackupEngine];
    double v9 = 1800.0;
    if (!v8) {
      double v9 = 600.0;
    }
    v7->_resetConsecutiveRetriesTimeInterval = v9;
    unsigned int v10 = [a3 isBackupEngine];
    double v11 = 0.0;
    if (v10) {
      double v11 = 600.0;
    }
    v7->_forcedRetryTimeInterval = v11;
    *(_OWORD *)&v7->_networkRetryTimeInterval = xmmword_1003B3740;
    [(MBDebugContext *)[(MBEngine *)v7->_engine debugContext] setInt:0 forName:@"RetryCount"];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBServiceRetryStrategy;
  [(MBServiceRetryStrategy *)&v3 dealloc];
}

- (void)setConsecutiveRetryCount:(unint64_t)a3
{
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting consecutive retry count to %lu", buf, 0xCu);
    unint64_t v6 = a3;
    _MBLog();
  }
  self->_consecutiveRetryCount = a3;
  self->_consecutiveRetryStartTime = (double)(uint64_t)[(MBDebugContext *)[(MBEngine *)self->_engine debugContext] time];
}

- (BOOL)canRetryAfterError:(id)a3
{
  BOOL result = 1;
  if ((+[MBError isError:withCodes:](MBError, "isError:withCodes:", a3, 9, 300, 302, 401, 307, 0) & 1) == 0&& (![(MBEngine *)self->_engine isForegroundRestore]|| (+[MBError isError:a3 withCode:308] & 1) == 0))
  {
    id v7 = 0;
    if (!+[MBError isRetryAfterError:a3 retryAfterDate:&v7])return 0; {
    [v7 timeIntervalSinceNow];
    }
    if (v6 >= self->_maximumServiceUnavailableRetryInterval) {
      return 0;
    }
  }
  return result;
}

- (BOOL)wouldRetry
{
  return self->_consecutiveRetryCount < self->_hardConsecutiveRetryLimit;
}

- (double)_sleepIntervalAfterError:(id)a3
{
  id v9 = 0;
  if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", a3, 300, 308, 302, 0))return self->_networkRetryTimeInterval; {
  double v5 = 0.0;
  }
  if (+[MBError isRetryAfterError:a3 retryAfterDate:&v9])
  {
    [v9 timeIntervalSinceNow];
    if (v6 < self->_maximumServiceUnavailableRetryInterval)
    {
      [v9 timeIntervalSinceNow];
      return v7;
    }
  }
  return v5;
}

- (BOOL)_shouldResetConsecutiveRetryCounter
{
  return (double)(uint64_t)[(MBDebugContext *)[(MBEngine *)self->_engine debugContext] time]
       - self->_consecutiveRetryStartTime > self->_resetConsecutiveRetriesTimeInterval;
}

- (BOOL)_shouldForceRetry
{
  return self->_forcedRetryTimeInterval > 0.0
      && (double)(uint64_t)[(MBDebugContext *)[(MBEngine *)self->_engine debugContext] time]
       - self->_lastAttemptStartTime > self->_forcedRetryTimeInterval;
}

- (id)_updateAccountIfNeededAfterError:(id)a3
{
  if (!+[MBError isError:a3 withCode:307]) {
    return a3;
  }
  id v5 = objc_msgSend(-[MBServiceAccount reloaded](-[MBServiceRetryStrategy account](self, "account"), "reloaded"), "updateAppleAccountSync");
  if (!v5) {
    return a3;
  }
  return +[MBError errorWithCode:300 error:v5 format:@"Updating account failed"];
}

- (BOOL)shouldRetryAfterError:(id)a3 hard:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(MBServiceRetryStrategy *)self _shouldResetConsecutiveRetryCounter]) {
    [(MBServiceRetryStrategy *)self setConsecutiveRetryCount:0];
  }
  if (!a3)
  {
    unsigned int v15 = [(MBServiceRetryStrategy *)self _shouldForceRetry];
    v16 = MBGetDefaultLog();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Forcing retry after success", buf, 2u);
LABEL_28:
        _MBLog();
      }
LABEL_29:
      self->_lastAttemptStartTime = (double)(uint64_t)[(MBDebugContext *)[(MBEngine *)self->_engine debugContext] time];
      BOOL v19 = 1;
      *(int64x2_t *)&self->_totalRetryCount = vaddq_s64(*(int64x2_t *)&self->_totalRetryCount, vdupq_n_s64(1uLL));
      [(MBDebugContext *)[(MBEngine *)self->_engine debugContext] setInt:LODWORD(self->_totalRetryCount) forName:@"RetryCount"];
      return v19;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Not retrying after success", buf, 2u);
LABEL_32:
    _MBLog();
    return 0;
  }
  id v7 = [(MBServiceRetryStrategy *)self _updateAccountIfNeededAfterError:a3];
  if ([(MBServiceRetryStrategy *)self canRetryAfterError:v7])
  {
    unint64_t consecutiveRetryCount = self->_consecutiveRetryCount;
    if (v4)
    {
      unint64_t hardConsecutiveRetryLimit = self->_hardConsecutiveRetryLimit;
      unsigned int v10 = MBGetDefaultLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (consecutiveRetryCount < hardConsecutiveRetryLimit)
      {
        if (v11)
        {
          *(_DWORD *)buf = 138412290;
          double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Retrying after hard error: %@", buf, 0xCu);
          double v25 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
          _MBLog();
        }
        -[MBServiceRetryStrategy _sleepIntervalAfterError:](self, "_sleepIntervalAfterError:", v7, *(void *)&v25);
        if (v12 != 0.0)
        {
          double v13 = v12;
          v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Sleeping for %0.3fs after hard error", buf, 0xCu);
            double v25 = v13;
            _MBLog();
          }
          sleep(v13);
        }
        goto LABEL_29;
      }
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not retrying after hard error: %@", buf, 0xCu);
        +[MBError descriptionForError:v7];
        goto LABEL_32;
      }
      return 0;
    }
    if (consecutiveRetryCount >= self->_softConsecutiveRetryLimit)
    {
      unsigned int v21 = [(MBServiceRetryStrategy *)self _shouldForceRetry];
      v22 = MBGetDefaultLog();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (!v21)
      {
        if (v23)
        {
          *(_DWORD *)buf = 138412290;
          double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not retrying after soft error: %@", buf, 0xCu);
          +[MBError descriptionForError:v7];
          goto LABEL_32;
        }
        return 0;
      }
      if (v23)
      {
        *(_DWORD *)buf = 138412290;
        double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Forcing retry after soft error: %@", buf, 0xCu);
        double v25 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
        goto LABEL_28;
      }
    }
    else
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Retrying after soft error: %@", buf, 0xCu);
        double v25 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
        goto LABEL_28;
      }
    }
    goto LABEL_29;
  }
  v18 = MBGetDefaultLog();
  BOOL v19 = 0;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v27 = COERCE_DOUBLE(+[MBError descriptionForError:v7]);
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not retrying after unrecoverable error: %@", buf, 0xCu);
    +[MBError descriptionForError:v7];
    goto LABEL_32;
  }
  return v19;
}

- (unint64_t)consecutiveRetryCount
{
  return self->_consecutiveRetryCount;
}

- (unint64_t)softConsecutiveRetryLimit
{
  return self->_softConsecutiveRetryLimit;
}

- (void)setSoftConsecutiveRetryLimit:(unint64_t)a3
{
  self->_softConsecutiveRetryLimit = a3;
}

- (unint64_t)hardConsecutiveRetryLimit
{
  return self->_hardConsecutiveRetryLimit;
}

- (void)setHardConsecutiveRetryLimit:(unint64_t)a3
{
  self->_unint64_t hardConsecutiveRetryLimit = a3;
}

- (double)resetConsecutiveRetriesTimeInterval
{
  return self->_resetConsecutiveRetriesTimeInterval;
}

- (void)setResetConsecutiveRetriesTimeInterval:(double)a3
{
  self->_resetConsecutiveRetriesTimeInterval = a3;
}

- (double)forcedRetryTimeInterval
{
  return self->_forcedRetryTimeInterval;
}

- (void)setForcedRetryTimeInterval:(double)a3
{
  self->_forcedRetryTimeInterval = a3;
}

- (double)networkRetryTimeInterval
{
  return self->_networkRetryTimeInterval;
}

- (void)setNetworkRetryTimeInterval:(double)a3
{
  self->_networkRetryTimeInterval = a3;
}

- (double)maximumServiceUnavailableRetryInterval
{
  return self->_maximumServiceUnavailableRetryInterval;
}

- (void)setMaximumServiceUnavailableRetryInterval:(double)a3
{
  self->_maximumServiceUnavailableRetryInterval = a3;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

@end