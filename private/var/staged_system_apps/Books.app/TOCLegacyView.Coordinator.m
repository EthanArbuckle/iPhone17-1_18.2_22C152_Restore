@interface TOCLegacyView.Coordinator
- (_TtCV5Books13TOCLegacyView11Coordinator)init;
- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4;
- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4;
- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4;
- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4;
- (id)tocViewControllerCurrentLocation:(id)a3;
- (id)tocViewControllerTocIdCssRules:(id)a3;
- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4;
- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4;
- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4;
- (void)directoryContent:(id)a3 didSelectBookmarkForLocation:(id)a4 annotationUUID:(id)a5;
- (void)directoryContent:(id)a3 didSelectHighlightForLocation:(id)a4 annotationUUID:(id)a5;
- (void)tocViewController:(id)a3 didSelectChapter:(id)a4;
- (void)tocViewController:(id)a3 shareAnnotations:(id)a4 sourceView:(id)a5;
- (void)tocViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)tocViewControllerContentDidChange:(id)a3;
- (void)tocViewControllerDidChangeEditing:(BOOL)a3;
@end

@implementation TOCLegacyView.Coordinator

- (void)directoryContent:(id)a3 didSelectBookmarkForLocation:(id)a4 annotationUUID:(id)a5
{
}

- (void)directoryContent:(id)a3 didSelectHighlightForLocation:(id)a4 annotationUUID:(id)a5
{
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1006C5C38(v7);
  int64_t v10 = v9;

  return v10;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  id v7 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent);
  swift_beginAccess();
  v8 = *v7;
  sub_1007FC100();
  if (swift_dynamicCastClass())
  {
    id v9 = a3;
    int64_t v10 = self;
    id v11 = v8;
    swift_unknownObjectRetain();
    v12 = (void *)sub_1004F76FC(a4);

    swift_unknownObjectRelease();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_1006C6204(a4);
  swift_unknownObjectRelease();
}

- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4
{
  return sub_1006C3BE8(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1006C6310);
}

- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4
{
  return sub_1006C3BE8(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1006C644C);
}

- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4
{
  return sub_1006C3BE8(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1006C665C);
}

- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int64_t v9 = sub_1006C6734(a4);

  return v9;
}

- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1006C6934(a4);

  return (int64_t)v9;
}

- (void)tocViewController:(id)a3 shareAnnotations:(id)a4 sourceView:(id)a5
{
  uint64_t v8 = sub_100058D18((uint64_t *)&unk_100B27070);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004A860(0, &qword_100B3BF28);
  uint64_t v12 = sub_1007FDFF0();
  v13 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess();
  v14 = (void (*)(uint64_t, char *))*((void *)v13 + 9);
  id v15 = a3;
  id v16 = a5;
  v17 = self;
  swift_retain();
  sub_1007FB980();
  v14(v12, v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_bridgeObjectRelease();
}

- (id)tocViewControllerTocIdCssRules:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent);
  swift_beginAccess();
  id v6 = *v5;
  swift_getObjectType();
  id v7 = self;
  id v8 = v6;
  id v9 = a3;
  sub_1007FB480();
  sub_1007FAE40();
  uint64_t v11 = v10;

  swift_release();
  if (v11)
  {
    NSString v12 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

- (id)tocViewControllerCurrentLocation:(id)a3
{
  uint64_t v5 = type metadata accessor for TOCLegacyView(0);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess();
  sub_10043D0E0((uint64_t)v8, (uint64_t)v7);
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = sub_1006C28D8();
  sub_10043D144((uint64_t)v7);

  return v11;
}

- (void)tocViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = self;
  sub_1006C6D0C((uint64_t)a3, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)tocViewControllerContentDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1006C6E5C();
}

- (void)tocViewControllerDidChangeEditing:(BOOL)a3
{
  uint64_t v5 = type metadata accessor for TOCLegacyView(0);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  id v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess();
  sub_10043D0E0((uint64_t)v9, (uint64_t)v8);
  uint64_t v10 = &v8[*(int *)(v6 + 68)];
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *((void *)v10 + 1);
  LOBYTE(v10) = v10[16];
  uint64_t v15 = v11;
  uint64_t v16 = v12;
  char v17 = (char)v10;
  v14[15] = a3;
  uint64_t v13 = self;
  sub_100058D18(&qword_100B43AE0);
  sub_1007F9CE0();
  sub_10043D144((uint64_t)v8);
}

- (_TtCV5Books13TOCLegacyView11Coordinator)init
{
  result = (_TtCV5Books13TOCLegacyView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end