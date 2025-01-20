@interface CoreDataLibrary
- (PKSubscriptionController)subscriptionController;
- (_TtC11PodcastsKit15CoreDataLibrary)init;
- (void)fetchMatchesFor:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5;
- (void)setSubscriptionController:(id)a3;
@end

@implementation CoreDataLibrary

- (PKSubscriptionController)subscriptionController
{
  v2 = self;
  id v3 = sub_23F0AE93C();

  return (PKSubscriptionController *)v3;
}

- (void)setSubscriptionController:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PodcastsKit15CoreDataLibrary____lazy_storage___subscriptionController) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)fetchMatchesFor:(id)a3 limit:(int64_t)a4 resultsHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_23F0BF6A0();
  uint64_t v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_23F0AF598(v8, v10, a4, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC11PodcastsKit15CoreDataLibrary)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PodcastsKit15CoreDataLibrary____lazy_storage___subscriptionController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataLibrary();
  return [(CoreDataLibrary *)&v3 init];
}

- (void).cxx_destruct
{
}

@end