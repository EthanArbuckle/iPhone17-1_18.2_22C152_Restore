@interface WCDRetrievePairedListOperation
- (BOOL)paired;
- (id)pairedDeviceInformationForDevice:(id)a3;
- (void)doWorkWithCompletionHandler:(id)a3;
- (void)setPaired:(BOOL)a3;
@end

@implementation WCDRetrievePairedListOperation

- (void)doWorkWithCompletionHandler:(id)a3
{
  v38 = (void (**)(id, void *, const __CFString *))a3;
  v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v52 = "-[WCDRetrievePairedListOperation doWorkWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v5 = objc_initWeak(&location, self);
  unsigned int v6 = [(WCDRetrievePairedListOperation *)self isCancelled];

  if (!v6)
  {
    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v37 = [v8 getActivePairedDevice];

    v9 = +[NRPairedDeviceRegistry sharedInstance];
    v10 = [v9 getPairedDevices];
    id v35 = [v10 copy];

    id v11 = 0;
    if (v37)
    {
      id v36 = 0;
      id v7 = 0;
      if (v35)
      {
        unsigned __int8 v12 = [v35 containsObject:v37];
        id v13 = objc_loadWeakRetained(&location);
        v14 = v13;
        if ((v12 & 1) == 0)
        {
          unsigned int v17 = [v13 isCancelled];

          if (!v17)
          {
            v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:35 userInfo:0];
            v38[2](v38, v32, @"getPairedDevices does not contain getActivePairedDevice");

            goto LABEL_33;
          }
LABEL_9:
          id v16 = objc_loadWeakRetained(&location);
          [v16 finish];

LABEL_33:
          id v11 = 0;
          id v36 = 0;
          id v7 = 0;
          goto LABEL_34;
        }
        unsigned int v15 = [v13 isCancelled];

        if (v15) {
          goto LABEL_9;
        }
        [(WCDRetrievePairedListOperation *)self setPaired:1];
        uint64_t v18 = NRDevicePropertyPairingID;
        v19 = [v37 valueForProperty:NRDevicePropertyPairingID];
        id v36 = [v19 UUIDString];

        id v7 = [(WCDRetrievePairedListOperation *)self pairedDeviceInformationForDevice:v37];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id obj = v35;
        id v11 = 0;
        id v20 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v45;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              id v24 = objc_loadWeakRetained(&location);
              unsigned int v25 = [v24 isCancelled];

              if (v25)
              {
                id v33 = objc_loadWeakRetained(&location);
                [v33 finish];

                goto LABEL_34;
              }
              if (!v11) {
                id v11 = (id)objc_opt_new();
              }
              v26 = [v23 valueForProperty:v18];
              v27 = [v26 UUIDString];
              [v11 addObject:v27];
            }
            id v20 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        if (!v36)
        {
          v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCDRetrievePairedListOperation doWorkWithCompletionHandler:]", "pairingID");
          v29 = wc_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_10002AAF0((uint64_t)[v28 UTF8String], buf, v29);
          }

          +[NSException raise:NSInvalidArgumentException, @"%@", v28 format];
        }
        if (!v11)
        {
          v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s cannot be nil.", "-[WCDRetrievePairedListOperation doWorkWithCompletionHandler:]", "pairedDevicesPairingIDs");
          v31 = wc_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            sub_10002AAF0((uint64_t)[v30 UTF8String], v49, v31);
          }

          +[NSException raise:NSInvalidArgumentException, @"%@", v30 format];
          id v11 = 0;
        }
      }
    }
    else
    {
      id v36 = 0;
      id v7 = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C8E0;
    block[3] = &unk_100044CD0;
    objc_copyWeak(&v43, &location);
    block[4] = self;
    id v36 = v36;
    id v40 = v36;
    id v7 = v7;
    id v41 = v7;
    id v11 = v11;
    id v42 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v43);
LABEL_34:

    goto LABEL_35;
  }
  id v7 = objc_loadWeakRetained(&location);
  [v7 finish];
LABEL_35:

  objc_destroyWeak(&location);
}

- (id)pairedDeviceInformationForDevice:(id)a3
{
  uint64_t v3 = NRDevicePropertyIsInternalInstall;
  id v4 = a3;
  id v5 = [v4 valueForProperty:v3];
  unsigned int v6 = [v5 BOOLValue];
  id v7 = @"Production";
  if (v6) {
    id v7 = @"Internal";
  }
  v8 = v7;

  uint64_t v18 = [v4 valueForProperty:NRDevicePropertyHWModelString];
  v9 = [v4 valueForProperty:NRDevicePropertyProductType];
  v10 = +[NSString stringWithFormat:@"%@ (%@)", v18, v9];
  id v11 = [v4 valueForProperty:NRDevicePropertySystemName];
  unsigned __int8 v12 = [v4 valueForProperty:NRDevicePropertySystemVersion];
  id v13 = [v4 valueForProperty:NRDevicePropertySystemBuildVersion];
  v14 = +[NSString stringWithFormat:@"%@ %@ (%@)", v11, v12, v13];
  unsigned int v15 = [v4 valueForProperty:NRDevicePropertyName];

  id v16 = +[NSString stringWithFormat:@"%@: %@, %@, \"%@\"", v8, v10, v14, v15];

  return v16;
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

@end