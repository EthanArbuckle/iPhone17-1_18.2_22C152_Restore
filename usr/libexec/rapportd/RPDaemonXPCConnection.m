@interface RPDaemonXPCConnection
- (BOOL)_entitledForLabel:(id)a3 error:(id *)a4;
- (NSMutableSet)assertions;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPDaemonXPCConnection)initWithDaemon:(id)a3 xpcConnection:(id)a4;
- (void)_invalidateAssertions;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4;
- (void)connectionInvalidated;
- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5;
- (void)diagnosticLogControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5;
- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4;
- (void)primaryAccountSignedInWithCompletion:(id)a3;
- (void)primaryAccountSignedOutWithCompletion:(id)a3;
- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3;
- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4;
- (void)serverCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7;
- (void)serverSetAutoMappingInternal:(BOOL)a3 completion:(id)a4;
- (void)setAssertions:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setXpcCnx:(id)a3;
@end

@implementation RPDaemonXPCConnection

- (RPDaemonXPCConnection)initWithDaemon:(id)a3 xpcConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPDaemonXPCConnection;
  v9 = [(RPDaemonXPCConnection *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100141340 <= 20 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }

  [(RPDaemonXPCConnection *)self _invalidateAssertions];
}

- (BOOL)_entitledForLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_entitledClient)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.Client"];
    unsigned int v9 = [v8 isEqual:&__kCFBooleanTrue];

    if (v9)
    {
      BOOL v7 = 1;
      self->_entitledClient = 1;
    }
    else
    {
      v10 = RPErrorF();
      if (dword_100141340 <= 60 && (dword_100141340 != -1 || _LogCategory_Initialize()))
      {
        [(NSXPCConnection *)self->_xpcCnx processIdentifier];
        LogPrintF();
      }
      if (a4) {
        *a4 = v10;
      }

      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = [(RPDaemonXPCConnection *)self _entitledForLabel:@"ActivateAssertion" error:0];
  v5 = v15;
  if (v4)
  {
    id v6 = v15;
    if (v6)
    {
      if ([(NSMutableSet *)self->_assertions containsObject:v6])
      {
        if (dword_100141340 > 30 || dword_100141340 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_23;
        }
      }
      else
      {
        assertions = self->_assertions;
        if (!assertions)
        {
          id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          unsigned int v9 = self->_assertions;
          self->_assertions = v8;

          assertions = self->_assertions;
        }
        [(NSMutableSet *)assertions addObject:v6];
        NSUInteger v10 = [(NSCountedSet *)self->_daemon->_assertions countForObject:v6];
        v11 = self->_daemon->_assertions;
        if (!v11)
        {
          v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
          daemon = self->_daemon;
          v14 = daemon->_assertions;
          daemon->_assertions = v12;

          v11 = self->_daemon->_assertions;
        }
        [(NSCountedSet *)v11 addObject:v6];
        if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        if (v10
          || ([v6 isEqual:@"com.apple.rapport.KeepAlive"] & 1) != 0
          || dword_100141340 > 30
          || dword_100141340 == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_23;
        }
      }
      LogPrintF();
    }
LABEL_23:

    v5 = v15;
  }
}

- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v13 = 0;
  unsigned __int8 v8 = [(RPDaemonXPCConnection *)self _entitledForLabel:@"AddOrUpdateIdentity" error:&v13];
  id v9 = v13;
  if (v8)
  {
    NSUInteger v10 = +[RPPeopleDaemon sharedPeopleDaemon];
    id v12 = v9;
    [v10 addOrUpdateIdentity:v6 error:&v12];
    id v11 = v12;

    id v9 = v11;
  }
  if (v7) {
    v7[2](v7, v9);
  }
}

- (void)_invalidateAssertions
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = self->_assertions;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        NSUInteger v9 = -[NSCountedSet countForObject:](self->_daemon->_assertions, "countForObject:", v8, v10, v11, v12);
        [(NSCountedSet *)self->_daemon->_assertions removeObject:v8];
        if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
        {
          NSUInteger v10 = v8;
          NSUInteger v11 = v9;
          uint64_t v12 = (v9 - 1);
          LogPrintF();
        }
        if (v9 == 1
          && ([v8 isEqual:@"com.apple.rapport.KeepAlive"] & 1) == 0
          && dword_100141340 <= 30
          && (dword_100141340 != -1 || _LogCategory_Initialize()))
        {
          NSUInteger v10 = v8;
          LogPrintF();
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_assertions removeAllObjects];
}

- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  NSUInteger v10 = (void (**)(id, void, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v22 = 0;
  [(RPDaemonXPCConnection *)self _entitledForLabel:@"DiagnosticCommand" error:&v22];
  id v11 = v22;
  if (v11)
  {
    if (v10) {
      v10[2](v10, 0, v11);
    }
    goto LABEL_19;
  }
  if (!v8)
  {
    if (!v10) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = self->_daemon->_subDaemons;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) diagnosticCommand:v8 params:v9])
        {

          goto LABEL_17;
        }
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (![(RPDaemon *)self->_daemon diagnosticCommand:v8 params:v9])
  {
    if (!v10) {
      goto LABEL_19;
    }
LABEL_21:
    v17 = RPErrorF();
    v10[2](v10, 0, v17);

    goto LABEL_19;
  }
LABEL_17:
  if (v10) {
    ((void (**)(id, void *, id))v10)[2](v10, &__NSDictionary0__struct, 0);
  }
LABEL_19:
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0;
  [(RPDaemonXPCConnection *)self _entitledForLabel:@"DiagnosticLogControl" error:&v10];
  id v8 = v10;
  if (!v8)
  {
    if (v6 && ([v6 UTF8String], LogControl()))
    {
      if (!v7) {
        goto LABEL_4;
      }
    }
    else
    {
      LogShow();
      if (!v7) {
        goto LABEL_4;
      }
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    id v9 = NSPrintF();
    v7[2](v7, v9);
  }
LABEL_4:
}

- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v13 = 0;
  [(RPDaemonXPCConnection *)self _entitledForLabel:@"DiagnosticShow" error:&v13];
  id v9 = v13;
  if (!v9)
  {
    if (v7 && [v7 rangeOfString:@"ident" options:9] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = +[RPIdentityDaemon sharedIdentityDaemon];
      id v10 = CUDescriptionWithLevel();

      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      if ([v7 isEqual:@"kc"]) {
        [(RPDaemon *)self->_daemon keychainStateString];
      }
      else {
      id v10 = CUDescriptionWithLevel();
      }
      if (!v8) {
        goto LABEL_15;
      }
    }
    if (v10)
    {
      v8[2](v8, v10);
    }
    else
    {
      uint64_t v12 = NSPrintF();
      v8[2](v8, v12);
    }
    goto LABEL_15;
  }
  if (v8)
  {
    id v10 = NSPrintF();
    v8[2](v8, v10);
LABEL_15:
  }
}

- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4
{
  __int16 v4 = a3;
  id v6 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v36 = 0;
  [(RPDaemonXPCConnection *)self _entitledForLabel:@"GetIdentities" error:&v36];
  id v7 = v36;
  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    if (v4)
    {
      id v9 = +[RPIdentityDaemon sharedIdentityDaemon];
      id v10 = [v9 identityOfSelfAndReturnError:0];

      if (v10) {
        [v8 addObject:v10];
      }

      if ((v4 & 2) == 0)
      {
LABEL_5:
        if ((v4 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_23;
      }
    }
    else if ((v4 & 2) == 0)
    {
      goto LABEL_5;
    }
    id v11 = +[RPIdentityDaemon sharedIdentityDaemon];
    uint64_t v12 = [v11 identitiesOfType:2 error:0];

    if (v12) {
      [v8 addObjectsFromArray:v12];
    }

    if ((v4 & 4) == 0)
    {
LABEL_6:
      if ((v4 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_26;
    }
LABEL_23:
    id v13 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v14 = [v13 identitiesOfType:3 error:0];

    if (v14) {
      [v8 addObjectsFromArray:v14];
    }

    if ((v4 & 8) == 0)
    {
LABEL_7:
      if ((v4 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
LABEL_26:
    uint64_t v15 = +[RPIdentityDaemon sharedIdentityDaemon];
    long long v16 = [v15 identitiesOfType:4 error:0];

    if (v16) {
      [v8 addObjectsFromArray:v16];
    }

    if ((v4 & 0x10) == 0)
    {
LABEL_8:
      if ((v4 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_32;
    }
LABEL_29:
    v17 = +[RPIdentityDaemon sharedIdentityDaemon];
    long long v18 = [v17 identitiesOfType:5 error:0];

    if (v18) {
      [v8 addObjectsFromArray:v18];
    }

    if ((v4 & 0x20) == 0)
    {
LABEL_9:
      if ((v4 & 0x100) == 0) {
        goto LABEL_10;
      }
      goto LABEL_35;
    }
LABEL_32:
    long long v19 = +[RPIdentityDaemon sharedIdentityDaemon];
    long long v20 = [v19 identitiesOfType:6 error:0];

    if (v20) {
      [v8 addObjectsFromArray:v20];
    }

    if ((v4 & 0x100) == 0)
    {
LABEL_10:
      if ((v4 & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_38;
    }
LABEL_35:
    long long v21 = +[RPIdentityDaemon sharedIdentityDaemon];
    id v22 = [v21 identitiesOfType:9 error:0];

    if (v22) {
      [v8 addObjectsFromArray:v22];
    }

    if ((v4 & 0x400) == 0)
    {
LABEL_11:
      if ((v4 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_44;
    }
LABEL_38:
    v23 = +[RPIdentityDaemon sharedIdentityDaemon];
    v24 = [v23 identitiesOfType:12 error:0];

    if (v24)
    {
      [v8 addObjectsFromArray:v24];
      if (dword_100141340 < 31 && (dword_100141340 != -1 || _LogCategory_Initialize()))
      {
        id v35 = [v24 count];
        LogPrintF();
      }
    }

    if ((v4 & 0x40) == 0)
    {
LABEL_12:
      if ((v4 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_47;
    }
LABEL_44:
    v25 = +[RPIdentityDaemon sharedIdentityDaemon];
    v26 = [v25 identitiesOfType:7 error:0];

    if (v26) {
      [v8 addObjectsFromArray:v26];
    }

    if ((v4 & 0x80) == 0)
    {
LABEL_13:
      if ((v4 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_50;
    }
LABEL_47:
    v27 = +[RPIdentityDaemon sharedIdentityDaemon];
    v28 = [v27 identitiesOfType:8 error:0];

    if (v28) {
      [v8 addObjectsFromArray:v28];
    }

    if ((v4 & 0x800) == 0)
    {
LABEL_14:
      if ((v4 & 0x2000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_53;
    }
LABEL_50:
    v29 = +[RPIdentityDaemon sharedIdentityDaemon];
    v30 = [v29 identitiesOfType:13 error:0];

    if (v30) {
      [v8 addObjectsFromArray:v30];
    }

    if ((v4 & 0x2000) == 0)
    {
LABEL_15:
      if ((v4 & 0x4000) == 0)
      {
LABEL_59:
        v6[2](v6, v8, 0);

        goto LABEL_60;
      }
LABEL_56:
      v33 = +[RPIdentityDaemon sharedIdentityDaemon];
      v34 = [v33 identitiesOfType:15 error:0];

      if (v34) {
        [v8 addObjectsFromArray:v34];
      }

      goto LABEL_59;
    }
LABEL_53:
    v31 = +[RPIdentityDaemon sharedIdentityDaemon];
    v32 = [v31 identityOfTemporarySelfAndReturnError:0];

    if (v32) {
      [v8 addObject:v32];
    }

    if ((v4 & 0x4000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_56;
  }
  ((void (**)(id, id, id))v6)[2](v6, 0, v7);
LABEL_60:
}

- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  __int16 v4 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.RegenerateIdentity"];
  unsigned __int8 v5 = [v4 isEqual:&__kCFBooleanTrue];

  if (v5)
  {
    id v6 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v6 regenerateTemporarySelfIdentity];

    v8[2](v8, 0);
  }
  else
  {
    id v7 = RPErrorF();
    if (dword_100141340 <= 60 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    ((void (**)(id, void *))v8)[2](v8, v7);
  }
}

- (void)primaryAccountSignedInWithCompletion:(id)a3
{
  id v9 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  __int16 v4 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.Client"];
  unsigned __int8 v5 = [v4 isEqual:&__kCFBooleanTrue];

  if (v5)
  {
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v7 = +[RPDaemon sharedDaemon];
    [v7 postDaemonInfoChanges:64];

    v9[2](v9, 0);
  }
  else
  {
    id v6 = RPErrorF();
    if (dword_100141340 <= 60 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    ((void (**)(id, void *))v9)[2](v9, v6);
  }
}

- (void)primaryAccountSignedOutWithCompletion:(id)a3
{
  __int16 v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned __int8 v5 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.Client"];
  unsigned __int8 v6 = [v5 isEqual:&__kCFBooleanTrue];

  if (v6)
  {
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    id v8 = objc_alloc_init((Class)CUKeychainItem);
    [v8 setAccessGroup:@"com.apple.rapport"];
    [v8 setSyncType:3];
    id v9 = objc_alloc_init((Class)CUKeychainManager);
    id v29 = 0;
    id v22 = v8;
    id v10 = [v9 copyItemsMatchingItem:v8 flags:10 error:&v29];
    id v11 = v29;
    if (v11 && dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    v23 = v4;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }

          id v24 = 0;
          unsigned int v18 = [v9 removeItemMatchingItem:v17 error:&v24];
          id v19 = v24;
          id v11 = v19;
          if (v18) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 0;
          }
          if (!v20 && dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v14);
    }

    long long v21 = +[RPDaemon sharedDaemon];
    [v21 postDaemonInfoChanges:16];

    __int16 v4 = v23;
    v23[2](v23, 0);
  }
  else
  {
    id v7 = RPErrorF();
    if (dword_100141340 <= 60 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    v4[2](v4, v7);
  }
}

- (void)serverCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v25 = 0;
  unsigned __int8 v16 = [(RPDaemonXPCConnection *)self _entitledForLabel:@"createDeviceMapping" error:&v25];
  id v17 = v25;
  if (v16)
  {
    unsigned int v18 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
    id v19 = [v18 findDeviceFromID:v13];

    if (v19)
    {
      switch(a3)
      {
        case 2:
          +[RPNWListener queryDeviceToApplicationServiceMapping:v12 device:v19 completion:v15];
          break;
        case 1:
          id v23 = +[RPNWListener addDeviceToApplicationServiceMapping:v12 device:v19 completion:v15];
          break;
        case 0:
          if (!+[RPNWEndpoint addEndpointMapping:v19 endpointID:v14 applicationService:v12 discoverySessionID:0 shouldAutomapListener:0])
          {
            uint64_t v20 = RPErrorF();

            id v17 = (id)v20;
          }
          if (v15)
          {
            long long v21 = +[RPNWNetworkAgent sharedNetworkAgent];
            id v22 = [v21 networkAgentID];
            v15[2](v15, v22, v17);
          }
          break;
        default:
          goto LABEL_20;
      }
LABEL_21:

      goto LABEL_22;
    }
    if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!v15) {
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v24 = RPErrorF();

    v15[2](v15, 0, (id)v24);
    id v17 = (id)v24;
    goto LABEL_21;
  }
  if (v15) {
    v15[2](v15, 0, v17);
  }
LABEL_22:
}

- (void)serverSetAutoMappingInternal:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  +[RPNWListener setAutoMapping:v4];
  unsigned __int8 v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    unsigned __int8 v5 = v6;
  }
}

- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0;
  [(RPDaemonXPCConnection *)self _entitledForLabel:@"removeSessionPairedIdentity" error:&v10];
  id v8 = v10;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }
  else
  {
    id v9 = +[RPIdentityDaemon sharedIdentityDaemon];
    [v9 removeSessionPairedIdentityWithIdentifier:v6];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end