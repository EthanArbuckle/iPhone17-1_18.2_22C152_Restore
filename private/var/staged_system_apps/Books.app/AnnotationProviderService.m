@interface AnnotationProviderService
- (_TtC5Books25AnnotationProviderService)init;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
@end

@implementation AnnotationProviderService

- (_TtC5Books25AnnotationProviderService)init
{
  result = (_TtC5Books25AnnotationProviderService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books25AnnotationProviderService_annotationMOCHost);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books25AnnotationProviderService_bookEntity);

  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_weakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC5Books25AnnotationProviderService__bookAnnotationEntity;
  uint64_t v4 = sub_100058D18(&qword_100B3F1F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();

  swift_release();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = sub_100058D18((uint64_t *)&unk_100B33680);
  __chkstk_darwin(v12 - 8);
  v14 = &v27[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  v17 = &v27[-v16];
  id v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  id v20 = a5;
  id v21 = a7;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_1007F2DE0();

    uint64_t v22 = sub_1007F2E40();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_1007F2E40();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    sub_1007F2DE0();

    uint64_t v24 = sub_1007F2E40();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v14, 0, 1, v24);
  }
  else
  {
    uint64_t v26 = sub_1007F2E40();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v14, 1, 1, v26);
  }
  AnnotationProviderService.controller(_:didChange:at:for:newIndexPath:)(v18, (uint64_t)v27, v25, a6);

  sub_10005AFE8((uint64_t)v14, (uint64_t *)&unk_100B33680);
  sub_10005AFE8((uint64_t)v17, (uint64_t *)&unk_100B33680);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v27);
}

@end