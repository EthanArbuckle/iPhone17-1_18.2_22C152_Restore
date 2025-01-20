@interface MBDryRestoreManager
+ (id)createManager;
- (_TtC7backupd19MBDryRestoreManager)init;
- (void)interruptWithCause:(int64_t)a3;
@end

@implementation MBDryRestoreManager

+ (id)createManager
{
  if (MBIsInternalInstall()) {
    id v2 = [objc_allocWithZone((Class)swift_getObjCClassMetadata()) init];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (_TtC7backupd19MBDryRestoreManager)init
{
  return (_TtC7backupd19MBDryRestoreManager *)sub_100055ACC();
}

- (void)interruptWithCause:(int64_t)a3
{
  v4 = self;
  sub_100055258(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end