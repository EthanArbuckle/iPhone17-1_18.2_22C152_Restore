@interface ICDelegationServiceSecuritySettings
+ (void)getDeviceReceiverSettingsWithCompletion:(id)a3;
+ (void)getDeviceSenderSettingsForReceiverName:(id)a3 securityMode:(int64_t)a4 completion:(id)a5;
- (NSString)password;
- (id)_init;
- (id)description;
- (int64_t)securityMode;
@end

@implementation ICDelegationServiceSecuritySettings

- (void).cxx_destruct
{
}

- (NSString)password
{
  return self->_password;
}

- (int64_t)securityMode
{
  return self->_securityMode;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_password) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@ %p securityMode: %li hasPassword: %@>", v5, self, self->_securityMode, v7];

  return v8;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationServiceSecuritySettings;
  return [(ICDelegationServiceSecuritySettings *)&v3 init];
}

+ (void)getDeviceSenderSettingsForReceiverName:(id)a3 securityMode:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4 == 4)
  {
    if (getDeviceSenderSettingsForReceiverName_securityMode_completion__sOnceToken != -1) {
      dispatch_once(&getDeviceSenderSettingsForReceiverName_securityMode_completion__sOnceToken, &__block_literal_global_17);
    }
    id v10 = v8;
    MRMediaRemoteGetSavedAVRoutePassword();
  }
  else
  {
    v9 = [[ICDelegationServiceSecuritySettings alloc] _init];
    v9[1] = a4;
    (*((void (**)(id, void *, void))v8 + 2))(v8, v9, 0);
  }
}

void __102__ICDelegationServiceSecuritySettings_getDeviceSenderSettingsForReceiverName_securityMode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [[ICDelegationServiceSecuritySettings alloc] _init];
  *((void *)v4 + 1) = *(void *)(a1 + 40);
  objc_storeStrong((id *)v4 + 2, a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__ICDelegationServiceSecuritySettings_getDeviceSenderSettingsForReceiverName_securityMode_completion___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceSecuritySettings.senderSerialQueue", 0);
  uint64_t v1 = getDeviceSenderSettingsForReceiverName_securityMode_completion__sSerialQueue;
  getDeviceSenderSettingsForReceiverName_securityMode_completion__sSerialQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)getDeviceReceiverSettingsWithCompletion:(id)a3
{
  id v3 = a3;
  if (getDeviceReceiverSettingsWithCompletion__sOnceToken != -1) {
    dispatch_once(&getDeviceReceiverSettingsWithCompletion__sOnceToken, &__block_literal_global_31728);
  }
  uint64_t v5 = v3;
  id v4 = v3;
  MRMediaRemoteGetReceiverAirPlaySecuritySettings();
}

void __79__ICDelegationServiceSecuritySettings_getDeviceReceiverSettingsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    switch(MRAVAirPlaySecuritySettingsGetSecurityMode())
    {
      case 1u:
        id v4 = 0;
        uint64_t v5 = 1;
        break;
      case 2u:
        id v4 = 0;
        uint64_t v5 = 2;
        break;
      case 3u:
        id v4 = 0;
        uint64_t v5 = 3;
        break;
      case 4u:
        id v4 = MEMORY[0x1A62400C0](a2);
        uint64_t v5 = 4;
        break;
      default:
        uint64_t v5 = 0;
        id v4 = 0;
        break;
    }
    id v13 = +[ICDeviceInfo currentDeviceInfo];
    if ((([v13 isAppleTV] & 1) != 0 || objc_msgSend(v13, "isAudioAccessory"))
      && AirPlaySupportLibraryCore()
      && getAPSSettingsGetInt64SymbolLoc())
    {
      Int64SymbolLoc = (uint64_t (*)(__CFString *, void))getAPSSettingsGetInt64SymbolLoc();
      if (!Int64SymbolLoc)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v12 = objc_msgSend(NSString, "stringWithUTF8String:", "int64_t soft_APSSettingsGetInt64(CFStringRef, OSStatus *)");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"ICDelegationServiceSecuritySettings.m", 21, @"%s", dlerror());

        __break(1u);
        JUMPOUT(0x1A2FBC6B0);
      }
      if (Int64SymbolLoc(@"accessControlLevel", 0) >= 1)
      {

        id v4 = 0;
        uint64_t v5 = 1;
      }
    }
    id v8 = [[ICDelegationServiceSecuritySettings alloc] _init];
    v9 = (void *)v8[2];
    v8[1] = v5;
    v8[2] = v4;
    id v10 = v4;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v13);
  }
}

uint64_t __79__ICDelegationServiceSecuritySettings_getDeviceReceiverSettingsWithCompletion___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceSecuritySettings.receiverSerialQueue", 0);
  uint64_t v1 = getDeviceReceiverSettingsWithCompletion__sSerialQueue;
  getDeviceReceiverSettingsWithCompletion__sSerialQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end