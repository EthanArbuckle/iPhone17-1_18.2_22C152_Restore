@interface CloudPairing
+ (id)sharedInstance;
- (BOOL)_generateKeys;
- (BOOL)accessibilityHeadTrackingEnabled;
- (BOOL)generateKeys;
- (BOOL)getAccessibilityHeadtrackingEnabled;
- (BOOL)getAccountStatus;
- (BOOL)handleXPCUnpairCommand:(id)a3;
- (BOOL)iCloudSignedIn;
- (BOOL)isRunningInRecovery;
- (BOOL)multipleAdvInitialized;
- (BOOL)supportsVirtualAddress;
- (BTCloudServicesClient)cloudClient;
- (CloudPairing)init;
- (NSArray)associatedDevices;
- (NSArray)cloudLocalUUIDs;
- (NSArray)cloudidsIdentifiers;
- (NSArray)requestedKeyTypes;
- (NSMutableArray)cloudDevices;
- (NSMutableArray)cloudUploadedKeys;
- (NSMutableDictionary)idsMultiUsersDictionary;
- (NSString)currentIDSUser;
- (NSString)currentUserRandomAddress;
- (NSString)localDeviceName;
- (NSString)publicAddress;
- (OS_dispatch_queue)serialQueue;
- (OS_xpc_object)serverConnection;
- (id)_generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (id)_getPairedDeviceForIDSIdentifier:(id)a3;
- (id)createBluetoothAddressForIDSLocalDevice:(id)a3;
- (id)deviceName;
- (id)generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6;
- (id)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5;
- (id)getIRKForRandomStaticAddress:(id)a3;
- (id)getPairedDeviceForIDSIdentifier:(id)a3;
- (id)readUserPreference:(id)a3;
- (unint64_t)keyLength;
- (void)_handleConnectionEvent:(id)a3;
- (void)_handleMsg:(id)a3;
- (void)audioAccessorySmartChargeDeadlineHasChangedFromCloud:(void *)a3;
- (void)audioAccessorySmartChargeDeadlineHasChangedFromNotification:(id)a3;
- (void)audioAccessorySmartChargeStatusHasChangedFromCloud:(void *)a3;
- (void)audioAccessorySmartChargeStatusHasChangedFromNotification:(id)a3;
- (void)cloudpairdMsg:(id)a3 args:(id)a4;
- (void)cloudpairdReplyMsg:(id)a3 args:(id)a4;
- (void)fetchManateeStatus;
- (void)fetchSoundProfile;
- (void)launchCloudPair;
- (void)multipleAdvInstancesInitialized:(BOOL)a3;
- (void)printDebug;
- (void)registerWithCloudPairedDevices:(id)a3 identifiers:(id)a4;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetDataForIDSLocalDevice:(id)a3;
- (void)resetServerConnection;
- (void)sendCloudKitPush;
- (void)sendCloudpairingRetry:(id)a3;
- (void)setAccessibilityHeadTrackingEnabled:(BOOL)a3;
- (void)setAssociatedDevices:(id)a3;
- (void)setCloudDevices:(id)a3;
- (void)setCloudUploadedKeys:(id)a3;
- (void)setCurrentIDSUser:(id)a3;
- (void)setCurrentUserRandomAddress:(id)a3;
- (void)setICloudSignedIn:(BOOL)a3;
- (void)setIdsMultiUsersDictionary:(id)a3;
- (void)setLocalDeviceName:(id)a3;
- (void)setMultipleAdvInitialized:(BOOL)a3;
- (void)setPublicAddress:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)setSupportsVirtualAddress:(BOOL)a3;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)startListeningToPowerUIStatusChanges;
- (void)startUpServices;
- (void)stopListeningToPowerUIStatusChanges;
- (void)updateCurrentIDSUserInfo:(id)a3;
- (void)updateRandomAddressContinuityAdvInstance:(id)a3;
@end

@implementation CloudPairing

+ (id)sharedInstance
{
  if (qword_100A13838 != -1) {
    dispatch_once(&qword_100A13838, &stru_1009B4288);
  }
  v2 = (void *)qword_100A13830;

  return v2;
}

- (BTCloudServicesClient)cloudClient
{
  if (qword_100A13848 != -1) {
    dispatch_once(&qword_100A13848, &stru_1009B42A8);
  }
  v2 = (void *)qword_100A13840;

  return (BTCloudServicesClient *)v2;
}

- (CloudPairing)init
{
  v47.receiver = self;
  v47.super_class = (Class)CloudPairing;
  v2 = [(CloudPairing *)&v47 init];
  v3 = v2;
  if (!v2)
  {
LABEL_31:
    v35 = v3;
    goto LABEL_32;
  }
  v4 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CloudPairing init", buf, 2u);
  }
  if (MGGetBoolAnswer())
  {
    uint64_t v5 = +[NSArray array];
    cloudLocalUUIDs = v2->_cloudLocalUUIDs;
    v2->_cloudLocalUUIDs = (NSArray *)v5;

    uint64_t v7 = +[NSArray array];
    cloudidsIdentifiers = v2->_cloudidsIdentifiers;
    v2->_cloudidsIdentifiers = (NSArray *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, -1);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bluetoothd.cloudpairing.serial", v10);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = (NSArray *)[objc_alloc((Class)NSArray) initWithObjects:@"EncryptionKeys", @"IdentityKeys", nil];
    requestedKeyTypes = v2->_requestedKeyTypes;
    v2->_requestedKeyTypes = v13;

    v2->_keyLength = 16;
    uint64_t v15 = [(CloudPairing *)v2 deviceName];
    localDeviceName = v2->_localDeviceName;
    v2->_localDeviceName = (NSString *)v15;

    if (!v2->_localDeviceName)
    {
      v2->_localDeviceName = (NSString *)@"iOS Device";

      v17 = (id)qword_100A19E60;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10077791C((uint64_t)[(NSString *)v2->_localDeviceName UTF8String], v50, v17);
      }
    }
    uint64_t v18 = +[NSMutableArray arrayWithCapacity:1];
    cloudDevices = v2->_cloudDevices;
    v2->_cloudDevices = (NSMutableArray *)v18;

    uint64_t v20 = +[NSMutableArray arrayWithCapacity:1];
    cloudUploadedKeys = v2->_cloudUploadedKeys;
    v2->_cloudUploadedKeys = (NSMutableArray *)v20;

    __int16 v46 = 0;
    int v45 = 0;
    uint64_t v22 = sub_1003705E4();
    if (!(*(unsigned int (**)(uint64_t, int *))(*(void *)v22 + 32))(v22, &v45))
    {
      id v23 = objc_alloc((Class)NSString);
      sub_1004A82EC((unsigned __int8 *)&v45, buf);
      v24 = v49 >= 0 ? buf : *(uint8_t **)buf;
      v25 = (NSString *)[v23 initWithUTF8String:v24];
      publicAddress = v3->_publicAddress;
      v3->_publicAddress = v25;

      if (v49 < 0) {
        operator delete(*(void **)buf);
      }
    }
    if (v3->_publicAddress)
    {
      *(_WORD *)&v3->_keysGenerated = 0;
      [(CloudPairing *)v3 setServerConnection:0];
      v3->_needsCloudKitPush = 0;
      v3->_updatingCloudKit = 0;
      v3->_supportsVirtualAddress = 0;
      idsMultiUsersDictionary = v3->_idsMultiUsersDictionary;
      v3->_idsMultiUsersDictionary = 0;

      currentIDSUser = v3->_currentIDSUser;
      v3->_currentIDSUser = 0;

      currentUserRandomAddress = v3->_currentUserRandomAddress;
      v3->_currentUserRandomAddress = 0;

      v3->_multipleAdvInitialized = 0;
      id v30 = [(CloudPairing *)v3 cloudClient];
      v3->_accessibilityHeadTrackingEnabled = 1;
      char v44 = 0;
      uint64_t v31 = sub_10003FFD4();
      (*(void (**)(uint64_t, char *))(*(void *)v31 + 104))(v31, &v44);
      if (v44)
      {
        v32 = (id)qword_100A19E60;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = MKBDeviceUnlockedSinceBoot();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Already first unlocked: %d", buf, 8u);
        }

        [(CloudPairing *)v3 startUpServices];
      }
      else
      {
        int out_token = -1;
        *(void *)buf = 0;
        objc_initWeak((id *)buf, v3);
        v36 = *(id *)(sub_1004AF8EC() + 8);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10052FC5C;
        handler[3] = &unk_1009AC030;
        objc_copyWeak(&v42, (id *)buf);
        uint32_t v37 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v36, handler);

        v38 = qword_100A19E60;
        if (v37)
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
            sub_1007778B4();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Successfully registered for MKB first unlock notification", v40, 2u);
        }
        objc_destroyWeak(&v42);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_FAULT)) {
      sub_100777874();
    }
  }
  else
  {
    v34 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CloudPairing not supported on this platform (LE)", buf, 2u);
    }
  }
  v35 = 0;
LABEL_32:

  return v35;
}

- (void)startUpServices
{
  uint64_t v3 = sub_10037345C();
  (*(void (**)(uint64_t))(*(void *)v3 + 200))(v3);
  if (_os_feature_enabled_impl()
    && NSClassFromString(@"PowerUISmartChargeClientAudioAccessories"))
  {
    [(CloudPairing *)self startListeningToPowerUIStatusChanges];
  }
  if (_os_feature_enabled_impl() && sub_100540244())
  {
    self->_cloudSoundProfileChangedNotifyToken = -1;
    v4 = (const char *)[BTCloudSoundProfileChangedNotification UTF8String];
    serialQueue = self->_serialQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10052FF38;
    handler[3] = &unk_100997478;
    void handler[4] = self;
    uint32_t v6 = notify_register_dispatch(v4, &self->_cloudSoundProfileChangedNotifyToken, serialQueue, handler);
    uint64_t v7 = qword_100A19E60;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Failed registration for CloudSoundProfileChangedNotification with error : %u", buf, 8u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Successfully registered for CloudSoundProfileChangedNotification", buf, 2u);
      }
      [(CloudPairing *)self fetchSoundProfile];
    }
  }
}

- (void)multipleAdvInstancesInitialized:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (id)qword_100A19E60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(CloudPairing *)self multipleAdvInitialized];
    uint64_t v7 = [(CloudPairing *)self currentUserRandomAddress];
    v11[0] = 67109634;
    v11[1] = v3;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - multiple adv instances initialized? %d, stored %d, RSA %@", (uint8_t *)v11, 0x18u);
  }
  if ([(CloudPairing *)self multipleAdvInitialized] != v3)
  {
    [(CloudPairing *)self setMultipleAdvInitialized:v3];
    if ([(CloudPairing *)self multipleAdvInitialized])
    {
      BOOL v8 = [(CloudPairing *)self currentUserRandomAddress];
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        v10 = [(CloudPairing *)self currentUserRandomAddress];
        [(CloudPairing *)self updateRandomAddressContinuityAdvInstance:v10];
      }
    }
  }
}

- (id)deviceName
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (BOOL)isRunningInRecovery
{
  return 0;
}

- (BOOL)generateKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = sub_100019878();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100530230;
  v5[3] = &unk_1009A9320;
  v5[4] = self;
  v5[5] = &v6;
  sub_1004AFFC0(v3, v5);
  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_generateKeys
{
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
  }
  if ((sub_1006FEDC4(qword_1009F7EC8) & 1) == 0)
  {
    if (qword_1009F7ED0 != -1) {
      dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
    }
    sub_1006FF770(qword_1009F7EC8);
  }
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
  }
  *(_OWORD *)self->_encryptionRootKey = *(_OWORD *)(qword_1009F7EC8 + 168);
  *(_OWORD *)self->_identityResolvingKey = *(_OWORD *)(qword_1009F7EC8 + 184);
  uint64_t v3 = (_OWORD *)(qword_1009F7EC8 + 312);
  long long v4 = *(_OWORD *)(qword_1009F7EC8 + 328);
  *(_OWORD *)self->_cloudPrivateKey = *(_OWORD *)(qword_1009F7EC8 + 312);
  *(_OWORD *)&self->_cloudPrivateKey[16] = v4;
  long long v5 = v3[4];
  long long v6 = v3[5];
  long long v7 = v3[3];
  *(_OWORD *)&self->_cloudPrivateKey[32] = v3[2];
  *(_OWORD *)&self->_cloudPrivateKey[80] = v6;
  *(_OWORD *)&self->_cloudPrivateKey[64] = v5;
  *(_OWORD *)&self->_cloudPrivateKey[48] = v7;
  long long v8 = *(_OWORD *)(qword_1009F7EC8 + 264);
  long long v9 = *(_OWORD *)(qword_1009F7EC8 + 280);
  long long v10 = *(_OWORD *)(qword_1009F7EC8 + 296);
  *(_OWORD *)self->_cloudPublicKey = *(_OWORD *)(qword_1009F7EC8 + 248);
  *(_OWORD *)&self->_cloudPublicKey[48] = v10;
  *(_OWORD *)&self->_cloudPublicKey[32] = v9;
  *(_OWORD *)&self->_cloudPublicKey[16] = v8;
  *(_OWORD *)self->_cloudNonce = *(_OWORD *)(qword_1009F7EC8 + 408);
  if (IsAppleInternalBuild())
  {
    uint32_t v11 = (id)qword_100A19E60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = +[NSData dataWithBytes:self->_cloudPrivateKey length:96];
      int v19 = 138412290;
      uint64_t v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_cloudPrivateKey: [ %@ ]", (uint8_t *)&v19, 0xCu);
    }
    unsigned int v13 = (id)qword_100A19E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = +[NSData dataWithBytes:self->_cloudPublicKey length:64];
      int v19 = 138412290;
      uint64_t v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_cloudPublicKey: [ %@ ]", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v15 = (id)qword_100A19E60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = +[NSData dataWithBytes:self->_cloudNonce length:16];
      int v19 = 138412290;
      uint64_t v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_cloudNonce: [ %@ ]", (uint8_t *)&v19, 0xCu);
    }
  }
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
  }
  int v17 = sub_100180D78((long long *)(qword_1009F7EC8 + 136), 3, 0, self->_diversifierHidingKey);
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_FAULT)) {
      sub_100777964();
    }
  }
  else
  {
    self->_keysGenerated = 1;
  }
  return v17 == 0;
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 != &_xpc_error_connection_invalid)
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100530870;
      handler[3] = &unk_1009B4310;
      objc_copyWeak(&v21, (id *)buf);
      xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
      long long v8 = [(CloudPairing *)self serialQueue];
      xpc_connection_set_target_queue((xpc_connection_t)v4, v8);

      xpc_connection_resume((xpc_connection_t)v4);
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    uint32_t v11 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
      sub_1007779D8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    int v19 = [(CloudPairing *)self serverConnection];
    BOOL v10 = v19 == 0;

    goto LABEL_14;
  }
  long long v6 = qword_100A19E60;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing Unexpected XPC server event: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing XPC server error: %@", buf, 0xCu);
  }
  if (v4 == &_xpc_error_connection_invalid)
  {
    long long v9 = [(CloudPairing *)self serverConnection];
    BOOL v10 = v9 == 0;

LABEL_14:
    if (!v10) {
      [(CloudPairing *)self setServerConnection:0];
    }
  }
LABEL_16:
}

- (void)_handleMsg:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v4, "kMsgId");
    long long v6 = (id)qword_100A19E60;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v550[0].__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)string;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing got msg: %s", (uint8_t *)v550, 0xCu);
    }

    BOOL v7 = xpc_dictionary_get_value(v4, "kMsgArgs");
    long long v8 = v7;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
        sub_100777A50();
      }
      goto LABEL_118;
    }
    if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary)
    {
      long long v9 = (id)qword_100A19E60;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        xpc_type_t type = xpc_get_type(v8);
        name = xpc_type_get_name(type);
        sub_100777C98((uint64_t)name, (uint8_t *)v550, v9);
      }

      goto LABEL_118;
    }
    if (!strcmp(string, "manateeUdpateStatus"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      uint64_t v16 = [v12 objectForKey:@"kUploadStatus"];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
        uint64_t v18 = [v12 objectForKey:@"kUploadStatus"];
        unsigned int v19 = [v18 BOOLValue];

        if (v19) {
          [(CloudPairing *)self cloudpairdMsg:@"deleteOldContainer" args:0];
        }
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "smartRoutingCapable"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      uint64_t v20 = [v12 objectForKey:@"srCapable"];
      BOOL v21 = v20 == 0;

      if (!v21)
      {
        uint64_t v22 = [v12 objectForKey:@"srCapable"];
        int v23 = [v22 BOOLValue];

        v24 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          v25 = "No";
          if (v23) {
            v25 = "Yes";
          }
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Smart Route Support: Set to %s", (uint8_t *)v550, 0xCu);
        }
        if (qword_1009F7F00 != -1) {
          dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
        }
        sub_1004ABD30((uint64_t)off_1009F7EF8, v23);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "SignInStatusChanged"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v26 = [v12 objectForKey:@"kSignInStatus"];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        v28 = [v12 objectForKey:@"kSignInStatus"];
        id v29 = [v28 BOOLValue];

        id v30 = [v12 objectForKey:@"kSignInAppleID"];
        [(CloudPairing *)self setICloudSignedIn:v29];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v30 = &stru_1009C1AC8;
        }
        uint64_t v31 = sub_10037345C();
        v32 = v30;
        sub_10004191C(v538, (char *)[(__CFString *)v32 UTF8String]);
        (*(void (**)(uint64_t, id, void **))(*(void *)v31 + 80))(v31, v29, v538);
        if (v539 < 0) {
          operator delete(v538[0]);
        }
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "MasterKeysAvailable"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      int v33 = [v12 objectForKey:@"kMasterKeyBlob"];
      BOOL v34 = v33 == 0;

      if (!v34)
      {
        v35 = [v12 objectForKey:@"kMasterKeyBlob"];
        id v36 = [v35 length];
        id v37 = v35;
        id v38 = [v37 bytes];
        uint64_t v39 = sub_10037345C();
        (*(void (**)(uint64_t, id, id))(*(void *)v39 + 88))(v39, v38, v36);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "MasterKeysNotAvailable"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v40 = [v12 objectForKey:@"kMasterKeyBlob"];
      BOOL v41 = v40 == 0;

      if (!v41)
      {
        uint64_t v42 = sub_10037345C();
        (*(void (**)(uint64_t))(*(void *)v42 + 96))(v42);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "DeviceInfoAvailable"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v43 = [v12 objectForKey:@"kDeviceInfoBlob"];
      char v44 = [v12 objectForKeyedSubscript:@"loginID"];
      v556.__r_.__value_.__s.__data_[0] = 0;
      memset(v550, 0, 24);
      if (qword_1009F8080 != -1) {
        dispatch_once(&qword_1009F8080, &stru_1009B44E8);
      }
      sub_10049FE28((uint64_t)off_1009F8078, &v556, (uint64_t)v550);
      if ([v44 length])
      {
        id v45 = v44;
        if (std::string::compare(v550, (const std::string::value_type *)[v45 UTF8String]))
        {
          __int16 v46 = qword_100A19ED8;
          if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v557[0]) = 138412546;
            *(void **)((char *)v557 + 4) = v45;
            WORD2(v557[1]) = 2112;
            *(void **)((char *)&v557[1] + 6) = v43;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Cloud: Dropping other user's legacy magic info message: %@ - %@", (uint8_t *)v557, 0x16u);
          }
          if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v550[0].__r_.__value_.__l.__data_);
          }

          goto LABEL_118;
        }
      }
      if (v43)
      {
        id v52 = [v43 length];
        v54 = (char *)&v456 - ((__chkstk_darwin(v52, v53) + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v54, (size_t)v52);
        memmove(v54, [v43 bytes], (size_t)v52);
        uint64_t v55 = sub_10037345C();
        (*(void (**)(uint64_t, char *, id))(*(void *)v55 + 104))(v55, v54, v52);
      }
      if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v550[0].__r_.__value_.__l.__data_);
      }

      goto LABEL_117;
    }
    if (!strcmp(string, "DeviceInfoUploadStatus"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      objc_super v47 = [v12 objectForKey:@"kUploadStatus"];
      BOOL v48 = v47 == 0;

      if (!v48)
      {
        char v49 = [v12 objectForKey:@"kUploadStatus"];
        id v50 = [v49 BOOLValue];

        uint64_t v51 = sub_10037345C();
        (*(void (**)(uint64_t, id))(*(void *)v51 + 112))(v51, v50);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "ManateeBlobUpdate"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v56 = [v12 objectForKey:@"kDeviceInfoBlob"];
      BOOL v57 = v56 == 0;

      if (!v57)
      {
        v58 = [v12 objectForKey:@"kDeviceInfoBlob"];
        id v59 = [v58 length];
        v61 = (char *)&v456 - ((__chkstk_darwin(v59, v60) + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v61, (size_t)v59);
        id v62 = v58;
        memmove(v61, [v62 bytes], (size_t)v59);
        uint64_t v63 = sub_10037345C();
        (*(void (**)(uint64_t, char *, id))(*(void *)v63 + 160))(v63, v61, v59);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "oldContainerDeleted"))
    {
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v64 = [v12 objectForKey:@"kDeleteSuccess"];
      BOOL v65 = v64 == 0;

      if (v65) {
        goto LABEL_117;
      }
      v66 = [v12 objectForKey:@"kDeleteSuccess"];
      unsigned int v67 = [v66 BOOLValue];

      uint64_t v68 = qword_100A19E60;
      if (!os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_117;
      }
      LODWORD(v550[0].__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = v67;
      v69 = "Status for old container deletion %d";
      v70 = v68;
      os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
      uint32_t v72 = 8;
    }
    else
    {
      if (!strcmp(string, "forceManateeUpgrade"))
      {
        uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
        v73 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
        {
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Process forceManateeUpgrade: %@", (uint8_t *)v550, 0xCu);
        }
        v74 = [v12 objectForKey:@"kEncryptionSupport"];
        BOOL v75 = v74 == 0;

        if (!v75)
        {
          v76 = [v12 objectForKey:@"kEncryptionSupport"];
          unsigned int v77 = [v76 BOOLValue];

          if (v77)
          {
            uint64_t v78 = sub_10037345C();
            (*(void (**)(uint64_t, uint64_t))(*(void *)v78 + 136))(v78, 1);
          }
        }
        goto LABEL_117;
      }
      if (!strcmp(string, "GenerateCloudPairingKeys"))
      {
        v79 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
        {
          LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Process GenerateCloudPairingKeys", (uint8_t *)v550, 2u);
        }
        uint64_t v12 = _CFXPCCreateCFObjectFromXPCObject();
        *(void *)&long long v484 = [v12 objectForKey:@"kCloudPairingKeyTypes"];
        v80 = [v12 objectForKey:@"kCloudPairingKeyLength"];
        id v81 = [v80 unsignedIntegerValue];

        v82 = [v12 objectForKeyedSubscript:@"kLocalRandomAddress"];
        v83 = [(CloudPairing *)self generateKeyDictForTypes:(void)v484 keyLength:v81 forAddress:v82];
        v84 = (id)qword_100A19E60;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          int v85 = IsAppleInternalBuild();
          v86 = v83;
          if (!v85)
          {
            v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v83 count]);
          }
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v86;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "Replying GenerateCloudPairingKeys: %@", (uint8_t *)v550, 0xCu);
          if (!v85) {
        }
          }
        [(CloudPairing *)self cloudpairdReplyMsg:v4 args:v83];

        goto LABEL_117;
      }
      if (!strcmp(string, "CloudPairingComplete"))
      {
        uint64_t v12 = _CFXPCCreateCFObjectFromXPCObject();
        uint64_t v87 = [v12 objectForKey:@"kCloudPairingCompleteResponse"];
        uint64_t v88 = [v12 objectForKey:@"kCloudPairingLocalKeys"];
        *(void *)&long long v483 = v88;
        *(void *)&long long v484 = [v12 objectForKey:@"kCloudDeviceUniqueID"];
        v89 = [v12 objectForKey:@"kCloudPairingProtocolID"];
        v90 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "MUC - Args for CloudPairingComplete: %@", (uint8_t *)v550, 0xCu);
        }
        v91 = [(CloudPairing *)self generateCloudPairingIDWithResponse:v87 localKeys:v88 from:(void)v484 forProtocolID:v89];
        v92 = qword_100A19E60;
        v93 = (void *)v87;
        if (v91)
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v91;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Got pairingID: %@", (uint8_t *)v550, 0xCu);
          }
          CFStringRef v566 = @"kCloudPairingID";
          v94 = [v91 UUIDString];
          v567 = v94;
          v95 = +[NSDictionary dictionaryWithObjects:&v567 forKeys:&v566 count:1];
          [(CloudPairing *)self cloudpairdReplyMsg:v4 args:v95];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
            sub_100777A84();
          }
          [(CloudPairing *)self cloudpairdReplyMsg:v4 args:&__NSDictionary0__struct];
        }

        goto LABEL_117;
      }
      if (!strcmp(string, "UnpairCloudDevice"))
      {
        v96 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
        {
          LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "Process UnpairCloudDevice", (uint8_t *)v550, 2u);
        }
        v97 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        v550[0].__r_.__value_.__r.__words[0] = 0;
        v550[0].__r_.__value_.__l.__size_ = (std::string::size_type)v550;
        v550[0].__r_.__value_.__r.__words[2] = 0x2020000000;
        v550[1].__r_.__value_.__s.__data_[0] = 0;
        uint64_t v98 = sub_100019878();
        v535[0] = _NSConcreteStackBlock;
        v535[1] = 3221225472;
        v535[2] = sub_1005374EC;
        v535[3] = &unk_1009B4338;
        v537 = v550;
        v535[4] = self;
        uint64_t v12 = v97;
        v536 = v12;
        sub_1004AFFC0(v98, v535);
        CFStringRef v564 = @"kSuccess";
        v99 = +[NSNumber numberWithBool:*(unsigned __int8 *)(v550[0].__r_.__value_.__l.__size_ + 24)];
        v565 = v99;
        v100 = +[NSDictionary dictionaryWithObjects:&v565 forKeys:&v564 count:1];
        [(CloudPairing *)self cloudpairdReplyMsg:v4 args:v100];

        v101 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
        {
          LOWORD(v557[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "Replying UnpairCloudDevice", (uint8_t *)v557, 2u);
        }

        _Block_object_dispose(v550, 8);
        goto LABEL_117;
      }
      if (!strcmp(string, "FetchPublicAddress"))
      {
        v102 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
        {
          LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "Process FetchPublicAddress", (uint8_t *)v550, 2u);
        }
        v103 = [(CloudPairing *)self publicAddress];
        BOOL v104 = v103 == 0;

        if (v104)
        {
          [(CloudPairing *)self cloudpairdReplyMsg:v4 args:&__NSDictionary0__struct];
        }
        else
        {
          CFStringRef v562 = @"kPublicAddress";
          v105 = [(CloudPairing *)self publicAddress];
          v563 = v105;
          v106 = +[NSDictionary dictionaryWithObjects:&v563 forKeys:&v562 count:1];
          [(CloudPairing *)self cloudpairdReplyMsg:v4 args:v106];
        }
        uint64_t v12 = (id)qword_100A19E60;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v118 = [(CloudPairing *)self publicAddress];
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v118;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Replying FetchPublicAddress: %@", (uint8_t *)v550, 0xCu);
        }
        goto LABEL_117;
      }
      if (strcmp(string, "RemoveCloudPairedDevice"))
      {
        if (!strcmp(string, "RemoveStaleLEPairedDevice"))
        {
          uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
          v113 = qword_100A19E60;
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "MUC - Process RemoveCloudPairedDevice: %@", (uint8_t *)v550, 0xCu);
          }
          v114 = [v12 objectForKey:@"kCloudDeviceID"];
          if (v114 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v115 = qword_100A19E60;
            if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v114;
              _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "MUC - Removing Stale CloudPairedDevice: %@", (uint8_t *)v550, 0xCu);
            }
            id v116 = [objc_alloc((Class)NSUUID) initWithUUIDString:v114];
            if (v116)
            {
              uint64_t v117 = sub_100019878();
              v531[0] = _NSConcreteStackBlock;
              v531[1] = 3221225472;
              v531[2] = sub_1005375CC;
              v531[3] = &unk_100997450;
              id v532 = v116;
              sub_100013018(v117, v531);
            }
            else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
            {
              sub_100777B20();
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
          {
            sub_100777AB8();
          }

          goto LABEL_117;
        }
        if (!strcmp(string, "checkIn"))
        {
          v130 = qword_100A19E60;
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
          {
            LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_INFO, "Process checkIn", (uint8_t *)v550, 2u);
          }
          uint64_t v12 = _CFXPCCreateCFObjectFromXPCObject();
          v131 = qword_100A19E60;
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
          {
            LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
            _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "Process checkIn: %@", (uint8_t *)v550, 0xCu);
          }
          v132 = [v12 objectForKey:@"kCheckInVersion"];
          v133 = v132;
          if (v132)
          {
            if (([v132 isEqualToNumber:&off_1009E0F20] & 1) == 0)
            {
              v134 = qword_100A19E60;
              if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_FAULT)) {
                sub_100777B88((uint64_t)v133, v134);
              }
            }
            v135 = [v12 objectForKey:@"kIDSLocalDeviceUniqueID"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(void *)&long long v484 = [v12 objectForKey:@"kIDSLocalDeviceUniqueID"];
            }
            else
            {
              *(void *)&long long v484 = 0;
            }

            *(void *)&long long v483 = [(CloudPairing *)self getPairedDeviceForIDSIdentifier:(void)v484];
            v136 = qword_100A19E60;
            if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412546;
              *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = v483;
              WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v484;
              _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "MUC - sending BTUUID-IDS device mapping %@ for local IDS %@", (uint8_t *)v550, 0x16u);
            }
            v137 = +[NSMutableDictionary dictionary];
            v138 = [(CloudPairing *)self publicAddress];
            BOOL v139 = v138 == 0;

            if (!v139)
            {
              v140 = [(CloudPairing *)self publicAddress];
              [v137 setObject:v140 forKey:@"kPublicAddress"];
            }
            v141 = (id)qword_100A19E60;
            if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
            {
              v142 = [(CloudPairing *)self publicAddress];
              LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v142;
              _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "Check in replying with Public Address: %@", (uint8_t *)v550, 0xCu);
            }
            [v137 setObject:(void)v483 forKey:@"kCachedLEDevices"];
            [v137 setObject:&off_1009E0F20 forKey:@"kCheckInVersion"];
            [(CloudPairing *)self cloudpairdReplyMsg:v4 args:v137];
          }
          goto LABEL_117;
        }
        if (!strcmp(string, "AllDevicesRemovedWithRecords") || !strcmp(string, "DevicesRemovedWithRecords"))
        {
          uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
          v120 = qword_100A19ED8;
          if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Devices majestic info removed", (uint8_t *)v550, 2u);
          }
          if (sub_10037345C() && v12)
          {
            *(void *)&long long v484 = [v12 objectForKeyedSubscript:@"devices"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v561[0] = objc_opt_class();
              v561[1] = objc_opt_class();
              v561[2] = objc_opt_class();
              v121 = +[NSArray arrayWithObjects:v561 count:3];
              v122 = +[NSSet setWithArray:v121];
              *(void *)&long long v483 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v122 fromData:(void)v484 error:0];

              if ((void)v483)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v529 = 0u;
                  long long v530 = 0u;
                  long long v527 = 0u;
                  long long v528 = 0u;
                  id v123 = (id)v483;
                  id v124 = [v123 countByEnumeratingWithState:&v527 objects:v560 count:16];
                  if (v124)
                  {
                    uint64_t v125 = *(void *)v528;
                    do
                    {
                      for (i = 0; i != v124; i = (char *)i + 1)
                      {
                        if (*(void *)v528 != v125) {
                          objc_enumerationMutation(v123);
                        }
                        v127 = *(void **)(*((void *)&v527 + 1) + 8 * i);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v128 = sub_10037345C();
                          id v129 = [v127 bluetoothAddress];
                          sub_10004191C(v525, (char *)[v129 UTF8String]);
                          (*(void (**)(uint64_t, void **))(*(void *)v128 + 184))(v128, v525);
                          if (v526 < 0) {
                            operator delete(v525[0]);
                          }
                        }
                      }
                      id v124 = [v123 countByEnumeratingWithState:&v527 objects:v560 count:16];
                    }
                    while (v124);
                  }
                }
              }
            }
          }
          goto LABEL_117;
        }
        if (strcmp(string, "DevicesUpdatedWithRecords"))
        {
          if (!strcmp(string, "AllDeviceSupportInformationRecordsRemoved")
            || !strcmp(string, "DeviceSupportInformationRecordsRemoved"))
          {
            uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
            v143 = qword_100A19ED8;
            if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
              _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "Devices support info removed", (uint8_t *)v550, 2u);
            }
            if (sub_10037345C() && v12)
            {
              *(void *)&long long v483 = [v12 objectForKeyedSubscript:@"records"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v555[0] = objc_opt_class();
                v555[1] = objc_opt_class();
                v555[2] = objc_opt_class();
                v144 = +[NSArray arrayWithObjects:v555 count:3];
                v145 = +[NSSet setWithArray:v144];
                *(void *)&long long v482 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v145 fromData:(void)v483 error:0];

                if ((void)v482)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v515 = 0u;
                    long long v516 = 0u;
                    long long v513 = 0u;
                    long long v514 = 0u;
                    id v146 = (id)v482;
                    id v147 = [v146 countByEnumeratingWithState:&v513 objects:v554 count:16];
                    if (v147)
                    {
                      uint64_t v149 = *(void *)v514;
                      *(void *)&long long v148 = 138412290;
                      long long v484 = v148;
                      do
                      {
                        for (j = 0; j != v147; j = (char *)j + 1)
                        {
                          if (*(void *)v514 != v149) {
                            objc_enumerationMutation(v146);
                          }
                          std::string::size_type v151 = *(void *)(*((void *)&v513 + 1) + 8 * (void)j);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v152 = qword_100A19ED8;
                            if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
                            {
                              LODWORD(v550[0].__r_.__value_.__l.__data_) = v484;
                              *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = v151;
                              _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "Device Support Info to be removed: %@", (uint8_t *)v550, 0xCu);
                            }
                          }
                        }
                        id v147 = [v146 countByEnumeratingWithState:&v513 objects:v554 count:16];
                      }
                      while (v147);
                    }
                  }
                }
              }
            }
            goto LABEL_117;
          }
          if (strcmp(string, "DeviceSupportInformationRecordsUpdated"))
          {
            if (strcmp(string, "MagicPairingRecordsRemoved"))
            {
              if (strcmp(string, "MagicPairingRecordsUpdated"))
              {
                if (!strcmp(string, "ManateeIdentityLost"))
                {
                  v450 = qword_100A19ED8;
                  if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v450, OS_LOG_TYPE_DEFAULT, "ManateeIdentityLost in cloudkit. Push local data again to resync.", (uint8_t *)v550, 2u);
                  }
                  if (sub_10037345C())
                  {
                    uint64_t v451 = sub_10037345C();
                    (*(void (**)(uint64_t))(*(void *)v451 + 192))(v451);
                  }
                  goto LABEL_118;
                }
                if (!strcmp(string, "OnlineStatusChanged"))
                {
                  BOOL v452 = xpc_dictionary_get_BOOL(v8, "kOnlineStatus");
                  if (sub_10037345C())
                  {
                    v453 = qword_100A19ED8;
                    if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
                    {
                      v454 = "no";
                      if (v452) {
                        v454 = "yes";
                      }
                      LODWORD(v550[0].__r_.__value_.__l.__data_) = 136315138;
                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v454;
                      _os_log_impl((void *)&_mh_execute_header, v453, OS_LOG_TYPE_DEFAULT, "Network changed to %s. Push local data if any to cloud.", (uint8_t *)v550, 0xCu);
                    }
                    uint64_t v455 = sub_10037345C();
                    (*(void (**)(uint64_t, BOOL))(*(void *)v455 + 72))(v455, v452);
                  }
                  goto LABEL_118;
                }
                if (strcmp(string, "kBTAccessHeadTrackUpdate"))
                {
LABEL_118:

                  goto LABEL_119;
                }
                uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
                uint64_t v13 = qword_100A19E60;
                if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received kBTAccessHeadTrackUpdate for call", (uint8_t *)v550, 2u);
                }
                uint64_t v14 = [v12 objectForKey:@"kAccessHeadTracking"];
                -[CloudPairing setAccessibilityHeadTrackingEnabled:](self, "setAccessibilityHeadTrackingEnabled:", [v14 BOOLValue]);

                uint64_t v15 = sub_10003FFD4();
                (*(void (**)(uint64_t))(*(void *)v15 + 232))(v15);
                goto LABEL_117;
              }
              uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
              v245 = (id)qword_100A19ED8;
              if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
              {
                id v246 = [v12 debugDescription];
                id v247 = [v246 UTF8String];
                LODWORD(v550[0].__r_.__value_.__l.__data_) = 136446210;
                *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v247;
                _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "Devices magic info updated from cloudkit = %{public}s", (uint8_t *)v550, 0xCu);
              }
              if (qword_1009F8080 != -1) {
                dispatch_once(&qword_1009F8080, &stru_1009B44E8);
              }
              if (!sub_1004962BC() || !sub_10037345C()) {
                goto LABEL_117;
              }
              unsigned int v248 = [(CloudPairing *)self iCloudSignedIn];
              unsigned int v249 = v12 ? v248 : 0;
              if (v249 != 1) {
                goto LABEL_117;
              }
              id v470 = [v12 objectForKeyedSubscript:@"records"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v547[0] = objc_opt_class();
                v547[1] = objc_opt_class();
                v547[2] = objc_opt_class();
                v250 = +[NSArray arrayWithObjects:v547 count:3];
                v251 = +[NSSet setWithArray:v250];
                id v466 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v251 fromData:v470 error:0];

                if (v466)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v500 = 0u;
                    long long v498 = 0u;
                    long long v499 = 0u;
                    long long v497 = 0u;
                    *(void *)&long long v479 = v466;
                    v481 = (std::string *)[(id)v479 countByEnumeratingWithState:&v497 objects:v546 count:16];
                    if (!v481) {
                      goto LABEL_762;
                    }
                    *(void *)&long long v476 = v494;
                    *(void *)&long long v480 = *(void *)v498;
                    *(void *)&long long v252 = 138412290;
                    long long v478 = v252;
                    *(void *)&long long v252 = 67110146;
                    long long v475 = v252;
                    *(void *)&long long v252 = 67109890;
                    long long v473 = v252;
                    *(void *)&long long v252 = 136315138;
                    long long v469 = v252;
                    *(void *)&long long v252 = 136446210;
                    long long v464 = v252;
                    *(void *)&long long v252 = 68158466;
                    long long v458 = v252;
                    *(void *)&long long v252 = 68158722;
                    long long v457 = v252;
                    *(void *)&long long v252 = 67109120;
                    long long v461 = v252;
                    *(void *)&long long v252 = 136446722;
                    long long v472 = v252;
                    *(void *)&long long v252 = 136446466;
                    long long v459 = v252;
                    *(void *)&long long v252 = 67109376;
                    long long v456 = v252;
                    *(void *)&long long v252 = 136315394;
                    long long v471 = v252;
                    *(void *)&long long v252 = 136315650;
                    long long v468 = v252;
                    *(void *)&long long v252 = 136446467;
                    long long v474 = v252;
                    while (1)
                    {
                      *(void *)&long long v483 = 0;
                      do
                      {
                        if (*(void *)v498 != (void)v480) {
                          objc_enumerationMutation((id)v479);
                        }
                        *(void *)&long long v484 = *(void *)(*((void *)&v497 + 1) + 8 * v483);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v253 = (id)qword_100A19ED8;
                          if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
                          {
                            LODWORD(v550[0].__r_.__value_.__l.__data_) = v478;
                            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = v484;
                            _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEFAULT, "Cloud: Device magic pairing records to be updated: %@", (uint8_t *)v550, 0xCu);
                          }

                          __int16 v496 = 0;
                          unsigned int v495 = 0;
                          memset(v557, 0, sizeof(v557));
                          id v254 = [(id)v484 bluetoothAddress];
                          sub_10004191C(v557, (char *)[v254 UTF8String]);

                          if (SHIBYTE(v557[2]) >= 0) {
                            v255 = (unsigned __int8 *)v557;
                          }
                          else {
                            v255 = (unsigned __int8 *)v557[0];
                          }
                          if (sub_1004A82DC((uint64_t)&v495, v255))
                          {
                            if ((_BYTE)v495)
                            {
LABEL_423:
                              if (qword_1009F7F00 != -1) {
                                dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
                              }
                              *(void *)&long long v482 = sub_1004AA194((uint64_t)off_1009F7EF8, (uint64_t)&v495, 1);
                              int v492 = 1;
                              unsigned int v491 = 0;
                              uint64_t v490 = 0;
                              sub_10047B7A8(v482, &v490, &v491, (_DWORD *)&v490 + 1, &v492);
                              v256 = (id)qword_100A19ED8;
                              if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
                              {
                                unsigned int v257 = v491;
                                int v258 = HIDWORD(v490);
                                int v259 = v490;
                                int v260 = v492;
                                sub_100474E18(v482, &v556);
                                v261 = &v556;
                                if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                  v261 = (std::string *)v556.__r_.__value_.__r.__words[0];
                                }
                                v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v257, v475);
                                LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 2) = v258;
                                HIWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                LODWORD(v550[0].__r_.__value_.__r.__words[2]) = v259;
                                WORD2(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[2] + 6) = v260;
                                *(_WORD *)&v550[1].__r_.__value_.__s.__data_[2] = 2082;
                                *(std::string::size_type *)((char *)v550[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v261;
                                _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_DEFAULT, "[MP] Local Device ID; vid: %x, pid: %x, vidSrc: %d, version: %d for device: %{public}s",
                                  (uint8_t *)v550,
                                  0x24u);
                                if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                  operator delete(v556.__r_.__value_.__l.__data_);
                                }
                              }

                              v262 = [(id)v484 vendorID];
                              int v263 = [v262 integerValue];

                              v264 = [(id)v484 productID];
                              id v265 = [v264 integerValue];

                              if (v263 && v265)
                              {
                                if (v490 <= 1) {
                                  int v266 = 1;
                                }
                                else {
                                  int v266 = v490;
                                }
                                v267 = (id)qword_100A19ED8;
                                if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_100474E18(v482, &v556);
                                  v268 = &v556;
                                  if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                    v268 = (std::string *)v556.__r_.__value_.__r.__words[0];
                                  }
                                  v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v263, v473);
                                  LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                  *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 2) = v265;
                                  HIWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                  LODWORD(v550[0].__r_.__value_.__r.__words[2]) = v266;
                                  WORD2(v550[0].__r_.__value_.__r.__words[2]) = 2082;
                                  *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[2] + 6) = (std::string::size_type)v268;
                                  _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_DEFAULT, "[MP] Updating Device ID from cloud; vid: %x, cloud pid: %x, vidSrc: %x for device: %{public}s",
                                    (uint8_t *)v550,
                                    0x1Eu);
                                  if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v556.__r_.__value_.__l.__data_);
                                  }
                                }

                                sub_10047C89C(v482, v266, v263, (int)v265, v492);
                                sub_10047D63C(v482);
                              }
                              v269 = +[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v265, v456);
                              v270 = [v269 productName];

                              if (v270
                                && ([v270 isEqualToString:@"Unknown"] & 1) == 0
                                && [v270 length])
                              {
                                sub_100475EE0(v482, (uint64_t)v550);
                                std::string::size_type size = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                char v272 = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                  std::string::size_type size = v550[0].__r_.__value_.__l.__size_;
                                }
                                if (size)
                                {
                                  sub_100475EE0(v482, (uint64_t)&v556);
                                  BOOL v273 = std::string::compare(&v556, (const std::string::value_type *)[v270 UTF8String]) != 0;
                                  if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v556.__r_.__value_.__l.__data_);
                                  }
                                  char v272 = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                }
                                else
                                {
                                  BOOL v273 = 1;
                                }
                                if (v272 < 0) {
                                  operator delete(v550[0].__r_.__value_.__l.__data_);
                                }
                                if (v273)
                                {
                                  sub_10004191C(v550, (char *)[v270 utf8ValueSafe]);
                                  *(void *)&long long v545 = 0;
                                  *(_OWORD *)&v556.__r_.__value_.__l.__data_ = 0uLL;
                                  sub_100026C30((uint64_t)&v545);
                                  v556.__r_.__value_.__r.__words[0] = (int)v545;
                                  v556.__r_.__value_.__l.__size_ = SWORD2(v545);
                                  sub_100476E14(v482, (uint64_t)v550, &v556);
                                  if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v550[0].__r_.__value_.__l.__data_);
                                  }
                                  v276 = (id)qword_100A19ED8;
                                  if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
                                  {
                                    sub_100474E18(v482, v550);
                                    v277 = v550;
                                    if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                      v277 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                    }
                                    LODWORD(v556.__r_.__value_.__l.__data_) = v464;
                                    *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v277;
                                    _os_log_impl((void *)&_mh_execute_header, v276, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updated productname %{public}s", (uint8_t *)&v556, 0xCu);
                                    if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                      operator delete(v550[0].__r_.__value_.__l.__data_);
                                    }
                                  }
                                }
                              }

                              v278 = [(id)v484 name];
                              BOOL v279 = [v278 length] == 0;

                              if (!v279)
                              {
                                v280 = (id)qword_100A19ED8;
                                if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_100474E18(v482, v550);
                                  v281 = (v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                                       ? v550
                                       : (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                  id v282 = [(id)v484 name];
                                  id v283 = [v282 UTF8String];
                                  LODWORD(v556.__r_.__value_.__l.__data_) = v474;
                                  *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v281;
                                  WORD2(v556.__r_.__value_.__r.__words[1]) = 2081;
                                  *(std::string::size_type *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v283;
                                  _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updating %{public}s username to -> %{private}s", (uint8_t *)&v556, 0x16u);

                                  if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v550[0].__r_.__value_.__l.__data_);
                                  }
                                }

                                v284 = [(id)v484 name];
                                sub_10004191C(v550, (char *)[v284 utf8ValueSafe]);
                                sub_1004776CC(v482, (uint64_t)v550, 0);
                                if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                  operator delete(v550[0].__r_.__value_.__l.__data_);
                                }

                                uint64_t v285 = sub_10037345C();
                                id v286 = [(id)v484 bluetoothAddress];
                                sub_10004191C(v488, (char *)[v286 UTF8String]);
                                v287 = [(id)v484 name];
                                sub_10004191C(v486, (char *)[v287 utf8ValueSafe]);
                                (*(void (**)(uint64_t, void **, void **))(*(void *)v285 + 176))(v285, v488, v486);
                                if (v487 < 0) {
                                  operator delete(v486[0]);
                                }

                                if (v489 < 0) {
                                  operator delete(v488[0]);
                                }
                              }
                              sub_100475EE0(v482, (uint64_t)v550);
                              if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0)
                              {
                                std::string::size_type v288 = v550[0].__r_.__value_.__l.__size_;
                                operator delete(v550[0].__r_.__value_.__l.__data_);
                                if (!v288) {
                                  goto LABEL_486;
                                }
                              }
                              else if (!*((unsigned char *)&v550[0].__r_.__value_.__s + 23))
                              {
LABEL_486:
                                v289 = (id)qword_100A19ED8;
                                if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_100474E18(v482, v550);
                                  v290 = v550;
                                  if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                    v290 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                  }
                                  LODWORD(v556.__r_.__value_.__l.__data_) = v469;
                                  *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v290;
                                  _os_log_impl((void *)&_mh_execute_header, v289, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings No Name for device: %s", (uint8_t *)&v556, 0xCu);
                                  if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v550[0].__r_.__value_.__l.__data_);
                                  }
                                }

                                v291 = [(CloudPairing *)self cloudClient];
                                v292 = [(id)v484 bluetoothAddress];
                                [v291 deviceRecord:v292 completion:&stru_1009B4358];
                              }
                              v293 = [(id)v484 deviceIDFeatureBitsV1];
                              BOOL v294 = [v293 length] == 0;

                              if (!v294)
                              {
                                LODWORD(v556.__r_.__value_.__l.__data_) = 0;
                                id v295 = [(id)v484 deviceIDFeatureBitsV1];
                                sub_10004191C(v550, (char *)[v295 UTF8String]);
                                int v296 = std::stoul(v550, 0, 0);
                                if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                  operator delete(v550[0].__r_.__value_.__l.__data_);
                                }

                                BOOL v297 = sub_10047D434(v482, &v556);
                                if (LODWORD(v556.__r_.__value_.__l.__data_) != v296 || !v297)
                                {
                                  v299 = (id)qword_100A19ED8;
                                  if (os_log_type_enabled(v299, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v300 = v557;
                                    if (SHIBYTE(v557[2]) < 0) {
                                      v300 = (void **)v557[0];
                                    }
                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v471;
                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v300;
                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v296;
                                    _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_DEFAULT, "Cloud: Received iCloud update for DID supported feature bits version 1, address: %s, supported feature bits 0x%x", (uint8_t *)v550, 0x12u);
                                  }

                                  sub_10047CC64(v482, v296, 1);
                                }
                              }
                              v301 = [(id)v484 deviceIDFeatureBitsV2];
                              BOOL v302 = [v301 length] == 0;

                              if (!v302)
                              {
                                v556.__r_.__value_.__r.__words[0] = 0;
                                id v303 = [(id)v484 deviceIDFeatureBitsV2];
                                sub_10004191C(v550, (char *)[v303 UTF8String]);
                                unint64_t v304 = std::stoull(v550, 0, 0);
                                if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                  operator delete(v550[0].__r_.__value_.__l.__data_);
                                }

                                if ((!sub_10047D4F0(v482, &v556)
                                   || v556.__r_.__value_.__r.__words[0] != (HIDWORD(v304) | (v304 << 32)))
                                  && v304 != -1)
                                {
                                  v305 = (id)qword_100A19ED8;
                                  if (os_log_type_enabled(v305, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v306 = v557;
                                    if (SHIBYTE(v557[2]) < 0) {
                                      v306 = (void **)v557[0];
                                    }
                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v468;
                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v306;
                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = HIDWORD(v304);
                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = v304;
                                    _os_log_impl((void *)&_mh_execute_header, v305, OS_LOG_TYPE_DEFAULT, "Cloud: Apply Received iCloud update for DID extended supported feature bits version 2, address: %s, extended supported feature bits I1: 0x%x, I2: 0x%x", (uint8_t *)v550, 0x18u);
                                  }

                                  HIDWORD(v556.__r_.__value_.__r.__words[0]) |= v304;
                                  sub_10047CF64(v482, v556.__r_.__value_.__r.__words[0], 1);
                                }
                              }
                              v307 = [(id)v484 accessoryKey];
                              if ([v307 length] == (id)16)
                              {
                                v308 = [(id)v484 accessoryHint];
                                if ([v308 length] == (id)16)
                                {
                                  v309 = [(id)v484 encryptionKey];
                                  if ([v309 length] == (id)16)
                                  {
                                    v310 = [(id)v484 irk];
                                    if ([v310 length] == (id)16)
                                    {
                                      *(void *)&long long v477 = [(id)v484 ratchet];
                                      if ([(id)v477 length])
                                      {
                                        id v467 = [(id)v484 settingsMask];
                                        if ([v467 length])
                                        {
                                          id v465 = [(id)v484 supportedServices];
                                          if ([v465 length])
                                          {
                                            id v463 = [(id)v484 buttonModes];
                                            if ([v463 length])
                                            {
                                              id v462 = [(id)v484 color];
                                              if ([v462 length])
                                              {
                                                v311 = [(id)v484 listeningServices];
                                                int v460 = [v311 length] == 0;

                                                if ((v460 & 1) == 0)
                                                {
                                                  long long v545 = 0uLL;
                                                  long long v544 = 0uLL;
                                                  id v312 = [(id)v484 accessoryKey];
                                                  long long v545 = *(_OWORD *)[v312 bytes];

                                                  id v313 = [(id)v484 accessoryHint];
                                                  long long v544 = *(_OWORD *)[v313 bytes];

                                                  v314 = [(id)v484 masterKey];
                                                  if ([v314 length] == (id)16)
                                                  {
                                                    v315 = [(id)v484 masterHint];
                                                    BOOL v316 = [v315 length] == (id)16;

                                                    if (v316)
                                                    {
                                                      *(_OWORD *)&v556.__r_.__value_.__l.__data_ = 0uLL;
                                                      __n128 v543 = 0uLL;
                                                      v317 = (id)qword_100A19ED8;
                                                      if (os_log_type_enabled(v317, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v318 = [(id)v484 masterKey];
                                                        LODWORD(v550[0].__r_.__value_.__l.__data_) = v478;
                                                        *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v318;
                                                        _os_log_impl((void *)&_mh_execute_header, v317, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved Master Key: %@", (uint8_t *)v550, 0xCu);
                                                      }
                                                      v319 = (id)qword_100A19ED8;
                                                      if (os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v320 = [(id)v484 masterHint];
                                                        LODWORD(v550[0].__r_.__value_.__l.__data_) = v478;
                                                        *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v320;
                                                        _os_log_impl((void *)&_mh_execute_header, v319, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved Master Hint: %@", (uint8_t *)v550, 0xCu);
                                                      }
                                                      id v321 = [(id)v484 masterKey];
                                                      *(_OWORD *)&v556.__r_.__value_.__l.__data_ = *(_OWORD *)[v321 bytes];

                                                      id v322 = [(id)v484 masterHint];
                                                      __n128 v543 = *(__n128 *)[v322 bytes];

                                                      long long v542 = 0uLL;
                                                      if (!sub_10022FE78((uint64_t)&v543, (uint64_t)&v544, (uint64_t)&v542, 0x10uLL)&& v542 == *(_DWORD *)(v482 + 128)&& WORD2(v542) == *(unsigned __int16 *)(v482 + 132))
                                                      {
                                                        v324 = (id)qword_100A19ED8;
                                                        if (os_log_type_enabled(v324, OS_LOG_TYPE_INFO))
                                                        {
                                                          sub_100474E18(v482, v550);
                                                          v325 = v550;
                                                          if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                                            v325 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                                          }
                                                          int v540 = v464;
                                                          v541 = v325;
                                                          _os_log_impl((void *)&_mh_execute_header, v324, OS_LOG_TYPE_INFO, "Valid Main Account Keys from cloud magic device %{public}s", (uint8_t *)&v540, 0xCu);
                                                          if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                            operator delete(v550[0].__r_.__value_.__l.__data_);
                                                          }
                                                        }

                                                        if (qword_1009F8080 != -1) {
                                                          dispatch_once(&qword_1009F8080, &stru_1009B44E8);
                                                        }
                                                        (*(void (**)(void *, std::string *, __n128 *))(*(void *)off_1009F8078 + 56))(off_1009F8078, &v556, &v543);
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                  }
                                                  v326 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v326, OS_LOG_TYPE_DEBUG))
                                                  {
                                                    v550[0].__r_.__value_.__r.__words[0] = v458 | 0x1000000000;
                                                    LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 2096;
                                                    *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1]
                                                                              + 2) = (std::string::size_type)&v545;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1040;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = 16;
                                                    LOWORD(v550[1].__r_.__value_.__l.__data_) = 2096;
                                                    *(std::string::size_type *)((char *)v550[1].__r_.__value_.__r.__words
                                                                              + 2) = (std::string::size_type)&v544;
                                                    _os_log_debug_impl((void *)&_mh_execute_header, v326, OS_LOG_TYPE_DEBUG, "Cloud keys AccKeyPtr %.16P, HintPtr %.16P", (uint8_t *)v550, 0x22u);
                                                  }

                                                  __n128 v543 = 0uLL;
                                                  long long v542 = 0uLL;
                                                  id v327 = [(id)v484 ratchet];
                                                  int v328 = atol((const char *)[v327 UTF8String]);

                                                  id v329 = [(id)v484 irk];
                                                  __n128 v543 = *(__n128 *)[v329 bytes];

                                                  id v330 = [(id)v484 encryptionKey];
                                                  long long v542 = *(_OWORD *)[v330 bytes];

                                                  for (int k = 0; k != 31; ++k)
                                                  {
                                                    v332 = [(id)v484 supportedServices];
                                                    BOOL v333 = ((unint64_t)[v332 integerValue] & (1 << k)) == 0;

                                                    if (!v333)
                                                    {
                                                      v334 = (id)qword_100A19ED8;
                                                      if (os_log_type_enabled(v334, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v335 = v557;
                                                        if (SHIBYTE(v557[2]) < 0) {
                                                          v335 = (void **)v557[0];
                                                        }
                                                        LODWORD(v550[0].__r_.__value_.__l.__data_) = v471;
                                                        *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v335;
                                                        WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                        *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = 1 << k;
                                                        _os_log_impl((void *)&_mh_execute_header, v334, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Paired Device with address: %s, ServiceID: %d", (uint8_t *)v550, 0x12u);
                                                      }

                                                      v556.__r_.__value_.__r.__words[0] = 0;
                                                      *(_OWORD *)&v550[0].__r_.__value_.__l.__data_ = 0uLL;
                                                      sub_100026C30((uint64_t)&v556);
                                                      v550[0].__r_.__value_.__r.__words[0] = SLODWORD(v556.__r_.__value_.__l.__data_);
                                                      v550[0].__r_.__value_.__l.__size_ = SWORD2(v556.__r_.__value_.__r.__words[0]);
                                                      sub_100477F4C(v482, 1 << k, 4, v550, 0);
                                                    }
                                                  }
                                                  v336 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v336, OS_LOG_TYPE_DEBUG))
                                                  {
                                                    v550[0].__r_.__value_.__r.__words[0] = v457 | 0x1000000000;
                                                    LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 2096;
                                                    *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1]
                                                                              + 2) = (std::string::size_type)&v543;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1040;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = 16;
                                                    LOWORD(v550[1].__r_.__value_.__l.__data_) = 2096;
                                                    *(std::string::size_type *)((char *)v550[1].__r_.__value_.__r.__words
                                                                              + 2) = (std::string::size_type)&v542;
                                                    WORD1(v550[1].__r_.__value_.__r.__words[1]) = 1024;
                                                    HIDWORD(v550[1].__r_.__value_.__r.__words[1]) = v328;
                                                    _os_log_debug_impl((void *)&_mh_execute_header, v336, OS_LOG_TYPE_DEBUG, "Cloud IRK %.16P, EncKey %.16P, Ratchet: %d", (uint8_t *)v550, 0x28u);
                                                  }

                                                  if (qword_1009F8080 != -1) {
                                                    dispatch_once(&qword_1009F8080, &stru_1009B44E8);
                                                  }
                                                  v337 = sub_1004979F4((uint64_t)off_1009F8078, v482);
                                                  v338 = (id)qword_100A19ED8;
                                                  BOOL v339 = os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT);
                                                  if (!v337)
                                                  {
                                                    if (v339)
                                                    {
                                                      v342 = v557;
                                                      if (SHIBYTE(v557[2]) < 0) {
                                                        v342 = (void **)v557[0];
                                                      }
                                                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v469;
                                                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v342;
                                                      _os_log_impl((void *)&_mh_execute_header, v338, OS_LOG_TYPE_DEFAULT, "Cloud: Create new Magic Paired Device with address: %s", (uint8_t *)v550, 0xCu);
                                                    }

                                                    operator new();
                                                  }
                                                  if (v339)
                                                  {
                                                    v340 = v557;
                                                    if (SHIBYTE(v557[2]) < 0) {
                                                      v340 = (void **)v557[0];
                                                    }
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v469;
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v340;
                                                    _os_log_impl((void *)&_mh_execute_header, v338, OS_LOG_TYPE_DEFAULT, "Cloud: Update new Magic Paired Device with address: %s", (uint8_t *)v550, 0xCu);
                                                  }

                                                  long long v341 = v544;
                                                  *(_OWORD *)(v337 + 5) = v545;
                                                  *(_OWORD *)(v337 + 7) = v341;
                                                  if (v328) {
                                                    *((_DWORD *)v337 + 18) = v328;
                                                  }
                                                  sub_10049B328(v337, &v543);
                                                  *(_OWORD *)(v337 + 3) = v542;
                                                  if (qword_1009F8080 != -1) {
                                                    dispatch_once(&qword_1009F8080, &stru_1009B44E8);
                                                  }
                                                  sub_10049C104((uint64_t)off_1009F8078, (uint64_t)v337);
                                                  v343 = [(id)v484 settingsMask];
                                                  LODWORD(v465) = [v343 intValue];

                                                  v344 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v344, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v461;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = v465;
                                                    _os_log_impl((void *)&_mh_execute_header, v344, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved settings mask from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  v345 = [(id)v484 color];
                                                  LODWORD(v462) = [v345 intValue];

                                                  v346 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v346, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v461;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = v462;
                                                    _os_log_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved color from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  v347 = [(id)v484 listeningServices];
                                                  *(void *)&long long v477 = [v347 integerValue];

                                                  v348 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v348, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v461;
                                                    int v460 = (unsigned __int16)v477;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = (unsigned __int16)v477;
                                                    _os_log_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved listening services from cloud: %d", (uint8_t *)v550, 8u);
                                                  }
                                                  else
                                                  {
                                                    int v460 = (unsigned __int16)v477;
                                                  }

                                                  LODWORD(v463) = (v477 >> 7) & 7;
                                                  v349 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v349, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v463, v461);
                                                    _os_log_impl((void *)&_mh_execute_header, v349, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved listening services V1 from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  v350 = [(id)v484 listeningServicesV2];
                                                  id v467 = [v350 integerValue];

                                                  v351 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v467, v461);
                                                    _os_log_impl((void *)&_mh_execute_header, v351, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved listening services V2 from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  if ((v477 & 2) != 0 && !sub_10047ECFC(v482))
                                                  {
                                                    v352 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v352, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      v550[0].__r_.__value_.__r.__words[0] = v461 | 0x100000000;
                                                      _os_log_impl((void *)&_mh_execute_header, v352, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved GAPA from cloud: %d", (uint8_t *)v550, 8u);
                                                    }

                                                    sub_10047ED44(v482, 1, 1);
                                                  }
                                                  v353 = [(id)v484 buttonModes];
                                                  unsigned __int8 v354 = [v353 intValue];

                                                  v355 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v355, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v461;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = v354;
                                                    _os_log_impl((void *)&_mh_execute_header, v355, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved button Modes from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  int v356 = v354 & 0xF | (v354 >> 4 << 8);
                                                  v357 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v357, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v461;
                                                    v550[0].__r_.__value_.__s.__data_[4] = v354 & 0xF;
                                                    v550[0].__r_.__value_.__s.__data_[5] = v354 >> 4;
                                                    _os_log_impl((void *)&_mh_execute_header, v357, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved double tap from cloud: %d", (uint8_t *)v550, 8u);
                                                  }

                                                  if (qword_1009F80A0 != -1) {
                                                    dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                  }
                                                  int v358 = sub_10028F788((uint64_t)off_1009F8098, v482, v354 & 0xF | ((v354 >> 4) << 8), (v465 >> 4) & 1);
                                                  int v359 = v354 >> 4;
                                                  if (v356 == v358) {
                                                    unsigned int v360 = v354 & 0xF;
                                                  }
                                                  else {
                                                    unsigned int v360 = v358;
                                                  }
                                                  if (v356 == v358) {
                                                    unsigned int v361 = v359;
                                                  }
                                                  else {
                                                    unsigned int v361 = BYTE1(v358);
                                                  }
                                                  if (sub_10047C698(v482) != v358)
                                                  {
                                                    v362 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v362, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
                                                      _os_log_impl((void *)&_mh_execute_header, v362, OS_LOG_TYPE_DEFAULT, "Cloud: Updating double tap settings from cloud", (uint8_t *)v550, 2u);
                                                    }

                                                    if ((v465 & 8) != 0)
                                                    {
                                                      if (qword_1009F80A0 != -1) {
                                                        dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                      }
                                                      sub_100291AC0((uint64_t)off_1009F8098, v482, v361, v360, 4);
                                                    }
                                                  }
                                                  if ((v465 & 3) == 2) {
                                                    uint64_t v363 = 2;
                                                  }
                                                  else {
                                                    uint64_t v363 = (v465 & 3) == 1;
                                                  }
                                                  if (sub_10048741C(v482) != v363)
                                                  {
                                                    if (qword_1009F80A0 != -1) {
                                                      dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                    }
                                                    sub_1002917DC((uint64_t)off_1009F8098, v482, v363, 4u);
                                                  }
                                                  if ((_BYTE)v462)
                                                  {
                                                    sub_100489294(v482, v462);
                                                    v364 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v364, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_100474E18(v482, v550);
                                                      int v365 = SHIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                                      std::string::size_type v366 = v550[0].__r_.__value_.__r.__words[0];
                                                      int v367 = sub_100489318(v482);
                                                      LODWORD(v556.__r_.__value_.__l.__data_) = v459;
                                                      v368 = v550;
                                                      if (v365 < 0) {
                                                        v368 = (std::string *)v366;
                                                      }
                                                      *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v368;
                                                      WORD2(v556.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = v367;
                                                      _os_log_impl((void *)&_mh_execute_header, v364, OS_LOG_TYPE_DEFAULT, "Cloud: Color info updated for device %{public}s ,color code %d", (uint8_t *)&v556, 0x12u);
                                                      if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                        operator delete(v550[0].__r_.__value_.__l.__data_);
                                                      }
                                                    }
                                                  }
                                                  unsigned int v369 = v465 & 4;
                                                  v370 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v370, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_100474E18(v482, &v556);
                                                    int v371 = SHIBYTE(v556.__r_.__value_.__r.__words[2]);
                                                    std::string::size_type v372 = v556.__r_.__value_.__r.__words[0];
                                                    int v373 = sub_100487464(v482);
                                                    v374 = &v556;
                                                    if (v371 < 0) {
                                                      v374 = (std::string *)v372;
                                                    }
                                                    if ((v465 & 4) != 0) {
                                                      v375 = "Enabled";
                                                    }
                                                    else {
                                                      v375 = "Disabled";
                                                    }
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v374;
                                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2080;
                                                    if (v373) {
                                                      v376 = "Enabled";
                                                    }
                                                    else {
                                                      v376 = "Disabled";
                                                    }
                                                    *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1]
                                                                              + 6) = (std::string::size_type)v375;
                                                    HIWORD(v550[0].__r_.__value_.__r.__words[2]) = 2080;
                                                    v550[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v376;
                                                    _os_log_impl((void *)&_mh_execute_header, v370, OS_LOG_TYPE_DEFAULT, "Cloud: In Ear Detection state update from cloud for device %{public}s is %s, local state %s", (uint8_t *)v550, 0x20u);
                                                    if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v556.__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  if (sub_100487464(v482) != v369 >> 2)
                                                  {
                                                    if (qword_1009F80A0 != -1) {
                                                      dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                    }
                                                    sub_100291D0C((uint64_t)off_1009F8098, v482, v369 != 0, 4u);
                                                  }
                                                  v377 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v377, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_100474E18(v482, v550);
                                                    v378 = v550;
                                                    if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                                      v378 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                                    }
                                                    LODWORD(v556.__r_.__value_.__l.__data_) = v459;
                                                    *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v378;
                                                    WORD2(v556.__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = v460;
                                                    _os_log_impl((void *)&_mh_execute_header, v377, OS_LOG_TYPE_DEFAULT, "Cloud: Update listening mode services for device %{public}s with service - %d", (uint8_t *)&v556, 0x12u);
                                                    if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v550[0].__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  unsigned int v379 = (v477 >> 10) & 7;
                                                  uint64_t v380 = v379 | ((unsigned __int16)v477 >> 13 << 8);
                                                  v381 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v381, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_100474E18(v482, &v556);
                                                    int v382 = SHIBYTE(v556.__r_.__value_.__r.__words[2]);
                                                    std::string::size_type v383 = v556.__r_.__value_.__r.__words[0];
                                                    int v384 = sub_100487714(v482);
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                    v385 = &v556;
                                                    if (v382 < 0) {
                                                      v385 = (std::string *)v383;
                                                    }
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v385;
                                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v384;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = v379 | ((unsigned __int16)v477 >> 13 << 8);
                                                    _os_log_impl((void *)&_mh_execute_header, v381, OS_LOG_TYPE_DEFAULT, "Cloud: Click Hold mode info update for device %{public}s, current value: %d, cloud value %d", (uint8_t *)v550, 0x18u);
                                                    if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v556.__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  if ((unsigned __int16)v477 >> 13
                                                    && v379
                                                    && sub_100487714(v482) != v380
                                                    && (sub_100478B2C(v482, 38) & 1) == 0)
                                                  {
                                                    if (qword_1009F80A0 != -1) {
                                                      dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                    }
                                                    sub_1002859A4((uint64_t)off_1009F8098, v482, 22, v380, 4u);
                                                    v386 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v386, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_100474E18(v482, v550);
                                                      int v445 = SHIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                                      std::string::size_type v446 = v550[0].__r_.__value_.__r.__words[0];
                                                      int v447 = sub_100487714(v482);
                                                      LODWORD(v556.__r_.__value_.__l.__data_) = v459;
                                                      v448 = v550;
                                                      if (v445 < 0) {
                                                        v448 = (std::string *)v446;
                                                      }
                                                      *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v448;
                                                      WORD2(v556.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = v447;
                                                      _os_log_impl((void *)&_mh_execute_header, v386, OS_LOG_TYPE_DEFAULT, "Cloud: Click Hold mode info updated for device %{public}s, new mode %d", (uint8_t *)&v556, 0x12u);
                                                      if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                        operator delete(v550[0].__r_.__value_.__l.__data_);
                                                      }
                                                    }
LABEL_666:
                                                  }
                                                  else if (!((unsigned __int16)v477 >> 13) || !v379)
                                                  {
                                                    v386 = &_os_log_default;
                                                    id v387 = &_os_log_default;
                                                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                                                    {
                                                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v456;
                                                      HIDWORD(v550[0].__r_.__value_.__r.__words[0]) = (unsigned __int16)v477 >> 13;
                                                      LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 2) = (v477 >> 10) & 7;
                                                      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "CloudPairing: Unknown value caught for Press and Hold configs. Left: %d, Right %d", (uint8_t *)v550, 0xEu);
                                                    }
                                                    goto LABEL_666;
                                                  }
                                                  v388 = (id)qword_100A19ED8;
                                                  BOOL v389 = os_log_type_enabled(v388, OS_LOG_TYPE_DEFAULT);
                                                  if (v467 && (v467 & 7) == v463)
                                                  {
                                                    if (v389)
                                                    {
                                                      sub_100474E18(v482, &v556);
                                                      int v390 = SHIBYTE(v556.__r_.__value_.__r.__words[2]);
                                                      std::string::size_type v391 = v556.__r_.__value_.__r.__words[0];
                                                      int v392 = sub_1004875AC(v482);
                                                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                      v393 = &v556;
                                                      if (v390 < 0) {
                                                        v393 = (std::string *)v391;
                                                      }
                                                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v393;
                                                      WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v392;
                                                      WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                      HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = v467;
                                                      _os_log_impl((void *)&_mh_execute_header, v388, OS_LOG_TYPE_DEFAULT, "Cloud: Listening mode config update is from new services layer for device %{public}s, current value: %d, cloud configs(LSv2): %d", (uint8_t *)v550, 0x18u);
                                                      if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                        operator delete(v556.__r_.__value_.__l.__data_);
                                                      }
                                                    }

                                                    goto LABEL_682;
                                                  }
                                                  if (v389)
                                                  {
                                                    sub_100474E18(v482, &v556);
                                                    v394 = (v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                                                         ? &v556
                                                         : (std::string *)v556.__r_.__value_.__r.__words[0];
                                                    int v395 = sub_1004875AC(v482);
                                                    int v396 = sub_1004875AC(v482);
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v394;
                                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v395;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = v396 | v463;
                                                    _os_log_impl((void *)&_mh_execute_header, v388, OS_LOG_TYPE_DEFAULT, "Cloud: Listening mode config update for device %{public}s, current value: %d, cloud configs(+adaptive support): %d", (uint8_t *)v550, 0x18u);
                                                    if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v556.__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  id v467 = (id)(sub_1004875AC(v482) | v463);
                                                  if (v467)
                                                  {
LABEL_682:
                                                    if (sub_1004875AC(v482) != v467)
                                                    {
                                                      if (qword_1009F80A0 != -1) {
                                                        dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                      }
                                                      sub_1002859A4((uint64_t)off_1009F8098, v482, 26, (uint64_t)v467, 4u);
                                                      v397 = (id)qword_100A19ED8;
                                                      if (os_log_type_enabled(v397, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        sub_100474E18(v482, v550);
                                                        int v398 = SHIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                                        std::string::size_type v399 = v550[0].__r_.__value_.__r.__words[0];
                                                        int v400 = sub_1004875AC(v482);
                                                        LODWORD(v556.__r_.__value_.__l.__data_) = v459;
                                                        v401 = v550;
                                                        if (v398 < 0) {
                                                          v401 = (std::string *)v399;
                                                        }
                                                        *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v401;
                                                        WORD2(v556.__r_.__value_.__r.__words[1]) = 1024;
                                                        *(_DWORD *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = v400;
                                                        _os_log_impl((void *)&_mh_execute_header, v397, OS_LOG_TYPE_DEFAULT, "Cloud: Listening mode config updated for device %{public}s, new configs %d", (uint8_t *)&v556, 0x12u);
                                                        if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                          operator delete(v550[0].__r_.__value_.__l.__data_);
                                                        }
                                                      }
                                                    }
                                                  }
                                                  uint64_t v402 = (v477 >> 2) & 3;
                                                  v403 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v403, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_100474E18(v482, &v556);
                                                    int v404 = SHIBYTE(v556.__r_.__value_.__r.__words[2]);
                                                    std::string::size_type v405 = v556.__r_.__value_.__r.__words[0];
                                                    int v406 = sub_1004877EC(v482);
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                    v407 = &v556;
                                                    if (v404 < 0) {
                                                      v407 = (std::string *)v405;
                                                    }
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v407;
                                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v406;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = (v477 >> 2) & 3;
                                                    _os_log_impl((void *)&_mh_execute_header, v403, OS_LOG_TYPE_DEFAULT, "Cloud: One Bud ANC mode update for device %{public}s, current value: %d, cloud value %d", (uint8_t *)v550, 0x18u);
                                                    if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v556.__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  char v408 = sub_100478B2C(v482, 43);
                                                  if (v402) {
                                                    char v409 = v408;
                                                  }
                                                  else {
                                                    char v409 = 1;
                                                  }
                                                  if ((v409 & 1) == 0
                                                    && sub_1004877EC(v482) != v402)
                                                  {
                                                    if (qword_1009F80A0 != -1) {
                                                      dispatch_once(&qword_1009F80A0, &stru_1009B4508);
                                                    }
                                                    sub_1002859A4((uint64_t)off_1009F8098, v482, 27, v402, 4u);
                                                    v410 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_100474E18(v482, v550);
                                                      int v411 = SHIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                                                      std::string::size_type v412 = v550[0].__r_.__value_.__r.__words[0];
                                                      int v413 = sub_1004877EC(v482);
                                                      LODWORD(v556.__r_.__value_.__l.__data_) = v459;
                                                      v414 = v550;
                                                      if (v411 < 0) {
                                                        v414 = (std::string *)v412;
                                                      }
                                                      *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v414;
                                                      WORD2(v556.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v556.__r_.__value_.__r.__words[1] + 6) = v413;
                                                      _os_log_impl((void *)&_mh_execute_header, v410, OS_LOG_TYPE_DEFAULT, "Cloud: One Bud ANC mode updated for device %{public}s, new mode %d", (uint8_t *)&v556, 0x12u);
                                                      if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                                        operator delete(v550[0].__r_.__value_.__l.__data_);
                                                      }
                                                    }
                                                  }
                                                  if (sub_100478B2C(v482, 32)
                                                    && !sub_1004874AC(v482))
                                                  {
                                                    v415 = (id)qword_100A19ED8;
                                                    if (os_log_type_enabled(v415, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_100474E18(v482, &v556);
                                                      if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                                        v416 = &v556;
                                                      }
                                                      else {
                                                        v416 = (std::string *)v556.__r_.__value_.__r.__words[0];
                                                      }
                                                      int v417 = sub_100478B2C(v482, 32);
                                                      int v418 = sub_1004874AC(v482);
                                                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                      v419 = "No";
                                                      if (v417) {
                                                        v419 = "Yes";
                                                      }
                                                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v416;
                                                      WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2080;
                                                      *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1]
                                                                                + 6) = (std::string::size_type)v419;
                                                      HIWORD(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                      LODWORD(v550[1].__r_.__value_.__l.__data_) = v418;
                                                      _os_log_impl((void *)&_mh_execute_header, v415, OS_LOG_TYPE_DEFAULT, "Cloud: %{public}s Initialize setSmartRouteMode via cloud Tipi Support = %s current SR Mode =%d", (uint8_t *)v550, 0x1Cu);
                                                      if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                        operator delete(v556.__r_.__value_.__l.__data_);
                                                      }
                                                    }

                                                    sub_100484DC4(v482, 1);
                                                  }
                                                  v420 = (id)qword_100A19ED8;
                                                  if (os_log_type_enabled(v420, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_100474E18(v482, &v556);
                                                    int v421 = SHIBYTE(v556.__r_.__value_.__r.__words[2]);
                                                    std::string::size_type v422 = v556.__r_.__value_.__r.__words[0];
                                                    int v423 = sub_100478B2C(v482, 32);
                                                    LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                                    v424 = &v556;
                                                    if (v421 < 0) {
                                                      v424 = (std::string *)v422;
                                                    }
                                                    *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v424;
                                                    WORD2(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = v423;
                                                    WORD1(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v550[0].__r_.__value_.__r.__words[2]) = (v477 & 0x40) >> 6;
                                                    _os_log_impl((void *)&_mh_execute_header, v420, OS_LOG_TYPE_DEFAULT, "Cloud: TiPi supported flag update from listeningServices mask %{public}s, current local value: %d, listeningServices mask value: %d", (uint8_t *)v550, 0x18u);
                                                    if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                                      operator delete(v556.__r_.__value_.__l.__data_);
                                                    }
                                                  }

                                                  if ((v477 & 0x40) != 0 && (sub_100478B2C(v482, 32) & 1) == 0)
                                                  {
                                                    sub_10047D50C(v482, 32, 1);
                                                    if (!sub_1004874AC(v482)) {
                                                      sub_100484DC4(v482, 1);
                                                    }
                                                  }
                                                }
                                              }
                                              else
                                              {
                                              }
                                            }
                                            else
                                            {
                                            }
                                          }
                                          else
                                          {
                                          }
                                        }
                                        else
                                        {
                                        }
                                      }
                                      else
                                      {
                                      }
                                    }
                                    else
                                    {
                                    }
                                  }
                                  else
                                  {
                                  }
                                }
                                else
                                {
                                }
                              }
                              else
                              {
                              }
                              if (_os_feature_enabled_impl()
                                && NSClassFromString(@"PowerUISmartChargeClientAudioAccessories"))
                              {
                                v425 = (id)qword_100A19ED8;
                                if (os_log_type_enabled(v425, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_100474E18(v482, &v556);
                                  v426 = (v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                                       ? &v556
                                       : (std::string *)v556.__r_.__value_.__r.__words[0];
                                  v427 = [(id)v484 optimizedBatteryCharging];
                                  v428 = [(id)v484 optimizedBatteryFullChargeDeadline];
                                  LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                  *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v426;
                                  WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2112;
                                  *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v427;
                                  HIWORD(v550[0].__r_.__value_.__r.__words[2]) = 2112;
                                  v550[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v428;
                                  _os_log_impl((void *)&_mh_execute_header, v425, OS_LOG_TYPE_DEFAULT, "Cloud: OBC PowerUI values updated for device %{public}s, optimizedBatteryCharging %@, optimizedBatteryFullChargeDeadline %@", (uint8_t *)v550, 0x20u);

                                  if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v556.__r_.__value_.__l.__data_);
                                  }
                                }

                                v429 = [(id)v484 optimizedBatteryCharging];
                                BOOL v430 = [v429 length] == 0;

                                if (!v430)
                                {
                                  v431 = [(id)v484 optimizedBatteryCharging];
                                  id v432 = [v431 longLongValue];

                                  sub_1004895D0(v482, (uint64_t)v432);
                                  [(CloudPairing *)self audioAccessorySmartChargeStatusHasChangedFromCloud:(void)v482];
                                }
                                v433 = [(id)v484 optimizedBatteryFullChargeDeadline];
                                BOOL v434 = [v433 length] == 0;

                                if (!v434)
                                {
                                  *(void *)&long long v477 = objc_alloc_init((Class)NSDateFormatter);
                                  v435 = +[NSTimeZone localTimeZone];
                                  [(id)v477 setTimeZone:v435];

                                  [(id)v477 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZZ"];
                                  v436 = [(id)v484 optimizedBatteryFullChargeDeadline];
                                  v437 = [(id)v477 dateFromString:v436];

                                  id v438 = [objc_alloc((Class)PowerUISmartChargeClientAudioAccessories) initWithClientName:@"com.apple.bluetooth"];
                                  v439 = [(id)v484 bluetoothAddress];
                                  id v485 = 0;
                                  v440 = [v438 unfilteredDeadlineForDevice:v439 withError:&v485];
                                  id v441 = v485;

                                  if (v440 && ([v437 timeIntervalSinceDate:v440], v442 <= 0.0))
                                  {
                                    v443 = (id)qword_100A19ED8;
                                    if (os_log_type_enabled(v443, OS_LOG_TYPE_INFO))
                                    {
                                      sub_100474E18(v482, &v556);
                                      v444 = &v556;
                                      if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                        v444 = (std::string *)v556.__r_.__value_.__r.__words[0];
                                      }
                                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v472;
                                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v444;
                                      WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2112;
                                      *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v437;
                                      HIWORD(v550[0].__r_.__value_.__r.__words[2]) = 2112;
                                      v550[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v440;
                                      _os_log_impl((void *)&_mh_execute_header, v443, OS_LOG_TYPE_INFO, "Cloud: Skip OBC PowerUI values updated for device %{public}s with older deadline %@ to keep newer deadline %@", (uint8_t *)v550, 0x20u);
                                      if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                        operator delete(v556.__r_.__value_.__l.__data_);
                                      }
                                    }
                                  }
                                  else
                                  {
                                    sub_1004896B4(v482, v437);
                                    [(CloudPairing *)self audioAccessorySmartChargeDeadlineHasChangedFromCloud:(void)v482];
                                  }
                                }
                              }
LABEL_750:
                              if (SHIBYTE(v557[2]) < 0) {
                                operator delete(v557[0]);
                              }
                              goto LABEL_752;
                            }
                            uint64_t v274 = 1;
                            while (v274 != 6)
                            {
                              if (*((unsigned __int8 *)&v495 + v274++))
                              {
                                if ((unint64_t)(v274 - 2) < 5) {
                                  goto LABEL_423;
                                }
                                break;
                              }
                            }
                          }
                          if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR)) {
                            sub_100777C6C(&v493, (unsigned char *)v476);
                          }
                          goto LABEL_750;
                        }
LABEL_752:
                        *(void *)&long long v483 = v483 + 1;
                      }
                      while ((std::string *)v483 != v481);
                      v449 = (std::string *)[(id)v479 countByEnumeratingWithState:&v497 objects:v546 count:16];
                      v481 = v449;
                      if (!v449)
                      {
LABEL_762:

                        break;
                      }
                    }
                  }
                }
              }
              goto LABEL_117;
            }
            uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
            v222 = qword_100A19E60;
            if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v550[0].__r_.__value_.__l.__data_) = 0;
              _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_DEFAULT, "Devices magic info removed", (uint8_t *)v550, 2u);
            }
            if (!sub_10037345C()) {
              goto LABEL_117;
            }
            unsigned int v223 = [(CloudPairing *)self iCloudSignedIn];
            unsigned int v224 = v12 ? v223 : 0;
            if (v224 != 1) {
              goto LABEL_117;
            }
            v481 = [v12 objectForKeyedSubscript:@"records"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v549[0] = objc_opt_class();
              v549[1] = objc_opt_class();
              v549[2] = objc_opt_class();
              v225 = +[NSArray arrayWithObjects:v549 count:3];
              v226 = +[NSSet setWithArray:v225];
              *(void *)&long long v479 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v226 fromData:v481 error:0];

              if ((void)v479)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v503 = 0u;
                  long long v504 = 0u;
                  long long v501 = 0u;
                  long long v502 = 0u;
                  *(void *)&long long v484 = (id)v479;
                  id v227 = [(id)v484 countByEnumeratingWithState:&v501 objects:v548 count:16];
                  if (!v227) {
                    goto LABEL_394;
                  }
                  uint64_t v229 = *(void *)v502;
                  *(void *)&long long v228 = 138412290;
                  long long v483 = v228;
                  *(void *)&long long v228 = 136446210;
                  long long v482 = v228;
                  *(void *)&long long v228 = 136315138;
                  long long v480 = v228;
                  while (1)
                  {
                    v230 = 0;
                    do
                    {
                      if (*(void *)v502 != v229) {
                        objc_enumerationMutation((id)v484);
                      }
                      v231 = *(void **)(*((void *)&v501 + 1) + 8 * (void)v230);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v232 = qword_100A19ED8;
                        if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(v550[0].__r_.__value_.__l.__data_) = v483;
                          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v231;
                          _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_DEFAULT, "Device magic Info to be removed: %@", (uint8_t *)v550, 0xCu);
                        }
                        WORD2(v545) = 0;
                        LODWORD(v545) = 0;
                        memset(v550, 0, 24);
                        id v233 = [v231 bluetoothAddress];
                        sub_10004191C(v550, (char *)[v233 UTF8String]);

                        if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                          v234 = v550;
                        }
                        else {
                          v234 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                        }
                        if (sub_1004A82DC((uint64_t)&v545, (unsigned __int8 *)v234))
                        {
                          if ((_BYTE)v545)
                          {
LABEL_363:
                            if (qword_1009F7F00 != -1) {
                              dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
                            }
                            v235 = (unsigned __int8 *)sub_1004AA194((uint64_t)off_1009F7EF8, (uint64_t)&v545, 0);
                            if (v235)
                            {
                              if (qword_1009F8080 != -1) {
                                dispatch_once(&qword_1009F8080, &stru_1009B44E8);
                              }
                              v236 = sub_1004979F4((uint64_t)off_1009F8078, (uint64_t)v235);
                              v237 = (id)qword_100A19ED8;
                              v238 = v237;
                              if (v236)
                              {
                                if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_100474E18((uint64_t)v235, v557);
                                  v239 = v557;
                                  if (SHIBYTE(v557[2]) < 0) {
                                    v239 = (void **)v557[0];
                                  }
                                  LODWORD(v556.__r_.__value_.__l.__data_) = v482;
                                  *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v239;
                                  _os_log_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEFAULT, "Remove magic paired device: %{public}s", (uint8_t *)&v556, 0xCu);
                                  if (SHIBYTE(v557[2]) < 0) {
                                    operator delete(v557[0]);
                                  }
                                }

                                if (qword_1009F8080 != -1) {
                                  dispatch_once(&qword_1009F8080, &stru_1009B44E8);
                                }
                                sub_100497B20((uint64_t)off_1009F8078, v235, 0);
                              }
                              else
                              {
                                if (os_log_type_enabled(v237, OS_LOG_TYPE_INFO))
                                {
                                  sub_100474E18((uint64_t)v235, v557);
                                  v243 = v557;
                                  if (SHIBYTE(v557[2]) < 0) {
                                    v243 = (void **)v557[0];
                                  }
                                  LODWORD(v556.__r_.__value_.__l.__data_) = v482;
                                  *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v243;
                                  _os_log_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_INFO, "Cannot find magic paired device to remove: %{public}s", (uint8_t *)&v556, 0xCu);
                                  if (SHIBYTE(v557[2]) < 0) {
                                    operator delete(v557[0]);
                                  }
                                }
                              }
                            }
LABEL_383:
                            if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                              operator delete(v550[0].__r_.__value_.__l.__data_);
                            }
                            goto LABEL_385;
                          }
                          uint64_t v240 = 1;
                          while (v240 != 6)
                          {
                            if (v546[v240++ - 16])
                            {
                              if ((unint64_t)(v240 - 2) < 5) {
                                goto LABEL_363;
                              }
                              break;
                            }
                          }
                        }
                        v242 = qword_100A19ED8;
                        if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v557[0]) = v480;
                          *(void **)((char *)v557 + 4) = v234;
                          _os_log_error_impl((void *)&_mh_execute_header, v242, OS_LOG_TYPE_ERROR, "Received invalid device address for device record: %s", (uint8_t *)v557, 0xCu);
                        }
                        goto LABEL_383;
                      }
LABEL_385:
                      v230 = (char *)v230 + 1;
                    }
                    while (v230 != v227);
                    id v244 = [(id)v484 countByEnumeratingWithState:&v501 objects:v548 count:16];
                    id v227 = v244;
                    if (!v244)
                    {
LABEL_394:

                      break;
                    }
                  }
                }
              }
            }
            goto LABEL_117;
          }
          uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
          v191 = (id)qword_100A19ED8;
          if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
          {
            id v192 = [v12 debugDescription];
            id v193 = [v192 UTF8String];
            LODWORD(v550[0].__r_.__value_.__l.__data_) = 136446210;
            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v193;
            _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, "Device support info updated from cloudkit = %{public}s", (uint8_t *)v550, 0xCu);
          }
          if (!sub_10037345C() || !v12) {
            goto LABEL_117;
          }
          *(void *)&long long v473 = [v12 objectForKeyedSubscript:@"records"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v553[0] = objc_opt_class();
            v553[1] = objc_opt_class();
            v553[2] = objc_opt_class();
            v194 = +[NSArray arrayWithObjects:v553 count:3];
            v195 = +[NSSet setWithArray:v194];
            *(void *)&long long v472 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v195 fromData:(void)v473 error:0];

            if ((void)v472)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v511 = 0u;
                long long v512 = 0u;
                long long v509 = 0u;
                long long v510 = 0u;
                *(void *)&long long v482 = (id)v472;
                *(void *)&long long v484 = [(id)v482 countByEnumeratingWithState:&v509 objects:v552 count:16];
                if (!(void)v484) {
                  goto LABEL_337;
                }
                *(void *)&long long v477 = v508;
                v481 = (std::string *)&v550[1].__r_.__value_.__r.__words[1];
                *(void *)&long long v483 = *(void *)v510;
                *(void *)&long long v475 = (char *)&v545 + 1;
                *(void *)&long long v476 = (char *)v556.__r_.__value_.__r.__words + 1;
                *(void *)&long long v196 = 136446210;
                long long v474 = v196;
                while (1)
                {
                  uint64_t v197 = 0;
                  do
                  {
                    if (*(void *)v510 != (void)v483) {
                      objc_enumerationMutation((id)v482);
                    }
                    v198 = *(void **)(*((void *)&v509 + 1) + 8 * v197);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v199 = [v198 bluetoothAddress];
                      unint64_t v200 = sub_1006ADA24(v199);

                      if (v200)
                      {
                        if (qword_1009F7F00 != -1) {
                          dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
                        }
                        uint64_t v201 = sub_100030F10((uint64_t)off_1009F7EF8, v200, 0);
                        uint64_t v202 = v201;
                        if (v201)
                        {
                          if (*(unsigned char *)(v201 + 128))
                          {
LABEL_304:
                            v203 = (id)qword_100A19ED8;
                            if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
                            {
                              sub_100474E18(v202, v550);
                              v204 = v550;
                              if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                v204 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                              }
                              LODWORD(v557[0]) = v474;
                              *(void **)((char *)v557 + 4) = v204;
                              _os_log_impl((void *)&_mh_execute_header, v203, OS_LOG_TYPE_DEFAULT, "DeviceSupportInformationRecordsUpdated for %{public}s", (uint8_t *)v557, 0xCu);
                              if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v550[0].__r_.__value_.__l.__data_);
                              }
                            }

                            v205 = [(CloudPairing *)self cloudClient];
                            v206 = [v198 bluetoothAddress];
                            v507[0] = _NSConcreteStackBlock;
                            v507[1] = 3221225472;
                            v508[0] = sub_100537630;
                            v508[1] = &unk_1009AFCD8;
                            v508[3] = v202;
                            v508[2] = v198;
                            [v205 deviceRecord:v206 completion:v507];

                            v207 = [v198 ancAssetVersion];
                            LODWORD(v205) = (unint64_t)[v207 length] > 1;

                            if (v205)
                            {
                              id v208 = [v198 ancAssetVersion];
                              sub_10004191C(&v506, (char *)[v208 UTF8String]);
                              sub_10048068C(v202, &v506);
                              if (SHIBYTE(v506.__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v506.__r_.__value_.__l.__data_);
                              }
                            }
                            uint64_t v551 = 0;
                            memset(v550, 0, sizeof(v550));
                            sub_10004191C(v481, "");
                            sub_100480790(v202, (uint64_t)v550);
                            v209 = [v198 caseFirmwareVersion];
                            BOOL v210 = v209 == 0;

                            if (v210
                              || ([v198 caseFirmwareVersion],
                                  v211 = objc_claimAutoreleasedReturnValue(),
                                  id v212 = [v211 longLongValue],
                                  v211,
                                  !v212))
                            {
                              LODWORD(v480) = 0;
                            }
                            else
                            {
                              v550[0].__r_.__value_.__r.__words[2] = (std::string::size_type)v212;
                              LODWORD(v480) = 1;
                            }
                            v213 = [v198 caseName];
                            BOOL v214 = (unint64_t)[v213 length] > 1;

                            if (v214)
                            {
                              id v215 = [v198 caseName];
                              std::string::assign(v481, (const std::string::value_type *)[v215 UTF8String]);

LABEL_328:
                              char v219 = v550[0].__r_.__value_.__s.__data_[0];
                              LODWORD(v480) = *(unsigned __int16 *)&v550[0].__r_.__value_.__s.__data_[2];
                              int v220 = HIDWORD(v550[0].__r_.__value_.__r.__words[0]);
                              __int16 v221 = v550[0].__r_.__value_.__r.__words[1];
                              LODWORD(v479) = v550[0].__r_.__value_.__s.__data_[10];
                              *(void *)&long long v478 = *((void *)&v550[0].__r_.__value_.__l + 2);
                              if (SHIBYTE(v551) < 0) {
                                sub_10003B098(&v505, (void *)v550[1].__r_.__value_.__l.__size_, v550[1].__r_.__value_.__r.__words[2]);
                              }
                              else {
                                std::string v505 = *v481;
                              }
                              sub_100480824(v202, v219, v480, v220, v221, v479, v478, 0, &v505);
                              if (SHIBYTE(v505.__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v505.__r_.__value_.__l.__data_);
                              }
                            }
                            else if (v480)
                            {
                              goto LABEL_328;
                            }
                            if (SHIBYTE(v551) < 0) {
                              operator delete((void *)v550[1].__r_.__value_.__l.__size_);
                            }
                            goto LABEL_335;
                          }
                          unint64_t v216 = 0;
                          while (v216 != 5)
                          {
                            unint64_t v217 = v216;
                            if (*(unsigned __int8 *)(v201 + 129 + v216++))
                            {
                              if (v217 < 5) {
                                goto LABEL_304;
                              }
                              break;
                            }
                          }
                        }
                        if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR)) {
                          sub_100777C40(&v545, (unsigned char *)v475);
                        }
                      }
                      else if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR))
                      {
                        sub_100777C14(&v556, (unsigned char *)v476);
                      }
                    }
LABEL_335:
                    ++v197;
                  }
                  while (v197 != (void)v484);
                  *(void *)&long long v484 = [(id)v482 countByEnumeratingWithState:&v509 objects:v552 count:16];
                  if (!(void)v484)
                  {
LABEL_337:

                    break;
                  }
                }
              }
            }
          }
          goto LABEL_117;
        }
        uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
        v153 = (id)qword_100A19ED8;
        if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
        {
          id v154 = [v12 debugDescription];
          id v155 = [v154 UTF8String];
          LODWORD(v550[0].__r_.__value_.__l.__data_) = 141558275;
          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = 1752392040;
          WORD2(v550[0].__r_.__value_.__r.__words[1]) = 2081;
          *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v155;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, "Devices nickname info updated from cloudkit = %{private, mask.hash}s", (uint8_t *)v550, 0x16u);
        }
        if (!sub_10037345C() || !v12) {
          goto LABEL_117;
        }
        *(void *)&long long v478 = [v12 objectForKeyedSubscript:@"devices"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v559[0] = objc_opt_class();
          v559[1] = objc_opt_class();
          v559[2] = objc_opt_class();
          v156 = +[NSArray arrayWithObjects:v559 count:3];
          v157 = +[NSSet setWithArray:v156];
          *(void *)&long long v475 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v157 fromData:(void)v478 error:0];

          if ((void)v475)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v523 = 0u;
              long long v524 = 0u;
              long long v521 = 0u;
              long long v522 = 0u;
              v481 = (std::string *)(id)v475;
              *(void *)&long long v484 = unk_100A1E360(v481, "countByEnumeratingWithState:objects:count:", &v521, v558, 16);
              if (!(void)v484) {
                goto LABEL_279;
              }
              *(void *)&long long v483 = *(void *)v522;
              *(void *)&long long v158 = 136315138;
              long long v476 = v158;
              *(void *)&long long v158 = 67110146;
              long long v479 = v158;
              *(void *)&long long v158 = 67109890;
              long long v477 = v158;
              *(void *)&long long v158 = 136446210;
              long long v474 = v158;
              while (1)
              {
                uint64_t v159 = 0;
                do
                {
                  if (*(void *)v522 != (void)v483) {
                    objc_enumerationMutation(v481);
                  }
                  v160 = *(void **)(*((void *)&v521 + 1) + 8 * v159);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    WORD2(v544) = 0;
                    LODWORD(v544) = 0;
                    memset(v557, 0, sizeof(v557));
                    id v161 = [v160 bluetoothAddress];
                    sub_10004191C(v557, (char *)[v161 UTF8String]);

                    if (SHIBYTE(v557[2]) >= 0) {
                      v162 = (unsigned __int8 *)v557;
                    }
                    else {
                      v162 = (unsigned __int8 *)v557[0];
                    }
                    if (sub_1004A82DC((uint64_t)&v544, v162))
                    {
                      if ((_BYTE)v544)
                      {
LABEL_221:
                        if (qword_1009F7F00 != -1) {
                          dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
                        }
                        *(void *)&long long v482 = sub_1004AA194((uint64_t)off_1009F7EF8, (uint64_t)&v544, 0);
                        if ((void)v482)
                        {
                          uint64_t v163 = sub_10037345C();
                          id v164 = [v160 bluetoothAddress];
                          sub_10004191C(v519, (char *)[v164 UTF8String]);
                          id v165 = [v160 nickname];
                          sub_10004191C(v517, (char *)[v165 UTF8String]);
                          (*(void (**)(uint64_t, void **, void **))(*(void *)v163 + 176))(v163, v519, v517);
                          if (v518 < 0) {
                            operator delete(v517[0]);
                          }

                          if (v520 < 0) {
                            operator delete(v519[0]);
                          }

                          v543.n128_u32[0] = 1;
                          LODWORD(v542) = 0;
                          int v540 = 0;
                          unsigned int v495 = 0;
                          sub_10047B7A8(v482, &v495, &v542, &v540, &v543);
                          *(void *)&long long v480 = (id)qword_100A19ED8;
                          if (os_log_type_enabled((os_log_t)v480, OS_LOG_TYPE_DEFAULT))
                          {
                            unsigned int v166 = v542;
                            int v167 = v540;
                            unsigned int v168 = v495;
                            unsigned __int32 v169 = v543.n128_u32[0];
                            sub_100474E18(v482, &v556);
                            v170 = &v556;
                            if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                              v170 = (std::string *)v556.__r_.__value_.__r.__words[0];
                            }
                            v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v166, v479);
                            LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                            *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 2) = v167;
                            HIWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                            LODWORD(v550[0].__r_.__value_.__r.__words[2]) = v168;
                            WORD2(v550[0].__r_.__value_.__r.__words[2]) = 1024;
                            *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[2] + 6) = v169;
                            *(_WORD *)&v550[1].__r_.__value_.__s.__data_[2] = 2082;
                            *(std::string::size_type *)((char *)v550[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v170;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v480, OS_LOG_TYPE_DEFAULT, "Local Device ID; vid: %x, pid: %x, vidSrc: %d, version: %d for device: %{public}s",
                              (uint8_t *)v550,
                              0x24u);
                            if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                              operator delete(v556.__r_.__value_.__l.__data_);
                            }
                          }

                          v171 = [v160 vendorID];
                          int v172 = [v171 integerValue];

                          v173 = [v160 productID];
                          id v174 = [v173 integerValue];

                          if (v172 && v174)
                          {
                            if (v495 <= 1) {
                              int v175 = 1;
                            }
                            else {
                              int v175 = v495;
                            }
                            v176 = (id)qword_100A19ED8;
                            if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                            {
                              sub_100474E18(v482, &v556);
                              v177 = &v556;
                              if ((v556.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                v177 = (std::string *)v556.__r_.__value_.__r.__words[0];
                              }
                              v550[0].__r_.__value_.__r.__words[0] = __PAIR64__(v172, v477);
                              LOWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                              *(_DWORD *)((char *)&v550[0].__r_.__value_.__r.__words[1] + 2) = v174;
                              HIWORD(v550[0].__r_.__value_.__r.__words[1]) = 1024;
                              LODWORD(v550[0].__r_.__value_.__r.__words[2]) = v175;
                              WORD2(v550[0].__r_.__value_.__r.__words[2]) = 2082;
                              *(std::string::size_type *)((char *)&v550[0].__r_.__value_.__r.__words[2] + 6) = (std::string::size_type)v177;
                              _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "Updating Device ID from cloud; vid: %x, cloud pid: %x, vidSrc: %x for device: %{public}s",
                                (uint8_t *)v550,
                                0x1Eu);
                              if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v556.__r_.__value_.__l.__data_);
                              }
                            }

                            sub_10047C89C(v482, v175, v172, (int)v174, v543.n128_i32[0]);
                            sub_10047D63C(v482);
                          }
                          v178 = +[CBProductInfo productInfoWithProductID:v174];
                          v179 = [v178 productName];

                          if (v179
                            && ([v179 isEqualToString:@"Unknown"] & 1) == 0
                            && [v179 length])
                          {
                            sub_100475EE0(v482, (uint64_t)v550);
                            std::string::size_type v180 = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                            char v181 = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                            if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                              std::string::size_type v180 = v550[0].__r_.__value_.__l.__size_;
                            }
                            if (v180)
                            {
                              sub_100475EE0(v482, (uint64_t)&v556);
                              BOOL v182 = std::string::compare(&v556, (const std::string::value_type *)[v179 UTF8String]) != 0;
                              if (SHIBYTE(v556.__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v556.__r_.__value_.__l.__data_);
                              }
                              char v181 = HIBYTE(v550[0].__r_.__value_.__r.__words[2]);
                            }
                            else
                            {
                              BOOL v182 = 1;
                            }
                            if (v181 < 0) {
                              operator delete(v550[0].__r_.__value_.__l.__data_);
                            }
                            if (v182)
                            {
                              sub_10004191C(v550, (char *)[v179 utf8ValueSafe]);
                              *(void *)&long long v545 = 0;
                              *(_OWORD *)&v556.__r_.__value_.__l.__data_ = 0uLL;
                              sub_100026C30((uint64_t)&v545);
                              v556.__r_.__value_.__r.__words[0] = (int)v545;
                              v556.__r_.__value_.__l.__size_ = SWORD2(v545);
                              sub_100476E14(v482, (uint64_t)v550, &v556);
                              if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                operator delete(v550[0].__r_.__value_.__l.__data_);
                              }
                              v189 = (id)qword_100A19ED8;
                              if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                              {
                                sub_100474E18(v482, v550);
                                v190 = v550;
                                if ((v550[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                                  v190 = (std::string *)v550[0].__r_.__value_.__r.__words[0];
                                }
                                LODWORD(v556.__r_.__value_.__l.__data_) = v474;
                                *(std::string::size_type *)((char *)v556.__r_.__value_.__r.__words + 4) = (std::string::size_type)v190;
                                _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updated productname %{public}s", (uint8_t *)&v556, 0xCu);
                                if (SHIBYTE(v550[0].__r_.__value_.__r.__words[2]) < 0) {
                                  operator delete(v550[0].__r_.__value_.__l.__data_);
                                }
                              }
                            }
                          }

                          goto LABEL_275;
                        }
                        uint64_t v188 = qword_100A19ED8;
                        if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v550[0].__r_.__value_.__l.__data_) = v476;
                          *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v162;
                          v186 = v188;
                          v187 = "[DeviceRecord] No device record for device address: %s";
LABEL_259:
                          _os_log_error_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, v187, (uint8_t *)v550, 0xCu);
                        }
                        goto LABEL_275;
                      }
                      uint64_t v183 = 1;
                      while (v183 != 6)
                      {
                        if (*((unsigned __int8 *)&v544 + v183++))
                        {
                          if ((unint64_t)(v183 - 2) < 5) {
                            goto LABEL_221;
                          }
                          break;
                        }
                      }
                    }
                    uint64_t v185 = qword_100A19ED8;
                    if (os_log_type_enabled((os_log_t)qword_100A19ED8, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v550[0].__r_.__value_.__l.__data_) = v476;
                      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v162;
                      v186 = v185;
                      v187 = "Received invalid device address for device record: %s";
                      goto LABEL_259;
                    }
LABEL_275:
                    if (SHIBYTE(v557[2]) < 0) {
                      operator delete(v557[0]);
                    }
                  }
                  ++v159;
                }
                while (v159 != (void)v484);
                *(void *)&long long v484 = unk_100A1E368(v481, "countByEnumeratingWithState:objects:count:", &v521, v558, 16);
                if (!(void)v484)
                {
LABEL_279:

                  break;
                }
              }
            }
          }
        }
        goto LABEL_117;
      }
      uint64_t v12 = _CFXPCCreateCFObjectFromXPCMessage();
      v107 = qword_100A19E60;
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
      {
        LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "Process RemoveCloudPairedDevice: %@", (uint8_t *)v550, 0xCu);
      }
      v108 = [v12 objectForKey:@"kCloudDeviceUniqueID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v109 = [v12 objectForKey:@"kCloudDeviceUniqueID"];

        if (v109)
        {
          v110 = qword_100A19E60;
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v109;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Removing CloudPairedDevice value: %@", (uint8_t *)v550, 0xCu);
          }
          uint64_t v111 = sub_100019878();
          v533[0] = _NSConcreteStackBlock;
          v533[1] = 3221225472;
          v533[2] = sub_100537524;
          v533[3] = &unk_100997450;
          id v112 = v109;
          id v534 = v112;
          sub_100013018(v111, v533);

          goto LABEL_117;
        }
      }
      else
      {
      }
      uint64_t v119 = qword_100A19E60;
      if (!os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO))
      {
LABEL_117:

        goto LABEL_118;
      }
      LODWORD(v550[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v550[0].__r_.__value_.__r.__words + 4) = 0;
      v69 = "Invalid RemoveCloudPairedDevice value: %@";
      v70 = v119;
      os_log_type_t v71 = OS_LOG_TYPE_INFO;
      uint32_t v72 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v70, v71, v69, (uint8_t *)v550, v72);
    goto LABEL_117;
  }
LABEL_119:
}

- (void)fetchSoundProfile
{
  if _os_feature_enabled_impl() && (sub_100540244())
  {
    id v4 = [(CloudPairing *)self cloudClient];
    [v4 fetchSoundProfileRecordWithCompletion:&stru_1009B4398];
  }
  else
  {
    uint64_t v3 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Spatial Profile Not supported hardware ", buf, 2u);
    }
  }
}

- (void)resetServerConnection
{
  uint64_t v3 = [(CloudPairing *)self serverConnection];

  if (v3)
  {
    id v4 = [(CloudPairing *)self serverConnection];
    xpc_connection_cancel(v4);

    [(CloudPairing *)self setServerConnection:0];
  }
  long long v5 = dispatch_get_global_queue(2, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v5, 0);
  [(CloudPairing *)self setServerConnection:mach_service];

  BOOL v7 = [(CloudPairing *)self serverConnection];

  long long v8 = qword_100A19E60;
  BOOL v9 = os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connected to cloudpaird", buf, 2u);
    }
    BOOL v10 = [(CloudPairing *)self serverConnection];
    xpc_connection_set_event_handler(v10, &stru_1009B43D8);

    uint32_t v11 = [(CloudPairing *)self serverConnection];
    xpc_connection_resume(v11);

    if ([(NSMutableDictionary *)self->_idsMultiUsersDictionary count])
    {
      uint64_t v12 = qword_100A19E60;
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MUC - Connected to cloudpaird - send getIDSLocalDeviceInfo", v13, 2u);
      }
      [(CloudPairing *)self cloudpairdMsg:@"getIDSLocalDeviceInfo" args:&__NSDictionary0__struct];
    }
  }
  else if (v9)
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to connect to cloudpaird", v15, 2u);
  }
}

- (void)cloudpairdReplyMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CloudPairing *)self isRunningInRecovery])
  {
    long long v8 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CP: Not Available in this layer", v12, 2u);
    }
  }
  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (v7)
    {
      BOOL v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(reply, "kMsgArgs", v10);
    }
    xpc_dictionary_get_remote_connection(v6);
    uint32_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v11, reply);
  }
}

- (void)cloudpairdMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CloudPairing *)self isRunningInRecovery])
  {
    long long v8 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CP: Not Available in this layer", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    BOOL v9 = [(CloudPairing *)self serverConnection];

    if (!v9) {
      [(CloudPairing *)self resetServerConnection];
    }
    BOOL v10 = [(CloudPairing *)self serverConnection];

    uint32_t v11 = qword_100A19E60;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412803;
        id v16 = v6;
        __int16 v17 = 2160;
        uint64_t v18 = 1752392040;
        __int16 v19 = 2113;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudPairing: Send message: %@ - %{private, mask.hash}@", (uint8_t *)&v15, 0x20u);
      }
      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, "kMsgId", (const char *)[v6 UTF8String]);
      if (v7)
      {
        uint64_t v13 = (void *)_CFXPCCreateXPCMessageWithCFObject();
        xpc_dictionary_set_value(v12, "kMsgArgs", v13);
      }
      uint64_t v14 = [(CloudPairing *)self serverConnection];
      xpc_connection_send_message(v14, v12);
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
    {
      sub_100777D48();
    }
  }
}

- (void)registerWithCloudPairedDevices:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = (id)qword_100A19E60;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Locally paired iCloud identifiers: [ %s ]", buf, 0xCu);
  }
  BOOL v10 = (id)qword_100A19E60;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 componentsJoinedByString:@", "];
    id v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Locally paired iCloud BTUUIDs: [ %s ]", buf, 0xCu);
  }
  uint64_t v13 = +[NSArray arrayWithArray:v6];
  cloudLocalUUIDs = self->_cloudLocalUUIDs;
  self->_cloudLocalUUIDs = v13;

  int v15 = +[NSArray arrayWithArray:v7];
  cloudidsIdentifiers = self->_cloudidsIdentifiers;
  self->_cloudidsIdentifiers = v15;

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  __int16 v17 = [(CloudPairing *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005394E8;
  block[3] = &unk_1009A0318;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_async(v17, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)printDebug
{
  id v4 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "statedump: ------------------ IDS Multi Users -------------------", (uint8_t *)&v15, 2u);
  }
  long long v5 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_supportsVirtualAddress) {
      id v6 = "YES";
    }
    else {
      id v6 = "NO";
    }
    int v15 = 136315138;
    id v16 = (void *)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump: Virtual address supported: %s", (uint8_t *)&v15, 0xCu);
  }
  id v7 = (id)qword_100A19E60;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = [(CloudPairing *)self currentIDSUser];
    if (v8)
    {
      id v2 = [(CloudPairing *)self currentIDSUser];
      id v9 = (const char *)[v2 UTF8String];
    }
    else
    {
      id v9 = "none";
    }
    int v15 = 136315138;
    id v16 = (void *)v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "statedump: Current IDS user: %s", (uint8_t *)&v15, 0xCu);
    if (v8) {
  }
    }
  BOOL v10 = (id)qword_100A19E60;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(CloudPairing *)self currentUserRandomAddress];
    if (v11)
    {
      id v2 = [(CloudPairing *)self currentUserRandomAddress];
      id v12 = (const char *)[v2 UTF8String];
    }
    else
    {
      id v12 = "none";
    }
    int v15 = 136315138;
    id v16 = (void *)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "statedump: Current user's RSA: %s", (uint8_t *)&v15, 0xCu);
    if (v11) {
  }
    }
  uint64_t v13 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    publicAddress = self->_publicAddress;
    int v15 = 138412290;
    id v16 = publicAddress;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "statedump: IDS Multi users dictionary for local address: %@", (uint8_t *)&v15, 0xCu);
  }
  [(NSMutableDictionary *)self->_idsMultiUsersDictionary enumerateKeysAndObjectsUsingBlock:&stru_1009B4418];
  [(CloudPairing *)self cloudpairdMsg:@"printDebug" args:&__NSDictionary0__struct];
}

- (void)sendCloudKitPush
{
  uint64_t v3 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sendCloudKitPush", v4, 2u);
  }
  [(CloudPairing *)self cloudpairdMsg:@"sendCloudKitPush" args:0];
}

- (BOOL)getAccountStatus
{
  uint64_t v3 = (id)qword_100A19E60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(CloudPairing *)self iCloudSignedIn];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "getAccountStatus : iCloud Account: %i", (uint8_t *)v5, 8u);
  }

  return [(CloudPairing *)self iCloudSignedIn];
}

- (void)fetchManateeStatus
{
}

- (BOOL)getAccessibilityHeadtrackingEnabled
{
  return [(CloudPairing *)self accessibilityHeadTrackingEnabled];
}

- (BOOL)handleXPCUnpairCommand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"PublicAddress"];
  long long v5 = +[NSString stringWithFormat:@"Public %@", v4];
  unint64_t v6 = sub_1006ADA24(v5);

  id v7 = [v3 objectForKeyedSubscript:@"RandomAddress"];
  long long v8 = +[NSString stringWithFormat:@"Random %@", v7];
  unint64_t v9 = sub_1006ADA24(v8);

  BOOL v10 = (v6 | v9) != 0;
  if (v6 | v9)
  {
    id v11 = [v3 objectForKeyedSubscript:@"kCloudDeviceUniqueID"];
    uint64_t v12 = [v3 objectForKeyedSubscript:@"kCloudPairingID"];
    uint64_t v13 = (void *)v12;
    if (v11 && v12)
    {
      if (qword_1009F7EE0 != -1) {
        dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
      }
      if (!sub_1006BB9D4((uint64_t)off_1009F7ED8, v13))
      {
        uint64_t v14 = (id)qword_100A19E60;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_100777E8C((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)buf);
        }
      }
      if (qword_1009F7ED0 != -1) {
        dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
      }
      if (!sub_100008DC4(qword_1009F7EC8, v13))
      {
        int v15 = (id)qword_100A19E60;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_100777E50((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)v41);
        }
      }
      if (qword_1009F7EE0 != -1) {
        dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
      }
      sub_1006BE7F4((uint64_t)off_1009F7ED8, v13, (uint64_t)__p);
      if (v40 >= 0) {
        id v16 = __p;
      }
      else {
        id v16 = (void **)__p[0];
      }
      __int16 v17 = +[NSString stringWithUTF8String:v16];
      unsigned __int8 v18 = [v11 isEqualToString:v17];

      if (v40 < 0)
      {
        operator delete(__p[0]);
        if (v18) {
          goto LABEL_30;
        }
      }
      else if (v18)
      {
        goto LABEL_30;
      }
      int v23 = (id)qword_100A19E60;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        sub_100777E14((uint64_t)[v11 UTF8String], (uint64_t)v13, (uint64_t)__p);
      }
    }
LABEL_30:
    if (qword_1009F7ED0 != -1) {
      dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
    }
    uint64_t v24 = qword_1009F7EC8;
    id v21 = v11;
    sub_10004191C(v34, (char *)[v21 UTF8String]);
    char v25 = sub_10070BC30(v24, (unsigned __int8 *)v34);
    char v26 = v25;
    if (v35 < 0)
    {
      operator delete(v34[0]);
      if (v26)
      {
LABEL_53:

        goto LABEL_54;
      }
    }
    else if (v25)
    {
      goto LABEL_53;
    }
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    if (qword_1009F7EE0 != -1) {
      dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
    }
    sub_100014B58((uint64_t)off_1009F7ED8, v9, 0, 1u, 0, 0, src);
    uuid_copy(uu, src);
    if (uuid_is_null(uu))
    {
      BOOL v27 = (id)qword_100A19E60;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = sub_1006AD3F0();
        *(_DWORD *)src = 138412290;
        id v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No static random device found with address %@", src, 0xCu);
      }
    }
    else
    {
      if (qword_1009F7ED0 != -1) {
        dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
      }
      uint64_t v29 = qword_1009F7EC8;
      BOOL v27 = sub_100031234(uu);
      sub_10070BF0C(v29, v27);
    }

    if (qword_1009F7EE0 != -1) {
      dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
    }
    sub_100014B58((uint64_t)off_1009F7ED8, v6, 0, 1u, 0, 0, src);
    uuid_copy(uu, src);
    if (uuid_is_null(uu))
    {
      id v30 = (id)qword_100A19E60;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = sub_1006AD3F0();
        *(_DWORD *)src = 138412290;
        id v37 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No local device found with address %@", src, 0xCu);
      }
    }
    else
    {
      if (qword_1009F7ED0 != -1) {
        dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
      }
      uint64_t v32 = qword_1009F7EC8;
      id v30 = sub_100031234(uu);
      sub_10070BF0C(v32, v30);
    }

    goto LABEL_53;
  }
  id v19 = [v3 objectForKeyedSubscript:@"PublicAddress"];
  id v20 = [v3 objectForKeyedSubscript:@"RandomAddress"];
  id v21 = +[NSString stringWithFormat:@"Invalid public address \"%@\" and Invalid random address \"%@\"", v19, v20];

  uint64_t v22 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Error unpairing Cloud Device: %@", buf, 0xCu);
  }
LABEL_54:

  return v10;
}

- (id)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_keysGenerated)
  {
    uint64_t v10 = [(CloudPairing *)self generateKeys];
    id v11 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
      sub_100778034(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  unsigned __int8 v18 = +[NSMutableDictionary dictionary];
  if (![v8 containsObject:@"EncryptionKeys"]) {
    goto LABEL_17;
  }
  int __buf = 0;
  __int16 v28 = 0;
  v31[1] = 0;
  uint64_t v32 = 0;
  v30[1] = 0;
  v31[0] = 0;
  v30[0] = 0;
  arc4random_buf((char *)&__buf + 2, 2uLL);
  arc4random_buf(&v32, 8uLL);
  if (!sub_100180684((long long *)self->_diversifierHidingKey, &v32, &v28))
  {
    LOWORD(__buf) = HIWORD(__buf) ^ v28;
    if (sub_100180D78((long long *)self->_encryptionRootKey, SHIWORD(__buf), 0, v31))
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
        sub_100777F64();
      }
      goto LABEL_28;
    }
    if (a4 != 16) {
      bzero((char *)v31 + a4, 16 - a4);
    }
    if (sub_100180D78((long long *)self->_encryptionRootKey, SHIWORD(__buf), 1, v30))
    {
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
        sub_100777EFC();
      }
      goto LABEL_28;
    }
    id v19 = +[NSData dataWithBytes:v31 length:16];
    [v18 setObject:v19 forKeyedSubscript:@"LTK"];

    id v20 = +[NSNumber numberWithUnsignedInteger:a4];
    [v18 setObject:v20 forKeyedSubscript:@"LTKLength"];

    [v18 setObject:&off_1009E0F38 forKeyedSubscript:@"LTKType"];
    id v21 = +[NSData dataWithBytes:&__buf length:2];
    [v18 setObject:v21 forKeyedSubscript:@"EDIV"];

    uint64_t v22 = +[NSData dataWithBytes:&v32 length:8];
    [v18 setObject:v22 forKeyedSubscript:@"RAND"];

LABEL_17:
    if ([v8 containsObject:@"PublicKeys"])
    {
      int v23 = +[NSData dataWithBytes:self->_cloudPublicKey length:64];
      [v18 setObject:v23 forKeyedSubscript:@"CloudPublicKey"];

      uint64_t v24 = +[NSData dataWithBytes:self->_cloudNonce length:16];
      [v18 setObject:v24 forKeyedSubscript:@"CloudNonce"];
    }
    if ([v8 containsObject:@"IdentityKeys"])
    {
      if (v9)
      {
        char v25 = [(CloudPairing *)self getIRKForRandomStaticAddress:v9];
        if (!v25)
        {
          if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
            sub_100777EC8();
          }
          goto LABEL_28;
        }
        [v18 setObject:v25 forKeyedSubscript:@"IRK"];
      }
      else
      {
        char v25 = +[NSData dataWithBytes:self->_identityResolvingKey length:16];
        [v18 setObject:v25 forKeyedSubscript:@"IRK"];
      }
    }
    id v26 = v18;
    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
    sub_100777FCC();
  }
LABEL_28:
  id v26 = 0;
LABEL_29:

  return v26;
}

- (void)launchCloudPair
{
}

- (id)generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10004D098;
  uint64_t v31 = sub_10004CE20;
  id v32 = 0;
  uint64_t v14 = sub_100019878();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10053AA48;
  v21[3] = &unk_1009B4440;
  id v26 = &v27;
  v21[4] = self;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  sub_1004AFFC0(v14, v21);
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v19;
}

- (id)_generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10 = a3;
  id v14 = a4;
  id v13 = a5;
  id v15 = a6;
  if (self->_keysGenerated || [(CloudPairing *)self _generateKeys])
  {
    id v11 = (id)qword_100A19E60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Keys available or generated", buf, 2u);
    }

    [v10 objectForKeyedSubscript:@"DeviceName"];
    objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"RequestedKeyType"];
    objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"RequestedKeys"];
    objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"IDSLocalRandomAddress"];
    objc_claimAutoreleasedReturnValue();
    operator new();
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
    sub_1007780D8();
  }

  return 0;
}

- (id)readUserPreference:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.CoreBluetooth.cloud", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

  return v3;
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  CFPreferencesSetValue(v7, v8, @"com.apple.CoreBluetooth.cloud", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (a5
    && !CFPreferencesSynchronize(@"com.apple.CoreBluetooth.cloud", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    id v9 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v10, 2u);
    }
  }
}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  long long v5 = (__CFString *)a3;
  CFPreferencesSetValue(v5, 0, @"com.apple.CoreBluetooth.cloud", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (a4
    && !CFPreferencesSynchronize(@"com.apple.CoreBluetooth.cloud", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    unint64_t v6 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v7, 2u);
    }
  }
}

- (id)createBluetoothAddressForIDSLocalDevice:(id)a3
{
  id v4 = a3;
  long long v5 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - create RSA for local IDS device: %@, current users: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  char v40 = sub_10004D098;
  BOOL v41 = sub_10004CE20;
  id v42 = 0;
  if (!self->_supportsVirtualAddress)
  {
    id v9 = 0;
    goto LABEL_7;
  }
  id v7 = self->_idsMultiUsersDictionary;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10053D2DC;
  v28[3] = &unk_1009B4468;
  id v8 = v4;
  id v29 = v8;
  id v30 = buf;
  [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v28];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
LABEL_5:

    id v9 = *(void **)(*(void *)&buf[8] + 40);
LABEL_7:
    id v10 = v9;
    goto LABEL_8;
  }
  __int16 v27 = 0;
  int __buf = 0;
  arc4random_buf(&__buf, 6uLL);
  LOBYTE(__buf) = __buf | 0xC0;
  uint64_t v12 = sub_1006ACEAC();
  id v13 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v12;

  id v14 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = *(NSString **)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v31 = 138412290;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MUC - RSA generated: %@", v31, 0xCu);
  }
  long long v38 = 0uLL;
  arc4random_buf(&v38, 0x10uLL);
  v37[0] = 0;
  v37[1] = 0;
  if (!sub_100180D78(&v38, 1, 0, v37))
  {
    if (!self->_idsMultiUsersDictionary)
    {
      id v16 = +[NSMutableDictionary dictionaryWithCapacity:1];
      id v17 = self->_idsMultiUsersDictionary;
      self->_idsMultiUsersDictionary = v16;
    }
    id v18 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      publicAddress = self->_publicAddress;
      *(_DWORD *)uint64_t v31 = 138412290;
      id v32 = publicAddress;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MUC - local public address %@", v31, 0xCu);
    }
    v35[0] = @"IDSLocalID";
    v35[1] = @"IRK";
    v36[0] = v8;
    id v20 = +[NSData dataWithBytes:v37 length:16];
    v36[1] = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    [(NSMutableDictionary *)self->_idsMultiUsersDictionary setObject:v21 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];

    id v22 = +[NSDictionary dictionaryWithObject:self->_idsMultiUsersDictionary forKey:self->_publicAddress];
    [(CloudPairing *)self removeuserPreference:@"IDSMultiUsers" sync:1];
    [(CloudPairing *)self setuserPreference:@"IDSMultiUsers" value:v22 sync:1];
    id v23 = (id)qword_100A19E60;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = IsAppleInternalBuild();
      if (v24)
      {
        p_isa = (NSString *)&self->_idsMultiUsersDictionary->super.super.isa;
      }
      else
      {
        p_isa = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)self->_idsMultiUsersDictionary count]];
      }
      *(_DWORD *)uint64_t v31 = 138412546;
      id v32 = p_isa;
      __int16 v33 = 2112;
      BOOL v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "MUC - MUC dictionary = %@, dictToStore %@", v31, 0x16u);
      if (!v24) {
    }
      }
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
    sub_10077810C();
  }

  id v10 = 0;
LABEL_8:
  _Block_object_dispose(buf, 8);

  return v10;
}

- (void)resetDataForIDSLocalDevice:(id)a3
{
  id v4 = a3;
  long long v5 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - Reset data for local IDS device: %@, current users: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v13 = sub_10004D098;
  id v14 = sub_10004CE20;
  id v15 = 0;
  if (self->_supportsVirtualAddress)
  {
    id v7 = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10053D650;
    v9[3] = &unk_1009B4468;
    id v10 = v4;
    id v11 = buf;
    [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v9];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      if (qword_1009F8248 != -1) {
        dispatch_once(&qword_1009F8248, &stru_1009B4588);
      }
      *((unsigned char *)off_1009F8240 + 17000) = 0;
      char v8 = 0;
      sub_10001B8E0(&v8);
      sub_10023F09C(0);
      sub_10001B8AC(&v8);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (id)getIRKForRandomStaticAddress:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_10004D098;
    id v16 = sub_10004CE20;
    id v17 = 0;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10053D8E4;
    v9[3] = &unk_1009B4468;
    id v10 = v4;
    id v11 = &v12;
    [(NSMutableDictionary *)idsMultiUsersDictionary enumerateKeysAndObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)updateRandomAddressContinuityAdvInstance:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(CloudPairing *)self multipleAdvInitialized])
    {
      long long v5 = [(CloudPairing *)self getIRKForRandomStaticAddress:v4];
      if (v5)
      {
        char v9 = 0;
        sub_10001B8E0(&v9);
        sub_10023F09C((long long *)[v5 bytes]);
        int v6 = sub_100229204();
        id v7 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MUC - updated RSA adv instance with status: %d", buf, 8u);
        }
        if (v6)
        {
          if (qword_1009F8248 != -1) {
            dispatch_once(&qword_1009F8248, &stru_1009B4588);
          }
          char v8 = 0;
        }
        else
        {
          if (qword_1009F8248 != -1) {
            dispatch_once(&qword_1009F8248, &stru_1009B4588);
          }
          char v8 = 1;
        }
        *((unsigned char *)off_1009F8240 + 17000) = v8;
        sub_10001B8AC(&v9);
      }
      else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
      {
        sub_1007781A8();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
    {
      sub_100778210();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
  {
    sub_100778174();
  }
}

- (void)updateCurrentIDSUserInfo:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  long long v5 = (id)qword_100A19E60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(CloudPairing *)self currentUserRandomAddress];
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    unint64_t v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - update current -> new RSA (%@ - %@)", buf, 0x16u);
  }
  uint64_t v7 = [(CloudPairing *)self currentUserRandomAddress];
  BOOL v8 = (v4 | v7) == 0;

  if (!v8)
  {
    char v9 = [(CloudPairing *)self currentUserRandomAddress];
    unsigned __int8 v10 = [v9 isEqualToString:v4];

    if (v10)
    {
      int v11 = qword_100A19E60;
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MUC - same user - don't update", buf, 2u);
      }
    }
    else
    {
      [(CloudPairing *)self setCurrentUserRandomAddress:v4];
      uint64_t v12 = [(CloudPairing *)self currentUserRandomAddress];
      BOOL v13 = v12 == 0;

      if (v13)
      {
        id v17 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MUC - user has signed out", buf, 2u);
        }
        if (qword_1009F7ED0 != -1) {
          dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
        }
        nullsub_95(qword_1009F7EC8);
        if (qword_1009F8248 != -1) {
          dispatch_once(&qword_1009F8248, &stru_1009B4588);
        }
        *((unsigned char *)off_1009F8240 + 17000) = 0;
        buf[0] = 0;
        sub_10001B8E0(buf);
        sub_10023F09C(0);
        sub_10001B8AC(buf);
      }
      else
      {
        uint64_t v14 = [(CloudPairing *)self currentUserRandomAddress];
        id v15 = +[NSString stringWithFormat:@"Random %@", v14];
        sub_1006ADA24(v15);

        if (qword_1009F7ED0 != -1) {
          dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
        }
        nullsub_95(qword_1009F7EC8);
        id v16 = [(CloudPairing *)self currentUserRandomAddress];
        [(CloudPairing *)self updateRandomAddressContinuityAdvInstance:v16];
      }
    }
  }
}

- (id)getPairedDeviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10004D098;
  id v16 = sub_10004CE20;
  id v17 = 0;
  id v17 = +[NSDictionary dictionary];
  uint64_t v5 = sub_100019878();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10053E158;
  v9[3] = &unk_1009B4338;
  int v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_1004AFFC0(v5, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_getPairedDeviceForIDSIdentifier:(id)a3
{
  id v30 = a3;
  id v31 = +[NSMutableDictionary dictionary];
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_1009B44A8);
  }
  id v3 = sub_10070CA20(qword_1009F7EC8);
  id v29 = +[NSMutableSet setWithArray:v3];

  id v4 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    cloudLocalUUIDs = self->_cloudLocalUUIDs;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = cloudLocalUUIDs;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MUC - Paired devices: %@, cloud local paired %@", buf, 0x16u);
  }
  if (v30 && self->_supportsVirtualAddress)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    objc_super v47 = sub_10004D098;
    BOOL v48 = sub_10004CE20;
    id v49 = 0;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10053E930;
    v40[3] = &unk_1009B4468;
    id v41 = v30;
    id v42 = buf;
    [(NSMutableDictionary *)idsMultiUsersDictionary enumerateKeysAndObjectsUsingBlock:v40];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v7 = +[NSString stringWithFormat:@"Random %@", *(void *)(*(void *)&buf[8] + 40)];
      BOOL v8 = (const void *)sub_1006ADA24(v7);

      char v9 = sub_100312698(v8);
      id v10 = [v9 allKeys];
      int v11 = +[NSSet setWithArray:v10];
      [v29 unionSet:v11];

      uint64_t v12 = qword_100A19E60;
      if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v44 = 138412290;
        id v45 = v29;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MUC - All paired devices: %@", v44, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v29;
  id v13 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v37;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v15);
        id v17 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MUC - Checking %@", buf, 0xCu);
        }
        if (qword_1009F7EE0 != -1) {
          dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
        }
        sub_1006BE7F4((uint64_t)off_1009F7ED8, v16, (uint64_t)buf);
        if ((buf[23] & 0x80000000) != 0)
        {
          uint64_t v25 = *(void *)&buf[8];
          operator delete(*(void **)buf);
          if (v25)
          {
LABEL_23:
            if (qword_1009F7EE0 != -1) {
              dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
            }
            sub_1006BE7F4((uint64_t)off_1009F7ED8, v16, (uint64_t)buf);
            if (buf[23] >= 0) {
              id v18 = buf;
            }
            else {
              id v18 = *(unsigned char **)buf;
            }
            id v19 = +[NSString stringWithUTF8String:v18];
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
            __int16 v20 = qword_100A19E60;
            if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MUC - Cloud identifier %@", buf, 0xCu);
            }
            if (self->_supportsVirtualAddress)
            {
              if (qword_1009F7EE0 != -1) {
                dispatch_once(&qword_1009F7EE0, &stru_1009B4548);
              }
              unint64_t v21 = off_1009F7ED8;
              sub_10004191C(__p, "PairingAttemptedUsingRSA");
              int v22 = sub_100030A04((uint64_t)v21, v16, (uint64_t)__p);
              int v23 = v22;
              if ((v35 & 0x80000000) == 0)
              {
                if (v22) {
                  goto LABEL_37;
                }
LABEL_43:
                __int16 v27 = qword_100A19E60;
                if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v16;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v19;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "MUC - Upgrade keys for BTUUID %@ iCloud %@ using RSA", buf, 0x16u);
                }
LABEL_45:

                goto LABEL_46;
              }
              operator delete(__p[0]);
              if (!v23) {
                goto LABEL_43;
              }
            }
LABEL_37:
            int v24 = [v16 UUIDString];
            [v31 setObject:v19 forKey:v24];

            goto LABEL_45;
          }
        }
        else if (buf[23])
        {
          goto LABEL_23;
        }
        id v26 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "MUC - Not a cloud paired device %@", buf, 0xCu);
        }
LABEL_46:
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v13);
  }

  return v31;
}

- (void)sendCloudpairingRetry:(id)a3
{
  id v4 = a3;
  if ([(CloudPairing *)self isRunningInRecovery])
  {
    uint64_t v5 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CP: Not Available to retry", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    id v6 = [(CloudPairing *)self serverConnection];

    if (!v6) {
      [(CloudPairing *)self resetServerConnection];
    }
    id v7 = [(CloudPairing *)self serverConnection];
    if (v7)
    {
      id v8 = [v4 count];

      if (v8)
      {
        char v9 = qword_100A19E60;
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138477827;
          id v14 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send Cloud Pairing Retry for %{private}@", (uint8_t *)&v13, 0xCu);
        }
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v10, "kMsgId", "cloudpairingRetry");
        int v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v10, "kMsgArgs", v11);
        uint64_t v12 = [(CloudPairing *)self serverConnection];
        xpc_connection_send_message(v12, v10);
      }
    }
  }
}

- (void)startListeningToPowerUIStatusChanges
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"audioAccessorySmartChargeStatusHasChangedFromNotification:" name:PowerUIAudioAccessorySmartChargeStatusHasChangedNote object:0];

  id v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"audioAccessorySmartChargeDeadlineHasChangedFromNotification:" name:PowerUIAudioAccessorySmartChargeDeadlineHasChangedNote object:0];
}

- (void)stopListeningToPowerUIStatusChanges
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)audioAccessorySmartChargeStatusHasChangedFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 object];
  if (v4)
  {
    id v5 = [objc_alloc((Class)PowerUISmartChargeClientAudioAccessories) initWithClientName:@"com.apple.bluetooth"];
    id v13 = 0;
    id v6 = [v5 isSmartChargingCurrentlyEnabledForDevice:v4 withError:&v13];
    id v7 = v13;
    id v8 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v4;
      __int16 v16 = 2048;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerUI config values changed for device %@, isSmartChargingCurrentlyEnabledForDevice %lu, error %@", buf, 0x20u);
    }
    char v9 = +[NSString stringWithFormat:@"Public %@", v4];
    unint64_t v10 = sub_1006ADA24(v9);

    if (qword_1009F7F00 != -1) {
      dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
    }
    uint64_t v11 = sub_100030F10((uint64_t)off_1009F7EF8, v10, 1);
    uint64_t v12 = v11;
    if (v11)
    {
      if ((id)sub_1004897E0(v11) != v6)
      {
        sub_1004895D0(v12, (uint64_t)v6);
        if (qword_1009F8080 != -1) {
          dispatch_once(&qword_1009F8080, &stru_1009B44E8);
        }
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)off_1009F8078 + 112))(off_1009F8078, v12, 4101);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
    {
      sub_100778278();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
  {
    sub_100778244();
  }
}

- (void)audioAccessorySmartChargeDeadlineHasChangedFromNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 object];
  id v5 = [objc_alloc((Class)PowerUISmartChargeClientAudioAccessories) initWithClientName:@"com.apple.bluetooth"];
  id v15 = 0;
  id v6 = [v5 unfilteredDeadlineForDevice:v4 withError:&v15];
  id v7 = v15;
  id v8 = qword_100A19E60;
  if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerUI config values changed for device %@, fullChargeDeadlineForDevice %@ error %@", buf, 0x20u);
  }
  char v9 = +[NSString stringWithFormat:@"Public %@", v4];
  unint64_t v10 = sub_1006ADA24(v9);

  if (qword_1009F7F00 != -1) {
    dispatch_once(&qword_1009F7F00, &stru_1009B44C8);
  }
  uint64_t v11 = sub_100030F10((uint64_t)off_1009F7EF8, v10, 1);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = sub_100489828(v11);
    if (!v13 || ([v6 timeIntervalSinceDate:v13], v14 > 0.0))
    {
      sub_1004896B4(v12, v6);
      if (qword_1009F8080 != -1) {
        dispatch_once(&qword_1009F8080, &stru_1009B44E8);
      }
      (*(void (**)(void *, uint64_t, uint64_t))(*(void *)off_1009F8078 + 112))(off_1009F8078, v12, 4101);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR))
  {
    sub_100778278();
  }
}

- (void)audioAccessorySmartChargeStatusHasChangedFromCloud:(void *)a3
{
  if (_os_feature_enabled_impl()
    && NSClassFromString(@"PowerUISmartChargeClientAudioAccessories"))
  {
    id v4 = [objc_alloc((Class)PowerUISmartChargeClientAudioAccessories) initWithClientName:@"com.apple.bluetooth"];
    id v5 = sub_1006ACEAC();
    uint64_t v6 = sub_1004897E0((uint64_t)a3);
    switch(v6)
    {
      case 0:
        id v13 = 0;
        [v4 disableSmartChargingForDevice:v5 withError:&v13];
        id v7 = v13;
        goto LABEL_11;
      case 1:
        uint64_t v12 = 0;
        [v4 enableSmartChargingForDevice:v5 withError:&v12];
        id v7 = v12;
        goto LABEL_11;
      case 2:
        uint64_t v11 = 0;
        [v4 temporarilyEnableChargingForDevice:v5 withError:&v11];
        id v7 = v11;
        goto LABEL_11;
      case 3:
        unint64_t v10 = 0;
        [v4 temporarilyDisableSmartChargingForDevice:v5 withError:&v10];
        id v7 = v10;
LABEL_11:
        id v8 = v7;
        break;
      default:
        if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_ERROR)) {
          sub_1007782E0();
        }
        id v8 = 0;
        break;
    }
    char v9 = qword_100A19E60;
    if (os_log_type_enabled((os_log_t)qword_100A19E60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "audioAccessorySmartChargeStatusHasChangedFromCloud for %@ to state %lu with error %@", buf, 0x20u);
    }
  }
}

- (void)audioAccessorySmartChargeDeadlineHasChangedFromCloud:(void *)a3
{
  if (_os_feature_enabled_impl()
    && NSClassFromString(@"PowerUISmartChargeClientAudioAccessories"))
  {
    id v4 = [objc_alloc((Class)PowerUISmartChargeClientAudioAccessories) initWithClientName:@"com.apple.bluetooth"];
    id v5 = sub_1006ACEAC();
    uint64_t v6 = sub_100489828((uint64_t)a3);
    id v10 = 0;
    [v4 updateOBCDeadline:v6 forDevice:v5 withError:&v10];
    id v7 = v10;

    id v8 = (id)qword_100A19E60;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = sub_100489828((uint64_t)a3);
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      double v14 = v9;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "audioAccessorySmartChargeDeadlineHasChangedFromCloud for %@ to date %@ with error %@", buf, 0x20u);
    }
  }
}

- (NSArray)associatedDevices
{
  return self->_associatedDevices;
}

- (void)setAssociatedDevices:(id)a3
{
}

- (NSMutableArray)cloudDevices
{
  return self->_cloudDevices;
}

- (void)setCloudDevices:(id)a3
{
}

- (NSMutableArray)cloudUploadedKeys
{
  return self->_cloudUploadedKeys;
}

- (void)setCloudUploadedKeys:(id)a3
{
}

- (NSString)publicAddress
{
  return self->_publicAddress;
}

- (void)setPublicAddress:(id)a3
{
}

- (NSString)localDeviceName
{
  return self->_localDeviceName;
}

- (void)setLocalDeviceName:(id)a3
{
}

- (NSArray)requestedKeyTypes
{
  return self->_requestedKeyTypes;
}

- (unint64_t)keyLength
{
  return self->_keyLength;
}

- (NSArray)cloudLocalUUIDs
{
  return self->_cloudLocalUUIDs;
}

- (NSArray)cloudidsIdentifiers
{
  return self->_cloudidsIdentifiers;
}

- (OS_xpc_object)serverConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336, 1);
}

- (void)setServerConnection:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (BOOL)iCloudSignedIn
{
  return self->_iCloudSignedIn;
}

- (void)setICloudSignedIn:(BOOL)a3
{
  self->_iCloudSignedIn = a3;
}

- (BOOL)accessibilityHeadTrackingEnabled
{
  return self->_accessibilityHeadTrackingEnabled;
}

- (void)setAccessibilityHeadTrackingEnabled:(BOOL)a3
{
  self->_accessibilityHeadTrackingEnabled = a3;
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)idsMultiUsersDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)setIdsMultiUsersDictionary:(id)a3
{
}

- (NSString)currentIDSUser
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCurrentIDSUser:(id)a3
{
}

- (NSString)currentUserRandomAddress
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCurrentUserRandomAddress:(id)a3
{
}

- (BOOL)multipleAdvInitialized
{
  return self->_multipleAdvInitialized;
}

- (void)setMultipleAdvInitialized:(BOOL)a3
{
  self->_multipleAdvInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserRandomAddress, 0);
  objc_storeStrong((id *)&self->_currentIDSUser, 0);
  objc_storeStrong((id *)&self->_idsMultiUsersDictionary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_cloudidsIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudLocalUUIDs, 0);
  objc_storeStrong((id *)&self->_requestedKeyTypes, 0);
  objc_storeStrong((id *)&self->_localDeviceName, 0);
  objc_storeStrong((id *)&self->_publicAddress, 0);
  objc_storeStrong((id *)&self->_cloudUploadedKeys, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_associatedDevices, 0);

  objc_storeStrong((id *)&self->_cloudKitConnection, 0);
}

@end