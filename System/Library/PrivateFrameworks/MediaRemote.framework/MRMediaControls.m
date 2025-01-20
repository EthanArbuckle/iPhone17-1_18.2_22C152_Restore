@interface MRMediaControls
- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRMediaControls)init;
- (MRMediaControls)initWithConfiguration:(id)a3;
- (MRMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4;
- (MRMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4;
- (MRMediaControlsConfiguration)configuration;
- (NSString)routeUID;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (double)preferredWidth;
- (id)_dismissalReasonString:(unint64_t)a3;
- (id)customRowDidTapHandler;
- (id)dismissHandler;
- (id)dismissHandlerWithReason;
- (int64_t)_mediaControlsStyleForRouteSharingPolicy:(unint64_t)a3;
- (unint64_t)_MPRouteSharingPolicyToAVRouteSharingPolicy:(unint64_t)a3;
- (void)_audioSessionRoutingContextDidChangeNotification;
- (void)_reset;
- (void)_updateAudioSessionRoutingContext;
- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5;
- (void)dealloc;
- (void)dismiss;
- (void)openConnection;
- (void)present;
- (void)setConnection:(id)a3;
- (void)setCustomRowDidTapHandler:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDismissHandlerWithReason:(id)a3;
- (void)setDismissalReason:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setRouteUID:(id)a3;
- (void)setTappedCustomRowIdentifier:(id)a3;
- (void)startPrewarming;
- (void)stopPrewarming;
@end

@implementation MRMediaControls

- (MRMediaControls)init
{
  v3 = objc_alloc_init(MRMediaControlsConfiguration);
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  [(MRMediaControlsConfiguration *)v3 setPresentingAppBundleID:v5];

  v6 = [MEMORY[0x1E4F28F80] processInfo];
  -[MRMediaControlsConfiguration setPresentingAppProcessIdentifier:](v3, "setPresentingAppProcessIdentifier:", [v6 processIdentifier]);

  v7 = [(Class)getAVAudioSessionClass_0[0]() sharedInstance];
  v8 = [v7 routingContextUID];
  [(MRMediaControlsConfiguration *)v3 setRoutingContextUID:v8];

  -[MRMediaControlsConfiguration setStyle:](v3, "setStyle:", -[MRMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", [v7 routeSharingPolicy]));
  v9 = [(MRMediaControls *)self initWithConfiguration:v3 shouldObserveRoutingContextUIDChanges:1];

  return v9;
}

- (MRMediaControls)initWithConfiguration:(id)a3
{
  return [(MRMediaControls *)self initWithConfiguration:a3 shouldObserveRoutingContextUIDChanges:1];
}

- (MRMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(MRMediaControls *)self _MPRouteSharingPolicyToAVRouteSharingPolicy:a3];
  v8 = objc_alloc_init(MRMediaControlsConfiguration);
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 bundleIdentifier];
  [(MRMediaControlsConfiguration *)v8 setPresentingAppBundleID:v10];

  [(MRMediaControlsConfiguration *)v8 setRoutingContextUID:v6];
  [(MRMediaControlsConfiguration *)v8 setStyle:[(MRMediaControls *)self _mediaControlsStyleForRouteSharingPolicy:v7]];
  v11 = [(MRMediaControls *)self initWithConfiguration:v8 shouldObserveRoutingContextUIDChanges:0];

  return v11;
}

- (MRMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRMediaControls;
  unint64_t v7 = [(MRMediaControls *)&v21 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    configuration = v7->_configuration;
    v7->_configuration = (MRMediaControlsConfiguration *)v8;

    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 bundleIdentifier];
    if ([v11 isEqualToString:@"com.apple.springboard"])
    {
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B50] mainBundle];
      v13 = [v12 bundleIdentifier];
      char v14 = [v13 isEqualToString:@"com.apple.MediaRemoteUI"];

      if ((v14 & 1) == 0) {
        v7->_shouldObserveRoutingContextUIDChanges = a4;
      }
    }
    if (v7->_shouldObserveRoutingContextUIDChanges)
    {
      v15 = _MRLogForCategory(2uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [(MRMediaControls *)v7 configuration];
        v17 = [v16 presentingAppBundleID];
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_INFO, "Started observing routing context UID changes for app bundle: %{public}@", buf, 0xCu);
      }
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v19 = getAVAudioSessionRoutingContextChangeNotification();
      [v18 addObserver:v7 selector:sel__audioSessionRoutingContextDidChangeNotification name:v19 object:0];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRMediaControls;
  [(MRMediaControls *)&v3 dealloc];
}

- (MRMediaControlsConfiguration)configuration
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)[(MRMediaControlsConfiguration *)v2->_configuration copy];
  objc_sync_exit(v2);

  return (MRMediaControlsConfiguration *)v3;
}

- (void)setRouteUID:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_routeUID, a3);
  [(MRMediaControlsConfiguration *)v5->_configuration setRouteUID:v6];
  objc_sync_exit(v5);
}

- (void)setPreferredWidth:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_preferredWidth = a3;
  [(MRMediaControlsConfiguration *)obj->_configuration setPreferredWidth:a3];
  objc_sync_exit(obj);
}

- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _MRLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "MediaControls - Adding Custom Row with type:%@, titleOverride: %@, identifier: %@", (uint8_t *)&v19, 0x20u);
  }

  v12 = self;
  objc_sync_enter(v12);
  v13 = [(MRMediaControlsConfiguration *)v12->_configuration customRows];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    configuration = v12->_configuration;
    v16 = [MEMORY[0x1E4F1CA48] array];
    [(MRMediaControlsConfiguration *)configuration setCustomRows:v16];
  }
  v17 = +[MRMediaControlsCustomRow rowWithType:v8 titleOverride:v9 identifier:v10];
  v18 = [(MRMediaControlsConfiguration *)v12->_configuration customRows];
  [v18 addObject:v17];

  objc_sync_exit(v12);
}

- (void)startPrewarming
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_shouldObserveRoutingContextUIDChanges) {
    [(MRMediaControls *)self _updateAudioSessionRoutingContext];
  }
  objc_super v3 = [(MRMediaControls *)self configuration];
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  unsigned int v5 = [v3 style];
  id v6 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_INFO, "Start prewarming remote view controller. Configuration : %{public}@", (uint8_t *)&v10, 0xCu);
  }

  unint64_t v7 = [(MRMediaControls *)self listener];
  id v8 = [v7 endpoint];
  id v9 = [v8 _endpoint];
  MRMediaRemotePrewarmMediaControlsCommand(v4, v5, v9);
}

- (void)stopPrewarming
{
  v2 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_INFO, "Stop prewarming remote view controller.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)present
{
  objc_super v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_INFO, "Present remote view controller.", buf, 2u);
  }

  [(MRMediaControls *)self startPrewarming];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__MRMediaControls_present__block_invoke;
  v4[3] = &unk_1E57D27D8;
  v4[4] = self;
  MRMediaRemotePresentMediaControlsCommand(MEMORY[0x1E4F14428], v4);
}

uint64_t __26__MRMediaControls_present__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    v4 = _MRLogForCategory(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __26__MRMediaControls_present__block_invoke_cold_1(a2, v4);
    }

    return [*(id *)(v3 + 32) _reset];
  }
  return result;
}

- (void)dismiss
{
  v2 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_INFO, "Dismissing remote view controller at app's request.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (NSXPCListener)listener
{
  listener = self->_listener;
  if (!listener)
  {
    v4 = [MEMORY[0x1E4F29290] anonymousListener];
    unsigned int v5 = self->_listener;
    self->_listener = v4;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener activate];
    listener = self->_listener;
  }

  return listener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_INFO, "Received request to accept new connection.", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_connection, a4);
  id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6B6A38];
  [v7 setRemoteObjectInterface:v9];

  int v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE693AA0];
  [v7 setExportedInterface:v10];

  [v7 setExportedObject:self];
  objc_initWeak(buf, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MRMediaControls_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E57D12D0;
  objc_copyWeak(&v13, buf);
  [v7 setInvalidationHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

  return 1;
}

void __54__MRMediaControls_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_INFO, "Connection to remote view controller invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reset];
}

- (void)openConnection
{
  v2 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_INFO, "Connection established to remote view controller.", v3, 2u);
  }
}

- (void)setDismissalReason:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(MRMediaControls *)self _dismissalReasonString:a3];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with reason : %@", (uint8_t *)&v7, 0xCu);
  }
  self->_dismissalReason = a3;
}

- (void)setTappedCustomRowIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  unsigned int v5 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with tapped custom row identifier : %@", (uint8_t *)&v7, 0xCu);
  }

  tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
  self->_tappedCustomRowIdentifier = v4;
}

- (void)_reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getAVAudioSessionRoutingContextChangeNotification();
  [v3 removeObserver:self name:v4 object:0];

  if (self->_dismissHandler) {
    dispatch_async(MEMORY[0x1E4F14428], self->_dismissHandler);
  }
  if (self->_dismissHandlerWithReason)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__MRMediaControls__reset__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (self->_customRowDidTapHandler && self->_tappedCustomRowIdentifier)
  {
    unsigned int v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
      *(_DWORD *)buf = 138412290;
      int v10 = tappedCustomRowIdentifier;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "MediaControls custom row did tap, rowIdentifier: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __25__MRMediaControls__reset__block_invoke_69;
    v7[3] = &unk_1E57D0518;
    v7[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __25__MRMediaControls__reset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __25__MRMediaControls__reset__block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

- (void)_updateAudioSessionRoutingContext
{
  id v5 = [(Class)getAVAudioSessionClass_0[0]() sharedInstance];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  v4 = [v5 routingContextUID];
  [(MRMediaControlsConfiguration *)v3->_configuration setRoutingContextUID:v4];

  -[MRMediaControlsConfiguration setStyle:](v3->_configuration, "setStyle:", -[MRMediaControls _mediaControlsStyleForRouteSharingPolicy:](v3, "_mediaControlsStyleForRouteSharingPolicy:", [v5 routeSharingPolicy]));
  objc_sync_exit(v3);
}

- (void)_audioSessionRoutingContextDidChangeNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(MRMediaControls *)self _updateAudioSessionRoutingContext];
  uint64_t v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(MRMediaControlsConfiguration *)self->_configuration routingContextUID];
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_INFO, "Updating remote view controller routing context UID : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v5 updateMediaControlsWithConfiguration:self->_configuration];
}

- (int64_t)_mediaControlsStyleForRouteSharingPolicy:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  int v6 = [v5 infoDictionary];
  int v7 = [v6 objectForKeyedSubscript:@"SupportsSharedQueue"];
  int v8 = [v7 BOOLValue];

  if ([(MRMediaControls *)self _shouldUpdateStyleForCurrentConfigurationStyle:[(MRMediaControlsConfiguration *)self->_configuration style]])
  {
    int64_t v9 = 2;
    if (v8) {
      int64_t v9 = 3;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      return v9;
    }
    else {
      return 1;
    }
  }
  else
  {
    configuration = self->_configuration;
    return [(MRMediaControlsConfiguration *)configuration style];
  }
}

- (unint64_t)_MPRouteSharingPolicyToAVRouteSharingPolicy:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)_dismissalReasonString:(unint64_t)a3
{
  if (a3) {
    return @"MRMediaControlsDismissalReasonUserCancelled";
  }
  else {
    return @"MRMediaControlsDismissalReasonUnknown";
  }
}

- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFBLL;
}

- (id)dismissHandlerWithReason
{
  return self->_dismissHandlerWithReason;
}

- (void)setDismissHandlerWithReason:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)customRowDidTapHandler
{
  return self->_customRowDidTapHandler;
}

- (void)setCustomRowDidTapHandler:(id)a3
{
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong(&self->_customRowDidTapHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_dismissHandlerWithReason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_tappedCustomRowIdentifier, 0);
}

void __26__MRMediaControls_present__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "Error occurred while attempting to present remote view controller. %@", (uint8_t *)&v2, 0xCu);
}

@end