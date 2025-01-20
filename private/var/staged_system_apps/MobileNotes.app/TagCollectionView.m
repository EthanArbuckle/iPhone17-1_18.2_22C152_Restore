@interface TagCollectionView
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)isEditing;
- (ICTagSelection)tagSelection;
- (_TtC11MobileNotes17TagCollectionView)initWithCoder:(id)a3;
- (_TtC11MobileNotes17TagCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)dataDidChange;
- (id)selectionDidChange;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)dataSourceDidUpdate:(id)a3;
- (void)layoutSubviews;
- (void)selectTagSelection:(id)a3 animated:(BOOL)a4;
- (void)setDataDidChange:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setSelectionDidChange:(id)a3;
- (void)setTagSelection:(id)a3;
@end

@implementation TagCollectionView

- (id)selectionDidChange
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1002B6294;
    aBlock[3] = &unk_100638E30;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSelectionDidChange:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001A36CC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002E70C(v7);
}

- (id)dataDidChange
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange))
  {
    uint64_t v2 = *(void *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100262E2C;
    v5[3] = &unk_100638DE0;
    uint64_t v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)setDataDidChange:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1003A1704;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange);
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10002E70C(v8);
}

- (BOOL)isEditing
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TagCollectionView *)&v3 isEditing];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  char v7 = [(TagCollectionView *)&v9 isEditing];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(TagCollectionView *)&v8 setEditing:v3];
  sub_10038E55C(v7);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TagCollectionView *)&v3 layoutSubviews];
  sub_10038C650(0);
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection) = (Class)a3;
  id v3 = a3;
}

- (void)dataSourceDidUpdate:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_10038EEC4();

  sub_10002B754((uint64_t)v6, &qword_10069B4D0);
}

- (_TtC11MobileNotes17TagCollectionView)initWithCoder:(id)a3
{
}

- (void)selectTagSelection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_super v8 = self;
  sub_10038AFF0(a3, v4);
}

- (_TtC11MobileNotes17TagCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobileNotes17TagCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagDataSource));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_selectionDidChange));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_dataDidChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_defaultAccountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_workerContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_viewContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_presentingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagSelectionBeforeDrag));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_sizingCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_renameTagAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagDeletionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_tagRenameViewController));
  sub_10039F360(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo), *(void *)&self->tagDataSource[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo], *(void *)&self->selectionDidChange[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo], *(void **)&self->selectionDidChange[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_currentRenamedTagInfo + 8]);
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotes17TagCollectionView_accessibilityProvider, &qword_1006A1528);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes17TagCollectionView____lazy_storage___tagSizingLabel);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12.receiver = self;
  v12.super_class = ObjectType;
  unsigned int v10 = ![(TagCollectionView *)&v12 isEditing];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_10039F6F4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  objc_super v12 = self;
  id v13 = sub_10039FCF8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return sub_100393104(self, (uint64_t)a2, a3, a4, 1);
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return sub_100393104(self, (uint64_t)a2, a3, a4, 0);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_10002F214((uint64_t *)&unk_1006A2670);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for IndexPath();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for IndexPath();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  id v16 = sub_1003A0074(a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_10002B754((uint64_t)v11, (uint64_t *)&unk_1006A2670);

  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1003A0B24(a4);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_1003A11C4();

  swift_unknownObjectRelease();
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  uint64_t v12 = self;
  int64_t v13 = sub_1003A124C((uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

@end