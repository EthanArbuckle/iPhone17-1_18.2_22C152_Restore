@interface TVRMSDAAPControlSession
+ (id)localControlSession;
+ (id)proxyControlSession;
- (TVRMSDAAPControlSession)init;
- (TVRMSDAAPControlSessionDelegate)delegate;
- (TVRMSService)service;
- (id)_stringFromRMSPlaybackCommand:(int64_t)a3;
- (void)_initializeManagersWithControlInterface:(id)a3 completionHandler:(id)a4;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5;
- (void)beginObservingNowPlaying;
- (void)clearKeyboardText;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)endObservingNowPlaying;
- (void)logout;
- (void)nowPlayingManager:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5;
- (void)nowPlayingManager:(id)a3 didUpdateAudioRoutes:(id)a4;
- (void)nowPlayingManager:(id)a3 didUpdateNowPlayingInfo:(id)a4;
- (void)nowPlayingManager:(id)a3 didUpdateVolume:(float)a4;
- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4;
- (void)requestManagerFailedWithUnauthorizedError:(id)a3;
- (void)requestManagerFailedWithUnknownError:(id)a3;
- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4;
- (void)sendKeyboardReturnCommand;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setKeyboardText:(id)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setVolume:(float)a3 completionHandler:(id)a4;
- (void)touchRemoteManagerDidDisconnect:(id)a3;
- (void)touchRemoteManagerKeyboardEditingSessionDidBegin:(id)a3;
- (void)touchRemoteManagerKeyboardEditingSessionDidEnd:(id)a3;
- (void)touchRemoteManagerKeyboardEditingSessionDidUpdate:(id)a3;
@end

@implementation TVRMSDAAPControlSession

+ (id)localControlSession
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)proxyControlSession
{
  v2 = objc_opt_new();

  return v2;
}

- (TVRMSDAAPControlSession)init
{
  v12.receiver = self;
  v12.super_class = (Class)TVRMSDAAPControlSession;
  v2 = [(TVRMSDAAPControlSession *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    requestManager = v2->_requestManager;
    v2->_requestManager = (TVRMSDAAPRequestManager *)v3;

    [(TVRMSDAAPRequestManager *)v2->_requestManager setDelegate:v2];
    v5 = [[TVRMSDAAPLoginManager alloc] initWithRequestManager:v2->_requestManager];
    loginManager = v2->_loginManager;
    v2->_loginManager = v5;

    v7 = [[TVRMSDAAPNowPlayingManager alloc] initWithRequestManager:v2->_requestManager];
    nowPlayingManager = v2->_nowPlayingManager;
    v2->_nowPlayingManager = v7;

    [(TVRMSDAAPNowPlayingManager *)v2->_nowPlayingManager setDelegate:v2];
    v9 = [[TVRMSDAAPTouchRemoteManager alloc] initWithRequestManager:v2->_requestManager];
    touchRemoteManager = v2->_touchRemoteManager;
    v2->_touchRemoteManager = v9;

    [(TVRMSDAAPTouchRemoteManager *)v2->_touchRemoteManager setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(TVRMSDAAPNowPlayingManager *)self->_nowPlayingManager endObservingNowPlaying];
  v3.receiver = self;
  v3.super_class = (Class)TVRMSDAAPControlSession;
  [(TVRMSDAAPControlSession *)&v3 dealloc];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_service, a3);
  requestManager = self->_requestManager;
  v13 = [v9 hostName];
  [(TVRMSDAAPRequestManager *)requestManager setHostName:v13];

  -[TVRMSDAAPRequestManager setPort:](self->_requestManager, "setPort:", (int)[v9 port]);
  v14 = self->_requestManager;
  v15 = [v9 homeSharingGroupKey];
  [(TVRMSDAAPRequestManager *)v14 setHomeSharingGroupKey:v15];

  [(TVRMSDAAPRequestManager *)self->_requestManager setPairingGUID:v10];
  [(TVRMSDAAPRequestManager *)self->_requestManager setSessionIdentifier:0];
  objc_initWeak(&location, self);
  loginManager = self->_loginManager;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke;
  v18[3] = &unk_2647AE968;
  objc_copyWeak(&v20, &location);
  id v17 = v11;
  id v19 = v17;
  [(TVRMSDAAPLoginManager *)loginManager loginWithCompletionHandler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke_2;
    v7[3] = &unk_2647AE940;
    id v9 = *(id *)(a1 + 32);
    id v8 = v5;
    [WeakRetained _initializeManagersWithControlInterface:v8 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __74__TVRMSDAAPControlSession_connectToService_pairingGUID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)logout
{
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "logout");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(TVRMSDAAPRequestManager *)self->_requestManager requestWithPath:v4 method:@"GET" postData:0 queryArgs:0 completionHandler:0];
}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = NSString;
  id v8 = [(TVRMSDAAPControlSession *)self _stringFromRMSPlaybackCommand:a3];
  id v9 = [v7 stringWithFormat:@"%s/1/%@", "ctrl-int", v8];

  requestManager = self->_requestManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__TVRMSDAAPControlSession_sendPlaybackCommand_completionHandler___block_invoke;
  v13[3] = &unk_2647AE990;
  id v11 = v6;
  id v14 = v11;
  id v12 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v9 method:@"POST" postData:0 queryArgs:0 completionHandler:v13];
  if ((unint64_t)(a3 - 5) <= 1
    && [(TVRMSDAAPNowPlayingManager *)self->_nowPlayingManager isObserving])
  {
    [(TVRMSDAAPNowPlayingManager *)self->_nowPlayingManager endObservingNowPlaying];
    [(TVRMSDAAPNowPlayingManager *)self->_nowPlayingManager beginObservingNowPlaying];
  }
}

uint64_t __65__TVRMSDAAPControlSession_sendPlaybackCommand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "setproperty");
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (unint64_t)(float)(a3 * 100.0));
  requestManager = self->_requestManager;
  v15 = @"dmcp.volume";
  v16[0] = v8;
  id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__TVRMSDAAPControlSession_setVolume_completionHandler___block_invoke;
  v13[3] = &unk_2647AE990;
  id v14 = v6;
  id v11 = v6;
  id v12 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v7 method:@"POST" postData:0 queryArgs:v10 completionHandler:v13];
}

uint64_t __55__TVRMSDAAPControlSession_setVolume_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = NSString;
  id v8 = a3;
  id v9 = objc_msgSend(v7, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "setspeakers");
  id v10 = NSString;
  uint64_t v11 = [v8 macAddress];

  id v12 = objc_msgSend(v10, "stringWithFormat:", @"0x%qx", v11);
  requestManager = self->_requestManager;
  id v19 = @"speaker-id";
  v20[0] = v12;
  id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__TVRMSDAAPControlSession_pickAudioRoute_completionHandler___block_invoke;
  v17[3] = &unk_2647AE990;
  id v18 = v6;
  id v15 = v6;
  id v16 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v9 method:@"POST" postData:0 queryArgs:v14 completionHandler:v17];
}

uint64_t __60__TVRMSDAAPControlSession_pickAudioRoute_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "setproperty");
  id v15 = @"dacp.playingtime";
  id v8 = [NSNumber numberWithInt:v4];
  v16[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  requestManager = self->_requestManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__TVRMSDAAPControlSession_seekToPlaybackTime_completionHandler___block_invoke;
  v13[3] = &unk_2647AE990;
  id v14 = v6;
  id v11 = v6;
  id v12 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v7 method:@"POST" postData:0 queryArgs:v9 completionHandler:v13];
}

uint64_t __64__TVRMSDAAPControlSession_seekToPlaybackTime_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  v22[3] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "setproperty");
  v21[0] = @"com.apple.itunes.liked-state";
  id v12 = [NSNumber numberWithInteger:a3];
  v22[0] = v12;
  v21[1] = @"database-spec";
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:0x%llX'", a5);
  v22[1] = v13;
  v21[2] = @"item-spec";
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:0x%llX'", a4);
  v22[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  requestManager = self->_requestManager;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__TVRMSDAAPControlSession_setLikedState_itemID_databaseID_completionHandler___block_invoke;
  v19[3] = &unk_2647AE990;
  id v20 = v10;
  id v17 = v10;
  id v18 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v11 method:@"POST" postData:0 queryArgs:v15 completionHandler:v19];
}

uint64_t __77__TVRMSDAAPControlSession_setLikedState_itemID_databaseID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  v19[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "setproperty");
  v19[0] = &unk_26DA62D78;
  v18[0] = @"com.apple.itunes.wishlist";
  v18[1] = @"database-spec";
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:0x%llX'", a4);
  v19[1] = v10;
  v18[2] = @"item-spec";
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"'dmap.itemid:0x%llX'", a3);
  v19[2] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  requestManager = self->_requestManager;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __70__TVRMSDAAPControlSession_addToWishlist_databaseID_completionHandler___block_invoke;
  v16[3] = &unk_2647AE990;
  id v17 = v8;
  id v14 = v8;
  id v15 = [(TVRMSDAAPRequestManager *)requestManager requestWithPath:v9 method:@"POST" postData:0 queryArgs:v12 completionHandler:v16];
}

uint64_t __70__TVRMSDAAPControlSession_addToWishlist_databaseID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)beginObservingNowPlaying
{
}

- (void)endObservingNowPlaying
{
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
}

- (void)sendNavigationCommand:(int64_t)a3
{
  if (a3 == 3 && [(TVRMSService *)self->_service isLegacy])
  {
    [(TVRMSDAAPControlSession *)self sendPlaybackCommand:2 completionHandler:0];
  }
  else
  {
    touchRemoteManager = self->_touchRemoteManager;
    [(TVRMSDAAPTouchRemoteManager *)touchRemoteManager sendNavigationCommand:a3];
  }
}

- (void)setKeyboardText:(id)a3
{
}

- (void)clearKeyboardText
{
}

- (void)sendKeyboardReturnCommand
{
}

- (void)nowPlayingManager:(id)a3 artworkDataDidBecomeAvailable:(id)a4 identifier:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained controlSession:self artworkDataDidBecomeAvailable:v9 identifier:v8];
}

- (void)nowPlayingManager:(id)a3 didUpdateAudioRoutes:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained controlSession:self didUpdateAudioRoutes:v6];
}

- (void)nowPlayingManager:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  id v5 = (TVRMSNowPlayingInfo *)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSession:self didUpdateNowPlayingInfo:v5];

  if ([(TVRMSNowPlayingInfo *)self->_nowPlayingInfo revisionNumber] >= 1
    && ![(TVRMSNowPlayingInfo *)v5 revisionNumber])
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 controlSessionDidEnd:self];
  }
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = v5;
}

- (void)nowPlayingManager:(id)a3 didUpdateVolume:(float)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&double v6 = a4;
  [WeakRetained controlSession:self didUpdateVolume:v6];
}

- (void)requestManagerFailedWithUnknownError:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSessionDidEnd:self];
}

- (void)requestManagerFailedWithUnauthorizedError:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSessionDidEnd:self];
}

- (void)touchRemoteManagerDidDisconnect:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSessionDidEnd:self];
}

- (void)touchRemoteManagerKeyboardEditingSessionDidBegin:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v6 = [v5 keyboardInfo];

  [WeakRetained controlSession:self keyboardEditingDidBegin:v6];
}

- (void)touchRemoteManagerKeyboardEditingSessionDidUpdate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v6 = [v5 keyboardInfo];

  [WeakRetained controlSession:self didUpdateKeyboardEditingInfo:v6];
}

- (void)touchRemoteManagerKeyboardEditingSessionDidEnd:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v6 = [v5 keyboardInfo];

  [WeakRetained controlSession:self keyboardEditingDidEnd:v6];
}

- (void)_initializeManagersWithControlInterface:(id)a3 completionHandler:(id)a4
{
  nowPlayingManager = self->_nowPlayingManager;
  id v9 = a4;
  id v7 = a3;
  [(TVRMSDAAPNowPlayingManager *)nowPlayingManager setControlInterface:v7];
  LODWORD(nowPlayingManager) = [v7 supportsDirectionalControl];

  if (nowPlayingManager)
  {
    [(TVRMSDAAPTouchRemoteManager *)self->_touchRemoteManager initiateControlWithCompletionHandler:v9];

    id v8 = [(TVRMSDAAPRequestManager *)self->_requestManager requestWithPath:@"playqueue-contents" method:@"POST" postData:0 queryArgs:0 completionHandler:0];
  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (id)_stringFromRMSPlaybackCommand:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return @"play";
  }
  else {
    return off_2647AE9B0[a3 - 1];
  }
}

- (TVRMSDAAPControlSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSDAAPControlSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRMSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_touchRemoteManager, 0);
  objc_storeStrong((id *)&self->_nowPlayingManager, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);

  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end