@interface DOCItemCollectionCandidateSource
- (_TtC5Files32DOCItemCollectionCandidateSource)init;
- (void)dealloc;
@end

@implementation DOCItemCollectionCandidateSource

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_nodeCollection);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    sub_10019E3AC();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionCandidateSource();
  [(DOCItemCollectionCandidateSource *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1000A4D20((uint64_t)self + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_itemCollectionConfiguration);

  sub_1000A7258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_updateHandler));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_requestID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC5Files32DOCItemCollectionCandidateSource_sortingDescriptor;
  uint64_t v6 = type metadata accessor for DOCItemSortDescriptor();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC5Files32DOCItemCollectionCandidateSource)init
{
  result = (_TtC5Files32DOCItemCollectionCandidateSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end