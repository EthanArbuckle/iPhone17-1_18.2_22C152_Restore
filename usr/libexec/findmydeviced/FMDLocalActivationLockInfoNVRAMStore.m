@interface FMDLocalActivationLockInfoNVRAMStore
- (id)_statusFromStringValue:(id)a3;
- (id)retrieveActivationLockStatus;
- (id)retrieveMaskedAppleID;
- (id)retrieveOfflineFindingInfo;
- (id)retrieveOfflineFindingStatus;
- (void)clearMaskedAppleID;
- (void)clearOfflineFindingInfo;
- (void)updateActivationLockStatus:(id)a3;
- (void)updateMaskedAppleID:(id)a3;
- (void)updateOfflineFindingInfo:(id)a3;
- (void)updateOfflineFindingStatus:(id)a3;
@end

@implementation FMDLocalActivationLockInfoNVRAMStore

- (void)updateMaskedAppleID:(id)a3
{
  id v3 = a3;
  id v4 = +[FMDNVRAMUtil sharedInstance];
  [v4 setStringPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked" value:v3];
}

- (id)retrieveMaskedAppleID
{
  v2 = +[FMDNVRAMUtil sharedInstance];
  id v3 = [v2 stringValueForKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked"];

  if (v3 && ![v3 length]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (void)clearMaskedAppleID
{
  id v2 = +[FMDNVRAMUtil sharedInstance];
  [v2 clearPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-account-masked"];
}

- (void)updateActivationLockStatus:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  v5 = v4;
  id v6 = +[FMDNVRAMUtil sharedInstance];
  [v6 setStringPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-activation-locked" value:v5];
}

- (id)retrieveActivationLockStatus
{
  unsigned int v3 = +[FMDNVRAMUtil sharedInstance];
  id v4 = [v3 stringValueForKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-activation-locked"];

  v5 = [(FMDLocalActivationLockInfoNVRAMStore *)self _statusFromStringValue:v4];

  return v5;
}

- (void)updateOfflineFindingStatus:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  v5 = v4;
  id v6 = +[FMDNVRAMUtil sharedInstance];
  [v6 setStringPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spstatus" value:v5];
}

- (id)retrieveOfflineFindingStatus
{
  unsigned int v3 = +[FMDNVRAMUtil sharedInstance];
  id v4 = [v3 stringValueForKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spstatus"];

  v5 = [(FMDLocalActivationLockInfoNVRAMStore *)self _statusFromStringValue:v4];

  return v5;
}

- (void)updateOfflineFindingInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[FMDNVRAMUtil sharedInstance];
  [v4 setDataPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys" value:v3];
}

- (id)retrieveOfflineFindingInfo
{
  id v2 = +[FMDNVRAMUtil sharedInstance];
  id v3 = [v2 dataValueForKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys"];

  return v3;
}

- (void)clearOfflineFindingInfo
{
  id v2 = +[FMDNVRAMUtil sharedInstance];
  [v2 clearPropertyWithKey:@"40A0DDD2-77F8-4392-B4A3-1E7304206516:fm-spkeys"];
}

- (id)_statusFromStringValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "status Key not found in nvram", v8, 2u);
    }
    goto LABEL_10;
  }
  if (([v3 isEqualToString:@"YES"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"NO"])
    {
      v5 = &__kCFBooleanFalse;
      goto LABEL_11;
    }
    id v6 = sub_100004238();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10023C624((uint64_t)v4, v6);
    }
LABEL_10:

    v5 = 0;
    goto LABEL_11;
  }
  v5 = &__kCFBooleanTrue;
LABEL_11:

  return v5;
}

@end