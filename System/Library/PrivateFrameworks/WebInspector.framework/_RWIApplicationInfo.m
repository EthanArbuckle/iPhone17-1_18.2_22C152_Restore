@interface _RWIApplicationInfo
+ (id)identifierForPID:(int)a3;
- (BOOL)hasRemoteDebugSession;
- (BOOL)hasUpdatedFromListing;
- (BOOL)isProxy;
- (BOOL)updateFromListing:(id)a3;
- (NSString)bundleId;
- (NSString)debuggerConnectionIdentifier;
- (NSString)identifier;
- (NSString)name;
- (_RWIApplicationInfo)initWithPID:(int)a3 bundleId:(id)a4 name:(id)a5 isProxy:(BOOL)a6 connection:(id)a7 debuggerAvailability:(unint64_t)a8;
- (_RWIRelayConnectionToApplication)connection;
- (id)dictionaryRepresentation;
- (int)hostApplicationPID;
- (int)pid;
- (int64_t)automationAvailability;
- (unint64_t)debuggerAvailability;
- (void)setBundleId:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDebuggerAvailability:(unint64_t)a3;
- (void)setDebuggerConnectionIdentifier:(id)a3;
- (void)setHostApplicationPID:(int)a3;
- (void)setName:(id)a3;
- (void)setProxy:(BOOL)a3;
@end

@implementation _RWIApplicationInfo

+ (id)identifierForPID:(int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"PID:%lu", a3);
}

- (_RWIApplicationInfo)initWithPID:(int)a3 bundleId:(id)a4 name:(id)a5 isProxy:(BOOL)a6 connection:(id)a7 debuggerAvailability:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a5;
  v16 = (_RWIRelayConnectionToApplication *)a7;
  v25.receiver = self;
  v25.super_class = (Class)_RWIApplicationInfo;
  v17 = [(_RWIApplicationInfo *)&v25 init];
  v18 = v17;
  if (v17)
  {
    v17->_pid = a3;
    uint64_t v19 = [v14 copy];
    bundleId = v18->_bundleId;
    v18->_bundleId = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    name = v18->_name;
    v18->_name = (NSString *)v21;

    v18->_proxy = a6;
    v18->_connection = v16;
    v18->_debuggerAvailability = a8;
    v18->_automationAvailability = 2;
    *(_WORD *)&v18->_hasRemoteDebugSession = 0;
    v18->_hostApplicationPID = 0;
    v23 = v18;
  }

  return v18;
}

- (NSString)identifier
{
  return (NSString *)+[_RWIApplicationInfo identifierForPID:self->_pid];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(_RWIApplicationInfo *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"WIRApplicationIdentifierKey"];

  v5 = [(_RWIApplicationInfo *)self name];
  [v3 setObject:v5 forKeyedSubscript:@"WIRApplicationNameKey"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_debuggerAvailability];
  [v3 setObject:v6 forKeyedSubscript:@"WIRIsApplicationActiveKey"];

  uint64_t v7 = [(_RWIApplicationInfo *)self bundleId];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_26DB29208;
  }
  [v3 setObject:v9 forKeyedSubscript:@"WIRApplicationBundleIdentifierKey"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_RWIApplicationInfo isProxy](self, "isProxy"));
  [v3 setObject:v10 forKeyedSubscript:@"WIRIsApplicationProxyKey"];

  v11 = RWINSStringFromAutomationAvailability([(_RWIApplicationInfo *)self automationAvailability]);
  [v3 setObject:v11 forKeyedSubscript:@"WIRAutomationAvailabilityKey"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_RWIApplicationInfo hasUpdatedFromListing](self, "hasUpdatedFromListing"));
  [v3 setObject:v12 forKeyedSubscript:@"WIRIsApplicationReadyKey"];

  if (self->_hostApplicationPID)
  {
    v13 = +[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:");
    [v3 setObject:v13 forKeyedSubscript:@"WIRHostApplicationIdentifierKey"];
  }
  id v14 = [(_RWIApplicationInfo *)self bundleId];
  id v15 = protocolIconDataForBundleIdentifier(v14);

  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"WIRApplicationIconKey"];
  }

  return v3;
}

- (BOOL)updateFromListing:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"WIRListingKey"];
  v6 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = objc_opt_class();
    logUnexpectedType(v22, v6);

    BOOL v23 = 0;
    goto LABEL_50;
  }

  id v7 = [v4 objectForKeyedSubscript:@"WIRAutomationAvailabilityKey"];
  v8 = objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = objc_opt_class();
    logUnexpectedType(v24, v8);

    BOOL v23 = 0;
    goto LABEL_49;
  }
  v41 = self;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v10)
  {

    v20 = self;
    p_hasRemoteDebugSession = &self->_hasRemoteDebugSession;
    if (v41->_hasRemoteDebugSession)
    {
LABEL_19:
      id v9 = 0;
      BOOL *p_hasRemoteDebugSession = 0;
      int v25 = 1;
    }
    else
    {
      int v25 = 0;
      id v9 = 0;
    }
    goto LABEL_32;
  }
  uint64_t v11 = v10;
  id v39 = v7;
  id v40 = v4;
  uint64_t v12 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(id *)(*((void *)&v42 + 1) + 8 * i);
      objc_opt_class();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = objc_opt_class();
        logUnexpectedType(v26, v15);
LABEL_22:

        goto LABEL_23;
      }

      id v15 = [v9 objectForKey:v14];
      v16 = objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = objc_opt_class();
        logUnexpectedType(v27, v16);

        id v14 = v15;
        goto LABEL_22;
      }

      id v17 = [v15 objectForKey:@"WIRConnectionIdentifierKey"];
      v18 = objc_opt_class();
      uint64_t v19 = v18;
      if (v17)
      {
        if (objc_opt_isKindOfClass())
        {

          v20 = v41;
          p_hasRemoteDebugSession = &v41->_hasRemoteDebugSession;
          int v25 = 1;
          if (v41->_hasRemoteDebugSession)
          {
            id v9 = v17;
          }
          else
          {
            BOOL *p_hasRemoteDebugSession = 1;
            id v9 = v17;
            int v25 = 0;
          }
          id v4 = v40;
          goto LABEL_31;
        }
        v28 = objc_opt_class();
        logUnexpectedType(v28, v19);

LABEL_23:
        BOOL v23 = 0;
        id v4 = v40;
        id v7 = v39;
        goto LABEL_48;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  v20 = v41;
  p_hasRemoteDebugSession = &v41->_hasRemoteDebugSession;
  if (v41->_hasRemoteDebugSession)
  {
    id v4 = v40;
    id v7 = v39;
    goto LABEL_19;
  }
  int v25 = 0;
  id v9 = 0;
  id v4 = v40;
LABEL_31:
  id v7 = v39;
LABEL_32:
  uint64_t v29 = objc_msgSend(v9, "copy", v39);
  debuggerConnectionIdentifier = v20->_debuggerConnectionIdentifier;
  v20->_debuggerConnectionIdentifier = (NSString *)v29;

  int64_t automationAvailability = v20->_automationAvailability;
  int hasUpdatedFromListing = v20->_hasUpdatedFromListing;
  int v33 = 1;
  v20->_int hasUpdatedFromListing = 1;
  if (v7)
  {
    if (RWIAutomationAvailabilityFromString(v7, &v20->_automationAvailability))
    {
      int v33 = v20->_hasUpdatedFromListing;
      int64_t v34 = v20->_automationAvailability;
      goto LABEL_36;
    }
    v37 = RWIDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[_RWIApplicationInfo updateFromListing:]((uint64_t)v7, v37);
    }

    BOOL v23 = 0;
  }
  else
  {
    int64_t v34 = automationAvailability;
LABEL_36:
    BOOL v23 = hasUpdatedFromListing != v33 || v25 != *p_hasRemoteDebugSession || automationAvailability != v34;
  }
LABEL_48:

LABEL_49:
LABEL_50:

  return v23;
}

- (void)setHostApplicationPID:(int)a3
{
  self->_hostApplicationPID = a3;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isProxy
{
  return self->_proxy;
}

- (void)setProxy:(BOOL)a3
{
  self->_proxy = a3;
}

- (_RWIRelayConnectionToApplication)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (_RWIRelayConnectionToApplication *)a3;
}

- (NSString)debuggerConnectionIdentifier
{
  return self->_debuggerConnectionIdentifier;
}

- (void)setDebuggerConnectionIdentifier:(id)a3
{
}

- (unint64_t)debuggerAvailability
{
  return self->_debuggerAvailability;
}

- (void)setDebuggerAvailability:(unint64_t)a3
{
  self->_debuggerAvailability = a3;
}

- (int64_t)automationAvailability
{
  return self->_automationAvailability;
}

- (BOOL)hasRemoteDebugSession
{
  return self->_hasRemoteDebugSession;
}

- (BOOL)hasUpdatedFromListing
{
  return self->_hasUpdatedFromListing;
}

- (int)hostApplicationPID
{
  return self->_hostApplicationPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggerConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)updateFromListing:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226FA0000, a2, OS_LOG_TYPE_ERROR, "Could not parse value for WIRAutomationAvailabilityKey: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end