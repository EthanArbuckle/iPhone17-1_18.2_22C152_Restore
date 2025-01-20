@interface CollectionsPosterEditDelegate
- (_TtC17CollectionsPoster29CollectionsPosterEditDelegate)init;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3;
- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation CollectionsPosterEditDelegate

- (_TtC17CollectionsPoster29CollectionsPosterEditDelegate)init
{
  return (_TtC17CollectionsPoster29CollectionsPosterEditDelegate *)sub_10000D478();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editor));
  sub_10000CAC0((uint64_t)self + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_environmentSnapshot, &qword_100020678);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CollectionsPoster29CollectionsPosterEditDelegate_editingEnvironment));
  swift_release();
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000DBF0(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000E1B8((uint64_t)v8, (uint64_t)a4, a5);

  swift_unknownObjectRelease();
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000E798((uint64_t)v4);

  sub_10000CF20(0, &qword_1000208F0);
  v6.super.isa = sub_100012908().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000ECB0();

  NSString v6 = sub_1000128A8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  return sub_10000F06C(self, (uint64_t)a2, a3, "CollectionsPosterEditDelegate.LeadingMenuElements", (void (*)(uint64_t))&WKWallpaperPosterEditorController.leadingMenuElements(for:));
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  return sub_10000F06C(self, (uint64_t)a2, a3, "CollectionsPosterEditDelegate.TrailingMenuElements", (void (*)(uint64_t))&WKWallpaperPosterEditorController.trailingMenuElements(for:));
}

- (int64_t)activeAppearanceMenuSelectionForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F138((uint64_t)v4, "CollectionsPosterEditDelegate.ActiveAppearanceSelection", (void (*)(uint64_t))&WKWallpaperPosterEditorController.activeAppearanceMenuSelection(for:));
  int64_t v7 = v6;

  return v7;
}

- (void)editor:(id)a3 appearanceMenuDidChangeSelectedStyle:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = self;
  sub_10000F8C4((uint64_t)v6, a4, "CollectionsPosterEditDelegate.ActiveAppearanceChanged", (void (*)(uint64_t, uint64_t))&WKWallpaperPosterEditorController.editor(_:appearanceMenuDidChangeSelectedStyle:));
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10000F50C((uint64_t)v8, (uint64_t)a4, (uint64_t)v9);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000F8C4((uint64_t)v6, (uint64_t)v7, "CollectionsPosterEditDelegate.LookTransitionFinished", (void (*)(uint64_t, uint64_t))&WKWallpaperPosterEditorController.editor(_:didFinishTransitionTo:));
}

- (void)editor:(PREditor *)a3 finalizeWithCompletion:(id)a4
{
  uint64_t v7 = sub_100003220(&qword_100020720);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100012968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000208A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000208B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100010E1C((uint64_t)v9, (uint64_t)&unk_100020740, (uint64_t)v14);
  swift_release();
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000106DC();
}

@end