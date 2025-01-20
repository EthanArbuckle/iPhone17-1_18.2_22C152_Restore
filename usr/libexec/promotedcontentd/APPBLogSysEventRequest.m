@interface APPBLogSysEventRequest
+ (id)options;
- (APPBClickLocation)clickLocation;
- (APPBLogMetaData)metaData;
- (BOOL)hasActionableDuration;
- (BOOL)hasBannerCustomMetadata;
- (BOOL)hasClickLocation;
- (BOOL)hasEventType;
- (BOOL)hasMetaData;
- (BOOL)hasRequestCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bannerCustomMetadata;
- (float)actionableDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (int)requestCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionableDuration:(float)a3;
- (void)setBannerCustomMetadata:(id)a3;
- (void)setClickLocation:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasActionableDuration:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasRequestCount:(BOOL)a3;
- (void)setMetaData:(id)a3;
- (void)setRequestCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogSysEventRequest

+ (id)options
{
  if (qword_100289778 != -1) {
    dispatch_once(&qword_100289778, &stru_100234DC0);
  }
  v2 = (void *)qword_100289770;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 1;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 <= 299)
  {
    v4 = @"BannerClicked";
    switch(a3)
    {
      case 1:
        goto LABEL_109;
      case 2:
        v4 = @"iTunesLaunched";
        return v4;
      case 3:
      case 37:
      case 39:
      case 40:
      case 41:
        goto LABEL_108;
      case 4:
        v4 = @"ExternalLink";
        return v4;
      case 5:
        v4 = @"AdSheetOpened";
        return v4;
      case 6:
        v4 = @"AdSheetLoaded";
        return v4;
      case 7:
        v4 = @"AdSheetClosedWithXButton";
        return v4;
      case 8:
        v4 = @"AdSheetClosedWithHomeButton";
        return v4;
      case 9:
        v4 = @"AppPreventedAdAction";
        return v4;
      case 10:
        v4 = @"AppCancelledAdAction";
        return v4;
      case 11:
        v4 = @"AppPause";
        return v4;
      case 12:
        v4 = @"AppResume";
        return v4;
      case 13:
        v4 = @"AdRedirectOK";
        return v4;
      case 14:
        v4 = @"AdRedirectCancel";
        return v4;
      case 15:
        v4 = @"AdBuyOK";
        return v4;
      case 16:
        v4 = @"AdBuyCancel";
        return v4;
      case 17:
        v4 = @"WallpaperSetOK";
        return v4;
      case 18:
        v4 = @"WallpaperSetCancel";
        return v4;
      case 19:
        v4 = @"CalendarEventCreateOK";
        return v4;
      case 20:
        v4 = @"CalendarEventCreateCancel";
        return v4;
      case 21:
        v4 = @"EmailSendOK";
        return v4;
      case 22:
        v4 = @"EmailSendCancel";
        return v4;
      case 23:
        v4 = @"SMSSendOK";
        return v4;
      case 24:
        v4 = @"SMSSendCancel";
        return v4;
      case 25:
        v4 = @"AdSheetCallOK";
        return v4;
      case 26:
        v4 = @"AdSheetCallCancel";
        return v4;
      case 27:
        v4 = @"AdInterstitialDidAppear";
        return v4;
      case 28:
        v4 = @"AdInterstitialDidDisappear";
        return v4;
      case 29:
        v4 = @"AdInterstitialWasDismissed";
        return v4;
      case 30:
        v4 = @"AdInterstitialWasRemovedFromView";
        return v4;
      case 31:
        v4 = @"AdContactsEntryCreated";
        return v4;
      case 32:
        v4 = @"AdContactsEntryCanceled";
        return v4;
      case 33:
        v4 = @"AdIBooksPDFAdded";
        return v4;
      case 34:
        v4 = @"AdIBooksPDFCanceled";
        return v4;
      case 35:
        v4 = @"AdCameraPictureCaptured";
        return v4;
      case 36:
        v4 = @"AdCameraPictureCanceled";
        return v4;
      case 38:
        v4 = @"AdSheetClosedWithClientBackgrounded";
        return v4;
      case 42:
        v4 = @"AdSheetClosedWithAutoDismiss";
        return v4;
      default:
        if (a3 == 200)
        {
          v4 = @"RingtoneDownloadOK";
        }
        else
        {
          if (a3 != 201) {
            goto LABEL_108;
          }
          v4 = @"RingtoneDownloadCancel";
        }
        break;
    }
    return v4;
  }
  if (a3 > 700)
  {
    if (a3 <= 899)
    {
      switch(a3)
      {
        case 701:
          v4 = @"ReminderCreateCancel";
          break;
        case 800:
          v4 = @"PreRollSkip";
          break;
        case 801:
          v4 = @"CreativeUnloadedWithInvalidSize";
          break;
        default:
          goto LABEL_108;
      }
    }
    else
    {
      switch(a3)
      {
        case 900:
          v4 = @"PrivacyAdMarkWasTapped";
          break;
        case 901:
          v4 = @"PrivacyAdTransparencyDidAppear";
          break;
        case 902:
          v4 = @"PrivacyAdTransparencyDidRenderTransparency";
          break;
        case 903:
          v4 = @"PrivacyAdTransparencyDidDisappear";
          break;
        case 904:
          v4 = @"PrivacyAdTransparencyDidLinkOut";
          break;
        case 905:
          v4 = @"AdCreativeDidUnload";
          break;
        case 906:
          v4 = @"TapGestureTimerDidExpireBeforePrimaryActionWasInvoked";
          break;
        case 907:
          v4 = @"NavigationActionBlockedDueToAccidentalTap";
          break;
        case 908:
          v4 = @"CarouselFinished";
          break;
        case 909:
          v4 = @"TimeSpent";
          break;
        default:
          goto LABEL_108;
      }
    }
  }
  else if (a3 <= 499)
  {
    switch(a3)
    {
      case 400:
        v4 = @"VisibleContentsCaptureOK";
        break;
      case 401:
        v4 = @"VisibleContentsCaptureCancel";
        break;
      case 402:
        v4 = @"VisibleContentsSaveToPhotosOK";
        break;
      case 403:
        v4 = @"VisibleContentsSaveToPhotosCancel";
        break;
      default:
        if (a3 == 300)
        {
          v4 = @"InAdWebViewOpened";
        }
        else
        {
          if (a3 != 301) {
            goto LABEL_108;
          }
          v4 = @"InAdWebViewClosed";
        }
        break;
    }
  }
  else
  {
    if (a3 <= 599)
    {
      switch(a3)
      {
        case 500:
          v4 = @"SaveImageToPhotosOK";
          break;
        case 501:
          v4 = @"SaveImageToPhotosCancel";
          break;
        case 502:
          v4 = @"SaveVideoToPhotosOK";
          break;
        case 503:
          v4 = @"SaveVideoToPhotosCancel";
          break;
        default:
          goto LABEL_108;
      }
      return v4;
    }
    if (a3 <= 601)
    {
      if (a3 == 600)
      {
        v4 = @"AdSheetClosedByPrivilegedAd";
      }
      else
      {
        v4 = @"AdSheetClosedWithPrimaryURLFailure";
      }
      return v4;
    }
    if (a3 != 602)
    {
      if (a3 == 700)
      {
        v4 = @"ReminderCreateOK";
        return v4;
      }
LABEL_108:
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_109:
      return v4;
    }
    v4 = @"AdSheetClosedWithProductPageLoadFailure";
  }
  return v4;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BannerClicked"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"iTunesLaunched"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ExternalLink"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AdSheetOpened"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AdSheetLoaded"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithXButton"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithHomeButton"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AppPreventedAdAction"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AppCancelledAdAction"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AppPause"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AppResume"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AdRedirectOK"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AdRedirectCancel"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"AdBuyOK"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"AdBuyCancel"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"WallpaperSetOK"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"WallpaperSetCancel"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CalendarEventCreateOK"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CalendarEventCreateCancel"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"EmailSendOK"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"EmailSendCancel"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SMSSendOK"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SMSSendCancel"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AdSheetCallOK"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"AdSheetCallCancel"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"AdInterstitialDidAppear"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"AdInterstitialDidDisappear"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"AdInterstitialWasDismissed"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"AdInterstitialWasRemovedFromView"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"AdContactsEntryCreated"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"AdContactsEntryCanceled"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"AdIBooksPDFAdded"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"AdIBooksPDFCanceled"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"AdCameraPictureCaptured"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AdCameraPictureCanceled"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithClientBackgrounded"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithAutoDismiss"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RingtoneDownloadOK"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"RingtoneDownloadCancel"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"InAdWebViewOpened"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"InAdWebViewClosed"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"VisibleContentsCaptureOK"])
  {
    int v4 = 400;
  }
  else if ([v3 isEqualToString:@"VisibleContentsCaptureCancel"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"VisibleContentsSaveToPhotosOK"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"VisibleContentsSaveToPhotosCancel"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"SaveImageToPhotosOK"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"SaveImageToPhotosCancel"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"SaveVideoToPhotosOK"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"SaveVideoToPhotosCancel"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedByPrivilegedAd"])
  {
    int v4 = 600;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithPrimaryURLFailure"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"AdSheetClosedWithProductPageLoadFailure"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"ReminderCreateOK"])
  {
    int v4 = 700;
  }
  else if ([v3 isEqualToString:@"ReminderCreateCancel"])
  {
    int v4 = 701;
  }
  else if ([v3 isEqualToString:@"PreRollSkip"])
  {
    int v4 = 800;
  }
  else if ([v3 isEqualToString:@"CreativeUnloadedWithInvalidSize"])
  {
    int v4 = 801;
  }
  else if ([v3 isEqualToString:@"PrivacyAdMarkWasTapped"])
  {
    int v4 = 900;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidAppear"])
  {
    int v4 = 901;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidRenderTransparency"])
  {
    int v4 = 902;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidDisappear"])
  {
    int v4 = 903;
  }
  else if ([v3 isEqualToString:@"PrivacyAdTransparencyDidLinkOut"])
  {
    int v4 = 904;
  }
  else if ([v3 isEqualToString:@"AdCreativeDidUnload"])
  {
    int v4 = 905;
  }
  else if ([v3 isEqualToString:@"TapGestureTimerDidExpireBeforePrimaryActionWasInvoked"])
  {
    int v4 = 906;
  }
  else if ([v3 isEqualToString:@"NavigationActionBlockedDueToAccidentalTap"])
  {
    int v4 = 907;
  }
  else if ([v3 isEqualToString:@"CarouselFinished"])
  {
    int v4 = 908;
  }
  else if ([v3 isEqualToString:@"TimeSpent"])
  {
    int v4 = 909;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasClickLocation
{
  return self->_clickLocation != 0;
}

- (void)setActionableDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionableDuration = a3;
}

- (void)setHasActionableDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionableDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBannerCustomMetadata
{
  return self->_bannerCustomMetadata != 0;
}

- (void)setRequestCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requestCount = a3;
}

- (void)setHasRequestCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogSysEventRequest;
  char v3 = [(APPBLogSysEventRequest *)&v7 description];
  int v4 = [(APPBLogSysEventRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v6 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"metaData"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int eventType = self->_eventType;
    if (eventType <= 299)
    {
      v8 = @"BannerClicked";
      switch(eventType)
      {
        case 1:
          goto LABEL_90;
        case 2:
          v8 = @"iTunesLaunched";
          goto LABEL_90;
        case 3:
        case 37:
        case 39:
        case 40:
        case 41:
          goto LABEL_53;
        case 4:
          v8 = @"ExternalLink";
          goto LABEL_90;
        case 5:
          v8 = @"AdSheetOpened";
          goto LABEL_90;
        case 6:
          v8 = @"AdSheetLoaded";
          goto LABEL_90;
        case 7:
          v8 = @"AdSheetClosedWithXButton";
          goto LABEL_90;
        case 8:
          v8 = @"AdSheetClosedWithHomeButton";
          goto LABEL_90;
        case 9:
          v8 = @"AppPreventedAdAction";
          goto LABEL_90;
        case 10:
          v8 = @"AppCancelledAdAction";
          goto LABEL_90;
        case 11:
          v8 = @"AppPause";
          goto LABEL_90;
        case 12:
          v8 = @"AppResume";
          goto LABEL_90;
        case 13:
          v8 = @"AdRedirectOK";
          goto LABEL_90;
        case 14:
          v8 = @"AdRedirectCancel";
          goto LABEL_90;
        case 15:
          v8 = @"AdBuyOK";
          goto LABEL_90;
        case 16:
          v8 = @"AdBuyCancel";
          goto LABEL_90;
        case 17:
          v8 = @"WallpaperSetOK";
          goto LABEL_90;
        case 18:
          v8 = @"WallpaperSetCancel";
          goto LABEL_90;
        case 19:
          v8 = @"CalendarEventCreateOK";
          goto LABEL_90;
        case 20:
          v8 = @"CalendarEventCreateCancel";
          goto LABEL_90;
        case 21:
          v8 = @"EmailSendOK";
          goto LABEL_90;
        case 22:
          v8 = @"EmailSendCancel";
          goto LABEL_90;
        case 23:
          v8 = @"SMSSendOK";
          goto LABEL_90;
        case 24:
          v8 = @"SMSSendCancel";
          goto LABEL_90;
        case 25:
          v8 = @"AdSheetCallOK";
          goto LABEL_90;
        case 26:
          v8 = @"AdSheetCallCancel";
          goto LABEL_90;
        case 27:
          v8 = @"AdInterstitialDidAppear";
          goto LABEL_90;
        case 28:
          v8 = @"AdInterstitialDidDisappear";
          goto LABEL_90;
        case 29:
          v8 = @"AdInterstitialWasDismissed";
          goto LABEL_90;
        case 30:
          v8 = @"AdInterstitialWasRemovedFromView";
          goto LABEL_90;
        case 31:
          v8 = @"AdContactsEntryCreated";
          goto LABEL_90;
        case 32:
          v8 = @"AdContactsEntryCanceled";
          goto LABEL_90;
        case 33:
          v8 = @"AdIBooksPDFAdded";
          goto LABEL_90;
        case 34:
          v8 = @"AdIBooksPDFCanceled";
          goto LABEL_90;
        case 35:
          v8 = @"AdCameraPictureCaptured";
          goto LABEL_90;
        case 36:
          v8 = @"AdCameraPictureCanceled";
          goto LABEL_90;
        case 38:
          v8 = @"AdSheetClosedWithClientBackgrounded";
          goto LABEL_90;
        case 42:
          v8 = @"AdSheetClosedWithAutoDismiss";
          goto LABEL_90;
        default:
          if (eventType == 200)
          {
            v8 = @"RingtoneDownloadOK";
          }
          else
          {
            if (eventType != 201) {
              goto LABEL_53;
            }
            v8 = @"RingtoneDownloadCancel";
          }
          break;
      }
      goto LABEL_90;
    }
    if (eventType > 700)
    {
      if (eventType > 899)
      {
        switch(eventType)
        {
          case 900:
            v8 = @"PrivacyAdMarkWasTapped";
            break;
          case 901:
            v8 = @"PrivacyAdTransparencyDidAppear";
            break;
          case 902:
            v8 = @"PrivacyAdTransparencyDidRenderTransparency";
            break;
          case 903:
            v8 = @"PrivacyAdTransparencyDidDisappear";
            break;
          case 904:
            v8 = @"PrivacyAdTransparencyDidLinkOut";
            break;
          case 905:
            v8 = @"AdCreativeDidUnload";
            break;
          case 906:
            v8 = @"TapGestureTimerDidExpireBeforePrimaryActionWasInvoked";
            break;
          case 907:
            v8 = @"NavigationActionBlockedDueToAccidentalTap";
            break;
          case 908:
            v8 = @"CarouselFinished";
            break;
          case 909:
            v8 = @"TimeSpent";
            break;
          default:
            goto LABEL_53;
        }
        goto LABEL_90;
      }
      switch(eventType)
      {
        case 701:
          v8 = @"ReminderCreateCancel";
          goto LABEL_90;
        case 800:
          v8 = @"PreRollSkip";
          goto LABEL_90;
        case 801:
          v8 = @"CreativeUnloadedWithInvalidSize";
LABEL_90:
          [v3 setObject:v8 forKey:@"eventType"];

          goto LABEL_91;
      }
    }
    else
    {
      if (eventType <= 499)
      {
        switch(eventType)
        {
          case 400:
            v8 = @"VisibleContentsCaptureOK";
            break;
          case 401:
            v8 = @"VisibleContentsCaptureCancel";
            break;
          case 402:
            v8 = @"VisibleContentsSaveToPhotosOK";
            break;
          case 403:
            v8 = @"VisibleContentsSaveToPhotosCancel";
            break;
          default:
            if (eventType == 300)
            {
              v8 = @"InAdWebViewOpened";
            }
            else
            {
              if (eventType != 301) {
                goto LABEL_53;
              }
              v8 = @"InAdWebViewClosed";
            }
            break;
        }
        goto LABEL_90;
      }
      if (eventType <= 599)
      {
        switch(eventType)
        {
          case 500:
            v8 = @"SaveImageToPhotosOK";
            break;
          case 501:
            v8 = @"SaveImageToPhotosCancel";
            break;
          case 502:
            v8 = @"SaveVideoToPhotosOK";
            break;
          case 503:
            v8 = @"SaveVideoToPhotosCancel";
            break;
          default:
            goto LABEL_53;
        }
        goto LABEL_90;
      }
      if (eventType <= 601)
      {
        if (eventType == 600) {
          v8 = @"AdSheetClosedByPrivilegedAd";
        }
        else {
          v8 = @"AdSheetClosedWithPrimaryURLFailure";
        }
        goto LABEL_90;
      }
      if (eventType == 602)
      {
        v8 = @"AdSheetClosedWithProductPageLoadFailure";
        goto LABEL_90;
      }
      if (eventType == 700)
      {
        v8 = @"ReminderCreateOK";
        goto LABEL_90;
      }
    }
LABEL_53:
    v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_eventType];
    goto LABEL_90;
  }
LABEL_91:
  clickLocation = self->_clickLocation;
  if (clickLocation)
  {
    v10 = [(APPBClickLocation *)clickLocation dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"clickLocation"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_actionableDuration;
    v11 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v11 forKey:@"actionableDuration"];
  }
  bannerCustomMetadata = self->_bannerCustomMetadata;
  if (bannerCustomMetadata) {
    [v3 setObject:bannerCustomMetadata forKey:@"bannerCustomMetadata"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = +[NSNumber numberWithInt:self->_requestCount];
    [v3 setObject:v13 forKey:@"requestCount"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogSysEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metaData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_clickLocation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_bannerCustomMetadata)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metaData)
  {
    [v4 setMetaData:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_eventType;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  if (self->_clickLocation)
  {
    [v5 setClickLocation:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_actionableDuration);
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_bannerCustomMetadata)
  {
    [v5 setBannerCustomMetadata:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_requestCount;
    *((unsigned char *)v4 + 52) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_eventType;
    *((unsigned char *)v5 + 52) |= 2u;
  }
  id v8 = [(APPBClickLocation *)self->_clickLocation copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = LODWORD(self->_actionableDuration);
    *((unsigned char *)v5 + 52) |= 1u;
  }
  id v10 = [(NSString *)self->_bannerCustomMetadata copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_requestCount;
    *((unsigned char *)v5 + 52) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((void *)v4 + 5))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_24;
  }
  clickLocation = self->_clickLocation;
  if ((unint64_t)clickLocation | *((void *)v4 + 3))
  {
    if (!-[APPBClickLocation isEqual:](clickLocation, "isEqual:")) {
      goto LABEL_24;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_actionableDuration != *((float *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_24;
  }
  bannerCustomMetadata = self->_bannerCustomMetadata;
  if ((unint64_t)bannerCustomMetadata | *((void *)v4 + 2))
  {
    if (-[NSString isEqual:](bannerCustomMetadata, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_20;
    }
LABEL_24:
    BOOL v9 = 0;
    goto LABEL_25;
  }
LABEL_20:
  BOOL v9 = (*((unsigned char *)v4 + 52) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_requestCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_24;
    }
    BOOL v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBLogMetaData *)self->_metaData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(APPBClickLocation *)self->_clickLocation hash];
  if (*(unsigned char *)&self->_has)
  {
    float actionableDuration = self->_actionableDuration;
    float v8 = -actionableDuration;
    if (actionableDuration >= 0.0) {
      float v8 = self->_actionableDuration;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_bannerCustomMetadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_requestCount;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 5);
  id v9 = v4;
  if (metaData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBLogSysEventRequest setMetaData:](self, "setMetaData:");
  }
  id v4 = v9;
LABEL_7:
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_int eventType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  clickLocation = self->_clickLocation;
  uint64_t v8 = *((void *)v4 + 3);
  if (clickLocation)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[APPBClickLocation mergeFrom:](clickLocation, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[APPBLogSysEventRequest setClickLocation:](self, "setClickLocation:");
  }
  id v4 = v9;
LABEL_15:
  if (*((unsigned char *)v4 + 52))
  {
    self->_float actionableDuration = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[APPBLogSysEventRequest setBannerCustomMetadata:](self, "setBannerCustomMetadata:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    self->_requestCount = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }

  _objc_release_x1();
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (APPBClickLocation)clickLocation
{
  return self->_clickLocation;
}

- (void)setClickLocation:(id)a3
{
}

- (float)actionableDuration
{
  return self->_actionableDuration;
}

- (NSString)bannerCustomMetadata
{
  return self->_bannerCustomMetadata;
}

- (void)setBannerCustomMetadata:(id)a3
{
}

- (int)requestCount
{
  return self->_requestCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_clickLocation, 0);

  objc_storeStrong((id *)&self->_bannerCustomMetadata, 0);
}

@end