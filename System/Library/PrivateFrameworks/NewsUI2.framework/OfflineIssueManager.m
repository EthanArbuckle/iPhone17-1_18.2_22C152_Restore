@interface OfflineIssueManager
- (_TtC7NewsUI219OfflineIssueManager)init;
- (void)dealloc;
@end

@implementation OfflineIssueManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_backgroundAppRefreshChangeObserver);
  if (v4)
  {
    v5 = self;
    v6 = self;
    swift_unknownObjectRetain();
    id v7 = objc_msgSend(v5, sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  [(OfflineIssueManager *)&v9 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_offlineContentManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_storageLevelProvider);

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC7NewsUI219OfflineIssueManager)init
{
  result = (_TtC7NewsUI219OfflineIssueManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end