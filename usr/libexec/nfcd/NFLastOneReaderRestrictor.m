@interface NFLastOneReaderRestrictor
- (BOOL)_wasActiveTooLong;
- (NFLastOneReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4;
- (double)_getLastConnectionTime:(id)a3;
- (double)_getLastDisconnectionTime:(id)a3;
- (double)getCooloffTime;
- (double)maxOperationTimeSpan;
- (double)maxReaderTime;
- (id)description;
@end

@implementation NFLastOneReaderRestrictor

- (NFLastOneReaderRestrictor)initWithThermalMonitor:(id)a3 delegate:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)NFLastOneReaderRestrictor;
  v5 = [(NFReaderRestrictor *)&v19 initWithThermalMonitor:a3 delegate:a4];
  if (v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v5);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v5);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Using last one mechanism", v11, ClassName, Name, 22);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(v5);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      v15 = object_getClassName(v5);
      v16 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v21 = v14;
      __int16 v22 = 2082;
      v23 = v15;
      __int16 v24 = 2082;
      v25 = v16;
      __int16 v26 = 1024;
      int v27 = 22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using last one mechanism", buf, 0x22u);
    }
  }
  return v5;
}

- (double)maxOperationTimeSpan
{
  return 77.0;
}

- (double)maxReaderTime
{
  unsigned int v2 = [(NFLastOneReaderRestrictor *)self _wasActiveTooLong];
  double result = 20.0;
  if (v2) {
    return 7.0;
  }
  return result;
}

- (double)getCooloffTime
{
  v24.receiver = self;
  v24.super_class = (Class)NFLastOneReaderRestrictor;
  v4 = [(NFReaderRestrictor *)&v24 currentTestTime];
  if (v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)NFLastOneReaderRestrictor;
    uint64_t v5 = [(NFReaderRestrictor *)&v23 currentTestTime];
  }
  else
  {
    uint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  }
  v6 = (void *)v5;

  [(NFLastOneReaderRestrictor *)self _getLastConnectionTime:v6];
  double v8 = v7;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i Last connection was for %f seconds", v14, ClassName, Name, 46, *(void *)&v8);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    v18 = object_getClassName(self);
    objc_super v19 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v26 = v17;
    __int16 v27 = 2082;
    v28 = v18;
    __int16 v29 = 2082;
    v30 = v19;
    __int16 v31 = 1024;
    int v32 = 46;
    __int16 v33 = 2048;
    double v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Last connection was for %f seconds", buf, 0x2Cu);
  }

  if ([(NFReaderRestrictor *)self thermalPressureCritical])
  {
    double v20 = 0.1;
  }
  else
  {
    double v20 = 5.0;
    if ((![(NFReaderRestrictor *)self thermalPressureBackoff] || v8 <= 5.0)
      && (![(NFLastOneReaderRestrictor *)self _wasActiveTooLong] || v8 < 5.0))
    {
      if (v8 >= 19.0) {
        double v20 = 5.0;
      }
      else {
        double v20 = 0.0;
      }
    }
  }

  return v20;
}

- (BOOL)_wasActiveTooLong
{
  v26.receiver = self;
  v26.super_class = (Class)NFLastOneReaderRestrictor;
  v4 = [(NFReaderRestrictor *)&v26 currentTestTime];
  if (v4)
  {
    v25.receiver = self;
    v25.super_class = (Class)NFLastOneReaderRestrictor;
    uint64_t v5 = [(NFReaderRestrictor *)&v25 currentTestTime];
  }
  else
  {
    uint64_t v5 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  }
  v6 = (void *)v5;

  [(NFLastOneReaderRestrictor *)self _getLastConnectionTime:v6];
  double v8 = v7;
  [(NFLastOneReaderRestrictor *)self _getLastDisconnectionTime:v6];
  double v10 = v9;
  if (v8 >= 20.0 || [(NFReaderRestrictor *)self thermalPressureBackoff])
  {
    BOOL v11 = 1;
  }
  else
  {
    if (v10 < 5.0) {
      [(NFReaderRestrictor *)self thermalPressureNominal];
    }
    BOOL v11 = 0;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i Reader: last connection = %f seconds ago, active too long is %d", v17, ClassName, Name, 85, *(void *)&v8, v11);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    __int16 v22 = sel_getName(a2);
    *(_DWORD *)buf = 67110402;
    int v28 = v20;
    __int16 v29 = 2082;
    v30 = v21;
    __int16 v31 = 2082;
    int v32 = v22;
    __int16 v33 = 1024;
    int v34 = 85;
    __int16 v35 = 2048;
    double v36 = v8;
    __int16 v37 = 1024;
    BOOL v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader: last connection = %f seconds ago, active too long is %d", buf, 0x32u);
  }

  return v11;
}

- (double)_getLastDisconnectionTime:(id)a3
{
  id v5 = a3;
  v6 = [(NFReaderRestrictor *)self readerOperations];
  double v7 = [v6 reverseObjectEnumerator];
  double v8 = [v7 allObjects];

  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndex:0];
    double v10 = (void *)v9;
    if (v9) {
      BOOL v11 = *(void **)(v9 + 16);
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = v11;
    unsigned int v13 = [v12 isEqualToString:@"ReaderStopped"];

    if (v13)
    {
      if (v10) {
        uint64_t v14 = (void *)v10[1];
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      [v5 timeIntervalSinceDate:v15];
      double v17 = v16;

LABEL_29:
      goto LABEL_30;
    }
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v18 = [v8 objectAtIndex:1];
      objc_super v19 = (void *)v18;
      if (v18) {
        int v20 = *(void **)(v18 + 16);
      }
      else {
        int v20 = 0;
      }
      id v21 = v20;
      unsigned int v22 = [v21 isEqualToString:@"ReaderStopped"];

      if (v22)
      {
        if (v19) {
          objc_super v23 = (void *)v19[1];
        }
        else {
          objc_super v23 = 0;
        }
        id v24 = v23;
        if (v10) {
          objc_super v25 = (void *)v10[1];
        }
        else {
          objc_super v25 = 0;
        }
        id v26 = v25;
        [v24 timeIntervalSinceDate:v26];
        double v17 = v27;

        goto LABEL_29;
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v33 = 45;
      if (isMetaClass) {
        uint64_t v33 = 43;
      }
      v29(6, "%c[%{public}s %{public}s]:%i No stop reader operation stored", v33, ClassName, Name, 114);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v40 = v36;
      __int16 v41 = 2082;
      v42 = object_getClassName(self);
      __int16 v43 = 2082;
      v44 = sel_getName(a2);
      __int16 v45 = 1024;
      int v46 = 114;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No stop reader operation stored", buf, 0x22u);
    }

    double v17 = 3.40282347e38;
    goto LABEL_29;
  }
  double v17 = 0.0;
LABEL_30:

  return v17;
}

- (double)_getLastConnectionTime:(id)a3
{
  id v5 = a3;
  v6 = [(NFReaderRestrictor *)self readerOperations];
  double v7 = [v6 reverseObjectEnumerator];
  double v8 = [v7 allObjects];

  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndex:0];
    double v10 = (void *)v9;
    if (v9) {
      BOOL v11 = *(void **)(v9 + 16);
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = v11;
    unsigned int v13 = [v12 isEqualToString:@"ReaderStarted"];

    if (v13)
    {
      if (v10) {
        uint64_t v14 = (void *)v10[1];
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      [v5 timeIntervalSinceDate:v15];
      double v17 = v16;

LABEL_29:
      goto LABEL_30;
    }
    if ((unint64_t)[v8 count] >= 2)
    {
      uint64_t v18 = [v8 objectAtIndex:1];
      objc_super v19 = (void *)v18;
      if (v18) {
        int v20 = *(void **)(v18 + 16);
      }
      else {
        int v20 = 0;
      }
      id v21 = v20;
      unsigned int v22 = [v21 isEqualToString:@"ReaderStarted"];

      if (v22)
      {
        if (v19) {
          objc_super v23 = (void *)v19[1];
        }
        else {
          objc_super v23 = 0;
        }
        id v24 = v23;
        if (v10) {
          objc_super v25 = (void *)v10[1];
        }
        else {
          objc_super v25 = 0;
        }
        id v26 = v25;
        [v24 timeIntervalSinceDate:v26];
        double v17 = v27;

        goto LABEL_29;
      }
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v29 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v33 = 45;
      if (isMetaClass) {
        uint64_t v33 = 43;
      }
      v29(4, "%c[%{public}s %{public}s]:%i Unexpected state : No start reader operation stored", v33, ClassName, Name, 139);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v34 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v40 = v36;
      __int16 v41 = 2082;
      v42 = object_getClassName(self);
      __int16 v43 = 2082;
      v44 = sel_getName(a2);
      __int16 v45 = 1024;
      int v46 = 139;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state : No start reader operation stored", buf, 0x22u);
    }

    double v17 = 0.0;
    goto LABEL_29;
  }
  double v17 = 0.0;
LABEL_30:

  return v17;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)NFLastOneReaderRestrictor;
  v3 = [(NFReaderRestrictor *)&v8 description];
  v4 = +[NSMutableString stringWithString:v3];

  [v4 appendFormat:@"\n"];
  if ([(NFReaderRestrictor *)self thermalPressureCritical])
  {
    CFStringRef v5 = @"\t Current window = Critical\n";
  }
  else if ([(NFReaderRestrictor *)self thermalPressureBackoff])
  {
    CFStringRef v5 = @"\t Current window = Backoff\n";
  }
  else
  {
    CFStringRef v5 = @"\t Current window = Nominal\n";
  }
  [v4 appendFormat:v5];
  v6 = [(NFReaderRestrictor *)self readerOperations];
  [v4 appendFormat:@"\t Operations = %@", v6];

  return v4;
}

@end