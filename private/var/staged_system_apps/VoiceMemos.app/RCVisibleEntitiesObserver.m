@interface RCVisibleEntitiesObserver
- (_TtC10VoiceMemos25RCVisibleEntitiesObserver)init;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
@end

@implementation RCVisibleEntitiesObserver

- (_TtC10VoiceMemos25RCVisibleEntitiesObserver)init
{
  result = (_TtC10VoiceMemos25RCVisibleEntitiesObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver____lazy_storage___recordingsFRC));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10VoiceMemos25RCVisibleEntitiesObserver____lazy_storage___userFoldersFRC);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  id v13 = a5;
  id v14 = a7;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v15 = sub_100028654(&qword_100267348);
  uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 64);
  __chkstk_darwin(v15 - 8);
  v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v13)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v18 = type metadata accessor for IndexPath();
    uint64_t v19 = (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(&v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)], 0, 1, v18);
  }
  else
  {
    uint64_t v20 = type metadata accessor for IndexPath();
    uint64_t v19 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(&v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v20);
  }
  __chkstk_darwin(v19);
  v21 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v14)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = type metadata accessor for IndexPath();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v21, 1, 1, v23);
  }
  sub_100102D6C(v11, (uint64_t)v24, (uint64_t)v17, a6, (uint64_t)v21);

  sub_1001031B4((uint64_t)v21);
  sub_1001031B4((uint64_t)v17);
  sub_10002F48C((uint64_t)v24);
}

@end