@interface BAAgentSystemConnection
- (BAAgentSystemConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4;
- (BAAppStoreProgressConfiguration)clientProgressConfiguration;
- (NSString)debugDescription;
- (void)applicationEventPerformedWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)applicationPrepareWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 completionHandler:(id)a5;
- (void)reportProgressForIdentifier:(id)a3 progressInfo:(id)a4;
- (void)runDebugCommand:(id)a3 reply:(id)a4;
- (void)setClientProgressConfiguration:(id)a3;
- (void)updateAppStoreProgressObservationWithConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation BAAgentSystemConnection

- (BAAgentSystemConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BAAgentSystemConnection;
  v4 = [(BAAgentConnection *)&v12 initWithNSXPCConnection:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    v4->_progressConfigLock._os_unfair_lock_opaque = 0;
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BAClientSystemXPCProtocol];
    [v6 setClass:objc_opt_class() forSelector:"receiveAppStoreProgressWithAppBundleIdentifier:progressInfo:" argumentIndex:1 ofReply:0];
    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BAAgentSystemXPCProtocol];
    [v7 setClass:objc_opt_class() forSelector:"applicationPrepareWithDescriptor:completionHandler:" argumentIndex:0 ofReply:0];
    [v7 setClass:objc_opt_class() forSelector:"applicationEventPerformedWithDescriptor:completionHandler:" argumentIndex:0 ofReply:0];
    v8 = [(BAAgentConnection *)v5 connection];
    [v8 setRemoteObjectInterface:v6];

    v9 = [(BAAgentConnection *)v5 connection];
    [v9 setExportedInterface:v7];

    v10 = [(BAAgentConnection *)v5 connection];
    [v10 setExportedObject:v5];
  }
  return v5;
}

- (void)applicationPrepareWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  v7 = [v5 appBundleIdentifier];
  v8 = [v7 _baassets_validUTI];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = +[BAAgentCore sharedCore];
    [v9 applicationPrepareWithDescriptor:v5];

    v6[2](v6, 1, 0);
  }
  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v10 = [v5 appBundleIdentifier];
    v11 = +[NSString stringWithFormat:@"Invalid application identifier supplied: %@", v10];
    v15 = v11;
    objc_super v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    v13 = +[NSError errorWithDomain:@"BAAgentSystemConnectionErrorDomain" code:1 userInfo:v12];
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v13);
  }
}

- (void)applicationEventPerformedWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  v7 = [v5 appBundleIdentifier];
  v8 = [v7 _baassets_validUTI];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v5 automaticInstall] && objc_msgSend(v5, "eventType") == (id)10)
    {
      v9 = sub_100013BEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App Store sent an [Installing] event during an automatic install for: (%{public}@). Dropping event...", buf, 0xCu);
      }
    }
    else
    {
      id v14 = [v5 eventType];
      uint64_t v15 = 1;
      switch((unint64_t)v14)
      {
        case 0xAuLL:
          goto LABEL_21;
        case 0xBuLL:
          uint64_t v15 = 2;
          goto LABEL_21;
        case 0xCuLL:
          uint64_t v15 = 3;
          goto LABEL_21;
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
          goto LABEL_13;
        case 0x14uLL:
          uint64_t v15 = 4;
          goto LABEL_21;
        case 0x15uLL:
          uint64_t v15 = 5;
          goto LABEL_21;
        case 0x16uLL:
          v9 = +[BAAgentCore sharedCore];
          v16 = [v5 appBundleIdentifier];
          -[NSObject applicationInstallCanceledWithIdentifier:userInitiated:](v9, "applicationInstallCanceledWithIdentifier:userInitiated:", v16, [v5 userInitiated]);
          goto LABEL_18;
        default:
          if (v14 == (id)30)
          {
            uint64_t v15 = 6;
LABEL_21:
            v23 = +[BAAgentCore sharedCore];
            v24 = [v5 appBundleIdentifier];
            v25 = [v5 appBundleURL];
            [v23 handleApplicationEvent:v15 identifier:v24 bundleURLPath:v25 userInitiated:[v5 userInitiated]];

            goto LABEL_22;
          }
          if (v14 != (id)5)
          {
LABEL_13:
            NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
            id v18 = [v5 eventType];
            v19 = [v5 appBundleIdentifier];
            v20 = +[NSString stringWithFormat:@"Invalid eventType supplied (%lu) for: %@", v18, v19];
            v27 = v20;
            v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

            v22 = +[NSError errorWithDomain:@"BAAgentSystemConnectionErrorDomain" code:2 userInfo:v21];
            v6[2](v6, 0, v22);

            goto LABEL_23;
          }
          v9 = +[BAAgentCore sharedCore];
          v16 = [v5 appBundleIdentifier];
          v17 = [v5 appBundleURL];
          -[NSObject applicationPlaceholderReadyWithIdentifier:placeholderBundleURL:userInitiated:](v9, "applicationPlaceholderReadyWithIdentifier:placeholderBundleURL:userInitiated:", v16, v17, [v5 userInitiated]);

LABEL_18:
          break;
      }
    }

LABEL_22:
    v6[2](v6, 1, 0);
  }
  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v10 = [v5 appBundleIdentifier];
    v11 = +[NSString stringWithFormat:@"Invalid application identifier supplied: %@", v10];
    v31 = v11;
    objc_super v12 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];

    v13 = +[NSError errorWithDomain:@"BAAgentSystemConnectionErrorDomain" code:1 userInfo:v12];
    v6[2](v6, 0, v13);
  }
LABEL_23:
}

- (void)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, void))a5;
  v10 = [v7 _baassets_validUTI];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = +[BAAgentCore sharedCore];
    [v11 handleApplicationEvent:7 identifier:v10 bundleURLPath:v8 userInitiated:0];

    v9[2](v9, 1, 0);
  }
  else
  {
    objc_super v12 = +[NSString stringWithFormat:@"Invalid application identifier supplied: %@", v7, NSLocalizedDescriptionKey];
    v16 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    id v14 = +[NSError errorWithDomain:@"BAAgentSystemConnectionErrorDomain" code:1 userInfo:v13];
    ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v14);
  }
}

- (void)runDebugCommand:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"command"];
  id v8 = [v7 lowercaseString];

  v9 = [v6 objectForKey:@"arguments"];

  if ([v8 isEqualToString:@"state"])
  {
    if (![v9 count])
    {
      v10 = +[BAAgentCore sharedCore];
      [v10 _printDebugState];
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ([v8 isEqualToString:@"shutdown"])
  {
    if ([v9 count]) {
      goto LABEL_15;
    }
LABEL_13:
    v10 = +[BAAgentCore sharedCore];
    [v10 _debugShutdown];
    goto LABEL_14;
  }
  if (![v8 isEqualToString:@"force_periodic"])
  {
    if ([v8 isEqualToString:@"reset"])
    {
      if ([v9 count]) {
        goto LABEL_15;
      }
      v11 = +[BAAgentCore sharedCore];
      [v11 _setClearBeforeShutdown];

      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"downloads-allowed"])
    {
      if ([v9 count] != (id)1) {
        goto LABEL_15;
      }
      v10 = [v9 objectAtIndex:0];
      objc_super v12 = [v10 lowercaseString];
      unsigned int v13 = [v12 isEqualToString:@"clear"];

      if (v13)
      {
        id v14 = +[BAAgentCore sharedCore];
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = 1;
      }
      else
      {
        v28 = [v10 lowercaseString];
        unsigned int v29 = [v28 isEqualToString:@"yes"];

        if (v29)
        {
          id v14 = +[BAAgentCore sharedCore];
          uint64_t v15 = v14;
          uint64_t v16 = 1;
        }
        else
        {
          v36 = [v10 lowercaseString];
          unsigned int v37 = [v36 isEqualToString:@"no"];

          if (!v37) {
            goto LABEL_14;
          }
          id v14 = +[BAAgentCore sharedCore];
          uint64_t v15 = v14;
          uint64_t v16 = 0;
        }
        uint64_t v17 = 0;
      }
      [v14 _debugDownloadTime:v16 clear:v17];
LABEL_79:

      goto LABEL_14;
    }
    if (![v8 isEqualToString:@"consume-extension-time"])
    {
      if ([v8 isEqualToString:@"reset-extension-time"])
      {
        if ([v9 count] != (id)1)
        {
          v10 = sub_100013B54();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100038F00();
          }
          goto LABEL_14;
        }
        v25 = [v9 objectAtIndex:0];
        v10 = [v25 _baassets_validUTI];

        if (!v10 || ![v10 length])
        {
          uint64_t v15 = sub_100013B54();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100038ECC();
          }
          goto LABEL_79;
        }
        NSErrorUserInfoKey v26 = +[BAAgentCore sharedCore];
        uint64_t v15 = [v26 applicationInfoForIdentifier:v10];

        v19 = sub_100013B54();
        BOOL v27 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v27)
          {
            *(_DWORD *)buf = 138543362;
            v48 = (BAContentRequestTelemetry *)v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Resetting extension runtime for %{public}@", buf, 0xCu);
          }

          [v15 resetExtensionRuntime];
          v19 = +[BAAgentCore sharedCore];
          [v19 saveApplicationState];
          goto LABEL_78;
        }
        if (!v27)
        {
LABEL_78:

          goto LABEL_79;
        }
        *(_DWORD *)buf = 138543362;
        v48 = (BAContentRequestTelemetry *)v10;
      }
      else
      {
        if (![v8 isEqualToString:@"send-telemetry-event"]) {
          goto LABEL_15;
        }
        if ([v9 count] != (id)1)
        {
          v10 = sub_100013B54();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100038F68();
          }
          goto LABEL_14;
        }
        NSErrorUserInfoKey v30 = [v9 objectAtIndex:0];
        v10 = [v30 _baassets_validUTI];

        if (!v10 || ![v10 length])
        {
          uint64_t v15 = sub_100013B54();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100038F34();
          }
          goto LABEL_79;
        }
        v31 = +[BAAgentCore sharedCore];
        uint64_t v15 = [v31 applicationInfoIfExistsForIdentifier:v10];

        if (v15)
        {
          v19 = [v10 stringByAppendingString:@"1CB2CF25-5012-4A61-85D5-2FF468AE9203"];
          v32 = [BAContentRequestTelemetry alloc];
          id v33 = [v15 installSource];
          v34 = +[NSSet set];
          v23 = [(BAContentRequestTelemetry *)v32 initWithContentRequest:3 applicationIdentifier:v19 installSource:v33 downloads:v34];

          +[BATelemetrySender sendContentRequestTelemetryEvent:v23];
          goto LABEL_77;
        }
        v19 = sub_100013B54();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_78;
        }
        *(_DWORD *)buf = 138543362;
        v48 = (BAContentRequestTelemetry *)v10;
      }
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Unable to get application runtime info for identifier: %{public}@", buf, 0xCu);
      goto LABEL_78;
    }
    if ([v9 count] != (id)2)
    {
      v10 = sub_100013B54();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100038E98();
      }
      goto LABEL_14;
    }
    id v18 = [v9 objectAtIndex:0];
    v10 = [v18 _baassets_validUTI];

    uint64_t v15 = [v9 objectAtIndex:1];
    v19 = +[NSScanner scannerWithString:v15];
    uint64_t v46 = 0;
    [v19 scanInteger:&v46];
    v20 = [v15 substringFromIndex:[v19 scanLocation]];
    v21 = [v20 lowercaseString];
    v22 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    v23 = [v21 stringByTrimmingCharactersInSet:v22];

    if ([(BAContentRequestTelemetry *)v23 length] == (id)1)
    {
      if ([(BAContentRequestTelemetry *)v23 isEqualToString:@"m"])
      {
        uint64_t v24 = 60 * v46;
        goto LABEL_55;
      }
      if ([(BAContentRequestTelemetry *)v23 isEqualToString:@"h"])
      {
        uint64_t v24 = 3600 * v46;
LABEL_55:
        uint64_t v46 = v24;
        if (v24)
        {
          v38 = +[BAAgentCore sharedCore];
          v39 = [v38 applicationInfoForIdentifier:v10];

          if (!v39)
          {
            v45 = sub_100013B54();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v48 = (BAContentRequestTelemetry *)v10;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Unable to get application runtime info for identifier: %{public}@", buf, 0xCu);
            }
            goto LABEL_76;
          }
          uint64_t v40 = v46;
          v41 = sub_100013B54();
          BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
          if (v40 < 1)
          {
            p_vtable = &OBJC_METACLASS___BAAppStoreProgressInfoDescriptor.vtable;
            if (v42)
            {
              *(_DWORD *)buf = 134218242;
              v48 = (BAContentRequestTelemetry *)v46;
              __int16 v49 = 2114;
              v50 = v10;
              v44 = "Removing %ld seconds to %{public}@";
              goto LABEL_74;
            }
          }
          else
          {
            p_vtable = (void **)(&OBJC_METACLASS___BAAppStoreProgressInfoDescriptor + 24);
            if (v42)
            {
              *(_DWORD *)buf = 134218242;
              v48 = (BAContentRequestTelemetry *)v46;
              __int16 v49 = 2114;
              v50 = v10;
              v44 = "Added %ld seconds to %{public}@";
LABEL_74:
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, v44, buf, 0x16u);
            }
          }

          [v39 _debugConsumeTime:(double)v46];
          v45 = [p_vtable + 212 sharedCore];
          [v45 saveApplicationState];
LABEL_76:
        }
LABEL_77:

        goto LABEL_78;
      }
      v35 = sub_100013B54();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v23;
        goto LABEL_66;
      }
    }
    else
    {
      v35 = sub_100013B54();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v23;
LABEL_66:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Invalid unit string: %{public}@\nShould be 'm' or 'h'.", buf, 0xCu);
      }
    }

    uint64_t v46 = 0;
    goto LABEL_77;
  }
  if (![v9 count])
  {
    v10 = +[BAAgentCore sharedCore];
    [v10 doPeriodicUpdateCheck];
    goto LABEL_14;
  }
LABEL_15:
  v5[2](v5);
}

- (void)updateAppStoreProgressObservationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = (os_unfair_lock_s *)a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  os_unfair_lock_lock(&self->_progressConfigLock);
  [(BAAgentSystemConnection *)self setClientProgressConfiguration:v6];
  os_unfair_lock_unlock(&self->_progressConfigLock);
  uint64_t v16 = v6;
  id v8 = sub_10000C53C(v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
        id v14 = +[BAAgentCore sharedCore];
        uint64_t v15 = [v14 essentialAssetsProgressDescriptorWithIdentifier:v13];

        [(BAAgentSystemConnection *)self reportProgressForIdentifier:v13 progressInfo:v15];
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  v7[2](v7, 1, 0);
}

- (void)reportProgressForIdentifier:(id)a3 progressInfo:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_progressConfigLock);
  id v7 = [(BAAgentSystemConnection *)self clientProgressConfiguration];

  if (v7)
  {
    id v8 = [(BAAgentSystemConnection *)self clientProgressConfiguration];
    id v9 = sub_10000C53C(v8);
    unsigned int v10 = [v9 containsObject:v13];

    os_unfair_lock_unlock(&self->_progressConfigLock);
    if (v10)
    {
      uint64_t v11 = [(BAAgentConnection *)self connection];
      objc_super v12 = [v11 remoteObjectProxyWithErrorHandler:&stru_10005CC08];
      [v12 receiveAppStoreProgressWithAppBundleIdentifier:v13 progressInfo:v6];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_progressConfigLock);
  }
}

- (NSString)debugDescription
{
  v2 = [(BAAgentConnection *)self connection];
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"System Connection\nPID: %d", [v2 processIdentifier]);

  return (NSString *)v3;
}

- (BAAppStoreProgressConfiguration)clientProgressConfiguration
{
  return (BAAppStoreProgressConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientProgressConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end