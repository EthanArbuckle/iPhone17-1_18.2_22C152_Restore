@interface JournalCoreDataSpotlightDelegate
- (id)attributeSetForObject:(id)a3;
- (id)domainIdentifier;
- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4;
@end

@implementation JournalCoreDataSpotlightDelegate

- (id)domainIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (id)attributeSetForObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1004943FC(v4);

  return v6;
}

- (id)initForStoreWithDescription:(id)a3 coordinator:(id)a4
{
  uint64_t v7 = OBJC_IVAR____TtC7Journal32JournalCoreDataSpotlightDelegate_indexTimeKeeper;
  type metadata accessor for IndexTimeKeeper();
  uint64_t v8 = swift_allocObject();
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  swift_defaultActor_initialize();
  *(void *)(v8 + 112) = 0;
  *(unsigned char *)(v8 + 120) = 1;
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)v8;

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for JournalCoreDataSpotlightDelegate();
  id v12 = [(JournalCoreDataSpotlightDelegate *)&v14 initForStoreWithDescription:v9 coordinator:v10];

  return v12;
}

- (void).cxx_destruct
{
}

@end