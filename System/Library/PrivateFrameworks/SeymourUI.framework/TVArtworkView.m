@interface TVArtworkView
- (CGSize)intrinsicContentSize;
- (UIImage)image;
- (_TtC9SeymourUI13TVArtworkView)initWithCoder:(id)a3;
- (_TtC9SeymourUI13TVArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
@end

@implementation TVArtworkView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVArtworkView();
  v2 = [(SMUTVStackedImageView *)&v4 image];

  return v2;
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A177420(a3);
}

- (_TtC9SeymourUI13TVArtworkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v5 = objc_allocWithZone((Class)type metadata accessor for TVArtworkView());
  v8 = sub_23A177798(0, v6, v7, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9SeymourUI13TVArtworkView *)v8;
}

- (_TtC9SeymourUI13TVArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A178318();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A177A50();
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = *MEMORY[0x263F83C20];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_completedIconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_stackIconView));
  sub_239FA8DB0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_artwork);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_layoutHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_layout);
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_stackedOverlayView);
}

@end