@interface PBFFocusPosterSelectionMastheadView
- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)configuration;
- (_TtC11PosterBoard35PBFFocusPosterSelectionMastheadView)initWithCoder:(id)a3;
- (_TtC11PosterBoard35PBFFocusPosterSelectionMastheadView)initWithFrame:(CGRect)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation PBFFocusPosterSelectionMastheadView

- (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration)configuration
{
  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_configuration);
  swift_beginAccess();
  return (_TtC11PosterBoard35PBFFocusPosterMastheadConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  v6 = self;
  PBFFocusPosterSelectionMastheadView.configuration.setter(a3);
}

- (_TtC11PosterBoard35PBFFocusPosterSelectionMastheadView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_mastheadView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_mastheadBottomMargin) = (Class)0x4030000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_configuration) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PBFFocusPosterSelectionMastheadView();
  return -[PBFFocusPosterSelectionMastheadView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard35PBFFocusPosterSelectionMastheadView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_mastheadView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_mastheadBottomMargin) = (Class)0x4030000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_configuration) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PBFFocusPosterSelectionMastheadView();
  return [(PBFFocusPosterSelectionMastheadView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_mastheadView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard35PBFFocusPosterSelectionMastheadView_configuration);
}

@end