@interface _UIDisplayObserver
+ (id)sharedObserver;
- (NSMutableDictionary)pendingCarDisplays;
- (void)connectDisplayWithConfiguration:(id)a3;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)setPendingCarDisplays:(id)a3;
@end

@implementation _UIDisplayObserver

+ (id)sharedObserver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___UIDisplayObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2609A8 != -1) {
    dispatch_once(&qword_1EB2609A8, block);
  }
  v2 = (void *)_MergedGlobals_1068;
  return v2;
}

- (void)connectDisplayWithConfiguration:(id)a3
{
  v3 = (void *)UIApp;
  id v4 = a3;
  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v4, [v3 _hasCalledRunWithMainScene]);
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (([v8 isCarDisplay] & 1) != 0 || objc_msgSend(v8, "isCarInstrumentsDisplay"))
  {
    v9 = [(_UIDisplayObserver *)self pendingCarDisplays];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(_UIDisplayObserver *)self setPendingCarDisplays:v10];
    }
    v11 = [(_UIDisplayObserver *)self pendingCarDisplays];
    [v11 setObject:v8 forKeyedSubscript:v7];

    v12 = +[_UICarPlaySession sharedInstance]();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74___UIDisplayObserver_displayMonitor_didConnectIdentity_withConfiguration___block_invoke;
    v13[3] = &unk_1E52F05A8;
    v13[4] = self;
    id v14 = v7;
    -[_UICarPlaySession getCurrentSessionWithTimeout:completion:]((uint64_t)v12, v13, 2.0);
  }
  else
  {
    [(_UIDisplayObserver *)self connectDisplayWithConfiguration:v8];
  }
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  if ((([v7 isCarDisplay] & 1) != 0 || objc_msgSend(v7, "isCarInstrumentsDisplay"))
    && ([(_UIDisplayObserver *)self pendingCarDisplays],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKeyedSubscript:v11],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    id v10 = [(_UIDisplayObserver *)self pendingCarDisplays];
    [v10 setObject:v7 forKeyedSubscript:v11];
  }
  else
  {
    id v10 = +[UIScreen _screenWithFBSDisplayIdentity:v11];
    [v10 _updateDisplayConfiguration:v7];
  }
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v6 = a4;
  v5 = [(_UIDisplayObserver *)self pendingCarDisplays];
  [v5 setObject:0 forKeyedSubscript:v6];

  +[UIScreen _FBSDisplayIdentityDisconnected:v6];
}

- (NSMutableDictionary)pendingCarDisplays
{
  return self->_pendingCarDisplays;
}

- (void)setPendingCarDisplays:(id)a3
{
}

- (void).cxx_destruct
{
}

@end