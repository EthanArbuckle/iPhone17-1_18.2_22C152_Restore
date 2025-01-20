@interface JSSocialProfileEditorViewController
- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5;
- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)viewDidLoad;
@end

@implementation JSSocialProfileEditorViewController

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_53D60C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_5363A0();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 2;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (!v13)
  {
    id v21 = a5;
    goto LABEL_5;
  }
  v14 = (void *)v13;
  id v15 = a4;
  id v16 = a3;
  id v17 = a5;
  v18 = self;
  id v19 = [v14 tableViewCell];
  if (v19)
  {
    v20 = v19;
    [v19 setSeparatorStyle:0];

LABEL_5:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

    return;
  }
  __break(1u);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = sub_AB1110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  v14 = sub_537A50((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_AB6510();
  id v15 = v14;
  sub_AB1080();
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = self;
  v20 = (void *)sub_538298(v16, v13, v15, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();

  return v20;
}

- (double)collectionView:(id)a3 heightForHeaderViewInTableLayout:(id)a4
{
  [a3 bounds];
  double result = v4 + 32.0;
  if (v4 > 128.0) {
    return 160.0;
  }
  return result;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v9 = sub_AB1110();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  type metadata accessor for SocialProfileEditorCell();
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = self;
  id v17 = [(JSSocialProfileEditorViewController *)v16 traitCollection];
  sub_77DF8(v17, 0.0);
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (BOOL)collectionView:(id)a3 tableLayout:(id)a4 shouldIndentWhileEditingRowAtIndexPath:(id)a5
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_53DFFC((unint64_t *)&unk_DDE300, 255, type metadata accessor for InfoKey);
  uint64_t v7 = sub_AB6250();
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_53930C(v8, v7);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_539840(v4);
}

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  double result = (_TtC16MusicApplication35JSSocialProfileEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MusicApplication35JSSocialProfileEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC16MusicApplication35JSSocialProfileEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_validationDelegate);
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_textInputDelegate);
  sub_1A500((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_propertyChangedObservingDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_greenTeaLogger));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_profileEditor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_profilePerson));
  sub_87510(*(id *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication35JSSocialProfileEditorViewController_userPhotoUpdate));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end