@interface FROfflineTitleProvider
+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4;
+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5;
+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4;
+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5;
+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4;
+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5;
+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4;
+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5;
@end

@implementation FROfflineTitleProvider

+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _[a1 offlineTitleWithOfflineReason:a3 offlineViewContext:a4 withInfo:0];
}

+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7 = a5;
  v8 = v7;
  switch(a4)
  {
    case 0:
      if ((unint64_t)(a3 - 1) < 5)
      {
        v11 = +[NSBundle mainBundle];
        v9 = v11;
        CFStringRef v12 = @"Feed Unavailable";
        goto LABEL_42;
      }
      if (a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"This feed isn’t available.";
      goto LABEL_42;
    case 1:
      if ((unint64_t)(a3 - 1) > 5) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Couldn’t Reload";
      goto LABEL_42;
    case 2:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Couldn’t Load Stories";
      goto LABEL_42;
    case 3:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Related Stories Unavailable";
      goto LABEL_42;
    case 4:
    case 5:
    case 9:
    case 10:
      v9 = +[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:a3];
      int64_t v10 = [v9 title];
      goto LABEL_43;
    case 6:
      if ((unint64_t)(a3 - 1) >= 5)
      {
        if (a3 != 6) {
          goto LABEL_44;
        }
      }
      else
      {
        v13 = [v7 objectForKey:@"feedType"];
        unsigned int v14 = [v13 isEqualToString:@"channel"];

        if (v14)
        {
LABEL_31:
          v11 = +[NSBundle mainBundle];
          v9 = v11;
          CFStringRef v12 = @"FRChannelUnavailableAlertTitle";
          goto LABEL_42;
        }
        v15 = [v8 objectForKey:@"feedType"];
        unsigned int v16 = [v15 isEqualToString:@"topic"];

        if (v16) {
          goto LABEL_41;
        }
      }
      v17 = [v8 objectForKey:@"feedType"];
      unsigned int v18 = [v17 isEqualToString:@"channel"];

      if (v18) {
        goto LABEL_31;
      }
      v19 = [v8 objectForKey:@"feedType"];
      unsigned int v20 = [v19 isEqualToString:@"topic"];

      if (!v20)
      {
LABEL_44:
        a4 = 0;
        goto LABEL_45;
      }
LABEL_41:
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"FRTopicUnavailableAlertTitle";
LABEL_42:
      int64_t v10 = [v11 localizedStringForKey:v12 value:&stru_1000CABC0 table:0];
LABEL_43:
      a4 = v10;

LABEL_45:
      return (id)a4;
    case 7:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Content Unavailable";
      goto LABEL_42;
    case 8:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Search Unavailable";
      goto LABEL_42;
    case 11:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Apple News Unavailable";
      goto LABEL_42;
    case 12:
      if ((unint64_t)(a3 - 1) > 5) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Can’t Open";
      goto LABEL_42;
    case 13:
    case 14:
      if ((unint64_t)(a3 - 1) > 5) {
        goto LABEL_44;
      }
      v11 = +[NSBundle mainBundle];
      v9 = v11;
      CFStringRef v12 = @"Subscription Unavailable";
      goto LABEL_42;
    default:
      goto LABEL_45;
  }
}

+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _[a1 offlineMessageWithOfflineReason:a3 offlineViewContext:a4 withInfo:0];
}

+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7 = a5;
  v8 = v7;
  switch(a4)
  {
    case 0:
    case 1:
    case 12:
      switch(a3)
      {
        case 1:
        case 2:
          goto LABEL_6;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 2:
      switch(a3)
      {
        case 1:
        case 2:
          goto LABEL_6;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 3:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to see related stories.";
          goto LABEL_28;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          id v9 = [objc_alloc((Class)TSAlertArticleUnavailable) initWithBlockedReason:1];
          int64_t v10 = [v9 message];
          goto LABEL_29;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 4:
    case 5:
    case 9:
    case 10:
      id v9 = +[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:a3];
      int64_t v10 = [v9 subtitle];
      goto LABEL_29;
    case 6:
      switch(a3)
      {
        case 1:
        case 2:
          v13 = [v7 objectForKey:@"feedType"];
          unsigned int v14 = [v13 isEqualToString:@"topic"];

          if (v14)
          {
            v11 = +[NSBundle mainBundle];
            id v9 = v11;
            CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to see this topic.";
          }
          else
          {
            v15 = [v8 objectForKey:@"feedType"];
            unsigned int v16 = [v15 isEqualToString:@"channel"];

            if (v16)
            {
              v11 = +[NSBundle mainBundle];
              id v9 = v11;
              CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to see this channel.";
            }
            else
            {
LABEL_27:
              v11 = +[NSBundle mainBundle];
              id v9 = v11;
              CFStringRef v12 = @"FROpenChannelRequiresLatestVersionOS";
            }
          }
          break;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_27;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
LABEL_28:
      int64_t v10 = [v11 localizedStringForKey:v12 value:&stru_1000CABC0 table:0];
LABEL_29:
      a4 = v10;

      break;
    case 7:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to see this content.";
          goto LABEL_28;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 8:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to search.";
          goto LABEL_28;
        case 3:
LABEL_20:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t supported in your current region.";
          goto LABEL_28;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
LABEL_21:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Sorry, Apple News is no longer fully supported on older devices.";
          goto LABEL_28;
        default:
          goto LABEL_19;
      }
    case 11:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t connected to the internet. Go online to get started.";
          goto LABEL_28;
        case 3:
          goto LABEL_22;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_23;
        default:
          goto LABEL_19;
      }
    case 13:
    case 14:
      switch(a3)
      {
        case 1:
        case 2:
LABEL_6:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News isn’t connected to the internet.";
          goto LABEL_28;
        case 3:
LABEL_22:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"The app isn’t supported in your current region.";
          goto LABEL_28;
        case 4:
        case 5:
LABEL_15:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"FRRequireLatestVersionOS";
          goto LABEL_28;
        case 6:
LABEL_23:
          v11 = +[NSBundle mainBundle];
          id v9 = v11;
          CFStringRef v12 = @"Apple News is no longer fully supported on older devices.";
          goto LABEL_28;
        default:
LABEL_19:
          a4 = 0;
          break;
      }
      break;
    default:
      break;
  }

  return (id)a4;
}

+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _[a1 offlineAcceptActionTitleWithOfflineReason:a3 offlineViewContext:a4 withInfo:0];
}

+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  v5 = 0;
  if ((unint64_t)a4 <= 0xE && ((1 << a4) & 0x6630) != 0)
  {
    v5 = 0;
    if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x36) != 0)
    {
      v6 = +[NSBundle mainBundle];
      v5 = [v6 localizedStringForKey:@"FRGoToSettings" value:&stru_1000CABC0 table:0];
    }
  }

  return v5;
}

+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _[a1 offlineIgnoreActionTitleWithOfflineReason:a3 offlineViewContext:a4 withInfo:0];
}

+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7 = a5;
  v8 = 0;
  if ((unint64_t)a4 <= 0xE && ((1 << a4) & 0x6630) != 0)
  {
    v8 = 0;
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 6) == 0)
      {
        if (((1 << a3) & 0x30) != 0)
        {
          id v9 = +[NSBundle mainBundle];
          int64_t v10 = v9;
          CFStringRef v11 = @"Not Now";
          goto LABEL_9;
        }
        if (((1 << a3) & 0x48) == 0) {
          goto LABEL_10;
        }
      }
      id v9 = +[NSBundle mainBundle];
      int64_t v10 = v9;
      CFStringRef v11 = @"OK";
LABEL_9:
      v8 = [v9 localizedStringForKey:v11 value:&stru_1000CABC0 table:0];
    }
  }
LABEL_10:

  return v8;
}

@end