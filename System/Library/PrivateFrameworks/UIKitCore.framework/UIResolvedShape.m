@interface UIResolvedShape
- (CGRect)boundingRect;
- (NSString)debugDescription;
- (NSString)description;
- (UIBezierPath)path;
- (UIResolvedShape)init;
- (UIResolvedShape)shapeByApplyingInset:(CGFloat)inset;
- (UIResolvedShape)shapeByApplyingInsets:(UIEdgeInsets)insets;
- (UIShape)shape;
- (id)_shapeByClippingToShape:(id)a3;
- (id)_shapeByConvertingFromSpace:(id)a3 toSpace:(id)a4;
@end

@implementation UIResolvedShape

- (UIResolvedShape)init
{
  return (UIResolvedShape *)sub_185B177D0((char *)self, (uint64_t)a2, &OBJC_IVAR___UIResolvedShape_cachedShape, &OBJC_IVAR___UIResolvedShape_value, (objc_class **)off_1E52D44E8);
}

- (UIBezierPath)path
{
  v2 = self;
  id v3 = sub_185B15DE4();

  return (UIBezierPath *)v3;
}

- (UIShape)shape
{
  v2 = self;
  id v3 = sub_185B16008();

  return (UIShape *)v3;
}

- (CGRect)boundingRect
{
  v2 = (double *)((char *)self + OBJC_IVAR___UIResolvedShape_value);
  double v3 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 64];
  double v4 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  double v5 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 80];
  if (self->value[OBJC_IVAR___UIResolvedShape_value + 112])
  {
    double v6 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 64];
    double v3 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
    double v4 = *(double *)&self->value[OBJC_IVAR___UIResolvedShape_value + 80];
    double v5 = v2[12];
  }
  else
  {
    double v6 = v2[8];
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v6;
  return result;
}

- (UIResolvedShape)shapeByApplyingInsets:(UIEdgeInsets)insets
{
  double right = insets.right;
  double bottom = insets.bottom;
  double left = insets.left;
  double top = insets.top;
  v7 = self;
  v8 = sub_185B16164(top, left, bottom, right);

  return (UIResolvedShape *)v8;
}

- (UIResolvedShape)shapeByApplyingInset:(CGFloat)inset
{
  double v4 = self;
  double v5 = sub_185B1652C(inset);

  return (UIResolvedShape *)v5;
}

- (NSString)description
{
  *(_OWORD *)&v9[9] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  long long v2 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v8[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v8[5] = v2;
  *(_OWORD *)v9 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  long long v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v8[1] = v3;
  long long v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v8[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v8[3] = v4;
  double v5 = self;
  sub_185B18828((uint64_t)v8, (void (*)(void, void, void, void, void, void, void, void))sub_185636AFC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEBC);
  sub_186A1F38C();
  swift_bridgeObjectRelease();
  sub_185900CEC();
  sub_186A1E9FC();
  swift_bridgeObjectRelease();
  sub_185B18828((uint64_t)v8, (void (*)(void, void, void, void, void, void, void, void))sub_185636BB4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEB0);

  double v6 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)debugDescription
{
  *(_OWORD *)&v9[9] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  long long v2 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v8[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v8[5] = v2;
  *(_OWORD *)v9 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  long long v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v8[1] = v3;
  long long v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v8[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v8[3] = v4;
  double v5 = self;
  sub_185B18828((uint64_t)v8, (void (*)(void, void, void, void, void, void, void, void))sub_185636AFC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEBC);
  sub_186A1F38C();
  swift_bridgeObjectRelease();
  sub_185900CEC();
  sub_186A1E9FC();
  swift_bridgeObjectRelease();
  sub_185B18828((uint64_t)v8, (void (*)(void, void, void, void, void, void, void, void))sub_185636BB4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEB0);

  double v6 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 72];
  v6[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 56];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 88];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 97];
  long long v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIResolvedShape_value);
  v6[1] = v4;
  long long v5 = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 40];
  v6[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIResolvedShape_value + 24];
  v6[3] = v5;
  sub_185B18828((uint64_t)v6, (void (*)(void, void, void, void, void, void, void, void))sub_185636BB4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEB0);
}

- (id)_shapeByClippingToShape:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  double v6 = sub_185B17068((uint64_t)v4);

  return v6;
}

- (id)_shapeByConvertingFromSpace:(id)a3 toSpace:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_185B17218(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v8;
}

@end