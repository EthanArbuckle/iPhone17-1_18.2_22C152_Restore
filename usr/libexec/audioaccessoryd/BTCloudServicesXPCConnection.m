@interface BTCloudServicesXPCConnection
- (AACloudServicesClient)client;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)direct;
- (BOOL)entitled;
- (BTUserCloudServicesDaemon)daemon;
- (NSString)signingIdentity;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)clientReportHMDeviceCloudRecordInfosUpdated:(id)a3;
- (void)cloudServicesClientActivate:(id)a3 completion:(id)a4;
- (void)createDeviceRecord:(id)a3 completion:(id)a4;
- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)deleteSoundProfileRecordWithCompletion:(id)a3;
- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAllBTCloudDeviceSupportInformationWithCompletion:(id)a3;
- (void)fetchAllMagicSettingsRecordsWithCompletion:(id)a3;
- (void)fetchBTCloudDeviceSupportInformation:(id)a3 completion:(id)a4;
- (void)fetchCloudAccountInfoUpdatedWithCompletion:(id)a3;
- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4;
- (void)fetchDeviceRecord:(id)a3 completion:(id)a4;
- (void)fetchDeviceRecordsWithCompletion:(id)a3;
- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4;
- (void)fetchMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)fetchSoundProfileRecordWithCompletion:(id)a3;
- (void)finishSoundProfileRecordSessionHandle:(id)a3 completion:(id)a4;
- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4;
- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4;
- (void)modifyDeviceRecord:(id)a3 completion:(id)a4;
- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4;
- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)setClient:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setSigningIdentity:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)startSoundProfileRecordFileHandleSessionWithCompletion:(id)a3;
@end

@implementation BTCloudServicesXPCConnection

- (void)cloudServicesClientActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10007B150;
  v24 = sub_10007B160;
  id v25 = 0;
  v9 = +[CloudXPCService sharedInstance];
  v10 = [v9 deviceManager];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007B168;
  v17[3] = &unk_100235208;
  v19 = &v20;
  v17[4] = v10;
  id v11 = v8;
  id v18 = v11;
  v12 = objc_retainBlock(v17);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v15 = v10;
    LogPrintF();
  }
  v13 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v15);
  objc_storeStrong(v13, obj);
  if (v14)
  {
    objc_storeStrong((id *)&self->_client, a3);
    if (v11) {
      (*((void (**)(id, uint64_t))v11 + 2))(v11, v21[5]);
    }
  }
  ((void (*)(void *))v12[2])(v12);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  id v7 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.BluetoothServices"];
  unsigned int v8 = [v7 isEqual:&__kCFBooleanTrue];
  if (v8)
  {
    v3 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.BluetoothServices.cloud"];
    if ([v3 isEqual:&__kCFBooleanTrue])
    {

LABEL_12:
      BOOL result = 1;
      self->_entitled = 1;
      return result;
    }
  }
  v9 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.bluetooth.internal"];
  unsigned int v10 = [v9 isEqual:&__kCFBooleanTrue];

  if (v8)
  {

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_12;
    }
  }
  if (dword_100261308 <= 90 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  if (!a3) {
    return 0;
  }
  BTErrorF();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a3 = v11;
  return result;
}

- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_10007B150;
  v27 = sub_10007B160;
  id v28 = 0;
  unsigned int v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007B690;
  v20[3] = &unk_100235208;
  uint64_t v22 = &v23;
  v20[4] = v9;
  id v10 = v7;
  id v21 = v10;
  id v11 = objc_retainBlock(v20);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  v12 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    v15 = [v14 deviceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007B76C;
    v17[3] = &unk_100235230;
    id v18 = v10;
    [v15 fetchAAProxCardsInfoWithAddress:v6 completion:v17];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v23, 8);
}

- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  unsigned int v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007BA68;
  v18[3] = &unk_100235208;
  uint64_t v20 = &v21;
  v18[4] = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  v12 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    v15 = [v14 deviceManager];
    [v15 updateAAProxCardsInfoWithProxCardsInfo:v6 completion:v10];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v21, 8);
}

- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  unsigned int v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007BD84;
  v18[3] = &unk_100235208;
  uint64_t v20 = &v21;
  v18[4] = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  v12 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    v15 = [v14 deviceManager];
    [v15 removeAAProxCardsInfoWithBluetoothAddress:v6 completion:v10];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v21, 8);
}

- (void)createDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  unsigned int v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C0D8;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    unsigned __int8 v14 = [v13 deviceManager];
    [v14 addDeviceWithRecord:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)modifyDeviceRecord:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF();
  }
  -[BTCloudServicesXPCConnection createDeviceRecord:completion:](self, "createDeviceRecord:completion:", v8, v6, v7);
}

- (void)deleteDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C4B0;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    unsigned __int8 v14 = [v13 deviceManager];
    [v14 removeDeviceWithBluetoothAddress:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  v9 = [v8 deviceManager];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007C824;
  v20[3] = &unk_100232B20;
  v20[4] = v9;
  void v20[5] = &v21;
  id v10 = objc_retainBlock(v20);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    unsigned __int8 v14 = [v13 deviceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007C8C4;
    v17[3] = &unk_100235258;
    id v18 = v7;
    [v14 fetchDeviceWithAddress:v6 completion:v17];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v21, 8);
}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10007B150;
  uint64_t v21 = sub_10007B160;
  id v22 = 0;
  v5 = +[CloudXPCService sharedInstance];
  id v6 = [v5 deviceManager];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007CC30;
  v16[3] = &unk_100232B20;
  v16[4] = v6;
  v16[5] = &v17;
  id v7 = objc_retainBlock(v16);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v12 = v6;
    LogPrintF();
  }
  id v8 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v12);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    id v10 = +[CloudXPCService sharedInstance];
    id v11 = [v10 deviceManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007CCD0;
    v13[3] = &unk_100235280;
    id v14 = v4;
    [v11 fetchDeviceRecordsWithCompletion:v13];
  }
  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v17, 8);
}

- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10007B150;
  id v22 = sub_10007B160;
  id v23 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007D020;
  v17[3] = &unk_100232B20;
  void v17[4] = v9;
  void v17[5] = &v18;
  id v10 = objc_retainBlock(v17);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v15);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 addDeviceSupportInformationWithRecord:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v18, 8);
}

- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10007B150;
  id v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007D33C;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 removeDeviceSupportInformationWithBluetoothAddress:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchBTCloudDeviceSupportInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007D6B0;
  v20[3] = &unk_100232B20;
  v20[4] = v9;
  void v20[5] = &v21;
  id v10 = objc_retainBlock(v20);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007D750;
    v17[3] = &unk_1002352A8;
    id v18 = v7;
    [v14 fetchDeviceSupportInformationRecordWithAddress:v6 completion:v17];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v21, 8);
}

- (void)fetchAllBTCloudDeviceSupportInformationWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10007B150;
  uint64_t v21 = sub_10007B160;
  id v22 = 0;
  v5 = +[CloudXPCService sharedInstance];
  id v6 = [v5 deviceManager];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007DABC;
  v16[3] = &unk_100232B20;
  v16[4] = v6;
  v16[5] = &v17;
  id v7 = objc_retainBlock(v16);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v12 = v6;
    LogPrintF();
  }
  id v8 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v12);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    id v10 = +[CloudXPCService sharedInstance];
    id v11 = [v10 deviceManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007DB5C;
    v13[3] = &unk_100235280;
    id v14 = v4;
    [v11 fetchDeviceSupportInformationRecordsWithCompletion:v13];
  }
  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v17, 8);
}

- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007DE90;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 updateDeviceSupportInformationWithDevice:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007E1AC;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 addDeviceMagicSettingsWithRecord:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007E4C8;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 removeDeviceMagicSettingsWithBluetoothAddress:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10007E83C;
  v20[3] = &unk_100232B20;
  v20[4] = v9;
  void v20[5] = &v21;
  id v10 = objc_retainBlock(v20);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007E8DC;
    v17[3] = &unk_1002352D0;
    id v18 = v7;
    [v14 fetchMagicSettingsRecordWithAddress:v6 completion:v17];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v21, 8);
}

- (void)fetchAllMagicSettingsRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10007B150;
  uint64_t v21 = sub_10007B160;
  id v22 = 0;
  v5 = +[CloudXPCService sharedInstance];
  id v6 = [v5 deviceManager];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10007EC48;
  v16[3] = &unk_100232B20;
  v16[4] = v6;
  v16[5] = &v17;
  id v7 = objc_retainBlock(v16);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v12 = v6;
    LogPrintF();
  }
  id v8 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v12);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    id v10 = +[CloudXPCService sharedInstance];
    id v11 = [v10 deviceManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007ECE8;
    v13[3] = &unk_100235280;
    id v14 = v4;
    [v11 fetchMagicPairingSettingsRecordsWithCompletion:v13];
  }
  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v17, 8);
}

- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10007B150;
  uint64_t v23 = sub_10007B160;
  id v24 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  unsigned __int8 v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007F01C;
  v18[3] = &unk_100232B20;
  v18[4] = v9;
  void v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    v16 = v9;
    LogPrintF();
  }
  id v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11, obj);
  if (v12)
  {
    unsigned __int8 v13 = +[CloudXPCService sharedInstance];
    id v14 = [v13 deviceManager];
    [v14 updateDeviceMagicSettingsWithMagicPairingSettings:v6 completion:v7];
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchCloudAccountInfoUpdatedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10007B150;
  uint64_t v20 = sub_10007B160;
  id v21 = 0;
  v5 = +[CloudXPCService sharedInstance];
  id v6 = [v5 deviceManager];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007F394;
  v15[3] = &unk_100232B20;
  v15[4] = v6;
  v15[5] = &v16;
  id v7 = objc_retainBlock(v15);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    unsigned __int8 v13 = v6;
    LogPrintF();
  }
  id v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v13);
  objc_storeStrong(v8, obj);
  if (v9)
  {
    id v10 = +[CloudXPCService sharedInstance];
    id v11 = [v10 deviceManager];
    unsigned __int8 v12 = [v11 cloudAccountInfo];

    if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v4[2](v4, v12, 0);
  }
  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v15 = v6;
    LogPrintF();
  }
  uint64_t v25 = 0;
  id v26 = (id *)&v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10007B150;
  v29 = sub_10007B160;
  id v30 = 0;
  id v8 = +[CBIDSManager sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10007F75C;
  v22[3] = &unk_100235208;
  id v24 = &v25;
  v22[4] = v8;
  id v9 = v7;
  id v23 = v9;
  id v10 = objc_retainBlock(v22);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v8;
    LogPrintF();
  }
  id v11 = v26;
  id obj = v26[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v11 + 5, obj);
  if (v12)
  {
    if (v8 && ([v8 isReady] & 1) != 0)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10007F838;
      v17[3] = &unk_100235320;
      void v17[4] = self;
      id v19 = v9;
      id v18 = v6;
      uint64_t v20 = &v25;
      [v8 fetchCloudPairingIdentifierForPeripheral:v18 withCompletion:v17];
    }
    else
    {
      uint64_t v13 = BTErrorF();
      id v14 = v26[5];
      v26[5] = (id)v13;
    }
  }
  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v25, 8);
}

- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BTCloudServicesXPCConnection *)self signingIdentity];
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    if (v8) {
      id v9 = (const char *)[v8 UTF8String];
    }
    else {
      id v9 = "Unknown";
    }
    uint64_t v17 = v9;
    id v19 = v6;
    LogPrintF();
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_10007B150;
  id v28 = sub_10007B160;
  id v29 = 0;
  id v10 = +[CBIDSManager sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007FD88;
  v21[3] = &unk_1002330A0;
  id v23 = &v24;
  id v11 = v7;
  id v22 = v11;
  unsigned __int8 v12 = objc_retainBlock(v21);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    id v18 = v10;
    LogPrintF();
  }
  uint64_t v13 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v18);
  objc_storeStrong(v13, obj);
  if (v14)
  {
    if (v10 && ([v10 isReady] & 1) != 0 && objc_msgSend(v6, "count"))
    {
      [v10 sendRePairRequest:v6 forBundleID:v8];
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
    else
    {
      uint64_t v15 = BTErrorF();
      uint64_t v16 = (void *)v25[5];
      v25[5] = v15;
    }
  }
  ((void (*)(void *))v12[2])(v12);

  _Block_object_dispose(&v24, 8);
}

- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10007B150;
  uint64_t v27 = sub_10007B160;
  id v28 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  id v9 = [v8 deviceManager];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100080104;
  v20[3] = &unk_100235208;
  id v22 = &v23;
  v20[4] = v9;
  id v10 = v7;
  id v21 = v10;
  id v11 = objc_retainBlock(v20);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v9;
    LogPrintF();
  }
  unsigned __int8 v12 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    uint64_t v15 = [v14 deviceManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000801E0;
    v17[3] = &unk_100235348;
    void v17[4] = self;
    id v18 = v10;
    [v15 fetchHMDeviceCloudRecordWithAddress:v6 completion:v17];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v23, 8);
}

- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  id v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100080580;
  v18[3] = &unk_100235208;
  uint64_t v20 = &v21;
  v18[4] = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v9;
    LogPrintF();
  }
  unsigned __int8 v12 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    uint64_t v15 = [v14 deviceManager];
    [v15 updateHMDeviceCloudRecordInfoWithRecordInfo:v6 completion:v10];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v21, 8);
}

- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  id v8 = +[CloudXPCService sharedInstance];
  id v9 = [v8 deviceManager];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008089C;
  v18[3] = &unk_100235208;
  uint64_t v20 = &v21;
  v18[4] = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = objc_retainBlock(v18);
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v9;
    LogPrintF();
  }
  unsigned __int8 v12 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v16);
  objc_storeStrong(v12, obj);
  if (v13)
  {
    unsigned __int8 v14 = +[CloudXPCService sharedInstance];
    uint64_t v15 = [v14 deviceManager];
    [v15 removeHMDeviceCloudRecordWithBluetoothAddress:v6 completion:v10];
  }
  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v21, 8);
}

- (void)clientReportHMDeviceCloudRecordInfosUpdated:(id)a3
{
  id v5 = a3;
  if ([(AACloudServicesClient *)self->_client internalFlags])
  {
    if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v4 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v4 hmDeviceCloudRecordInfosUpdated:v5];
  }
}

- (void)startSoundProfileRecordFileHandleSessionWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10007B150;
  id v26 = sub_10007B160;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100080D4C;
  v19[3] = &unk_1002330A0;
  uint64_t v21 = &v22;
  id v5 = v4;
  id v20 = v5;
  id v6 = objc_retainBlock(v19);
  id v7 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v8 = [(BTCloudServicesXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    id v9 = +[CloudXPCService sharedInstance];
    id v10 = [v9 deviceManager];

    if (v10)
    {
      id v11 = [v10 createSoundProfileRecordStagingURL];
      unsigned __int8 v12 = +[NSFileManager defaultManager];
      unsigned __int8 v13 = [v11 path];
      [v12 createFileAtPath:v13 contents:0 attributes:0];

      unsigned __int8 v14 = (id *)(v23 + 5);
      id v17 = (id)v23[5];
      uint64_t v15 = +[NSFileHandle fileHandleForWritingToURL:v11 error:&v17];
      objc_storeStrong(v14, v17);
      if (v15)
      {
        if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        (*((void (**)(id, void *, void))v5 + 2))(v5, v15, 0);
      }
    }
    else
    {
      uint64_t v16 = BTErrorF();
      id v11 = (void *)v23[5];
      v23[5] = v16;
    }
  }
  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v22, 8);
}

- (void)finishSoundProfileRecordSessionHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  id v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10007B150;
  v33 = sub_10007B160;
  id v34 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100081204;
  v26[3] = &unk_1002330A0;
  id v28 = &v29;
  id v7 = a4;
  id v27 = v7;
  unsigned __int8 v8 = objc_retainBlock(v26);
  id v9 = v30;
  id obj = v30[5];
  unsigned __int8 v10 = [(BTCloudServicesXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v9 + 5, obj);
  if (v10)
  {
    if (fcntl((int)[v6 fileDescriptor], 50, v35) == -1)
    {
      uint64_t v18 = BTErrorF();
      id v11 = v30[5];
      v30[5] = (id)v18;
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:v35];
      unsigned __int8 v12 = +[NSURL fileURLWithPath:v11];
      if ([v11 length])
      {
        if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        unsigned __int8 v13 = +[CloudXPCService sharedInstance];
        unsigned __int8 v14 = [v13 deviceManager];

        if (v14)
        {
          uint64_t v15 = self->_dispatchQueue;
          uint64_t v16 = +[CloudXPCService sharedInstance];
          [v16 beginTransaction:@"createSoundProfileRecordURL"];

          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000812D8;
          v23[3] = &unk_100232698;
          v23[4] = v15;
          id v24 = v7;
          [v14 addSoundProfileRecordWithURL:v12 completion:v23];
          id v17 = v30;
          id v22 = 0;
          [v6 closeAndReturnError:&v22];
          objc_storeStrong(v17 + 5, v22);
        }
        else
        {
          uint64_t v21 = BTErrorF();
          uint64_t v15 = (OS_dispatch_queue *)v30[5];
          v30[5] = (id)v21;
        }
      }
      else
      {
        uint64_t v19 = BTErrorF();
        id v20 = v30[5];
        v30[5] = (id)v19;
      }
    }
  }
  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v29, 8);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_10007B150;
  uint64_t v25 = sub_10007B160;
  id v26 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000816C0;
  v18[3] = &unk_1002330A0;
  id v20 = &v21;
  id v5 = v4;
  id v19 = v5;
  id v6 = objc_retainBlock(v18);
  id v7 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v8 = [(BTCloudServicesXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (v5)
    {
      id v9 = +[CloudXPCService sharedInstance];
      unsigned __int8 v10 = [v9 deviceManager];

      if (v10)
      {
        id v11 = self->_dispatchQueue;
        unsigned __int8 v12 = +[CloudXPCService sharedInstance];
        [v12 beginTransaction:@"fetchSoundProfileRecord"];

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100081798;
        v15[3] = &unk_100235398;
        v15[4] = v11;
        id v16 = v5;
        [v10 fetchSoundProfileRecordWithCompletion:v15];
      }
      else
      {
        uint64_t v14 = BTErrorF();
        id v11 = (OS_dispatch_queue *)v22[5];
        void v22[5] = v14;
      }
    }
    else
    {
      uint64_t v13 = BTErrorF();
      unsigned __int8 v10 = (void *)v22[5];
      void v22[5] = v13;
    }
  }
  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v21, 8);
}

- (void)deleteSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_100261308 <= 30 && (dword_100261308 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10007B150;
  id v24 = sub_10007B160;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100081BF0;
  v17[3] = &unk_1002330A0;
  id v19 = &v20;
  id v5 = v4;
  id v18 = v5;
  id v6 = objc_retainBlock(v17);
  id v7 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v8 = [(BTCloudServicesXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v7, obj);
  if (v8)
  {
    if (v5)
    {
      id v9 = +[CloudXPCService sharedInstance];
      unsigned __int8 v10 = [v9 deviceManager];

      if (v10)
      {
        id v11 = self->_dispatchQueue;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100081CC4;
        v14[3] = &unk_100232698;
        v14[4] = v11;
        id v15 = v5;
        [v10 removeSoundProfileRecordWithCompletion:v14];
      }
      else
      {
        uint64_t v13 = BTErrorF();
        id v11 = (OS_dispatch_queue *)v21[5];
        v21[5] = v13;
      }
    }
    else
    {
      uint64_t v12 = BTErrorF();
      unsigned __int8 v10 = (void *)v21[5];
      v21[5] = v12;
    }
  }
  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v20, 8);
}

- (BTUserCloudServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (AACloudServicesClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (void)setSigningIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end