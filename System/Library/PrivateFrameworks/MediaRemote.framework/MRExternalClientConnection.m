@interface MRExternalClientConnection
- (BOOL)cryptoEnabled;
- (BOOL)registeredKeyboardUpdates;
- (BOOL)registeredToNowPlayingUpdates;
- (BOOL)registeredToOutputDeviceUpdates;
- (BOOL)registeredToSystemEndpointUpdates;
- (BOOL)registeredToVolumeUpdates;
- (MRCryptoPairingSession)cryptoSession;
- (MRExternalClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (NSArray)subscribedPlayerPaths;
- (unsigned)voiceRecordingState;
- (void)setCryptoEnabled:(BOOL)a3;
- (void)setCryptoSession:(id)a3;
- (void)setRegisteredKeyboardUpdates:(BOOL)a3;
- (void)setRegisteredToNowPlayingUpdates:(BOOL)a3;
- (void)setRegisteredToOutputDeviceUpdates:(BOOL)a3;
- (void)setRegisteredToSystemEndpointUpdates:(BOOL)a3;
- (void)setRegisteredToVolumeUpdates:(BOOL)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setVoiceRecordingState:(unsigned int)a3;
@end

@implementation MRExternalClientConnection

- (MRExternalClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRExternalClientConnection;
  result = [(MRProtocolClientConnection *)&v5 initWithConnection:a3 queue:a4];
  if (result) {
    result->_voiceRecordingState = 0;
  }
  return result;
}

- (NSArray)subscribedPlayerPaths
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_subscribedPlayerPaths;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  subscribedPlayerPaths = v4->_subscribedPlayerPaths;
  v4->_subscribedPlayerPaths = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (BOOL)registeredToNowPlayingUpdates
{
  return self->_registeredToNowPlayingUpdates;
}

- (void)setRegisteredToNowPlayingUpdates:(BOOL)a3
{
  self->_registeredToNowPlayingUpdates = a3;
}

- (BOOL)registeredToVolumeUpdates
{
  return self->_registeredToVolumeUpdates;
}

- (void)setRegisteredToVolumeUpdates:(BOOL)a3
{
  self->_registeredToVolumeUpdates = a3;
}

- (BOOL)registeredKeyboardUpdates
{
  return self->_registeredKeyboardUpdates;
}

- (void)setRegisteredKeyboardUpdates:(BOOL)a3
{
  self->_registeredKeyboardUpdates = a3;
}

- (BOOL)registeredToOutputDeviceUpdates
{
  return self->_registeredToOutputDeviceUpdates;
}

- (void)setRegisteredToOutputDeviceUpdates:(BOOL)a3
{
  self->_registeredToOutputDeviceUpdates = a3;
}

- (BOOL)registeredToSystemEndpointUpdates
{
  return self->_registeredToSystemEndpointUpdates;
}

- (void)setRegisteredToSystemEndpointUpdates:(BOOL)a3
{
  self->_registeredToSystemEndpointUpdates = a3;
}

- (unsigned)voiceRecordingState
{
  return self->_voiceRecordingState;
}

- (void)setVoiceRecordingState:(unsigned int)a3
{
  self->_voiceRecordingState = a3;
}

- (MRCryptoPairingSession)cryptoSession
{
  return self->_cryptoSession;
}

- (void)setCryptoSession:(id)a3
{
}

- (BOOL)cryptoEnabled
{
  return self->_cryptoEnabled;
}

- (void)setCryptoEnabled:(BOOL)a3
{
  self->_cryptoEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cryptoSession, 0);

  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
}

@end