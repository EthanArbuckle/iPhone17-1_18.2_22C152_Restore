@interface WidgetReloadingObserver
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)databaseResultDidChange:(id)a3;
- (void)reload;
@end

@implementation WidgetReloadingObserver

- (void)reload
{
  swift_retain();
  sub_1C7DD6EE0();
  swift_release();
}

- (void)databaseResultDidChange:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1C7DD709C();

  swift_release();
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  sub_1C7DBB0E0();
  sub_1C7DBFD98();
  uint64_t v7 = sub_1C7E99610();
  uint64_t v8 = sub_1C7E99610();
  uint64_t v9 = sub_1C7E99610();
  id v10 = a3;
  uint64_t v11 = swift_retain();
  sub_1C7DD70F8(v11, v7, v8, v9);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end