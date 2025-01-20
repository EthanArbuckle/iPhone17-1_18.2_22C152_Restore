@interface _UIViewMarkerLayer
- (NSString)label;
- (UIColor)alternateColor;
- (_UIViewMarkerLayer)init;
- (_UIViewMarkerLayer)initWithCoder:(id)a3;
- (_UIViewMarkerLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
- (void)setAlternateColor:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation _UIViewMarkerLayer

- (NSString)label
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  uint64_t v4 = sub_186A1E95C();
  uint64_t v6 = v5;
  v7 = self;
  sub_185AD09F4(v4, v6);
}

- (UIColor)alternateColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____UIViewMarkerLayer_alternateColor));
}

- (void)setAlternateColor:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_alternateColor);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_alternateColor) = (Class)a3;
  id v6 = a3;
  uint64_t v5 = self;

  sub_185AD0B18();
}

- (_UIViewMarkerLayer)init
{
  return (_UIViewMarkerLayer *)sub_185AD0C5C();
}

- (_UIViewMarkerLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185AD1398();
}

- (_UIViewMarkerLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_186A1F1CC();
  swift_unknownObjectRelease();
  uint64_t v4 = [(_UIViewMarkerLayer *)self init];
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
  return v4;
}

- (void)layoutSublayers
{
  id v3 = self;
  double v2 = sub_185AD1094();
  objc_msgSend(*(id *)((char *)&v3->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_backgroundLayer), sel_setFrame_, 0.0, 0.0, v2, 16.0);
  objc_msgSend(*(id *)((char *)&v3->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_labelLayer), sel_setFrame_, 2.0, 2.0, v2, 12.0);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_alternateColor);
}

@end