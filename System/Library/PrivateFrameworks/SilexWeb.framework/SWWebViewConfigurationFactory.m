@interface SWWebViewConfigurationFactory
- (SWWebViewConfigurationFactory)initWithProcessPool:(id)a3 websiteDataStore:(id)a4;
- (WKProcessPool)processPool;
- (WKWebsiteDataStore)websiteDataStore;
- (id)createWebViewConfigurationWithUserContentController:(id)a3 mediaSettings:(id)a4;
@end

@implementation SWWebViewConfigurationFactory

- (SWWebViewConfigurationFactory)initWithProcessPool:(id)a3 websiteDataStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWWebViewConfigurationFactory;
  v9 = [(SWWebViewConfigurationFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processPool, a3);
    objc_storeStrong((id *)&v10->_websiteDataStore, a4);
  }

  return v10;
}

- (id)createWebViewConfigurationWithUserContentController:(id)a3 mediaSettings:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F1FA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(SWWebViewConfigurationFactory *)self processPool];
  [v9 setProcessPool:v10];

  [v9 setAllowsAirPlayForMediaPlayback:0];
  [v9 setAllowsPictureInPictureMediaPlayback:0];
  [v9 setUserContentController:v8];

  [v9 _setWaitsForPaintAfterViewDidMoveToWindow:0];
  v11 = [(SWWebViewConfigurationFactory *)self websiteDataStore];
  [v9 setWebsiteDataStore:v11];

  [v9 setAllowsInlineMediaPlayback:1];
  [v9 _setInlineMediaPlaybackRequiresPlaysInlineAttribute:1];
  objc_msgSend(v9, "setMediaTypesRequiringUserActionForPlayback:", objc_msgSend(v7, "mediaTypesRequiringUserActionForPlayback"));
  [v9 setWritingToolsBehavior:-1];
  id v12 = objc_alloc_init(MEMORY[0x263F1FA20]);
  [v12 _setShouldAllowUserInstalledFonts:0];
  v13 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  unsigned int v15 = [v7 fullScreenEnabled];
  if (v14 == 1) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  [v12 _setFullScreenEnabled:v16];
  [v9 setPreferences:v12];

  return v9;
}

- (WKProcessPool)processPool
{
  return self->_processPool;
}

- (WKWebsiteDataStore)websiteDataStore
{
  return self->_websiteDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteDataStore, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end