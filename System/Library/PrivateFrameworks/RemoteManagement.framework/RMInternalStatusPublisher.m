@interface RMInternalStatusPublisher
+ (NSSet)supportedKeyPaths;
+ (RMInternalStatusPublisher)sharedPublisher;
+ (id)restrictedKeyPaths;
+ (void)start;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSSet)supportedKeyPaths;
- (RMInternalStatusPublisher)initWithInternalDeviceStatusByKeyPath:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 persistentHistoryNotifier:(id)a5 context:(id)a6;
- (RMInternalStatusPublisherDelegate)delegate;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater;
- (id)_queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementSource:(id)a4;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyInternalDeviceStatusChangesIfNeeded;
- (void)_start;
- (void)_stop;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSubscribedStatusKeyPathUpdater:(id)a3;
@end

@implementation RMInternalStatusPublisher

+ (RMInternalStatusPublisher)sharedPublisher
{
  if (qword_1000DB1C0 != -1) {
    dispatch_once(&qword_1000DB1C0, &stru_1000C6080);
  }
  v2 = (void *)qword_1000DB1B8;

  return (RMInternalStatusPublisher *)v2;
}

- (RMInternalStatusPublisher)initWithInternalDeviceStatusByKeyPath:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 persistentHistoryNotifier:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RMInternalStatusPublisher;
  v14 = [(RMInternalStatusPublisher *)&v22 init];
  v15 = v14;
  if (v14)
  {
    if (v10) {
      v16 = v10;
    }
    else {
      v16 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v14->_internalDeviceStatusByKeyPath, v16);
    objc_storeStrong((id *)&v15->_subscribedStatusKeyPathUpdater, a4);
    objc_storeStrong((id *)&v15->_persistentHistoryNotifier, a5);
    objc_storeStrong((id *)&v15->_context, a6);
    uint64_t v17 = objc_opt_new();
    internalDeviceStatusByKeyPathLock = v15->_internalDeviceStatusByKeyPathLock;
    v15->_internalDeviceStatusByKeyPathLock = v17;

    uint64_t v19 = objc_opt_new();
    internalDeviceStatusByKeyPathNotificationLock = v15->_internalDeviceStatusByKeyPathNotificationLock;
    v15->_internalDeviceStatusByKeyPathNotificationLock = v19;
  }
  return v15;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041764;
  block[3] = &unk_1000C5160;
  block[4] = a1;
  if (qword_1000DB1C8 != -1) {
    dispatch_once(&qword_1000DB1C8, block);
  }
}

- (void)_start
{
  v3 = _os_activity_create((void *)&_mh_execute_header, "InternalStatusPublisher: Starting...", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  v4 = +[RMLog internalStatusPublisher];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100047484(v4);
  }

  v5 = [(RMInternalStatusPublisher *)self persistentHistoryNotifier];
  [v5 setDelegate:self];
  [v5 start];
  v6 = +[RMLog internalStatusPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100047440(v6);
  }

  [(RMInternalStatusPublisher *)self _notifyInternalDeviceStatusChangesIfNeeded];
  os_activity_scope_leave(&v7);
}

- (void)_stop
{
  [(RMInternalStatusPublisher *)self setSubscribedStatusKeyPathUpdater:0];
  id v3 = [(RMInternalStatusPublisher *)self persistentHistoryNotifier];
  [v3 setDelegate:0];
}

- (void)_notifyInternalDeviceStatusChangesIfNeeded
{
  v28 = self->_internalDeviceStatusByKeyPathNotificationLock;
  objc_sync_enter(v28);
  v36 = objc_opt_new();
  obj = self->_internalDeviceStatusByKeyPathLock;
  objc_sync_enter(obj);
  v27 = self;
  location = (id *)&self->_internalDeviceStatusByKeyPath;
  id v3 = self->_internalDeviceStatusByKeyPath;
  v4 = +[RMDevice currentDevice];
  v45[0] = RMModelStatusItemDeviceModelFamily;
  v35 = [v4 modelFamily];
  *(void *)buf = v35;
  v45[1] = RMModelStatusItemDeviceModelIdentifier;
  v34 = [v4 modelIdentifier];
  *(void *)&buf[8] = v34;
  v45[2] = RMModelStatusItemDeviceModelMarketingName;
  v33 = [v4 modelMarketingName];
  *(void *)&buf[16] = v33;
  v45[3] = RMModelStatusItemDeviceModelNumber;
  v32 = [v4 modelNumber];
  v47 = v32;
  v45[4] = RMModelStatusItemDeviceOperatingSystemBuildVersion;
  v31 = [v4 operatingSystemBuildVersion];
  v48 = v31;
  v45[5] = RMModelStatusItemDeviceOperatingSystemFamily;
  v30 = [v4 operatingSystem];
  v49 = v30;
  v45[6] = RMModelStatusItemDeviceOperatingSystemMarketingName;
  v5 = [v4 operatingSystemMarketingName];
  v50 = v5;
  v45[7] = RMModelStatusItemDeviceOperatingSystemSupplementalBuildVersion;
  v6 = [v4 operatingSystemSupplementalBuildVersion];
  v51 = v6;
  v45[8] = RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion;
  os_activity_scope_state_s v7 = [v4 operatingSystemSupplementalExtraVersion];
  v52 = v7;
  v45[9] = RMModelStatusItemDeviceOperatingSystemVersion;
  v8 = [v4 operatingSystemVersion];
  v53 = v8;
  v45[10] = RMModelStatusItemDeviceSerialNumber;
  v9 = [v4 serialNumber];
  v54 = v9;
  v45[11] = RMModelStatusItemDeviceUDID;
  id v10 = [v4 UDID];
  v55 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:buf forKeys:v45 count:12];

  if ([v11 isEqual:v3])
  {

    id v12 = obj;
    objc_sync_exit(obj);
LABEL_17:

    goto LABEL_18;
  }
  id v13 = [(NSDictionary *)v3 allKeys];
  v14 = +[NSMutableSet setWithArray:v13];

  v15 = [v11 allKeys];
  [v14 addObjectsFromArray:v15];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v41;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        v21 = [(NSDictionary *)v3 objectForKeyedSubscript:v20];
        objc_super v22 = [v11 objectForKeyedSubscript:v20];
        if (v21 != v22 && ([v21 isEqual:v22] & 1) == 0)
        {
          v23 = +[RMLog internalStatusPublisher];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2114;
            v47 = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Key %{public}@ changed from: %{public}@ to: %{public}@", buf, 0x20u);
          }

          [v36 addObject:v20];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v17);
  }

  objc_storeStrong(location, v11);
  objc_sync_exit(obj);

  if ([v36 count])
  {
    v24 = [(RMInternalStatusPublisher *)v27 subscribedStatusKeyPathUpdater];
    [v24 notifyStatusDidChangeForKeyPaths:v36];

    v25 = [(RMInternalStatusPublisher *)v27 context];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100041F20;
    v37[3] = &unk_1000C5A60;
    v37[4] = v27;
    id v38 = v11;
    v39 = v25;
    id v12 = v39;
    [v39 performBlockAndWait:v37];

    goto LABEL_17;
  }
LABEL_18:

  objc_sync_exit(v28);
}

+ (NSSet)supportedKeyPaths
{
  v5[0] = RMModelStatusItemDeviceModelFamily;
  v5[1] = RMModelStatusItemDeviceModelIdentifier;
  v5[2] = RMModelStatusItemDeviceModelMarketingName;
  v5[3] = RMModelStatusItemDeviceModelNumber;
  v5[4] = RMModelStatusItemDeviceOperatingSystemBuildVersion;
  v5[5] = RMModelStatusItemDeviceOperatingSystemFamily;
  v5[6] = RMModelStatusItemDeviceOperatingSystemMarketingName;
  v5[7] = RMModelStatusItemDeviceOperatingSystemSupplementalBuildVersion;
  v5[8] = RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion;
  v5[9] = RMModelStatusItemDeviceOperatingSystemVersion;
  v5[10] = RMModelStatusItemDeviceSerialNumber;
  v5[11] = RMModelStatusItemDeviceUDID;
  v5[12] = RMModelStatusItemManagementDeclarations;
  v2 = +[NSArray arrayWithObjects:v5 count:13];
  id v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (NSSet)supportedKeyPaths
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 supportedKeyPaths];
}

+ (id)restrictedKeyPaths
{
  v5[0] = RMModelStatusItemDeviceUDID;
  v5[1] = RMModelStatusItemDeviceSerialNumber;
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100042414;
  v34 = sub_100042424;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100042414;
  v28 = sub_100042424;
  id v29 = 0;
  id v10 = [(RMInternalStatusPublisher *)self context];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004242C;
  v17[3] = &unk_1000C60A8;
  id v11 = v9;
  objc_super v22 = &v30;
  v23 = &v24;
  id v18 = v11;
  uint64_t v19 = self;
  id v12 = v8;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [v13 performBlockAndWait:v17];
  v14 = (void *)v31[5];
  if (v14)
  {
    id v15 = 0;
    if (a5) {
      *a5 = v14;
    }
  }
  else
  {
    id v15 = (id)v25[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return [(RMInternalStatusPublisher *)self queryForStatusWithKeyPaths:a3 onBehalfOfManagementChannel:a5 error:a6];
}

- (id)_queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v483 = (id)objc_opt_new();
  uint64_t v409 = RMModelStatusItemManagementDeclarations;
  v410 = v5;
  v411 = v6;
  if (!objc_msgSend(v5, "containsObject:")) {
    goto LABEL_421;
  }
  id v406 = v6;
  id v7 = [v406 activations];
  v431 = objc_opt_new();
  long long v533 = 0u;
  long long v534 = 0u;
  long long v535 = 0u;
  long long v536 = 0u;
  id obj = v7;
  id v439 = [obj countByEnumeratingWithState:&v533 objects:v538 count:16];
  if (v439)
  {
    uint64_t v435 = *(void *)v534;
    v427 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_unknown;
    id v421 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_valid;
    id v424 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_invalid;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v534 != v435)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v447 = v8;
        id v10 = *(void **)(*((void *)&v533 + 1) + 8 * v8);
        if (![v10 loadState]) {
          goto LABEL_104;
        }
        id v463 = v10;
        id v455 = v427;
        v459 = objc_opt_new();
        if ([v463 loadState] == 2)
        {
          id v11 = v424;

          v451 = +[RMModelStatusReason invalidPayloadForDeclaration:v463];
          [v459 addObject:v451];
          BOOL v12 = 0;
          id v455 = v11;
          goto LABEL_100;
        }
        id v13 = v463;
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v14 = [v13 managementSource];
          id v15 = [v14 identifier];
          id v16 = [v13 identifier];
          id v17 = [v13 serverToken];
          v451 = +[RMConfigurationStatusArchiver statusForStoreIdentifier:v15 declarationIdentifier:v16 serverToken:v17];
        }
        else
        {
          *(void *)&long long v539 = @"valid";
          v552 = (void **)&__kCFBooleanTrue;
          v451 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v539 count:1];
        }

        if (v451)
        {
          id v18 = [v451 objectForKeyedSubscript:@"valid"];
          unsigned int v19 = [v18 BOOLValue];
          id v20 = v421;
          if (!v19) {
            id v20 = v424;
          }
          id v21 = v20;

          objc_super v22 = [v451 objectForKeyedSubscript:@"reasons"];
          if (v22) {
            [v459 addObjectsFromArray:v22];
          }

          id v455 = v21;
        }
        id v443 = v13;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v443;
          uint64_t v24 = [v23 state];
          v25 = v24;
          if (v24)
          {
            uint64_t v26 = [v24 inactiveReasons];
            v27 = (void **)v26;
            v28 = &__NSArray0__struct;
            if (v26) {
              v28 = (void *)v26;
            }
            id v29 = v28;
          }
          else
          {
            v27 = +[RMModelStatusReason missingStateForDeclaration:v23];
            v552 = v27;
            id v29 = +[NSArray arrayWithObjects:&v552 count:1];
          }
          id v31 = v29;

          goto LABEL_96;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v511 = v443;
          uint64_t v30 = [v511 state];
          v502 = v30;
          if (v30)
          {
            id v31 = &__NSArray0__struct;
            if (([v30 active] & 1) == 0)
            {
              v520 = objc_opt_new();
              uint64_t v32 = [v511 configurationReferences];
              v33 = [v32 allObjects];

              v493 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
              *(void *)&long long v547 = v493;
              v34 = +[NSArray arrayWithObjects:&v547 count:1];
              id v35 = [v33 sortedArrayUsingDescriptors:v34];

              long long v541 = 0u;
              long long v542 = 0u;
              long long v539 = 0u;
              long long v540 = 0u;
              id v36 = v35;
              id v37 = [v36 countByEnumeratingWithState:&v539 objects:&v552 count:16];
              if (v37)
              {
                uint64_t v38 = *(void *)v540;
                do
                {
                  for (i = 0; i != v37; i = (char *)i + 1)
                  {
                    if (*(void *)v540 != v38) {
                      objc_enumerationMutation(v36);
                    }
                    long long v40 = *(void **)(*((void *)&v539 + 1) + 8 * i);
                    long long v41 = [v40 activation];
                    if (v41)
                    {
                      id v42 = [v40 activation];
                      long long v43 = [v42 state];
                      v44 = v43;
                      if (v43)
                      {
                        uint64_t v45 = [v43 inactiveReasons];
                        v46 = (void *)v45;
                        v47 = &__NSArray0__struct;
                        if (v45) {
                          v47 = (void *)v45;
                        }
                        id v48 = v47;
                      }
                      else
                      {
                        v46 = +[RMModelStatusReason missingStateForDeclaration:v42];
                        *(void *)&long long v564 = v46;
                        id v48 = +[NSArray arrayWithObjects:&v564 count:1];
                      }
                      v49 = v48;

                      if ([v49 count])
                      {
                        v50 = [v40 activation];
                        v51 = +[RMModelStatusReason activationFailed:v50];
                        [v520 addObject:v51];
                      }
                    }
                  }
                  id v37 = [v36 countByEnumeratingWithState:&v539 objects:&v552 count:16];
                }
                while (v37);
              }

              if ([v511 loadState] == 4)
              {
                v52 = [v511 declarationType];
                v53 = +[RMModelStatusReason failedWithUnknownDeclarationType:v52];
                [v520 addObject:v53];

                goto LABEL_92;
              }
              if (![v36 count])
              {
                v52 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v511];
                [v520 addObject:v52];
LABEL_92:
              }
              id v87 = v520;

              id v31 = v87;
LABEL_94:
            }
            goto LABEL_96;
          }
          id v87 = +[RMModelStatusReason missingStateForDeclaration:v511];
          v552 = (void **)v87;
          id v31 = +[NSArray arrayWithObjects:&v552 count:1];
          goto LABEL_94;
        }
        objc_opt_class();
        id v31 = &__NSArray0__struct;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_96;
        }
        id v415 = v443;
        v467 = objc_opt_new();
        v54 = [v415 assetReferences];
        v55 = [v54 allObjects];

        v412 = +[NSSortDescriptor sortDescriptorWithKey:@"configuration.identifier" ascending:1];
        v551 = v412;
        v56 = +[NSArray arrayWithObjects:&v551 count:1];
        v57 = [v55 sortedArrayUsingDescriptors:v56];

        long long v549 = 0u;
        long long v550 = 0u;
        long long v547 = 0u;
        long long v548 = 0u;
        id v471 = v57;
        id v484 = [v471 countByEnumeratingWithState:&v547 objects:&v539 count:16];
        if (!v484) {
          goto LABEL_84;
        }
        uint64_t v479 = *(void *)v548;
        do
        {
          for (j = 0; j != v484; j = (char *)j + 1)
          {
            if (*(void *)v548 != v479) {
              objc_enumerationMutation(v471);
            }
            v58 = [*(id *)(*((void *)&v547 + 1) + 8 * (void)j) configuration];
            v503 = v58;
            v59 = v58;
            if (v58)
            {
              id v494 = v58;
              v60 = [v494 state];
              v488 = v60;
              if (v60)
              {
                v61 = &__NSArray0__struct;
                if (([v60 active] & 1) == 0)
                {
                  v521 = objc_opt_new();
                  v62 = [v494 configurationReferences];
                  v63 = [v62 allObjects];

                  v475 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
                  v568 = v475;
                  v64 = +[NSArray arrayWithObjects:&v568 count:1];
                  v65 = [v63 sortedArrayUsingDescriptors:v64];

                  long long v566 = 0u;
                  long long v567 = 0u;
                  long long v564 = 0u;
                  long long v565 = 0u;
                  id v66 = v65;
                  id v67 = [v66 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                  if (v67)
                  {
                    uint64_t v68 = *(void *)v565;
                    do
                    {
                      for (k = 0; k != v67; k = (char *)k + 1)
                      {
                        if (*(void *)v565 != v68) {
                          objc_enumerationMutation(v66);
                        }
                        v70 = *(void **)(*((void *)&v564 + 1) + 8 * (void)k);
                        v71 = [v70 activation];
                        if (v71)
                        {
                          id v72 = [v70 activation];
                          v73 = [v72 state];
                          v74 = v73;
                          if (v73)
                          {
                            uint64_t v75 = [v73 inactiveReasons];
                            v76 = (void *)v75;
                            v77 = &__NSArray0__struct;
                            if (v75) {
                              v77 = (void *)v75;
                            }
                            id v78 = v77;
                          }
                          else
                          {
                            v76 = +[RMModelStatusReason missingStateForDeclaration:v72];
                            v569 = v76;
                            id v78 = +[NSArray arrayWithObjects:&v569 count:1];
                          }
                          v79 = v78;

                          if ([v79 count])
                          {
                            v80 = [v70 activation];
                            v81 = +[RMModelStatusReason activationFailed:v80];
                            [v521 addObject:v81];
                          }
                        }
                      }
                      id v67 = [v66 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                    }
                    while (v67);
                  }

                  if ([v494 loadState] == 4)
                  {
                    v82 = [v494 declarationType];
                    v83 = +[RMModelStatusReason failedWithUnknownDeclarationType:v82];
                    [v521 addObject:v83];

                    goto LABEL_76;
                  }
                  if (![v66 count])
                  {
                    v82 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v494];
                    [v521 addObject:v82];
LABEL_76:
                  }
                  id v84 = v521;

                  v61 = v84;
LABEL_78:
                }
                if ([v61 count])
                {
                  v85 = +[RMModelStatusReason configurationFailed:v494];
                  [v467 addObject:v85];
                }
                v59 = v503;
                goto LABEL_82;
              }
              id v84 = +[RMModelStatusReason missingStateForDeclaration:v494];
              v552 = (void **)v84;
              v61 = +[NSArray arrayWithObjects:&v552 count:1];
              goto LABEL_78;
            }
LABEL_82:
          }
          id v484 = [v471 countByEnumeratingWithState:&v547 objects:&v539 count:16];
        }
        while (v484);
LABEL_84:

        if (![v471 count])
        {
          v86 = +[RMModelStatusReason assetIsNotReferencedByConfiguration:v415];
          [v467 addObject:v86];
        }
        id v31 = v467;

LABEL_96:
        [v459 addObjectsFromArray:v31];

        id v88 = v443;
        *(void *)&long long v539 = 0;
        *((void *)&v539 + 1) = &v539;
        *(void *)&long long v540 = 0x2020000000;
        BYTE8(v540) = 0;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v89 = [v88 assetReferences];
          v552 = _NSConcreteStackBlock;
          uint64_t v553 = 3221225472;
          v554 = sub_1000473C8;
          v555 = &unk_1000C60D0;
          v556 = &v539;
          [v89 enumerateObjectsUsingBlock:&v552];
        }
        else
        {
          v89 = [v88 state];
          unsigned __int8 v90 = [v89 active];
          *(unsigned char *)(*((void *)&v539 + 1) + 24) = v90;
        }

        BOOL v12 = *(unsigned char *)(*((void *)&v539 + 1) + 24) != 0;
        _Block_object_dispose(&v539, 8);

LABEL_100:
        v91 = [v463 identifier];
        v92 = [v463 serverToken];
        v93 = +[NSNumber numberWithBool:v12];
        if ([v459 count]) {
          v94 = v459;
        }
        else {
          v94 = 0;
        }
        v95 = +[RMModelStatusManagementDeclarations_Declaration buildWithIdentifier:v91 serverToken:v92 active:v93 valid:v455 reasons:v94];

        [v431 addObject:v95];
LABEL_104:
        uint64_t v8 = v447 + 1;
      }
      while ((id)(v447 + 1) != v439);
      id v439 = [obj countByEnumeratingWithState:&v533 objects:v538 count:16];
    }
    while (v439);
  }

  v96 = +[NSSortDescriptor sortDescriptorWithKey:@"statusIdentifier" ascending:1];
  v97 = +[NSSortDescriptor sortDescriptorWithKey:@"statusServerToken" ascending:1];
  v552 = v96;
  uint64_t v553 = (uint64_t)v97;
  v98 = +[NSArray arrayWithObjects:&v552 count:2];
  v403 = [v431 sortedArrayUsingDescriptors:v98];

  id v99 = [v406 configurations];
  v432 = objc_opt_new();
  long long v535 = 0u;
  long long v536 = 0u;
  long long v533 = 0u;
  long long v534 = 0u;
  id v425 = v99;
  id v440 = [v425 countByEnumeratingWithState:&v533 objects:v538 count:16];
  if (!v440) {
    goto LABEL_210;
  }
  uint64_t v436 = *(void *)v534;
  v428 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_unknown;
  id v418 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_valid;
  id v422 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_invalid;
  do
  {
    uint64_t v100 = 0;
    do
    {
      if (*(void *)v534 != v436)
      {
        uint64_t v101 = v100;
        objc_enumerationMutation(v425);
        uint64_t v100 = v101;
      }
      uint64_t v448 = v100;
      v102 = *(void **)(*((void *)&v533 + 1) + 8 * v100);
      if (![v102 loadState]) {
        goto LABEL_208;
      }
      id v464 = v102;
      id v456 = v428;
      v460 = objc_opt_new();
      if ([v464 loadState] == 2)
      {
        id v103 = v422;

        v452 = +[RMModelStatusReason invalidPayloadForDeclaration:v464];
        [v460 addObject:v452];
        BOOL v104 = 0;
        id v456 = v103;
        goto LABEL_204;
      }
      id v105 = v464;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v106 = [v105 managementSource];
        v107 = [v106 identifier];
        v108 = [v105 identifier];
        v109 = [v105 serverToken];
        v452 = +[RMConfigurationStatusArchiver statusForStoreIdentifier:v107 declarationIdentifier:v108 serverToken:v109];
      }
      else
      {
        *(void *)&long long v539 = @"valid";
        v552 = (void **)&__kCFBooleanTrue;
        v452 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v539 count:1];
      }

      if (v452)
      {
        v110 = [v452 objectForKeyedSubscript:@"valid"];
        unsigned int v111 = [v110 BOOLValue];
        v112 = v418;
        if (!v111) {
          v112 = v422;
        }
        id v113 = v112;

        v114 = [v452 objectForKeyedSubscript:@"reasons"];
        if (v114) {
          [v460 addObjectsFromArray:v114];
        }

        id v456 = v113;
      }
      id v444 = v105;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v115 = v444;
        v116 = [v115 state];
        v117 = v116;
        if (v116)
        {
          uint64_t v118 = [v116 inactiveReasons];
          v119 = (void **)v118;
          v120 = &__NSArray0__struct;
          if (v118) {
            v120 = (void *)v118;
          }
          id v121 = v120;
        }
        else
        {
          v119 = +[RMModelStatusReason missingStateForDeclaration:v115];
          v552 = v119;
          id v121 = +[NSArray arrayWithObjects:&v552 count:1];
        }
        id v123 = v121;

        goto LABEL_200;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v513 = v444;
        v122 = [v513 state];
        v504 = v122;
        if (v122)
        {
          id v123 = &__NSArray0__struct;
          if (([v122 active] & 1) == 0)
          {
            v522 = objc_opt_new();
            v124 = [v513 configurationReferences];
            v125 = [v124 allObjects];

            v495 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
            *(void *)&long long v547 = v495;
            v126 = +[NSArray arrayWithObjects:&v547 count:1];
            v127 = [v125 sortedArrayUsingDescriptors:v126];

            long long v541 = 0u;
            long long v542 = 0u;
            long long v539 = 0u;
            long long v540 = 0u;
            id v128 = v127;
            id v129 = [v128 countByEnumeratingWithState:&v539 objects:&v552 count:16];
            if (v129)
            {
              uint64_t v130 = *(void *)v540;
              do
              {
                for (m = 0; m != v129; m = (char *)m + 1)
                {
                  if (*(void *)v540 != v130) {
                    objc_enumerationMutation(v128);
                  }
                  v132 = *(void **)(*((void *)&v539 + 1) + 8 * (void)m);
                  v133 = [v132 activation];
                  if (v133)
                  {
                    id v134 = [v132 activation];
                    v135 = [v134 state];
                    v136 = v135;
                    if (v135)
                    {
                      uint64_t v137 = [v135 inactiveReasons];
                      v138 = (void *)v137;
                      v139 = &__NSArray0__struct;
                      if (v137) {
                        v139 = (void *)v137;
                      }
                      id v140 = v139;
                    }
                    else
                    {
                      v138 = +[RMModelStatusReason missingStateForDeclaration:v134];
                      *(void *)&long long v564 = v138;
                      id v140 = +[NSArray arrayWithObjects:&v564 count:1];
                    }
                    v141 = v140;

                    if ([v141 count])
                    {
                      v142 = [v132 activation];
                      v143 = +[RMModelStatusReason activationFailed:v142];
                      [v522 addObject:v143];
                    }
                  }
                }
                id v129 = [v128 countByEnumeratingWithState:&v539 objects:&v552 count:16];
              }
              while (v129);
            }

            if ([v513 loadState] == 4)
            {
              v144 = [v513 declarationType];
              v145 = +[RMModelStatusReason failedWithUnknownDeclarationType:v144];
              [v522 addObject:v145];

              goto LABEL_196;
            }
            if (![v128 count])
            {
              v144 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v513];
              [v522 addObject:v144];
LABEL_196:
            }
            id v179 = v522;

            id v123 = v179;
LABEL_198:
          }
          goto LABEL_200;
        }
        id v179 = +[RMModelStatusReason missingStateForDeclaration:v513];
        v552 = (void **)v179;
        id v123 = +[NSArray arrayWithObjects:&v552 count:1];
        goto LABEL_198;
      }
      objc_opt_class();
      id v123 = &__NSArray0__struct;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_200;
      }
      id v413 = v444;
      v468 = objc_opt_new();
      v146 = [v413 assetReferences];
      v147 = [v146 allObjects];

      v407 = +[NSSortDescriptor sortDescriptorWithKey:@"configuration.identifier" ascending:1];
      v551 = v407;
      v148 = +[NSArray arrayWithObjects:&v551 count:1];
      v149 = [v147 sortedArrayUsingDescriptors:v148];

      long long v549 = 0u;
      long long v550 = 0u;
      long long v547 = 0u;
      long long v548 = 0u;
      id v472 = v149;
      id v485 = [v472 countByEnumeratingWithState:&v547 objects:&v539 count:16];
      if (!v485) {
        goto LABEL_188;
      }
      uint64_t v480 = *(void *)v548;
      do
      {
        for (n = 0; n != v485; n = (char *)n + 1)
        {
          if (*(void *)v548 != v480) {
            objc_enumerationMutation(v472);
          }
          v150 = [*(id *)(*((void *)&v547 + 1) + 8 * (void)n) configuration];
          v505 = v150;
          v151 = v150;
          if (v150)
          {
            id v496 = v150;
            v152 = [v496 state];
            v489 = v152;
            if (v152)
            {
              v153 = &__NSArray0__struct;
              if (([v152 active] & 1) == 0)
              {
                v523 = objc_opt_new();
                v154 = [v496 configurationReferences];
                v155 = [v154 allObjects];

                v476 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
                v568 = v476;
                v156 = +[NSArray arrayWithObjects:&v568 count:1];
                v157 = [v155 sortedArrayUsingDescriptors:v156];

                long long v566 = 0u;
                long long v567 = 0u;
                long long v564 = 0u;
                long long v565 = 0u;
                id v158 = v157;
                id v159 = [v158 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                if (v159)
                {
                  uint64_t v160 = *(void *)v565;
                  do
                  {
                    for (ii = 0; ii != v159; ii = (char *)ii + 1)
                    {
                      if (*(void *)v565 != v160) {
                        objc_enumerationMutation(v158);
                      }
                      v162 = *(void **)(*((void *)&v564 + 1) + 8 * (void)ii);
                      v163 = [v162 activation];
                      if (v163)
                      {
                        id v164 = [v162 activation];
                        v165 = [v164 state];
                        v166 = v165;
                        if (v165)
                        {
                          uint64_t v167 = [v165 inactiveReasons];
                          v168 = (void *)v167;
                          v169 = &__NSArray0__struct;
                          if (v167) {
                            v169 = (void *)v167;
                          }
                          id v170 = v169;
                        }
                        else
                        {
                          v168 = +[RMModelStatusReason missingStateForDeclaration:v164];
                          v569 = v168;
                          id v170 = +[NSArray arrayWithObjects:&v569 count:1];
                        }
                        v171 = v170;

                        if ([v171 count])
                        {
                          v172 = [v162 activation];
                          v173 = +[RMModelStatusReason activationFailed:v172];
                          [v523 addObject:v173];
                        }
                      }
                    }
                    id v159 = [v158 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                  }
                  while (v159);
                }

                if ([v496 loadState] == 4)
                {
                  v174 = [v496 declarationType];
                  v175 = +[RMModelStatusReason failedWithUnknownDeclarationType:v174];
                  [v523 addObject:v175];

                  goto LABEL_180;
                }
                if (![v158 count])
                {
                  v174 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v496];
                  [v523 addObject:v174];
LABEL_180:
                }
                id v176 = v523;

                v153 = v176;
LABEL_182:
              }
              if ([v153 count])
              {
                v177 = +[RMModelStatusReason configurationFailed:v496];
                [v468 addObject:v177];
              }
              v151 = v505;
              goto LABEL_186;
            }
            id v176 = +[RMModelStatusReason missingStateForDeclaration:v496];
            v552 = (void **)v176;
            v153 = +[NSArray arrayWithObjects:&v552 count:1];
            goto LABEL_182;
          }
LABEL_186:
        }
        id v485 = [v472 countByEnumeratingWithState:&v547 objects:&v539 count:16];
      }
      while (v485);
LABEL_188:

      if (![v472 count])
      {
        v178 = +[RMModelStatusReason assetIsNotReferencedByConfiguration:v413];
        [v468 addObject:v178];
      }
      id v123 = v468;

LABEL_200:
      [v460 addObjectsFromArray:v123];

      id v180 = v444;
      *(void *)&long long v539 = 0;
      *((void *)&v539 + 1) = &v539;
      *(void *)&long long v540 = 0x2020000000;
      BYTE8(v540) = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v181 = [v180 assetReferences];
        v552 = _NSConcreteStackBlock;
        uint64_t v553 = 3221225472;
        v554 = sub_1000473C8;
        v555 = &unk_1000C60D0;
        v556 = &v539;
        [v181 enumerateObjectsUsingBlock:&v552];
      }
      else
      {
        v181 = [v180 state];
        unsigned __int8 v182 = [v181 active];
        *(unsigned char *)(*((void *)&v539 + 1) + 24) = v182;
      }

      BOOL v104 = *(unsigned char *)(*((void *)&v539 + 1) + 24) != 0;
      _Block_object_dispose(&v539, 8);

LABEL_204:
      v183 = [v464 identifier];
      v184 = [v464 serverToken];
      v185 = +[NSNumber numberWithBool:v104];
      if ([v460 count]) {
        v186 = v460;
      }
      else {
        v186 = 0;
      }
      v187 = +[RMModelStatusManagementDeclarations_Declaration buildWithIdentifier:v183 serverToken:v184 active:v185 valid:v456 reasons:v186];

      [v432 addObject:v187];
LABEL_208:
      uint64_t v100 = v448 + 1;
    }
    while ((id)(v448 + 1) != v440);
    id v440 = [v425 countByEnumeratingWithState:&v533 objects:v538 count:16];
  }
  while (v440);
LABEL_210:

  v188 = +[NSSortDescriptor sortDescriptorWithKey:@"statusIdentifier" ascending:1];
  v189 = +[NSSortDescriptor sortDescriptorWithKey:@"statusServerToken" ascending:1];
  v552 = v188;
  uint64_t v553 = (uint64_t)v189;
  v190 = +[NSArray arrayWithObjects:&v552 count:2];
  v401 = [v432 sortedArrayUsingDescriptors:v190];

  id v191 = [v406 assets];
  v433 = objc_opt_new();
  long long v535 = 0u;
  long long v536 = 0u;
  long long v533 = 0u;
  long long v534 = 0u;
  id v423 = v191;
  id v441 = [v423 countByEnumeratingWithState:&v533 objects:v538 count:16];
  if (!v441) {
    goto LABEL_314;
  }
  uint64_t v437 = *(void *)v534;
  v429 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_unknown;
  v416 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_valid;
  id v419 = (id)RMModelStatusManagementDeclarations_Declaration_Valid_invalid;
  while (2)
  {
    uint64_t v192 = 0;
    while (2)
    {
      if (*(void *)v534 != v437)
      {
        uint64_t v193 = v192;
        objc_enumerationMutation(v423);
        uint64_t v192 = v193;
      }
      uint64_t v449 = v192;
      v194 = *(void **)(*((void *)&v533 + 1) + 8 * v192);
      if (![v194 loadState]) {
        goto LABEL_312;
      }
      id v465 = v194;
      id v457 = v429;
      v461 = objc_opt_new();
      if ([v465 loadState] == 2)
      {
        id v195 = v419;

        v453 = +[RMModelStatusReason invalidPayloadForDeclaration:v465];
        [v461 addObject:v453];
        BOOL v196 = 0;
        id v457 = v195;
        goto LABEL_308;
      }
      id v197 = v465;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v198 = [v197 managementSource];
        v199 = [v198 identifier];
        v200 = [v197 identifier];
        v201 = [v197 serverToken];
        v453 = +[RMConfigurationStatusArchiver statusForStoreIdentifier:v199 declarationIdentifier:v200 serverToken:v201];
      }
      else
      {
        *(void *)&long long v539 = @"valid";
        v552 = (void **)&__kCFBooleanTrue;
        v453 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v539 count:1];
      }

      if (v453)
      {
        v202 = [v453 objectForKeyedSubscript:@"valid"];
        unsigned int v203 = [v202 BOOLValue];
        v204 = v416;
        if (!v203) {
          v204 = v419;
        }
        id v205 = v204;

        v206 = [v453 objectForKeyedSubscript:@"reasons"];
        if (v206) {
          [v461 addObjectsFromArray:v206];
        }

        id v457 = v205;
      }
      id v445 = v197;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v207 = v445;
        v208 = [v207 state];
        v209 = v208;
        if (v208)
        {
          uint64_t v210 = [v208 inactiveReasons];
          v211 = (void **)v210;
          v212 = &__NSArray0__struct;
          if (v210) {
            v212 = (void *)v210;
          }
          id v213 = v212;
        }
        else
        {
          v211 = +[RMModelStatusReason missingStateForDeclaration:v207];
          v552 = v211;
          id v213 = +[NSArray arrayWithObjects:&v552 count:1];
        }
        id v215 = v213;

        goto LABEL_304;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v515 = v445;
        v214 = [v515 state];
        v506 = v214;
        if (v214)
        {
          id v215 = &__NSArray0__struct;
          if (([v214 active] & 1) == 0)
          {
            v524 = objc_opt_new();
            v216 = [v515 configurationReferences];
            v217 = [v216 allObjects];

            v497 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
            *(void *)&long long v547 = v497;
            v218 = +[NSArray arrayWithObjects:&v547 count:1];
            v219 = [v217 sortedArrayUsingDescriptors:v218];

            long long v541 = 0u;
            long long v542 = 0u;
            long long v539 = 0u;
            long long v540 = 0u;
            id v220 = v219;
            id v221 = [v220 countByEnumeratingWithState:&v539 objects:&v552 count:16];
            if (v221)
            {
              uint64_t v222 = *(void *)v540;
              do
              {
                for (jj = 0; jj != v221; jj = (char *)jj + 1)
                {
                  if (*(void *)v540 != v222) {
                    objc_enumerationMutation(v220);
                  }
                  v224 = *(void **)(*((void *)&v539 + 1) + 8 * (void)jj);
                  v225 = [v224 activation];
                  if (v225)
                  {
                    id v226 = [v224 activation];
                    v227 = [v226 state];
                    v228 = v227;
                    if (v227)
                    {
                      uint64_t v229 = [v227 inactiveReasons];
                      v230 = (void *)v229;
                      v231 = &__NSArray0__struct;
                      if (v229) {
                        v231 = (void *)v229;
                      }
                      id v232 = v231;
                    }
                    else
                    {
                      v230 = +[RMModelStatusReason missingStateForDeclaration:v226];
                      *(void *)&long long v564 = v230;
                      id v232 = +[NSArray arrayWithObjects:&v564 count:1];
                    }
                    v233 = v232;

                    if ([v233 count])
                    {
                      v234 = [v224 activation];
                      v235 = +[RMModelStatusReason activationFailed:v234];
                      [v524 addObject:v235];
                    }
                  }
                }
                id v221 = [v220 countByEnumeratingWithState:&v539 objects:&v552 count:16];
              }
              while (v221);
            }

            if ([v515 loadState] == 4)
            {
              v236 = [v515 declarationType];
              v237 = +[RMModelStatusReason failedWithUnknownDeclarationType:v236];
              [v524 addObject:v237];

              goto LABEL_300;
            }
            if (![v220 count])
            {
              v236 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v515];
              [v524 addObject:v236];
LABEL_300:
            }
            id v271 = v524;

            id v215 = v271;
LABEL_302:
          }
          goto LABEL_304;
        }
        id v271 = +[RMModelStatusReason missingStateForDeclaration:v515];
        v552 = (void **)v271;
        id v215 = +[NSArray arrayWithObjects:&v552 count:1];
        goto LABEL_302;
      }
      objc_opt_class();
      id v215 = &__NSArray0__struct;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_304;
      }
      id v408 = v445;
      v469 = objc_opt_new();
      v238 = [v408 assetReferences];
      v239 = [v238 allObjects];

      v404 = +[NSSortDescriptor sortDescriptorWithKey:@"configuration.identifier" ascending:1];
      v551 = v404;
      v240 = +[NSArray arrayWithObjects:&v551 count:1];
      v241 = [v239 sortedArrayUsingDescriptors:v240];

      long long v549 = 0u;
      long long v550 = 0u;
      long long v547 = 0u;
      long long v548 = 0u;
      id v473 = v241;
      id v486 = [v473 countByEnumeratingWithState:&v547 objects:&v539 count:16];
      if (!v486) {
        goto LABEL_292;
      }
      uint64_t v481 = *(void *)v548;
      while (2)
      {
        uint64_t v516 = 0;
        while (2)
        {
          if (*(void *)v548 != v481) {
            objc_enumerationMutation(v473);
          }
          v242 = [*(id *)(*((void *)&v547 + 1) + 8 * v516) configuration];
          v507 = v242;
          v243 = v242;
          if (v242)
          {
            id v498 = v242;
            v244 = [v498 state];
            v490 = v244;
            if (!v244)
            {
              v268 = +[RMModelStatusReason missingStateForDeclaration:v498];
              v552 = v268;
              v245 = +[NSArray arrayWithObjects:&v552 count:1];
              goto LABEL_286;
            }
            v245 = &__NSArray0__struct;
            if (([v244 active] & 1) == 0)
            {
              v525 = objc_opt_new();
              v246 = [v498 configurationReferences];
              v247 = [v246 allObjects];

              v477 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
              v568 = v477;
              v248 = +[NSArray arrayWithObjects:&v568 count:1];
              v249 = [v247 sortedArrayUsingDescriptors:v248];

              long long v566 = 0u;
              long long v567 = 0u;
              long long v564 = 0u;
              long long v565 = 0u;
              id v250 = v249;
              id v251 = [v250 countByEnumeratingWithState:&v564 objects:&v552 count:16];
              if (v251)
              {
                uint64_t v252 = *(void *)v565;
                do
                {
                  for (kk = 0; kk != v251; kk = (char *)kk + 1)
                  {
                    if (*(void *)v565 != v252) {
                      objc_enumerationMutation(v250);
                    }
                    v254 = *(void **)(*((void *)&v564 + 1) + 8 * (void)kk);
                    v255 = [v254 activation];
                    if (v255)
                    {
                      id v256 = [v254 activation];
                      v257 = [v256 state];
                      v258 = v257;
                      if (v257)
                      {
                        uint64_t v259 = [v257 inactiveReasons];
                        v260 = (void *)v259;
                        v261 = &__NSArray0__struct;
                        if (v259) {
                          v261 = (void *)v259;
                        }
                        id v262 = v261;
                      }
                      else
                      {
                        v260 = +[RMModelStatusReason missingStateForDeclaration:v256];
                        v569 = v260;
                        id v262 = +[NSArray arrayWithObjects:&v569 count:1];
                      }
                      v263 = v262;

                      if ([v263 count])
                      {
                        v264 = [v254 activation];
                        v265 = +[RMModelStatusReason activationFailed:v264];
                        [v525 addObject:v265];
                      }
                    }
                  }
                  id v251 = [v250 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                }
                while (v251);
              }

              if ([v498 loadState] == 4)
              {
                v266 = [v498 declarationType];
                v267 = +[RMModelStatusReason failedWithUnknownDeclarationType:v266];
                [v525 addObject:v267];

                goto LABEL_284;
              }
              if (![v250 count])
              {
                v266 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v498];
                [v525 addObject:v266];
LABEL_284:
              }
              v268 = v525;

              v245 = v268;
LABEL_286:
            }
            if ([v245 count])
            {
              v269 = +[RMModelStatusReason configurationFailed:v498];
              [v469 addObject:v269];
            }
            v243 = v507;
          }

          if ((id)++v516 != v486) {
            continue;
          }
          break;
        }
        id v486 = [v473 countByEnumeratingWithState:&v547 objects:&v539 count:16];
        if (v486) {
          continue;
        }
        break;
      }
LABEL_292:

      if (![v473 count])
      {
        v270 = +[RMModelStatusReason assetIsNotReferencedByConfiguration:v408];
        [v469 addObject:v270];
      }
      id v215 = v469;

LABEL_304:
      [v461 addObjectsFromArray:v215];

      id v272 = v445;
      *(void *)&long long v539 = 0;
      *((void *)&v539 + 1) = &v539;
      *(void *)&long long v540 = 0x2020000000;
      BYTE8(v540) = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v273 = [v272 assetReferences];
        v552 = _NSConcreteStackBlock;
        uint64_t v553 = 3221225472;
        v554 = sub_1000473C8;
        v555 = &unk_1000C60D0;
        v556 = &v539;
        [v273 enumerateObjectsUsingBlock:&v552];
      }
      else
      {
        v273 = [v272 state];
        unsigned __int8 v274 = [v273 active];
        *(unsigned char *)(*((void *)&v539 + 1) + 24) = v274;
      }

      BOOL v196 = *(unsigned char *)(*((void *)&v539 + 1) + 24) != 0;
      _Block_object_dispose(&v539, 8);

LABEL_308:
      v275 = [v465 identifier];
      v276 = [v465 serverToken];
      v277 = +[NSNumber numberWithBool:v196];
      if ([v461 count]) {
        v278 = v461;
      }
      else {
        v278 = 0;
      }
      v279 = +[RMModelStatusManagementDeclarations_Declaration buildWithIdentifier:v275 serverToken:v276 active:v277 valid:v457 reasons:v278];

      [v433 addObject:v279];
LABEL_312:
      uint64_t v192 = v449 + 1;
      if ((id)(v449 + 1) != v441) {
        continue;
      }
      break;
    }
    id v441 = [v423 countByEnumeratingWithState:&v533 objects:v538 count:16];
    if (v441) {
      continue;
    }
    break;
  }
LABEL_314:

  v280 = +[NSSortDescriptor sortDescriptorWithKey:@"statusIdentifier" ascending:1];
  v281 = +[NSSortDescriptor sortDescriptorWithKey:@"statusServerToken" ascending:1];
  v552 = v280;
  uint64_t v553 = (uint64_t)v281;
  v282 = +[NSArray arrayWithObjects:&v552 count:2];
  v400 = [v433 sortedArrayUsingDescriptors:v282];

  id v283 = [v406 management];
  v434 = objc_opt_new();
  long long v535 = 0u;
  long long v536 = 0u;
  long long v533 = 0u;
  long long v534 = 0u;
  id v420 = v283;
  id v442 = [v420 countByEnumeratingWithState:&v533 objects:v538 count:16];
  if (!v442) {
    goto LABEL_418;
  }
  uint64_t v438 = *(void *)v534;
  v430 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_unknown;
  v414 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_valid;
  v417 = (void *)RMModelStatusManagementDeclarations_Declaration_Valid_invalid;
  while (2)
  {
    uint64_t v284 = 0;
    while (2)
    {
      if (*(void *)v534 != v438)
      {
        uint64_t v285 = v284;
        objc_enumerationMutation(v420);
        uint64_t v284 = v285;
      }
      uint64_t v450 = v284;
      v286 = *(void **)(*((void *)&v533 + 1) + 8 * v284);
      if (!objc_msgSend(v286, "loadState", v400)) {
        goto LABEL_416;
      }
      id v466 = v286;
      id v458 = v430;
      v462 = objc_opt_new();
      if ([v466 loadState] == 2)
      {
        id v287 = v417;

        v454 = +[RMModelStatusReason invalidPayloadForDeclaration:v466];
        [v462 addObject:v454];
        BOOL v288 = 0;
        id v458 = v287;
        goto LABEL_412;
      }
      id v289 = v466;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v290 = [v289 managementSource];
        v291 = [v290 identifier];
        v292 = [v289 identifier];
        v293 = [v289 serverToken];
        v454 = +[RMConfigurationStatusArchiver statusForStoreIdentifier:v291 declarationIdentifier:v292 serverToken:v293];
      }
      else
      {
        *(void *)&long long v539 = @"valid";
        v552 = (void **)&__kCFBooleanTrue;
        v454 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v539 count:1];
      }

      if (v454)
      {
        v294 = [v454 objectForKeyedSubscript:@"valid"];
        unsigned int v295 = [v294 BOOLValue];
        v296 = v414;
        if (!v295) {
          v296 = v417;
        }
        id v297 = v296;

        v298 = [v454 objectForKeyedSubscript:@"reasons"];
        if (v298) {
          [v462 addObjectsFromArray:v298];
        }

        id v458 = v297;
      }
      id v446 = v289;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v299 = v446;
        v300 = [v299 state];
        v301 = v300;
        if (v300)
        {
          uint64_t v302 = [v300 inactiveReasons];
          v303 = (void **)v302;
          v304 = &__NSArray0__struct;
          if (v302) {
            v304 = (void *)v302;
          }
          id v305 = v304;
        }
        else
        {
          v303 = +[RMModelStatusReason missingStateForDeclaration:v299];
          v552 = v303;
          id v305 = +[NSArray arrayWithObjects:&v552 count:1];
        }
        id v307 = v305;

        goto LABEL_408;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v517 = v446;
        v306 = [v517 state];
        v508 = v306;
        if (v306)
        {
          id v307 = &__NSArray0__struct;
          if (([v306 active] & 1) == 0)
          {
            v526 = objc_opt_new();
            v308 = [v517 configurationReferences];
            v309 = [v308 allObjects];

            v499 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
            *(void *)&long long v547 = v499;
            v310 = +[NSArray arrayWithObjects:&v547 count:1];
            v311 = [v309 sortedArrayUsingDescriptors:v310];

            long long v541 = 0u;
            long long v542 = 0u;
            long long v539 = 0u;
            long long v540 = 0u;
            id v312 = v311;
            id v313 = [v312 countByEnumeratingWithState:&v539 objects:&v552 count:16];
            if (v313)
            {
              uint64_t v314 = *(void *)v540;
              do
              {
                for (mm = 0; mm != v313; mm = (char *)mm + 1)
                {
                  if (*(void *)v540 != v314) {
                    objc_enumerationMutation(v312);
                  }
                  v316 = *(void **)(*((void *)&v539 + 1) + 8 * (void)mm);
                  v317 = [v316 activation];
                  if (v317)
                  {
                    id v318 = [v316 activation];
                    v319 = [v318 state];
                    v320 = v319;
                    if (v319)
                    {
                      uint64_t v321 = [v319 inactiveReasons];
                      v322 = (void *)v321;
                      v323 = &__NSArray0__struct;
                      if (v321) {
                        v323 = (void *)v321;
                      }
                      id v324 = v323;
                    }
                    else
                    {
                      v322 = +[RMModelStatusReason missingStateForDeclaration:v318];
                      *(void *)&long long v564 = v322;
                      id v324 = +[NSArray arrayWithObjects:&v564 count:1];
                    }
                    v325 = v324;

                    if ([v325 count])
                    {
                      v326 = [v316 activation];
                      v327 = +[RMModelStatusReason activationFailed:v326];
                      [v526 addObject:v327];
                    }
                  }
                }
                id v313 = [v312 countByEnumeratingWithState:&v539 objects:&v552 count:16];
              }
              while (v313);
            }

            if ([v517 loadState] == 4)
            {
              v328 = [v517 declarationType];
              v329 = +[RMModelStatusReason failedWithUnknownDeclarationType:v328];
              [v526 addObject:v329];

              goto LABEL_404;
            }
            if (![v312 count])
            {
              v328 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v517];
              [v526 addObject:v328];
LABEL_404:
            }
            id v363 = v526;

            id v307 = v363;
LABEL_406:
          }
          goto LABEL_408;
        }
        id v363 = +[RMModelStatusReason missingStateForDeclaration:v517];
        v552 = (void **)v363;
        id v307 = +[NSArray arrayWithObjects:&v552 count:1];
        goto LABEL_406;
      }
      objc_opt_class();
      id v307 = &__NSArray0__struct;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_408;
      }
      id v405 = v446;
      v470 = objc_opt_new();
      v330 = [v405 assetReferences];
      v331 = [v330 allObjects];

      v402 = +[NSSortDescriptor sortDescriptorWithKey:@"configuration.identifier" ascending:1];
      v551 = v402;
      v332 = +[NSArray arrayWithObjects:&v551 count:1];
      v333 = [v331 sortedArrayUsingDescriptors:v332];

      long long v549 = 0u;
      long long v550 = 0u;
      long long v547 = 0u;
      long long v548 = 0u;
      id v474 = v333;
      id v487 = [v474 countByEnumeratingWithState:&v547 objects:&v539 count:16];
      if (!v487) {
        goto LABEL_396;
      }
      uint64_t v482 = *(void *)v548;
      while (2)
      {
        uint64_t v518 = 0;
        while (2)
        {
          if (*(void *)v548 != v482) {
            objc_enumerationMutation(v474);
          }
          v334 = [*(id *)(*((void *)&v547 + 1) + 8 * v518) configuration];
          v509 = v334;
          v335 = v334;
          if (v334)
          {
            id v500 = v334;
            v336 = [v500 state];
            v491 = v336;
            if (!v336)
            {
              v360 = +[RMModelStatusReason missingStateForDeclaration:v500];
              v552 = v360;
              v337 = +[NSArray arrayWithObjects:&v552 count:1];
              goto LABEL_390;
            }
            v337 = &__NSArray0__struct;
            if (([v336 active] & 1) == 0)
            {
              v527 = objc_opt_new();
              v338 = [v500 configurationReferences];
              v339 = [v338 allObjects];

              v478 = +[NSSortDescriptor sortDescriptorWithKey:@"activation.identifier" ascending:1];
              v568 = v478;
              v340 = +[NSArray arrayWithObjects:&v568 count:1];
              v341 = [v339 sortedArrayUsingDescriptors:v340];

              long long v566 = 0u;
              long long v567 = 0u;
              long long v564 = 0u;
              long long v565 = 0u;
              id v342 = v341;
              id v343 = [v342 countByEnumeratingWithState:&v564 objects:&v552 count:16];
              if (v343)
              {
                uint64_t v344 = *(void *)v565;
                do
                {
                  for (nn = 0; nn != v343; nn = (char *)nn + 1)
                  {
                    if (*(void *)v565 != v344) {
                      objc_enumerationMutation(v342);
                    }
                    v346 = *(void **)(*((void *)&v564 + 1) + 8 * (void)nn);
                    v347 = [v346 activation];
                    if (v347)
                    {
                      id v348 = [v346 activation];
                      v349 = [v348 state];
                      v350 = v349;
                      if (v349)
                      {
                        uint64_t v351 = [v349 inactiveReasons];
                        v352 = (void *)v351;
                        v353 = &__NSArray0__struct;
                        if (v351) {
                          v353 = (void *)v351;
                        }
                        id v354 = v353;
                      }
                      else
                      {
                        v352 = +[RMModelStatusReason missingStateForDeclaration:v348];
                        v569 = v352;
                        id v354 = +[NSArray arrayWithObjects:&v569 count:1];
                      }
                      v355 = v354;

                      if ([v355 count])
                      {
                        v356 = [v346 activation];
                        v357 = +[RMModelStatusReason activationFailed:v356];
                        [v527 addObject:v357];
                      }
                    }
                  }
                  id v343 = [v342 countByEnumeratingWithState:&v564 objects:&v552 count:16];
                }
                while (v343);
              }

              if ([v500 loadState] == 4)
              {
                v358 = [v500 declarationType];
                v359 = +[RMModelStatusReason failedWithUnknownDeclarationType:v358];
                [v527 addObject:v359];

                goto LABEL_388;
              }
              if (![v342 count])
              {
                v358 = +[RMModelStatusReason configurationIsNotReferencedByAnActivation:v500];
                [v527 addObject:v358];
LABEL_388:
              }
              v360 = v527;

              v337 = v360;
LABEL_390:
            }
            if ([v337 count])
            {
              v361 = +[RMModelStatusReason configurationFailed:v500];
              [v470 addObject:v361];
            }
            v335 = v509;
          }

          if ((id)++v518 != v487) {
            continue;
          }
          break;
        }
        id v487 = [v474 countByEnumeratingWithState:&v547 objects:&v539 count:16];
        if (v487) {
          continue;
        }
        break;
      }
LABEL_396:

      if (![v474 count])
      {
        v362 = +[RMModelStatusReason assetIsNotReferencedByConfiguration:v405];
        [v470 addObject:v362];
      }
      id v307 = v470;

LABEL_408:
      [v462 addObjectsFromArray:v307];

      id v364 = v446;
      *(void *)&long long v539 = 0;
      *((void *)&v539 + 1) = &v539;
      *(void *)&long long v540 = 0x2020000000;
      BYTE8(v540) = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v365 = [v364 assetReferences];
        v552 = _NSConcreteStackBlock;
        uint64_t v553 = 3221225472;
        v554 = sub_1000473C8;
        v555 = &unk_1000C60D0;
        v556 = &v539;
        [v365 enumerateObjectsUsingBlock:&v552];
      }
      else
      {
        v365 = [v364 state];
        unsigned __int8 v366 = [v365 active];
        *(unsigned char *)(*((void *)&v539 + 1) + 24) = v366;
      }

      BOOL v288 = *(unsigned char *)(*((void *)&v539 + 1) + 24) != 0;
      _Block_object_dispose(&v539, 8);

LABEL_412:
      v367 = [v466 identifier];
      v368 = [v466 serverToken];
      v369 = +[NSNumber numberWithBool:v288];
      if ([v462 count]) {
        v370 = v462;
      }
      else {
        v370 = 0;
      }
      v371 = +[RMModelStatusManagementDeclarations_Declaration buildWithIdentifier:v367 serverToken:v368 active:v369 valid:v458 reasons:v370];

      [v434 addObject:v371];
LABEL_416:
      uint64_t v284 = v450 + 1;
      if ((id)(v450 + 1) != v442) {
        continue;
      }
      break;
    }
    id v442 = [v420 countByEnumeratingWithState:&v533 objects:v538 count:16];
    if (v442) {
      continue;
    }
    break;
  }
LABEL_418:

  v372 = +[NSSortDescriptor sortDescriptorWithKey:@"statusIdentifier" ascending:1];
  v373 = +[NSSortDescriptor sortDescriptorWithKey:@"statusServerToken" ascending:1];
  v552 = v372;
  uint64_t v553 = (uint64_t)v373;
  v374 = +[NSArray arrayWithObjects:&v552 count:2];
  v375 = [v434 sortedArrayUsingDescriptors:v374];

  v376 = +[RMModelStatusManagementDeclarations buildRequiredOnlyWithActivations:v403 configurations:v401 assets:v400 management:v375];

  v377 = [v376 serializeWithType:1];

  if (v377) {
    [v483 setObject:v377 forKeyedSubscript:v409];
  }

  id v6 = v411;
LABEL_421:
  v378 = objc_msgSend(v6, "conduitConfig", v400);
  v379 = [v378 state];
  if (v379) {
    BOOL v380 = [v411 enrollmentType] == 0;
  }
  else {
    BOOL v380 = 0;
  }

  v381 = +[RMDevice currentDevice];
  *(void *)&long long v539 = RMModelStatusItemDeviceModelFamily;
  v528 = [v381 modelFamily];
  v552 = v528;
  *((void *)&v539 + 1) = RMModelStatusItemDeviceModelIdentifier;
  v519 = [v381 modelIdentifier];
  uint64_t v553 = (uint64_t)v519;
  *(void *)&long long v540 = RMModelStatusItemDeviceModelMarketingName;
  v510 = [v381 modelMarketingName];
  v554 = v510;
  *((void *)&v540 + 1) = RMModelStatusItemDeviceModelNumber;
  v501 = [v381 modelNumber];
  v555 = v501;
  *(void *)&long long v541 = RMModelStatusItemDeviceOperatingSystemBuildVersion;
  v492 = [v381 operatingSystemBuildVersion];
  v556 = v492;
  *((void *)&v541 + 1) = RMModelStatusItemDeviceOperatingSystemFamily;
  v382 = [v381 operatingSystem];
  v557 = v382;
  *(void *)&long long v542 = RMModelStatusItemDeviceOperatingSystemMarketingName;
  v383 = [v381 operatingSystemMarketingName];
  v558 = v383;
  *((void *)&v542 + 1) = RMModelStatusItemDeviceOperatingSystemSupplementalBuildVersion;
  v384 = [v381 operatingSystemSupplementalBuildVersion];
  v559 = v384;
  uint64_t v543 = RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion;
  v385 = [v381 operatingSystemSupplementalExtraVersion];
  v560 = v385;
  uint64_t v544 = RMModelStatusItemDeviceOperatingSystemVersion;
  v386 = [v381 operatingSystemVersion];
  v561 = v386;
  uint64_t v545 = RMModelStatusItemDeviceSerialNumber;
  v387 = [v381 serialNumber];
  v562 = v387;
  uint64_t v546 = RMModelStatusItemDeviceUDID;
  v388 = [v381 UDID];
  v563 = v388;
  v389 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v539 count:12];

  long long v529 = 0u;
  long long v530 = 0u;
  long long v531 = 0u;
  long long v532 = 0u;
  id v390 = v410;
  id v391 = [v390 countByEnumeratingWithState:&v529 objects:v537 count:16];
  if (v391)
  {
    uint64_t v392 = *(void *)v530;
    do
    {
      for (i1 = 0; i1 != v391; i1 = (char *)i1 + 1)
      {
        if (*(void *)v530 != v392) {
          objc_enumerationMutation(v390);
        }
        uint64_t v394 = *(void *)(*((void *)&v529 + 1) + 8 * (void)i1);
        if (v380
          && (+[RMInternalStatusPublisher restrictedKeyPaths](RMInternalStatusPublisher, "restrictedKeyPaths"), v395 = objc_claimAutoreleasedReturnValue(), unsigned int v396 = [v395 containsObject:v394], v395, v396))
        {
          v397 = +[RMErrorUtilities createDisallowedStatusValueErrorWithKeyPath:v394];
          [v483 setObject:v397 forKeyedSubscript:v394];
        }
        else
        {
          v397 = [v389 valueForKeyPath:v394];
          if (v397) {
            [v483 setObject:v397 forKeyedSubscript:v394];
          }
        }
      }
      id v391 = [v390 countByEnumeratingWithState:&v529 objects:v537 count:16];
    }
    while (v391);
  }

  id v398 = v483;
  return v398;
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v5 = a4;
  id v6 = [v5 updatedProperties];
  id v7 = [v6 valueForKey:@"name"];

  uint64_t v8 = [v5 changedObjectID];
  id v9 = [v5 changeType];
  id v10 = v8;
  id v11 = v7;
  if (v9 != (id)2)
  {
    BOOL v12 = objc_opt_new();
    id v13 = [v10 entity];
    v14 = +[RMActivationPayload entity];
    unsigned int v15 = [v13 isKindOfEntity:v14];
    if (v9 == (id)1)
    {
      if (v15
        && +[RMDeclarationPayload isSignificantChange:v11])
      {
        goto LABEL_22;
      }
      id v16 = +[RMActivationPayloadState entity];
      if ([v13 isKindOfEntity:v16]) {
        goto LABEL_21;
      }
      id v17 = +[RMAssetPayload entity];
      if ([v13 isKindOfEntity:v17]
        && +[RMDeclarationPayload isSignificantChange:v11])
      {
        goto LABEL_20;
      }
      id v18 = +[RMAssetPayloadState entity];
      if ([v13 isKindOfEntity:v18]) {
        goto LABEL_19;
      }
      uint64_t v24 = +[RMConfigurationPayload entity];
      if (!objc_msgSend(v13, "isKindOfEntity:")
        || !+[RMConfigurationPayload isSignificantChange:v11])
      {
        objc_super v22 = +[RMConfigurationPayloadState entity];
        LODWORD(v23) = [v13 isKindOfEntity:v22];

        if ((v23 & 1) == 0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      unsigned int v19 = v24;
    }
    else
    {
      if (v15)
      {
LABEL_22:

LABEL_23:
        objc_msgSend(v12, "addObject:", RMModelStatusItemManagementDeclarations, v23);
LABEL_24:

        goto LABEL_25;
      }
      id v16 = +[RMActivationPayloadState entity];
      if ([v13 isKindOfEntity:v16])
      {
LABEL_21:

        goto LABEL_22;
      }
      id v17 = +[RMAssetPayload entity];
      if ([v13 isKindOfEntity:v17])
      {
LABEL_20:

        goto LABEL_21;
      }
      id v18 = +[RMAssetPayloadState entity];
      if ([v13 isKindOfEntity:v18])
      {
LABEL_19:

        goto LABEL_20;
      }
      unsigned int v19 = +[RMConfigurationPayload entity];
      if (([v13 isKindOfEntity:v19] & 1) == 0)
      {
        uint64_t v23 = +[RMConfigurationPayloadState entity];
        unsigned __int8 v25 = [v13 isKindOfEntity:v23];

        if ((v25 & 1) == 0) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }

    goto LABEL_19;
  }
  BOOL v12 = objc_opt_new();
LABEL_25:

  BOOL v20 = [v12 count] != 0;
  return v20;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 persistentHistoryToken];
  id v9 = [v7 persistentHistoryToken];
  unsigned __int8 v10 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:v8 fromSameStoreAsUpdatedToken:v9];

  if (v10)
  {
    uint64_t v21 = 0;
    objc_super v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = sub_100042414;
    unsigned __int8 v25 = sub_100042424;
    id v26 = 0;
    [(RMInternalStatusPublisher *)self context];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100046AA4;
    v17[3] = &unk_1000C5188;
    BOOL v20 = &v21;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v11;
    id v19 = v7;
    [v11 performBlockAndWait:v17];
    if ([(id)v22[5] count])
    {
      BOOL v12 = [(RMInternalStatusPublisher *)self subscribedStatusKeyPathUpdater];
      [v12 notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:v22[5]];
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = [(RMInternalStatusPublisher *)self subscribedStatusKeyPathUpdater];
    v14 = +[RMInternalStatusPublisher supportedKeyPaths];
    [v13 notifyStatusDidChangeForKeyPaths:v14];
  }
  unsigned int v15 = [(RMInternalStatusPublisher *)self delegate];
  id v16 = [v7 persistentHistoryToken];
  [v15 internalStatusPublisher:self didChangeCommandAndDeclarationsPersistentHistoryToken:v16];
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater
{
  return self->_subscribedStatusKeyPathUpdater;
}

- (void)setSubscribedStatusKeyPathUpdater:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (RMInternalStatusPublisherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMInternalStatusPublisherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_persistentHistoryNotifier, 0);
  objc_storeStrong((id *)&self->_subscribedStatusKeyPathUpdater, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalDeviceStatusByKeyPath, 0);
  objc_storeStrong((id *)&self->_internalDeviceStatusByKeyPathLock, 0);

  objc_storeStrong((id *)&self->_internalDeviceStatusByKeyPathNotificationLock, 0);
}

@end