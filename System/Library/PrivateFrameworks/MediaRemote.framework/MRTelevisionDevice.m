@interface MRTelevisionDevice
- (BOOL)hiliteMode;
- (OS_dispatch_queue)gameControllerInputModeCallbackQueue;
- (OS_dispatch_queue)gameControllerPropertiesCallbackQueue;
- (OS_dispatch_queue)hiliteModeCallbackQueue;
- (OS_dispatch_queue)recordingStateCallbackQueue;
- (OS_dispatch_queue)rtiCallbackQueue;
- (OS_dispatch_queue)textInputCallbackQueue;
- (RTIInputSystemSourceSession)rtiSourceSession;
- (id)currentClientUpdatesConfigMessage;
- (id)gameControllerInputModeCallback;
- (id)gameControllerPropertiesCallback;
- (id)hiliteModeCallback;
- (id)recordingStateCallback;
- (id)rtiCallback;
- (id)textInputCallback;
- (unsigned)gameControllerInputMode;
- (void)setGameControllerInputModeCallback:(id)a3;
- (void)setGameControllerInputModeCallbackQueue:(id)a3;
- (void)setGameControllerPropertiesCallback:(id)a3;
- (void)setGameControllerPropertiesCallbackQueue:(id)a3;
- (void)setHiliteModeCallback:(id)a3;
- (void)setHiliteModeCallbackQueue:(id)a3;
- (void)setRecordingStateCallback:(id)a3;
- (void)setRecordingStateCallbackQueue:(id)a3;
- (void)setRtiCallback:(id)a3;
- (void)setRtiCallbackQueue:(id)a3;
- (void)setRtiSourceSession:(id)a3;
- (void)setTextInputCallback:(id)a3;
- (void)setTextInputCallbackQueue:(id)a3;
@end

@implementation MRTelevisionDevice

- (id)currentClientUpdatesConfigMessage
{
  v3 = [(MRTelevisionDevice *)self textInputCallback];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MRTelevisionDevice *)self rtiCallback];
    BOOL v4 = v5 != 0;
  }
  v6 = [[MRClientUpdatesConfigMessage alloc] initWithNowPlayingUpdates:[(MRExternalDevice *)self wantsNowPlayingNotifications] artworkUpdates:[(MRExternalDevice *)self wantsNowPlayingArtworkNotifications] volumeUpdates:[(MRExternalDevice *)self wantsVolumeNotifications] keyboardUpdates:v4 outputDeviceUpdates:[(MRExternalDevice *)self wantsOutputDeviceNotifications] systemEndpointUpdates:[(MRExternalDevice *)self wantsSystemEndpointNotifications] subscribedPlayerPaths:0];

  return v6;
}

- (BOOL)hiliteMode
{
  return self->_hiliteMode;
}

- (id)gameControllerInputModeCallback
{
  return self->_gameControllerInputModeCallback;
}

- (void)setGameControllerInputModeCallback:(id)a3
{
}

- (unsigned)gameControllerInputMode
{
  return self->_gameControllerInputMode;
}

- (OS_dispatch_queue)gameControllerInputModeCallbackQueue
{
  return self->_gameControllerInputModeCallbackQueue;
}

- (void)setGameControllerInputModeCallbackQueue:(id)a3
{
}

- (id)gameControllerPropertiesCallback
{
  return self->_gameControllerPropertiesCallback;
}

- (void)setGameControllerPropertiesCallback:(id)a3
{
}

- (OS_dispatch_queue)gameControllerPropertiesCallbackQueue
{
  return self->_gameControllerPropertiesCallbackQueue;
}

- (void)setGameControllerPropertiesCallbackQueue:(id)a3
{
}

- (id)recordingStateCallback
{
  return self->_recordingStateCallback;
}

- (void)setRecordingStateCallback:(id)a3
{
}

- (OS_dispatch_queue)recordingStateCallbackQueue
{
  return self->_recordingStateCallbackQueue;
}

- (void)setRecordingStateCallbackQueue:(id)a3
{
}

- (id)textInputCallback
{
  return self->_textInputCallback;
}

- (void)setTextInputCallback:(id)a3
{
}

- (OS_dispatch_queue)textInputCallbackQueue
{
  return self->_textInputCallbackQueue;
}

- (void)setTextInputCallbackQueue:(id)a3
{
}

- (id)rtiCallback
{
  return self->_rtiCallback;
}

- (void)setRtiCallback:(id)a3
{
}

- (OS_dispatch_queue)rtiCallbackQueue
{
  return self->_rtiCallbackQueue;
}

- (void)setRtiCallbackQueue:(id)a3
{
}

- (RTIInputSystemSourceSession)rtiSourceSession
{
  return self->_rtiSourceSession;
}

- (void)setRtiSourceSession:(id)a3
{
}

- (id)hiliteModeCallback
{
  return self->_hiliteModeCallback;
}

- (void)setHiliteModeCallback:(id)a3
{
}

- (OS_dispatch_queue)hiliteModeCallbackQueue
{
  return self->_hiliteModeCallbackQueue;
}

- (void)setHiliteModeCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiliteModeCallbackQueue, 0);
  objc_storeStrong(&self->_hiliteModeCallback, 0);
  objc_storeStrong((id *)&self->_rtiSourceSession, 0);
  objc_storeStrong((id *)&self->_rtiCallbackQueue, 0);
  objc_storeStrong(&self->_rtiCallback, 0);
  objc_storeStrong((id *)&self->_textInputCallbackQueue, 0);
  objc_storeStrong(&self->_textInputCallback, 0);
  objc_storeStrong((id *)&self->_recordingStateCallbackQueue, 0);
  objc_storeStrong(&self->_recordingStateCallback, 0);
  objc_storeStrong((id *)&self->_gameControllerPropertiesCallbackQueue, 0);
  objc_storeStrong(&self->_gameControllerPropertiesCallback, 0);
  objc_storeStrong((id *)&self->_gameControllerInputModeCallbackQueue, 0);
  objc_storeStrong(&self->_gameControllerInputModeCallback, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end