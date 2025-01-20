@interface FMAccessoryDiscoveryFoundMultipleCard
- (_TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard)initWithContentView:(id)a3;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation FMAccessoryDiscoveryFoundMultipleCard

- (_TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC6FindMy37FMAccessoryDiscoveryFoundMultipleCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_unknownObjectWeakDestroy();
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005D034(&qword_1006AF770);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  v14 = self;
  sub_10034E910((uint64_t)v9, (uint64_t)v12);

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v15(v12, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_10034EE44();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end