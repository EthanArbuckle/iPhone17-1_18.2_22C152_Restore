@interface CatchUpToLiveViewController
- (_TtC8VideosUI27CatchUpToLiveViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27CatchUpToLiveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)axViewTappedWithGesture:(id)a3;
- (void)dealloc;
- (void)vui_didMoveToParentViewController:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation CatchUpToLiveViewController

- (_TtC8VideosUI27CatchUpToLiveViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_1E377DD18();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_timeObserverToken, &qword_1EADF8118);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_fetchController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_mediaController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController____lazy_storage___exitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_playableDataSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_nextAXView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_previousAXView);
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E377DEAC((uint64_t)a3);
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E377DF70();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E377EE6C(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E377EFC0(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E378262C();
}

- (void)axViewTappedWithGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E37830F8(v4);
}

- (_TtC8VideosUI27CatchUpToLiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E37860E4();
}

@end