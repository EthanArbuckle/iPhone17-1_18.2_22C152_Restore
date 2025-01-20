@interface MCDNowPlayingContentManager
@end

@implementation MCDNowPlayingContentManager

void __50___MCDNowPlayingContentManager__limitedUIChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  v3 = [*(id *)(a1 + 32) carSessionStatus];
  id v7 = [v3 currentSession];

  v4 = [v7 limitUserInterfaces];
  if ([v4 BOOLValue])
  {
    v5 = [v7 configuration];
    objc_msgSend(*(id *)(a1 + 32), "setLimitedUI:", ((unint64_t)objc_msgSend(v5, "limitableUserInterfaces") >> 3) & 1);
  }
  else
  {
    [*(id *)(a1 + 32) setLimitedUI:0];
  }

  v6 = [*(id *)(a1 + 32) tableView];
  [v6 reloadData];
}

uint64_t __59___MCDNowPlayingContentManager_modelResponseDidInvalidate___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F11B18];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [*(id *)(a1 + 40) object];
  [v2 removeObserver:v4 name:v3 object:v5];

  v6 = *(void **)(a1 + 32);
  return [v6 _performRequest];
}

void __69___MCDNowPlayingContentManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 32) response];
  uint64_t v3 = [v2 playerPath];

  uint64_t v4 = [v3 representedBundleID];
  v5 = [*(id *)(a1 + 40) bundleID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) response];
    [*(id *)(a1 + 40) setLastReceivedResponse:v7];
  }
  else
  {
    [*(id *)(a1 + 40) setLastReceivedResponse:0];
  }
  v8 = [*(id *)(a1 + 40) lastReceivedResponse];
  v9 = [v8 tracklist];
  v10 = [v9 playingItemIndexPath];

  v11 = *(void **)(a1 + 40);
  if (v10)
  {
    v12 = [v11 lastReceivedResponse];
    v13 = [v12 tracklist];
    v14 = [v13 items];
    v15 = [*(id *)(a1 + 40) lastReceivedResponse];
    v16 = [v15 tracklist];
    v17 = [v16 playingItemIndexPath];
    v18 = [v14 itemAtIndexPath:v17];
    [*(id *)(a1 + 40) setNowPlayingItem:v18];
  }
  else
  {
    [v11 setNowPlayingItem:0];
  }
  v19 = [*(id *)(a1 + 40) delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = *(void **)(a1 + 40);
    v22 = [v21 lastReceivedResponse];
    v23 = [v22 tracklist];
    v24 = [v23 items];
    uint64_t v25 = objc_msgSend(v21, "_shouldShowPlaybackQueueForItemCount:", objc_msgSend(v24, "totalItemCount"));

    v26 = [*(id *)(a1 + 40) delegate];
    [v26 contentManager:*(void *)(a1 + 40) shouldShowPlaybackQueue:v25];
  }
  v27 = [*(id *)(a1 + 40) delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    v29 = [*(id *)(a1 + 40) nowPlayingItem];
    v30 = v29;
    if (v29)
    {
      [v29 duration];
      BOOL v31 = BYTE1(v77) != 0;
    }
    else
    {
      BOOL v31 = 0;
      uint64_t v77 = 0;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v74 = 0u;
    }

    v32 = [*(id *)(a1 + 40) delegate];
    [v32 contentManager:*(void *)(a1 + 40) bufferingItem:v31];
  }
  [*(id *)(a1 + 40) setCurrentPlayingPlaylist:0];
  [*(id *)(a1 + 40) setCurrentPlayingRadioStation:0];
  v33 = [*(id *)(a1 + 40) lastReceivedResponse];
  v34 = [v33 tracklist];
  v35 = [v34 playingItemIndexPath];

  if (v35)
  {
    v36 = [*(id *)(a1 + 40) lastReceivedResponse];
    v37 = [v36 tracklist];
    v38 = [v37 items];
    v39 = [v38 itemAtIndexPath:v35];

    if ([v39 isAutoPlay])
    {
LABEL_22:

      goto LABEL_23;
    }
    v40 = [*(id *)(a1 + 40) lastReceivedResponse];
    v41 = [v40 tracklist];
    v42 = [v41 items];
    v43 = objc_msgSend(v42, "sectionAtIndex:", objc_msgSend(v35, "section"));

    v44 = [v43 metadataObject];
    uint64_t v45 = [v44 type];
    if (v45 == 13)
    {
      v46 = [v44 radioStation];
      [*(id *)(a1 + 40) setCurrentPlayingRadioStation:v46];
    }
    else
    {
      if (v45 != 4)
      {
LABEL_21:

        goto LABEL_22;
      }
      v46 = [v44 playlist];
      [*(id *)(a1 + 40) setCurrentPlayingPlaylist:v46];
    }

    goto LABEL_21;
  }
LABEL_23:
  v47 = [*(id *)(a1 + 40) nowPlayingItem];
  v48 = [v47 metadataObject];

  v49 = [v48 flattenedGenericObject];
  v50 = [v49 anyObject];

  v51 = [*(id *)(a1 + 40) currentPlayingSong];

  if (v51 != v50)
  {
    [*(id *)(a1 + 40) setCurrentPlayingSong:v50];
    [*(id *)(a1 + 40) processArtworkForCurrentlyPlayingSong];
    if ([v48 type] == 5)
    {
      v52 = [v48 playlistEntry];
      [*(id *)(a1 + 40) setCurrentPlayingPlaylistEntry:v52];
    }
    else
    {
      [*(id *)(a1 + 40) setCurrentPlayingPlaylistEntry:0];
    }
    v53 = [*(id *)(a1 + 40) delegate];
    char v54 = objc_opt_respondsToSelector();

    if (v54)
    {
      v55 = [*(id *)(a1 + 40) delegate];
      v56 = *(void **)(a1 + 40);
      v57 = [v56 currentPlayingSong];
      v58 = [*(id *)(a1 + 40) lastReceivedResponse];
      [v55 contentManager:v56 itemDidChange:v57 response:v58];
    }
    v59 = MCDGeneralLogging();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_23F140000, v59, OS_LOG_TYPE_DEFAULT, "Playing content has changed, posting notification", v73, 2u);
    }

    v60 = [MEMORY[0x263F08A00] defaultCenter];
    [v60 postNotificationName:@"MCDContentItemsChangedNotification" object:0];
  }
  v61 = [*(id *)(a1 + 40) lastReceivedResponse];
  uint64_t v62 = [v61 state];

  if (v62 != [*(id *)(a1 + 40) playerState])
  {
    *(void *)(*(void *)(a1 + 40) + 144) = v62;
    v63 = [MEMORY[0x263F08A00] defaultCenter];
    [v63 postNotificationName:@"MCDPlaybackStateChangedNotification" object:0];
  }
  v64 = *(void **)(a1 + 40);
  uint64_t v65 = [*(id *)(a1 + 32) response];
  [v64 _processResponse:v65 error:0];

  v66 = [*(id *)(a1 + 40) delegate];
  LOBYTE(v65) = objc_opt_respondsToSelector();

  if (v65)
  {
    v67 = [*(id *)(a1 + 40) delegate];
    uint64_t v68 = *(void *)(a1 + 40);
    v69 = [*(id *)(a1 + 32) response];
    [v67 contentManager:v68 processResponse:v69 error:0];
  }
  v70 = [*(id *)(a1 + 40) delegate];
  char v71 = objc_opt_respondsToSelector();

  if (v71)
  {
    v72 = [*(id *)(a1 + 40) delegate];
    [v72 contentManagerReloadData:*(void *)(a1 + 40)];
  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_cold_1(WeakRetained, v2);
  }

  [WeakRetained _showPlaceholderArtwork];
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_2;
    block[3] = &unk_26505C350;
    id v7 = *(id *)(a1 + 32);
    id v8 = WeakRetained;
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) currentPlayingSong];
  id v4 = [v3 artworkCatalog];
  LODWORD(v2) = [v2 isArtworkVisuallyIdenticalToCatalog:v4];

  if (v2)
  {
    [*(id *)(a1 + 40) setArtworkTimer:0];
    [*(id *)(a1 + 40) setAlbumArtwork:*(void *)(a1 + 48)];
    v5 = [*(id *)(a1 + 40) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) delegate];
      [v7 contentManagerReloadData:*(void *)(a1 + 40)];
    }
  }
}

void __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 artworkCatalog];
  int v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_23F140000, a2, OS_LOG_TYPE_DEBUG, "Timeout while waiting for artworkCatalog=%p", (uint8_t *)&v4, 0xCu);
}

@end