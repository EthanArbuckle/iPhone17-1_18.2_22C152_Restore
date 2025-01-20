@interface DefaultModalClient
- (BOOL)areAllUpdatesRequired;
- (DefaultModalClient)initWithGroup:(id)a3;
- (NSString)modalDeviceClass;
- (id)copyNotificationOptions;
- (void)dealloc;
- (void)deviceClassAttached:(id)a3;
- (void)deviceClassDetached:(id)a3 error:(id)a4;
- (void)setInstallerUpdateActive:(BOOL)a3;
- (void)setModalDeviceClass:(id)a3;
- (void)shouldInstallUpdateForAccessory:(id)a3 deviceClass:(id)a4 nextStep:(id)a5 withOptions:(id)a6 handler:(id)a7;
- (void)stepComplete:(id)a3 deviceClass:(id)a4 successful:(BOOL)a5 info:(id)a6 error:(id)a7;
- (void)stepRunning:(id)a3 deviceClass:(id)a4 progress:(double)a5 overallProgress:(double)a6 info:(id)a7;
- (void)storeDeclinedAccessoryatURL:(id)a3 serialNumber:(id)a4;
@end

@implementation DefaultModalClient

- (DefaultModalClient)initWithGroup:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DefaultModalClient;
  uint64_t v14 = 0;
  v4 = [(DefaultModalClient *)&v13 init];
  v4->modalDeviceClass = 0;
  v4->ignorePromptResponse = 0;
  v4->lastUpdateTime = 0;
  v4->updateInProgress = 0;
  v4->updater = 0;
  v4->notification = 0;
  v4->useProgressBar = 0;
  v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  v4->queuedAccessories = v5;
  v4->installerUpdateActive = 0;
  if (v5
    && (v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0),
        v4->attr = (OS_dispatch_queue_attr *)v6,
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.defaultmodalclient", v6),
        (v4->processingQueue = (OS_dispatch_queue *)v7) != 0)
    && (v8 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", @"com.apple.fud.defaultmodalclient", @"ClientRegistrationName")) != 0&& (v9 = (MobileAccessoryUpdater *)[objc_alloc((Class)MobileAccessoryUpdater) initWithPluginIdentifier:a3 isGroupIdentifier:1 delegate:v4 isInternalClient:1 options:v8 error:&v14], (v4->updater = v9) != 0))
  {
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v4->frameworkBundle = v10;
    if (v10)
    {
      if (![(NSBundle *)v10 isLoaded]) {
        [(NSBundle *)v4->frameworkBundle load];
      }
    }
    else
    {
      FudLog();
    }
  }
  else
  {
    FudLog();
    v11 = v4;
    return 0;
  }
  return v4;
}

- (void)setInstallerUpdateActive:(BOOL)a3
{
  self->installerUpdateActive = a3;
}

- (void)deviceClassAttached:(id)a3
{
  processingQueue = self->processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002915C;
  v4[3] = &unk_10007D4B0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(processingQueue, v4);
}

- (void)deviceClassDetached:(id)a3 error:(id)a4
{
  processingQueue = self->processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000292F0;
  block[3] = &unk_10007D500;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async(processingQueue, block);
}

- (void)stepRunning:(id)a3 deviceClass:(id)a4 progress:(double)a5 overallProgress:(double)a6 info:(id)a7
{
  FudLog();
  if ((objc_msgSend(objc_msgSend(a7, "objectForKey:", @"SilentUpdateNoUI", a3, a4, *(void *)&a5, *(void *)&a6, a7), "BOOLValue") & 1) == 0)
  {
    processingQueue = self->processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000294C4;
    block[3] = &unk_10007D8D8;
    block[4] = a3;
    block[5] = self;
    *(double *)&block[8] = a6;
    block[6] = a4;
    void block[7] = a7;
    dispatch_async(processingQueue, block);
  }
}

- (void)shouldInstallUpdateForAccessory:(id)a3 deviceClass:(id)a4 nextStep:(id)a5 withOptions:(id)a6 handler:(id)a7
{
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  SInt32 error = 0;
  id v11 = objc_msgSend(a6, "objectForKey:", @"UpdateRequired", a4, a5);
  id v12 = [a6 objectForKey:@"OptionsDict"];
  id v13 = [a6 objectForKey:@"SeedConsentRequired"];
  BOOL v35 = v13 != 0;
  id v14 = [a6 objectForKey:@"AccessoryName"];
  id v15 = [a6 objectForKey:@"SeedUpdateDeclinedPath"];
  if (v15) {
    v34 = +[NSURL fileURLWithPath:v15];
  }
  else {
    v34 = 0;
  }
  id v16 = [a6 objectForKey:@"SerialNumber"];
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = a3;
  }
  if (v12)
  {
    id v12 = [v12 objectForKey:@"CurrentFirmwareVersionOnAccessory"];
    BOOL v18 = v12 != 0;
    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v18 = 0;
    if (!v11) {
      goto LABEL_12;
    }
  }
  if ([v11 BOOLValue])
  {
LABEL_13:
    FudLog();
    goto LABEL_15;
  }
LABEL_12:
  if ([(DefaultModalClient *)self areAllUpdatesRequired]) {
    goto LABEL_13;
  }
  if (!self->notification)
  {
    FudLog();
    id v19 = [(DefaultModalClient *)self copyNotificationOptions];
    if (v19)
    {
      v20 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework"];
      if (v20)
      {
        id v21 = +[FudUtilities getLocalizedString:a3 withBundle:v20 defaultValue:a3];
        if (v21)
        {
          if (v13) {
            v22 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[FudUtilities getLocalizedString:@"Install Pre-Release Firmware Title" withBundle:v20 defaultValue:@"Install Pre-Release Firmware Title"], @"%@%@", 0, v21, v17);
          }
          else {
            v22 = +[FudUtilities getLocalizedString:@"Accessory Update Available" withBundle:v20 defaultValue:@"Accessory Update Available"];
          }
          [v19 setObject:v22 forKey:kCFUserNotificationAlertHeaderKey];
          if (v13) {
            CFStringRef v23 = @"Install Pre-Release Firmware Body";
          }
          else {
            CFStringRef v23 = @"Update Optional Prompt";
          }
          v24 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[FudUtilities getLocalizedString:v23 withBundle:v20 defaultValue:v23], @"%@", 0, v21);
          if (v18) {
            [(NSString *)v24 appendString:+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", +[FudUtilities getLocalizedString:@"Current Firmware Version" withBundle:v20 defaultValue:@"Current Firmware Version"], @"%@", 0, v12)];
          }
          if (v24)
          {
            [v19 setObject:v24 forKey:kCFUserNotificationAlertMessageKey];
            if (v13)
            {
              id v25 = +[FudUtilities getLocalizedString:@"Install" withBundle:v20 defaultValue:@"Install"];
              objc_msgSend(v19, "setObject:forKey:", +[FudUtilities getLocalizedString:withBundle:defaultValue:](FudUtilities, "getLocalizedString:withBundle:defaultValue:", @"Not Now", v20, @"Not Now"), kCFUserNotificationDefaultButtonTitleKey);
            }
            else
            {
              id v26 = +[FudUtilities getLocalizedString:@"Update" withBundle:v20 defaultValue:@"Update"];
              id v25 = +[FudUtilities getLocalizedString:@"Later" withBundle:v20 defaultValue:@"Later"];
              [v19 setObject:v26 forKey:kCFUserNotificationDefaultButtonTitleKey];
            }
            [v19 setObject:v25 forKey:kCFUserNotificationAlternateButtonTitleKey];
            FudLog();
            [(DefaultModalClient *)self setModalDeviceClass:a4];
            v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, (CFDictionaryRef)v19);
            self->notification = v27;
            if (v27)
            {
              v28 = qword_1000975B0;
              global_queue = dispatch_get_global_queue(0, 0);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100029D60;
              block[3] = &unk_10007D928;
              void block[7] = a7;
              block[8] = &v40;
              BOOL v38 = v35;
              block[4] = self;
              block[5] = v34;
              block[6] = v16;
              dispatch_group_async(v28, global_queue, block);
              goto LABEL_36;
            }
          }
        }
      }
    }
    goto LABEL_13;
  }
LABEL_15:
  (*((void (**)(id, void))a7 + 2))(a7, *((unsigned __int8 *)v41 + 24));
  if (*((unsigned char *)v41 + 24))
  {
    FudLog();
    [(MobileAccessoryUpdater *)self->updater performNextStepWithOptions:0];
  }
  else
  {
    FudLog();
    id v30 = [(NSMutableArray *)self->queuedAccessories count];
    queuedAccessories = self->queuedAccessories;
    FudLog();
    self->updateInProgress = 0;
    self->forceRestart = 0;
    -[MobileAccessoryUpdater doneWithOptions:](self->updater, "doneWithOptions:", 0, v30, queuedAccessories);
    if ([(NSMutableArray *)self->queuedAccessories count])
    {
      id v31 = [(NSMutableArray *)self->queuedAccessories firstObject];
      v33 = self->queuedAccessories;
      FudLog();
      [(DefaultModalClient *)self deviceClassAttached:[(NSMutableArray *)self->queuedAccessories firstObject]];
      [(NSMutableArray *)self->queuedAccessories removeObjectAtIndex:0];
      FudLog();
    }
  }
LABEL_36:
  _Block_object_dispose(&v40, 8);
}

- (void)storeDeclinedAccessoryatURL:(id)a3 serialNumber:(id)a4
{
  v6 = +[NSFileManager defaultManager];
  if (a3 && a4)
  {
    dispatch_queue_t v7 = v6;
    if (([a3 checkResourceIsReachableAndReturnError:0] & 1) == 0) {
      [(NSFileManager *)v7 createDirectoryAtURL:a3 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v8 = [a3 URLByAppendingPathComponent:a4];
    FudLog();
    if (!-[NSFileManager createFileAtPath:contents:attributes:](v7, "createFileAtPath:contents:attributes:", objc_msgSend(v8, "path", v8), objc_msgSend(a4, "dataUsingEncoding:", 4), 0))FudLog(); {
  }
    }
}

- (void)stepComplete:(id)a3 deviceClass:(id)a4 successful:(BOOL)a5 info:(id)a6 error:(id)a7
{
  processingQueue = self->processingQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A098;
  v8[3] = &unk_10007D978;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a6;
  v8[7] = a3;
  BOOL v9 = a5;
  v8[8] = a7;
  dispatch_async(processingQueue, v8);
}

- (BOOL)areAllUpdatesRequired
{
  v2 = [+[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.apple.MobileAccessoryUpdater"];
  if (!v2) {
    return 0;
  }
  id v3 = [(NSDictionary *)v2 objectForKey:@"AllUpdatesRequired"];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [v4 BOOLValue];
}

- (id)copyNotificationOptions
{
  id v2 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  [v2 setObject:kCFBooleanFalse forKey:@"DismissOnLock"];
  [v2 setObject:kCFBooleanTrue forKey:@"SBUserNotificationDontDismissOnUnlock"];
  return v2;
}

- (void)dealloc
{
  notification = self->notification;
  if (notification) {
    CFRelease(notification);
  }
  updater = self->updater;
  if (updater) {

  }
  frameworkBundle = self->frameworkBundle;
  if (frameworkBundle) {

  }
  queuedAccessories = self->queuedAccessories;
  if (queuedAccessories) {

  }
  modalDeviceClass = self->modalDeviceClass;
  if (modalDeviceClass) {

  }
  processingQueue = self->processingQueue;
  if (processingQueue) {
    dispatch_release(processingQueue);
  }

  v9.receiver = self;
  v9.super_class = (Class)DefaultModalClient;
  [(DefaultModalClient *)&v9 dealloc];
}

- (NSString)modalDeviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModalDeviceClass:(id)a3
{
}

@end