@interface RhizomeLayeredFlowerView
- (CGAffineTransform)transform;
- (NSString)debugDescription;
- (_TtC13RhizomePoster24RhizomeLayeredFlowerView)initWithCoder:(id)a3;
- (_TtC13RhizomePoster24RhizomeLayeredFlowerView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)sizeToFit;
@end

@implementation RhizomeLayeredFlowerView

- (_TtC13RhizomePoster24RhizomeLayeredFlowerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000122D8();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100010E20(v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100011080();
}

- (void)sizeToFit
{
  v2 = self;
  sub_100010730();
}

- (CGAffineTransform)transform
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  result = (CGAffineTransform *)[(CGAffineTransform *)&v10 transform];
  long long v5 = v8;
  long long v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [(RhizomeLayeredFlowerView *)&v7 setTransform:v6];
  sub_1000112A8();
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1000119C0();

  NSString v3 = sub_10003A6E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC13RhizomePoster24RhizomeLayeredFlowerView)initWithFrame:(CGRect)a3
{
  result = (_TtC13RhizomePoster24RhizomeLayeredFlowerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000ED4C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower), *(void **)&self->context[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower], *(void **)&self->_flower[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower + 7], *(void **)&self->_flower[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower + 15]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  NSString v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView);
}

@end