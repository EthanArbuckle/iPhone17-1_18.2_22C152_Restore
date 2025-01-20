@interface _DASPlugin
+ (id)existingPluginForIdentifier:(id)a3 ofType:(id)a4;
+ (id)extensionForIdentifier:(id)a3 ofType:(id)a4;
+ (id)pluginForIdentifier:(id)a3 ofType:(id)a4;
- (BOOL)isInternal;
- (NSExtension)extension;
- (NSString)displayName;
- (NSString)extensionID;
- (NSString)extensionName;
- (NSString)pluginMapKey;
- (NSUUID)sessionID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (_DASActivity)currentActivity;
- (_DASPlugin)initWithExtension:(id)a3 pluginMapKey:(id)a4;
- (_DASPluginDelegate)pluginDelegate;
- (id)_contextForSession;
- (id)container;
- (id)containerID;
- (id)description;
- (void)_setupExtension;
- (void)_setupSessionIfNecessary;
- (void)extensionDidFinishWithStatus:(unsigned __int8)a3;
- (void)performActivity:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionName:(id)a3;
- (void)setPluginDelegate:(id)a3;
- (void)setPluginMapKey:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionID:(id)a3;
- (void)suspend;
- (void)unload;
@end

@implementation _DASPlugin

+ (id)extensionForIdentifier:(id)a3 ofType:(id)a4
{
  v5 = a3;
  v41 = a4;
  if (!v5)
  {
    v27 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v41;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Missing identifier for extensionPoint %@", buf, 0xCu);
    }
    v28 = 0;
    goto LABEL_33;
  }
  id v48 = 0;
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v48];
  id v7 = v48;
  if (v6)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v8 = [v6 applicationExtensionRecords];
    id v9 = [v8 countByEnumeratingWithState:&v44 objects:v59 count:16];
    if (v9)
    {
      id v10 = v9;
      v37 = v7;
      id v38 = v6;
      v40 = v5;
      uint64_t v11 = *(void *)v45;
      p_vtable = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
      CFStringRef v13 = @"plugin";
LABEL_5:
      uint64_t v14 = 0;
      id v39 = v10;
      while (1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        v16 = [p_vtable logForCategory:v13, v37];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [v15 bundleIdentifier];
          v18 = [v15 extensionPointRecord];
          [v18 name];
          uint64_t v19 = v11;
          CFStringRef v20 = v13;
          v21 = v8;
          v23 = v22 = p_vtable;
          *(_DWORD *)buf = 138413058;
          v52 = v17;
          __int16 v53 = 2112;
          v54 = v23;
          __int16 v55 = 2112;
          v56 = v41;
          __int16 v57 = 2112;
          v58 = v40;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking extension %@ with pointRecord %@ (want %@) for bundle %@", buf, 0x2Au);

          p_vtable = v22;
          v8 = v21;
          CFStringRef v13 = v20;
          uint64_t v11 = v19;
          id v10 = v39;
        }
        v24 = [v15 extensionPointRecord];
        v25 = [v24 name];
        unsigned __int8 v26 = [v25 isEqualToString:v41];

        if (v26) {
          break;
        }
        if (v10 == (id)++v14)
        {
          id v10 = [v8 countByEnumeratingWithState:&v44 objects:v59 count:16];
          if (v10) {
            goto LABEL_5;
          }
          v5 = v40;
          id v7 = v37;
          id v6 = v38;
          goto LABEL_22;
        }
      }
      v29 = [v15 extensionPointRecord];
      v27 = [v29 name];

      if (v27)
      {
        v30 = v37;
        id v43 = v37;
        v28 = +[NSExtension extensionWithIdentifier:v27 error:&v43];
        v31 = v43;
        v5 = v40;
        id v6 = v38;
        goto LABEL_28;
      }
      v5 = v40;
      id v7 = v37;
      id v6 = v38;
      goto LABEL_23;
    }
  }
  else
  {
    v32 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100100BBC();
    }

    v8 = v7;
    id v7 = 0;
  }
LABEL_22:

LABEL_23:
  v49[0] = NSExtensionPointName;
  v49[1] = NSExtensionIdentifierName;
  v50[0] = v41;
  v50[1] = v5;
  v30 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  id v42 = v7;
  v33 = +[NSExtension extensionsWithMatchingAttributes:v30 error:&v42];
  v31 = v42;

  if ((unint64_t)[v33 count] >= 2)
  {
    v34 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100100B54();
    }
  }
  v28 = [v33 firstObject];

  v27 = 0;
LABEL_28:

  if (!v28)
  {
    v35 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v52 = v27;
      __int16 v53 = 2112;
      v54 = v41;
      __int16 v55 = 2112;
      v56 = v5;
      __int16 v57 = 2112;
      v58 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unable to find extension %@ (%@) for %@: %@", buf, 0x2Au);
    }
  }
LABEL_33:

  return v28;
}

+ (id)existingPluginForIdentifier:(id)a3 ofType:(id)a4
{
  v4 = [a3 stringByAppendingString:a4];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001C4510);
  v5 = (void *)qword_1001C4518;
  if (!qword_1001C4518)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)qword_1001C4518;
    qword_1001C4518 = v6;

    v5 = (void *)qword_1001C4518;
  }
  v8 = [v5 objectForKeyedSubscript:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001C4510);

  return v8;
}

+ (id)pluginForIdentifier:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 stringByAppendingString:v7];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001C4510);
  id v9 = (void *)qword_1001C4518;
  if (!qword_1001C4518)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = (void *)qword_1001C4518;
    qword_1001C4518 = v10;

    id v9 = (void *)qword_1001C4518;
  }
  v12 = [v9 objectForKeyedSubscript:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001C4510);
  if (v12)
  {
    CFStringRef v13 = v12;
    goto LABEL_14;
  }
  uint64_t v14 = [a1 extensionForIdentifier:v6 ofType:v7];
  v15 = v14;
  if (v14)
  {
    if (![v14 optedIn])
    {
      v17 = +[_DASDaemonLogger logForCategory:@"plugin"];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100100C24();
      }

      CFStringRef v13 = 0;
      goto LABEL_13;
    }
    v16 = [[_DASPlugin alloc] initWithExtension:v15 pluginMapKey:v8];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1001C4510);
    [(id)qword_1001C4518 setObject:v16 forKeyedSubscript:v8];
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001C4510);
  }
  else
  {
    v16 = 0;
  }
  CFStringRef v13 = v16;
LABEL_13:

LABEL_14:

  return v13;
}

- (_DASPlugin)initWithExtension:(id)a3 pluginMapKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_DASPlugin;
  v8 = [(_DASPlugin *)&v24 init];
  id v9 = v8;
  if (v8)
  {
    [(_DASPlugin *)v8 setExtension:v6];
    [(_DASPlugin *)v9 setPluginMapKey:v7];
    uint64_t v10 = [v6 infoDictionary];
    uint64_t v11 = [v10 objectForKey:@"CFBundleDisplayName"];
    [(_DASPlugin *)v9 setDisplayName:v11];

    v12 = [v6 identifier];
    CFStringRef v13 = [v12 componentsSeparatedByString:@"."];
    uint64_t v14 = [v13 lastObject];
    [(_DASPlugin *)v9 setExtensionName:v14];

    v15 = [(_DASPlugin *)v9 extensionName];
    v16 = +[NSString stringWithFormat:@"Extension Queue (%@)", v15];

    id v17 = v16;
    v18 = (const char *)[v17 cStringUsingEncoding:4];
    uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    [(_DASPlugin *)v9 setQueue:v20];

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("Extension Delegate Queue", v21);
    [(_DASPlugin *)v9 setDelegateQueue:v22];

    [(_DASPlugin *)v9 _setupExtension];
  }

  return v9;
}

- (void)_setupExtension
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E8C28;
  v7[3] = &unk_100178538;
  objc_copyWeak(&v8, &location);
  v3 = [(_DASPlugin *)self extension];
  [v3 setRequestInterruptionBlock:v7];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E8EB0;
  v5[3] = &unk_100178560;
  objc_copyWeak(&v6, &location);
  v4 = [(_DASPlugin *)self extension];
  [v4 setRequestCancellationBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_contextForSession
{
  v3 = [(_DASPlugin *)self extension];
  v4 = [(_DASPlugin *)self sessionID];
  v5 = [v3 _extensionContextForUUID:v4];

  return v5;
}

- (void)_setupSessionIfNecessary
{
  v3 = [(_DASPlugin *)self sessionID];

  if (!v3)
  {
    v4 = [(_DASPlugin *)self extension];
    id v11 = 0;
    v5 = [v4 beginExtensionRequestWithOptions:0 inputItems:0 error:&v11];
    id v6 = v11;

    if (v6 || !v5)
    {
      id v8 = +[_DASDaemonLogger logForCategory:@"plugin"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100100D38();
      }
    }
    else
    {
      [(_DASPlugin *)self setSessionID:v5];
      id v7 = [(_DASPlugin *)self _contextForSession];
      [v7 setContextPlugin:self];

      id v8 = [(_DASPlugin *)self _contextForSession];
      id v9 = [v8 pid];
      uint64_t v10 = [(_DASPlugin *)self currentActivity];
      [v10 setPid:v9];
    }
  }
}

- (void)performActivity:(id)a3
{
  v4 = a3;
  v5 = [(_DASPlugin *)self currentActivity];

  id v6 = +[_DASDaemonLogger logForCategory:@"plugin"];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100100E9C(self, (uint64_t)v4, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plugin performing activity: %@", buf, 0xCu);
    }

    [(_DASPlugin *)self setCurrentActivity:v4];
    [(_DASPlugin *)self _setupSessionIfNecessary];
    id v7 = [(_DASPlugin *)self _contextForSession];
    id v8 = +[_DASDaemonLogger logForCategory:@"plugin"];
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Host context %@ (%@)", buf, 0x16u);
      }

      id v15 = 0;
      id v11 = [v7 remoteContextWithError:&v15];
      id v9 = v15;
      v12 = +[_DASDaemonLogger logForCategory:@"plugin"];
      CFStringRef v13 = v12;
      if (v9 || !v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100100E34();
        }
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [(_DASPlugin *)self sessionID];
          *(_DWORD *)buf = 138412290;
          id v17 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Reaching out to plugin to perform action with request ID %@.", buf, 0xCu);
        }
        [v11 performActivity:v4];
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100100DA0(self, v9);
    }
  }
}

- (void)suspend
{
  v3 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping task", buf, 2u);
  }

  [(_DASPlugin *)self _setupSessionIfNecessary];
  v4 = [(_DASPlugin *)self _contextForSession];
  id v8 = 0;
  v5 = [v4 remoteContextWithError:&v8];
  id v6 = v8;
  if (v6 || !v5)
  {
    id v7 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100100E34();
    }
  }
  else
  {
    [v5 suspend];
  }
}

- (void)extensionDidFinishWithStatus:(unsigned __int8)a3
{
  v5 = [(_DASPlugin *)self pluginDelegate];
  id v6 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifying delegate %@ that plugin has finished", buf, 0xCu);
  }

  id v7 = [(_DASPlugin *)self currentActivity];
  id v8 = [(_DASPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9644;
  block[3] = &unk_100178588;
  id v12 = v5;
  id v13 = v7;
  unsigned __int8 v14 = a3;
  id v9 = v7;
  id v10 = v5;
  dispatch_async(v8, block);
}

- (void)unload
{
  v3 = [(_DASPlugin *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9724;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)container
{
  v2 = [(_DASPlugin *)self extension];
  v3 = [v2 _plugIn];
  v4 = [v3 containingUrl];
  v5 = [v4 path];

  return v5;
}

- (id)containerID
{
  v2 = [(_DASPlugin *)self container];
  v3 = +[NSBundle bundleWithPath:v2];
  v4 = [v3 bundleIdentifier];

  return v4;
}

- (NSString)extensionID
{
  v2 = [(_DASPlugin *)self extension];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)isInternal
{
  return 0;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(_DASPlugin *)self extensionName];
  unsigned int v5 = [(_DASPlugin *)self isInternal];
  CFStringRef v6 = &stru_100179948;
  if (v5) {
    CFStringRef v6 = @" (internal)";
  }
  id v7 = +[NSString stringWithFormat:@"<%@ %@%@>", v3, v4, v6];

  return v7;
}

- (NSString)extensionName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtensionName:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (_DASPluginDelegate)pluginDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginDelegate);

  return (_DASPluginDelegate *)WeakRetained;
}

- (void)setPluginDelegate:(id)a3
{
}

- (NSExtension)extension
{
  return (NSExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtension:(id)a3
{
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NSString)pluginMapKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPluginMapKey:(id)a3
{
}

- (_DASActivity)currentActivity
{
  return (_DASActivity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_pluginMapKey, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_pluginDelegate);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_extensionName, 0);
}

@end