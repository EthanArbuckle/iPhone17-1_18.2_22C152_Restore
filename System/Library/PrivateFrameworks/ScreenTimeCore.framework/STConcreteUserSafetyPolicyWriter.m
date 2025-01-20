@interface STConcreteUserSafetyPolicyWriter
- (id)writeUserSafetyInterventionPolicy:(int64_t)a3;
@end

@implementation STConcreteUserSafetyPolicyWriter

- (id)writeUserSafetyInterventionPolicy:(int64_t)a3
{
  id v4 = objc_alloc((Class)MOLocalSettingsStore);
  id v5 = [v4 initWithName:@"UserSafetyStore" sharedContainer:STManagedSettingsContainer];
  v6 = +[STUserDeviceState fetchRequestMatchingLocalUserDeviceState];
  v7 = [v6 execute:0];
  v8 = [v7 firstObject];

  if (!v8)
  {
    v10 = +[NSError errorWithDomain:STErrorDomain code:12 userInfo:0];
    v9 = +[STResult failure:v10];

    goto LABEL_24;
  }
  if ([v8 msInterventionPolicy] == (id)a3)
  {
    v9 = +[STResult success];
    goto LABEL_24;
  }
  v11 = [v5 userSafety];
  v12 = [v11 scanningPolicy];

  switch(a3)
  {
    case 2:
      v14 = &MOUserSafetyInterventionTypeTeen;
LABEL_11:
      uint64_t v13 = +[MOUserSafetyScanningPolicy communicationSafetyWithInterventionType:*v14];
      goto LABEL_12;
    case 1:
      v14 = &MOUserSafetyInterventionTypeChild;
      goto LABEL_11;
    case 0:
      uint64_t v13 = +[MOUserSafetyScanningPolicy nonePolicy];
LABEL_12:
      v15 = (void *)v13;
      goto LABEL_14;
  }
  v15 = 0;
LABEL_14:
  v16 = [v5 userSafety];
  [v16 setScanningPolicy:v15];

  [v8 setMsInterventionPolicy:a3];
  v17 = +[STLog userSafetyPolicyWriter];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    __int16 v29 = 2112;
    v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully wrote user safety policy from %@ to %@", buf, 0x16u);
  }

  v18 = [v8 managedObjectContext];
  unsigned int v19 = [v18 hasChanges];

  if (v19)
  {
    v20 = [v8 managedObjectContext];
    id v26 = 0;
    unsigned __int8 v21 = [v20 save:&v26];
    id v22 = v26;

    if ((v21 & 1) == 0)
    {
      v23 = +[STLog userSafetyPolicyWriter];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        sub_1002680B8((uint64_t)v22, v23);
      }

      uint64_t v24 = +[STResult failure:v22];
      goto LABEL_23;
    }
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v24 = +[STResult success];
LABEL_23:
  v9 = (void *)v24;

LABEL_24:
  return v9;
}

@end