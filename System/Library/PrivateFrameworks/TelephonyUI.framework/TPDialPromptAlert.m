@interface TPDialPromptAlert
- (BOOL)isFaceTimeRequest;
- (BSProcessHandle)processHandle;
- (NSSet)handles;
- (NSString)buttonTitle;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (TPDialPromptAlert)initWithButtonTitle:(id)a3 handles:(id)a4 isFaceTimeRequest:(BOOL)a5 dialAction:(id)a6;
- (TPDialPromptAlert)initWithDialRequest:(id)a3 dialAction:(id)a4;
- (TPDialPromptAlert)initWithJoinRequest:(id)a3 dialAction:(id)a4;
- (id)dialAction;
- (id)otherButtonTitle;
- (id)phoneNumberHandle;
- (id)title;
- (void)dealloc;
- (void)defaultResponse;
- (void)invalidate;
- (void)otherResponse;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDialAction:(id)a3;
- (void)setIsFaceTimeRequest:(BOOL)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)show;
@end

@implementation TPDialPromptAlert

- (TPDialPromptAlert)initWithDialRequest:(id)a3 dialAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = TelephonyUIBundle();
  v9 = [v8 localizedStringForKey:@"CALL" value:&stru_1F1E807C8 table:@"General"];

  v10 = [v6 provider];
  if ([v10 isFaceTimeProvider]) {
    uint64_t v11 = [v6 isVideo];
  }
  else {
    uint64_t v11 = 0;
  }

  v12 = [v6 handle];
  if (!v12) {
    goto LABEL_8;
  }
  v13 = v12;
  if ([v12 type] != 2
    || (TUDialAssistedDialRequest(),
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 handle],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v13,
        v14,
        (v13 = (void *)v15) != 0))
  {
    v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  }
  else
  {
LABEL_8:
    v16 = [MEMORY[0x1E4F1CAD0] set];
  }
  v17 = [v6 processHandle];
  processHandle = self->_processHandle;
  self->_processHandle = v17;

  v19 = [(TPDialPromptAlert *)self initWithButtonTitle:v9 handles:v16 isFaceTimeRequest:v11 dialAction:v7];
  return v19;
}

- (TPDialPromptAlert)initWithJoinRequest:(id)a3 dialAction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [v6 remoteMembers];
  v10 = objc_msgSend(v8, "setWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = objc_msgSend(v6, "remoteMembers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v22 + 1) + 8 * v15) handles];
        v17 = [v16 anyObject];
        [v10 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  v18 = TelephonyUIBundle();
  v19 = [v18 localizedStringForKey:@"CALL" value:&stru_1F1E807C8 table:@"General"];
  v20 = [(TPDialPromptAlert *)self initWithButtonTitle:v19 handles:v10 isFaceTimeRequest:1 dialAction:v7];

  return v20;
}

- (TPDialPromptAlert)initWithButtonTitle:(id)a3 handles:(id)a4 isFaceTimeRequest:(BOOL)a5 dialAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)TPDialPromptAlert;
  uint64_t v13 = [(TPDialPromptAlert *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    buttonTitle = v13->_buttonTitle;
    v13->_buttonTitle = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    handles = v13->_handles;
    v13->_handles = (NSSet *)v16;

    v18 = _Block_copy(v12);
    id dialAction = v13->_dialAction;
    v13->_id dialAction = v18;

    v13->_isFaceTimeRequest = a5;
  }

  return v13;
}

- (void)dealloc
{
  v3 = [(TPDialPromptAlert *)self remoteAlertHandle];
  [v3 unregisterObserver:self];

  v4 = [(TPDialPromptAlert *)self remoteAlertHandle];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)TPDialPromptAlert;
  [(TPAlert *)&v5 dealloc];
}

- (id)title
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(TPDialPromptAlert *)self handles];
  objc_super v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [(TPDialPromptAlert *)self handles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = [v11 type];
        if (v12 == 1 || v12 == 3)
        {
          id v14 = [v11 value];
        }
        else if (v12 == 2)
        {
          uint64_t v15 = [v11 value];
          uint64_t v16 = TUNetworkCountryCode();
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            TUHomeCountryCode();
            id v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v18;

          uint64_t v20 = PNCreateFormattedStringWithCountry();
          objc_super v21 = (void *)v20;
          if (v20) {
            long long v22 = (void *)v20;
          }
          else {
            long long v22 = v15;
          }
          id v14 = v22;
        }
        else
        {
          id v14 = 0;
        }
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  long long v23 = TelephonyUIBundle();
  long long v24 = [v23 localizedStringForKey:@"COMMA" value:&stru_1F1E807C8 table:@"General"];
  long long v25 = [v5 componentsJoinedByString:v24];

  return v25;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = TPDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1C2F24000, v3, OS_LOG_TYPE_DEFAULT, "invalidating alert: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)TPDialPromptAlert;
  [(TPAlert *)&v4 invalidate];
}

- (void)show
{
  v3 = [(TPDialPromptAlert *)self phoneNumberHandle];
  if (!v3 || !TUCurrentProcessHasEntitlement()) {
    goto LABEL_6;
  }
  objc_super v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v4 userInterfaceIdiom] == 1 || _MKBGetDeviceLockState() == 1)
  {

LABEL_6:
    v28.receiver = self;
    v28.super_class = (Class)TPDialPromptAlert;
    [(TPAlert *)&v28 show];
    goto LABEL_7;
  }
  int v5 = _MKBGetDeviceLockState();

  if (v5 == 2) {
    goto LABEL_6;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.BusinessChatViewService" viewControllerClassName:@"BCChatSuggestRemoteViewController"];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  uint64_t v9 = [v3 dictionaryRepresentation];
  [v8 setObject:v9 forSetting:1];

  id v10 = [(TPDialPromptAlert *)self title];
  [v8 setObject:v10 forSetting:2];

  id v11 = [(TPDialPromptAlert *)self defaultButtonTitle];
  [v8 setObject:v11 forSetting:3];

  uint64_t v12 = [(TPDialPromptAlert *)self otherButtonTitle];
  [v8 setObject:v12 forSetting:4];

  id v13 = objc_alloc(MEMORY[0x1E4F4F668]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __25__TPDialPromptAlert_show__block_invoke;
  v29[3] = &unk_1E647C1A8;
  v29[4] = self;
  id v14 = (void *)[v13 initWithInfo:v8 timeout:MEMORY[0x1E4F14428] forResponseOnQueue:v29 withHandler:0.0];
  uint64_t v15 = [(TPDialPromptAlert *)self remoteAlertHandle];

  if (v15)
  {
    uint64_t v16 = [(TPDialPromptAlert *)self remoteAlertHandle];
    [v16 unregisterObserver:self];

    v17 = [(TPDialPromptAlert *)self remoteAlertHandle];
    [v17 invalidate];
  }
  id v18 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v6 configurationContext:v7];
  [(TPDialPromptAlert *)self setRemoteAlertHandle:v18];

  v19 = [(TPDialPromptAlert *)self remoteAlertHandle];
  [v19 registerObserver:self];

  id v20 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  objc_super v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
  [v20 setActions:v21];

  long long v22 = [v3 dictionaryRepresentation];
  [v20 setUserInfo:v22];

  [v20 setReason:@"Confirmaiton Alert"];
  long long v23 = [(TPDialPromptAlert *)self processHandle];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4FA6BE0]);
    long long v25 = [(TPDialPromptAlert *)self processHandle];
    v26 = (void *)[v24 initWithTargetProcess:v25];
    [v20 setPresentationTarget:v26];
  }
  long long v27 = [(TPDialPromptAlert *)self remoteAlertHandle];
  [v27 activateWithContext:v20];

LABEL_7:
}

void __25__TPDialPromptAlert_show__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 info];
  id v6 = [v3 objectForSetting:10];

  int v4 = [v6 isEqualToString:@"Call"];
  int v5 = *(void **)(a1 + 32);
  if (v4) {
    [v5 defaultResponse];
  }
  else {
    [v5 otherResponse];
  }
}

- (id)otherButtonTitle
{
  v2 = TelephonyUIBundle();
  v3 = [v2 localizedStringForKey:@"CANCEL" value:&stru_1F1E807C8 table:@"General"];

  return v3;
}

- (void)defaultResponse
{
  v3 = [(TPDialPromptAlert *)self dialAction];

  if (v3)
  {
    int v4 = [(TPDialPromptAlert *)self dialAction];
    v4[2](v4, 1);
  }
}

- (void)otherResponse
{
  v3 = [(TPDialPromptAlert *)self dialAction];

  if (v3)
  {
    int v4 = [(TPDialPromptAlert *)self dialAction];
    v4[2](v4, 0);
  }
}

- (id)phoneNumberHandle
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TPDialPromptAlert *)self handles];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 type] == 2)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = TPDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C2F24000, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4 = TPDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2F24000, v4, OS_LOG_TYPE_DEFAULT, "Remote alert deactivated", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__TPDialPromptAlert_remoteAlertHandleDidDeactivate___block_invoke;
  block[3] = &unk_1E647C1D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__TPDialPromptAlert_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) otherResponse];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = TPDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1C2F24000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Remote alert invalidated with error %@", (uint8_t *)&v6, 0xCu);
  }
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (id)dialAction
{
  return self->_dialAction;
}

- (void)setDialAction:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSSet)handles
{
  return self->_handles;
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (BOOL)isFaceTimeRequest
{
  return self->_isFaceTimeRequest;
}

- (void)setIsFaceTimeRequest:(BOOL)a3
{
  self->_isFaceTimeRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_dialAction, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end