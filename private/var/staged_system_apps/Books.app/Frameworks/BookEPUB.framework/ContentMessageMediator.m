@interface ContentMessageMediator
- (_TtC8BookEPUB22ContentMessageMediator)init;
- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4;
- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5;
- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5;
- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)webViewDidEnterFullscreen:(id)a3;
- (void)webViewDidExitFullscreen:(id)a3;
- (void)webViewFullscreenMayReturnToInline:(id)a3;
@end

@implementation ContentMessageMediator

- (_TtC8BookEPUB22ContentMessageMediator)init
{
  return (_TtC8BookEPUB22ContentMessageMediator *)ContentMessageMediator.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_logger;
  uint64_t v4 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_webMessageHandler);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_navigationEventHandler);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_citationHandler);
  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_alertHandler;

  sub_4F924((uint64_t)v5);
}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v10 = sub_140198;
  }
  else
  {
    v10 = 0;
    uint64_t v9 = 0;
  }
  v11 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_alertHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v12 = *((void *)v11 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14 = *(void (**)(_TtC8BookEPUB22ContentMessageMediator *, id, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 8);
    id v15 = a3;
    v14(self, a4, v10, v9, ObjectType, v12);
    swift_unknownObjectRelease();
  }
  else
  {
    id v16 = a3;
    id v17 = a4;
    v18 = self;
  }
  sub_81A88((uint64_t)v10);
}

- (void)handler:(id)a3 webView:(id)a4 didNotHandleTapAsClickAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_13F5F4(v10, x, y);
}

- (id)handler:(id)a3 citationForText:(id)a4 webView:(id)a5
{
  uint64_t v8 = sub_2FC180();
  unint64_t v10 = v9;
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  sub_13F6B0(v8, v10, v12);

  swift_bridgeObjectRelease();
  NSString v14 = sub_2FC140();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)adjustedItemProvidersWithCitation:(id)a3 withExcerptString:(id)a4
{
  sub_39F90(0, (unint64_t *)&unk_405320);
  uint64_t v5 = sub_2FC3F0();
  uint64_t v6 = sub_2FC180();
  unint64_t v8 = v7;
  unint64_t v9 = self;
  ContentMessageMediator.adjustedItemProviders(withCitation:withExcerptString:)(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10.super.isa = sub_2FC3D0().super.isa;
  swift_bridgeObjectRelease();

  return v10.super.isa;
}

- (void)buildMenuWithBuilder:(id)a3 inWebView:(id)a4 atPoint:(CGPoint)a5
{
  unint64_t v7 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    unint64_t v9 = *(void (**)(void))(v8 + 64);
    swift_unknownObjectRetain();
    id v10 = a4;
    id v11 = self;
    v9();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (void)webViewDidEnterFullscreen:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    unint64_t v7 = *(void (**)(void))(v6 + 72);
    id v8 = a3;
    unint64_t v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)webViewFullscreenMayReturnToInline:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    unint64_t v7 = *(void (**)(void))(v6 + 80);
    id v8 = a3;
    unint64_t v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)webViewDidExitFullscreen:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB22ContentMessageMediator_eventHandler;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    unint64_t v7 = *(void (**)(void))(v6 + 88);
    id v8 = a3;
    unint64_t v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_13FA44(v7);
}

@end