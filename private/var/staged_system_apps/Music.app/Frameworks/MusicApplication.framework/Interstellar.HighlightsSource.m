@interface Interstellar.HighlightsSource
- (_TtCO16MusicApplication12Interstellar16HighlightsSource)init;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(void *)a3;
@end

@implementation Interstellar.HighlightsSource

- (_TtCO16MusicApplication12Interstellar16HighlightsSource)init
{
  return (_TtCO16MusicApplication12Interstellar16HighlightsSource *)sub_494CD8();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = 0;
  id v8 = a3;
  id v10 = a4;
  v9 = self;
  sub_49A8CC(v7);
  sub_496D5C();
}

- (void)highlightCenterDidAddHighlights:(void *)a3
{
  v4 = &a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  uint64_t v5 = *(void *)&a1[OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver];
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)v4 = 0;
  id v6 = a3;
  uint64_t v7 = a1;
  sub_49A8CC(v5);
  sub_496D5C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_center));
  sub_49A8CC(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_resolver));
  sub_1A538((uint64_t)self + OBJC_IVAR____TtCO16MusicApplication12Interstellar16HighlightsSource_importResultAssertions, (uint64_t *)&unk_DC4CF0);
}

@end