@interface VTPhraseSpotterControlRemote
- (VTPhraseSpotterControlRemote)initWithDelegate:(id)a3;
- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5;
@end

@implementation VTPhraseSpotterControlRemote

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)remoteConnection:(id)a3 handleMessageType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v7 = +[VTPreferences sharedPreferences];
  int v8 = [v7 voiceTriggerEnabled];

  if (v8)
  {
    v9 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      v10 = NSNumber;
      v11 = v9;
      v12 = [v10 numberWithUnsignedInteger:a4];
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_INFO, "Remote received incoming IDS message: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    switch(a4)
    {
      case 0uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained phraseSpotterControl:self didUpdateEnabled:1];
        goto LABEL_10;
      case 1uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained phraseSpotterControl:self didUpdateEnabled:0];
        goto LABEL_10;
      case 2uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained phraseSpotterControlDidReceiveEarlyDetect:self];
        goto LABEL_10;
      case 3uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained phraseSpotterControlDidReceiveTrigger:self];
        goto LABEL_10;
      case 4uLL:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained phraseSpotterControlDidReceiveDismissal:self];
LABEL_10:

        break;
      default:
        return;
    }
  }
}

- (VTPhraseSpotterControlRemote)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VTPhraseSpotterControlRemote;
  v5 = [(VTPhraseSpotterControlRemote *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("VTPhraseSpotterControlRemote", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    int v8 = [[VTPeerRemoteConnection alloc] initWithServiceIdentifier:@"com.apple.private.alloy.siri.phrasespotter"];
    peerConnection = v5->_peerConnection;
    v5->_peerConnection = v8;

    [(VTPeerRemoteConnection *)v5->_peerConnection setDelegate:v5];
  }

  return v5;
}

@end