@interface TimedMetadataViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8VideosUI27TimedMetadataViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27TimedMetadataViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)nowPlayingTabHeight;
- (id)getNowPlayingTabContextData;
- (void)dealloc;
- (void)setNowPlayingTabContextData:(id)a3;
- (void)setNowPlayingTabDelegate:(id)a3;
- (void)setPlayerViewSize:(CGSize)a3;
- (void)updatePlaybackInfo:(id)a3;
- (void)updatePlaybackRate:(double)a3 elapsedTime:(id)a4 elapsedTimeTimestamp:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation TimedMetadataViewController

- (_TtC8VideosUI27TimedMetadataViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3278690();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E32787E0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E3278EE4();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3279448(v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3279718(v4);
}

- (void)dealloc
{
  v2 = self;
  sub_1E327AC80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_templateController));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1E2C3BB24((uint64_t)self + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_currentTimedEntityMapping, &qword_1EADEDC60);
  swift_release();
  swift_release();
  sub_1E3877538();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_47();
  v3();
  sub_1E2FA40F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController____lazy_storage___emptyStateViewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_emptyStateView));
  char v4 = (char *)self + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_nowPlayingTabDelegate;
  sub_1E2F6ABF0((uint64_t)v4);
}

- (BOOL)_canShowWhileLocked
{
  return sub_1E327AEC8() & 1;
}

- (_TtC8VideosUI27TimedMetadataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E327AF00();
}

- (void)setPlayerViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_1E327C3F4(width, height);
}

- (void)setNowPlayingTabDelegate:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  sub_1E327C5BC();
  swift_unknownObjectRelease();
}

- (id)getNowPlayingTabContextData
{
  return 0;
}

- (void)setNowPlayingTabContextData:(id)a3
{
  sub_1E387C678();
  swift_bridgeObjectRelease();
}

- (double)nowPlayingTabHeight
{
  v2 = self;
  sub_1E327C73C();
  double v4 = v3;

  return v4;
}

- (void)updatePlaybackRate:(double)a3 elapsedTime:(id)a4 elapsedTimeTimestamp:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF83FD0);
  uint64_t v10 = OUTLINED_FUNCTION_7(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_8();
  if (a5)
  {
    sub_1E38761E8();
    uint64_t v11 = sub_1E3876228();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_1E3876228();
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v5, v12, 1, v11);
  id v13 = a4;
  v14 = self;
  OUTLINED_FUNCTION_96();
  sub_1E327C838();

  sub_1E2C3BB24(v5, (uint64_t *)&unk_1EBF83FD0);
}

- (void)updatePlaybackInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E327CCF4();
}

@end