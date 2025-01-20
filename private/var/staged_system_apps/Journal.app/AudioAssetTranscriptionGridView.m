@interface AudioAssetTranscriptionGridView
- (_TtC7Journal31AudioAssetTranscriptionGridView)initWithCoder:(id)a3;
- (_TtC7Journal31AudioAssetTranscriptionGridView)initWithFrame:(CGRect)a3;
@end

@implementation AudioAssetTranscriptionGridView

- (_TtC7Journal31AudioAssetTranscriptionGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal31AudioAssetTranscriptionGridView *)sub_1004E03BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal31AudioAssetTranscriptionGridView)initWithCoder:(id)a3
{
  return (_TtC7Journal31AudioAssetTranscriptionGridView *)sub_1004E0518(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView____lazy_storage___headerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView_playbackButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView____lazy_storage___headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView____lazy_storage___bulletAndTranscriptImageAttributedString));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView____lazy_storage___outerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView____lazy_storage___waveformContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView_waveformContainerViewLeadingEdgeConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal31AudioAssetTranscriptionGridView_waveformContainerViewTrailingEdgeConstraint);
}

@end