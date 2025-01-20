@interface MTEpisodeUnavailableUtil
+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)longReasonTextForNoInternet;
+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4;
+ (id)stringForUnavailableReason:(int64_t)a3;
+ (int64_t)unavailableReasonForEpisode:(id)a3;
+ (int64_t)unavailableReasonForServerEpisode:(id)a3;
+ (void)promptBeforePerformingIntentAsBufferedAirPlayForRoute:(id)a3 provider:(id)a4 queueStatus:(unint64_t)a5 completion:(id)a6;
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
             unsigned int v6 = [v5 isReachable],
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

+ (int64_t)unavailableReasonForServerEpisode:(id)a3
{
  id v3 = a3;
  if ([v3 isRestricted])
  {
    int64_t v4 = 1;
  }
  else
  {
    v5 = +[MTReachability sharedInstance];
    unsigned int v6 = [v5 isReachable];

    if (v6)
    {
      if ([v3 priceTypeIsPSUB]) {
        int64_t v4 = 7;
      }
      else {
        int64_t v4 = 0;
      }
    }
    else
    {
      int64_t v4 = 2;
    }
  }

  return v4;
}

+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v5 = a4;
  unsigned int v6 = v5;
  switch(a3)
  {
    case 3:
      if ([v5 length])
      {
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"EPISODE_FEEDDELETED_TITLE";
        goto LABEL_7;
      }
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"EPISODE_FEEDDELETED_TITLE_NO_PODCAST";
      goto LABEL_17;
    case 4:
      if ([v5 length])
      {
        v7 = +[NSBundle mainBundle];
        v8 = v7;
        CFStringRef v9 = @"EPISODE_UNAVAILABLE_TITLE";
LABEL_7:
        v12 = [v7 localizedStringForKey:v9 value:&stru_10056A8A0 table:0];
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v6);
      }
      else
      {
        v10 = +[NSBundle mainBundle];
        v8 = v10;
        CFStringRef v11 = @"EPISODE_UNAVAILABLE_TITLE_NO_PODCAST";
LABEL_17:
        v13 = [v10 localizedStringForKey:v11 value:&stru_10056A8A0 table:0];
      }

      return v13;
    case 5:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"CANNOT_BE_PLAYED_TITLE";
      goto LABEL_17;
    case 6:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"CANT_BE_PLAYED_ON_DEVICE";
      goto LABEL_17;
    case 7:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"SUBSCRIBE_TO_LISTEN";
      goto LABEL_17;
    case 8:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"SUBSCRIPTION_IS_REQUIRED";
      goto LABEL_17;
    case 9:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"LICENSE_SLOT_ERROR_TITLE";
      goto LABEL_17;
    case 10:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"LICENSE_DEVICES_ERROR_TITLE";
      goto LABEL_17;
    case 11:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"WATCH_CANNOT_PLAY_VIDEOS_TITLE";
      goto LABEL_17;
    default:
      v10 = +[NSBundle mainBundle];
      v8 = v10;
      CFStringRef v11 = @"EPISODE_UNAVAILABLE";
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
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Restricted";
      goto LABEL_3;
    case 13:
LABEL_2:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Unavailable";
LABEL_3:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_10056A8A0 table:0];
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
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"ALERT_MESSAGE_RESTRICTED";
      goto LABEL_11;
    case 2:
      v7 = [a1 longReasonTextForNoInternet];
      break;
    case 7:
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"SUBSCRIPTION_REQUIRED";
      goto LABEL_11;
    case 9:
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"LICENSE_SLOT_ERROR";
      goto LABEL_11;
    case 10:
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"LICENSE_DEVICES_ERROR";
      goto LABEL_11;
    case 11:
      v8 = +[NSBundle mainBundle];
      CFStringRef v9 = v8;
      CFStringRef v10 = @"WATCH_CANNOT_PLAY_VIDEOS_MESSAGE";
LABEL_11:
      v7 = [v8 localizedStringForKey:v10 value:&stru_10056A8A0 table:0];

      break;
    case 13:
      int v11 = MGGetBoolAnswer();
      v12 = @"WIFI_LICENSE_CORRUPTION_ERROR";
      if (v11) {
        v12 = @"WLAN_LICENSE_CORRUPTION_ERROR";
      }
      v13 = v12;
      v14 = +[NSBundle mainBundle];
      v7 = [v14 localizedStringForKey:v13 value:&stru_10056A8A0 table:0];

      break;
    default:
      break;
  }

  return v7;
}

+ (id)longReasonTextForNoInternet
{
  v2 = +[MTReachability sharedInstance];
  id v3 = [v2 reasonForNoInternet];

  if (v3 == (id)1)
  {
    int v6 = MGGetBoolAnswer();
    v7 = @"EPISODE_AIRPLANE_MODE_WIFI";
    CFStringRef v8 = @"EPISODE_AIRPLANE_MODE_WLAN";
LABEL_7:
    if (v6) {
      v7 = (__CFString *)v8;
    }
    CFStringRef v9 = v7;
    int64_t v4 = +[NSBundle mainBundle];
    CFStringRef v5 = [v4 localizedStringForKey:v9 value:&stru_10056A8A0 table:0];

    goto LABEL_10;
  }
  if (v3 == (id)2)
  {
    int v6 = MGGetBoolAnswer();
    v7 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WIFI";
    CFStringRef v8 = @"EPISODE_SYSTEM_CELLULAR_DISABLED_WLAN";
    goto LABEL_7;
  }
  if (v3 == (id)3)
  {
    int64_t v4 = +[NSBundle mainBundle];
    CFStringRef v5 = [v4 localizedStringForKey:@"EPISODE_NO_INTERNET" value:&stru_10056A8A0 table:0];
LABEL_10:

    goto LABEL_12;
  }
  CFStringRef v5 = 0;
LABEL_12:

  return v5;
}

- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000E63AC;
  v24[3] = &unk_100551090;
  id v9 = a5;
  id v25 = v9;
  int64_t v26 = a3;
  CFStringRef v10 = objc_retainBlock(v24);
  int v11 = 0;
  unsigned __int8 v12 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v17 = +[PFRestrictionsController shared];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000E63CC;
      v22[3] = &unk_10054ECB8;
      v23 = v10;
      [v17 presentAlertIfNeeded:0 presentationCompletion:0 actionCompletion:v22];

      int v11 = 0;
      unsigned __int8 v12 = 1;
      v13 = v23;
      goto LABEL_3;
    case 2:
      v18 = +[MTReachability sharedInstance];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000E63E0;
      v19[3] = &unk_1005510B8;
      id v20 = v9;
      uint64_t v21 = 2;
      unsigned __int8 v12 = [v18 showInternetUnreachableDialogWithAcknowledmentBlock:v19];

      int v11 = 0;
      v13 = v20;
      goto LABEL_3;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
      v13 = [(id)objc_opt_class() alertTitleForUnavailableReason:a3 podcastTitle:v8];
      int v11 = [(id)objc_opt_class() longStringForUnavailableReason:a3 podcastTitle:v8];
      [(MTEpisodeUnavailableUtil *)self _presentErrorDialogWithTitle:v13 message:v11 handler:v10];
      unsigned __int8 v12 = 1;
LABEL_3:

      break;
    default:
      break;
  }
  v14 = _MTLogCategoryPlayback();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = v11;
    if (!v11)
    {
      v15 = [(id)objc_opt_class() longStringForUnavailableReason:a3 podcastTitle:v8];
    }
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Episode Unavailable (%@)", buf, 0xCu);
    if (!v11) {
  }
    }
LABEL_10:

  return v12;
}

- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v11 = +[MTAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_10056A8A0 table:0];
  CFStringRef v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v7];

  [v11 addAction:v10];
  [v11 presentAnimated:1 completion:0];
}

+ (void)promptBeforePerformingIntentAsBufferedAirPlayForRoute:(id)a3 provider:(id)a4 queueStatus:(unint64_t)a5 completion:(id)a6
{
  id v52 = a3;
  id v51 = a4;
  id v8 = a6;
  id v9 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
  CFStringRef v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"Cancel" value:&stru_10056A8A0 table:0];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000E6D9C;
  v55[3] = &unk_100550688;
  id v12 = v8;
  id v56 = v12;
  v13 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v55];

  [v9 addAction:v13];
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Play" value:&stru_10056A8A0 table:0];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000E6DB0;
  v53[3] = &unk_100550688;
  id v16 = v12;
  id v54 = v16;
  v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v53];

  [v9 addAction:v17];
  [v9 setPreferredAction:v17];
  if (isTV())
  {
    (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
    v18 = 0;
    v19 = 0;
    uint64_t v21 = v51;
    id v20 = v52;
  }
  else
  {
    if (isPad())
    {
      id v20 = v52;
      if ([v52 isHomePodRoute])
      {
        v22 = +[NSBundle mainBundle];
        v19 = [v22 localizedStringForKey:@"SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPAD" value:&stru_10056A8A0 table:0];
        uint64_t v21 = v51;
      }
      else
      {
        unsigned int v28 = [v52 isAppleTVRoute];
        v29 = +[NSBundle mainBundle];
        v22 = v29;
        if (v28) {
          CFStringRef v30 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPAD";
        }
        else {
          CFStringRef v30 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPAD";
        }
        v19 = [v29 localizedStringForKey:v30 value:&stru_10056A8A0 table:0];
        uint64_t v21 = v51;
        id v20 = v52;
      }

      switch(a5)
      {
        case 0uLL:
          goto LABEL_60;
        case 1uLL:
          v35 = +[NSBundle mainBundle];
          if (v21)
          {
            CFStringRef v36 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD";
            goto LABEL_34;
          }
          CFStringRef v45 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD_NO_PROVIDER";
          break;
        case 2uLL:
          v38 = +[NSBundle mainBundle];
          v35 = v38;
          CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPAD";
          goto LABEL_46;
        case 3uLL:
          v38 = +[NSBundle mainBundle];
          v35 = v38;
          CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPAD";
          goto LABEL_46;
        case 4uLL:
          if ([v20 isHomePodRoute])
          {
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            CFStringRef v42 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPAD";
          }
          else
          {
            unsigned int v44 = [v20 isAppleTVRoute];
            v40 = +[NSBundle mainBundle];
            v41 = v40;
            if (v44) {
              CFStringRef v42 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPAD";
            }
            else {
              CFStringRef v42 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPAD";
            }
          }
          uint64_t v46 = [v40 localizedStringForKey:v42 value:&stru_10056A8A0 table:0];

          v18 = 0;
          v19 = (void *)v46;
          goto LABEL_59;
        default:
          goto LABEL_35;
      }
LABEL_56:
      v43 = [v35 localizedStringForKey:v45 value:&stru_10056A8A0 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, 0);
      v18 = LABEL_57:;
    }
    else
    {
      int v23 = isTouch();
      id v20 = v52;
      unsigned int v24 = [v52 isHomePodRoute];
      if (v23)
      {
        if (v24)
        {
          id v25 = +[NSBundle mainBundle];
          int64_t v26 = v25;
          CFStringRef v27 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPOD";
        }
        else
        {
          unsigned int v34 = [v52 isAppleTVRoute];
          id v25 = +[NSBundle mainBundle];
          int64_t v26 = v25;
          if (v34) {
            CFStringRef v27 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPOD";
          }
          else {
            CFStringRef v27 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPOD";
          }
        }
        v19 = [v25 localizedStringForKey:v27 value:&stru_10056A8A0 table:0];
        uint64_t v21 = v51;

        switch(a5)
        {
          case 0uLL:
            goto LABEL_60;
          case 1uLL:
            v35 = +[NSBundle mainBundle];
            if (v51)
            {
              CFStringRef v36 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPOD";
              goto LABEL_34;
            }
            CFStringRef v45 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPOD_NO_PROVIDER";
            goto LABEL_56;
          case 2uLL:
            v38 = +[NSBundle mainBundle];
            v35 = v38;
            CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPOD";
            goto LABEL_46;
          case 3uLL:
            v38 = +[NSBundle mainBundle];
            v35 = v38;
            CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPOD";
            goto LABEL_46;
          case 4uLL:
            if ([v52 isHomePodRoute])
            {
              v38 = +[NSBundle mainBundle];
              v35 = v38;
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPOD";
              goto LABEL_46;
            }
            unsigned int v47 = [v52 isAppleTVRoute];
            v35 = +[NSBundle mainBundle];
            if (v47) {
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPOD";
            }
            else {
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPOD";
            }
            break;
          default:
            goto LABEL_35;
        }
      }
      else
      {
        if (v24)
        {
          v31 = +[NSBundle mainBundle];
          v32 = v31;
          CFStringRef v33 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPHONE";
        }
        else
        {
          unsigned int v37 = [v52 isAppleTVRoute];
          v31 = +[NSBundle mainBundle];
          v32 = v31;
          if (v37) {
            CFStringRef v33 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPHONE";
          }
          else {
            CFStringRef v33 = @"SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPHONE";
          }
        }
        v19 = [v31 localizedStringForKey:v33 value:&stru_10056A8A0 table:0];
        uint64_t v21 = v51;

        switch(a5)
        {
          case 0uLL:
            goto LABEL_60;
          case 1uLL:
            v35 = +[NSBundle mainBundle];
            if (!v51)
            {
              CFStringRef v45 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPHONE_NO_PROVIDER";
              goto LABEL_56;
            }
            CFStringRef v36 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPHONE";
LABEL_34:
            v43 = [v35 localizedStringForKey:v36 value:&stru_10056A8A0 table:0];
            +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v43, v21);
            goto LABEL_57;
          case 2uLL:
            v38 = +[NSBundle mainBundle];
            v35 = v38;
            CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPHONE";
            goto LABEL_46;
          case 3uLL:
            v38 = +[NSBundle mainBundle];
            v35 = v38;
            CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPHONE";
            goto LABEL_46;
          case 4uLL:
            if ([v52 isHomePodRoute])
            {
              v38 = +[NSBundle mainBundle];
              v35 = v38;
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPHONE";
              goto LABEL_46;
            }
            unsigned int v48 = [v52 isAppleTVRoute];
            v35 = +[NSBundle mainBundle];
            if (v48) {
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPHONE";
            }
            else {
              CFStringRef v39 = @"SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPHONE";
            }
            break;
          default:
LABEL_35:
            v18 = 0;
            goto LABEL_59;
        }
      }
      v38 = v35;
LABEL_46:
      v18 = [v38 localizedStringForKey:v39 value:&stru_10056A8A0 table:0];
    }
  }
LABEL_59:
  [v9 setTitle:v19];
  [v9 setMessage:v18];
  v49 = +[UIViewController mt_rootViewController];
  [v49 presentViewController:v9 animated:1 completion:0];

LABEL_60:
}

@end