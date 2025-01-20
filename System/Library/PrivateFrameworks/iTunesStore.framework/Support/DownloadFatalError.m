@interface DownloadFatalError
- (BOOL)canCoalesceWithError:(id)a3;
- (id)copyUserNotification;
@end

@implementation DownloadFatalError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v4 = (uint64_t)[(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v4 <= 1) {
    CFStringRef v6 = @"DOWNLOAD_FAILED_TITLE_GENERIC";
  }
  else {
    CFStringRef v6 = @"DOWNLOAD_FAILED_TITLE_GENERIC_PLURAL";
  }
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1003B9B00 table:0]);
  if (self->super._downloadTitle)
  {
    if (v4 == 2)
    {
      id v8 = objc_alloc((Class)NSString);
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v10 = @"DOWNLOAD_FATAL_MESSAGE_ONE_%@";
    }
    else
    {
      uint64_t v7 = v4 - 1;
      if (v4 != 1)
      {
        id v8 = objc_alloc((Class)NSString);
        v11 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DOWNLOAD_FATAL_MESSAGE_PLURAL_%@_%ld" value:&stru_1003B9B00 table:0];
        downloadTitle = self->super._downloadTitle;
        uint64_t v17 = v7;
        goto LABEL_11;
      }
      id v8 = objc_alloc((Class)NSString);
      v9 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v10 = @"DOWNLOAD_FATAL_MESSAGE_%@";
    }
    v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1003B9B00 table:0];
    downloadTitle = self->super._downloadTitle;
LABEL_11:
    id v13 = objc_msgSend(v8, "initWithFormat:", v11, downloadTitle, v17);
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v13);
  }
  v14 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"DOWNLOAD_FAILED_DONE" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v14);
  CFDictionarySetValue(Mutable, SBUserNotificationDefaultButtonTag, +[NSNumber numberWithInt:1]);
  id v15 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v15;
}

@end