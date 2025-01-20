@interface _UISoftOutlineView
- (_TtC5UIKit18_UISoftOutlineView)initWithCoder:(id)a3;
- (_TtC5UIKit18_UISoftOutlineView)initWithFrame:(CGRect)a3;
- (void)_updateColors;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation _UISoftOutlineView

- (_TtC5UIKit18_UISoftOutlineView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_shapeView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC5UIKit18_UISoftOutlineView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISoftOutlineView();
  id v2 = v3.receiver;
  [(UIView *)&v3 didMoveToWindow];
  sub_1859D2A00();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1859D36D0();
}

- (void)_updateColors
{
  id v2 = self;
  sub_1859D2A00();
}

- (_TtC5UIKit18_UISoftOutlineView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit18_UISoftOutlineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(id *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_configuration);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_configuration));
}

@end