@interface DownloadDiskSpaceError
- (BOOL)canCoalesceWithError:(id)a3;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (void)performActionForResponseFlags:(unint64_t)a3;
@end

@implementation DownloadDiskSpaceError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_TITLE" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v4);
  v5 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"OK" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v5);
  v6 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_SETTINGS" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v6);
  CFDictionarySetValue(Mutable, SBUserNotificationDefaultButtonTag, +[NSNumber numberWithInt:1]);
  v7 = (char *)[(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  if ([(NSString *)self->super._downloadTitle length])
  {
    if (v7 == (char *)2)
    {
      id v9 = objc_alloc((Class)NSString);
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v11 = @"NOT_ENOUGH_SPACE_SPECIFIC_PLUS_ONE_%@";
    }
    else
    {
      v8 = v7 - 1;
      if (v7 != (char *)1)
      {
        id v9 = objc_alloc((Class)NSString);
        v14 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"NOT_ENOUGH_SPACE_SPECIFIC_PLURAL_%@_%ld" value:&stru_1003B9B00 table:0];
        downloadTitle = self->super._downloadTitle;
        v19 = v8;
        goto LABEL_10;
      }
      id v9 = objc_alloc((Class)NSString);
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v11 = @"NOT_ENOUGH_SPACE_SPECIFIC_%@";
    }
    v14 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1003B9B00 table:0];
    downloadTitle = self->super._downloadTitle;
LABEL_10:
    id v16 = objc_msgSend(v9, "initWithFormat:", v14, downloadTitle, v19);
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v16);

    goto LABEL_13;
  }
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v7 == (char *)1) {
    CFStringRef v13 = @"NOT_ENOUGH_SPACE_SINGULAR";
  }
  else {
    CFStringRef v13 = @"NOT_ENOUGH_SPACE_PLURAL";
  }
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, [(NSBundle *)v12 localizedStringForKey:v13 value:&stru_1003B9B00 table:0]);
LABEL_13:
  id v17 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v17;
}

- (void)performActionForResponseFlags:(unint64_t)a3
{
  if (!a3)
  {
    id v5 = objc_msgSend(objc_alloc((Class)ISOpenURLRequest), "initWithURL:", +[NSURL URLWithString:](NSURL, "URLWithString:", @"prefs:root=General&path=USAGE"));
    [v5 setITunesStoreURL:0];
    id v4 = [objc_alloc((Class)ISOpenURLOperation) initWithOpenURLRequest:v5];
    objc_msgSend(+[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"), "addOperation:", v4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadDiskSpaceError;
  return [(DownloadError *)&v4 copyWithZone:a3];
}

@end