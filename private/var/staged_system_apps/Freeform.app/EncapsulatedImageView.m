@interface EncapsulatedImageView
- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithCoder:(id)a3;
- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation EncapsulatedImageView

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithFrame:(CGRect)a3
{
  return (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *)sub_1007504B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView)initWithCoder:(id)a3
{
  result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView_imageView);
  v3 = self;
  [v2 crl_activateEqualConstraintsForView:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for EncapsulatedImageView();
  [(EncapsulatedImageView *)&v4 updateConstraints];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView_imageView));
}

@end