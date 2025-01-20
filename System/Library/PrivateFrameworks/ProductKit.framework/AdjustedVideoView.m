@interface AdjustedVideoView
- (_TtC10ProductKit17AdjustedVideoView)initWithCoder:(id)a3;
- (_TtC10ProductKit17AdjustedVideoView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AdjustedVideoView

- (_TtC10ProductKit17AdjustedVideoView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_featureHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_startedHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_completedHandler);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC10ProductKit17AdjustedVideoView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21EFBACA0(a3);
}

- (_TtC10ProductKit17AdjustedVideoView)initWithFrame:(CGRect)a3
{
  result = (_TtC10ProductKit17AdjustedVideoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21EF61B40((uint64_t)self + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_configuration, &qword_267EAF0E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_mediaPlayerView));
  swift_bridgeObjectRelease();
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_featureHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_startedHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC10ProductKit17AdjustedVideoView_completedHandler);
  sub_21EF608FC(v3);
}

@end