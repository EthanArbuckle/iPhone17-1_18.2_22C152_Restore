@interface PostPlayTemplateController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (_TtC8VideosUI26PostPlayTemplateController)initWithCoder:(id)a3;
- (_TtC8VideosUI26PostPlayTemplateController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)playbackUpNextViewHeight;
- (void)setPlaybackUpNextContextData:(id)a3;
- (void)setPlaybackUpNextDelegate:(id)a3;
- (void)startAutoPlayAnimation;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation PostPlayTemplateController

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3121888();

  return v3 & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E31218E8();

  return v3 & 1;
}

- (_TtC8VideosUI26PostPlayTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31223DC();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E31224F0();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E312271C(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3122864(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3122924();
}

- (_TtC8VideosUI26PostPlayTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3125634();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1E2BEA314((uint64_t)self + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_collectionImpressioner, &qword_1EBF8B120);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_playlistViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_attentionMonitor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_featuredContentLogo));
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_playbackUpNextDelegate);
  swift_bridgeObjectRelease();
}

- (void)setPlaybackUpNextDelegate:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  sub_1E3125950();
  swift_unknownObjectRelease();
}

- (void)startAutoPlayAnimation
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3125A24();
}

- (void)setPlaybackUpNextContextData:(id)a3
{
  sub_1E387C678();
  swift_bridgeObjectRelease();
}

- (double)playbackUpNextViewHeight
{
  return 0.0;
}

@end