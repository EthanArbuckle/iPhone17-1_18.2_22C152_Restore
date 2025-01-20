@interface TranscriptTimestampView
- (_TtC19PodcastsTranscripts23TranscriptTimestampView)initWithCoder:(id)a3;
- (_TtC19PodcastsTranscripts23TranscriptTimestampView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation TranscriptTimestampView

- (_TtC19PodcastsTranscripts23TranscriptTimestampView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F9B8();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(TranscriptTimestampView *)&v4 layoutSubviews];
  id v3 = [v2 layer];
  [v2 bounds];
  [v3 setCornerRadius:CGRectGetHeight(v5) * 0.5];
}

- (_TtC19PodcastsTranscripts23TranscriptTimestampView)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC19PodcastsTranscripts23TranscriptTimestampView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts23TranscriptTimestampView_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19PodcastsTranscripts23TranscriptTimestampView_constants);

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts23TranscriptTimestampView_verticalScrollIndicator));
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19PodcastsTranscripts23TranscriptTimestampView_verticalConstraint);
}

@end