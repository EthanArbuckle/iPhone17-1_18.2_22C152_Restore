@interface DOCInteractionManager
+ (id)sharedManagerFor:(id)a3;
+ (void)clearSharedControllerFor:(id)a3;
+ (void)setSharedManagerWith:(id)a3 to:(id)a4;
- (FPItem)lastOpenedItem;
- (FPItem)lastSelectedItem;
- (_TtC5Files21DOCInteractionManager)init;
- (void)setLastOpenedItem:(id)a3;
- (void)setLastSelectedItem:(id)a3;
@end

@implementation DOCInteractionManager

- (_TtC5Files21DOCInteractionManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files21DOCInteractionManager_lastOpenedItem) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCInteractionManager();
  return [(DOCInteractionManager *)&v3 init];
}

+ (id)sharedManagerFor:(id)a3
{
  id v4 = a3;
  id v5 = _s5Files21DOCInteractionManagerC06sharedC03forACSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  if (a3)
  {
    uint64_t v3 = qword_100704E40;
    id v4 = a3;
    if (v3 != -1) {
      swift_once();
    }
    [qword_100707940 removeObjectForKey:];
  }
  else
  {
    id v4 = (id)static DOCLog.Source.getter();
    static os_log_type_t.debug.getter();
    os_log(_:dso:log:type:_:)();
  }
}

+ (void)setSharedManagerWith:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_10014066C(v5, (uint64_t)v6);
}

- (FPItem)lastOpenedItem
{
  return (FPItem *)sub_10013FE10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastOpenedItem);
}

- (void)setLastOpenedItem:(id)a3
{
}

- (FPItem)lastSelectedItem
{
  return (FPItem *)sub_10013FE10((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem);
}

- (void)setLastSelectedItem:(id)a3
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files21DOCInteractionManager_lastSelectedItem);
}

@end