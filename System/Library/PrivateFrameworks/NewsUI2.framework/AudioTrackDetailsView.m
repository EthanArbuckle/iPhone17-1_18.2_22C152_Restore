@interface AudioTrackDetailsView
- (_TtC7NewsUI221AudioTrackDetailsView)initWithCoder:(id)a3;
- (_TtC7NewsUI221AudioTrackDetailsView)initWithFrame:(CGRect)a3;
@end

@implementation AudioTrackDetailsView

- (_TtC7NewsUI221AudioTrackDetailsView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI221AudioTrackDetailsView *)sub_1DF8B4CC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI221AudioTrackDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF8B7324();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_excerptSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_attributionSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_buttonSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_thumbnailImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_publisherNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_publisherLogoImageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_publisherLogoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_headphoneIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_remainingTimeLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_excerptLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_playPauseButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_attributionContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_durationStack));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI221AudioTrackDetailsView_publisherLogoImageWidthConstraint);
}

@end