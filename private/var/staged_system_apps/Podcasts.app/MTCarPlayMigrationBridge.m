@interface MTCarPlayMigrationBridge
+ (MTCarPlayMigrationBridge)sharedInstance;
- (BOOL)isMigrating;
- (MTCarPlayMigrationBridge)init;
- (void)setIsMigrating:(BOOL)a3;
@end

@implementation MTCarPlayMigrationBridge

+ (MTCarPlayMigrationBridge)sharedInstance
{
  if (qword_1005F59D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10061A970;

  return (MTCarPlayMigrationBridge *)v2;
}

- (BOOL)isMigrating
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  return v5;
}

- (void)setIsMigrating:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  static Published.subscript.setter();
}

- (MTCarPlayMigrationBridge)init
{
  uint64_t v3 = sub_100054B78(&qword_1005F6E18);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___MTCarPlayMigrationBridge__isMigrating;
  char v13 = 0;
  v8 = self;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);

  v9 = (objc_class *)type metadata accessor for CarPlayMigrationBridge();
  v12.receiver = v8;
  v12.super_class = v9;
  return [(MTCarPlayMigrationBridge *)&v12 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___MTCarPlayMigrationBridge__isMigrating;
  uint64_t v3 = sub_100054B78(&qword_1005F6E18);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end