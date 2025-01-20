@interface SXVideoPlayerViewControllerManager
- (BOOL)presentedAndAppeared;
- (NSMutableDictionary)loseOwnershipBlocks;
- (NSMutableDictionary)pendingLoseOwnershipBlocks;
- (NSMutableDictionary)pendingReceiveOwnershipBlocks;
- (NSMutableDictionary)pendingVideoPlayerViewControllers;
- (NSMutableDictionary)videoAnalyticsRouters;
- (NSMutableDictionary)videoPlayerViewControllers;
- (NSMutableDictionary)visibilityMonitors;
- (NSURL)autoplayURL;
- (SXVideoPlayerViewControllerManager)init;
- (id)videoPlayerViewControllerForURL:(id)a3 receiveOwnershipBlock:(id)a4;
- (void)configureAutoplayForVideoWithURL:(id)a3 analyticsRouter:(id)a4;
- (void)registerExistingVideoPlayerViewController:(id)a3 URL:(id)a4 analyticsRouter:(id)a5 videoPlayerVisibilityMonitor:(id)a6 loseOwnershipBlock:(id)a7;
- (void)setAutoplayURL:(id)a3;
- (void)setPresentedAndAppeared:(BOOL)a3;
@end

@implementation SXVideoPlayerViewControllerManager

- (SXVideoPlayerViewControllerManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)SXVideoPlayerViewControllerManager;
  v2 = [(SXVideoPlayerViewControllerManager *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    videoPlayerViewControllers = v2->_videoPlayerViewControllers;
    v2->_videoPlayerViewControllers = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    loseOwnershipBlocks = v2->_loseOwnershipBlocks;
    v2->_loseOwnershipBlocks = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    pendingLoseOwnershipBlocks = v2->_pendingLoseOwnershipBlocks;
    v2->_pendingLoseOwnershipBlocks = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    pendingReceiveOwnershipBlocks = v2->_pendingReceiveOwnershipBlocks;
    v2->_pendingReceiveOwnershipBlocks = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    pendingVideoPlayerViewControllers = v2->_pendingVideoPlayerViewControllers;
    v2->_pendingVideoPlayerViewControllers = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    videoAnalyticsRouters = v2->_videoAnalyticsRouters;
    v2->_videoAnalyticsRouters = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    visibilityMonitors = v2->_visibilityMonitors;
    v2->_visibilityMonitors = (NSMutableDictionary *)v15;
  }
  return v2;
}

- (id)videoPlayerViewControllerForURL:(id)a3 receiveOwnershipBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(SXVideoPlayerViewControllerResponse);
  if (v6)
  {
    uint64_t v9 = [(SXVideoPlayerViewControllerManager *)self loseOwnershipBlocks];
    uint64_t v10 = [v9 objectForKey:v6];

    uint64_t v11 = [(SXVideoPlayerViewControllerManager *)self videoPlayerViewControllers];
    uint64_t v12 = [v11 objectForKey:v6];

    uint64_t v13 = [(SXVideoPlayerViewControllerManager *)self autoplayURL];
    uint64_t v14 = [v13 isEqual:v6];

    uint64_t v15 = [(SXVideoPlayerViewControllerManager *)self videoAnalyticsRouters];
    v16 = [v15 objectForKey:v6];

    v17 = [(SXVideoPlayerViewControllerManager *)self visibilityMonitors];
    objc_super v18 = [v17 objectForKey:v6];

    id v19 = (id)v12;
    if (!v12 && v14) {
      id v19 = objc_alloc_init(MEMORY[0x263F6C6B8]);
    }
    v35 = (void *)v10;
    if (v14) {
      [(SXVideoPlayerViewControllerManager *)self setAutoplayURL:0];
    }
    if (!v19) {
      goto LABEL_19;
    }
    if ([(SXVideoPlayerViewControllerManager *)self presentedAndAppeared])
    {
      if (v10)
      {
        (*(void (**)(void))(v10 + 16))();
        v20 = [(SXVideoPlayerViewControllerManager *)self loseOwnershipBlocks];
        [v20 removeObjectForKey:v6];
      }
      v21 = [(SXVideoPlayerViewControllerManager *)self videoPlayerViewControllers];
      [v21 removeObjectForKey:v6];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__SXVideoPlayerViewControllerManager_videoPlayerViewControllerForURL_receiveOwnershipBlock___block_invoke;
      block[3] = &unk_264652F90;
      id v38 = v7;
      id v37 = v19;
      dispatch_async(MEMORY[0x263EF83A0], block);

      v22 = v38;
    }
    else
    {
      if ([(SXVideoPlayerViewControllerManager *)self presentedAndAppeared])
      {
LABEL_19:
        [(SXVideoPlayerViewControllerResponse *)v8 setShouldAutoplay:v14];
        [(SXVideoPlayerViewControllerResponse *)v8 setExpectVideoPlayerViewController:v12 != 0];
        [(SXVideoPlayerViewControllerResponse *)v8 setAnalyticsRouter:v16];
        [(SXVideoPlayerViewControllerResponse *)v8 setVisibilityMonitor:v18];

        goto LABEL_20;
      }
      v23 = [MEMORY[0x263F08C38] UUID];
      uint64_t v34 = [v23 UUIDString];

      if (v7)
      {
        v32 = [(SXVideoPlayerViewControllerManager *)self pendingReceiveOwnershipBlocks];
        v30 = (void *)[v7 copy];
        v24 = (void *)MEMORY[0x223CA5030]();
        [v32 setObject:v24 forKey:v34];
      }
      if (v35)
      {
        v33 = [(SXVideoPlayerViewControllerManager *)self pendingLoseOwnershipBlocks];
        v31 = (void *)[v35 copy];
        v25 = (void *)MEMORY[0x223CA5030]();
        [v33 setObject:v25 forKey:v34];
      }
      v26 = [(SXVideoPlayerViewControllerManager *)self pendingVideoPlayerViewControllers];
      [v26 setObject:v19 forKey:v34];

      v27 = [(SXVideoPlayerViewControllerManager *)self videoPlayerViewControllers];
      [v27 removeObjectForKey:v6];

      v28 = [(SXVideoPlayerViewControllerManager *)self loseOwnershipBlocks];
      [v28 removeObjectForKey:v6];

      v22 = (void *)v34;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

uint64_t __92__SXVideoPlayerViewControllerManager_videoPlayerViewControllerForURL_receiveOwnershipBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)registerExistingVideoPlayerViewController:(id)a3 URL:(id)a4 analyticsRouter:(id)a5 videoPlayerVisibilityMonitor:(id)a6 loseOwnershipBlock:(id)a7
{
  id v22 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    v16 = [(SXVideoPlayerViewControllerManager *)self videoPlayerViewControllers];
    [v16 setObject:v22 forKey:v12];

    v17 = [(SXVideoPlayerViewControllerManager *)self videoAnalyticsRouters];
    [v17 setObject:v13 forKey:v12];

    objc_super v18 = [(SXVideoPlayerViewControllerManager *)self visibilityMonitors];
    [v18 setObject:v14 forKey:v12];

    if (v15)
    {
      id v19 = [(SXVideoPlayerViewControllerManager *)self loseOwnershipBlocks];
      v20 = (void *)[v15 copy];
      v21 = (void *)MEMORY[0x223CA5030]();
      [v19 setObject:v21 forKey:v12];
    }
  }
}

- (void)setPresentedAndAppeared:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a3 && !self->_presentedAndAppeared)
  {
    BOOL v21 = a3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v4 = [(SXVideoPlayerViewControllerManager *)self pendingVideoPlayerViewControllers];
    uint64_t v5 = [v4 allKeys];
    id v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v12 = [(SXVideoPlayerViewControllerManager *)self pendingVideoPlayerViewControllers];
          id v13 = [v12 objectForKey:v11];

          id v14 = [(SXVideoPlayerViewControllerManager *)self pendingReceiveOwnershipBlocks];
          id v15 = [v14 objectForKey:v11];

          v16 = [(SXVideoPlayerViewControllerManager *)self pendingLoseOwnershipBlocks];
          v17 = [v16 objectForKey:v11];

          if (v17) {
            ((void (**)(void, void *))v17)[2](v17, v13);
          }
          if (v15) {
            ((void (**)(void, void *))v15)[2](v15, v13);
          }
          objc_super v18 = [(SXVideoPlayerViewControllerManager *)self pendingVideoPlayerViewControllers];
          [v18 removeObjectForKey:v11];

          id v19 = [(SXVideoPlayerViewControllerManager *)self pendingLoseOwnershipBlocks];
          [v19 removeObjectForKey:v11];

          v20 = [(SXVideoPlayerViewControllerManager *)self pendingReceiveOwnershipBlocks];
          [v20 removeObjectForKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    a3 = v21;
  }
  self->_presentedAndAppeared = a3;
}

- (void)configureAutoplayForVideoWithURL:(id)a3 analyticsRouter:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(SXVideoPlayerViewControllerManager *)self setAutoplayURL:v8];
  if (v6)
  {
    uint64_t v7 = [(SXVideoPlayerViewControllerManager *)self videoAnalyticsRouters];
    [v7 setObject:v6 forKey:v8];
  }
}

- (BOOL)presentedAndAppeared
{
  return self->_presentedAndAppeared;
}

- (NSURL)autoplayURL
{
  return self->_autoplayURL;
}

- (void)setAutoplayURL:(id)a3
{
}

- (NSMutableDictionary)videoAnalyticsRouters
{
  return self->_videoAnalyticsRouters;
}

- (NSMutableDictionary)visibilityMonitors
{
  return self->_visibilityMonitors;
}

- (NSMutableDictionary)videoPlayerViewControllers
{
  return self->_videoPlayerViewControllers;
}

- (NSMutableDictionary)loseOwnershipBlocks
{
  return self->_loseOwnershipBlocks;
}

- (NSMutableDictionary)pendingVideoPlayerViewControllers
{
  return self->_pendingVideoPlayerViewControllers;
}

- (NSMutableDictionary)pendingLoseOwnershipBlocks
{
  return self->_pendingLoseOwnershipBlocks;
}

- (NSMutableDictionary)pendingReceiveOwnershipBlocks
{
  return self->_pendingReceiveOwnershipBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReceiveOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_pendingLoseOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_pendingVideoPlayerViewControllers, 0);
  objc_storeStrong((id *)&self->_loseOwnershipBlocks, 0);
  objc_storeStrong((id *)&self->_videoPlayerViewControllers, 0);
  objc_storeStrong((id *)&self->_visibilityMonitors, 0);
  objc_storeStrong((id *)&self->_videoAnalyticsRouters, 0);
  objc_storeStrong((id *)&self->_autoplayURL, 0);
}

@end