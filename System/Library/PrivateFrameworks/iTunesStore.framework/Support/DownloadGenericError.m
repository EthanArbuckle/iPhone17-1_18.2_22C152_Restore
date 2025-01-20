@interface DownloadGenericError
- (BOOL)_isInstallError:(id)a3;
- (BOOL)canCoalesceWithError:(id)a3;
- (DownloadGenericError)initWithError:(id)a3;
- (NSError)error;
- (id)_notificationBody;
- (id)_notificationTitle;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)performActionForResponseFlags:(unint64_t)a3;
@end

@implementation DownloadGenericError

- (DownloadGenericError)initWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadGenericError;
  v4 = [(DownloadGenericError *)&v6 init];
  if (v4) {
    v4->_error = (NSError *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadGenericError;
  [(DownloadError *)&v3 dealloc];
}

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = [(DownloadError *)self downloadKind];
    if (v7 == [a3 downloadKind]
      || (unsigned int v6 = -[NSString isEqual:](-[DownloadError downloadKind](self, "downloadKind"), "isEqual:", [a3 downloadKind])) != 0)
    {
      unsigned __int8 v8 = [(DownloadGenericError *)self _isInstallError:[(DownloadGenericError *)self error]];
      LOBYTE(v6) = v8 ^ -[DownloadGenericError _isInstallError:](self, "_isInstallError:", [a3 error]) ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v4 = [(DownloadGenericError *)self _notificationTitle];
  if ([v4 length]) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v4);
  }
  id v5 = [(DownloadGenericError *)self _notificationBody];
  if ([v5 length]) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v5);
  }
  unsigned int v6 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DOWNLOAD_FAILED_DONE" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v6);
  v7 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DOWNLOAD_FAILED_RETRY" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v7);
  CFDictionarySetValue(Mutable, SBUserNotificationDefaultButtonTag, +[NSNumber numberWithInt:1]);
  id v8 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v8;
}

- (void)performActionForResponseFlags:(unint64_t)a3
{
  if (a3 == 1)
  {
    if (MGGetSInt32Answer() != 4) {
      return;
    }
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v22 = 138412290;
      uint64_t v23 = objc_opt_class();
      LODWORD(v19) = 12;
      v18 = &v22;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v22, v19);
        free(v16);
        v18 = (int *)v17;
        SSFileLog();
      }
    }
    id v10 = +[DownloadsDatabase downloadsDatabase];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001039AC;
    v20[3] = &unk_1003A5F80;
    v20[4] = self;
    v11 = v20;
  }
  else
  {
    if (a3) {
      return;
    }
    id v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4) {
      id v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v22 = 138412290;
      uint64_t v23 = objc_opt_class();
      LODWORD(v19) = 12;
      v18 = &v22;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        id v8 = (void *)v7;
        v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v22, v19);
        free(v8);
        v18 = (int *)v9;
        SSFileLog();
      }
    }
    id v10 = +[DownloadsDatabase downloadsDatabase];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010399C;
    v21[3] = &unk_1003A5F80;
    v21[4] = self;
    v11 = v21;
  }
  [v10 modifyUsingTransactionBlock:v11];
}

- (BOOL)_isInstallError:(id)a3
{
  id v3 = [a3 domain];
  if ([v3 isEqualToString:MIInstallerErrorDomain]) {
    return 1;
  }

  return ISErrorIsEqual();
}

- (id)_notificationBody
{
  if (self->super._downloadTitle)
  {
    unsigned int v3 = [(DownloadGenericError *)self _isInstallError:self->_error];
    id v4 = (char *)[(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
    if (v3)
    {
      if (v4 == (char *)2)
      {
        id v6 = objc_alloc((Class)NSString);
        uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
        CFStringRef v8 = @"INSTALL_FAILED_BODY_FORMAT_ONE_%@";
        goto LABEL_15;
      }
      unsigned int v5 = v4 - 1;
      if (v4 == (char *)1)
      {
        id v6 = objc_alloc((Class)NSString);
        uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
        CFStringRef v8 = @"INSTALL_FAILED_BODY_FORMAT_%@";
LABEL_15:
        v16 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1003B9B00 table:0];
        downloadTitle = self->super._downloadTitle;
LABEL_18:
        id v10 = (NSString *)objc_msgSend(v6, "initWithFormat:", v16, downloadTitle, v19);
        goto LABEL_19;
      }
      id v6 = objc_alloc((Class)NSString);
      int v14 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v15 = @"INSTALL_FAILED_BODY_FORMAT_PLURAL_%@_%ld";
    }
    else
    {
      if (v4 == (char *)2)
      {
        id v6 = objc_alloc((Class)NSString);
        uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
        CFStringRef v8 = @"DOWNLOAD_FAILED_BODY_FORMAT_ONE_%@";
        goto LABEL_15;
      }
      unsigned int v5 = v4 - 1;
      if (v4 == (char *)1)
      {
        id v6 = objc_alloc((Class)NSString);
        uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
        CFStringRef v8 = @"DOWNLOAD_FAILED_BODY_FORMAT_%@";
        goto LABEL_15;
      }
      id v6 = objc_alloc((Class)NSString);
      int v14 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v15 = @"DOWNLOAD_FAILED_BODY_FORMAT_PLURAL_%@_%ld";
    }
    v16 = [(NSBundle *)v14 localizedStringForKey:v15 value:&stru_1003B9B00 table:0];
    downloadTitle = self->super._downloadTitle;
    uint64_t v19 = v5;
    goto LABEL_18;
  }
  id v9 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  if (v9 != (id)1)
  {
    id v11 = v9;
    id v12 = objc_alloc_init((Class)NSNumberFormatter);
    [v12 setNumberStyle:1];
    unsigned int v13 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:-[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"DOWNLOAD_FAILED_BODY_GENERIC_PLURAL_%@", &stru_1003B9B00, 0), objc_msgSend(v12, "stringFromNumber:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11))];

    goto LABEL_20;
  }
  id v10 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DOWNLOAD_FAILED_BODY_GENERIC" value:&stru_1003B9B00 table:0];
LABEL_19:
  unsigned int v13 = v10;
LABEL_20:

  return v13;
}

- (id)_notificationTitle
{
  id v3 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindAudiobook])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_AUDIOBOOK";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_AUDIOBOOK_PLURAL";
    goto LABEL_8;
  }
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindMovie])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_MOVIE";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_MOVIE_PLURAL";
    goto LABEL_8;
  }
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindMusic]
    || [(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindCoachedAudio])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_SONG";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_SONG_PLURAL";
    goto LABEL_8;
  }
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindMusicVideo])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_MUSIC_VIDEO";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_MUSIC_VIDEO_PLURAL";
    goto LABEL_8;
  }
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindPodcast]) {
    goto LABEL_17;
  }
  if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindRingtone])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_RINGTONE";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_RINGTONE_PLURAL";
  }
  else if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindSoftwareApplication])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_APPLICATION";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_APPLICATION_PLURAL";
  }
  else if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindTelevisionEpisode])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_TV";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_TV_PLURAL";
  }
  else if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindTone])
  {
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_TONE";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_TONE_PLURAL";
  }
  else
  {
    if ([(NSString *)self->super._downloadKind isEqualToString:SSDownloadKindVideoPodcast])
    {
LABEL_17:
      CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_PODCAST";
      CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_PODCAST_PLURAL";
      goto LABEL_8;
    }
    CFStringRef v4 = @"DOWNLOAD_FAILED_TITLE_GENERIC";
    CFStringRef v5 = @"DOWNLOAD_FAILED_TITLE_GENERIC_PLURAL";
  }
LABEL_8:
  if ((unint64_t)v3 <= 1) {
    CFStringRef v6 = v4;
  }
  else {
    CFStringRef v6 = v5;
  }
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];

  return [(NSBundle *)v7 localizedStringForKey:v6 value:&stru_1003B9B00 table:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DownloadGenericError;
  CFStringRef v5 = -[DownloadError copyWithZone:](&v7, "copyWithZone:");
  v5[5] = [(NSError *)self->_error copyWithZone:a3];
  return v5;
}

- (NSError)error
{
  return self->_error;
}

@end