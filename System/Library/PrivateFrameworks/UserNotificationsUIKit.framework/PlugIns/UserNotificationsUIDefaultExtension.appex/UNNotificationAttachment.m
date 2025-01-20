@interface UNNotificationAttachment
- (__CFString)_nc_safeUTI;
@end

@implementation UNNotificationAttachment

- (__CFString)_nc_safeUTI
{
  v3 = [(UNNotificationAttachment *)self type];
  if (!v3)
  {
    v4 = [(UNNotificationAttachment *)self URL];
    v5 = [v4 pathExtension];

    if (v5)
    {
      CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v5, 0);
      v3 = (__CFString *)CFAutorelease(PreferredIdentifierForTag);
    }
    else
    {
      v3 = 0;
    }
  }
  if (v3) {
    return v3;
  }
  else {
    return (__CFString *)kUTTypeItem;
  }
}

@end