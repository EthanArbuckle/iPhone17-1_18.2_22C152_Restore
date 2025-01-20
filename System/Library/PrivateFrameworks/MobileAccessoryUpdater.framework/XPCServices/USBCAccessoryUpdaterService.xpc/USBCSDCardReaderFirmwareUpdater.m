@interface USBCSDCardReaderFirmwareUpdater
- (id)downloadFirmware:(id)a3 hardware:(id)a4 progress:(id)a5;
- (id)findFirmware:(id)a3 hardware:(id)a4 searchRemote:(BOOL)a5;
- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6;
@end

@implementation USBCSDCardReaderFirmwareUpdater

- (id)findFirmware:(id)a3 hardware:(id)a4 searchRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  [(MobileAsset *)self->super._mobileAsset setAssetType:@"com.apple.MobileAsset.MobileAccessoryUpdate.A245"];
  mobileAsset = self->super._mobileAsset;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000060FC;
  v15[3] = &unk_1000243F8;
  v15[4] = self;
  id v10 = v7;
  id v17 = v10;
  v11 = v8;
  v16 = v11;
  id v12 = [(MobileAsset *)mobileAsset findAsset:v5 completion:v15];
  dispatch_time_t v13 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v11, v13)) {
    [(FudPluginDelegate *)self->super.super._delegate log:7 format:@"Error: Timed out waiting for MobileAsset download\n"];
  }

  return 0;
}

- (id)validateFirmware:(id)a3 hardware:(id)a4 firmware:(id)a5 progress:(id)a6
{
  id v7 = (void (**)(id, uint64_t, void, void *))a3;
  dispatch_semaphore_t v8 = [(MobileAsset *)self->super._mobileAsset fwBundleFileName];

  if (v8)
  {
    v9 = 0;
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
  if (v7) {
LABEL_3:
  }
    v7[2](v7, 1, 0, v9);
LABEL_4:

  return v9;
}

- (id)downloadFirmware:(id)a3 hardware:(id)a4 progress:(id)a5
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  mobileAsset = self->super._mobileAsset;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100006390;
  id v17 = &unk_100024420;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  v18 = v10;
  id v11 = [(MobileAsset *)mobileAsset downloadAsset:&v14];
  dispatch_time_t v12 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v10, v12)) {
    [(FudPluginDelegate *)self->super.super._delegate log:7, @"Error: Timed out waiting for MobileAsset download\n", v14, v15, v16, v17 format];
  }

  return 0;
}

@end