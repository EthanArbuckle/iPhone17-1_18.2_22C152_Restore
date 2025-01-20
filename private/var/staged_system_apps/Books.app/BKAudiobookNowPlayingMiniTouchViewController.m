@interface BKAudiobookNowPlayingMiniTouchViewController
- (BKAudiobookNowPlayingMiniTouchViewController)initWithCoder:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)addSpringLoadedInteractionWith:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)loadView;
- (void)setHelper:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willUndock;
@end

@implementation BKAudiobookNowPlayingMiniTouchViewController

- (BKAudiobookNowPlayingMiniTouchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003CF218();
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_1003CA4B0();
  [(BKAudiobookNowPlayingMiniTouchViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003CA858();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v6 viewDidAppear:v3];
  v5 = sub_1003CA4B0();
  [*(id *)&v5[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleContainer] setMarqueeEnabled:1 withOptions:0];
  [*(id *)&v5[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleContainer] setMarqueeEnabled:1 withOptions:0];
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_1003CF594();

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)setHelper:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  _Block_copy(v6);
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  if (Strong)
  {
    sub_10043A334((uint64_t)a3, Strong, v6);
    swift_unknownObjectRelease();
  }
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_1003CC2E0((uint64_t)v9);
  sub_10005AFE8((uint64_t)v9, &qword_100B25DD0);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_buyButtonProvider, &qword_100B25DD0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_buyButtonViewController));
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_contextMenuAppearDate, (uint64_t *)&unk_100B2BD50);
  BOOL v3 = (char *)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_logger;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController____lazy_storage___miniPlayerView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_springLoadedInteraction);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = sub_1003CF9FC();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v8 = sub_100058D18((uint64_t *)&unk_100B2BD50);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a4;
  swift_unknownObjectRetain();
  v13 = self;
  sub_1007F2B60();
  uint64_t v14 = sub_1007F2BA0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 0, 1, v14);
  uint64_t v15 = (uint64_t)v13 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_contextMenuAppearDate;
  swift_beginAccess();
  sub_10023E148((uint64_t)v10, v15);
  swift_endAccess();

  swift_unknownObjectRelease();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_1003CFB14();

  swift_unknownObjectRelease();
}

- (void)addSpringLoadedInteractionWith:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  id v6 = objc_allocWithZone((Class)UISpringLoadedInteraction);
  v11[4] = sub_1003CF1D4;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1003CF114;
  v11[3] = &unk_100A586E8;
  id v7 = _Block_copy(v11);
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = [v6 initWithActivationHandler:v7];
  _Block_release(v7);
  swift_release();
  sub_1003CC920(v10);
}

- (void)willUndock
{
  v2 = self;
  sub_1003CEF74();
}

@end