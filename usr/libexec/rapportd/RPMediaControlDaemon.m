@interface RPMediaControlDaemon
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMediaControlDaemon)init;
- (RPMessageable)messenger;
- (id)sendInterestEventHandler;
- (void)_handleCommand:(id)a3 responseHandler:(id)a4;
- (void)_handleGetVolume:(id)a3 responseHandler:(id)a4;
- (void)_handleMediaCaptionGet:(id)a3 responseHandler:(id)a4;
- (void)_handleMediaCaptionSet:(id)a3 responseHandler:(id)a4;
- (void)_handleMovementCommand:(unsigned int)a3 endCommand:(unsigned int)a4;
- (void)_handleSetVolume:(id)a3 responseHandler:(id)a4;
- (void)_handleSkipByRequest:(id)a3 responseHandler:(id)a4;
- (void)_mediaControlEnsureStarted;
- (void)_mediaControlEnsureStopped;
- (void)_mediaControlFlagsUpdate:(unint64_t)a3 mask:(unint64_t)a4;
- (void)_mediaRemoteSupportedCommandsChanged;
- (void)_mediaRemoteSupportedCommandsGet;
- (void)_mediaRemoteVolumeControlChanged:(id)a3;
- (void)_mediaRemoteVolumeControlUpdate;
- (void)_update;
- (void)deregisteredEventID:(id)a3;
- (void)invalidate;
- (void)registeredEventID:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setSendInterestEventHandler:(id)a3;
@end

@implementation RPMediaControlDaemon

- (RPMediaControlDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPMediaControlDaemon;
  v2 = [(RPMediaControlDaemon *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_messenger;
  if (v7)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v12 = @"statusFlags";
    v13 = &off_10012B2A0;
    v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000734F4;
    v11[3] = &unk_100121CA0;
    v11[4] = self;
    [(RPMessageable *)v7 registerRequestID:@"_mcc" options:v9 handler:v11];
  }
  else
  {
    v8 = RPErrorF();
    if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a3) {
      *a3 = v8;
    }
  }
  return v7 != 0;
}

- (void)invalidate
{
  if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_movementEndTimer)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    MRMediaRemoteSendCommand();
    self->_movementCommand = 3;
    movementEndTimer = self->_movementEndTimer;
    if (movementEndTimer)
    {
      v4 = movementEndTimer;
      dispatch_source_cancel(v4);
      v5 = self->_movementEndTimer;
      self->_movementEndTimer = 0;
    }
  }
  [(RPMessageable *)self->_messenger deregisterRequestID:@"_mcc"];
  messenger = self->_messenger;
  self->_messenger = 0;

  id sendInterestEventHandler = self->_sendInterestEventHandler;
  self->_id sendInterestEventHandler = 0;

  [(RPMediaControlDaemon *)self _mediaControlEnsureStopped];
}

- (void)registeredEventID:(id)a3
{
  if ([a3 isEqual:@"_iMC"])
  {
    self->_mediaControlInterest = 1;
    [(RPMediaControlDaemon *)self _update];
  }
}

- (void)deregisteredEventID:(id)a3
{
  if ([a3 isEqual:@"_iMC"])
  {
    self->_mediaControlInterest = 0;
    [(RPMediaControlDaemon *)self _update];
  }
}

- (void)_update
{
  if (self->_mediaControlInterest) {
    [(RPMediaControlDaemon *)self _mediaControlEnsureStarted];
  }
  else {
    [(RPMediaControlDaemon *)self _mediaControlEnsureStopped];
  }
}

- (void)_mediaControlEnsureStarted
{
  if (!self->_mediaRemoteCommandObserving)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_mediaRemoteSupportedCommandsChanged" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];
    self->_mediaRemoteCommandObserving = 1;
    [(RPMediaControlDaemon *)self _mediaRemoteSupportedCommandsGet];
  }
  if (self->_mediaRemoteVolumeObserving)
  {
    if (!self->_sendInterestEventHandler) {
      return;
    }
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id sendInterestEventHandler = (void (**)(id, const __CFString *, void *))self->_sendInterestEventHandler;
    CFStringRef v7 = @"_mcF";
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_mediaControlFlags];
    v8 = v4;
    objc_super v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    sendInterestEventHandler[2](sendInterestEventHandler, @"_iMC", v6);
  }
  else
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_mediaRemoteVolumeControlChanged:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
    self->_mediaRemoteVolumeObserving = 1;
    self->_mediaRemoteVolumeCaps = 0;
    if (MRAVEndpointGetLocalEndpoint()) {
      MRAVEndpointGetVolumeControlCapabilities();
    }
  }
}

- (void)_mediaControlEnsureStopped
{
  if (self->_mediaRemoteCommandObserving)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];
    self->_mediaRemoteCommandObserving = 0;
  }
  if (self->_mediaRemoteVolumeObserving)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
    self->_mediaRemoteVolumeObserving = 0;
  }
  self->_mediaControlFlags = 0;
}

- (void)_mediaControlFlagsUpdate:(unint64_t)a3 mask:(unint64_t)a4
{
  unint64_t mediaControlFlags = self->_mediaControlFlags;
  unint64_t v5 = mediaControlFlags & ~a4 | a4 & a3;
  if (v5 != mediaControlFlags)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_unint64_t mediaControlFlags = v5;
    CFStringRef v7 = (void (**)(id, const __CFString *, void *))objc_retainBlock(self->_sendInterestEventHandler);
    if (v7)
    {
      CFStringRef v10 = @"_mcF";
      v8 = +[NSNumber numberWithUnsignedLongLong:v5];
      v11 = v8;
      v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      v7[2](v7, @"_iMC", v9);
    }
  }
}

- (void)_mediaRemoteSupportedCommandsChanged
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073D0C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_mediaRemoteSupportedCommandsGet
{
  if (!self->_mediaRemoteCommandGetting)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_mediaRemoteCommandGetting = 1;
    MRMediaRemoteGetSupportedCommands();
  }
}

- (void)_mediaRemoteVolumeControlChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000741A8;
  v7[3] = &unk_1001219D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_mediaRemoteVolumeControlUpdate
{
  [(RPMediaControlDaemon *)self _mediaControlFlagsUpdate:(unint64_t)(self->_mediaRemoteVolumeCaps != 0) << 8 mask:256];
}

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xD) {
      id v8 = "?";
    }
    else {
      id v8 = off_100123530[Int64Ranged];
    }
    v16 = v8;
    id v17 = v18;
    LogPrintF();
  }
  switch(Int64Ranged)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      MRMediaRemoteSendCommand();
      goto LABEL_22;
    case 5u:
      [(RPMediaControlDaemon *)self _handleGetVolume:v18 responseHandler:v6];
      break;
    case 6u:
      [(RPMediaControlDaemon *)self _handleSetVolume:v18 responseHandler:v6];
      break;
    case 7u:
      [(RPMediaControlDaemon *)self _handleSkipByRequest:v18 responseHandler:v6];
      break;
    case 8u:
      CFStringRef v10 = self;
      uint64_t v11 = 8;
      uint64_t v12 = 9;
      goto LABEL_19;
    case 9u:
    case 0xBu:
      MRMediaRemoteSendCommand();
      self->_movementCommand = 3;
      movementEndTimer = self->_movementEndTimer;
      if (movementEndTimer)
      {
        v14 = movementEndTimer;
        dispatch_source_cancel(v14);
        v15 = self->_movementEndTimer;
        self->_movementEndTimer = 0;
      }
      goto LABEL_22;
    case 0xAu:
      CFStringRef v10 = self;
      uint64_t v11 = 10;
      uint64_t v12 = 11;
LABEL_19:
      -[RPMediaControlDaemon _handleMovementCommand:endCommand:](v10, "_handleMovementCommand:endCommand:", v11, v12, v16, v17);
LABEL_22:
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0, 0);
      break;
    case 0xCu:
      [(RPMediaControlDaemon *)self _handleMediaCaptionGet:v18 responseHandler:v6];
      break;
    case 0xDu:
      [(RPMediaControlDaemon *)self _handleMediaCaptionSet:v18 responseHandler:v6];
      break;
    default:
      v9 = RPErrorF();
      if (dword_100141C70 <= 60 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);

      break;
  }
}

- (void)_handleMediaCaptionGet:(id)a3 responseHandler:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  unint64_t v6 = ((uint64_t (*)(uint64_t))off_100141CE8[0])(1);
  if (v6 > 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_10011A810[v6];
  }
  if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = +[NSNumber numberWithInt:v7];
  [v8 setObject:v9 forKeyedSubscript:@"_mcs"];

  (*((void (**)(id, id, void, void))v5 + 2))(v5, v8, 0, 0);
}

- (void)_handleMediaCaptionSet:(id)a3 responseHandler:(id)a4
{
  id v4 = a4;
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  uint64_t v7 = 0;
  switch(Int64Ranged)
  {
    case 1:
      uint64_t v7 = 1;
      goto LABEL_11;
    case 2:
      uint64_t v7 = 2;
      goto LABEL_11;
    case 3:
      goto LABEL_11;
    case 4:
      uint64_t v7 = 2 * (((uint64_t (*)(uint64_t))off_100141CE8[0])(1) != 2);
LABEL_11:
      if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      off_100141CF0(1, v7);
      (*((void (**)(id, void *, void, void))v4 + 2))(v4, &__NSDictionary0__struct, 0, 0);
      break;
    default:
      unint64_t v6 = RPErrorF();
      if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v6);

      break;
  }
}

- (void)_handleMovementCommand:(unsigned int)a3 endCommand:(unsigned int)a4
{
  if (self->_movementCommand != a3)
  {
    MRMediaRemoteSendCommand();
    self->_movementCommand = a3;
  }
  self->_movementEndCommand = a4;
  if (self->_movementEndTimer)
  {
    CUDispatchTimerSet();
  }
  else
  {
    uint64_t v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    movementEndTimer = self->_movementEndTimer;
    self->_movementEndTimer = v7;

    v9 = self->_movementEndTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100074A5C;
    handler[3] = &unk_100121158;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_movementEndTimer);
  }
}

- (void)_handleSkipByRequest:(id)a3 responseHandler:(id)a4
{
  id v4 = a4;
  CFDictionaryGetDouble();
  uint64_t v7 = kMRMediaRemoteOptionSkipInterval;
  unint64_t v6 = +[NSNumber numberWithDouble:fabs(v5)];
  id v8 = v6;
  +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  MRMediaRemoteSendCommand();

  (*((void (**)(id, void *, void, void))v4 + 2))(v4, &__NSDictionary0__struct, 0, 0);
}

- (void)_handleGetVolume:(id)a3 responseHandler:(id)a4
{
  id v4 = a4;
  double v5 = [(Class)off_100141CE0[0]() sharedAVSystemController];
  int v10 = 0;
  unsigned __int8 v6 = [v5 getVolume:&v10 forCategory:@"MediaPlayback"];
  if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    LODWORD(v8) = v10;
    v9 = +[NSNumber numberWithFloat:v8];
    [v7 setObject:v9 forKeyedSubscript:@"_vol"];

    (*((void (**)(id, id, void, void))v4 + 2))(v4, v7, 0, 0);
  }
  else
  {
    RPErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v7);
  }
}

- (void)_handleSetVolume:(id)a3 responseHandler:(id)a4
{
  id v4 = a4;
  int v17 = 0;
  CFDictionaryGetDouble();
  double v6 = v5;
  if (v5 >= 0.0 && v5 <= 1.0)
  {
    if (dword_100141C70 <= 30 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    double v8 = [(Class)off_100141CE0[0]() sharedAVSystemController];
    float v9 = v6;
    *(float *)&double v10 = v9;
    unsigned int v11 = [v8 setVolumeTo:@"MediaPlayback" forCategory:v10];
    if (v11) {
      int v12 = 0;
    }
    else {
      int v12 = -6700;
    }
    int v17 = v12;
    if (v11)
    {
      float v16 = 0.0;
      if (([v8 getVolume:&v16 forCategory:@"MediaPlayback"] & 1) == 0)
      {
        if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        float v16 = v9;
      }
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      *(float *)&double v14 = v16;
      v15 = +[NSNumber numberWithFloat:v14];
      [v13 setObject:v15 forKeyedSubscript:@"_vol"];

      (*((void (**)(id, id, void, void))v4 + 2))(v4, v13, 0, 0);
    }
    else
    {
      RPErrorF();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v13);
    }
  }
  else
  {
    double v8 = RPErrorF();
    if (dword_100141C70 <= 90 && (dword_100141C70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v8);
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (id)sendInterestEventHandler
{
  return self->_sendInterestEventHandler;
}

- (void)setSendInterestEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendInterestEventHandler, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_movementEndTimer, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end