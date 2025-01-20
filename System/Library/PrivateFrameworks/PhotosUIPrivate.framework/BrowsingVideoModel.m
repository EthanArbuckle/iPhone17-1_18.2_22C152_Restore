@interface BrowsingVideoModel
- (_TtC15PhotosUIPrivate18BrowsingVideoModel)init;
- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4;
- (void)mediaTimelineControlDidEndChanging:(id)a3;
- (void)mediaTimelineControlDidEndDecelerating:(id)a3;
- (void)mediaTimelineControlWillBeginChanging:(id)a3;
- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4;
@end

@implementation BrowsingVideoModel

- (_TtC15PhotosUIPrivate18BrowsingVideoModel)init
{
  return (_TtC15PhotosUIPrivate18BrowsingVideoModel *)sub_1AEA250DC();
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AEA264C8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel___audioMuteState;
  sub_1AEF94860();
  OUTLINED_FUNCTION_16_0();
  (*(void (**)(char *))(v4 + 8))(v3);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_timeRangeMarkUIProvider));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_assetViewModelObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel_videoPlayerObservation));
  swift_bridgeObjectRelease();
  id v5 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate18BrowsingVideoModel___observationRegistrar;
  sub_1AEF93A30();
  OUTLINED_FUNCTION_16_0();
  v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
}

- (void)mediaTimelineControl:(id)a3 didChangeValue:(float)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1AEA278EC(a4);
}

- (void)mediaTimelineControlWillBeginChanging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEA27B38();
}

- (void)mediaTimelineControlDidEndChanging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEA27D54();
}

- (void)mediaTimelineControlDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEA27EAC();
}

@end