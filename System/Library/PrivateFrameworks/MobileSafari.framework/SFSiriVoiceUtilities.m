@interface SFSiriVoiceUtilities
+ (SFSiriVoiceUtilities)sharedVoiceUtilities;
- (NSArray)downloadedSiriVoiceLanguages;
- (NSString)activeSiriReaderSessionIdentifier;
- (NSURL)activeSiriReaderSessionURL;
- (void)fetchAvailableVoiceLanguages;
- (void)setActiveSiriReaderSessionIdentifier:(id)a3;
- (void)setActiveSiriReaderSessionURL:(id)a3;
@end

@implementation SFSiriVoiceUtilities

id __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [a2 language];
  v4 = [v2 localeWithLocaleIdentifier:v3];
  v5 = [v4 languageCode];

  return v5;
}

- (NSString)activeSiriReaderSessionIdentifier
{
  return self->_activeSiriReaderSessionIdentifier;
}

+ (SFSiriVoiceUtilities)sharedVoiceUtilities
{
  if (sharedVoiceUtilities_onceToken != -1) {
    dispatch_once(&sharedVoiceUtilities_onceToken, &__block_literal_global_60);
  }
  v2 = (void *)sharedVoiceUtilities_sharedVoiceUtilitiesInstance;

  return (SFSiriVoiceUtilities *)v2;
}

void __44__SFSiriVoiceUtilities_sharedVoiceUtilities__block_invoke()
{
  v0 = objc_alloc_init(SFSiriVoiceUtilities);
  v1 = (void *)sharedVoiceUtilities_sharedVoiceUtilitiesInstance;
  sharedVoiceUtilities_sharedVoiceUtilitiesInstance = (uint64_t)v0;
}

- (void)fetchAvailableVoiceLanguages
{
  if (!self->_activeSiriDaemonSession)
  {
    v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x1E4FA4F28]);
    activeSiriDaemonSession = self->_activeSiriDaemonSession;
    self->_activeSiriDaemonSession = v3;
  }
  objc_initWeak(&location, self);
  v5 = self->_activeSiriDaemonSession;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke;
  v6[3] = &unk_1E54ED8F8;
  objc_copyWeak(&v7, &location);
  [(SiriTTSDaemonSession *)v5 downloadedVoicesMatching:0 reply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__SFSiriVoiceUtilities_fetchAvailableVoiceLanguages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_5_1);
    uint64_t v6 = [v5 copy];
    id v7 = (void *)WeakRetained[2];
    WeakRetained[2] = v6;

    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_18C354000, This, OS_LOG_TYPE_DEFAULT, "Siri has downloaded voices for the following languages: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    v9 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (NSArray)downloadedSiriVoiceLanguages
{
  return self->_downloadedSiriVoiceLanguages;
}

- (NSURL)activeSiriReaderSessionURL
{
  return self->_activeSiriReaderSessionURL;
}

- (void)setActiveSiriReaderSessionURL:(id)a3
{
}

- (void)setActiveSiriReaderSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSiriReaderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeSiriReaderSessionURL, 0);
  objc_storeStrong((id *)&self->_downloadedSiriVoiceLanguages, 0);

  objc_storeStrong((id *)&self->_activeSiriDaemonSession, 0);
}

@end