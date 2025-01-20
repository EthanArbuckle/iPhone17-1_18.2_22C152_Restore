@interface DownloadNetworkConstraintError
- (BOOL)canCoalesceWithError:(id)a3;
- (BOOL)canDownloadInITunes;
- (BOOL)isValidError;
- (id)_genericStringWithLocalizedKeyBase:(id)a3;
- (id)_specificStringWithLocalizedKeyBase:(id)a3;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)constrainedSizeLimit;
- (void)setCanDownloadInITunes:(BOOL)a3;
- (void)setConstrainedSizeLimit:(int64_t)a3;
@end

@implementation DownloadNetworkConstraintError

- (BOOL)canCoalesceWithError:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  id v6 = [(DownloadNetworkConstraintError *)self constrainedSizeLimit];
  if (v6 != [a3 constrainedSizeLimit]) {
    return 0;
  }
  unsigned int v7 = [(DownloadNetworkConstraintError *)self canDownloadInITunes];
  if (v7 != [a3 canDownloadInITunes]) {
    return 0;
  }
  v9 = [(DownloadError *)self downloadKind];
  id v10 = [a3 downloadKind];
  if ((SSDownloadKindIsSoftwareKind() & 1) == 0 && !SSDownloadKindIsSoftwareKind()) {
    return 1;
  }

  return [(NSString *)v9 isEqualToString:v10];
}

- (id)_genericStringWithLocalizedKeyBase:(id)a3
{
  if ([(NSMutableOrderedSet *)self->super._downloadIdentifiers count] != (id)1) {
    a3 = [a3 stringByAppendingString:@"_PLURAL"];
  }
  v4 = +[NSBundle bundleForClass:objc_opt_class()];

  return [(NSBundle *)v4 localizedStringForKey:a3 value:&stru_1003B9B00 table:0];
}

- (id)_specificStringWithLocalizedKeyBase:(id)a3
{
  id v5 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  if (v5 == (id)2)
  {
    CFStringRef v6 = @"_PLUS_ONE_%@";
    return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", [a3 stringByAppendingString:v6], &stru_1003B9B00, 0), @"%@", 0, self->super._downloadTitle, v8);
  }
  if (v5 == (id)1)
  {
    CFStringRef v6 = @"_%@";
    return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", [a3 stringByAppendingString:v6], &stru_1003B9B00, 0), @"%@", 0, self->super._downloadTitle, v8);
  }
  return +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", [a3 stringByAppendingString:@"_PLURAL_%@_%d"], &stru_1003B9B00, 0), @"%@%d", 0, self->super._downloadTitle, (v5 - 1));
}

- (id)copyUserNotification
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"OK" value:&stru_1003B9B00 table:0];
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v4);
  unsigned int v5 = [(DownloadNetworkConstraintError *)self canDownloadInITunes];
  unsigned int v6 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "supportsDeviceCapability:", 0);
  [(DownloadError *)self downloadKind];
  int IsSoftwareKind = SSDownloadKindIsSoftwareKind();
  NSUInteger v8 = [(NSString *)self->super._downloadTitle length];
  int v9 = v6 & v5;
  if (v8)
  {
    if ((v6 | v5))
    {
      if (v9) {
        CFStringRef v10 = @"TOO_BIG_FOR_NETWORK_SPECIFIC";
      }
      else {
        CFStringRef v10 = @"TOO_BIG_FOR_NETWORK_SPECIFIC_NO_ITUNES";
      }
      if (v6) {
        CFStringRef v11 = v10;
      }
      else {
        CFStringRef v11 = @"TOO_BIG_FOR_NETWORK_SPECIFIC_NO_WIFI";
      }
      v12 = [(DownloadNetworkConstraintError *)self _specificStringWithLocalizedKeyBase:v11];
    }
    else
    {
      v12 = 0;
    }
    id v15 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
    if (!IsSoftwareKind)
    {
LABEL_37:
      v18 = +[NSBundle bundleForClass:objc_opt_class()];
      if (v15 == (id)1) {
        CFStringRef v19 = @"ITEM_TOO_BIG_FOR_NETWORK_TITLE";
      }
      else {
        CFStringRef v19 = @"ITEM_TOO_BIG_FOR_NETWORK_TITLE_PLURAL";
      }
      goto LABEL_40;
    }
  }
  else
  {
    if (!IsSoftwareKind)
    {
      if ((v6 | v5))
      {
        if (v9) {
          CFStringRef v16 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY";
        }
        else {
          CFStringRef v16 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY_NO_ITUNES";
        }
        if (v6) {
          CFStringRef v17 = v16;
        }
        else {
          CFStringRef v17 = @"ITEM_TOO_BIG_FOR_NETWORK_BODY_NO_WIFI";
        }
        v12 = [(DownloadNetworkConstraintError *)self _genericStringWithLocalizedKeyBase:v17];
      }
      else
      {
        v12 = 0;
      }
      id v15 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
      goto LABEL_37;
    }
    if ((v6 | v5))
    {
      if (v9) {
        CFStringRef v13 = @"TOO_BIG_FOR_NETWORK_BODY";
      }
      else {
        CFStringRef v13 = @"TOO_BIG_FOR_NETWORK_BODY_NO_ITUNES";
      }
      if (v6) {
        CFStringRef v14 = v13;
      }
      else {
        CFStringRef v14 = @"TOO_BIG_FOR_NETWORK_BODY_NO_WIFI";
      }
      v12 = [(DownloadNetworkConstraintError *)self _genericStringWithLocalizedKeyBase:v14];
    }
    else
    {
      v12 = 0;
    }
    id v15 = [(NSMutableOrderedSet *)self->super._downloadIdentifiers count];
  }
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v15 == (id)1) {
    CFStringRef v19 = @"TOO_BIG_FOR_NETWORK_TITLE";
  }
  else {
    CFStringRef v19 = @"TOO_BIG_FOR_NETWORK_TITLE_PLURAL";
  }
LABEL_40:
  v20 = [(NSBundle *)v18 localizedStringForKey:v19 value:&stru_1003B9B00 table:0];
  if ([(DownloadNetworkConstraintError *)self constrainedSizeLimit] < 2)
  {
    v21 = 0;
    if (!v12) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  [(DownloadNetworkConstraintError *)self constrainedSizeLimit];
  v21 = v12;
  v12 = +[NSString stringWithValidatedFormat:v20, @"%@", 0, CPFSSizeStringsWithStyle() validFormatSpecifiers error];
  if (v12) {
LABEL_44:
  }
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v12);
LABEL_45:
  if (v21) {
    CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v21);
  }
  id v22 = [objc_alloc((Class)ISUserNotification) initWithDictionary:Mutable options:3];
  CFRelease(Mutable);
  return v22;
}

- (BOOL)isValidError
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DownloadNetworkConstraintError;
  id result = [(DownloadError *)&v5 copyWithZone:a3];
  *((unsigned char *)result + 40) = self->_canDownloadInITunes;
  *((void *)result + 6) = self->_sizeLimit;
  return result;
}

- (BOOL)canDownloadInITunes
{
  return self->_canDownloadInITunes;
}

- (void)setCanDownloadInITunes:(BOOL)a3
{
  self->_canDownloadInITunes = a3;
}

- (int64_t)constrainedSizeLimit
{
  return self->_sizeLimit;
}

- (void)setConstrainedSizeLimit:(int64_t)a3
{
  self->_sizeLimit = a3;
}

@end