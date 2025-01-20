@interface iOSLinkAcceleratorCollectionViewController
- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation iOSLinkAcceleratorCollectionViewController

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_sizingCell;
  type metadata accessor for iOSLinkAcceleratorCollectionViewCell(0);
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_dataSource) = 0;
  v8 = (char *)self
     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_currentSuggestionsContainer;
  uint64_t v9 = sub_20C160880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_20C15F890();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F820();
  v10 = *(void (**)(char *))((*MEMORY[0x263F8EED0] & **(void **)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_linkAcceleratorViewController))
                                      + 0x140);
  id v11 = a3;
  v12 = self;
  v10(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_linkAcceleratorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_sizingCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_dataSource));
  sub_20BFCEDFC((uint64_t)self+ OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_currentSuggestionsContainer, &qword_2676BC8A0);
}

@end