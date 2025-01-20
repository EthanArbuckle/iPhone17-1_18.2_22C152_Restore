@interface NFRemoteAdminRedirectState
+ (BOOL)supportsSecureCoding;
- (BOOL)isComplete;
- (NFRemoteAdminRedirectState)initWithCoder:(id)a3;
- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5;
- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5 initialStep:(unint64_t)a6;
- (NFRemoteAdminRedirectStatePerformanceMetrics)performanceMetrics;
- (NSArray)whitelistedInstances;
- (NSDictionary)forwardDataToSMP;
- (NSDictionary)forwardDataToSP;
- (NSDictionary)notification;
- (NSNumber)httpStatus;
- (NSNumber)spStatusCode;
- (NSNumber)version;
- (NSString)batchId;
- (NSString)incompleteReason;
- (NSString)redirectUrl;
- (NSString)seid;
- (NSString)taskId;
- (id)_extractAidsFromStringArray:(id)a3;
- (id)_redirectResult;
- (id)description;
- (id)redirectResponse;
- (int64_t)step;
- (void)encodeWithCoder:(id)a3;
- (void)incrementLongRetry;
- (void)incrementStep;
- (void)save;
- (void)setBatchId:(id)a3;
- (void)setForwardDataToSMP:(id)a3;
- (void)setForwardDataToSP:(id)a3;
- (void)setHttpStatus:(id)a3;
- (void)setIncompleteReason:(id)a3;
- (void)setNotification:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setRedirectUrl:(id)a3;
- (void)setSeid:(id)a3;
- (void)setSpStatusCode:(id)a3;
- (void)setStep:(int64_t)a3;
- (void)setTaskId:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWhitelistedInstances:(id)a3;
@end

@implementation NFRemoteAdminRedirectState

- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5
{
  return [(NFRemoteAdminRedirectState *)self initWithDictionary:a3 sourceURL:a4 originator:a5 initialStep:0];
}

- (id)_extractAidsFromStringArray:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_opt_new();
    if ([v4 count])
    {
      unint64_t v6 = 0;
      v7 = &CC_SHA256_ptr;
      do
      {
        v8 = v7[169];
        v9 = [v4 objectAtIndex:v6];
        v10 = [v8 NF_dataWithHexString:v9];

        if (v10)
        {
          [v5 addObject:v10];
        }
        else
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            v12 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v17 = [v4 objectAtIndex:v6];
            uint64_t v18 = 45;
            if (isMetaClass) {
              uint64_t v18 = 43;
            }
            v12(3, "%c[%{public}s %{public}s]:%i Invalid aid: %{public}@", v18, ClassName, Name, 95, v17);

            v7 = &CC_SHA256_ptr;
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v19 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = object_getClass(self);
            if (class_isMetaClass(v20)) {
              int v21 = 43;
            }
            else {
              int v21 = 45;
            }
            v22 = object_getClassName(self);
            v23 = sel_getName(a2);
            v24 = [v4 objectAtIndex:v6];
            *(_DWORD *)buf = 67110146;
            int v28 = v21;
            __int16 v29 = 2082;
            v30 = v22;
            v7 = &CC_SHA256_ptr;
            __int16 v31 = 2082;
            v32 = v23;
            __int16 v33 = 1024;
            int v34 = 95;
            __int16 v35 = 2114;
            v36 = v24;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid aid: %{public}@", buf, 0x2Cu);
          }
        }

        ++v6;
      }
      while ((unint64_t)[v4 count] > v6);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NFRemoteAdminRedirectState)initWithDictionary:(id)a3 sourceURL:(id)a4 originator:(id)a5 initialStep:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = +[NSDate date];
  v34.receiver = self;
  v34.super_class = (Class)NFRemoteAdminRedirectState;
  v14 = [(NFRemoteAdminState *)&v34 initWithIdentifier:v11 sourceURL:v12 retryDate:v13];

  if (v14)
  {
    v14->_step = a6;
    uint64_t v15 = [v10 NF_stringForKey:@"kBatchId"];
    batchId = v14->_batchId;
    v14->_batchId = (NSString *)v15;

    uint64_t v17 = [v10 NF_stringForKey:@"kTaskId"];
    taskId = v14->_taskId;
    v14->_taskId = (NSString *)v17;

    uint64_t v19 = [v10 NF_stringForKey:@"targetSEID"];
    seid = v14->_seid;
    v14->_seid = (NSString *)v19;

    int v21 = [v10 NF_dictionaryForKey:@"redirectRequest"];
    v22 = [v21 NF_arrayForKey:@"whitelistedInstances"];
    if (!v22)
    {
      v22 = [v10 NF_arrayForKey:@"whitelistedInstances"];
    }
    uint64_t v23 = [(NFRemoteAdminRedirectState *)v14 _extractAidsFromStringArray:v22];
    whitelistedInstances = v14->_whitelistedInstances;
    v14->_whitelistedInstances = (NSArray *)v23;

    if (v21)
    {
      uint64_t v25 = [v21 NF_stringForKey:@"targetURL"];
      redirectUrl = v14->_redirectUrl;
      v14->_redirectUrl = (NSString *)v25;

      uint64_t v27 = [v21 NF_dictionaryForKey:@"forwardData"];
      forwardDataToSP = v14->_forwardDataToSP;
      v14->_forwardDataToSP = (NSDictionary *)v27;

      uint64_t v29 = [v21 NF_numberForKey:@"version"];
      version = v14->_version;
      v14->_version = (NSNumber *)v29;
    }
    __int16 v31 = objc_alloc_init(NFRemoteAdminRedirectStatePerformanceMetrics);
    performanceMetrics = v14->_performanceMetrics;
    v14->_performanceMetrics = v31;
  }
  return v14;
}

- (id)_redirectResult
{
  v3 = objc_opt_new();
  [(NFRemoteAdminRedirectStatePerformanceMetrics *)self->_performanceMetrics totalAPDUTime];
  v5 = +[NSNumber numberWithInteger:(uint64_t)(v4 * 1000.0)];
  [v3 setObject:v5 forKeyedSubscript:@"totalRedirectAPDUResponseTimeInMS"];

  [(NFRemoteAdminRedirectStatePerformanceMetrics *)self->_performanceMetrics totalSessionTime];
  v7 = +[NSNumber numberWithInteger:(uint64_t)(v6 * 1000.0)];
  [v3 setObject:v7 forKeyedSubscript:@"totalSessionTimeInMS"];

  v8 = objc_opt_new();
  v9 = v8;
  httpStatus = self->_httpStatus;
  if (httpStatus) {
    [v8 setObject:httpStatus forKeyedSubscript:@"HTTPStatusCode"];
  }
  spStatusCode = self->_spStatusCode;
  if (spStatusCode) {
    [v9 setObject:spStatusCode forKeyedSubscript:@"SPStatusCode"];
  }
  incompleteReason = self->_incompleteReason;
  if (incompleteReason) {
    [v9 setObject:incompleteReason forKeyedSubscript:@"clientIncompleteReason"];
  }
  forwardDataToSMP = self->_forwardDataToSMP;
  if (forwardDataToSMP) {
    [v9 setObject:forwardDataToSMP forKeyedSubscript:@"forwardData"];
  }
  notification = self->_notification;
  if (notification) {
    [v9 setObject:notification forKeyedSubscript:@"kNotification"];
  }
  uint64_t v15 = [(NFRemoteAdminState *)self unsentScriptResponse];

  if (v15)
  {
    v16 = [(NFRemoteAdminState *)self unsentScriptResponse];
    [v9 setObject:v16 forKeyedSubscript:@"pendingSPResponse"];
  }
  uint64_t v17 = [(NFRemoteAdminRedirectStatePerformanceMetrics *)self->_performanceMetrics asDictionary];
  [v9 addEntriesFromDictionary:v17];

  [v3 setObject:v9 forKeyedSubscript:@"redirectResponse"];

  return v3;
}

- (id)redirectResponse
{
  v3 = objc_opt_new();
  [v3 setObject:&off_10005B2D8 forKeyedSubscript:@"kVersion"];
  taskId = self->_taskId;
  if (taskId) {
    [v3 setObject:taskId forKeyedSubscript:@"kTaskId"];
  }
  batchId = self->_batchId;
  if (batchId) {
    [v3 setObject:batchId forKeyedSubscript:@"kBatchId"];
  }
  double v6 = [(NFRemoteAdminRedirectState *)self _redirectResult];
  [v3 addEntriesFromDictionary:v6];

  return v3;
}

- (void)incrementStep
{
  unint64_t step = self->_step;
  if (step <= 2) {
    self->_unint64_t step = step + 1;
  }
}

- (BOOL)isComplete
{
  return (unint64_t)(self->_step - 3) < 2;
}

- (void)incrementLongRetry
{
  uint64_t v4 = [(NFRemoteAdminState *)self retryInterval];
  double v6 = (void *)v4;
  if (!v4)
  {
    unint64_t v7 = 0;
    goto LABEL_4;
  }
  unint64_t v7 = *(void *)(v4 + 8);
  if (v7 <= 0x18)
  {
    *(void *)(v4 + 8) = v7 + 1;
LABEL_4:
    LODWORD(v5) = dword_100045068[v7];
    v9 = +[NSDate dateWithTimeIntervalSinceNow:(double)v5];
    if (v6) {
      objc_setProperty_nonatomic_copy(v6, v8, v9, 16);
    }

    [(NFRemoteAdminState *)self updateNextRetryInterval:v6];
    goto LABEL_17;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v11 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(3, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", v15, ClassName, Name, 199);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v18;
    __int16 v22 = 2082;
    uint64_t v23 = object_getClassName(self);
    __int16 v24 = 2082;
    uint64_t v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 199;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retried too many times.  Giving up.", buf, 0x22u);
  }

  self->_unint64_t step = 3;
LABEL_17:
}

- (void)save
{
  sub_100037740();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  sub_10003A07C(v2);
}

- (id)description
{
  uint64_t v3 = [(NFRemoteAdminState *)self retryInterval];
  uint64_t v4 = (id *)v3;
  if (v3)
  {
    id v5 = *(id *)(v3 + 16);
    if (v5)
    {
      id v6 = v4[2];
      [v6 timeIntervalSinceNow];
      uint64_t v8 = v7;

      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v8 = 0;
LABEL_6:

  id v18 = objc_alloc((Class)NSString);
  v19.receiver = self;
  v19.super_class = (Class)NFRemoteAdminRedirectState;
  v9 = [(NFRemoteAdminState *)&v19 description];
  id v10 = [(NFRemoteAdminRedirectState *)self batchId];
  id v11 = [(NFRemoteAdminRedirectState *)self taskId];
  id v12 = [(NFRemoteAdminRedirectState *)self redirectUrl];
  v13 = [(NFRemoteAdminRedirectState *)self version];
  v14 = [(NFRemoteAdminRedirectState *)self httpStatus];
  uint64_t v15 = [(NFRemoteAdminRedirectState *)self spStatusCode];
  id v16 = [v18 initWithFormat:@"%@ { batchId=%@ taskid=%@ redirectUrl=%@ version=%@ httpStatus=%@ spStatus=%@ step=%d retryAfter=%f pendingImmediateRetry=%d}", v9, v10, v11, v12, v13, v14, v15, -[NFRemoteAdminRedirectState step](self, "step"), v8, -[NFRemoteAdminState pendingImmediateRetry](self, "pendingImmediateRetry")];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminRedirectState)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NFRemoteAdminRedirectState;
  id v5 = [(NFRemoteAdminState *)&v40 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSSet);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = [v6 initWithObjects:v7, v8, v9, v10, objc_opt_class(), 0];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchId"];
    batchId = v5->_batchId;
    v5->_batchId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
    taskId = v5->_taskId;
    v5->_taskId = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redirectUrl"];
    redirectUrl = v5->_redirectUrl;
    v5->_redirectUrl = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v11 forKey:@"forwardDataToSMP"];
    forwardDataToSMP = v5->_forwardDataToSMP;
    v5->_forwardDataToSMP = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v11 forKey:@"forwardDataToSP"];
    forwardDataToSP = v5->_forwardDataToSP;
    v5->_forwardDataToSP = (NSDictionary *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v11 forKey:@"notification"];
    notification = v5->_notification;
    v5->_notification = (NSDictionary *)v24;

    uint64_t v26 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"whitelistedInstances"];
    whitelistedInstances = v5->_whitelistedInstances;
    v5->_whitelistedInstances = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incompleteReason"];
    incompleteReason = v5->_incompleteReason;
    v5->_incompleteReason = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"httpStatus"];
    httpStatus = v5->_httpStatus;
    v5->_httpStatus = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spStatusCode"];
    spStatusCode = v5->_spStatusCode;
    v5->_spStatusCode = (NSNumber *)v32;

    objc_super v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"step"];
    v5->_unint64_t step = (int64_t)[v34 integerValue];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"performanceMetrics"];
    performanceMetrics = v5->_performanceMetrics;
    v5->_performanceMetrics = (NFRemoteAdminRedirectStatePerformanceMetrics *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    seid = v5->_seid;
    v5->_seid = (NSString *)v37;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NFRemoteAdminRedirectState;
  id v4 = a3;
  [(NFRemoteAdminState *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_batchId forKey:@"batchId" v6.receiver, v6.super_class];
  [v4 encodeObject:self->_taskId forKey:@"taskId"];
  [v4 encodeObject:self->_redirectUrl forKey:@"redirectUrl"];
  [v4 encodeObject:self->_version forKey:@"version"];
  [v4 encodeObject:self->_forwardDataToSMP forKey:@"forwardDataToSMP"];
  [v4 encodeObject:self->_forwardDataToSP forKey:@"forwardDataToSP"];
  [v4 encodeObject:self->_incompleteReason forKey:@"incompleteReason"];
  [v4 encodeObject:self->_notification forKey:@"notification"];
  [v4 encodeObject:self->_httpStatus forKey:@"httpStatus"];
  [v4 encodeObject:self->_spStatusCode forKey:@"spStatusCode"];
  id v5 = +[NSNumber numberWithInteger:self->_step];
  [v4 encodeObject:v5 forKey:@"step"];

  [v4 encodeObject:self->_performanceMetrics forKey:@"performanceMetrics"];
  [v4 encodeObject:self->_whitelistedInstances forKey:@"whitelistedInstances"];
  [v4 encodeObject:self->_seid forKey:@"seid"];
}

- (NSString)batchId
{
  return self->_batchId;
}

- (void)setBatchId:(id)a3
{
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
}

- (NSString)redirectUrl
{
  return self->_redirectUrl;
}

- (void)setRedirectUrl:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSDictionary)forwardDataToSMP
{
  return self->_forwardDataToSMP;
}

- (void)setForwardDataToSMP:(id)a3
{
}

- (NSDictionary)forwardDataToSP
{
  return self->_forwardDataToSP;
}

- (void)setForwardDataToSP:(id)a3
{
}

- (NSString)incompleteReason
{
  return self->_incompleteReason;
}

- (void)setIncompleteReason:(id)a3
{
}

- (NSDictionary)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSArray)whitelistedInstances
{
  return self->_whitelistedInstances;
}

- (void)setWhitelistedInstances:(id)a3
{
}

- (NSNumber)httpStatus
{
  return self->_httpStatus;
}

- (void)setHttpStatus:(id)a3
{
}

- (NSNumber)spStatusCode
{
  return self->_spStatusCode;
}

- (void)setSpStatusCode:(id)a3
{
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NFRemoteAdminRedirectStatePerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (int64_t)step
{
  return self->_step;
}

- (void)setStep:(int64_t)a3
{
  self->_unint64_t step = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_spStatusCode, 0);
  objc_storeStrong((id *)&self->_httpStatus, 0);
  objc_storeStrong((id *)&self->_whitelistedInstances, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_incompleteReason, 0);
  objc_storeStrong((id *)&self->_forwardDataToSP, 0);
  objc_storeStrong((id *)&self->_forwardDataToSMP, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_redirectUrl, 0);
  objc_storeStrong((id *)&self->_taskId, 0);

  objc_storeStrong((id *)&self->_batchId, 0);
}

@end