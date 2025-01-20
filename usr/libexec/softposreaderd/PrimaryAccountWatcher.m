@interface PrimaryAccountWatcher
- (_TtC9SPREngine21PrimaryAccountWatcher)init;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
@end

@implementation PrimaryAccountWatcher

- (_TtC9SPREngine21PrimaryAccountWatcher)init
{
  sub_10016CB18();
  return result;
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasAdded(_:)((ACAccount)v4);
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasRemoved(_:)((ACAccount)v4);
}

- (void)accountWasModified:(id)a3
{
  id v4 = a3;
  v5 = self;
  PrimaryAccountWatcher.accountWasModified(_:)((ACAccount)v4);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SPREngine21PrimaryAccountWatcher_changeHandler);

  sub_100057838(v3);
}

@end