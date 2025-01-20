@interface BookReaderActionTarget
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (NSArray)keyCommands;
- (_TtC5Books22BookReaderActionTarget)init;
- (void)books_addHighlight:(id)a3;
- (void)books_addNote:(id)a3;
- (void)books_chapterBackward:(id)a3;
- (void)books_chapterEnd:(id)a3;
- (void)books_chapterForward:(id)a3;
- (void)books_chapterLeft:(id)a3;
- (void)books_chapterRight:(id)a3;
- (void)books_chapterStart:(id)a3;
- (void)books_close:(id)a3;
- (void)books_decreaseBrightness:(id)a3;
- (void)books_decreaseSize:(id)a3;
- (void)books_disableContinuousScroll:(id)a3;
- (void)books_disableDarkAppearance:(id)a3;
- (void)books_disableTheme:(id)a3;
- (void)books_editTheme:(id)a3;
- (void)books_enableContinuousScroll:(id)a3;
- (void)books_enableDarkAppearance:(id)a3;
- (void)books_enableTheme:(id)a3;
- (void)books_find:(id)a3;
- (void)books_findSelection:(id)a3;
- (void)books_increaseBrightness:(id)a3;
- (void)books_increaseSize:(id)a3;
- (void)books_lineBackward:(id)a3;
- (void)books_lineForward:(id)a3;
- (void)books_lookup:(id)a3;
- (void)books_pageBackward:(id)a3;
- (void)books_pageForward:(id)a3;
- (void)books_removeHighlight:(id)a3;
- (void)books_removeNote:(id)a3;
- (void)books_resetSize:(id)a3;
- (void)books_search:(id)a3;
- (void)books_setHighlightStyle:(id)a3;
- (void)books_setTheme:(id)a3;
- (void)books_setThemeAppearance:(id)a3;
- (void)books_share:(id)a3;
- (void)books_showBookmarks:(id)a3;
- (void)books_showContent:(id)a3;
- (void)books_showDigitalPageNumbers:(id)a3;
- (void)books_showHighlightsAndNotes:(id)a3;
- (void)books_showPrintedPageNumbers:(id)a3;
- (void)books_showTableOfContents:(id)a3;
- (void)books_toggleBookmark:(id)a3;
- (void)books_toggleContinuousScroll:(id)a3;
- (void)books_toggleDarkAppearance:(id)a3;
- (void)books_toggleTheme:(id)a3;
- (void)books_translate:(id)a3;
- (void)copy:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation BookReaderActionTarget

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_100530584();

  if (v3)
  {
    sub_10004A860(0, &qword_100B2C0B0);
    v4.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)copy:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10024CC2C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_pageBackward:(id)a3
{
}

- (void)books_pageForward:(id)a3
{
}

- (void)books_lineBackward:(id)a3
{
}

- (void)books_lineForward:(id)a3
{
}

- (void)books_chapterLeft:(id)a3
{
}

- (void)books_chapterRight:(id)a3
{
}

- (void)books_chapterBackward:(id)a3
{
}

- (void)books_chapterForward:(id)a3
{
}

- (void)books_chapterStart:(id)a3
{
}

- (void)books_chapterEnd:(id)a3
{
}

- (void)books_toggleBookmark:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    char v6 = sub_1004F8920();
    sub_1004F8AAC((v6 & 1) == 0);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v7, (uint64_t *)&unk_100B269C0);
}

- (void)books_addHighlight:(id)a3
{
}

- (void)books_removeHighlight:(id)a3
{
}

- (void)books_setHighlightStyle:(id)a3
{
}

- (void)books_addNote:(id)a3
{
}

- (void)books_removeNote:(id)a3
{
}

- (void)books_search:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = sub_100539A40((uint64_t)v8);
    sub_1006F6CC8(v6, v7);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v8, (uint64_t *)&unk_100B269C0);
}

- (void)books_find:(id)a3
{
}

- (void)books_findSelection:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1006FAD40();

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_resetSize:(id)a3
{
}

- (void)books_decreaseSize:(id)a3
{
}

- (void)books_increaseSize:(id)a3
{
}

- (void)books_increaseBrightness:(id)a3
{
}

- (void)books_decreaseBrightness:(id)a3
{
}

- (void)books_close:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v7 = (void *)Strong;
    *(void *)(swift_allocObject() + 16) = Strong;
    id v8 = v7;
    sub_1007810A8((void (*)(uint64_t))sub_10053AA84);

    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v9, (uint64_t *)&unk_100B269C0);
}

- (void)books_showContent:(id)a3
{
}

- (void)books_showTableOfContents:(id)a3
{
}

- (void)books_showBookmarks:(id)a3
{
}

- (void)books_showHighlightsAndNotes:(id)a3
{
}

- (void)books_showPrintedPageNumbers:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getObjectType();
    sub_1007FC150();

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_showDigitalPageNumbers:(id)a3
{
  if (a3)
  {
    NSArray v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getObjectType();
    sub_1007FC150();

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v6, (uint64_t *)&unk_100B269C0);
}

- (void)books_toggleContinuousScroll:(id)a3
{
}

- (void)books_enableContinuousScroll:(id)a3
{
}

- (void)books_disableContinuousScroll:(id)a3
{
}

- (void)books_toggleTheme:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v9 = self;
  }
  char v10 = sub_100538A70((uint64_t)v15);
  uint64_t v11 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_1007FE100();
  v12 = self;
  uint64_t v13 = sub_1007FE0F0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = &protocol witness table for MainActor;
  *(void *)(v14 + 32) = v12;
  *(unsigned char *)(v14 + 40) = v10;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B39ED8, v14);

  swift_release();
  sub_10005AFE8((uint64_t)v15, (uint64_t *)&unk_100B269C0);
}

- (void)books_enableTheme:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v9 = self;
  }
  char v10 = sub_100539CD4((uint64_t)v15);
  uint64_t v11 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_1007FE100();
  v12 = self;
  uint64_t v13 = sub_1007FE0F0();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = &protocol witness table for MainActor;
  *(void *)(v14 + 32) = v12;
  *(unsigned char *)(v14 + 40) = v10;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B39ED0, v14);

  swift_release();
  sub_10005AFE8((uint64_t)v15, (uint64_t *)&unk_100B269C0);
}

- (void)books_disableTheme:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    v9 = self;
  }
  uint64_t v10 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1007FE100();
  uint64_t v11 = self;
  uint64_t v12 = sub_1007FE0F0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  *(void *)(v13 + 32) = v11;
  *(unsigned char *)(v13 + 40) = 0;
  sub_10004BC14((uint64_t)v7, (uint64_t)&unk_100B39EC8, v13);

  swift_release();
  sub_10005AFE8((uint64_t)v14, (uint64_t *)&unk_100B269C0);
}

- (void)books_setTheme:(id)a3
{
}

- (void)books_editTheme:(id)a3
{
  uint64_t v5 = sub_1007FAA10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v9 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    uint64_t v10 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getObjectType();
    sub_1007FCDB0();
    sub_1006F81CC((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10005AFE8((uint64_t)v11, (uint64_t *)&unk_100B269C0);
}

- (void)books_toggleDarkAppearance:(id)a3
{
}

- (void)books_enableDarkAppearance:(id)a3
{
}

- (void)books_disableDarkAppearance:(id)a3
{
}

- (void)books_setThemeAppearance:(id)a3
{
}

- (void)books_translate:(id)a3
{
}

- (void)books_lookup:(id)a3
{
}

- (void)books_share:(id)a3
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  char v8 = sub_100535E98((uint64_t)a3, (uint64_t)v10);

  sub_10005AFE8((uint64_t)v10, (uint64_t *)&unk_100B269C0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1005370FC(v4);
}

- (_TtC5Books22BookReaderActionTarget)init
{
  result = (_TtC5Books22BookReaderActionTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end