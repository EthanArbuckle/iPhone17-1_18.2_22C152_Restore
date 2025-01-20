@interface CircularProgressView
- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateRotationAnimation;
@end

@implementation CircularProgressView

- (void)tintColorDidChange
{
  v2 = self;
  _s23ShelfKitCollectionViews20CircularProgressViewC18tintColorDidChangeyyF_0();
}

- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A9AF4();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CircularProgressView *)&v6 traitCollectionDidChange:v4];
  _s23ShelfKitCollectionViews20CircularProgressViewC18tintColorDidChangeyyF_0();
  sub_1A7A68();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CircularProgressView *)&v3 layoutSubviews];
  sub_1A7A68();
}

- (_TtC23ShelfKitCollectionViews20CircularProgressView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews20CircularProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_style + 72];
  id v4 = *(void **)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_style + 80];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_backgroundRing));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_ring));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews20CircularProgressView_stopSign);
}

- (void)updateRotationAnimation
{
  id v2 = self;
  sub_1A8380();
}

@end