@interface JournalSpotlightManager
- (_TtC7Journal23JournalSpotlightManager)init;
@end

@implementation JournalSpotlightManager

- (_TtC7Journal23JournalSpotlightManager)init
{
  swift_defaultActor_initialize();
  *(void *)self->searchQuery = 0;
  uint64_t v3 = qword_1007F6D38;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)self->context = [*(id *)(*(void *)(qword_10083D2F8 + 16)+ OBJC_IVAR____TtC7Journal13CoreDataStack_container) newBackgroundContext];
  swift_release();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JournalSpotlightManager();
  return [(JournalSpotlightManager *)&v5 init];
}

@end