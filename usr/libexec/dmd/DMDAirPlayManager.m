@interface DMDAirPlayManager
+ (DMDAirPlayManager)shared;
- (BOOL)_setOutputDevices:(id)a3 forSessionType:(unint64_t)a4 password:(id)a5 error:(id *)a6;
- (BOOL)startAirPlaySessionWithDestinationName:(id)a3 destinationDeviceID:(id)a4 password:(id)a5 scanWaitTime:(double)a6 sessionType:(unint64_t)a7 force:(BOOL)a8 error:(id *)a9;
- (BOOL)stopAirPlaySessionOfType:(unint64_t)a3 error:(id *)a4;
- (NSString)currentlyPickedDestinationDeviceID;
- (NSString)currentlyPickedDestinationName;
- (id)_discoverDeviceWithDestinationDeviceID:(id)a3 scanWaitTime:(double)a4 error:(id *)a5;
- (id)_discoverDeviceWithDestinationName:(id)a3 scanWaitTime:(double)a4 sessionType:(unint64_t)a5;
- (id)_messageForAirPlayPromptOnDisplayNamed:(id)a3;
- (id)initPrivate;
- (void)_outputContextForSessionType:(unint64_t)a3;
- (void)_promptUserToMirrorOnDisplayNamed:(id)a3 withCompletion:(id)a4;
- (void)setCurrentlyPickedDestinationDeviceID:(id)a3;
- (void)setCurrentlyPickedDestinationName:(id)a3;
@end

@implementation DMDAirPlayManager

+ (DMDAirPlayManager)shared
{
  if (qword_1000FB938 != -1) {
    dispatch_once(&qword_1000FB938, &stru_1000C9C68);
  }
  v2 = (void *)qword_1000FB930;

  return (DMDAirPlayManager *)v2;
}

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)DMDAirPlayManager;
  v2 = [(DMDAirPlayManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    currentlyPickedDestinationName = v2->_currentlyPickedDestinationName;
    v2->_currentlyPickedDestinationName = 0;

    currentlyPickedDestinationDeviceID = v3->_currentlyPickedDestinationDeviceID;
    v3->_currentlyPickedDestinationDeviceID = 0;
  }
  return v3;
}

- (BOOL)startAirPlaySessionWithDestinationName:(id)a3 destinationDeviceID:(id)a4 password:(id)a5 scanWaitTime:(double)a6 sessionType:(unint64_t)a7 force:(BOOL)a8 error:(id *)a9
{
  BOOL v10 = a8;
  unint64_t v17 = (unint64_t)a3;
  unint64_t v18 = (unint64_t)a4;
  id v19 = a5;
  if (!(v17 | v18))
  {
    v42 = +[NSAssertionHandler currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"DMDAirPlayManager.m" lineNumber:72 description:@"must provide a destination name or deviceID"];
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_100013B54;
  v54 = sub_100013B64;
  id v55 = 0;
  double v20 = 10.0;
  if (a6 >= 10.0)
  {
    double v20 = a6;
    if (a6 > 500.0) {
      double v20 = 500.0;
    }
  }
  if ([(DMDAirPlayManager *)self _outputContextForSessionType:a7])
  {
    v21 = (void *)MRAVOutputContextCopyOutputDevices();
    if ([v21 count])
    {
      v22 = [v21 firstObject];
      v23 = (void *)MRAVOutputDeviceCopyName();
      [(DMDAirPlayManager *)self setCurrentlyPickedDestinationName:v23];

      v24 = [v21 firstObject];
      v25 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      [(DMDAirPlayManager *)self setCurrentlyPickedDestinationDeviceID:v25];
    }
    else
    {
      [(DMDAirPlayManager *)self setCurrentlyPickedDestinationDeviceID:0];
      [(DMDAirPlayManager *)self setCurrentlyPickedDestinationName:0];
    }
  }
  self->mDeviceIDIsMAC = 0;
  if (v18)
  {
    v26 = [(DMDAirPlayManager *)self currentlyPickedDestinationDeviceID];
    unsigned __int8 v27 = [v26 isEqualToString:v18];

    if (v27)
    {
      v28 = 0;
LABEL_20:
      BOOL v33 = 1;
      goto LABEL_26;
    }
    if ([(id)v18 containsString:@":"])
    {
      self->mDeviceIDIsMAC = 1;
      id v29 = (id)v18;

      v28 = 0;
      unint64_t v17 = (unint64_t)v29;
    }
    else
    {
      v30 = (id *)(v51 + 5);
      id obj = (id)v51[5];
      v28 = [(DMDAirPlayManager *)self _discoverDeviceWithDestinationDeviceID:v18 scanWaitTime:&obj error:v20];
      objc_storeStrong(v30, obj);
      if (!v17) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    v28 = 0;
    if (!v17) {
      goto LABEL_22;
    }
  }
  v31 = [(DMDAirPlayManager *)self currentlyPickedDestinationName];
  unsigned __int8 v32 = [v31 isEqualToString:v17];

  if (v32) {
    goto LABEL_20;
  }
  uint64_t v34 = [(DMDAirPlayManager *)self _discoverDeviceWithDestinationName:v17 scanWaitTime:a7 sessionType:v20];

  v28 = (void *)v34;
LABEL_22:
  if (!v51[5])
  {
    if ([v28 count])
    {
      if (v10)
      {
        v37 = (id *)(v51 + 5);
        id v48 = (id)v51[5];
        [(DMDAirPlayManager *)self _setOutputDevices:v28 forSessionType:a7 password:v19 error:&v48];
        objc_storeStrong(v37, v48);
      }
      else
      {
        v40 = [v28 objectAtIndexedSubscript:0];
        v41 = (void *)MRAVOutputDeviceCopyName();
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100013B6C;
        v43[3] = &unk_1000C9C90;
        v43[4] = self;
        id v44 = v28;
        unint64_t v47 = a7;
        id v45 = v19;
        v46 = &v50;
        [(DMDAirPlayManager *)self _promptUserToMirrorOnDisplayNamed:v41 withCompletion:v43];
      }
    }
    else
    {
      uint64_t v38 = DMFErrorWithCodeAndUserInfo();
      v39 = (void *)v51[5];
      v51[5] = v38;
    }
  }
  v35 = v51;
  if (a9)
  {
    *a9 = (id) v51[5];
    v35 = v51;
  }
  BOOL v33 = v35[5] == 0;
LABEL_26:

  _Block_object_dispose(&v50, 8);
  return v33;
}

- (BOOL)stopAirPlaySessionOfType:(unint64_t)a3 error:(id *)a4
{
  return [(DMDAirPlayManager *)self _setOutputDevices:0 forSessionType:a3 password:0 error:a4];
}

- (void)_outputContextForSessionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return (void *)_MRAVOutputContextGetSharedSystemScreenContext(self, a2);
    case 2uLL:
      return (void *)_MRAVOutputContextGetSharedSystemAudioContext(self, a2);
    case 1uLL:
      return (void *)_MRAVOutputContextGetSharedAudioPresentationContext(self, a2);
  }
  return 0;
}

- (BOOL)_setOutputDevices:(id)a3 forSessionType:(unint64_t)a4 password:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(DMDAirPlayManager *)self _outputContextForSessionType:a4];
  v13 = objc_opt_new();
  v14 = v13;
  if (v11) {
    [v13 setObject:v11 forKeyedSubscript:@"AVOutputContextSetOutputDevicePasswordKey"];
  }
  if (!v12)
  {
    double v20 = DMFErrorWithCodeAndUserInfo();
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  NSSelectorFromString(@"avOutputContext");
  if (objc_opt_respondsToSelector())
  {
    v15 = [v12 valueForKey:@"avOutputContext"];
    uint64_t v16 = +[NSNumber numberWithInt:getpid()];
    [v15 setValue:v16 forKey:@"applicationProcessID"];

    NSSelectorFromString(@"avOutputDevice");
    unint64_t v17 = [v10 firstObject];
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      unint64_t v18 = [v10 firstObject];
      id v19 = [v18 valueForKey:@"avOutputDevice"];
    }
    else
    {
      id v19 = 0;
    }
    SEL v21 = NSSelectorFromString(@"setOutputDevice:options:");
    if (objc_opt_respondsToSelector()) {
      ((void (*)(void *, SEL, void *, void *))[v15 methodForSelector:v21])(v15, v21, v19, v14);
    }
  }
  double v20 = 0;
  if (a6) {
LABEL_14:
  }
    *a6 = v20;
LABEL_15:

  return v20 == 0;
}

- (void)_promptUserToMirrorOnDisplayNamed:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v16 = (id)objc_opt_new();
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"AirPlay" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v16 setHeader:v9];

  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"Display" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v16 setDefaultButtonTitle:v11];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
  [v16 setAlternateButtonTitle:v13];

  v14 = [(DMDAirPlayManager *)self _messageForAirPlayPromptOnDisplayNamed:v7];

  [v16 setMessage:v14];
  v15 = +[DMDUserNotificationController sharedController];
  [v15 showNotification:v16 completion:v6];
}

- (id)_messageForAirPlayPromptOnDisplayNamed:(id)a3
{
  id v3 = a3;
  v4 = +[DMDDeviceController shared];
  v5 = [v4 deviceType];
  id v6 = [v5 unsignedIntegerValue];

  switch((unint64_t)v6)
  {
    case 1uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your iPhone's screen on “%@”?";
      break;
    case 2uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your iPod's screen on “%@”?";
      break;
    case 3uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your iPad's screen on “%@”?";
      break;
    case 4uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your Apple TV's output on “%@”?";
      break;
    case 7uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your Mac's screen on “%@”?";
      break;
    case 8uLL:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your Apple Vision Pro's screen on “%@”?";
      break;
    default:
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = v7;
      CFStringRef v9 = @"Would you like to display your device's screen on “%@”?";
      break;
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_1000CC390 table:@"DMFNotifications"];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v3);

  return v11;
}

- (id)_discoverDeviceWithDestinationDeviceID:(id)a3 scanWaitTime:(double)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  unsigned __int8 v27 = sub_100013B54;
  v28 = sub_100013B64;
  id v29 = 0;
  uint64_t v20 = 0;
  SEL v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  id v30 = v7;
  +[NSArray arrayWithObjects:&v30 count:1];
  v8 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
  MRAVReconnaissanceSessionSetUseWeakMatching();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000144AC;
  block[3] = &unk_1000C9CE0;
  double v19 = a4;
  id v16 = &v20;
  unint64_t v17 = &v24;
  unint64_t v18 = v8;
  CFStringRef v9 = dispatch_semaphore_create(0);
  v15 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  CFRelease(v8);
  id v10 = (void *)v21[3];
  if (a5) {
    *a5 = (id) v25[5];
  }
  id v11 = v15;
  id v12 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_discoverDeviceWithDestinationName:(id)a3 scanWaitTime:(double)a4 sessionType:(unint64_t)a5
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = sub_100013B54;
  double v19 = sub_100013B64;
  id v20 = 0;
  id v7 = (const void *)MRAVRoutingDiscoverySessionCreate();
  MRAVRoutingDiscoverySessionSetDiscoveryMode();
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback();
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_semaphore_wait(v10, v12);
  if (v11) {
    MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback();
  }
  CFRelease(v7);
  id v13 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v13;
}

- (NSString)currentlyPickedDestinationName
{
  return self->_currentlyPickedDestinationName;
}

- (void)setCurrentlyPickedDestinationName:(id)a3
{
}

- (NSString)currentlyPickedDestinationDeviceID
{
  return self->_currentlyPickedDestinationDeviceID;
}

- (void)setCurrentlyPickedDestinationDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPickedDestinationDeviceID, 0);

  objc_storeStrong((id *)&self->_currentlyPickedDestinationName, 0);
}

@end