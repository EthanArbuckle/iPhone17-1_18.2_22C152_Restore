@interface MediaControlsVolumeController
- (BOOL)_setupOutputDevicesAndVolumeControllersIfNeeded;
- (BOOL)isSplitRoute;
- (BOOL)setCurrentBluetoothListeningModeForRouteType:(unint64_t)a3 bluetoothListeningMode:(id)a4 error:(id *)a5;
- (BOOL)volumeControlAvailableForRouteType:(unint64_t)a3;
- (MPAVEndpointRoute)systemRoute;
- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute;
- (MPAVOutputDeviceRoute)systemOutputDeviceRoute;
- (MPVolumeController)primaryVolumeController;
- (MPVolumeController)secondaryVolumeController;
- (MPVolumeController)systemVolumeController;
- (MediaControlsVolumeController)init;
- (NSHashTable)observers;
- (NSString)volumeAudioCategory;
- (float)volumeForRouteType:(unint64_t)a3;
- (id)availableBluetoothListeningModeForRouteType:(unint64_t)a3;
- (id)currentBluetoothListeningModeForRouteType:(unint64_t)a3;
- (id)imageForRouteType:(unint64_t)a3;
- (id)routeNameForRouteType:(unint64_t)a3;
- (unint64_t)_routeForVolumeController:(id)a3;
- (void)_notifyVolumeChangedForVolumeController:(id)a3 volumeControlAvailable:(BOOL)a4 effectiveVolume:(float)a5;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)routeDidChangeNotification;
- (void)setObservers:(id)a3;
- (void)setPrimaryOutputDeviceRoute:(id)a3;
- (void)setPrimaryVolumeController:(id)a3;
- (void)setSecondaryOutputDeviceRoute:(id)a3;
- (void)setSecondaryVolumeController:(id)a3;
- (void)setSystemOutputDeviceRoute:(id)a3;
- (void)setSystemRoute:(id)a3;
- (void)setSystemVolumeController:(id)a3;
- (void)setVolume:(float)a3 forRouteType:(unint64_t)a4;
- (void)setVolumeAudioCategory:(id)a3;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MediaControlsVolumeController

- (MediaControlsVolumeController)init
{
  v11.receiver = self;
  v11.super_class = (Class)MediaControlsVolumeController;
  v2 = [(MediaControlsVolumeController *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x263F11D28] systemRoute];
    systemRoute = v2->_systemRoute;
    v2->_systemRoute = (MPAVEndpointRoute *)v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_routeDidChangeNotification name:*MEMORY[0x263F11190] object:v2->_systemRoute];

    v8 = (MPVolumeController *)objc_alloc_init(MEMORY[0x263F12328]);
    systemVolumeController = v2->_systemVolumeController;
    v2->_systemVolumeController = v8;

    [(MPVolumeController *)v2->_systemVolumeController setDelegate:v2];
    [(MediaControlsVolumeController *)v2 _setupOutputDevicesAndVolumeControllersIfNeeded];
  }
  return v2;
}

- (NSString)volumeAudioCategory
{
  return (NSString *)[(MPVolumeController *)self->_systemVolumeController volumeAudioCategory];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)routeNameForRouteType:(unint64_t)a3
{
  if (a3 <= 2)
  {
    objc_msgSend(*(id *)((char *)&self->super.isa + qword_237D000F0[a3]), "routeName", v3);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (id)imageForRouteType:(unint64_t)a3
{
  if (a3 <= 2)
  {
    objc_msgSend(MEMORY[0x263F11D28], "_iconImageForRoute:", *((void *)&self->_systemOutputDeviceRoute + a3), v3);
    self = (MediaControlsVolumeController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)currentBluetoothListeningModeForRouteType:(unint64_t)a3
{
  if (a3 <= 2)
  {
    objc_msgSend(*((id *)&self->_systemOutputDeviceRoute + a3), "logicalLeaderOutputDevice", v3);
    self = (MediaControlsVolumeController *)MRAVOutputDeviceCopyCurrentBluetoothListeningMode();
  }
  return self;
}

- (BOOL)setCurrentBluetoothListeningModeForRouteType:(unint64_t)a3 bluetoothListeningMode:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 <= 2)
  {
    [*((id *)&self->_systemOutputDeviceRoute + a3) logicalLeaderOutputDevice];
    id v9 = v8;
    char v10 = MRAVOutputDeviceSetCurrentBluetoothListeningMode();
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v10 = 0;
  if (a5) {
LABEL_5:
  }
    *a5 = 0;
LABEL_6:

  return v10;
}

- (id)availableBluetoothListeningModeForRouteType:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      goto LABEL_8;
    }
    secondaryOutputDeviceRoute = self->_secondaryOutputDeviceRoute;
  }
  else if (self->_primaryOutputDeviceRoute)
  {
    secondaryOutputDeviceRoute = self->_primaryOutputDeviceRoute;
  }
  else
  {
    secondaryOutputDeviceRoute = self->_systemOutputDeviceRoute;
  }
  [(MPAVOutputDeviceRoute *)secondaryOutputDeviceRoute logicalLeaderOutputDevice];
  a2 = (SEL)MRAVOutputDeviceCopyAvailableBluetoothListeningMode();
LABEL_8:

  return (id)(id)a2;
}

- (float)volumeForRouteType:(unint64_t)a3
{
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      p_primaryVolumeController = &self->_primaryVolumeController;
      primaryVolumeController = self->_primaryVolumeController;
    }
    else
    {
      if (a3) {
        return 1.0;
      }
      p_primaryVolumeController = &self->_systemVolumeController;
      primaryVolumeController = self->_systemVolumeController;
    }
    if ([(MPVolumeController *)primaryVolumeController isVolumeControlAvailable]) {
      goto LABEL_9;
    }
    return 1.0;
  }
  p_primaryVolumeController = &self->_secondaryVolumeController;
  if (![(MPVolumeController *)self->_secondaryVolumeController isVolumeControlAvailable])return 1.0; {
LABEL_9:
  }
  v6 = *p_primaryVolumeController;

  [(MPVolumeController *)v6 volumeValue];
  return result;
}

- (BOOL)volumeControlAvailableForRouteType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return [*((id *)&self->_systemVolumeController + a3) isVolumeControlAvailable];
  }
}

- (void)setVolume:(float)a3 forRouteType:(unint64_t)a4
{
  if (a4 <= 2) {
    objc_msgSend(*((id *)&self->_systemVolumeController + a4), "setVolume:withNotificationDelay:");
  }
}

- (void)routeDidChangeNotification
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__MediaControlsVolumeController_routeDidChangeNotification__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__MediaControlsVolumeController_routeDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _setupOutputDevicesAndVolumeControllersIfNeeded];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) mediaControlsVolumeController:*(void *)(a1 + 32) didUpdateSplitRoute:v2];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v8 = a3;
  uint64_t v6 = [v8 isVolumeControlAvailable];
  *(float *)&double v7 = a4;
  [(MediaControlsVolumeController *)self _notifyVolumeChangedForVolumeController:v8 volumeControlAvailable:v6 effectiveVolume:v7];
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  LODWORD(v8) = 1.0;
  id v9 = v6;
  if (v4)
  {
    objc_msgSend(v6, "volumeValue", v8);
    id v7 = v9;
  }
  [(MediaControlsVolumeController *)self _notifyVolumeChangedForVolumeController:v7 volumeControlAvailable:v4 effectiveVolume:v8];
}

- (void)_notifyVolumeChangedForVolumeController:(id)a3 volumeControlAvailable:(BOOL)a4 effectiveVolume:(float)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v8 = [(MediaControlsVolumeController *)self _routeForVolumeController:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v15 = a5;
          [v14 mediaControlsVolumeController:self didChangeVolumeAvailable:v6 effectiveVolume:v8 forRoute:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (unint64_t)_routeForVolumeController:(id)a3
{
  if (self->_primaryVolumeController == a3) {
    return 1;
  }
  else {
    return 2 * (self->_secondaryVolumeController == a3);
  }
}

- (BOOL)_setupOutputDevicesAndVolumeControllersIfNeeded
{
  v41[1] = *MEMORY[0x263EF8340];
  id v3 = [(MPAVEndpointRoute *)self->_systemRoute endpointWrapper];
  [v3 unwrappedValue];
  BOOL v4 = (void *)MRAVEndpointCopyOutputDevices();

  if (v4)
  {
    int v5 = [(MPAVEndpointRoute *)self->_systemRoute isSplitRoute];
    systemOutputDeviceRoute = self->_systemOutputDeviceRoute;
    if (v5)
    {
      self->_systemOutputDeviceRoute = 0;

      [(MPAVOutputDeviceRoute *)self->_primaryOutputDeviceRoute logicalLeaderOutputDevice];
      id v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      unint64_t v8 = [v4 objectAtIndexedSubscript:0];
      id v9 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

      id v10 = objc_alloc(MEMORY[0x263F11D10]);
      uint64_t v11 = [v4 objectAtIndexedSubscript:0];
      v41[0] = v11;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
      uint64_t v13 = (MPAVOutputDeviceRoute *)[v10 initWithOutputDevices:v12];
      primaryOutputDeviceRoute = self->_primaryOutputDeviceRoute;
      self->_primaryOutputDeviceRoute = v13;

      char v15 = [v7 isEqualToString:v9];
      if ((v15 & 1) == 0)
      {
        [(MPVolumeController *)self->_primaryVolumeController setDelegate:0];
        primaryVolumeController = self->_primaryVolumeController;
        self->_primaryVolumeController = 0;

        long long v17 = (void *)[objc_alloc(MEMORY[0x263F12330]) initWithGroupRoute:self->_systemRoute outputDeviceRoute:self->_primaryOutputDeviceRoute];
        long long v18 = (MPVolumeController *)[objc_alloc(MEMORY[0x263F12328]) initWithDataSource:v17];
        long long v19 = self->_primaryVolumeController;
        self->_primaryVolumeController = v18;

        [(MPVolumeController *)self->_primaryVolumeController setDelegate:self];
      }
      [(MPAVOutputDeviceRoute *)self->_secondaryOutputDeviceRoute logicalLeaderOutputDevice];
      v20 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      uint64_t v21 = [v4 objectAtIndexedSubscript:1];
      v22 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

      id v23 = objc_alloc(MEMORY[0x263F11D10]);
      v24 = [v4 objectAtIndexedSubscript:1];
      v40 = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      v26 = (MPAVOutputDeviceRoute *)[v23 initWithOutputDevices:v25];
      secondaryOutputDeviceRoute = self->_secondaryOutputDeviceRoute;
      self->_secondaryOutputDeviceRoute = v26;

      if ([v20 isEqualToString:v22])
      {
        LOBYTE(v28) = v15 ^ 1;
      }
      else
      {
        [(MPVolumeController *)self->_secondaryVolumeController setDelegate:0];
        secondaryVolumeController = self->_secondaryVolumeController;
        self->_secondaryVolumeController = 0;

        v28 = (void *)[objc_alloc(MEMORY[0x263F12330]) initWithGroupRoute:self->_systemRoute outputDeviceRoute:self->_secondaryOutputDeviceRoute];
        v37 = (MPVolumeController *)[objc_alloc(MEMORY[0x263F12328]) initWithDataSource:v28];
        v38 = self->_secondaryVolumeController;
        self->_secondaryVolumeController = v37;

        [(MPVolumeController *)self->_secondaryVolumeController setDelegate:self];
        LOBYTE(v28) = 1;
      }
      if (!self->_isSplitRoute)
      {
        LOBYTE(v28) = 1;
        self->_isSplitRoute = 1;
      }
    }
    else
    {
      v29 = [(MPAVOutputDeviceRoute *)systemOutputDeviceRoute outputDevices];
      LODWORD(v28) = [v29 isEqualToArray:v4] ^ 1;

      v30 = self->_primaryOutputDeviceRoute;
      self->_primaryOutputDeviceRoute = 0;

      [(MPVolumeController *)self->_primaryVolumeController setDelegate:0];
      v31 = self->_primaryVolumeController;
      self->_primaryVolumeController = 0;

      v32 = self->_secondaryOutputDeviceRoute;
      self->_secondaryOutputDeviceRoute = 0;

      [(MPVolumeController *)self->_secondaryVolumeController setDelegate:0];
      v33 = self->_secondaryVolumeController;
      self->_secondaryVolumeController = 0;

      v34 = (MPAVOutputDeviceRoute *)[objc_alloc(MEMORY[0x263F11D10]) initWithOutputDevices:v4];
      v35 = self->_systemOutputDeviceRoute;
      self->_systemOutputDeviceRoute = v34;

      self->_isSplitRoute = 0;
    }
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return (char)v28;
}

- (BOOL)isSplitRoute
{
  return self->_isSplitRoute;
}

- (void)setVolumeAudioCategory:(id)a3
{
}

- (MPAVEndpointRoute)systemRoute
{
  return self->_systemRoute;
}

- (void)setSystemRoute:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MPVolumeController)systemVolumeController
{
  return self->_systemVolumeController;
}

- (void)setSystemVolumeController:(id)a3
{
}

- (MPVolumeController)primaryVolumeController
{
  return self->_primaryVolumeController;
}

- (void)setPrimaryVolumeController:(id)a3
{
}

- (MPVolumeController)secondaryVolumeController
{
  return self->_secondaryVolumeController;
}

- (void)setSecondaryVolumeController:(id)a3
{
}

- (MPAVOutputDeviceRoute)systemOutputDeviceRoute
{
  return self->_systemOutputDeviceRoute;
}

- (void)setSystemOutputDeviceRoute:(id)a3
{
}

- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute
{
  return self->_primaryOutputDeviceRoute;
}

- (void)setPrimaryOutputDeviceRoute:(id)a3
{
}

- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute
{
  return self->_secondaryOutputDeviceRoute;
}

- (void)setSecondaryOutputDeviceRoute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_primaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_systemOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_secondaryVolumeController, 0);
  objc_storeStrong((id *)&self->_primaryVolumeController, 0);
  objc_storeStrong((id *)&self->_systemVolumeController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_systemRoute, 0);

  objc_storeStrong((id *)&self->_volumeAudioCategory, 0);
}

@end