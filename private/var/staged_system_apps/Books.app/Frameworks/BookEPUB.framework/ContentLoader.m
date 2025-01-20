@interface ContentLoader
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4;
- (NSString)description;
- (_TtC8BookEPUB13ContentLoader)init;
- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4;
- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4;
- (void)dealloc;
- (void)handleLoupeGesture:(id)a3;
- (void)handleStylusGesture:(id)a3;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4;
- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3;
- (void)navigationHandlerWebContentProcessFailedWithNoURL:(id)a3;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)setIgnorePageTurnGestures:(BOOL)a3;
- (void)stylusTimerFired:(id)a3;
@end

@implementation ContentLoader

- (void)dealloc
{
  v2 = self;
  ContentLoader.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_loaderID;
  uint64_t v4 = sub_2FB570();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_signposter;
  uint64_t v6 = sub_2FB800();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_signpostID;
  uint64_t v8 = sub_2FB7D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v9 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader__document;
  uint64_t v10 = sub_371F4(&qword_4009E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader__contentView;
  uint64_t v12 = sub_371F4(&qword_4009F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_contentViewHost, &qword_4009C0);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookEPUB13ContentLoader____lazy_storage___accessoryPageView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8BookEPUB13ContentLoader____lazy_storage___accessoryScrollView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_paginatingService);
  swift_weakDestroy();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  v13 = (char *)self + OBJC_IVAR____TtC8BookEPUB13ContentLoader_log;
  uint64_t v14 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);

  v15 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_editMenuInteraction);
}

- (_TtC8BookEPUB13ContentLoader)init
{
  result = (_TtC8BookEPUB13ContentLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_84B84();
  [v4 contentOffset];
  [v6 setContentOffset:];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_84B84();
  [v7 contentOffset];
  [v10 setContentOffset:];
}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  uint64_t v6 = sub_2FB440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2FB400();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_98968((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  uint64_t v8 = sub_2FB440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2FB400();
  id v12 = a3;
  uint64_t v13 = self;
  sub_98DF8((uint64_t)v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_2FB440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  sub_2FB400();
  _Block_copy(v12);
  id v13 = a3;
  uint64_t v14 = self;
  sub_98EF8((uint64_t)v11, (uint64_t)v14, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)navigationHandlerWebContentProcessFailedWithNoURL:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8BookEPUB13ContentLoaderC020navigationHandlerWebC22ProcessFailedWithNoURLyySo9WKWebViewCF_0(v4);
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_371F4((uint64_t *)&unk_400C70);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_2FB400();
    uint64_t v12 = sub_2FB440();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2FB440();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a5;
  v16 = self;
  sub_99090((uint64_t)v11, (uint64_t)a5);

  sub_5BE90((uint64_t)v11, (uint64_t *)&unk_400C70);
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = a4;
  sub_99490((uint64_t)a4);
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
}

- (void)navigationHandlerWebContentProcessAttemptingReload:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB13ContentLoader_attemptingReload) = 1;
}

- (NSString)description
{
  v2 = self;
  ContentLoader.description.getter();

  NSString v3 = sub_2FC140();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setIgnorePageTurnGestures:(BOOL)a3
{
  id v4 = self;
  ContentLoader.setIgnorePageTurnGestures(_:)(a3);
}

- (void)adjustGesturesForTextInteractionAssistant:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  ContentLoader.adjustGestures(for:view:)(v6, v7);
}

- (void)handleStylusGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_A7DE0(v4);
}

- (void)stylusTimerFired:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_A9028();
}

- (void)handleLoupeGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_A8548(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  Swift::Bool v9 = ContentLoader.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer)v6, (UITouch)v7);

  return v9;
}

- (void)_performHighlighterActionWithGestureState:(int64_t)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = self;
  sub_2FBBA0();
  swift_release();
  swift_release();
  if (v10)
  {
    self;
    Swift::Bool v9 = (void *)swift_dynamicCastObjCClass();
    if (v9) {
      sub_A7EF8(a3, v9, 1, x, y);
    }

    id v8 = v10;
  }
}

@end