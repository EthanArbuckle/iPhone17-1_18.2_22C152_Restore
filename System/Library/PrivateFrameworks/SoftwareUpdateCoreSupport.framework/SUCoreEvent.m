@interface SUCoreEvent
+ (BOOL)isSharediPad;
- (BOOL)changedSinceReported;
- (BOOL)isEqualErrorEvent:(id)a3;
- (BOOL)isSuccess;
- (NSMutableDictionary)allFields;
- (NSString)reportedUUID;
- (NSURL)serverURL;
- (SUCoreEvent)initWithEventDictionary:(id)a3 extendingWith:(id)a4 reportingToServer:(id)a5;
- (id)getAugmentedEvent;
- (void)incrementErrorCount;
- (void)setAllFields:(id)a3;
- (void)setChangedSinceReported:(BOOL)a3;
- (void)setReportedUUID:(id)a3;
- (void)setServerURL:(id)a3;
@end

@implementation SUCoreEvent

- (SUCoreEvent)initWithEventDictionary:(id)a3 extendingWith:(id)a4 reportingToServer:(id)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v105.receiver = self;
  v105.super_class = (Class)SUCoreEvent;
  v11 = [(SUCoreEvent *)&v105 init];
  if (!v11) {
    goto LABEL_30;
  }
  uint64_t v12 = objc_opt_new();
  allFields = v11->_allFields;
  v11->_allFields = (NSMutableDictionary *)v12;

  v14 = [v8 safeStringForKey:@"event"];

  if (!v14) {
    [(NSMutableDictionary *)v11->_allFields setSafeObject:@"SUCoreEvent" forKey:@"event"];
  }
  id v93 = v10;
  v15 = [v8 safeStringForKey:@"UUID"];
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v16 UUIDString];

    [(NSMutableDictionary *)v11->_allFields setSafeObject:v15 forKey:@"UUID"];
  }
  v92 = v15;
  objc_storeStrong((id *)&v11->_reportedUUID, v15);
  objc_storeStrong((id *)&v11->_serverURL, a5);
  v17 = +[SUCoreDevice sharedDevice];
  v18 = [v17 buildVersion];

  v19 = +[SUCoreDevice sharedDevice];
  uint64_t v20 = [v19 splatCryptex1BuildVersion];

  v90 = (void *)v20;
  if (v20) {
    v21 = (void *)v20;
  }
  else {
    v21 = v18;
  }
  id v22 = v21;
  v23 = +[SUCoreDevice sharedDevice];
  v100 = [v23 splatCryptex1ProductVersionExtra];

  v24 = (void *)MEMORY[0x1E4F28ED0];
  v25 = +[SUCoreDevice sharedDevice];
  v99 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "hasSplatOnlyUpdateInstalled"));

  v26 = (void *)MEMORY[0x1E4F28ED0];
  v27 = +[SUCoreDevice sharedDevice];
  v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "hasSemiSplatActive"));

  v29 = +[SUCoreDevice sharedDevice];
  v30 = [v29 releaseType];

  v31 = +[SUCoreDevice sharedDevice];
  v98 = [v31 deviceClass];

  v32 = +[SUCoreDevice sharedDevice];
  v97 = [v32 hwModelString];

  v96 = (void *)MGCopyAnswer();
  v95 = (void *)MGCopyAnswer();
  v33 = +[SUCoreLog sharedLogger];
  v34 = [v33 oslog];

  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = v30;
      v36 = "non-nil currentOSType found with value of: %{public}@";
LABEL_14:
      _os_log_impl(&dword_1B4EC2000, v34, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    }
  }
  else
  {
    v30 = @"user";
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = @"user";
      v36 = "nil currentOSType found, setting the currentOSType to: %{public}@";
      goto LABEL_14;
    }
  }

  v86 = (void *)[[NSString alloc] initWithFormat:@"SUCore-%@", @"2.1.0"];
  -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:");
  [(NSMutableDictionary *)v11->_allFields setSafeObject:@"1.2" forKey:@"reportVersion"];
  v37 = v11->_allFields;
  v38 = _currentTimeInMilliseconds();
  v39 = _ensureNSString(v38);
  [(NSMutableDictionary *)v37 setSafeObject:v39 forKey:@"eventTime"];

  v40 = v11->_allFields;
  v87 = v30;
  v41 = _ensureNSString(v30);
  [(NSMutableDictionary *)v40 setSafeObject:v41 forKey:@"currentOSType"];

  v42 = v11->_allFields;
  v89 = v22;
  v43 = _ensureNSString(v22);
  [(NSMutableDictionary *)v42 setSafeObject:v43 forKey:@"currentOSVersion"];

  v44 = v11->_allFields;
  v91 = v18;
  v45 = _ensureNSString(v18);
  [(NSMutableDictionary *)v44 setSafeObject:v45 forKey:@"currentBaseOSVersion"];

  v46 = v11->_allFields;
  v47 = _ensureNSString(v100);
  [(NSMutableDictionary *)v46 setSafeObject:v47 forKey:@"currentProductVersionExtra"];

  v48 = v11->_allFields;
  v49 = _ensureNSNumber(v99);
  [(NSMutableDictionary *)v48 setSafeObject:v49 forKey:@"rapidSecurityResponseInstalled"];

  v50 = v11->_allFields;
  v88 = v28;
  v51 = _ensureNSNumber(v28);
  [(NSMutableDictionary *)v50 setSafeObject:v51 forKey:@"rapidSecurityResponseSemiSplat"];

  v52 = v11->_allFields;
  v53 = _ensureNSString(v98);
  [(NSMutableDictionary *)v52 setSafeObject:v53 forKey:@"deviceClass"];

  v54 = v11->_allFields;
  v55 = _ensureNSString(v97);
  [(NSMutableDictionary *)v54 setSafeObject:v55 forKey:@"deviceModel"];

  v56 = v11->_allFields;
  v57 = _ensureNSNumber(v96);
  [(NSMutableDictionary *)v56 setSafeObject:v57 forKey:@"batteryLevel"];

  v58 = v11->_allFields;
  v59 = _ensureNSNumber(v95);
  [(NSMutableDictionary *)v58 setSafeObject:v59 forKey:@"batteryIsCharging"];

  if ([(id)objc_opt_class() isSharediPad]) {
    v60 = @"true";
  }
  else {
    v60 = @"false";
  }
  v61 = v11->_allFields;
  v62 = _ensureNSString(v60);
  [(NSMutableDictionary *)v61 setSafeObject:v62 forKey:@"sharediPad"];

  v63 = (void *)MGCopyAnswer();
  v64 = v11->_allFields;
  v65 = _ensureNSNumberFromDictionary(*MEMORY[0x1E4FBA0F8], v63);
  [(NSMutableDictionary *)v64 setSafeObject:v65 forKey:@"storageCapacity"];

  v66 = v11->_allFields;
  v67 = _ensureNSNumberFromDictionary(*MEMORY[0x1E4FBA108], v63);
  [(NSMutableDictionary *)v66 setSafeObject:v67 forKey:@"systemFsCapacity"];

  v68 = v11->_allFields;
  v69 = _ensureNSNumberFromDictionary(*MEMORY[0x1E4FBA100], v63);
  [(NSMutableDictionary *)v68 setSafeObject:v69 forKey:@"systemFsFree"];

  v70 = v11->_allFields;
  v71 = _ensureNSNumberFromDictionary(*MEMORY[0x1E4FBA0F0], v63);
  [(NSMutableDictionary *)v70 setSafeObject:v71 forKey:@"dataFsCapacity"];

  v72 = v11->_allFields;
  v73 = _ensureNSNumberFromDictionary(*MEMORY[0x1E4FBA0E8], v63);
  [(NSMutableDictionary *)v72 setSafeObject:v73 forKey:@"dataFsFree"];

  v74 = [v8 safeStringForKey:@"result"];

  if (!v74) {
    [(NSMutableDictionary *)v11->_allFields setSafeObject:@"success" forKey:@"result"];
  }
  id v94 = v8;
  [(NSMutableDictionary *)v11->_allFields addEntriesFromDictionary:v8];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v75 = v9;
  id v76 = v9;
  uint64_t v77 = [v76 countByEnumeratingWithState:&v101 objects:v106 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v102 != v79) {
          objc_enumerationMutation(v76);
        }
        uint64_t v81 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        v82 = [(NSMutableDictionary *)v11->_allFields objectForKey:v81];

        if (!v82)
        {
          v83 = v11->_allFields;
          v84 = [v76 objectForKey:v81];
          [(NSMutableDictionary *)v83 setSafeObject:v84 forKey:v81];
        }
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v101 objects:v106 count:16];
    }
    while (v78);
  }

  v11->_changedSinceReported = 0;
  id v9 = v75;
  id v10 = v93;
  id v8 = v94;
LABEL_30:

  return v11;
}

- (BOOL)isSuccess
{
  v2 = [(SUCoreEvent *)self allFields];
  v3 = [v2 safeStringForKey:@"result"];

  if (v3) {
    char v4 = [v3 isEqualToString:@"success"];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isEqualErrorEvent:(id)a3
{
  char v4 = (SUCoreEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(SUCoreEvent *)self isSuccess] || [(SUCoreEvent *)v4 isSuccess])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [(SUCoreEvent *)self serverURL];
    v7 = [v6 absoluteString];
    id v8 = [(SUCoreEvent *)v4 serverURL];
    id v9 = [v8 absoluteString];
    if (+[SUCore stringIsEqual:v7 to:v9])
    {
      v25 = [(SUCoreEvent *)self allFields];
      id v10 = [v25 safeStringForKey:@"event"];
      v24 = [(SUCoreEvent *)v4 allFields];
      v11 = [v24 safeStringForKey:@"event"];
      if (+[SUCore stringIsEqual:v10 to:v11])
      {
        v23 = v10;
        uint64_t v12 = [(SUCoreEvent *)self reportedUUID];
        uint64_t v13 = [(SUCoreEvent *)v4 reportedUUID];
        id v22 = (void *)v12;
        uint64_t v14 = v12;
        v15 = (void *)v13;
        if (+[SUCore stringIsEqual:v14 to:v13])
        {
          v21 = [(SUCoreEvent *)self allFields];
          uint64_t v16 = [v21 safeStringForKey:@"result"];
          uint64_t v20 = [(SUCoreEvent *)v4 allFields];
          v17 = [v20 safeStringForKey:@"result"];
          v18 = (void *)v16;
          BOOL v5 = +[SUCore stringIsEqual:v16 to:v17];
        }
        else
        {
          BOOL v5 = 0;
        }

        id v10 = v23;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (void)incrementErrorCount
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "incrementErrorCount when event does not represent an error (no result)", v1, 2u);
}

- (id)getAugmentedEvent
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  char v4 = [(SUCoreEvent *)self allFields];
  BOOL v5 = (void *)[v3 initWithDictionary:v4];

  return v5;
}

+ (BOOL)isSharediPad
{
  if (!objc_opt_class())
  {
    v7 = +[SUCoreLog sharedLogger];
    id v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v9 = "[EVENT_REPORTER] UMUserManager class does not exist.";
      id v10 = (uint8_t *)&v14;
LABEL_12:
      _os_log_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_13:

    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = +[SUCoreLog sharedLogger];
    id v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      id v9 = "[EVENT_REPORTER] UMUserManager class does not respond to selector 'sharedManager'";
      id v10 = v15;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v2 = (void *)MEMORY[0x1BA994660]();
  id v3 = [MEMORY[0x1E4FB36F0] sharedManager];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v12 = +[SUCoreLog sharedLogger];
    uint64_t v13 = [v12 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UMUserManager instance does not respond to selector 'isSharedIPad'", v16, 2u);
    }

    goto LABEL_17;
  }
  if (![v3 isSharedIPad])
  {
LABEL_17:

    return 0;
  }
  char v4 = +[SUCoreLog sharedLogger];
  BOOL v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4EC2000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] Detected shared iPad", buf, 2u);
  }

  return 1;
}

- (NSMutableDictionary)allFields
{
  return self->_allFields;
}

- (void)setAllFields:(id)a3
{
}

- (BOOL)changedSinceReported
{
  return self->_changedSinceReported;
}

- (void)setChangedSinceReported:(BOOL)a3
{
  self->_changedSinceReported = a3;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
}

- (NSString)reportedUUID
{
  return self->_reportedUUID;
}

- (void)setReportedUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedUUID, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_allFields, 0);
}

@end