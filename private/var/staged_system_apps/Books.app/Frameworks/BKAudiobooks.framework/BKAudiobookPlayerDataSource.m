@interface BKAudiobookPlayerDataSource
- (BKAudiobookPlayerDataSourceDelegate)delegate;
- (BOOL)_fetchKeysForMediaItem:(id)a3 loadingRequest:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BKAudiobookPlayerDataSource

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != v4)
  {
    v7 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Data source delegate changed to %@.", (uint8_t *)&v8, 0xCu);
    }

    objc_storeWeak((id *)p_delegate, v4);
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v5 = a4;
  v6 = BKAudiobooksStreamingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AVAsset requested %@", (uint8_t *)&v23, 0xCu);
  }

  v7 = [v5 request];
  int v8 = [v7 URL];
  id v9 = [v8 lastPathComponent];

  v10 = [v9 pathExtension];
  v11 = [v10 lowercaseString];

  if (objc_msgSend(v11, "bk_isPlaylistExtension"))
  {
    v12 = [(BKAudiobookPlayerDataSource *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(BKAudiobookPlayerDataSource *)self delegate];
      unsigned int v15 = [v14 playerDataSource:self shouldWaitForLoadingOfRequestedPlaylist:v5 fileName:v9];
LABEL_9:
      BOOL v18 = v15;
LABEL_14:

      goto LABEL_16;
    }
  }
  else if (objc_msgSend(v11, "bk_isAudioFileExtension"))
  {
    v16 = [(BKAudiobookPlayerDataSource *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v14 = [(BKAudiobookPlayerDataSource *)self delegate];
      unsigned int v15 = [v14 playerDataSource:self shouldWaitForLoadingOfRequestedAudioFile:v5 fileName:v9];
      goto LABEL_9;
    }
  }
  else if (ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest())
  {
    v19 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "AVAsset requested skd file '%@'.", (uint8_t *)&v23, 0xCu);
    }

    v14 = [(BKAudiobookPlayerDataSource *)self delegate];
    v20 = [v14 mediaItem];
    BOOL v18 = [(BKAudiobookPlayerDataSource *)self _fetchKeysForMediaItem:v20 loadingRequest:v5];

    goto LABEL_14;
  }
  BOOL v18 = 0;
LABEL_16:
  v21 = BKAudiobooksStreamingLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = v9;
    __int16 v25 = 1024;
    BOOL v26 = v18;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "AVAsset request of '%@' wait for loading? %d", (uint8_t *)&v23, 0x12u);
  }

  return v18;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v5 = a4;
  v6 = BKAudiobooksStreamingLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AVAsset cancelled request %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = [(BKAudiobookPlayerDataSource *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(BKAudiobookPlayerDataSource *)self delegate];
    [v9 playerDataSource:self didCancelLoadingRequest:v5];
  }
}

- (BOOL)_fetchKeysForMediaItem:(id)a3 loadingRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 request];
  char v8 = [v7 URL];
  id v9 = [v8 absoluteString];

  int v10 = +[BLHLSKeyFetcher sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_EF14;
  v14[3] = &unk_3CCF8;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v10 fetchOfflineKeyForMediaItem:v5 identity:v9 completion:v14];

  return 1;
}

- (BKAudiobookPlayerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAudiobookPlayerDataSourceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end