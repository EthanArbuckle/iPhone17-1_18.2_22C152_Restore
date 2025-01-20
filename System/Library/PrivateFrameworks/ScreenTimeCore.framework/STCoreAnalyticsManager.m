@interface STCoreAnalyticsManager
- (NSBackgroundActivityScheduler)backgroundActivity;
- (STCoreAnalyticsManager)initWithPersistenceController:(id)a3;
- (STPersistenceControllerProtocol)persistenceController;
- (id)_createCommunicationSafetyStateEventWithContext:(id)a3;
- (id)_createRecoveryEmailMismatchEventWithContext:(id)a3;
- (id)_createWebContentFilterEventWithContext:(id)a3;
- (void)startSendingEvents;
@end

@implementation STCoreAnalyticsManager

- (STCoreAnalyticsManager)initWithPersistenceController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STCoreAnalyticsManager;
  v6 = [(STCoreAnalyticsManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceController, a3);
    v8 = (NSBackgroundActivityScheduler *)[objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.screentime.activity.analytics"];
    backgroundActivity = v7->_backgroundActivity;
    v7->_backgroundActivity = v8;
  }
  return v7;
}

- (void)startSendingEvents
{
  v3 = [(STCoreAnalyticsManager *)self backgroundActivity];
  [v3 setPreregistered:1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009B1F8;
  v4[3] = &unk_1002FE8A8;
  v4[4] = self;
  [v3 scheduleWithBlock:v4];
}

- (id)_createCommunicationSafetyStateEventWithContext:(id)a3
{
  id v8 = 0;
  v3 = +[STCoreUser fetchLocalUserInContext:a3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = objc_msgSend(objc_alloc((Class)STCommunicationSafetyStateCoreAnalyticsEvent), "initWithCommunicationSafetyEnabled:", objc_msgSend(v3, "isCommunicationSafetyReceivingRestricted"));
  }
  else
  {
    v6 = +[STLog coreAnalytics];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100269188((uint64_t)v4, v6);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)_createWebContentFilterEventWithContext:(id)a3
{
  id v32 = 0;
  v3 = +[STCoreUser fetchLocalUserInContext:a3 error:&v32];
  id v4 = v32;
  if (v3)
  {
    id v5 = [v3 dsid];
    uint64_t v6 = STBlueprintTypeRestrictions;
    v7 = [v3 managingOrganization];
    id v8 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v5 ofType:v6 fromOrganization:v7];

    id v31 = v4;
    v9 = [v8 execute:&v31];
    id v10 = v31;

    if (v9)
    {
      objc_super v11 = [v9 firstObject];
      v12 = v11;
      if (v11 && [v11 enabled])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v13 = [v12 configurations];
        id v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v14)
        {
          id v15 = v14;
          v28 = v12;
          id v29 = v10;
          v30 = v8;
          uint64_t v16 = STBlueprintConfigurationTypeSystemWebContentFilterBasic;
          uint64_t v17 = *(void *)v34;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v13);
              }
              v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              v20 = [v19 type];
              unsigned __int8 v21 = [v20 isEqualToString:v16];

              if (v21)
              {
                id v22 = v19;
                goto LABEL_18;
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
            if (v15) {
              continue;
            }
            break;
          }
          id v22 = 0;
LABEL_18:
          id v10 = v29;
          id v8 = v30;
          v12 = v28;
        }
        else
        {
          id v22 = 0;
        }

        if (v22)
        {
          v24 = [v22 cemConfiguration];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v25 = [v24 payloadUseContentFilter];
            id v23 = [v25 BOOLValue];
          }
          else
          {
            id v23 = 0;
          }
        }
        else
        {
          id v23 = 0;
        }
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v23 = 0;
    }

    id v4 = v10;
  }
  else
  {
    id v23 = 0;
  }
  id v26 = [objc_alloc((Class)STWebContentFilterCoreAnalyticsEvent) initWithWebContentFilterEnabled:v23];

  return v26;
}

- (id)_createRecoveryEmailMismatchEventWithContext:(id)a3
{
  id v14 = 0;
  v3 = +[STCoreUser fetchLocalUserInContext:a3 error:&v14];
  id v4 = v14;
  if (v3)
  {
    if (([v3 isManaged] & 1) == 0)
    {
      uint64_t v5 = [v3 effectivePasscode];
      if (!v5) {
        goto LABEL_10;
      }
      id v8 = [v3 effectiveRecoveryAltDSID];

      if (v8)
      {
        v9 = objc_opt_new();
        id v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
        objc_super v11 = objc_msgSend(v10, "aa_altDSID");
        v12 = [v3 effectiveRecoveryAltDSID];
        uint64_t v5 = [v12 isEqualToString:v11] ^ 1;

        goto LABEL_10;
      }
    }
    uint64_t v5 = 0;
LABEL_10:
    id v7 = [objc_alloc((Class)STRecoveryEmailMismatchCoreAnalyticsEvent) initWithRecoveryEmailMismatched:v5];
    goto LABEL_11;
  }
  uint64_t v6 = +[STLog coreAnalytics];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100269188((uint64_t)v4, v6);
  }

  id v7 = 0;
LABEL_11:

  return v7;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSBackgroundActivityScheduler)backgroundActivity
{
  return self->_backgroundActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
}

@end