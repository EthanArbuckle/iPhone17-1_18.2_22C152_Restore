@interface PlaybackMetadataView
- (_TtC9SeymourUI20PlaybackMetadataView)init;
- (_TtC9SeymourUI20PlaybackMetadataView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20PlaybackMetadataView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaybackMetadataView

- (_TtC9SeymourUI20PlaybackMetadataView)init
{
  return (_TtC9SeymourUI20PlaybackMetadataView *)sub_23A0DDAD0();
}

- (_TtC9SeymourUI20PlaybackMetadataView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0E04C4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A0DEB30(a3);
}

- (_TtC9SeymourUI20PlaybackMetadataView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI20PlaybackMetadataView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_metadataMaximumContentSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_gymKitMarqueeView));

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_styleProvider, sizeof(__dst));
  sub_23A0E0760((uint64_t)__dst);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_titleMarqueeView));
}

@end