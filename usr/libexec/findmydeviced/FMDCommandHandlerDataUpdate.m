@interface FMDCommandHandlerDataUpdate
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation FMDCommandHandlerDataUpdate

- (void)handleCommand
{
  v3 = [(FMDCommandHandler *)self commandParams];
  v4 = [v3 objectForKey:off_10031D2B8];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = +[FMDExtConfigurationRegistry sharedInstance];
    v7 = [v6 configurations];
    v8 = [v7 allKeys];

    [v6 fetchSupportedAccessoryTypes];
    [v6 fetchConfigForAccessoryTypes:v8];
  }
  v9 = [(FMDCommandHandler *)self commandParams];
  v10 = [v9 objectForKey:off_10031D290];
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = [(FMDCommandHandler *)self commandParams];
    v13 = [v12 objectForKey:off_10031D288];

    v14 = [(FMDCommandHandler *)self commandParams];
    v15 = [v14 objectForKey:off_10031D298];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = +[FMDServiceProvider activeServiceProvider];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v16 detachNotificationManager];
        [v17 updateAccessoryIds:v13 version:v15 withCompletion:0];
      }
    }
  }
  v18 = [(FMDCommandHandler *)self commandParams];
  v19 = [v18 objectForKey:off_10031D2A8];
  unsigned int v20 = [v19 BOOLValue];

  v21 = sub_100004238();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100240050(self, v21);
  }

  if (v20)
  {
    v22 = [(FMDCommandHandler *)self commandParams];
    v23 = [v22 objectForKey:off_10031D2A0];

    v24 = [(FMDCommandHandler *)self commandParams];
    v25 = [v24 objectForKey:off_10031D2B0];

    v26 = +[FMDMagSafeDataStore sharedInstance];
    v27 = [v26 readLostModeAccessoriesListVersion];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v25 isEqualToString:v27] & 1) == 0)
    {
      v55 = v27;
      v30 = sub_100004238();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        sub_10023FFC8((uint64_t)v25, (uint64_t)v23, v30);
      }

      v31 = +[FMDMagSafeDataStore sharedInstance];
      id v32 = [v31 writeLostModeInfo:v23 version:v25];

      v28 = +[FMDServiceProvider activeServiceProvider];
      v54 = [v28 accessoryRegistry];
      [v54 allAccessories];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v57;
        while (2)
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(void *)v57 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if ([v38 connectionState] == (id)1)
            {
              v39 = [v38 accessoryIdentifier];
              unsigned int v40 = [v23 containsObject:v39];

              if (v40)
              {
                v41 = +[NSNotificationCenter defaultCenter];
                [v41 postNotificationName:@"com.apple.accessories.connection.passedMFi4Auth" object:0];

                goto LABEL_29;
              }
            }
          }
          id v35 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }
LABEL_29:

      v27 = v55;
    }
    else
    {
      v28 = sub_100004238();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v61 = v23;
        __int16 v62 = 2112;
        id v63 = (id)objc_opt_class();
        __int16 v64 = 2112;
        v65 = v27;
        __int16 v66 = 2112;
        v67 = v25;
        id v29 = v63;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "lostModeInfo got unexpected info = %@, %@, cachedVersion = %@, newVersion = %@", buf, 0x2Au);
      }
    }
  }
  v42 = [(FMDCommandHandler *)self commandParams];
  v43 = [v42 objectForKey:off_10031D2C8];

  v44 = [(FMDCommandHandler *)self commandParams];
  v45 = v44;
  if (!v43)
  {
    v49 = [v44 objectForKey:off_10031D2C0];

    if (!v49)
    {
LABEL_45:

      goto LABEL_46;
    }
    v51 = +[FMDLocalActivationLockInfoManager sharedInstance];
    v52 = v51;
    goto LABEL_40;
  }
  v46 = [v44 objectForKey:off_10031D2C8];
  unsigned int v47 = [v46 BOOLValue];

  if (v47)
  {
    v48 = [(FMDCommandHandler *)self commandParams];
    v49 = [v48 objectForKey:off_10031D2C0];

    BOOL v50 = v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && [v49 length] != 0;
    v51 = +[FMDLocalActivationLockInfoManager sharedInstance];
    v52 = v51;
    if (!v50)
    {
      v53 = sub_100004238();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Clearing maskedAppleID via dataUpdate command", buf, 2u);
      }

      [v52 clearMaskedAppleIDValue];
      goto LABEL_44;
    }
LABEL_40:
    [v51 updateMaskedAppleID:v49];
LABEL_44:

    goto LABEL_45;
  }
LABEL_46:
  [(FMDCommandHandler *)self didHandleCommandWithAckData:0];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"ackURL"];

  v7 = [(FMDCommandHandler *)self provider];
  if (v6)
  {
    v8 = +[NSURL URLWithString:v6];
    v9 = [FMDRequestAckDataUpdate alloc];
    v10 = [v7 account];
    unsigned int v11 = [(FMDCommandHandler *)self commandParams];
    v12 = [(FMDRequestAckDataUpdate *)v9 initWithAccount:v10 dataUpdateCommand:v11 ackURL:v8];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006C0C0;
    v14[3] = &unk_1002D9180;
    id v15 = v4;
    [(FMDRequest *)v12 setCompletionHandler:v14];
    [v7 enqueueRequest:v12];
  }
  else
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the dataUpdate command because there is no ack URL", v13, 2u);
    }
  }
}

@end