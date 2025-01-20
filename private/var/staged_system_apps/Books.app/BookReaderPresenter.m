@interface BookReaderPresenter
- (_TtC5Books19BookReaderPresenter)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (void)dealloc;
@end

@implementation BookReaderPresenter

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6[3] = ObjectType;
  v6[0] = self;
  v4 = self;
  sub_1007FE560();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(BookReaderPresenter *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_externalContentLoadEventHandler);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_router);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();

  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_annotationProviderService);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books19BookReaderPresenter_searchHighlightID, (uint64_t *)&unk_100B27060);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books19BookReaderPresenter_presentedExpandedContentViewController));
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Books19BookReaderPresenter____lazy_storage___expandedContentAnimator);
}

- (_TtC5Books19BookReaderPresenter)init
{
  result = (_TtC5Books19BookReaderPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (self->router[OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame])
  {
    id v5 = 0;
  }
  else
  {
    id v9 = a3;
    id v10 = a4;
    id v11 = a5;
    v12 = self;
    id v13 = sub_1006F6020();
    sub_1007FCB10();

    id v14 = sub_1006F6020();
    sub_1007FCB20();

    id v5 = sub_1006F6020();
  }

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (self->router[OBJC_IVAR____TtC5Books19BookReaderPresenter_expandedContentFrame])
  {
    id v3 = 0;
  }
  else
  {
    id v5 = a3;
    v6 = self;
    id v7 = sub_1006F6020();
    sub_1007FCB10();

    id v8 = sub_1006F6020();
    sub_1007FCB20();

    id v3 = sub_1006F6020();
  }

  return v3;
}

- (id)interactionControllerForDismissal:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = sub_1006F6020();
  v6 = (void *)sub_1007FCAF0();
  swift_unknownObjectRelease();

  return v6;
}

@end