@interface MRCriticalSectionCoordinator
+ (id)enterCriticalSection;
+ (void)enterCriticalSection;
+ (void)exitCriticalSection:(id)a3;
+ (void)exitCriticalSectionUsingRequestID:(id)a3;
@end

@implementation MRCriticalSectionCoordinator

+ (id)enterCriticalSection
{
  v2 = +[MRUserSettings currentSettings];
  char v3 = [v2 supportCriticalSectionManagement];

  if (v3)
  {
    v4 = objc_alloc_init(MRCriticalSectionToken);
    v5 = MRCreateXPCMessage(0x10000000000001BuLL);
    xpc_dictionary_set_int64(v5, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY", 0);
    v6 = [(MRCriticalSectionToken *)v4 requestID];
    id v7 = [v6 UUIDString];
    xpc_dictionary_set_string(v5, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY", (const char *)[v7 UTF8String]);

    v8 = +[MRMediaRemoteServiceClient sharedServiceClient];
    v9 = [v8 service];
    v10 = [v9 mrXPCConnection];
    id v23 = 0;
    id v11 = (id)[v10 sendSyncMessage:v5 error:&v23];
    id v12 = v23;

    if (v12)
    {
      v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[MRCriticalSectionCoordinator enterCriticalSection];
      }

      v14 = 0;
    }
    else
    {
      v14 = v4;
    }
  }
  else
  {
    _MRLogForCategory(0);
    v4 = (MRCriticalSectionToken *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      +[MRCriticalSectionCoordinator enterCriticalSection];
    }
    v14 = 0;
  }

  return v14;
}

+ (void)exitCriticalSection:(id)a3
{
  id v3 = a3;
  v4 = +[MRUserSettings currentSettings];
  char v5 = [v4 supportCriticalSectionManagement];

  if (v5)
  {
    [v3 setInvalidated:1];
    v6 = [v3 requestID];
    id v7 = (void *)[v6 copy];

    +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:v7];
  }
  else
  {
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MRCriticalSectionCoordinator enterCriticalSection];
    }
  }
}

+ (void)exitCriticalSectionUsingRequestID:(id)a3
{
  id v3 = a3;
  v4 = +[MRUserSettings currentSettings];
  char v5 = [v4 supportCriticalSectionManagement];

  if ((v5 & 1) == 0)
  {
    v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MRCriticalSectionCoordinator enterCriticalSection];
    }
    goto LABEL_10;
  }
  if (v3)
  {
    v6 = MRCreateXPCMessage(0x10000000000001BuLL);
    xpc_dictionary_set_int64(v6, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY", 1);
    id v7 = [v3 UUIDString];
    xpc_dictionary_set_string(v6, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY", (const char *)[v7 UTF8String]);

    v8 = +[MRMediaRemoteServiceClient sharedServiceClient];
    uint64_t v9 = [v8 service];
    uint64_t v10 = [v9 mrXPCConnection];
    id v21 = 0;
    id v11 = (id)[v10 sendSyncMessage:v6 error:&v21];
    id v12 = v21;

    if (v12)
    {
      uint64_t v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:v13];
      }
    }
LABEL_10:
  }
}

+ (void)enterCriticalSection
{
}

+ (void)exitCriticalSectionUsingRequestID:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = [a1 UUIDString];
  v6 = [a2 localizedDescription];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "failed to exit critical section for requestID: %@. error: %@", (uint8_t *)&v7, 0x16u);
}

@end