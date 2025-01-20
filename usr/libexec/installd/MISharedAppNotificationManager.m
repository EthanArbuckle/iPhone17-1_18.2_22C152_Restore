@interface MISharedAppNotificationManager
+ (id)instanceForCurrentUser;
- (BOOL)clearPendingUpdates:(id)a3 error:(id *)a4;
- (BOOL)markAppAsUpdatedForOtherUsers:(id)a3 error:(id *)a4;
- (MISharedAppNotificationManager)init;
- (id)updatedAppsWithError:(id *)a3;
@end

@implementation MISharedAppNotificationManager

+ (id)instanceForCurrentUser
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000233A4;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A5FD8 != -1) {
    dispatch_once(&qword_1000A5FD8, block);
  }
  v2 = (void *)qword_1000A5FD0;

  return v2;
}

- (MISharedAppNotificationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)MISharedAppNotificationManager;
  return [(MISharedAppNotificationManager *)&v3 init];
}

- (BOOL)markAppAsUpdatedForOtherUsers:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]", 42, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MISharedAppNotificationManager markAppAsUpdatedForOtherUsers:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (id)updatedAppsWithError:(id *)a3
{
  v5 = sub_100014A08((uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]", 51, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v3, (uint64_t)"-[MISharedAppNotificationManager updatedAppsWithError:]");
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

- (BOOL)clearPendingUpdates:(id)a3 error:(id *)a4
{
  v6 = sub_100014A08((uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]", 60, MIInstallerErrorDomain, 4, 0, 0, @"%s is not yet implemented", v4, (uint64_t)"-[MISharedAppNotificationManager clearPendingUpdates:error:]");
  v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

@end