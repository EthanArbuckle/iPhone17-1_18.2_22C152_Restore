@interface NMSSyncProgressInfo(NanoMediaBridgeUI)
- (BOOL)_isSyncing;
- (id)_legacyTrackProgressTextWithFormat:()NanoMediaBridgeUI;
- (id)_syncProgressTextForMediaType:()NanoMediaBridgeUI;
- (id)_trackProgressTextForMediaType:()NanoMediaBridgeUI;
@end

@implementation NMSSyncProgressInfo(NanoMediaBridgeUI)

- (id)_syncProgressTextForMediaType:()NanoMediaBridgeUI
{
  uint64_t v5 = [a1 syncState];
  if ((unint64_t)(v5 - 98) >= 2 && v5 != 4)
  {
    if (v5 != 3 || ([a1 syncWaitingSubstate] & 1) == 0) {
      goto LABEL_12;
    }
    switch(a3)
    {
      case 2:
        v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v8 = v7;
        v9 = @"SYNC_STATUS_WAITING_TITLE_POWER_AUDIOBOOKS";
        v10 = @"Audiobooks download when Apple Watch is charging";
        goto LABEL_15;
      case 4:
        v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v8 = v7;
        v9 = @"SYNC_STATUS_WAITING_TITLE_POWER_PODCASTS";
        v10 = @"Podcasts download when Apple Watch is charging";
        goto LABEL_15;
      case 8:
        v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v8 = v7;
        v9 = @"SYNC_STATUS_WAITING_TITLE_POWER_MUSIC";
        v10 = @"Music downloads when Apple Watch is charging";
        goto LABEL_15;
    }
LABEL_12:
    v11 = 0;
    goto LABEL_16;
  }
  switch(a3)
  {
    case 2:
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_SYNCING_TITLE_AUDIOBOOKS";
      v10 = @"Updating Audiobooks on Apple Watch…";
      break;
    case 4:
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_SYNCING_TITLE_PODCASTS";
      v10 = @"Updating Podcasts on Apple Watch…";
      break;
    case 8:
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_PROGRESS_TITLE_MUSIC";
      v10 = @"Updating Music on Apple Watch…";
      break;
    default:
      goto LABEL_12;
  }
LABEL_15:
  v11 = [v7 localizedStringForKey:v9 value:v10 table:0];

LABEL_16:
  return v11;
}

- (BOOL)_isSyncing
{
  return [a1 syncState] == 98
      || [a1 syncState] == 4
      || [a1 syncState] == 99;
}

- (id)_trackProgressTextForMediaType:()NanoMediaBridgeUI
{
  uint64_t v5 = [a1 syncState];
  v6 = 0;
  if (v5 <= 3)
  {
    if (v5 == 2)
    {
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_PENDING_TITLE";
      v10 = @"Pending…";
    }
    else
    {
      if (v5 != 3) {
        goto LABEL_16;
      }
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_WAITING_TITLE";
      v10 = @"Waiting…";
    }
    goto LABEL_14;
  }
  if (v5 == 4)
  {
    v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
    v8 = v7;
    v9 = @"SYNC_STATUS_PROGRESS_TITLE";
    v10 = @"Updating…";
LABEL_14:
    v6 = [v7 localizedStringForKey:v9 value:v10 table:0];
LABEL_15:

    goto LABEL_16;
  }
  if (v5 != 99) {
    goto LABEL_16;
  }
  switch(a3)
  {
    case 2:
      v7 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v7;
      v9 = @"SYNC_STATUS_SYNCING_TITLE_AUDIOBOOKS";
      v10 = @"Updating Audiobooks on Apple Watch…";
      goto LABEL_14;
    case 4:
      v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v11;
      v12 = @"SYNC_STATUS_PODCASTS_PROGRESS_TITLE_WITH_DETAIL";
      v13 = @"Updating Episode %1$@ of %2$@…";
      goto LABEL_20;
    case 8:
      v11 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
      v8 = v11;
      v12 = @"SYNC_STATUS_SONGS_PROGRESS_TITLE_WITH_DETAIL";
      v13 = @"Updating Song %1$@ of %2$@…";
LABEL_20:
      v15 = [v11 localizedStringForKey:v12 value:v13 table:0];
      v6 = [a1 _legacyTrackProgressTextWithFormat:v15];

      goto LABEL_15;
  }
  v6 = 0;
LABEL_16:
  return v6;
}

- (id)_legacyTrackProgressTextWithFormat:()NanoMediaBridgeUI
{
  id v4 = a3;
  uint64_t v5 = [a1 numberOfAssetItems];
  uint64_t v6 = [a1 numberOfAssetItemsSynced];
  uint64_t v7 = v6 + 1;
  if (v6 >= v5)
  {
    v8 = NMLogForCategory(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(NMSSyncProgressInfo(NanoMediaBridgeUI) *)v7 _legacyTrackProgressTextWithFormat:v8];
    }

    uint64_t v7 = v5;
  }
  v9 = (void *)MEMORY[0x263F08A30];
  v10 = [NSNumber numberWithInteger:v5];
  v11 = [v9 localizedStringFromNumber:v10 numberStyle:0];

  v12 = (void *)MEMORY[0x263F08A30];
  v13 = [NSNumber numberWithInteger:v7];
  v14 = [v12 localizedStringFromNumber:v13 numberStyle:0];

  v15 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, v14, v11);

  return v15;
}

- (void)_legacyTrackProgressTextWithFormat:()NanoMediaBridgeUI .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2397B1000, log, OS_LOG_TYPE_ERROR, "_trackProgressText -- syncedNumber %zd > totalNumber %zd; pinning syncedNumber.",
    (uint8_t *)&v3,
    0x16u);
}

@end