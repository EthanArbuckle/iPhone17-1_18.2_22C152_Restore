@interface PKServicePersonality
- (NSString)description;
- (NSUserDefaults)preferences;
- (NSXPCConnection)connection;
- (PKService)service;
- (PKServicePersonality)initWithConnection:(id)a3 service:(id)a4;
- (double)cleanExitTimeout;
- (id)defaultPrincipalObject;
- (id)embeddedPrincipal;
- (id)findProtocol:(id)a3;
- (id)hostPrincipal;
- (id)plugInPrincipal;
- (id)setupWithIdentifier:(id)a3 extensionPointPlatform:(unsigned int)a4;
- (void)beginUsingPlugIn:(id)a3 ready:(id)a4;
- (void)hostHasControl;
- (void)prefsObjectForKey:(id)a3 inPlugIn:(id)a4 result:(id)a5;
- (void)prefsSetObject:(id)a3 forKey:(id)a4 inPlugIn:(id)a5 result:(id)a6;
- (void)prepareUsing:(id)a3 reply:(id)a4;
- (void)prepareUsingPlugIn:(id)a3 hostProtocol:(id)a4 reply:(id)a5;
- (void)setConnection:(id)a3;
- (void)setEmbeddedPrincipal:(id)a3;
- (void)setHostPrincipal:(id)a3;
- (void)setPlugInPrincipal:(id)a3;
- (void)setPreferences:(id)a3;
- (void)shutdownPlugIn;
@end

@implementation PKServicePersonality

- (PKServicePersonality)initWithConnection:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 external];
  v28.receiver = self;
  v28.super_class = (Class)PKServicePersonality;
  v9 = [(PKPlugInCore *)&v28 initWithExternalProviders:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a4);
    [(PKServicePersonality *)v9 setConnection:v6];
    v10 = [(PKServicePersonality *)v9 connection];
    [v10 setExportedObject:v9];

    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C24450];
    v12 = [(PKServicePersonality *)v9 connection];
    [v12 setExportedInterface:v11];

    v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C29530];
    v14 = [(PKServicePersonality *)v9 connection];
    [v14 setRemoteObjectInterface:v13];

    objc_initWeak(&location, v9);
    objc_initWeak(&from, v9->_connection);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B38C6A64;
    v23[3] = &unk_1E6059460;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(&v25, &from);
    v15 = [(PKServicePersonality *)v9 connection];
    [v15 setInterruptionHandler:v23];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B38C6B9C;
    v19[3] = &unk_1E6059488;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    id v20 = v7;
    v16 = [(PKServicePersonality *)v9 connection];
    [v16 setInvalidationHandler:v19];

    v17 = [(PKServicePersonality *)v9 connection];
    [v17 resume];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)setupWithIdentifier:(id)a3 extensionPointPlatform:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(PKPlugInCore *)self external];
  v8 = [v7 filesystem];
  v9 = [v8 mainBundle];

  v10 = [v9 infoDictionary];
  v11 = sub_1B38C2B00(v10);

  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [v9 bundleURL];
  LOBYTE(v4) = [(PKPlugInCore *)self setupWithName:v6 extensionPointPlatform:v4 url:v13 bundleInfo:v11 uuid:0 discoveryInstanceUUID:0 extensionPointCache:v12];

  if (v4)
  {
    v14 = [(PKServicePersonality *)self service];
    [v14 registerPersonality:self];

    v15 = [[PKServiceDefaults alloc] initWithPersonality:self];
    [(PKServicePersonality *)self setPreferences:v15];
    v16 = 0;
  }
  else
  {
    id v24 = [v9 bundleIdentifier];
    v16 = pkErrorf(4, @"failed to initialize personality %@ for pluginkit plugin %@", v17, v18, v19, v20, v21, v22, (uint64_t)v6);

    pklog_handle_for_category(7);
    v15 = (PKServiceDefaults *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4508();
    }
  }

  return v16;
}

- (void)prepareUsing:(id)a3 reply:(id)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = pklog_handle_for_category(7);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  v9 = pklog_handle_for_category(7);
  v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ExtensionPrepareUsing", "", buf, 2u);
  }

  v12 = [v5 objectForKeyedSubscript:@"identifier"];
  v13 = [v5 objectForKeyedSubscript:@"hostProtocol"];
  v14 = [v5 objectForKeyedSubscript:@"epPlatform"];
  unsigned int v67 = [v14 unsignedIntValue];
  v69 = [v5 objectForKeyedSubscript:@"isRBManaged"];
  uint64_t v15 = [v69 BOOLValue];
  v16 = [v5 objectForKeyedSubscript:@"version"];
  -[PKPlugInCore setHubProtocolVersion:](self, "setHubProtocolVersion:", [v16 unsignedIntegerValue]);

  if (![(PKPlugInCore *)self hubProtocolVersion]) {
    [(PKPlugInCore *)self setHubProtocolVersion:1];
  }
  [(PKPlugInCore *)self setIsRBManaged:v15];
  uint64_t v17 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = "will not";
    if (v15) {
      uint64_t v18 = "will";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_1B38B0000, v17, OS_LOG_TYPE_INFO, "%@: %s be managed by runningboard", buf, 0x16u);
  }

  id v19 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v20 = [v5 objectForKeyedSubscript:@"uuid"];
  uint64_t v21 = (void *)[v19 initWithUUIDString:v20];

  if (v21) {
    [(PKPlugInCore *)self setUuid:v21];
  }
  long long v116 = 0u;
  memset(v117, 0, sizeof(v117));
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  memset(buf, 0, sizeof(buf));
  v79 = 0;
  v80 = 0;
  uint64_t current_persona = voucher_get_current_persona();
  int v23 = current_persona;
  memset(buf, 0, sizeof(buf));
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  memset(v117, 0, sizeof(v117));
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v80, &v79);
  id v24 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v70 = v21;
    id v25 = [(PKPlugInCore *)self uuid];
    [(PKPlugInCore *)self identifier];
    v26 = v65 = v6;
    [(PKPlugInCore *)self version];
    v27 = v63 = v12;
    uid_t v28 = geteuid();
    uid_t v29 = getuid();
    *(_DWORD *)v82 = 138545154;
    v83 = v25;
    __int16 v84 = 2112;
    v85 = v26;
    __int16 v86 = 2112;
    v87 = v27;
    __int16 v88 = 1024;
    uid_t v89 = v28;
    uint64_t v21 = v70;
    __int16 v90 = 1024;
    uid_t v91 = v29;
    __int16 v92 = 1024;
    int v93 = v23;
    __int16 v94 = 2080;
    v95 = v80;
    __int16 v96 = 2080;
    v97 = v79;
    _os_log_impl(&dword_1B38B0000, v24, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Prepare received as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v82, 0x46u);

    v12 = v63;
    id v6 = v65;
  }
  v30 = self;
  uint64_t v31 = [(PKServicePersonality *)self setupWithIdentifier:v12 extensionPointPlatform:v67];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = pklog_handle_for_category(7);
    v34 = v33;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      uint64_t v35 = [v32 code];
      *(void *)buf = 67240448;
      *(_WORD *)&buf[8] = 2050;
      *(void *)&buf[10] = v35;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v34, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionPrepareUsing", " success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ", buf, 0x12u);
    }

    v6[2](v6, v32, 0);
    v36 = v69;
  }
  else
  {
    id v61 = v5;
    v64 = v12;
    v66 = v6;
    v62 = v14;
    v71 = v21;
    if (v13)
    {
      id v78 = 0;
      v37 = sub_1B38C3200(v13, &v78);
      id v38 = v78;
      id v68 = v38;
      if (v37)
      {
        v39 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v37];
        v40 = [(PKServicePersonality *)self connection];
        v41 = [v40 exportedInterface];
        [v41 setInterface:v39 forSelector:sel_beginUsingPlugIn_ready_ argumentIndex:0 ofReply:0];
      }
      else
      {
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3B8];
        v39 = [v38 localizedDescription];
        [v42 raise:v43, @"%@", v39 format];
      }

      v30 = self;
    }
    else
    {
      id v68 = 0;
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v44 = [(PKServicePersonality *)v30 service];
    v45 = [v44 subsystems];

    unint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v75;
      do
      {
        uint64_t v48 = 0;
        if (v46 <= 1) {
          uint64_t v49 = 1;
        }
        else {
          uint64_t v49 = v46;
        }
        do
        {
          if (*(void *)v75 != v47) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v74 + 1) + 8 * v48);
          if (objc_opt_respondsToSelector())
          {
            v51 = (objc_class *)objc_opt_class();
            v52 = NSStringFromClass(v51);
            v53 = pklog_handle_for_category(7);
            v54 = v53;
            if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v71;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v52;
              _os_signpost_emit_with_name_impl(&dword_1B38B0000, v54, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExtensionSubsystemBeginUsing", " uuid=%{public, signpost.description:attribute}@  name=%{public, signpost.description:attribute}@ ", buf, 0x16u);
            }

            v55 = [MEMORY[0x1E4F28B50] mainBundle];
            __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__(v50);

            v56 = pklog_handle_for_category(7);
            v57 = v56;
            if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B38B0000, v57, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionSubsystemBeginUsing", "", buf, 2u);
            }
          }
          ++v48;
        }
        while (v49 != v48);
        unint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v46);
    }

    v58 = [MEMORY[0x1E4F1CA60] dictionary];
    v59 = pklog_handle_for_category(7);
    v60 = v59;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      *(void *)buf = 0x104020200;
      *(_WORD *)&buf[8] = 2050;
      *(void *)&buf[10] = 0;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v60, OS_SIGNPOST_INTERVAL_END, spid, "ExtensionPrepareUsing", " success=%{public, signpost.description:attribute}d  error=%{public, signpost.description:attribute}llu ", buf, 0x12u);
    }

    id v6 = v66;
    ((void (**)(id, void *, void *))v66)[2](v66, 0, v58);

    id v5 = v61;
    v14 = v62;
    v12 = v64;
    v36 = v69;
    uint64_t v21 = v71;
    v32 = v68;
  }
}

- (void)prepareUsingPlugIn:(id)a3 hostProtocol:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a3;
  v12 = [v10 dictionary];
  [v12 setObject:v11 forKeyedSubscript:@"identifier"];

  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:@"hostProtocol"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B38C7920;
  v14[3] = &unk_1E60594B0;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [(PKServicePersonality *)self prepareUsing:v12 reply:v14];
}

- (void)beginUsingPlugIn:(id)a3 ready:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v30 = 0;
  uint64_t v31 = 0;
  uint64_t current_persona = voucher_get_current_persona();
  int v12 = current_persona;
  memset(v48, 0, 348);
  LODWORD(v48[0]) = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)v48, &v31, &v30);
  id v13 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(PKPlugInCore *)self uuid];
    uint64_t v4 = [(PKPlugInCore *)self identifier];
    id v5 = [(PKPlugInCore *)self version];
    uint64_t v6 = geteuid();
    uid_t v15 = getuid();
    *(_DWORD *)buf = 138545154;
    v33 = v14;
    __int16 v34 = 2112;
    uint64_t v35 = v4;
    __int16 v36 = 2112;
    v37 = v5;
    __int16 v38 = 1024;
    int v39 = v6;
    __int16 v40 = 1024;
    uid_t v41 = v15;
    __int16 v42 = 1024;
    int v43 = v12;
    __int16 v44 = 2080;
    v45 = v31;
    __int16 v46 = 2080;
    uint64_t v47 = v30;
    _os_log_impl(&dword_1B38B0000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Begin using received as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", buf, 0x46u);
  }
  v16 = [(PKServicePersonality *)self service];
  uint64_t v17 = [v16 delegate];
  if (v17)
  {
    uint64_t v4 = [(PKServicePersonality *)self service];
    id v5 = [v4 delegate];
    uint64_t v6 = [(PKPlugInCore *)self identifier];
    [v5 rootObjectForPlugIn:v6];
  }
  else
  {
    [(PKServicePersonality *)self defaultPrincipalObject];
  uint64_t v18 = };
  id v19 = v18;
  if (v17)
  {

    uint64_t v18 = v4;
  }

  if (v19)
  {
    [(PKServicePersonality *)self setPlugInPrincipal:v19];
    uint64_t v20 = (void *)MEMORY[0x1E4F29280];
    uint64_t v21 = [(PKPlugInCore *)self protocolSpec];
    uint64_t v22 = [(PKServicePersonality *)self findProtocol:v21];
    int v23 = [v20 interfaceWithProtocol:v22];

    id v24 = [(PKServicePersonality *)self connection];
    id v25 = [v24 exportedInterface];
    [v25 setInterface:v23 forSelector:sel_beginUsingPlugIn_ready_ argumentIndex:1 ofReply:1];

    v26 = [(PKPlugInCore *)self augmentInterface:v23];
    if (v26)
    {
      v27 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1B38D4710();
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      uid_t v28 = [(PKServicePersonality *)self service];
      [v28 beganUsingServicePersonality:self];
    }
    else
    {
      [(PKServicePersonality *)self setHostPrincipal:v9];
      uid_t v28 = [(PKServicePersonality *)self plugInPrincipal];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v28);
    }
  }
  else
  {
    uid_t v29 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4664(self);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    int v23 = [(PKServicePersonality *)self service];
    [v23 beganUsingServicePersonality:self];
  }
}

- (id)findProtocol:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v18 = 0;
    uint64_t v6 = sub_1B38C32E8(v4, &v18);
    id v7 = v18;
    if (!v6)
    {
      id v8 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v14 = [(PKPlugInCore *)self uuid];
        uid_t v15 = [(PKPlugInCore *)self identifier];
        v16 = [(PKPlugInCore *)self version];
        uint64_t v17 = [v7 localizedDescription];
        *(_DWORD *)buf = 138544386;
        uint64_t v20 = v14;
        __int16 v21 = 2112;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        v26 = v5;
        __int16 v27 = 2112;
        uid_t v28 = v17;
        _os_log_error_impl(&dword_1B38B0000, v8, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] failed to find protocol for [%@]: %@", buf, 0x34u);
      }
      id v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      id v11 = [v7 localizedDescription];
      [v9 raise:v10, @"unable to start plug-in: %@", v11 format];
    }
  }
  else
  {
    int v12 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1B38D47B8(self);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"missing protocol specification in Info.plist"];
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)hostHasControl
{
  id v3 = [(PKServicePersonality *)self service];
  [v3 beganUsingServicePersonality:self];
}

- (id)defaultPrincipalObject
{
  id v3 = [(PKPlugInCore *)self principalSpec];
  id v4 = v3;
  if (!v3)
  {
    id v7 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4864(self);
    }
    goto LABEL_10;
  }
  Class = objc_getClass((const char *)[v3 UTF8String]);
  if (!Class)
  {
    id v7 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4910();
    }
LABEL_10:
    id v6 = 0;
    goto LABEL_11;
  }
  id v6 = objc_alloc_init(Class);
  if (v6) {
    goto LABEL_12;
  }
  id v7 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1B38D49B8();
  }
LABEL_11:

LABEL_12:
  return v6;
}

- (double)cleanExitTimeout
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(PKPlugInCore *)self isRBManaged]) {
    double v3 = -1.0;
  }
  else {
    double v3 = 15.0;
  }
  id v4 = [(PKPlugInCore *)self pluginKey:@"CleanTimeout"];
  id v5 = pklog_handle_for_category(7);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = [(PKPlugInCore *)self uuid];
      id v8 = [(PKPlugInCore *)self identifier];
      id v9 = [(PKPlugInCore *)self version];
      int v15 = 138544130;
      v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      double v22 = *(double *)&v4;
      _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] got CleanExit value:%@", (uint8_t *)&v15, 0x2Au);
    }
    [v4 doubleValue];
    double v3 = v10;
  }
  else
  {
    if (v6)
    {
      id v11 = [(PKPlugInCore *)self uuid];
      int v12 = [(PKPlugInCore *)self identifier];
      id v13 = [(PKPlugInCore *)self version];
      int v15 = 138544130;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      double v22 = v3;
      _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] setting delta:%g", (uint8_t *)&v15, 0x2Au);
    }
  }

  return v3;
}

- (void)shutdownPlugIn
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKServicePersonality *)self service];
  int v4 = [v3 unregisterPersonality:self];

  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(PKServicePersonality *)self service];
    BOOL v6 = [v5 subsystems];

    unint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        if (v7 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v7;
        }
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v11 endUsing:self];
          }
          ++v9;
        }
        while (v10 != v9);
        unint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [(PKServicePersonality *)self setPlugInPrincipal:0];
    [(PKServicePersonality *)self setEmbeddedPrincipal:0];
    [(PKServicePersonality *)self setHostPrincipal:0];
  }
}

- (void)prefsObjectForKey:(id)a3 inPlugIn:(id)a4 result:(id)a5
{
  unint64_t v7 = (void (**)(id, id))a5;
  id v8 = a3;
  uint64_t v9 = [(PKServicePersonality *)self preferences];
  id v10 = [v9 objectForKey:v8];

  v7[2](v7, v10);
}

- (void)prefsSetObject:(id)a3 forKey:(id)a4 inPlugIn:(id)a5 result:(id)a6
{
  long long v12 = (void (**)(void))a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKServicePersonality *)self preferences];
  [v11 setObject:v10 forKey:v9];

  v12[2]();
}

- (NSString)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKServicePersonality;
  int v4 = [(PKPlugInCore *)&v8 description];
  id v5 = [(PKServicePersonality *)self connection];
  objc_msgSend(v3, "stringWithFormat:", @"<PKServicePersonality: %p; core = %@, host pid = %d>",
    self,
    v4,
  BOOL v6 = [v5 processIdentifier]);

  return (NSString *)v6;
}

- (id)plugInPrincipal
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setPlugInPrincipal:(id)a3
{
}

- (id)hostPrincipal
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setHostPrincipal:(id)a3
{
}

- (id)embeddedPrincipal
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setEmbeddedPrincipal:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSUserDefaults)preferences
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPreferences:(id)a3
{
}

- (PKService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_embeddedPrincipal, 0);
  objc_storeStrong(&self->_hostPrincipal, 0);
  objc_storeStrong(&self->_plugInPrincipal, 0);
}

@end