@interface USBCHDMIAdapterFirmwareUpdater
- (USBCHDMIAdapterFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3;
- (id)downloadFirmware:(id)a3 hardware:(id)a4 progress:(id)a5;
- (id)findFirmware:(id)a3 hardware:(id)a4 searchRemote:(BOOL)a5;
- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
@end

@implementation USBCHDMIAdapterFirmwareUpdater

- (USBCHDMIAdapterFirmwareUpdater)initWithRegistryEntry:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)USBCHDMIAdapterFirmwareUpdater;
  result = [(USBCSimpleUVDMFirmwareUpdater *)&v4 initWithRegistryEntry:*(void *)&a3];
  if (result) {
    result->super._initialDelay = 10.0;
  }
  return result;
}

- (id)findFirmware:(id)a3 hardware:(id)a4 searchRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_100012064;
  v36[4] = sub_100012074;
  id v37 = 0;
  v27 = [(USBCSimpleUVDMFirmwareUpdater *)self DeviceSerialNumber];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = [v9 objectForKey:@"UseDropboxLocation"];
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    self->super._useDropboxLocation = 1;
    v13 = +[NSString stringWithFormat:@"%@%@", @"/var/tmp/", @"A2119-22G/"];
    [(FudPluginDelegate *)self->super.super._delegate log:7, @"Getting firmware from dropbox path: %@\n", v13 format];
    v14 = +[NSFileManager defaultManager];
    id v35 = 0;
    v15 = [v14 contentsOfDirectoryAtPath:v13 error:&v35];
    id v16 = v35;

    [(FudPluginDelegate *)self->super.super._delegate log:7, @"firmwareFiles found: %@\n", v15 format];
    v17 = 0;
    if (!v16 && v15)
    {
      if ([v15 count])
      {
        v18 = [v15 firstObject];
        v17 = +[NSString stringWithFormat:@"%@%@", v13, v18];

        v19 = +[NSData dataWithContentsOfFile:v17];
        firmware = self->super._firmware;
        self->super._firmware = v19;

        if (self->super._firmware)
        {
          [(FudPluginDelegate *)self->super.super._delegate log:7, @"Using firmware: %@\n", v17 format];
          id v16 = 0;
          *((unsigned char *)v43 + 24) = 1;
        }
        else
        {
          id v16 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
        }
      }
      else
      {
        v17 = 0;
        id v16 = 0;
      }
    }
  }
  else
  {
    [(MobileAsset *)self->super._mobileAsset setAssetType:@"com.apple.MobileAsset.MobileAccessoryUpdate.A2119-22G"];
    mobileAsset = self->super._mobileAsset;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001207C;
    v28[3] = &unk_100024590;
    v32 = &v42;
    v28[4] = self;
    v33 = &v38;
    id v29 = v27;
    v34 = v36;
    id v31 = v8;
    v22 = v10;
    v30 = v22;
    id v23 = [(MobileAsset *)mobileAsset findAsset:v5 completion:v28];
    dispatch_time_t v24 = dispatch_time(0, 120000000000);
    if (dispatch_semaphore_wait(v22, v24)) {
      [(FudPluginDelegate *)self->super.super._delegate log:7 format:@"Error: Timed out waiting for MobileAsset download\n"];
    }

    v15 = 0;
    v13 = 0;
    v17 = 0;
    id v16 = 0;
  }
  if (v8 && self->super._useDropboxLocation) {
    (*((void (**)(id, void, void, void, id))v8 + 2))(v8, *((unsigned __int8 *)v43 + 24), *((unsigned __int8 *)v39 + 24), 0, v16);
  }
  id v25 = v16;

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  v7 = (void (**)(id, uint64_t, void, void *))a3;
  id v8 = [(MobileAsset *)self->super._mobileAsset fwBundleFileName];
  if (v8)
  {

    goto LABEL_4;
  }
  if (self->super._firmware)
  {
LABEL_4:
    id v9 = 0;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
  if (v7) {
LABEL_5:
  }
    v7[2](v7, 1, 0, v9);
LABEL_6:

  return v9;
}

- (id)downloadFirmware:(id)a3 hardware:(id)a4 progress:(id)a5
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  mobileAsset = self->super._mobileAsset;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100012430;
  v17 = &unk_100024420;
  id v9 = v6;
  id v19 = v9;
  dispatch_semaphore_t v10 = v7;
  v18 = v10;
  id v11 = [(MobileAsset *)mobileAsset downloadAsset:&v14];
  dispatch_time_t v12 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v10, v12)) {
    [(FudPluginDelegate *)self->super.super._delegate log:7, @"Error: Timed out waiting for MobileAsset download\n", v14, v15, v16, v17 format];
  }

  return 0;
}

@end