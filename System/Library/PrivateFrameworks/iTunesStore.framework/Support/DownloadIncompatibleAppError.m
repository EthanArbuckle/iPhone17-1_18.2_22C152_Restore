@interface DownloadIncompatibleAppError
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation DownloadIncompatibleAppError

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v3 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"OK" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v3);
  id v4 = [(id)ISDeviceIncompatibleAppErrorWithAppTitle() localizedFailureReason];
  if (v4) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v4);
  }
  id v5 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DownloadIncompatibleAppError;
  return [(DownloadError *)&v4 copyWithZone:a3];
}

@end