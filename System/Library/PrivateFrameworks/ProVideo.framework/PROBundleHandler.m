@interface PROBundleHandler
- (BOOL)_plugInHasReservedUUID:(id)a3;
- (BOOL)dynamicPluginRequestedProtocolArray:(id *)a3 groupArray:(id *)a4 plugInArray:(id *)a5 actuallyLoad:(BOOL)a6;
- (BOOL)isDeferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBundleHandler:(id)a3;
- (BOOL)isPrincipalClassAvailable;
- (BOOL)loadingInProMSRendererTool;
- (BOOL)plugInShouldLoadPlugInInstanceForTheFirstTime:(id)a3;
- (BOOL)shouldDeferLoading;
- (PROBundleHandler)initWithBundle:(id)a3;
- (PROBundleHandler)initWithBundle:(id)a3 actuallyLoad:(BOOL)a4;
- (id)apiForProtocol:(id)a3;
- (id)apiManager;
- (id)apiManagerForPlugInInstances;
- (id)delegate;
- (id)getBundle;
- (id)groupsDictionary;
- (id)plugInGroupWithUUID:(__CFUUID *)a3;
- (id)plugIns;
- (id)principalClassInstance;
- (void)addPlugIn:(id)a3;
- (void)completeRegistrationWithGroups:(id *)a3 plugIns:(id *)a4 requestedProtocols:(id *)a5;
- (void)dealloc;
- (void)finishRegisteringPlugIns:(BOOL)a3;
- (void)loadDeferredPlugins;
- (void)notifyDeferralComplete;
- (void)plugIn:(id)a3 didError:(id)a4;
- (void)plugInFirewall:(id)a3 receivedBadMessage:(SEL)a4;
- (void)registerAndLoadPlugIns:(BOOL)a3;
- (void)registerDynamicPlugInsAsynch:(id)a3;
- (void)registerPlugIns;
- (void)reportError:(id)a3;
- (void)setAPIManager:(id)a3;
- (void)setDeferralNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRegistrationCallbackObject:(id)a3;
@end

@implementation PROBundleHandler

- (PROBundleHandler)initWithBundle:(id)a3
{
  return [(PROBundleHandler *)self initWithBundle:a3 actuallyLoad:1];
}

- (PROBundleHandler)initWithBundle:(id)a3 actuallyLoad:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PROBundleHandler;
  v6 = [(PROBundleHandler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(PROBundleHandler *)v6 zone];
    v7->bundle = (NSBundle *)a3;
    v7->plugIns = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", v8), "init");
    v7->groups = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", v8), "init");
    v7->deferralCompletionBlock = 0;
    v7->deferred = 0;
    if (v4) {
      int v9 = 4;
    }
    else {
      int v9 = 0;
    }
    v7->bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&v7->bundleFlags & 0xFFFFFFFB | v9);
    v7->apiAccessPoint = [[PROPlugInFirewall alloc] initWithProtectedObject:v7 protocol:&unk_1F1217D08 secondaryProtocol:0 errorHandler:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PROBundleHandler;
  [(PROBundleHandler *)&v3 dealloc];
}

- (id)getBundle
{
  return self->bundle;
}

- (void)reportError:(id)a3
{
}

- (BOOL)isEqualToBundleHandler:(id)a3
{
  return self->bundle == (NSBundle *)*((void *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(PROBundleHandler *)self isEqualToBundleHandler:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return self->bundle == a3;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)PROBundleHandler;
      return [(PROBundleHandler *)&v6 isEqual:a3];
    }
  }
}

- (id)groupsDictionary
{
  return self->groups;
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (PROBundleHandlerDelegate *)a3;
}

- (id)apiManager
{
  return self->apiManager;
}

- (void)setAPIManager:(id)a3
{
  self->apiManager = (PROVersionedAPIAccess *)a3;
}

- (id)plugIns
{
  return self->plugIns;
}

- (BOOL)isPrincipalClassAvailable
{
  objc_super v3 = [(NSBundle *)self->bundle infoDictionary];
  if (!v3
    || (id v4 = [(NSDictionary *)v3 objectForKey:@"PlugInKit"]) == 0
    || (uint64_t v5 = [v4 objectForKey:@"EmbeddedCode"]) != 0)
  {
    [(NSBundle *)self->bundle principalClass];
    LOBYTE(v5) = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

- (id)principalClassInstance
{
  id result = self->principalClassInstance;
  if (result) {
    return result;
  }
  id v4 = [(NSBundle *)self->bundle principalClass];
  if (!v4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Bundle has no principal class specified.", &stru_1F119C770, @"PROPlug"), *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", 0);
    int v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -502;
LABEL_12:
    -[PROBundleHandler reportError:](self, "reportError:", [v9 errorWithDomain:@"PROPlug" code:v10 userInfo:v8]);

    return 0;
  }
  uint64_t v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = @"Bundle principal class does not responds to +sharedInstance!";
LABEL_11:
    uint64_t v14 = [v12 localizedStringForKey:v13 value:&stru_1F119C770 table:@"PROPlug"];
    uint64_t v8 = objc_msgSend(v11, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", 0);
    int v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -503;
    goto LABEL_12;
  }
  objc_super v6 = [(objc_class *)v5 sharedInstance];
  self->principalClassInstance = v6;
  if (!v6)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = @"Failed creating an instance of bundle's principal class.";
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    [(PROPlugInRegistering *)self->principalClassInstance setAPIManager:self->apiAccessPoint];
  }
  return self->principalClassInstance;
}

- (id)apiManagerForPlugInInstances
{
  return self->apiAccessPoint;
}

- (void)setRegistrationCallbackObject:(id)a3
{
  self->setupCallbackObject = (PROPluginDynamicRegCompletion *)a3;
}

- (BOOL)_plugInHasReservedUUID:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"7D976C6A-7F8E-11D9-AF6C-000A95DF1816", @"4894A645-622C-4EAF-B886-8481FC54A9C9", @"AD8AC810-D658-4444-94A6-B7C29767A90C", 0);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "infoDictionary"), "objectForKey:", @"uuid");
  if (v5)
  {
    LOBYTE(v5) = [v4 containsObject:v5];
  }
  return v5;
}

- (void)addPlugIn:(id)a3
{
  delegate = self->delegate;
  if (!delegate
    || [(PROBundleHandlerDelegate *)delegate bundleHandler:self shouldAddPlugIn:a3])
  {
    objc_msgSend((id)-[PROBundleHandler mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns"), "addObject:", a3);
    objc_super v6 = self->delegate;
    [(PROBundleHandlerDelegate *)v6 bundleHandler:self didAddPlugIn:a3];
  }
}

- (void)registerDynamicPlugInsAsynch:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:a3];
  objc_msgSend(v4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1F122C3B8));
  [v4 resume];
  uint64_t v5 = (void *)[v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_71];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  uint64_t v19 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__16;
  v12 = __Block_byref_object_dispose__16;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke_104;
  v7[3] = &unk_1E616DC98;
  v7[4] = &v14;
  v7[5] = &v8;
  [v5 dynamicRegGroupsAndPlugIns:v7];
  uint64_t v6 = 0;
  [(PROBundleHandler *)self completeRegistrationWithGroups:v15 + 5 plugIns:v9 + 5 requestedProtocols:&v6];

  [(PROPluginDynamicRegCompletion *)self->setupCallbackObject finishPluginSetupForBundle:self->bundle handler:self];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
}

void __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke(uint64_t a1, uint64_t a2)
{
}

id __49__PROBundleHandler_registerDynamicPlugInsAsynch___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)dynamicPluginRequestedProtocolArray:(id *)a3 groupArray:(id *)a4 plugInArray:(id *)a5 actuallyLoad:(BOOL)a6
{
  if (!a6) {
    return 1;
  }
  id v10 = [(PROBundleHandler *)self principalClassInstance];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = 0;
    *a3 = (id)[v10 requestedProtocolsWithError:&v17];
    if (v17)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = @"Bundle failed dynamically registering requested protocols";
LABEL_12:
      uint64_t v15 = [v12 localizedStringForKey:v13 value:&stru_1F119C770 table:@"PROPlug"];
      uint64_t v16 = objc_msgSend(v11, "initWithObjectsAndKeys:", v15, *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", v17, *MEMORY[0x1E4F28A50], 0);
      -[PROBundleHandler reportError:](self, "reportError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"PROPlug" code:-505 userInfo:v16]);

      return 0;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = 0;
    *a4 = (id)[v10 registeredPlugInGroupsWithError:&v17];
    if (v17)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = @"Bundle failed dynamically registering plug-in groups";
      goto LABEL_12;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = 0;
    *a5 = (id)[v10 registeredPlugInsWithError:&v17];
    if (v17)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v12 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = @"Bundle failed dynamically registering plug-ins";
      goto LABEL_12;
    }
  }
  return 1;
}

- (void)completeRegistrationWithGroups:(id *)a3 plugIns:(id *)a4 requestedProtocols:(id *)a5
{
  if (!*a4) {
    *a4 = [(NSBundle *)self->bundle objectForInfoDictionaryKey:@"ProPlugPlugInList"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = @"Bundle's plug-in list should be an array, alas it is not.";
LABEL_51:
    uint64_t v36 = [v21 localizedStringForKey:v22 value:&stru_1F119C770 table:@"PROPlug"];
    id v39 = (id)objc_msgSend(v20, "initWithObjectsAndKeys:", v36, *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", 0);
    -[PROBundleHandler reportError:](self, "reportError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"PROPlug" code:-502 userInfo:v39]);

    return;
  }
  if (!*a3) {
    *a3 = [(NSBundle *)self->bundle objectForInfoDictionaryKey:@"ProPlugPlugInGroupList"];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = *a3;
  if (isKindOfClass)
  {
    id v11 = (void *)[v10 objectEnumerator];
    uint64_t v38 = [(PROBundleHandler *)self zone];
    uint64_t v12 = [v11 nextObject];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_17;
        }
        uint64_t v15 = [v13 objectForKey:@"groupName"];
        CFStringRef v16 = (const __CFString *)[v13 objectForKey:@"uuid"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_17;
        }
        CFUUIDRef v17 = CFUUIDCreateFromString(v14, v16);
        CFUUIDRef v18 = v17;
        if (v17)
        {
          if (v15) {
            break;
          }
        }
        if (v17) {
          goto LABEL_16;
        }
LABEL_17:
        uint64_t v13 = (void *)[v11 nextObject];
        if (!v13) {
          goto LABEL_22;
        }
      }
      if (!-[NSMutableDictionary objectForKey:](self->groups, "objectForKey:", [MEMORY[0x1E4F29238] valueWithPointer:v17]))
      {
        uint64_t v19 = [+[PROPlugInGroup allocWithZone:v38] initWithUUID:v18 name:v15 bundle:self->bundle];
        -[NSMutableDictionary setObject:forKey:](self->groups, "setObject:forKey:", v19, [MEMORY[0x1E4F29238] valueWithPointer:v18]);
      }
LABEL_16:
      CFRelease(v18);
      goto LABEL_17;
    }
    goto LABEL_22;
  }
  if (v10)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = @"Bundle's plug-in group list should be an array, alas it is not.";
    goto LABEL_51;
  }
LABEL_22:
  if (!*a5) {
    *a5 = [(NSBundle *)self->bundle objectForInfoDictionaryKey:@"ProPlugProtocolList"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = (void *)[*a5 objectEnumerator];
    while (1)
    {
      uint64_t v24 = [v23 nextObject];
      if (!v24) {
        break;
      }
      v25 = (void *)v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v22 = @"Bundle's protocol list should contain dictionaries.";
        goto LABEL_51;
      }
      [v25 objectForKey:@"protocolName"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v22 = @"Bundle's protocol list dictionaries need protocols names inside.";
        goto LABEL_51;
      }
      v26 = (void *)[v25 objectForKey:@"versions"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v22 = @"Bundle's protocol list dictionaries need a version number array.";
        goto LABEL_51;
      }
      v27 = (void *)[v26 objectEnumerator];
      while ([v27 nextObject])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v22 = @"Bundle's protocol list dictionaries need a version number list with numbers inside.";
          goto LABEL_51;
        }
      }

      v28 = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", -[PROBundleHandler zone](self, "zone")), "initWithArray:copyItems:", *a5, 1);
      self->requestedProtocols = v28;
      if (([(PROVersionedAPIAccess *)self->apiManager validateProtocols:v28] & 1) == 0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        v21 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v22 = @"Bundle requests protocol that isn't available.";
        goto LABEL_51;
      }
    }
  }
  v29 = (void *)[*a4 objectEnumerator];
  uint64_t v30 = [(PROBundleHandler *)self zone];
  uint64_t v31 = [v29 nextObject];
  if (v31)
  {
    uint64_t v32 = v31;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = [+[PROPlugIn allocWithZone:v30] initWithDictionary:v32 bundle:self->bundle delegate:self pluginKitPlug:0];
        if (v33)
        {
          v34 = (void *)[(PROBundleHandler *)self mutableArrayValueForKey:@"plugIns"];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = *(void *)"";
          v40[2] = __78__PROBundleHandler_completeRegistrationWithGroups_plugIns_requestedProtocols___block_invoke;
          v40[3] = &unk_1E616DCD0;
          v40[4] = v33;
          uint64_t v35 = [v34 indexOfObjectPassingTest:v40];
          if ([(PROBundleHandler *)self _plugInHasReservedUUID:v33])
          {
            NSLog(&cfstr_TheUuidOfThePl.isa, [(PROPlugIn *)v33 displayName], v37);
          }
          else if (v35 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend((id)objc_msgSend(-[PROPlugIn infoDictionary](v33, "infoDictionary"), "objectForKey:", @"uuid"), "isEqualToString:", @"69B62B00-9245-4091-9FBC-B4FD82AA3385"))NSLog(&cfstr_BlockedPlugInU.isa, -[PROPlugIn uuid](v33, "uuid"), -[PROPlugIn displayName](v33, "displayName")); {
            else
            }
              [(PROBundleHandler *)self addPlugIn:v33];
          }
          else
          {
            NSLog(&cfstr_DuplicatePlugI.isa, [(PROPlugIn *)v33 uuid], [(PROPlugIn *)v33 displayName]);
          }
        }
      }
      uint64_t v32 = [v29 nextObject];
    }
    while (v32);
  }
}

BOOL __78__PROBundleHandler_completeRegistrationWithGroups_plugIns_requestedProtocols___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  return v3 == [a2 uuid];
}

- (BOOL)loadingInProMSRendererTool
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");

  return [v2 isEqualToString:@"com.apple.ProMSRendererTool"];
}

- (BOOL)shouldDeferLoading
{
  return 0;
}

- (void)loadDeferredPlugins
{
}

- (void)setDeferralNotification:(id)a3
{
  self->deferralCompletionBlock = a3;
}

- (void)notifyDeferralComplete
{
}

- (BOOL)isDeferred
{
  return self->deferred;
}

- (void)finishRegisteringPlugIns:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend((id)-[PROBundleHandler mutableArrayValueForKey:](self, "mutableArrayValueForKey:", @"plugIns"), "removeAllObjects");
  [(NSMutableDictionary *)self->groups removeAllObjects];
  id v5 = [(NSBundle *)self->bundle objectForInfoDictionaryKey:@"ProPlugDictionaryVersion"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v5 floatValue], v6 == 1.0))
  {
    uint64_t v11 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id v8 = [(NSBundle *)self->bundle objectForInfoDictionaryKey:@"ProPlugDynamicRegistration"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![v8 BOOLValue]
      || [(PROBundleHandler *)self dynamicPluginRequestedProtocolArray:&v9 groupArray:&v10 plugInArray:&v11 actuallyLoad:v3])
    {
      [(PROBundleHandler *)self completeRegistrationWithGroups:&v10 plugIns:&v11 requestedProtocols:&v9];
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"PROPlug", -502, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Bundle dictionary version is unsupported.", &stru_1F119C770, @"PROPlug"), *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", 0));
    [(PROBundleHandler *)self reportError:v7];
  }
}

- (void)registerPlugIns
{
}

- (void)registerAndLoadPlugIns:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PROBundleHandler *)self shouldDeferLoading])
  {
    [(PROBundleHandler *)self finishRegisteringPlugIns:v3];
  }
}

- (id)apiForProtocol:(id)a3
{
  id v11 = a3;
  Name = protocol_getName((Protocol *)a3);
  id v5 = [(NSArray *)self->requestedProtocols objectEnumerator];
  do
  {
    id v6 = [(NSEnumerator *)v5 nextObject];
    uint64_t v7 = v6;
  }
  while (v6
       && !objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"protocolName"), "isEqualToString:", Name));
  id result = (id)-[PROVersionedAPIAccess apiForProtocol:versions:](self->apiManager, "apiForProtocol:versions:", &v11, [v7 objectForKey:@"versions"]);
  if (result)
  {
    id v9 = result;
    uint64_t v10 = [PROPlugInFirewall alloc];
    return [(PROPlugInFirewall *)v10 initWithProtectedObject:v9 protocol:v11 secondaryProtocol:&unk_1F1216BE0 errorHandler:self];
  }
  return result;
}

- (void)plugInFirewall:(id)a3 receivedBadMessage:(SEL)a4
{
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  bundle = self->bundle;
  id v8 = NSStringFromSelector(a4);
  id v9 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", bundle, @"NSBundle", v8, @"Selector", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Plug-In instance sent bad message.", &stru_1F119C770, @"PROPlug"), *MEMORY[0x1E4F28568], 0);
  -[PROBundleHandler reportError:](self, "reportError:", [MEMORY[0x1E4F28C58] errorWithDomain:@"PROPlug" code:-603 userInfo:v9]);
}

- (void)plugIn:(id)a3 didError:(id)a4
{
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  groups = self->groups;
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];

  return (id)[(NSMutableDictionary *)groups objectForKey:v4];
}

- (BOOL)plugInShouldLoadPlugInInstanceForTheFirstTime:(id)a3
{
  $6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = self->bundleFlags;
  if ((*(unsigned char *)&bundleFlags & 4) != 0)
  {
    if ((*(unsigned char *)&bundleFlags & 2) == 0)
    {
      if (![(PROBundleHandler *)self isPrincipalClassAvailable])
      {
        *(_DWORD *)&self->bundleFlags |= 3u;
        LOBYTE(v4) = 1;
        return (char)v4;
      }
      id v4 = [(PROBundleHandler *)self principalClassInstance];
      if (!v4)
      {
        self->$6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags & 0xFFFFFFFC | 2);
        return (char)v4;
      }
      id v6 = v4;
      uint64_t v14 = 0;
      if (objc_opt_respondsToSelector())
      {
        int v7 = [v6 shouldLoadFirstInstanceOfPlugInWithError:&v14];
        uint64_t v8 = v14;
        $6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags & 0xFFFFFFFC | v7 | 2);
        self->$6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = bundleFlags;
        if (v8)
        {
          self->$6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&bundleFlags & 0xFFFFFFFE);
          id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Bundle failed dynamically registering plug-ins", &stru_1F119C770, @"PROPlug");
          id v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4F28568], self->bundle, @"NSBundle", v14, *MEMORY[0x1E4F28A50], 0);
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PROPlug" code:-505 userInfo:v11];
          [(PROBundleHandler *)self reportError:v12];

          $6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = self->bundleFlags;
        }
      }
      else
      {
        $6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = ($6F21F85482FEA2852DCE6121BD02F1B9)(*(_DWORD *)&self->bundleFlags | 3);
        self->$6F21F85482FEA2852DCE6121BD02F1B9 bundleFlags = bundleFlags;
      }
    }
    LOBYTE(v4) = *(unsigned char *)&bundleFlags & 1;
    return (char)v4;
  }
  LOBYTE(v4) = 0;
  return (char)v4;
}

@end