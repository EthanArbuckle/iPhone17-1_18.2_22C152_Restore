@interface DOCItemCollectionCellContent
- (BOOL)accessibilityIsFolder;
- (BOOL)accessibilityShouldDim;
- (_TtC5Files28DOCItemCollectionCellContent)init;
- (id)accessibilityItem;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCItemCollectionCellContent

- (void)dealloc
{
  v2 = self;
  sub_1000D6480();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionCellContent();
  [(DOCItemCollectionCellContent *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1000CBE0C((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v3, (uint64_t *)&unk_100705550);
  sub_1000958FC(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000973E0);
  sub_1000CBE0C((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_listItemLayoutTraits, (uint64_t)v4, (uint64_t *)&unk_10070AD40);
  sub_1000980C0(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000974E4);

  swift_unknownObjectRelease();
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_sortingDescriptor, (uint64_t *)&unk_1007086D0);

  sub_1000A7258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_thumbnailUpdateBlock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_thumbnailUpdateLock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_trailingAttachmentcolor));

  sub_1000CBE0C((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__titleWithTags, (uint64_t)v5, &qword_100705560);
  sub_10009A828(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10009A89C);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent__titleWithIconAndTags));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_delegate);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = a3;
  v9[4] = sub_10006671C;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000666D8;
  v9[3] = &unk_1006B8448;
  v7 = _Block_copy(v9);
  swift_unknownObjectRetain_n();
  v8 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (_TtC5Files28DOCItemCollectionCellContent)init
{
  return (_TtC5Files28DOCItemCollectionCellContent *)DOCItemCollectionCellContent.init()();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_100094E5C(&qword_100705B08, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  DOCItemCollectionCellContent.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000CBBA4((uint64_t)v18, (uint64_t *)&unk_100705D60);
}

- (id)accessibilityItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_node);
  swift_beginAccess();
  id v3 = *v2;
  if (*v2) {
    id v3 = [v3 fpfs_fpItem];
  }

  return v3;
}

- (BOOL)accessibilityIsFolder
{
  v2 = self;
  unsigned __int8 v3 = sub_100571038();

  return v3 & 1;
}

- (BOOL)accessibilityShouldDim
{
  return sub_1000A1B30() & 1;
}

@end