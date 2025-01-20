@interface UIShape
+ (UIShape)capsuleShape;
+ (UIShape)circleShape;
+ (UIShape)fixedRectShapeWithRect:(CGRect)rect;
+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners;
+ (UIShape)rectShape;
+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius;
+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve;
+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners;
+ (UIShape)shapeWithBezierPath:(UIBezierPath *)path;
+ (UIShape)shapeWithProvider:(id)provider;
+ (id)_contentShape;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (UIResolvedShape)resolvedShapeInContext:(UIShapeResolutionContext *)context;
- (UIShape)init;
- (UIShape)shapeByApplyingInset:(CGFloat)inset;
- (UIShape)shapeByApplyingInsets:(UIEdgeInsets)insets;
- (UIShape)shapeWithBezierPath:(id)a3;
- (UIShape)shapeWithProvider:(id)a3;
- (id)_resolvedShapeInView:(id)a3;
@end

@implementation UIShape

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___UIShape_value;
  sub_185636BB4(*(void **)((char *)&self->super.isa + OBJC_IVAR___UIShape_value), *((void *)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6), v2[56]);
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius
{
  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  v5 = &v4[OBJC_IVAR___UIShape_value];
  v6 = *(void **)&v4[OBJC_IVAR___UIShape_value];
  uint64_t v7 = *(void *)&v4[OBJC_IVAR___UIShape_value + 8];
  uint64_t v8 = *(void *)&v4[OBJC_IVAR___UIShape_value + 16];
  uint64_t v9 = *(void *)&v4[OBJC_IVAR___UIShape_value + 24];
  uint64_t v10 = *(void *)&v4[OBJC_IVAR___UIShape_value + 32];
  uint64_t v11 = *(void *)&v4[OBJC_IVAR___UIShape_value + 40];
  uint64_t v12 = *(void *)&v4[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)v5 = cornerRadius;
  *(_OWORD *)(v5 + 8) = xmmword_186B91E40;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  char v13 = v5[56];
  v5[56] = 0;
  sub_185636BB4(v6, v7, v8, v9, v10, v11, v12, v13);
  return (UIShape *)v4;
}

- (UIShape)init
{
  v2 = (char *)self + OBJC_IVAR___UIShape_value;
  *(void *)v2 = 1;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  v2[56] = 6;
  v4.receiver = self;
  v4.super_class = (Class)UIShape;
  return [(UIShape *)&v4 init];
}

- (UIShape)shapeByApplyingInset:(CGFloat)inset
{
  objc_super v4 = self;
  v5 = sub_185636878(inset);

  return (UIShape *)v5;
}

+ (UIShape)capsuleShape
{
  return (UIShape *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, qword_1E8FAEF00, (void **)&qword_1E8FAEE10);
}

+ (UIShape)rectShape
{
  return (UIShape *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, qword_1E8FAF840, (void **)&qword_1E8FAF850);
}

+ (UIShape)circleShape
{
  return (UIShape *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, qword_1E8FAE568, (void **)&qword_1E8FAE658);
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve
{
  v6 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v7 = &v6[OBJC_IVAR___UIShape_value];
  uint64_t v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  uint64_t v9 = *(void *)&v6[OBJC_IVAR___UIShape_value + 8];
  uint64_t v10 = *(void *)&v6[OBJC_IVAR___UIShape_value + 16];
  uint64_t v11 = *(void *)&v6[OBJC_IVAR___UIShape_value + 24];
  uint64_t v12 = *(void *)&v6[OBJC_IVAR___UIShape_value + 32];
  uint64_t v13 = *(void *)&v6[OBJC_IVAR___UIShape_value + 40];
  uint64_t v14 = *(void *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)uint64_t v7 = cornerRadius;
  *((void *)v7 + 1) = cornerCurve;
  *((void *)v7 + 2) = -1;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  char v15 = v7[56];
  v7[56] = 0;
  sub_185636BB4(v8, v9, v10, v11, v12, v13, v14, v15);
  return (UIShape *)v6;
}

+ (UIShape)rectShapeWithCornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners
{
  uint64_t v8 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v9 = &v8[OBJC_IVAR___UIShape_value];
  uint64_t v10 = *(void **)&v8[OBJC_IVAR___UIShape_value];
  uint64_t v11 = *(void *)&v8[OBJC_IVAR___UIShape_value + 8];
  uint64_t v12 = *(void *)&v8[OBJC_IVAR___UIShape_value + 16];
  uint64_t v13 = *(void *)&v8[OBJC_IVAR___UIShape_value + 24];
  uint64_t v14 = *(void *)&v8[OBJC_IVAR___UIShape_value + 32];
  uint64_t v15 = *(void *)&v8[OBJC_IVAR___UIShape_value + 40];
  uint64_t v16 = *(void *)&v8[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)uint64_t v9 = cornerRadius;
  *((void *)v9 + 1) = cornerCurve;
  *((void *)v9 + 2) = maskedCorners;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  char v17 = v9[56];
  v9[56] = 0;
  sub_185636BB4(v10, v11, v12, v13, v14, v15, v16, v17);
  return (UIShape *)v8;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  uint64_t v7 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v8 = (CGFloat *)&v7[OBJC_IVAR___UIShape_value];
  uint64_t v9 = *(void **)&v7[OBJC_IVAR___UIShape_value];
  uint64_t v10 = *(void *)&v7[OBJC_IVAR___UIShape_value + 8];
  uint64_t v11 = *(void *)&v7[OBJC_IVAR___UIShape_value + 16];
  uint64_t v12 = *(void *)&v7[OBJC_IVAR___UIShape_value + 24];
  uint64_t v13 = *(void *)&v7[OBJC_IVAR___UIShape_value + 32];
  uint64_t v14 = *(void *)&v7[OBJC_IVAR___UIShape_value + 40];
  uint64_t v15 = *(void *)&v7[OBJC_IVAR___UIShape_value + 48];
  *uint64_t v8 = x;
  v8[1] = y;
  v8[2] = width;
  v8[3] = height;
  v8[4] = 0.0;
  v8[5] = 0.0;
  v8[6] = NAN;
  char v16 = *((unsigned char *)v8 + 56);
  *((unsigned char *)v8 + 56) = 1;
  sub_185636BB4(v9, v10, v11, v12, v13, v14, v15, v16);
  return (UIShape *)v7;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  uint64_t v9 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v10 = &v9[OBJC_IVAR___UIShape_value];
  uint64_t v11 = *(void **)&v9[OBJC_IVAR___UIShape_value];
  uint64_t v12 = *(void *)&v9[OBJC_IVAR___UIShape_value + 8];
  uint64_t v13 = *(void *)&v9[OBJC_IVAR___UIShape_value + 16];
  uint64_t v14 = *(void *)&v9[OBJC_IVAR___UIShape_value + 24];
  uint64_t v15 = *(void *)&v9[OBJC_IVAR___UIShape_value + 32];
  uint64_t v16 = *(void *)&v9[OBJC_IVAR___UIShape_value + 40];
  uint64_t v17 = *(void *)&v9[OBJC_IVAR___UIShape_value + 48];
  *(CGFloat *)uint64_t v10 = x;
  *((CGFloat *)v10 + 1) = y;
  *((CGFloat *)v10 + 2) = width;
  *((CGFloat *)v10 + 3) = height;
  *((CGFloat *)v10 + 4) = cornerRadius;
  *(_OWORD *)(v10 + 40) = xmmword_186B91E40;
  char v18 = v10[56];
  v10[56] = 1;
  sub_185636BB4(v11, v12, v13, v14, v15, v16, v17, v18);
  return (UIShape *)v9;
}

+ (UIShape)fixedRectShapeWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius cornerCurve:(UICornerCurve)cornerCurve maskedCorners:(UIRectCorner)maskedCorners
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  uint64_t v13 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v14 = (CGFloat *)&v13[OBJC_IVAR___UIShape_value];
  uint64_t v15 = *(void **)&v13[OBJC_IVAR___UIShape_value];
  uint64_t v16 = *(void *)&v13[OBJC_IVAR___UIShape_value + 8];
  uint64_t v17 = *(void *)&v13[OBJC_IVAR___UIShape_value + 16];
  uint64_t v18 = *(void *)&v13[OBJC_IVAR___UIShape_value + 24];
  uint64_t v19 = *(void *)&v13[OBJC_IVAR___UIShape_value + 32];
  uint64_t v20 = *(void *)&v13[OBJC_IVAR___UIShape_value + 40];
  uint64_t v21 = *(void *)&v13[OBJC_IVAR___UIShape_value + 48];
  *uint64_t v14 = x;
  v14[1] = y;
  v14[2] = width;
  v14[3] = height;
  v14[4] = cornerRadius;
  *((void *)v14 + 5) = cornerCurve;
  *((void *)v14 + 6) = maskedCorners;
  char v22 = *((unsigned char *)v14 + 56);
  *((unsigned char *)v14 + 56) = 1;
  sub_185636BB4(v15, v16, v17, v18, v19, v20, v21, v22);
  return (UIShape *)v13;
}

- (UIShape)shapeWithBezierPath:(id)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromObject());
  id v5 = a3;
  v6 = (UIShape *)objc_msgSend(v4, sel_init);
  uint64_t v7 = (char *)v6 + OBJC_IVAR___UIShape_value;
  uint64_t v8 = *(Class *)((char *)&v6->super.isa + OBJC_IVAR___UIShape_value);
  uint64_t v9 = *(void *)&v6->value[OBJC_IVAR___UIShape_value];
  uint64_t v10 = *(void *)&v6->value[OBJC_IVAR___UIShape_value + 8];
  uint64_t v11 = *(void *)&v6->value[OBJC_IVAR___UIShape_value + 16];
  uint64_t v12 = *(void *)&v6->value[OBJC_IVAR___UIShape_value + 24];
  uint64_t v13 = *(void *)&v6->value[OBJC_IVAR___UIShape_value + 32];
  uint64_t v14 = *(void *)&v6->value[OBJC_IVAR___UIShape_value + 40];
  *(void *)uint64_t v7 = a3;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  char v15 = v7[56];
  v7[56] = 2;
  sub_185636BB4(v8, v9, v10, v11, v12, v13, v14, v15);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (UIShape)shapeWithProvider:(id)a3
{
  ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB8660);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  id v6 = objc_allocWithZone(ObjCClassFromObject);
  swift_unknownObjectRetain_n();
  uint64_t v7 = (UIShape *)objc_msgSend(v6, sel_init);
  uint64_t v8 = (char *)v7 + OBJC_IVAR___UIShape_value;
  uint64_t v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___UIShape_value);
  uint64_t v10 = *(void *)&v7->value[OBJC_IVAR___UIShape_value];
  uint64_t v11 = *(void *)&v7->value[OBJC_IVAR___UIShape_value + 8];
  uint64_t v12 = *(void *)&v7->value[OBJC_IVAR___UIShape_value + 16];
  uint64_t v13 = *(void *)&v7->value[OBJC_IVAR___UIShape_value + 24];
  uint64_t v14 = *(void *)&v7->value[OBJC_IVAR___UIShape_value + 32];
  uint64_t v15 = *(void *)&v7->value[OBJC_IVAR___UIShape_value + 40];
  *(void *)uint64_t v8 = v5;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  char v16 = v8[56];
  v8[56] = 3;
  sub_185636BB4(v9, v10, v11, v12, v13, v14, v15, v16);
  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (UIResolvedShape)resolvedShapeInContext:(UIShapeResolutionContext *)context
{
  id v4 = context;
  uint64_t v5 = self;
  id v6 = sub_185B14DD0((uint64_t)v4);

  return (UIResolvedShape *)v6;
}

- (UIShape)shapeByApplyingInsets:(UIEdgeInsets)insets
{
  double right = insets.right;
  double bottom = insets.bottom;
  double left = insets.left;
  double top = insets.top;
  uint64_t v7 = self;
  uint64_t v8 = sub_185B14FCC(top, left, bottom, right);

  return (UIShape *)v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = UIShape.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIShape_value);
  uint64_t v3 = *(void *)&self->value[OBJC_IVAR___UIShape_value];
  uint64_t v4 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 8];
  uint64_t v5 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 16];
  uint64_t v6 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 24];
  uint64_t v7 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 32];
  uint64_t v8 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 40];
  char v9 = self->value[OBJC_IVAR___UIShape_value + 48];
  uint64_t v12 = self;
  sub_185636AFC(v2, v3, v4, v5, v6, v7, v8, v9);
  sub_185900394();
  sub_186A1E9FC();
  swift_bridgeObjectRelease();
  sub_185636BB4(v2, v3, v4, v5, v6, v7, v8, v9);

  uint64_t v10 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (NSString)debugDescription
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIShape_value);
  uint64_t v3 = *(void *)&self->value[OBJC_IVAR___UIShape_value];
  uint64_t v4 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 8];
  uint64_t v5 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 16];
  uint64_t v6 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 24];
  uint64_t v7 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 32];
  uint64_t v8 = *(void *)&self->value[OBJC_IVAR___UIShape_value + 40];
  char v9 = self->value[OBJC_IVAR___UIShape_value + 48];
  uint64_t v12 = self;
  sub_185636AFC(v2, v3, v4, v5, v6, v7, v8, v9);
  sub_185900394();
  sub_186A1E9FC();
  swift_bridgeObjectRelease();
  sub_185636BB4(v2, v3, v4, v5, v6, v7, v8, v9);

  uint64_t v10 = (void *)sub_186A1E92C();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (id)_resolvedShapeInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_185B15880(v4);

  return v6;
}

+ (id)_contentShape
{
  v2 = (char *)objc_msgSend(objc_allocWithZone((Class)UIShape), sel_init);
  uint64_t v3 = &v2[OBJC_IVAR___UIShape_value];
  id v4 = *(void **)&v2[OBJC_IVAR___UIShape_value];
  uint64_t v5 = *(void *)&v2[OBJC_IVAR___UIShape_value + 8];
  uint64_t v6 = *(void *)&v2[OBJC_IVAR___UIShape_value + 16];
  uint64_t v7 = *(void *)&v2[OBJC_IVAR___UIShape_value + 24];
  uint64_t v8 = *(void *)&v2[OBJC_IVAR___UIShape_value + 32];
  uint64_t v9 = *(void *)&v2[OBJC_IVAR___UIShape_value + 40];
  uint64_t v10 = *(void *)&v2[OBJC_IVAR___UIShape_value + 48];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((void *)v3 + 6) = 0;
  char v11 = v3[56];
  v3[56] = 6;
  sub_185636BB4(v4, v5, v6, v7, v8, v9, v10, v11);
  return v2;
}

+ (UIShape)shapeWithBezierPath:(UIBezierPath *)path
{
  id v4 = objc_allocWithZone((Class)UIShape);
  uint64_t v5 = path;
  uint64_t v6 = (char *)objc_msgSend(v4, sel_init);
  uint64_t v7 = &v6[OBJC_IVAR___UIShape_value];
  uint64_t v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  uint64_t v9 = *(void *)&v6[OBJC_IVAR___UIShape_value + 8];
  uint64_t v10 = *(void *)&v6[OBJC_IVAR___UIShape_value + 16];
  uint64_t v11 = *(void *)&v6[OBJC_IVAR___UIShape_value + 24];
  uint64_t v12 = *(void *)&v6[OBJC_IVAR___UIShape_value + 32];
  uint64_t v13 = *(void *)&v6[OBJC_IVAR___UIShape_value + 40];
  uint64_t v14 = *(void *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(void *)uint64_t v7 = path;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  char v15 = v7[56];
  v7[56] = 2;
  sub_185636BB4(v8, v9, v10, v11, v12, v13, v14, v15);

  return (UIShape *)v6;
}

+ (UIShape)shapeWithProvider:(id)provider
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E8FB8660);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = provider;
  id v5 = objc_allocWithZone((Class)UIShape);
  swift_unknownObjectRetain_n();
  uint64_t v6 = (char *)objc_msgSend(v5, sel_init);
  uint64_t v7 = &v6[OBJC_IVAR___UIShape_value];
  uint64_t v8 = *(void **)&v6[OBJC_IVAR___UIShape_value];
  uint64_t v9 = *(void *)&v6[OBJC_IVAR___UIShape_value + 8];
  uint64_t v10 = *(void *)&v6[OBJC_IVAR___UIShape_value + 16];
  uint64_t v11 = *(void *)&v6[OBJC_IVAR___UIShape_value + 24];
  uint64_t v12 = *(void *)&v6[OBJC_IVAR___UIShape_value + 32];
  uint64_t v13 = *(void *)&v6[OBJC_IVAR___UIShape_value + 40];
  uint64_t v14 = *(void *)&v6[OBJC_IVAR___UIShape_value + 48];
  *(void *)uint64_t v7 = v4;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  char v15 = v7[56];
  v7[56] = 3;
  sub_185636BB4(v8, v9, v10, v11, v12, v13, v14, v15);
  swift_unknownObjectRelease();
  return (UIShape *)v6;
}

@end