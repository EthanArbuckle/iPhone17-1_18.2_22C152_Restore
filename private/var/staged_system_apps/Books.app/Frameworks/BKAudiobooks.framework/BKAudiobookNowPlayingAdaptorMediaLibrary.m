@interface BKAudiobookNowPlayingAdaptorMediaLibrary
- (MPNowPlayingContentItem)contentItemForPreviews;
- (NSMutableArray)artworkCompletionBlocks;
- (UIImage)nowPlayingAudiobookArtworkForPreviews;
- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4;
- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3;
- (void)_fireAndFreeArtworkCompletionBlocksWithImage:(id)a3 error:(id)a4;
- (void)coverWillChangeTo:(CGImage *)a3;
- (void)dealloc;
- (void)nowPlayingInfoChanged:(BOOL)a3;
- (void)player:(id)a3 audiobookDidChange:(id)a4;
- (void)setArtworkCompletionBlocks:(id)a3;
- (void)setContentItemForPreviews:(id)a3;
- (void)setNowPlayingAudiobookArtworkForPreviews:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation BKAudiobookNowPlayingAdaptorMediaLibrary

- (void)dealloc
{
  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self _fireAndFreeArtworkCompletionBlocksWithImage:0 error:0];
  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)&v3 dealloc];
}

- (void)setSessionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  [(BKAudiobookNowPlayingAdaptor *)&v4 setSessionID:a3];
  [(BKAudiobookNowPlayingAdaptor *)self invalidatePlaybackQueue];
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  if ([(BKAudiobookNowPlayingAdaptor *)self audiobookPlayerActiveOutput])
  {
    objc_opt_class();
    v6 = [(BKAudiobookNowPlayingAdaptor *)self player];
    v7 = [v6 currentAudiobook];
    v8 = BUDynamicCast();

    if (v8)
    {
      objc_opt_class();
      v9 = [(BKAudiobookNowPlayingAdaptor *)self player];
      v10 = [v9 currentChapter];
      v11 = BUDynamicCast();

      if (v11)
      {
        v12 = [(BKAudiobookNowPlayingAdaptor *)self player];
        v13 = (char *)[v12 currentChapterIndex];

        v14 = [v8 chapters];
        v15 = (char *)[v14 count];

        if (&v13[a4] >= v15)
        {
          v18 = 0;
          v20 = 0;
        }
        else
        {
          objc_opt_class();
          v16 = [v8 chapters];
          v17 = [v16 objectAtIndexedSubscript:&v13[a4]];
          v18 = BUDynamicCast();

          v19 = [v18 contentItem];
          v20 = [v19 identifier];
        }
        v26 = BKAudiobooksNowPlayingAdaptorLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = +[NSNumber numberWithInteger:a4];
          v28 = [v18 contentItem];
          v29 = [v28 identifier];
          v30 = +[NSNumber numberWithInteger:v13];
          int v32 = 138412802;
          v33 = v27;
          __int16 v34 = 2112;
          v35 = v29;
          __int16 v36 = 2112;
          v37 = v30;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "contentItemIDForOffset[%@]=%@ chapter=%@", (uint8_t *)&v32, 0x20u);
        }
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v21 = [(BKAudiobookNowPlayingAdaptor *)self player];
      v22 = [v21 currentAudiobook];
      unsigned int v23 = [v22 isAudiobookPreview];

      v20 = 0;
      if (v23 && !a4)
      {
        v24 = [(BKAudiobookNowPlayingAdaptor *)self player];
        v25 = [v24 currentAudiobook];
        v20 = [v25 assetID];
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v5 = a4;
  v6 = [(BKAudiobookNowPlayingAdaptor *)self player];
  v7 = [v6 currentAudiobook];

  if (![(BKAudiobookNowPlayingAdaptor *)self audiobookPlayerActiveOutput])
  {
    v12 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  v8 = BUDynamicCast();
  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v9 = [(BKAudiobookNowPlayingAdaptor *)self player];
    v10 = [v9 currentAudiobook];
    v11 = [v10 chapters];

    v12 = (char *)[v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v12)
    {
      v33 = v7;
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          v15 = BUDynamicCast();
          v16 = [v15 contentItem];
          v17 = [v16 identifier];
          unsigned int v18 = [v17 isEqualToString:v5];

          if (v18)
          {
            v12 = v16;
            v19 = BKAudiobooksNowPlayingAdaptorLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v12 identifier];
              *(_DWORD *)buf = 138412546;
              v41 = v20;
              __int16 v42 = 2112;
              v43 = v12;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "contentItemForID[%@]=%@", buf, 0x16u);
            }
            v7 = v33;
            goto LABEL_16;
          }
        }
        v12 = (char *)[v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      v7 = v33;
    }
  }
  else
  {
    if (![v7 isAudiobookPreview]
      || ([v7 assetID],
          v21 = objc_claimAutoreleasedReturnValue(),
          unsigned int v22 = [v5 isEqual:v21],
          v21,
          !v22))
    {
      v12 = 0;
      goto LABEL_23;
    }
    id v23 = objc_alloc((Class)MPNowPlayingContentItem);
    v24 = [v7 assetID];
    v12 = (char *)[v23 initWithIdentifier:v24];

    [v12 setMediaType:4];
    v25 = [v7 author];
    [v12 setTrackArtistName:v25];

    v26 = [v7 author];
    [v12 setAlbumArtistName:v26];

    v27 = [v7 title];
    [v12 setTitle:v27];

    v28 = [v7 title];
    [v12 setAlbumName:v28];

    [v7 duration];
    [v12 setDuration:];
    [v12 setElapsedTime:0.0];
    [v12 setPlaybackRate:0.0];
    LODWORD(v29) = 1.0;
    [v12 setDefaultPlaybackRate:v29];
    [v12 setNumberOfChildren:0];
    [v12 setContainer:0];
    [v12 setHasArtwork:1];
    [v12 setPlayable:1];
    v38[0] = kMRMediaRemoteNowPlayingInfoChapterNumber;
    v38[1] = kMRMediaRemoteNowPlayingInfoTotalChapterCount;
    v39[0] = &off_3E0E8;
    v39[1] = &off_3E100;
    v38[2] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
    v30 = [v7 assetID];
    v39[2] = v30;
    v11 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

    [v12 setNowPlayingInfo:v11];
    [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self setContentItemForPreviews:v12];
    v15 = BKAudiobooksNowPlayingAdaptorLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v12 identifier];
      *(_DWORD *)buf = 138412546;
      v41 = v31;
      __int16 v42 = 2112;
      v43 = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "contentItemForID[%@]=%@", buf, 0x16u);
    }
LABEL_16:
  }
LABEL_23:

LABEL_24:

  return v12;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  unsigned int v14 = [(BKAudiobookNowPlayingAdaptor *)self audiobookPlayerActiveOutput];
  v15 = BKAudiobooksNowPlayingAdaptorLog();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Attempting to fetch artwork for active audiobook.", (uint8_t *)buf, 2u);
    }

    v17 = [(BKAudiobookNowPlayingAdaptor *)self player];
    unsigned int v18 = [v17 currentAudiobook];

    objc_initWeak(buf, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1015C;
    v21[3] = &unk_3CD68;
    objc_copyWeak(v25, buf);
    id v19 = v18;
    id v22 = v19;
    id v23 = self;
    id v24 = v13;
    v25[1] = *(id *)&width;
    v25[2] = *(id *)&height;
    [v19 artworkWithCompletion:v21];

    objc_destroyWeak(v25);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_253E0(v16);
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }

  return 0;
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  return [(BKAudiobookNowPlayingAdaptor *)self sessionID];
}

- (void)nowPlayingInfoChanged:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(BKAudiobookNowPlayingAdaptor *)self player];
  v6 = [v5 currentChapter];
  v7 = BUDynamicCast();

  v8 = [(BKAudiobookNowPlayingAdaptor *)self player];
  [v8 playbackRate];
  float v10 = v9;

  id v11 = [(BKAudiobookNowPlayingAdaptor *)self player];
  [v11 positionInCurrentChapter];
  double v13 = v12;

  if (v3)
  {
    unsigned int v14 = [(BKAudiobookNowPlayingAdaptor *)self player];
    unsigned int v15 = [v14 isPlaying];

    if (!v15) {
      float v10 = 0.0;
    }
  }
  v16 = [v7 contentItem];
  v17 = [(BKAudiobookNowPlayingAdaptor *)self player];
  unsigned int v18 = [v17 currentAudiobook];
  unsigned int v19 = [v18 isAudiobookPreview];

  if (v19)
  {
    uint64_t v21 = [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self contentItemForPreviews];

    v16 = (void *)v21;
  }
  if (v16)
  {
    *(float *)&double v20 = v10;
    [v16 setElapsedTime:v13 playbackRate:v20];
    id v22 = [(BKAudiobookNowPlayingAdaptor *)self player];
    [v22 playbackRate];
    [v16 setDefaultPlaybackRate:];

    id v23 = [v16 userInfo];
    if (!v23)
    {
      id v23 = +[NSDictionary dictionary];
    }
    id v24 = [(BKAudiobookNowPlayingAdaptor *)self player];
    if ([v24 isStalling])
    {
      id v25 = &dword_0 + 1;
    }
    else
    {
      v26 = [(BKAudiobookNowPlayingAdaptor *)self player];
      id v25 = [v26 isLoadingResources];
    }
    uint64_t v27 = MPNowPlayingContentItemUserInfoKeyIsLoading;
    v28 = [v23 objectForKey:MPNowPlayingContentItemUserInfoKeyIsLoading];
    unsigned int v29 = [v28 BOOLValue];

    if (v25 != v29)
    {
      id v30 = [v23 mutableCopy];
      v31 = +[NSNumber numberWithBool:v25];
      [v30 setObject:v31 forKey:v27];

      [v16 setUserInfo:v30];
    }
    int v32 = BKAudiobooksNowPlayingAdaptorLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v16 identifier];
      [v16 playbackRate];
      double v35 = v34;
      [v16 elapsedTime];
      uint64_t v37 = v36;
      v38 = +[NSNumber numberWithBool:v25];
      int v45 = 138413058;
      v46 = v33;
      __int16 v47 = 2048;
      double v48 = v35;
      __int16 v49 = 2048;
      uint64_t v50 = v37;
      __int16 v51 = 2112;
      v52 = v38;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "nowPlayingInfoChanged identifier=%@ rate=%f elapsedTime=%f isLoading=%@", (uint8_t *)&v45, 0x2Au);
    }
  }
  else
  {
    id v23 = BKAudiobooksNowPlayingAdaptorLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v45) = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "nowPlayingInfoChanged no contentItem available", (uint8_t *)&v45, 2u);
    }
  }

  v39 = [(BKAudiobookNowPlayingAdaptor *)self player];
  [v39 playbackRate];
  int v41 = v40;
  __int16 v42 = +[MPRemoteCommandCenter sharedCommandCenter];
  v43 = [v42 changePlaybackRateCommand];
  LODWORD(v44) = v41;
  [v43 setPreferredRate:v44];
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  [(BKAudiobookNowPlayingAdaptor *)&v5 player:a3 audiobookDidChange:a4];
  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self _fireAndFreeArtworkCompletionBlocksWithImage:0 error:0];
  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self setNowPlayingAudiobookArtworkForPreviews:0];
  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self setContentItemForPreviews:0];
}

- (void)coverWillChangeTo:(CGImage *)a3
{
  if (a3)
  {
    objc_super v4 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:");
    [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self setNowPlayingAudiobookArtworkForPreviews:v4];

    id v5 = [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self nowPlayingAudiobookArtworkForPreviews];
    [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self _fireAndFreeArtworkCompletionBlocksWithImage:v5 error:0];
  }
}

- (void)_fireAndFreeArtworkCompletionBlocksWithImage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self artworkCompletionBlocks];
  id v9 = [v8 copy];

  [(BKAudiobookNowPlayingAdaptorMediaLibrary *)self setArtworkCompletionBlocks:0];
  float v10 = BKAudiobooksNowPlayingAdaptorLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v6 size];
    id v11 = NSStringFromCGSize(v24);
    *(_DWORD *)buf = 138543362;
    id v23 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Finished generating artwork for active preview audiobook (%{public}@)", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v16));
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (UIImage)nowPlayingAudiobookArtworkForPreviews
{
  return self->_nowPlayingAudiobookArtworkForPreviews;
}

- (void)setNowPlayingAudiobookArtworkForPreviews:(id)a3
{
}

- (MPNowPlayingContentItem)contentItemForPreviews
{
  return self->_contentItemForPreviews;
}

- (void)setContentItemForPreviews:(id)a3
{
}

- (NSMutableArray)artworkCompletionBlocks
{
  return self->_artworkCompletionBlocks;
}

- (void)setArtworkCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_contentItemForPreviews, 0);

  objc_storeStrong((id *)&self->_nowPlayingAudiobookArtworkForPreviews, 0);
}

@end