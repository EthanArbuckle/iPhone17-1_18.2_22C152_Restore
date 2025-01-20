@interface PaletteContainerView
- (_TtC5Music20PaletteContainerView)initWithCoder:(id)a3;
- (_TtC5Music20PaletteContainerView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation PaletteContainerView

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteContainerView();
  id v2 = v3.receiver;
  [(PaletteContainerView *)&v3 layoutMarginsDidChange];
  [v2 setNeedsLayout];
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_10002E6E0();
}

- (_TtC5Music20PaletteContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000CC414();
}

- (_TtC5Music20PaletteContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music20PaletteContainerView____lazy_storage___separator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music20PaletteContainerView_gradientView);
}

@end