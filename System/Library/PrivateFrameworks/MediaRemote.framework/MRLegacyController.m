@interface MRLegacyController
- (MRExternalDevice)externalDevice;
- (MRLegacyController)initWithAVOutputDevice:(id)a3;
- (MRLegacyController)initWithExternalDevice:(id)a3 outputDeviceUID:(id)a4;
- (MRLegacyController)initWithOutputDevice:(id)a3;
- (MRLegacyController)initWithOutputDeviceUID:(id)a3;
- (MRLegacyControllerDelegate)delegate;
- (NSString)outputDeviceUID;
- (OS_dispatch_queue)queue;
- (void)addOutputDeviceIDs:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)getMasterVolumeCapabilitiesWithCompletion:(id)a3;
- (void)getMasterVolumeWithCompletion:(id)a3;
- (void)getOutputDeviceVolume:(id)a3 completion:(id)a4;
- (void)getOutputDeviceVolumeCapabilities:(id)a3 completion:(id)a4;
- (void)handleVolumeCapabilitiesDidChangeNotification:(id)a3;
- (void)removeOutputDeviceIDs:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExternalDevice:(id)a3;
- (void)setMasterVolume:(float)a3 completion:(id)a4;
- (void)setOutputDeviceIDs:(id)a3 completion:(id)a4;
- (void)setOutputDeviceUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVolume:(float)a3 forOutputDeviceID:(id)a4 completion:(id)a5;
- (void)setupExternalDevice;
- (void)tearDown;
@end

@implementation MRLegacyController

- (MRLegacyController)initWithExternalDevice:(id)a3 outputDeviceUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MRLegacyController;
  v9 = [(MRLegacyController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    [(MRLegacyController *)v9 setOutputDeviceUID:v8];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote/MRLegacyController", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_externalDevice, a3);
    [(MRLegacyController *)v10 setupExternalDevice];
  }

  return v10;
}

- (MRLegacyController)initWithAVOutputDevice:(id)a3
{
  id v4 = a3;
  v5 = [MRAVOutputDeviceSourceInfo alloc];
  v6 = [v4 deviceID];
  id v7 = [(MRAVOutputDeviceSourceInfo *)v5 initWithRoutingContextUID:v6 multipleBuiltInDevices:0];

  id v8 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v4 sourceInfo:v7];
  v9 = [(MRLegacyController *)self initWithOutputDevice:v8];

  return v9;
}

- (MRLegacyController)initWithOutputDevice:(id)a3
{
  id v4 = [a3 uid];
  v5 = [(MRLegacyController *)self initWithExternalDevice:0 outputDeviceUID:v4];

  return v5;
}

- (MRLegacyController)initWithOutputDeviceUID:(id)a3
{
  return 0;
}

- (void)connect
{
  v5[1] = *MEMORY[0x1E4F143B8];
  externalDevice = self->_externalDevice;
  id v4 = @"MRExternalDeviceConnectionReasonUserInfoKey";
  v5[0] = @"MRLegacyController";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(MRExternalDevice *)externalDevice connectWithOptions:0 userInfo:v3];
}

- (void)addOutputDeviceIDs:(id)a3 completion:(id)a4
{
}

- (void)removeOutputDeviceIDs:(id)a3 completion:(id)a4
{
}

- (void)setOutputDeviceIDs:(id)a3 completion:(id)a4
{
}

- (void)getMasterVolumeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MRLegacyController *)self externalDevice];
  [v5 outputDeviceVolume:0 queue:self->_queue completion:v4];
}

- (void)getOutputDeviceVolume:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MRLegacyController *)self externalDevice];
  [v8 outputDeviceVolume:v7 queue:self->_queue completion:v6];
}

- (void)getMasterVolumeCapabilitiesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MRLegacyController *)self externalDevice];
  [v5 outputDeviceVolumeControlCapabilities:0 queue:self->_queue completion:v4];
}

- (void)getOutputDeviceVolumeCapabilities:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MRLegacyController *)self externalDevice];
  [v8 outputDeviceVolumeControlCapabilities:v7 queue:self->_queue completion:v6];
}

- (void)setMasterVolume:(float)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(MRLegacyController *)self externalDevice];
  *(float *)&double v7 = a3;
  [v8 setOutputDeviceVolume:0 outputDeviceUID:self->_queue queue:v6 completion:v7];
}

- (void)setVolume:(float)a3 forOutputDeviceID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(MRLegacyController *)self externalDevice];
  *(float *)&double v10 = a3;
  [v11 setOutputDeviceVolume:v9 outputDeviceUID:self->_queue queue:v8 completion:v10];
}

- (void)tearDown
{
  [(MRExternalDevice *)self->_externalDevice disconnect:0];
  externalDevice = self->_externalDevice;
  self->_externalDevice = 0;
}

- (void)dealloc
{
  [(MRLegacyController *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)MRLegacyController;
  [(MRLegacyController *)&v3 dealloc];
}

- (void)setupExternalDevice
{
  [(MRExternalDevice *)self->_externalDevice setWantsVolumeNotifications:1];
  [(MRExternalDevice *)self->_externalDevice setWantsOutputDeviceNotifications:1];
  [(MRExternalDevice *)self->_externalDevice setWantsNowPlayingArtworkNotifications:0];
  [(MRExternalDevice *)self->_externalDevice setWantsNowPlayingNotifications:0];
  objc_initWeak(&location, self);
  externalDevice = self->_externalDevice;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__MRLegacyController_setupExternalDevice__block_invoke;
  v8[3] = &unk_1E57D0318;
  objc_copyWeak(&v9, &location);
  [(MRExternalDevice *)externalDevice setVolumeCallback:v8 withQueue:self->_queue];
  id v4 = self->_externalDevice;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MRLegacyController_setupExternalDevice__block_invoke_2;
  v6[3] = &unk_1E57D0340;
  objc_copyWeak(&v7, &location);
  [(MRExternalDevice *)v4 setConnectionStateCallback:v6 withQueue:self->_queue];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_handleVolumeCapabilitiesDidChangeNotification_ name:@"kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification" object:0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__MRLegacyController_setupExternalDevice__block_invoke(uint64_t a1, float a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained delegate];
  id v7 = v6;
  *(float *)&double v8 = a2;
  if (a4) {
    [v6 legacyController:WeakRetained volumeDidChange:a4 forOutputDevice:v8];
  }
  else {
    [v6 legacyController:WeakRetained masterVolumeDidChange:v8];
  }
}

void __41__MRLegacyController_setupExternalDevice__block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    id v11 = WeakRetained;
    id v9 = [WeakRetained delegate];
    char v10 = objc_opt_respondsToSelector();

    id WeakRetained = v11;
    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
    double v8 = [v11 delegate];
    [v8 legacyControllerConnectionDidConnect:v11];
    goto LABEL_7;
  }
  if (a2 == 3)
  {
    id v11 = WeakRetained;
    id v6 = [WeakRetained delegate];
    char v7 = objc_opt_respondsToSelector();

    id WeakRetained = v11;
    if (v7)
    {
      double v8 = [v11 delegate];
      [v8 legacyControllerConnectionDidDisconnect:v11 withError:a3];
LABEL_7:

      id WeakRetained = v11;
    }
  }
LABEL_8:
}

- (void)handleVolumeCapabilitiesDidChangeNotification:(id)a3
{
  id v14 = a3;
  id v4 = [v14 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kMRAVEndpointIdentifierUserInfoKey"];

  char v6 = [v5 containsString:self->_outputDeviceUID];
  char v7 = [v14 userInfo];
  double v8 = [v7 objectForKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];

  int v9 = [v8 isEqualToString:self->_outputDeviceUID];
  if ((v6 & 1) != 0 || v9)
  {
    char v10 = [v14 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"];
    int v12 = [v11 intValue];

    v13 = [(MRLegacyController *)self delegate];
    [v13 legacyController:self volumeControlAvailabilityDidChange:v12 != 0 forOutputDevice:v8];
  }
}

- (MRLegacyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRLegacyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (MRExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void)setExternalDevice:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end