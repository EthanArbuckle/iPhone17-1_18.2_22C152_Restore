@interface FudEarlyBoot
- (FudEarlyBoot)init;
- (int)doFUDEarlyBoot:(id)a3;
- (void)calculateTimeTakenForEarlyBootEntries;
- (void)dealloc;
- (void)earlyBootAccessoryAttached:(id)a3;
- (void)updateFWForDeviceClass:(id)a3 dict:(id)a4;
@end

@implementation FudEarlyBoot

- (FudEarlyBoot)init
{
  v3.receiver = self;
  v3.super_class = (Class)FudEarlyBoot;
  return [(FudEarlyBoot *)&v3 init];
}

- (int)doFUDEarlyBoot:(id)a3
{
  FudLog();
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (!v5)
  {
    v21 = "-[FudEarlyBoot doFUDEarlyBoot:]";
    FudLog();
    int v18 = 1;
    goto LABEL_19;
  }
  v6 = v5;
  v7 = (AppleFirmwareUpdateController *)objc_msgSend(objc_alloc((Class)AppleFirmwareUpdateController), "initWithRegistryEntryID:fwAssetDirectory:", 0, 0, "-[FudEarlyBoot doFUDEarlyBoot:]");
  self->_afuController = v7;
  if (v7)
  {
    [(AppleFirmwareUpdateController *)v7 getEarlyBootList:v6];
    if ([v6 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            v12 = self;
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v6);
            }
            v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v14 = +[NSMutableDictionary dictionary];
            id v15 = [v13 objectForKeyedSubscript:@"DeviceClassName"];
            objc_msgSend(v14, "addEntriesFromDictionary:", objc_msgSend(v13, "objectForKeyedSubscript:", @"OptionsDict"));
            if (a3) {
              [v14 addEntriesFromDictionary:a3];
            }
            FudLog();
            self = v12;
            -[FudEarlyBoot updateFWForDeviceClass:dict:](v12, "updateFWForDeviceClass:dict:", v15, v14, "-[FudEarlyBoot doFUDEarlyBoot:]", v14);
          }
          id v9 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v9);
      }
      if (!objc_msgSend(-[AppleFirmwareUpdateController getPendingEarlyBootAccessories](self->_afuController, "getPendingEarlyBootAccessories"), "count"))goto LABEL_17; {
      self->_startWaitingForCriticalEarlyBootEntries = +[NSDate date];
      }
      self->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      [(AppleFirmwareUpdateController *)self->_afuController setDelegate:self];
      [(AppleFirmwareUpdateController *)self->_afuController registerForPendingEarlyBootAccessories];
      semaphore = self->_semaphore;
      dispatch_time_t v17 = dispatch_time(0, 5000000000);
      if (!dispatch_semaphore_wait((dispatch_semaphore_t)semaphore, v17)) {
        goto LABEL_17;
      }
      v20 = "-[FudEarlyBoot doFUDEarlyBoot:]";
      id v22 = [(AppleFirmwareUpdateController *)self->_afuController getPendingEarlyBootAccessories];
    }
  }
  FudLog();
LABEL_17:
  objc_msgSend(v6, "removeAllObjects", v20, v22);

  int v18 = 0;
LABEL_19:
  [(FudEarlyBoot *)self calculateTimeTakenForEarlyBootEntries];
  FudLog();

  return v18;
}

- (void)calculateTimeTakenForEarlyBootEntries
{
  if (self->_startWaitingForCriticalEarlyBootEntries) {
    [+[NSDate date] timeIntervalSinceDate:self->_startWaitingForCriticalEarlyBootEntries];
  }
  FudLog();
}

- (void)earlyBootAccessoryAttached:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"DeviceClassName"];
  id v7 = [a3 objectForKeyedSubscript:@"OptionsDict"];
  FudLog();
  -[FudEarlyBoot updateFWForDeviceClass:dict:](self, "updateFWForDeviceClass:dict:", v5, objc_msgSend(a3, "objectForKeyedSubscript:", @"OptionsDict", "-[FudEarlyBoot earlyBootAccessoryAttached:]", v7));
  if (!objc_msgSend(-[AppleFirmwareUpdateController getPendingEarlyBootAccessories](self->_afuController, "getPendingEarlyBootAccessories"), "count"))
  {
    FudLog();
    semaphore = self->_semaphore;
    dispatch_semaphore_signal((dispatch_semaphore_t)semaphore);
  }
}

- (void)dealloc
{
  semaphore = self->_semaphore;
  if (semaphore)
  {
    dispatch_release((dispatch_object_t)semaphore);
    self->_semaphore = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FudEarlyBoot;
  [(FudEarlyBoot *)&v4 dealloc];
}

- (void)updateFWForDeviceClass:(id)a3 dict:(id)a4
{
  FudLog();
  id v7 = objc_msgSend(objc_alloc((Class)AppleFirmwareUpdateController), "initWithRegistryEntryID:fwAssetDirectory:", objc_msgSend(a4, "objectForKeyedSubscript:", @"IOMatchLaunchServiceID", "-[FudEarlyBoot updateFWForDeviceClass:dict:]", a3, a4), objc_msgSend(a4, "objectForKeyedSubscript:", @"FWDirectory"));
  [v7 enableEarlyBootLoggingMode];
  if ([v7 createFWAssetInfo]) {
    [v7 updateFirmwareWithOptions:0];
  }
}

@end