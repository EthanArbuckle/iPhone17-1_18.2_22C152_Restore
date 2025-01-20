@interface MTEpisodeUnavailableUtil
+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)longReasonTextForNoInternet;
+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)stringForUnavailableReason:(int64_t)a3;
+ (int64_t)unavailableReasonForEpisode:(id)a3;
- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5;
- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5;
@end

@implementation MTEpisodeUnavailableUtil

+ (int64_t)unavailableReasonForEpisode:(id)a3
{
  id v3 = a3;
  if ([v3 isRestricted])
  {
    int64_t v4 = 1;
  }
  else if ([v3 feedDeleted] && !objc_msgSend(v3, "isDownloaded"))
  {
    int64_t v4 = 3;
  }
  else if (([v3 isDownloaded] & 1) != 0 {
         || (+[MTReachability sharedInstance],
  }
             v5 = objc_claimAutoreleasedReturnValue(),
             int v6 = [v5 isReachable],
             v5,
             v6))
  {
    if ([v3 isEntitled]) {
      int64_t v4 = 0;
    }
    else {
      int64_t v4 = 7;
    }
  }
  else
  {
    int64_t v4 = 2;
  }

  return v4;
}

+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  switch(a3)
  {
    case 3:
      if ([v5 length])
      {
        v7 = NSString;
        v8 = [MEMORY[0x263F086E0] mainBundle];
        v9 = v8;
        v10 = @"EPISODE_FEEDDELETED_TITLE";
        goto LABEL_7;
      }
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"EPISODE_FEEDDELETED_TITLE_NO_PODCAST";
      goto LABEL_17;
    case 4:
      if ([v5 length])
      {
        v7 = NSString;
        v8 = [MEMORY[0x263F086E0] mainBundle];
        v9 = v8;
        v10 = @"EPISODE_UNAVAILABLE_TITLE";
LABEL_7:
        v13 = [v8 localizedStringForKey:v10 value:&stru_26F2CCBC8 table:0];
        v14 = objc_msgSend(v7, "stringWithFormat:", v13, v6);
      }
      else
      {
        v11 = [MEMORY[0x263F086E0] mainBundle];
        v9 = v11;
        v12 = @"EPISODE_UNAVAILABLE_TITLE_NO_PODCAST";
LABEL_17:
        v14 = [v11 localizedStringForKey:v12 value:&stru_26F2CCBC8 table:0];
      }

      return v14;
    case 5:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"CANNOT_BE_PLAYED_TITLE";
      goto LABEL_17;
    case 6:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"CANT_BE_PLAYED_ON_DEVICE";
      goto LABEL_17;
    case 7:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"SUBSCRIBE_TO_LISTEN";
      goto LABEL_17;
    case 8:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"SUBSCRIPTION_IS_REQUIRED";
      goto LABEL_17;
    case 9:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"LICENSE_SLOT_ERROR_TITLE";
      goto LABEL_17;
    case 10:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"LICENSE_DEVICES_ERROR_TITLE";
      goto LABEL_17;
    case 11:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"WATCH_CANNOT_PLAY_VIDEOS_TITLE";
      goto LABEL_17;
    default:
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v11;
      v12 = @"EPISODE_UNAVAILABLE";
      goto LABEL_17;
  }
}

+ (id)stringForUnavailableReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) < 8) {
    goto LABEL_2;
  }
  switch(a3)
  {
    case 1:
      id v3 = [MEMORY[0x263F086E0] mainBundle];
      int64_t v4 = v3;
      id v5 = @"Restricted";
      goto LABEL_3;
    case 13:
LABEL_2:
      id v3 = [MEMORY[0x263F086E0] mainBundle];
      int64_t v4 = v3;
      id v5 = @"Unavailable";
LABEL_3:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_26F2CCBC8 table:0];
LABEL_4:
      v7 = (void *)v6;

      goto LABEL_5;
    case 2:
      int64_t v4 = +[MTReachability sharedInstance];
      uint64_t v6 = [v4 reasonTextForNoInternet];
      goto LABEL_4;
  }
  v7 = 0;
LABEL_5:
  return v7;
}

+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 1:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v8;
      v10 = @"ALERT_MESSAGE_RESTRICTED";
      goto LABEL_11;
    case 2:
      v7 = [a1 longReasonTextForNoInternet];
      break;
    case 7:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v8;
      v10 = @"SUBSCRIPTION_REQUIRED";
      goto LABEL_11;
    case 9:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v8;
      v10 = @"LICENSE_SLOT_ERROR";
      goto LABEL_11;
    case 10:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v8;
      v10 = @"LICENSE_DEVICES_ERROR";
      goto LABEL_11;
    case 11:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = v8;
      v10 = @"WATCH_CANNOT_PLAY_VIDEOS_MESSAGE";
LABEL_11:
      v7 = [v8 localizedStringForKey:v10 value:&stru_26F2CCBC8 table:0];

      break;
    case 13:
      int v11 = MGGetBoolAnswer();
      v12 = @"WIFI_LICENSE_CORRUPTION_ERROR";
      if (v11) {
        v12 = @"WLAN_LICENSE_CORRUPTION_ERROR";
      }
      v13 = (void *)MEMORY[0x263F086E0];
      v14 = v12;
      v15 = [v13 mainBundle];
      v7 = [v15 localizedStringForKey:v14 value:&stru_26F2CCBC8 table:0];

      break;
    default:
      break;
  }

  return v7;
}

+ (id)longReasonTextForNoInternet
{
  v2 = +[MTReachability sharedInstance];
  uint64_t v3 = [v2 reasonForNoInternet];

  switch(v3)
  {
    case 1:
      int v6 = MGGetBoolAnswer();
      v7 = @"EPISODE_AIRPLANE_MODE_WIFI";
      v8 = @"EPISODE_AIRPLANE_MODE_WLAN";
LABEL_7:
      if (v6) {
        v7 = v8;
      }
      v9 = (void *)MEMORY[0x263F086E0];
      v10 = v7;
      int64_t v4 = [v9 mainBundle];
      id v5 = [v4 localizedStringForKey:v10 value:&stru_26F2CCBC8 table:0];

      goto LABEL_10;
    case 2:
      int v6 = MGGetBoolAnswer();
      v7 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WIFI";
      v8 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WLAN";
      goto LABEL_7;
    case 3:
      int64_t v4 = [MEMORY[0x263F086E0] mainBundle];
      id v5 = [v4 localizedStringForKey:@"EPISODE_NO_INTERNET" value:&stru_26F2CCBC8 table:0];
LABEL_10:

      goto LABEL_12;
  }
  id v5 = 0;
LABEL_12:
  return v5;
}

- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke;
  aBlock[3] = &unk_2650555E8;
  id v10 = v9;
  id v23 = v10;
  int64_t v24 = a3;
  int v11 = _Block_copy(aBlock);
  v12 = 0;
  char v13 = 0;
  if ((unint64_t)a3 > 0xD) {
    goto LABEL_5;
  }
  if (((1 << a3) & 0x2F78) != 0)
  {
    v14 = [(id)objc_opt_class() alertTitleForUnavailableReason:a3 podcastTitle:v8];
    v12 = [(id)objc_opt_class() longStringForUnavailableReason:a3 podcastTitle:v8];
    [(MTEpisodeUnavailableUtil *)self _presentErrorDialogWithTitle:v14 message:v12 handler:v11];
    char v13 = 1;
LABEL_4:

    goto LABEL_5;
  }
  if (!a3) {
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    v18 = +[MTReachability sharedInstance];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke_2;
    v19[3] = &unk_265055610;
    id v20 = v10;
    uint64_t v21 = 2;
    char v13 = [v18 showInternetUnreachableDialogWithAcknowledmentBlock:v19];

    v12 = 0;
    v14 = v20;
    goto LABEL_4;
  }
LABEL_5:
  v15 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = v12;
    if (!v12)
    {
      v16 = [(id)objc_opt_class() longStringForUnavailableReason:a3 podcastTitle:v8];
    }
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl(&dword_23F08F000, v15, OS_LOG_TYPE_ERROR, "Episode Unavailable (%@)", buf, 0xCu);
    if (!v12) {
  }
    }
LABEL_11:

  return v13;
}

uint64_t __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_23F08F000, v8, OS_LOG_TYPE_ERROR, "Unable to show Episode Unavailable dialog. Title = [%@], Message = [%@]", (uint8_t *)&v9, 0x16u);
  }
}

@end