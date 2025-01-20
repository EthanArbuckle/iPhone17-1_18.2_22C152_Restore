@interface TCCDEventFilter
- (BOOL)matches:(id)a3;
- (TCCDEventFilter)initWithCriteria:(id)a3;
@end

@implementation TCCDEventFilter

- (TCCDEventFilter)initWithCriteria:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TCCDEventFilter;
  v5 = [(TCCDEventFilter *)&v39 init];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = tcc_events_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100037174();
    }
LABEL_32:

    v22 = 0;
    goto LABEL_33;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = v6;
  id v30 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v30) {
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)v36;
  v9 = TCCDSyncRequestAccessAction;
  v27 = v6;
  id v28 = v4;
  v29 = v7;
  uint64_t v26 = *(void *)v36;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(void *)v36 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = tcc_events_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000370F8();
        }
        goto LABEL_38;
      }
      v12 = [&v9[66] currentPlatform];
      v13 = [v12 serviceByName:v11];

      if (!v13)
      {
        v25 = tcc_events_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100036F64(v11, v25);
        }
LABEL_38:

        v6 = v27;
        id v4 = v28;
        goto LABEL_32;
      }
      v14 = [v7 objectForKeyedSubscript:v11];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = tcc_events_log();
          v6 = v27;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10003707C();
          }
LABEL_31:

          id v4 = v28;
          goto LABEL_32;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v15 = v14;
        id v16 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v32;
          while (2)
          {
            v19 = 0;
            do
            {
              if (*(void *)v32 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v19);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v23 = tcc_events_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  sub_100036FDC(v20, (uint64_t)v15, v23);
                }

                v6 = v27;
                v7 = v29;
                goto LABEL_31;
              }
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        v7 = v29;
        uint64_t v8 = v26;
        v9 = TCCDSyncRequestAccessAction;
      }

      v10 = (char *)v10 + 1;
    }
    while (v10 != v30);
    id v4 = v28;
    id v30 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v30) {
      continue;
    }
    break;
  }
LABEL_24:

  servicesToSubjects = v5->_servicesToSubjects;
  v5->_servicesToSubjects = (NSDictionary *)v7;

LABEL_25:
  v22 = v5;
LABEL_33:

  return v22;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  if ([(NSDictionary *)self->_servicesToSubjects count])
  {
    servicesToSubjects = self->_servicesToSubjects;
    v6 = [v4 service];
    v7 = [v6 name];
    uint64_t v8 = [(NSDictionary *)servicesToSubjects objectForKeyedSubscript:v7];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue] & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v4 subjectIdentifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v10 = [v8 containsObject:v9],
          v9,
          (v10 & 1) != 0))
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      v12 = [(NSDictionary *)self->_servicesToSubjects objectForKeyedSubscript:@"kTCCServiceAll"];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue])
      {
        unsigned __int8 v11 = 1;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v4 subjectIdentifier];
          unsigned __int8 v11 = [v12 containsObject:v13];
        }
        else
        {
          unsigned __int8 v11 = 0;
        }
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end