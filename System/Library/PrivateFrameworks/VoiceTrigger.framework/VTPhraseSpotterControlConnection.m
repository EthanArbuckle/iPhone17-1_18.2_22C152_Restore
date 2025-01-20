@interface VTPhraseSpotterControlConnection
- (VTPhraseSpotterControlConnection)init;
- (void)notifyRemoteOfDismissal;
- (void)notifyRemoteOfEarlyDetect;
- (void)notifyRemoteOfTriggerEvent;
- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5;
- (void)updateRemotePhraseSpotterEnabled:(BOOL)a3;
@end

@implementation VTPhraseSpotterControlConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSNumber;
    v8 = v6;
    v9 = [v7 numberWithUnsignedInteger:a4];
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "Connection received incoming IDS message: {%{public}@} - dropping it on the floor.", (uint8_t *)&v10, 0xCu);
  }
}

- (void)notifyRemoteOfDismissal
{
}

- (void)notifyRemoteOfTriggerEvent
{
}

- (void)notifyRemoteOfEarlyDetect
{
}

- (void)updateRemotePhraseSpotterEnabled:(BOOL)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v8 = +[VTPreferences sharedPreferences];
  if ([v8 voiceTriggerEnabled])
  {
    int remotePhraseSpotterEnabled = self->_remotePhraseSpotterEnabled;

    if (remotePhraseSpotterEnabled != v3)
    {
      v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v7 = @"disabled";
        if (v3) {
          v7 = @"enabled";
        }
        *(_DWORD *)buf = 138543362;
        int v10 = v7;
        _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "Notifying connection that remote phrase spotter should be %{public}@", buf, 0xCu);
      }
      self->_int remotePhraseSpotterEnabled = v3;
      [(VTPeerRemoteConnection *)self->_peerConnection sendRequestType:v3 ^ 1u nonWaking:1];
    }
  }
  else
  {
  }
}

- (VTPhraseSpotterControlConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)VTPhraseSpotterControlConnection;
  v2 = [(VTPhraseSpotterControlConnection *)&v9 init];
  int v3 = v2;
  if (v2)
  {
    v2->_int remotePhraseSpotterEnabled = 1;
    dispatch_queue_t v4 = dispatch_queue_create("VTPhraseSpotterControlConnection", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = [[VTPeerRemoteConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.phrasespotter" requireNearbyPeer:1];
    peerConnection = v3->_peerConnection;
    v3->_peerConnection = v6;

    [(VTPeerRemoteConnection *)v3->_peerConnection setDelegate:v3];
  }
  return v3;
}

@end