void type metadata accessor for UIRectEdge(uint64_t a1)
{
  sub_10000563C(a1, &qword_100026CE0);
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
}

__n128 initializeWithCopy for PolygonPathCornerStep(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 initializeWithTake for ExtragalacticPosterData(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000055CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000055EC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_10000563C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005684(CGFloat a1, CGFloat a2)
{
  v9._countAndFlagsBits = 40;
  v9._object = (void *)0xE100000000000000;
  sub_100018A30(v9);
  type metadata accessor for UIRectCorner(0);
  sub_100018CC0();
  v10._countAndFlagsBits = 2633001;
  v10._object = (void *)0xE300000000000000;
  sub_100018A30(v10);
  v15.x = a1;
  v15.y = a2;
  uint64_t v4 = NSStringFromCGPoint(v15);
  uint64_t v5 = sub_1000189F0();
  v7 = v6;

  v11._countAndFlagsBits = v5;
  v11._object = v7;
  sub_100018A30(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 2633001;
  v12._object = (void *)0xE300000000000000;
  sub_100018A30(v12);
  v13._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 41;
  v14._object = (void *)0xE100000000000000;
  sub_100018A30(v14);
  return 0;
}

uint64_t sub_1000057AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005684(*(CGFloat *)(v1 + 8), *(CGFloat *)(v1 + 16));
  *a1 = result;
  a1[1] = v4;
  return result;
}

void *sub_1000057E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1000057EC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000057F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100005808@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10000581C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100005830(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100005860@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10000588C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000058B0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000058C4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1000058D8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1000058EC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100005900(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005914(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100005928(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10000593C()
{
  return *v0 == 0;
}

uint64_t sub_10000594C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100005964(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100005978@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005988(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100005994(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000059A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100005B84(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_1000059E8()
{
  return sub_100005A50(&qword_100026D08);
}

uint64_t sub_100005A1C()
{
  return sub_100005A50(&qword_100026D10);
}

uint64_t sub_100005A50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIRectEdge(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005A94()
{
  return sub_100005A50(&qword_100026D18);
}

uint64_t sub_100005AC8()
{
  return sub_100005A50(&qword_100026D20);
}

void *sub_100005AFC()
{
  return &protocol witness table for String;
}

unint64_t sub_100005B08(uint64_t a1)
{
  unint64_t result = sub_100005B30();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100005B30()
{
  unint64_t result = qword_100026D28;
  if (!qword_100026D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026D28);
  }
  return result;
}

uint64_t sub_100005B84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PolygonPathCornerStep(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t getEnumTagSinglePayload for PolygonPathCornerStep(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PolygonPathCornerStep(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PolygonPathCornerStep()
{
  return &type metadata for PolygonPathCornerStep;
}

uint64_t sub_100005C70()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for PolygonDescriptor()
{
  return self;
}

uint64_t sub_100005CCC()
{
  id v1 = [objc_allocWithZone((Class)UIBezierPath) init];
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return (uint64_t)v1;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = v2 + 32;
  char v7 = 1;
  while (2)
  {
    uint64_t v8 = v6 + 40 * v4;
    while (1)
    {
      uint64_t v9 = v4 + 1;
      if (v7) {
        break;
      }
      sub_10000605C(v8, (uint64_t)v22);
      sub_1000060C0(&qword_100026DE0);
      type metadata accessor for PolygonPathPointStep();
      if (swift_dynamicCast())
      {
        double v10 = *(double *)(v18 + 16);
        double v11 = *(double *)(v18 + 24);
        [v1 currentPoint];
        v25.x = v10;
        v25.y = v11;
        if (!CGPointEqualToPoint(v23, v25)) {
          objc_msgSend(v1, "addLineToPoint:", v10, v11);
        }
        swift_release();
      }
      else
      {
        sub_10000605C(v8, (uint64_t)v22);
        if (swift_dynamicCast())
        {
          if (v18 == 1)
          {
            double v13 = 4.71238898;
            double v12 = 3.14159265;
          }
          else if (v18 == 2)
          {
            double v13 = 0.0;
            double v12 = 4.71238898;
          }
          else
          {
            double v12 = 0.0;
            double v13 = 1.57079633;
            if (v18 != 8)
            {
              double v13 = 3.14159265;
              double v12 = 1.57079633;
            }
          }
          objc_msgSend(v1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, v20, v21, v12, v13);
        }
      }
      char v7 = 0;
      v8 += 40;
      ++v4;
      if (v3 == v9)
      {
        swift_bridgeObjectRelease();
        if (v5) {
          goto LABEL_23;
        }
        goto LABEL_26;
      }
    }
    sub_10000605C(v8, (uint64_t)v22);
    sub_1000060C0(&qword_100026DE0);
    type metadata accessor for PolygonPathPointStep();
    if (swift_dynamicCast())
    {
      objc_msgSend(v1, "moveToPoint:", *(double *)(v18 + 16), *(double *)(v18 + 24));
      swift_release();
      char v7 = 0;
      uint64_t v5 = v18;
      uint64_t v6 = v2 + 32;
      if (v3 - 1 != v4++) {
        continue;
      }
      swift_bridgeObjectRelease();
      uint64_t v5 = v18;
LABEL_23:
      swift_retain();
      [v1 currentPoint];
      double v15 = *(double *)(v5 + 16);
      double v16 = *(double *)(v5 + 24);
      v26.x = v15;
      v26.y = v16;
      if (!CGPointEqualToPoint(v24, v26)) {
        objc_msgSend(v1, "addLineToPoint:", v15, v16);
      }
      swift_release();
LABEL_26:
      [v1 closePath];
      swift_release();
      return (uint64_t)v1;
    }
    break;
  }
  uint64_t result = sub_100018D20();
  __break(1u);
  return result;
}

double sub_100006018()
{
  return *(double *)(*(void *)v0 + 16);
}

uint64_t sub_100006028()
{
  return sub_100005CCC();
}

double sub_10000604C()
{
  return *(double *)(*(void *)v0 + 48);
}

uint64_t sub_10000605C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000060C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_100006104(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  double v5 = a4.n128_f64[0];
  double v6 = a3.n128_f64[0];
  double v7 = a2.n128_f64[0];
  double v8 = a1.n128_f64[0];
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners + 8))
  {
    id v9 = objc_msgSend(self, "bezierPathWithRect:", a1.n128_f64[0], a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0]);
  }
  else
  {
    uint64_t v10 = *(void *)(v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners);
    a1.n128_u64[0] = *(void *)(v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius);
    a2.n128_u64[0] = a1.n128_u64[0];
    double v11 = nullsub_1(a1, a2, a3, a4);
    id v9 = objc_msgSend(self, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v10, v8, v7, v6, v5, v11, v12);
  }
  return v9;
}

id sub_100006220()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RectangleDescriptor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RectangleDescriptor()
{
  return self;
}

uint64_t sub_100006278(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  double v6 = *(double *)((char *)v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame + 16);
  double v5 = *(double *)((char *)v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame + 24);
  a2.n128_f64[0] = *(double *)((char *)v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration
                                          + 16)
                 * 0.5;
  double v7 = (void *)((char *)v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges);
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges + 8))
  {
    int v8 = 0;
    LODWORD(v9) = 0;
    a3.n128_f64[0] = v6 - a2.n128_f64[0] - a2.n128_f64[0];
    double v10 = v5 - a2.n128_f64[0];
LABEL_12:
    a4.n128_f64[0] = v10 - a2.n128_f64[0];
    goto LABEL_14;
  }
  uint64_t v11 = *v7;
  uint64_t v9 = ((unint64_t)*v7 >> 1) & 1;
  if ((v11 & 2) != 0)
  {
    double v12 = v6 + a2.n128_f64[0];
    if ((v11 & 8) != 0) {
      goto LABEL_5;
    }
  }
  else
  {
    double v12 = v6 - a2.n128_f64[0];
    if ((v11 & 8) != 0)
    {
LABEL_5:
      a3.n128_f64[0] = a2.n128_f64[0] + v12;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      double v10 = v5 + a2.n128_f64[0];
      if ((v11 & 4) == 0)
      {
        int v8 = 1;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  a3.n128_f64[0] = v12 - a2.n128_f64[0];
  if (v11) {
    goto LABEL_10;
  }
LABEL_6:
  double v10 = v5 - a2.n128_f64[0];
  if ((v11 & 4) == 0)
  {
    int v8 = 0;
    goto LABEL_12;
  }
LABEL_13:
  int v8 = v11 & 1;
  a4.n128_f64[0] = a2.n128_f64[0] + v10;
LABEL_14:
  if (v9) {
    a1.n128_f64[0] = -a2.n128_f64[0];
  }
  else {
    a1.n128_f64[0] = *(double *)((char *)v4
  }
                               + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration
                               + 16)
                   * 0.5;
  if (v8) {
    a2.n128_f64[0] = -a2.n128_f64[0];
  }
  nullsub_1(a1, a2, a3, a4);
  double v13 = *(uint64_t (**)(void))((swift_isaMask & *v4) + 0x88);
  return v13();
}

double sub_100006390()
{
  return *(double *)(*v0 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame);
}

uint64_t sub_1000063AC(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  return sub_100006278(a1, a2, a3, a4);
}

double sub_1000063D0()
{
  return *(double *)(*v0 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration);
}

id sub_1000063F0()
{
  id result = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:PRTimeFontIdentifierSoft weight:858.0];
  qword_100029B40 = (uint64_t)result;
  return result;
}

uint64_t sub_100006448()
{
  sub_1000060C0(&qword_100027590);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001A940;
  id v1 = (void *)PRTimeFontIdentifierSoft;
  id v2 = objc_allocWithZone((Class)PRTimeFontConfiguration);
  id v3 = v1;
  id v4 = [v2 initWithTimeFontIdentifier:v3 weight:276.0];

  *(void *)(v0 + 32) = v4;
  if (qword_100026C80 != -1) {
    swift_once();
  }
  double v5 = (void *)qword_100029B40;
  *(void *)(v0 + 40) = qword_100029B40;
  double v6 = (void *)PRTimeFontIdentifierRounded;
  id v7 = objc_allocWithZone((Class)PRTimeFontConfiguration);
  id v8 = v5;
  id v9 = v6;
  id v10 = [v7 initWithTimeFontIdentifier:v9 weight:858.0];

  *(void *)(v0 + 48) = v10;
  uint64_t v11 = (void *)PRTimeFontIdentifierStencil;
  id v12 = objc_allocWithZone((Class)PRTimeFontConfiguration);
  id v13 = v11;
  id v14 = [v12 initWithTimeFontIdentifier:v13 weight:858.0];

  *(void *)(v0 + 56) = v14;
  uint64_t result = sub_100018A90();
  qword_100029B48 = v0;
  return result;
}

id sub_1000065E0()
{
  CGFloat v1 = *(double *)(v0 + 48) * 0.5;
  v21.origin.CGFloat x = sub_1000067B4();
  CGRect v22 = CGRectInset(v21, v1, v1);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  CGFloat MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  v7.n128_u64[0] = CGRectGetMidX(v23);
  v8.n128_f64[0] = MidX;
  double v11 = nullsub_1(v8, v7, v9, v10);
  double v13 = v12;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v24) * 0.5;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (v13 <= CGRectGetMidY(v25))
  {
    id v19 = objc_msgSend(self, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, v14, 0.0, 6.28318531);
    return v19;
  }
  else
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v26);
    double v16 = asin((MaxY - v13) / v14);
    id v17 = [objc_allocWithZone((Class)UIBezierPath) init];
    objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, v14, v16, 3.14159265 - v16);
    [v17 closePath];
    return v17;
  }
}

double sub_100006798()
{
  return *(double *)v0;
}

double sub_1000067A8()
{
  return *(double *)(v0 + 32);
}

double sub_1000067B4()
{
  return 0.0;
}

__n128 initializeWithCopy for CircleDescriptor(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CircleDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CircleDescriptor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CircleDescriptor()
{
  return &type metadata for CircleDescriptor;
}

uint64_t sub_10000684C(char a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1)
  {
    sub_1000071B0();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    CGRect v22 = (objc_class *)type metadata accessor for RectangleDescriptor();
    CGRect v23 = (char *)objc_allocWithZone(v22);
    CGRect v24 = &v23[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
    *(void *)CGRect v24 = v15;
    *((void *)v24 + 1) = v17;
    *((void *)v24 + 2) = v19;
    *((void *)v24 + 3) = v21;
    CGRect v25 = &v23[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
    *(void *)CGRect v25 = 0;
    v25[8] = 1;
    *(void *)&v23[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
    CGRect v26 = (double *)&v23[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
    *CGRect v26 = a7;
    v26[1] = a8;
    v26[2] = a9;
    v27 = &v23[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
    *(void *)v27 = 9;
    v27[8] = 0;
    v46.receiver = v23;
    v46.super_class = v22;
    id v45 = objc_msgSendSuper2(&v46, "init");
    sub_1000060C0(&qword_100026F90);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_10001A9D0;
    uint64_t v48 = type metadata accessor for LetterURectangleDescriptor();
    v49 = &off_100021498;
    *(void *)&long long v47 = a2;
    uint64_t v29 = a3[3];
    uint64_t v30 = a3[4];
    sub_1000071C0(a3, v29);
    v31 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 40);
    id v32 = a2;
    uint64_t v33 = v31(v29, v30);
    sub_100007204(&v47, v28 + 32);
    *(void *)(v28 + 72) = v33;
    uint64_t v48 = (uint64_t)v22;
    v49 = &off_100021498;
    *(void *)&long long v47 = v45;
    uint64_t v34 = a3[3];
    uint64_t v35 = a3[4];
    sub_1000071C0(a3, v34);
    v36 = *(uint64_t (**)(uint64_t, uint64_t))(v35 + 32);
    id v37 = v45;
    uint64_t v38 = v36(v34, v35);
    sub_100007204(&v47, v28 + 80);
    *(void *)(v28 + 120) = v38;
  }
  else
  {
    sub_1000060C0(&qword_100026F90);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_10001A9C0;
    uint64_t v48 = type metadata accessor for LetterURectangleDescriptor();
    v49 = &off_100021498;
    *(void *)&long long v47 = a2;
    uint64_t v39 = a3[3];
    uint64_t v40 = a3[4];
    sub_1000071C0(a3, v39);
    v41 = *(uint64_t (**)(uint64_t, uint64_t))(v40 + 40);
    id v42 = a2;
    uint64_t v43 = v41(v39, v40);
    sub_100007204(&v47, v28 + 32);
    *(void *)(v28 + 72) = v43;
  }
  return v28;
}

uint64_t sub_100006B28()
{
  swift_bridgeObjectRelease();
  sub_1000070CC(v0 + 64);
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 121, 7);
}

uint64_t type metadata accessor for LetterUDescriptor()
{
  return self;
}

uint64_t sub_100006B94@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t result = sub_100006F40(*a1, *a2, a4);
  *a3 = result;
  return result;
}

uint64_t sub_100006BC4(char a1, void *a2, double a3, double a4, double a5, double a6, double a7)
{
  double v41 = a7 * 0.5;
  if (a1)
  {
    sub_1000071B0();
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    double v21 = a4 * 0.5;
    CGRect v22 = (void *)0xE400000000000000;
    uint64_t v23 = 1702195828;
  }
  else
  {
    sub_1000071B0();
    uint64_t v13 = v24;
    uint64_t v15 = v25;
    uint64_t v17 = v26;
    uint64_t v19 = v27;
    uint64_t v23 = 0x65736C6166;
    CGRect v22 = (void *)0xE500000000000000;
    uint64_t v20 = 3;
    double v21 = a3;
  }
  uint64_t v28 = (char *)objc_allocWithZone((Class)type metadata accessor for LetterURectangleDescriptor());
  uint64_t v29 = &v28[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *(void *)uint64_t v29 = v13;
  *((void *)v29 + 1) = v15;
  *((void *)v29 + 2) = v17;
  *((void *)v29 + 3) = v19;
  uint64_t v30 = &v28[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  v30[8] = 1;
  *(void *)uint64_t v30 = 0;
  *(double *)&v28[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = v21;
  v31 = (double *)&v28[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  double *v31 = a5;
  v31[1] = a6;
  v31[2] = a7;
  id v32 = &v28[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)id v32 = v20;
  v32[8] = 0;
  v45.receiver = v28;
  v45.super_class = (Class)type metadata accessor for RectangleDescriptor();
  id v33 = objc_msgSendSuper2(&v45, "init");
  LOBYTE(v28) = a1 & 1;
  uint64_t v34 = sub_10000684C(a1 & 1, v33, a2, a3, a4, v41, a5, a6, a7);
  *(void *)&v44[0] = 0;
  *((void *)&v44[0] + 1) = 0xE000000000000000;
  sub_100018C30(26);
  v46._countAndFlagsBits = 2633045;
  v46._object = (void *)0xE300000000000000;
  sub_100018A30(v46);
  v47._countAndFlagsBits = v23;
  v47._object = v22;
  sub_100018A30(v47);
  swift_bridgeObjectRelease();
  v48._countAndFlagsBits = 2633001;
  v48._object = (void *)0xE300000000000000;
  sub_100018A30(v48);
  v56.CGFloat width = a3;
  v56.CGFloat height = a4;
  uint64_t v35 = NSStringFromCGSize(v56);
  uint64_t v36 = sub_1000189F0();
  uint64_t v38 = v37;

  v49._countAndFlagsBits = v36;
  v49._object = v38;
  sub_100018A30(v49);
  swift_bridgeObjectRelease();
  v50._countAndFlagsBits = 2633001;
  v50._object = (void *)0xE300000000000000;
  sub_100018A30(v50);
  v51._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v51);
  swift_bridgeObjectRelease();
  v52._countAndFlagsBits = 2633001;
  v52._object = (void *)0xE300000000000000;
  sub_100018A30(v52);
  v53._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v53);
  swift_bridgeObjectRelease();
  v54._countAndFlagsBits = 2633001;
  v54._object = (void *)0xE300000000000000;
  sub_100018A30(v54);
  sub_1000071C0(a2, a2[3]);
  sub_100018DC0();
  v55._countAndFlagsBits = 41;
  v55._object = (void *)0xE100000000000000;
  sub_100018A30(v55);

  sub_10000605C((uint64_t)a2, (uint64_t)v44);
  type metadata accessor for LetterUDescriptor();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 120) = 0;
  *(double *)(v39 + 40) = a3;
  *(double *)(v39 + 48) = a4;
  *(double *)(v39 + 16) = a5;
  *(double *)(v39 + 24) = a6;
  *(double *)(v39 + 32) = a7;
  *(void *)(v39 + 56) = v34;
  *(void *)(v39 + 104) = 0;
  *(void *)(v39 + 112) = 0xE000000000000000;
  sub_100007204(v44, v39 + 64);
  *(unsigned char *)(v39 + 120) = (_BYTE)v28;
  sub_1000070CC((uint64_t)a2);
  return v39;
}

uint64_t sub_100006F40(uint64_t a1, uint64_t a2, double a3)
{
  sub_100018B80();
  double v7 = v6;
  double v9 = v8;
  sub_1000186A0();
  double v11 = v10;
  sub_1000186A0();
  double v13 = v12;
  sub_1000186A0();
  double v15 = v14;
  sub_10000605C(a1 + 64, (uint64_t)v22);
  sub_10000605C(a2 + 64, (uint64_t)v21);
  if (a3 <= 0.0)
  {
    uint64_t v17 = v22;
LABEL_6:
    sub_10000605C((uint64_t)v17, (uint64_t)v23);
    goto LABEL_7;
  }
  if (a3 >= 1.0)
  {
    uint64_t v17 = v21;
    goto LABEL_6;
  }
  v23[3] = &type metadata for InterpolatedColorProvider;
  v23[4] = sub_10000711C();
  uint64_t v16 = swift_allocObject();
  v23[0] = v16;
  sub_10000605C((uint64_t)v22, v16 + 16);
  sub_10000605C((uint64_t)v21, v16 + 56);
  *(double *)(v16 + 96) = a3;
LABEL_7:
  sub_1000070CC((uint64_t)v21);
  sub_1000070CC((uint64_t)v22);
  char v18 = *(unsigned char *)(a1 + 120);
  sub_10000605C((uint64_t)v23, (uint64_t)v22);
  uint64_t v19 = sub_100006BC4(v18, v22, v7, v9, v11, v13, v15);
  sub_1000070CC((uint64_t)v23);
  return v19;
}

uint64_t sub_1000070CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000711C()
{
  unint64_t result = qword_100026F88;
  if (!qword_100026F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026F88);
  }
  return result;
}

uint64_t sub_100007170()
{
  sub_1000070CC(v0 + 16);
  sub_1000070CC(v0 + 56);
  return _swift_deallocObject(v0, 104, 7);
}

void *sub_1000071C0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100007204(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000721C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for BannerDescriptor()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for BannerDescriptor.DrawingElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for BannerDescriptor.DrawingElement()
{
  return swift_release();
}

void *assignWithCopy for BannerDescriptor.DrawingElement(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for PathConfiguration(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BannerDescriptor.DrawingElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BannerDescriptor.DrawingElement(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BannerDescriptor.DrawingElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BannerDescriptor.DrawingElement()
{
  return &type metadata for BannerDescriptor.DrawingElement;
}

void sub_100007408(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView;
  double v5 = *(void **)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView);
  if (v5)
  {
    id v18 = *(id *)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView);
  }
  else
  {
    type metadata accessor for BackgroundContentView();
    id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    double v7 = *(void **)(v2 + v4);
    *(void *)(v2 + v4) = v6;
    id v18 = v6;

    double v5 = 0;
  }
  id v8 = v5;
  [a1 bounds];
  if (v9 > v10) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  if (v10 >= v9) {
    double v12 = v9;
  }
  else {
    double v12 = v10;
  }
  objc_msgSend(v18, "setFrame:");
  double v13 = (double *)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize);
  *double v13 = v12;
  v13[1] = v11;
  id v14 = [v18 superview];
  if (!v14) {
    goto LABEL_12;
  }
  double v15 = v14;
  sub_100007CA8();
  id v16 = a1;
  id v17 = v15;
  LOBYTE(v15) = sub_100018BB0();

  if ((v15 & 1) == 0) {
LABEL_12:
  }
    [a1 addSubview:v18];
  sub_100007CE8(&qword_1000270E0, (void (*)(uint64_t))type metadata accessor for ExtragalacticPosterController);
  swift_unknownObjectRetain();
  sub_100018860();
}

void sub_1000075BC()
{
  uint64_t v1 = sub_1000188D0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v25[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100018800();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView;
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView);
  if (!v10)
  {
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  double v11 = *(double *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize);
  double v12 = *(double *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize + 8);
  if (v11 > v12) {
    uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize);
  }
  else {
    uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize + 8);
  }
  if (v12 < v11) {
    double v11 = *(double *)(v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize + 8);
  }
  uint64_t v14 = v10 + OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize;
  *(double *)uint64_t v14 = v11;
  *(void *)(v14 + 8) = v13;
  double v15 = *(void **)(v0 + v9);
  if (!v15) {
    goto LABEL_14;
  }
  id v16 = [v15 superview];
  if (!v16) {
    goto LABEL_11;
  }
  id v17 = *(void **)(v0 + v9);
  if (v17)
  {
    id v18 = v16;
    id v19 = v17;
    [v18 center];
    objc_msgSend(v19, "setCenter:");

LABEL_11:
    uint64_t v20 = *(void **)(v0 + v9);
    if (v20)
    {
      uint64_t v21 = v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_colorProvider;
      swift_beginAccess();
      sub_10000605C(v21, (uint64_t)v26);
      uint64_t v22 = v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_rotationFrame;
      swift_beginAccess();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, v5);
      uint64_t v23 = v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_progress;
      swift_beginAccess();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v23, v1);
      id v24 = v20;
      sub_100016078((uint64_t)v26, (uint64_t)v8, (uint64_t)v4);

      (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1000070CC((uint64_t)v26);
      return;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
}

id sub_1000078A8()
{
  *(void *)&v0[OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView] = 0;
  uint64_t v1 = OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_rotationAnimator;
  sub_100018880();
  swift_allocObject();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_100018870();
  sub_1000187A0();
  *(CGSize *)&v2[OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_contentSize] = CGSizeZero;
  uint64_t v3 = (uint64_t *)&v2[OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_colorProvider];
  uint64_t v4 = type metadata accessor for ColorPalette();
  uint64_t v5 = swift_allocObject();
  *(_WORD *)(v5 + 16) = 0;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 24) = 0;
  v3[3] = v4;
  v3[4] = sub_100007CE8((unint64_t *)&qword_1000270F0, (void (*)(uint64_t))type metadata accessor for ColorPalette);
  *uint64_t v3 = v5;
  sub_1000188A0();

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ExtragalacticPosterController();
  return objc_msgSendSuper2(&v7, "init");
}

id sub_100007A28()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtragalacticPosterController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007B54()
{
  return type metadata accessor for ExtragalacticPosterController();
}

uint64_t type metadata accessor for ExtragalacticPosterController()
{
  uint64_t result = qword_1000270D0;
  if (!qword_1000270D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007BA8()
{
  uint64_t result = sub_100018800();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000188D0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

unint64_t sub_100007CA8()
{
  unint64_t result = qword_1000270E8;
  if (!qword_1000270E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000270E8);
  }
  return result;
}

uint64_t sub_100007CE8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007D30(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007D58(char a1, char a2, double a3, double a4, double a5, double a6, double a7)
{
  __double2 v13 = __sincos_stret(a4);
  if (a2) {
    double v14 = a3 / v13.__sinval;
  }
  else {
    double v14 = a5 - a3 / v13.__sinval;
  }
  double v15 = a3 / v13.__cosval + a3 * a7;
  sub_1000060C0(&qword_100027590);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10001ABB0;
  type metadata accessor for PolygonPathPointStep();
  uint64_t v17 = swift_allocObject();
  if (a1)
  {
    double v18 = a5 * 0.5;
    double v19 = a5 - v15;
    if (a2) {
      a3 = a6 - a3;
    }
    *(double *)(v17 + 16) = v18;
    *(double *)(v17 + 24) = v14;
    *(void *)(v16 + 32) = v17;
    uint64_t v20 = swift_allocObject();
    *(double *)(v20 + 16) = v19;
    *(double *)(v20 + 24) = a3;
    *(void *)(v16 + 40) = v20;
    uint64_t v21 = swift_allocObject();
    *(double *)(v21 + 16) = v15;
    *(double *)(v21 + 24) = a3;
  }
  else
  {
    double v22 = a6 * 0.5;
    double v23 = a6 - v15;
    if (a2) {
      a3 = a5 - a3;
    }
    *(double *)(v17 + 16) = v14;
    *(double *)(v17 + 24) = v22;
    *(void *)(v16 + 32) = v17;
    uint64_t v24 = swift_allocObject();
    *(double *)(v24 + 16) = a3;
    *(double *)(v24 + 24) = v23;
    *(void *)(v16 + 40) = v24;
    uint64_t v21 = swift_allocObject();
    *(double *)(v21 + 16) = a3;
    *(double *)(v21 + 24) = v15;
  }
  *(void *)(v16 + 48) = v21;
  sub_100018A90();
  return v16;
}

uint64_t type metadata accessor for IsoscelesTriangleDescriptor()
{
  return self;
}

uint64_t sub_100007EEC()
{
  swift_bridgeObjectRelease();
  sub_1000070CC(v0 + 64);
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 129, 7);
}

uint64_t type metadata accessor for LetterNHorizontalDescriptor()
{
  return self;
}

uint64_t sub_100007F58@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t result = sub_1000089E4(*a1, *a2, a4);
  *a3 = result;
  return result;
}

char *sub_100007F88(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000060C0(&qword_100026F90);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
      double v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[48 * v8 + 32]) {
          memmove(v12, a4 + 32, 48 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      double v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000080B0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000080B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100018D80();
  __break(1u);
  return result;
}

uint64_t sub_1000081A8(char a1, void *a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, double a7, double a8)
{
  double v123 = a6.n128_f64[0];
  double v10 = a5.n128_f64[0];
  unint64_t v11 = a4.n128_u64[0];
  double v12 = a3.n128_f64[0];
  a3.n128_u64[0] = 0;
  a4.n128_u64[0] = 0;
  a5.n128_f64[0] = a8;
  a6.n128_u64[0] = v11;
  double v13 = nullsub_1(a3, a4, a5, a6);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = (objc_class *)type metadata accessor for RectangleDescriptor();
  uint64_t v21 = (char *)objc_allocWithZone(v20);
  double v22 = (double *)&v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *double v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  double v23 = &v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  *(void *)double v23 = 0;
  v23[8] = 1;
  *(void *)&v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
  uint64_t v24 = (double *)&v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  *uint64_t v24 = v10;
  v24[1] = v123;
  v24[2] = a7;
  uint64_t v25 = &v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)uint64_t v25 = 5;
  v25[8] = 0;
  v125.receiver = v21;
  v125.super_class = v20;
  id v26 = objc_msgSendSuper2(&v125, "init");
  v27.n128_u64[0] = 0;
  v28.n128_u64[0] = 0;
  v29.n128_f64[0] = v12;
  double v121 = *(double *)&v11;
  v30.n128_u64[0] = v11;
  double v31 = nullsub_1(v27, v28, v29, v30);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v117 = v12;
  double v38 = v12 - a8;
  double v39 = a7 * 0.5 + v38 - v10 * 0.5 * a7;
  uint64_t v119 = type metadata accessor for ParallelogramDescriptor();
  swift_allocObject();
  double v40 = v35;
  double v41 = v10;
  uint64_t v120 = sub_100014B44(1, 0, 1, 1, v31, v33, v40, v37, v10, v123, a7, v39);
  sub_1000060C0(&qword_100026F90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001A9C0;
  v134 = v20;
  v135 = &off_100021498;
  *(void *)&long long v133 = v26;
  uint64_t v44 = a2[3];
  uint64_t v43 = a2[4];
  sub_1000071C0(a2, v44);
  objc_super v45 = *(uint64_t (**)(uint64_t, uint64_t))(v43 + 48);
  id v116 = v26;
  uint64_t v46 = v45(v44, v43);
  sub_100007204(&v133, inited + 32);
  *(void *)(inited + 72) = v46;
  if (a1)
  {
    double v51 = a8;
    v47.n128_f64[0] = v38 + a7;
    v48.n128_u64[0] = 0;
    v49.n128_f64[0] = a8;
    CGFloat v52 = v121;
    v50.n128_f64[0] = v121;
    double v53 = nullsub_1(v47, v48, v49, v50);
    uint64_t v55 = v54;
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    v60 = (char *)objc_allocWithZone(v20);
    v61 = (double *)&v60[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
    double *v61 = v53;
    *((void *)v61 + 1) = v55;
    *((void *)v61 + 2) = v57;
    *((void *)v61 + 3) = v59;
    v62 = &v60[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
    *(void *)v62 = 0;
    v62[8] = 1;
    *(void *)&v60[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
    v63 = (double *)&v60[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
    double *v63 = v41;
    v63[1] = v123;
    v63[2] = a7;
    v64 = &v60[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
    *(void *)v64 = 7;
    v64[8] = 0;
    v124.receiver = v60;
    v124.super_class = v20;
    id v65 = objc_msgSendSuper2(&v124, "init");
    uint64_t v130 = (uint64_t)v20;
    v131 = &off_100021498;
    *(void *)&long long v129 = v65;
    uint64_t v66 = a2[3];
    uint64_t v67 = a2[4];
    sub_1000071C0(a2, v66);
    v68 = *(uint64_t (**)(uint64_t, uint64_t))(v67 + 40);
    id v69 = v65;
    uint64_t v70 = v68(v66, v67);
    sub_100007204(&v129, (uint64_t)&v133);
    uint64_t v136 = v70;
    v71 = sub_100007F88((char *)1, 2, 1, (char *)inited);
    *((void *)v71 + 2) = 2;
    sub_100008BD0((uint64_t)&v133, (uint64_t)(v71 + 80));
    *((void *)&v127 + 1) = v119;
    *(void *)&long long v128 = &off_100021458;
    *(void *)&long long v126 = v120;
    uint64_t v72 = a2[3];
    uint64_t v73 = a2[4];
    sub_1000071C0(a2, v72);
    v74 = *(uint64_t (**)(uint64_t, uint64_t))(v73 + 32);
    swift_retain();
    uint64_t v75 = v74(v72, v73);
    sub_100007204(&v126, (uint64_t)&v129);
    uint64_t v132 = v75;
    sub_100008BD0((uint64_t)&v129, (uint64_t)&v126);
    unint64_t v77 = *((void *)v71 + 2);
    unint64_t v76 = *((void *)v71 + 3);
    if (v77 >= v76 >> 1) {
      v71 = sub_100007F88((char *)(v76 > 1), v77 + 1, 1, v71);
    }
    CGFloat v78 = v117;
    v79 = v116;
    *((void *)v71 + 2) = v77 + 1;
    v80 = &v71[48 * v77];
    long long v81 = v126;
    long long v82 = v128;
    *((_OWORD *)v80 + 3) = v127;
    *((_OWORD *)v80 + 4) = v82;
    *((_OWORD *)v80 + 2) = v81;
  }
  else
  {
    uint64_t v130 = v119;
    v131 = &off_100021458;
    *(void *)&long long v129 = v120;
    uint64_t v83 = a2[3];
    uint64_t v84 = a2[4];
    sub_1000071C0(a2, v83);
    v85 = *(uint64_t (**)(uint64_t, uint64_t))(v84 + 40);
    swift_retain();
    uint64_t v86 = v85(v83, v84);
    sub_100007204(&v129, (uint64_t)&v133);
    uint64_t v136 = v86;
    v71 = sub_100007F88((char *)1, 2, 1, (char *)inited);
    *((void *)v71 + 2) = 2;
    sub_100008BD0((uint64_t)&v133, (uint64_t)(v71 + 80));
    CGFloat v52 = v121;
    double v51 = a8;
    v87.n128_f64[0] = v121 / v39 * a8;
    v88.n128_f64[0] = -a7;
    v89.n128_f64[0] = a8 - a7;
    v90.n128_u64[0] = 0;
    double v91 = nullsub_1(v90, v88, v89, v87);
    double v93 = v92;
    double v95 = v94;
    double v97 = v96;
    uint64_t v98 = type metadata accessor for RightTriangleDescriptor();
    swift_allocObject();
    uint64_t v99 = sub_100018018(1, 1, 1, v91, v93, v95, v97, v41, v123, a7);
    *((void *)&v127 + 1) = v98;
    *(void *)&long long v128 = &off_100021458;
    *(void *)&long long v126 = v99;
    uint64_t v100 = a2[3];
    uint64_t v101 = a2[4];
    sub_1000071C0(a2, v100);
    v102 = *(uint64_t (**)(uint64_t, uint64_t))(v101 + 32);
    swift_retain();
    uint64_t v103 = v102(v100, v101);
    sub_100007204(&v126, (uint64_t)&v129);
    uint64_t v132 = v103;
    sub_100008BD0((uint64_t)&v129, (uint64_t)&v126);
    unint64_t v105 = *((void *)v71 + 2);
    unint64_t v104 = *((void *)v71 + 3);
    if (v105 >= v104 >> 1) {
      v71 = sub_100007F88((char *)(v104 > 1), v105 + 1, 1, v71);
    }
    CGFloat v78 = v117;
    v79 = v116;
    *((void *)v71 + 2) = v105 + 1;
    v106 = &v71[48 * v105];
    long long v107 = v126;
    long long v108 = v128;
    *((_OWORD *)v106 + 3) = v127;
    *((_OWORD *)v106 + 4) = v108;
    *((_OWORD *)v106 + 2) = v107;
    swift_release();
  }
  sub_100008C2C((uint64_t)&v129);
  sub_100008C2C((uint64_t)&v133);
  *(void *)&long long v133 = 0;
  *((void *)&v133 + 1) = 0xE000000000000000;
  sub_100018C30(31);
  v137._countAndFlagsBits = 0x6E6F7A69726F484ELL;
  v137._object = (void *)0xED0000282D6C6174;
  sub_100018A30(v137);
  v145.CGFloat width = v78;
  v145.CGFloat height = v52;
  v109 = NSStringFromCGSize(v145);
  uint64_t v110 = sub_1000189F0();
  v112 = v111;

  v138._countAndFlagsBits = v110;
  v138._object = v112;
  sub_100018A30(v138);
  swift_bridgeObjectRelease();
  v139._countAndFlagsBits = 2633001;
  v139._object = (void *)0xE300000000000000;
  sub_100018A30(v139);
  v140._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v140);
  swift_bridgeObjectRelease();
  v141._countAndFlagsBits = 2633001;
  v141._object = (void *)0xE300000000000000;
  sub_100018A30(v141);
  v142._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v142);
  swift_bridgeObjectRelease();
  v143._countAndFlagsBits = 2633001;
  v143._object = (void *)0xE300000000000000;
  sub_100018A30(v143);
  sub_1000071C0(a2, a2[3]);
  sub_100018DC0();
  v144._countAndFlagsBits = 41;
  v144._object = (void *)0xE100000000000000;
  sub_100018A30(v144);

  swift_release();
  long long v113 = v133;
  sub_10000605C((uint64_t)a2, (uint64_t)&v133);
  type metadata accessor for LetterNHorizontalDescriptor();
  uint64_t v114 = swift_allocObject();
  *(void *)(v114 + 112) = *((void *)&v113 + 1);
  *(void *)(v114 + 120) = 0;
  *(unsigned char *)(v114 + 128) = 0;
  *(CGFloat *)(v114 + 40) = v78;
  *(CGFloat *)(v114 + 48) = v52;
  *(double *)(v114 + 16) = v41;
  *(double *)(v114 + 24) = v123;
  *(double *)(v114 + 32) = a7;
  *(void *)(v114 + 56) = v71;
  *(void *)(v114 + 104) = v113;
  sub_100007204(&v133, v114 + 64);
  *(double *)(v114 + 120) = v51;
  *(unsigned char *)(v114 + 128) = a1 & 1;
  sub_1000070CC((uint64_t)a2);
  return v114;
}

uint64_t sub_1000089E4(uint64_t a1, uint64_t a2, double a3)
{
  sub_100018B80();
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  sub_1000186A0();
  unint64_t v11 = v10;
  sub_1000186A0();
  unint64_t v13 = v12;
  sub_1000186A0();
  double v15 = v14;
  sub_10000605C(a1 + 64, (uint64_t)v28);
  sub_10000605C(a2 + 64, (uint64_t)v27);
  if (a3 <= 0.0)
  {
    uint64_t v17 = v28;
LABEL_6:
    sub_10000605C((uint64_t)v17, (uint64_t)v29);
    goto LABEL_7;
  }
  if (a3 >= 1.0)
  {
    uint64_t v17 = v27;
    goto LABEL_6;
  }
  v29[3] = &type metadata for InterpolatedColorProvider;
  v29[4] = sub_10000711C();
  uint64_t v16 = swift_allocObject();
  v29[0] = v16;
  sub_10000605C((uint64_t)v28, v16 + 16);
  sub_10000605C((uint64_t)v27, v16 + 56);
  *(double *)(v16 + 96) = a3;
LABEL_7:
  sub_1000070CC((uint64_t)v27);
  sub_1000070CC((uint64_t)v28);
  sub_1000186A0();
  double v19 = v18;
  char v20 = *(unsigned char *)(a2 + 128);
  sub_10000605C((uint64_t)v29, (uint64_t)v28);
  v21.n128_u64[0] = v7;
  v22.n128_u64[0] = v9;
  v23.n128_u64[0] = v11;
  v24.n128_u64[0] = v13;
  uint64_t v25 = sub_1000081A8(v20, v28, v21, v22, v23, v24, v15, v19);
  sub_1000070CC((uint64_t)v29);
  return v25;
}

uint64_t sub_100008B90()
{
  sub_1000070CC(v0 + 16);
  sub_1000070CC(v0 + 56);
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_100008BD0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008C2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008C84()
{
  uint64_t v0 = sub_100018780();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v10 - v5;
  sub_100018790();
  sub_100018760();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for PosterLayout.LayoutType.maglev(_:), v0);
  char v7 = sub_100018770();
  unint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
  byte_100029B70 = v7 & 1;
  return result;
}

id sub_100008DD0(double a1)
{
  double v20 = 0.0;
  double v18 = 0.0;
  double v19 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v2 = a1 / 100.0;
  if ([v1 getHue:&v19 saturation:&v18 brightness:&v17 alpha:&v20])
  {
    double v3 = v17 + v2 * v17;
    if (v3 > 1.0) {
      double v3 = 1.0;
    }
    if (v3 > 0.0) {
      double v4 = v3;
    }
    else {
      double v4 = 0.0;
    }
    return [objc_allocWithZone((Class)UIColor) initWithHue:v19 saturation:v18 brightness:v4 alpha:v20];
  }
  else if ([v12 getRed:&v16 green:&v15 blue:&v14 alpha:&v20])
  {
    double v6 = v16 + v2 * v16;
    if (v6 <= 0.0) {
      double v6 = 0.0;
    }
    if (v6 <= 1.0) {
      double v7 = v6;
    }
    else {
      double v7 = 1.0;
    }
    double v8 = v15 + v2 * v15;
    if (v8 <= 0.0) {
      double v8 = 0.0;
    }
    if (v8 <= 1.0) {
      double v9 = v8;
    }
    else {
      double v9 = 1.0;
    }
    double v10 = v14 + v2 * v14;
    if (v10 <= 0.0) {
      double v10 = 0.0;
    }
    if (v10 <= 1.0) {
      double v11 = v10;
    }
    else {
      double v11 = 1.0;
    }
    return [objc_allocWithZone((Class)UIColor) initWithRed:v7 green:v9 blue:v11 alpha:v20];
  }
  else if ([v12 getWhite:&v13 alpha:&v20])
  {
    return [objc_allocWithZone((Class)UIColor) initWithWhite:v13 + v2 * v13 alpha:v20];
  }
  else
  {
    return v12;
  }
}

uint64_t CGPoint.description.getter()
{
  return sub_100009040((uint64_t (*)(void))&_NSStringFromCGPoint);
}

uint64_t sub_100009010(uint64_t a1, uint64_t a2)
{
  return sub_1000090A8(a1, a2, (uint64_t (*)(double, double))&_NSStringFromCGPoint);
}

uint64_t CGSize.description.getter()
{
  return sub_100009040((uint64_t (*)(void))&_NSStringFromCGSize);
}

uint64_t sub_100009040(uint64_t (*a1)(void))
{
  id v1 = (id)a1();
  uint64_t v2 = sub_1000189F0();

  return v2;
}

uint64_t sub_100009090(uint64_t a1, uint64_t a2)
{
  return sub_1000090A8(a1, a2, (uint64_t (*)(double, double))&_NSStringFromCGSize);
}

uint64_t sub_1000090A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(double, double))
{
  id v4 = (id)a3(*v3, v3[1]);
  uint64_t v5 = sub_1000189F0();

  return v5;
}

uint64_t sub_1000090FC(uint64_t a1)
{
  return sub_100009160(a1, qword_100029B78);
}

uint64_t sub_10000911C(uint64_t a1)
{
  return sub_100009160(a1, qword_100029B90);
}

uint64_t sub_10000913C(uint64_t a1)
{
  return sub_100009160(a1, qword_100029BA8);
}

uint64_t sub_100009160(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100018920();
  sub_1000091D8(v3, a2);
  sub_10000923C(v3, (uint64_t)a2);
  return sub_100018910();
}

uint64_t *sub_1000091D8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000923C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100009274()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for PolygonPathPointStep()
{
  return self;
}

void sub_1000092A8(uint64_t *a1@<X8>)
{
  uint64_t v3 = NSStringFromCGPoint((*v1)[1]);
  uint64_t v4 = sub_1000189F0();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

unint64_t sub_1000092FC(uint64_t a1)
{
  unint64_t result = sub_100009324();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100009324()
{
  unint64_t result = qword_1000273C8;
  if (!qword_1000273C8)
  {
    type metadata accessor for PolygonPathPointStep();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000273C8);
  }
  return result;
}

uint64_t sub_100009378(void *a1, CGFloat a2, CGFloat a3, double a4, double a5, double a6, double a7)
{
  uint64_t v8 = v7;
  double v74 = 0.0;
  double v75 = -2.68156159e154;
  sub_100018C30(24);
  uint64_t v77 = 0;
  unint64_t v78 = 0xE000000000000000;
  v79._countAndFlagsBits = 0x282D4E41424CLL;
  v79._object = (void *)0xE600000000000000;
  sub_100018A30(v79);
  sub_1000071C0(a1, a1[3]);
  sub_100018DC0();
  v80._countAndFlagsBits = 2633001;
  v80._object = (void *)0xE300000000000000;
  sub_100018A30(v80);
  v86.CGFloat width = a2;
  CGFloat v73 = a2;
  v86.CGFloat height = a3;
  double v16 = NSStringFromCGSize(v86);
  uint64_t v17 = sub_1000189F0();
  double v19 = v18;

  v81._countAndFlagsBits = v17;
  v81._object = v19;
  sub_100018A30(v81);
  swift_bridgeObjectRelease();
  v82._countAndFlagsBits = 2633001;
  v82._object = (void *)0xE300000000000000;
  sub_100018A30(v82);
  v83._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v83);
  swift_bridgeObjectRelease();
  v84._countAndFlagsBits = 2633001;
  v84._object = (void *)0xE300000000000000;
  sub_100018A30(v84);
  double v69 = a5;
  double v74 = a5;
  double v75 = a6;
  double v76 = a7;
  sub_100018CC0();
  v85._countAndFlagsBits = 41;
  v85._object = (void *)0xE100000000000000;
  sub_100018A30(v85);
  v20.n128_f64[0] = a3 * a4;
  CGFloat v21 = a2 * 0.5;
  v22.n128_f64[0] = a2 * 0.5 * 0.333333333 + a7 * 0.5;
  v23.n128_f64[0] = a3 + a7;
  double v25 = nullsub_1(v22, v23, v20, v24);
  double v27 = v26;
  sub_10000605C((uint64_t)a1, (uint64_t)&v74);
  uint64_t v28 = sub_100006BC4(0, &v74, v25, v27, v69, a6, a7);
  v29.n128_f64[0] = a7 * 0.5 + v21 - v25;
  v30.n128_f64[0] = v27;
  double v33 = nullsub_1(v29, v30, v31, v32);
  unint64_t v35 = v34;
  v36.n128_f64[0] = v25 - a7 + 0.0;
  v37.n128_f64[0] = a3 * a4;
  double v40 = nullsub_1(v36, v37, v38, v39);
  uint64_t v71 = v41;
  double v72 = v40;
  sub_10000605C((uint64_t)a1, (uint64_t)&v74);
  v42.n128_f64[0] = v33;
  v43.n128_u64[0] = v35;
  v44.n128_f64[0] = v69;
  v45.n128_f64[0] = a6;
  unint64_t v46 = *(void *)&a6;
  uint64_t v47 = sub_1000081A8(1, &v74, v42, v43, v44, v45, a7, v21 * 0.333333333 + a7);
  v48.n128_f64[0] = v21 + a7 * 0.5;
  v49.n128_f64[0] = -(a3 * a4) - a7;
  double v70 = nullsub_1(v48, v49, v50, v51);
  uint64_t v53 = v52;
  v54.n128_f64[0] = v21;
  v55.n128_f64[0] = a3 + a7;
  double v58 = nullsub_1(v54, v55, v56, v57);
  unint64_t v60 = *(void *)&v59;
  double v61 = v59 / 3.0 - a7 * 0.5;
  sub_10000605C((uint64_t)a1, (uint64_t)&v74);
  v62.n128_f64[0] = v58;
  v63.n128_u64[0] = v60;
  v64.n128_f64[0] = v69;
  v65.n128_u64[0] = v46;
  uint64_t v66 = sub_100012CF4(&v74, v62, v63, v64, v65, a7, v58 / 3.0, v61);
  sub_1000060C0((uint64_t *)&unk_1000274D0);
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_10001ADA0;
  *(void *)(v67 + 32) = v47;
  *(double *)(v67 + 40) = v72;
  *(void *)(v67 + 48) = v71;
  *(void *)(v67 + 56) = v66;
  *(double *)(v67 + 64) = v70;
  *(void *)(v67 + 72) = v53;
  *(void *)(v67 + 80) = v28;
  *(void *)(v67 + 88) = 0;
  *(CGFloat *)(v67 + 96) = a3 * a4;
  *(CGFloat *)(v8 + 16) = v73;
  *(CGFloat *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = v67;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0xE000000000000000;
  sub_1000070CC((uint64_t)a1);
  return v8;
}

uint64_t type metadata accessor for ExtragalacticLandscapeBannerDescriptor()
{
  return self;
}

id sub_100009728()
{
  uint64_t v1 = OBJC_IVAR____TtC19ExtragalacticPoster25ExtragalacticPosterEditor_controllers;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_10001586C((uint64_t)&_swiftEmptyArrayStorage);

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for ExtragalacticPosterEditor();
  id v3 = objc_msgSendSuper2(&v11, "init");
  uint64_t v4 = qword_100026C98;
  id v5 = v3;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100018920();
  sub_10000923C(v6, (uint64_t)qword_100029B78);
  uint64_t v7 = sub_100018900();
  os_log_type_t v8 = sub_100018B30();
  if (os_log_type_enabled(v7, v8))
  {
    double v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "PosterEditor created", v9, 2u);
    swift_slowDealloc();
  }

  return v5;
}

uint64_t sub_10000987C(uint64_t a1, void *a2, void *a3)
{
  swift_getObjectType();
  uint64_t v6 = (uint64_t *)(v3 + OBJC_IVAR____TtC19ExtragalacticPoster25ExtragalacticPosterEditor_controllers);
  swift_beginAccess();
  uint64_t v7 = *v6;
  id v8 = a3;
  swift_bridgeObjectRetain();
  id v9 = sub_100009A30(v8, v7);

  swift_bridgeObjectRelease();
  if (!v9)
  {
    id v10 = [objc_allocWithZone((Class)type metadata accessor for ExtragalacticPosterController()) init];
    swift_beginAccess();
    id v11 = v8;
    id v9 = v10;
    sub_10000A0C8((uint64_t)v9, v11);
    swift_endAccess();
  }
  id v12 = [a2 backgroundView];
  sub_100007408(v12);
  sub_100009AF8(v16);
  sub_10000605C((uint64_t)v16, (uint64_t)v15);
  uint64_t v13 = (uint64_t)v9 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_colorProvider;
  swift_beginAccess();
  sub_1000070CC(v13);
  sub_100007204(v15, v13);
  swift_endAccess();
  if ((sub_100018840() & 1) == 0) {
    sub_1000075BC();
  }

  return sub_1000070CC((uint64_t)v16);
}

void *sub_100009A30(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100016CC0((uint64_t)a1);
      if (v7)
      {
        id v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_100018CF0();

  if (!v4) {
    return 0;
  }
  type metadata accessor for ExtragalacticPosterController();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

unint64_t sub_100009AF8@<X0>(uint64_t *a1@<X8>)
{
  sub_1000060C0((uint64_t *)&unk_100027570);
  sub_100018830();
  if (!v8)
  {
    uint64_t v6 = type metadata accessor for ColorPalette();
    uint64_t v5 = swift_allocObject();
    *(_WORD *)(v5 + 16) = 0;
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 40) = 0;
    *(void *)(v5 + 24) = 0;
    a1[3] = v6;
    goto LABEL_5;
  }
  unint64_t result = sub_100010A74(v7, v8);
  if (result != 10)
  {
    char v3 = result;
    uint64_t v4 = type metadata accessor for ColorPalette();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 40) = 0;
    *(void *)(v5 + 24) = 0;
    *(unsigned char *)(v5 + 16) = v3;
    *(unsigned char *)(v5 + 17) = 0;
    a1[3] = v4;
LABEL_5:
    unint64_t result = sub_10000A17C();
    a1[4] = result;
    *a1 = v5;
    return result;
  }
  __break(1u);
  return result;
}

id sub_10000A060()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtragalacticPosterEditor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExtragalacticPosterEditor()
{
  return self;
}

uint64_t sub_10000A0C8(uint64_t a1, void *a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_100018CE0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *char v3 = sub_10000A1D4(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  *char v3 = 0x8000000000000000;
  sub_1000178EC(a1, a2, isUniquelyReferenced_nonNull_native);
  *char v3 = v10;
  return swift_bridgeObjectRelease();
}

unint64_t sub_10000A17C()
{
  unint64_t result = qword_1000270F0;
  if (!qword_1000270F0)
  {
    type metadata accessor for ColorPalette();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000270F0);
  }
  return result;
}

Swift::Int sub_10000A1D4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000060C0(&qword_100027580);
    uint64_t v2 = sub_100018D60();
    uint64_t v18 = v2;
    sub_100018CD0();
    uint64_t v3 = sub_100018D00();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_10000B9B8(0, (unint64_t *)&qword_100027588);
      do
      {
        swift_dynamicCast();
        type metadata accessor for ExtragalacticPosterController();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_100017344(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_100018BA0(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_100018D00();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

void sub_10000A410(void *a1, void *a2)
{
  uint64_t v5 = (unint64_t *)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster25ExtragalacticPosterEditor_controllers);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if ((v6 & 0xC000000000000001) != 0)
  {
    unint64_t v29 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = sub_100018CD0() | 0x8000000000000000;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(v6 + 32);
    uint64_t v7 = ~v10;
    unint64_t v29 = v6 + 64;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v8 = v12 & *(void *)(v6 + 64);
    unint64_t v9 = v6;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  int64_t v28 = (unint64_t)(v7 + 64) >> 6;
  while ((v9 & 0x8000000000000000) != 0)
  {
    if (!sub_100018D00()) {
      goto LABEL_34;
    }
    sub_10000B9B8(0, (unint64_t *)&qword_100027588);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v17 = v30;
    swift_unknownObjectRelease();
    type metadata accessor for ExtragalacticPosterController();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v18 = v30;
    swift_unknownObjectRelease();
    uint64_t v16 = v13;
    uint64_t v14 = v8;
    if (!v30) {
      goto LABEL_34;
    }
LABEL_30:
    sub_10000B9B8(0, &qword_1000275B8);
    id v24 = [a1 currentLook];
    char v25 = sub_100018BB0();

    double v26 = 0;
    if (v25)
    {
      id v27 = a2;
      double v26 = a2;
    }
    if ((sub_100018840() & 1) == 0) {
      sub_1000075BC();
    }

    uint64_t v13 = v16;
    unint64_t v8 = v14;
  }
  if (v8)
  {
    uint64_t v14 = (v8 - 1) & v8;
    unint64_t v15 = __clz(__rbit64(v8)) | (v13 << 6);
    uint64_t v16 = v13;
LABEL_29:
    uint64_t v22 = 8 * v15;
    __n128 v23 = *(void **)(*(void *)(v9 + 56) + v22);
    id v17 = *(id *)(*(void *)(v9 + 48) + v22);
    id v18 = v23;
    if (!v17) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  int64_t v19 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v19 >= v28) {
      goto LABEL_34;
    }
    unint64_t v20 = *(void *)(v29 + 8 * v19);
    uint64_t v16 = v13 + 1;
    if (!v20)
    {
      uint64_t v16 = v13 + 2;
      if (v13 + 2 >= v28) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v29 + 8 * v16);
      if (!v20)
      {
        uint64_t v16 = v13 + 3;
        if (v13 + 3 >= v28) {
          goto LABEL_34;
        }
        unint64_t v20 = *(void *)(v29 + 8 * v16);
        if (!v20)
        {
          uint64_t v16 = v13 + 4;
          if (v13 + 4 >= v28) {
            goto LABEL_34;
          }
          unint64_t v20 = *(void *)(v29 + 8 * v16);
          if (!v20)
          {
            uint64_t v21 = v13 + 5;
            while (v28 != v21)
            {
              unint64_t v20 = *(void *)(v29 + 8 * v21++);
              if (v20)
              {
                uint64_t v16 = v21 - 1;
                goto LABEL_28;
              }
            }
LABEL_34:
            sub_10000B8A0();
            return;
          }
        }
      }
    }
LABEL_28:
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t sub_10000A774(void *a1, uint64_t a2)
{
  id v4 = [a1 currentLook];
  id v5 = [v4 identifier];

  unint64_t v6 = (void *)sub_1000189F0();
  unint64_t v8 = v7;

  swift_bridgeObjectRetain();
  if (sub_100010A74((uint64_t)v6, v8) == 10)
  {
    swift_bridgeObjectRelease();
    unint64_t v6 = 0;
    unint64_t v8 = 0;
  }
  v22[0] = v6;
  v22[1] = v8;
  sub_1000060C0(&qword_1000275A0);
  sub_10000B8A8();
  unint64_t v9 = sub_1000189B0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(objc_msgSend(a1, "environment"), "targetConfiguration");
  swift_unknownObjectRelease();
  if (v9)
  {
    v11.super.isa = sub_100018990().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v11.super.isa = 0;
  }
  v22[0] = 0;
  unsigned int v12 = [v10 storeUserInfo:v11.super.isa error:v22];

  if (v12)
  {
    id v13 = v22[0];
  }
  else
  {
    id v14 = v22[0];
    sub_100018690();

    swift_willThrow();
    if (qword_100026C98 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100018920();
    sub_10000923C(v15, (uint64_t)qword_100029B78);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v16 = sub_100018900();
    os_log_type_t v17 = sub_100018B50();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      v22[0] = (id)swift_slowAlloc();
      *(_DWORD *)id v18 = 136315138;
      swift_getErrorValue();
      uint64_t v19 = sub_100018E00();
      sub_1000100B8(v19, v20, (uint64_t *)v22);
      sub_100018BC0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Could not save to environment: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_10000AB10()
{
  uint64_t v1 = v0;
  if (qword_100026C98 != -1) {
LABEL_39:
  }
    swift_once();
  uint64_t v2 = sub_100018920();
  sub_10000923C(v2, (uint64_t)qword_100029B78);
  uint64_t v3 = sub_100018900();
  os_log_type_t v4 = sub_100018B30();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "PosterEditor invalidated", v5, 2u);
    swift_slowDealloc();
  }

  unint64_t v6 = (unint64_t *)((char *)v1 + OBJC_IVAR____TtC19ExtragalacticPoster25ExtragalacticPosterEditor_controllers);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if ((*v6 & 0xC000000000000001) != 0)
  {
    unint64_t v28 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = sub_100018CD0() | 0x8000000000000000;
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(v7 + 32);
    uint64_t v8 = ~v11;
    unint64_t v28 = v7 + 64;
    uint64_t v12 = -v11;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & *(void *)(v7 + 64);
    unint64_t v10 = v7;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  int64_t v15 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v1 = &OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView;
  while ((v10 & 0x8000000000000000) != 0)
  {
    if (!sub_100018D00()) {
      return sub_10000B8A0();
    }
    swift_unknownObjectRelease();
    type metadata accessor for ExtragalacticPosterController();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v19 = v29;
    swift_unknownObjectRelease();
    uint64_t v18 = v14;
    uint64_t v16 = v9;
    if (!v29) {
      return sub_10000B8A0();
    }
LABEL_35:
    uint64_t v23 = OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView;
    id v24 = *(void **)&v19[OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView];
    if (v24)
    {
      id v25 = v24;
      [v25 removeFromSuperview];
      double v26 = *(void **)&v19[v23];
      *(void *)&v19[v23] = 0;
    }
    sub_100018860();

    uint64_t v14 = v18;
    unint64_t v9 = v16;
  }
  if (v9)
  {
    uint64_t v16 = (v9 - 1) & v9;
    unint64_t v17 = __clz(__rbit64(v9)) | (v14 << 6);
    uint64_t v18 = v14;
    goto LABEL_34;
  }
  int64_t v20 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v20 >= v15) {
    return sub_10000B8A0();
  }
  unint64_t v21 = *(void *)(v28 + 8 * v20);
  uint64_t v18 = v14 + 1;
  if (v21) {
    goto LABEL_33;
  }
  uint64_t v18 = v14 + 2;
  if (v14 + 2 >= v15) {
    return sub_10000B8A0();
  }
  unint64_t v21 = *(void *)(v28 + 8 * v18);
  if (v21) {
    goto LABEL_33;
  }
  uint64_t v18 = v14 + 3;
  if (v14 + 3 >= v15) {
    return sub_10000B8A0();
  }
  unint64_t v21 = *(void *)(v28 + 8 * v18);
  if (v21) {
    goto LABEL_33;
  }
  uint64_t v18 = v14 + 4;
  if (v14 + 4 >= v15) {
    return sub_10000B8A0();
  }
  unint64_t v21 = *(void *)(v28 + 8 * v18);
  if (v21) {
    goto LABEL_33;
  }
  uint64_t v18 = v14 + 5;
  if (v14 + 5 >= v15) {
    return sub_10000B8A0();
  }
  unint64_t v21 = *(void *)(v28 + 8 * v18);
  if (v21)
  {
LABEL_33:
    uint64_t v16 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
LABEL_34:
    uint64_t v19 = (char *)*(id *)(*(void *)(v10 + 56) + 8 * v17);
    if (!v19) {
      return sub_10000B8A0();
    }
    goto LABEL_35;
  }
  uint64_t v22 = v14 + 6;
  while (v15 != v22)
  {
    unint64_t v21 = *(void *)(v28 + 8 * v22++);
    if (v21)
    {
      uint64_t v18 = v22 - 1;
      goto LABEL_33;
    }
  }
  return sub_10000B8A0();
}

void sub_10000AE94()
{
  if (qword_100026C88 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100029B48;
  if ((unint64_t)qword_100029B48 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v1 = sub_100018D30();
    if (!v1) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v1 = *(void *)((qword_100029B48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v1) {
      goto LABEL_10;
    }
  }
  if ((v0 & 0xC000000000000001) != 0) {
    id v2 = (id)sub_100018C50();
  }
  else {
    id v2 = *(id *)(v0 + 32);
  }
  uint64_t v3 = v2;
  sub_10000B9B8(0, &qword_100027598);
  char v4 = sub_100018BB0();

  if ((v4 & 1) != 0 || v1 == 1) {
    goto LABEL_10;
  }
  if ((v0 & 0xC000000000000001) == 0)
  {
    id v9 = *(id *)(v0 + 40);
    char v10 = sub_100018BB0();

    if ((v10 & 1) == 0 && v1 != 2)
    {
      uint64_t v11 = 6;
      while (1)
      {
        uint64_t v12 = v11 - 3;
        if (__OFADD__(v11 - 4, 1)) {
          goto LABEL_30;
        }
        id v13 = *(id *)(v0 + 8 * v11);
        char v14 = sub_100018BB0();

        if ((v14 & 1) == 0)
        {
          ++v11;
          if (v12 != v1) {
            continue;
          }
        }
        break;
      }
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return;
  }
  sub_100018C50();
  char v5 = sub_100018BB0();
  swift_unknownObjectRelease();
  if ((v5 & 1) != 0 || v1 == 2) {
    goto LABEL_10;
  }
  uint64_t v6 = 2;
  while (1)
  {
    sub_100018C50();
    uint64_t v7 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    char v8 = sub_100018BB0();
    swift_unknownObjectRelease();
    if ((v8 & 1) == 0)
    {
      ++v6;
      if (v7 != v1) {
        continue;
      }
    }
    goto LABEL_10;
  }
  __break(1u);
LABEL_30:
  __break(1u);
}

id sub_10000B0C0(void *a1)
{
  id v1 = [a1 currentLook];
  id v2 = [v1 identifier];

  uint64_t v3 = sub_1000189F0();
  uint64_t v5 = v4;

  if (v3 == 0x6B63616C62 && v5 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v7 = sub_100018DE0();
    swift_bridgeObjectRelease();
  }
  id v8 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
  id v9 = [self systemBlackColor];
  id v10 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v9 preferredStyle:1];

  if (v7)
  {
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }
  else
  {
    sub_1000060C0(&qword_100027590);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_10001AE00;
    *(void *)(v12 + 32) = v10;
    unint64_t v21 = (void *)v12;
    sub_100018A90();
    uint64_t v11 = v21;
    id v13 = v10;
  }
  sub_100014910((unint64_t)v11);
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone((Class)PREditorColorPalette);
  Class isa = sub_100018A80().super.isa;
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithColors:isa localizedName:0 showsColorWell:0];

  [v8 setColorPalette:v16];
  Class v17 = sub_100018A80().super.isa;
  [v8 setSuggestedColors:v17];

  [v8 setColorWellDisplayMode:0];
  if (v7)
  {
    id v18 = v10;
    [v8 setSuggestedColor:v18];
  }
  else
  {
    [v8 setSuggestedColor:0];
  }
  NSString v19 = sub_1000189E0();
  swift_bridgeObjectRelease();
  [v8 setIdentifier:v19];

  [v8 setShowsSlider:(v7 & 1) == 0];
  return v8;
}

void *sub_10000B3B8()
{
  uint64_t v0 = 10;
  id v16 = &_swiftEmptyArrayStorage;
  sub_100018C90();
  id v1 = &byte_100021158;
  unint64_t v13 = 0x8000000100019CD0;
  do
  {
    ++v1;
    *(void *)&long long v14 = 0;
    *((void *)&v14 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_100018C30(19);
    swift_bridgeObjectRelease();
    *(void *)&long long v14 = 0xD000000000000011;
    *((void *)&v14 + 1) = v13;
    v17._countAndFlagsBits = sub_100018A00();
    sub_100018A30(v17);
    swift_bridgeObjectRelease();
    sub_100018A10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100026C80 != -1) {
      swift_once();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = (id)qword_100029B40;
    NSString v8 = sub_1000189E0();
    swift_bridgeObjectRelease();
    NSString v9 = sub_1000189E0();
    swift_bridgeObjectRelease();
    uint64_t v10 = *((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      id v2 = sub_1000071C0(&v14, *((uint64_t *)&v15 + 1));
      uint64_t v3 = *(void *)(v10 - 8);
      __chkstk_darwin(v2);
      uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v3 + 16))(v5);
      uint64_t v6 = sub_100018DD0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v10);
      sub_1000070CC((uint64_t)&v14);
    }
    else
    {
      uint64_t v6 = 0;
    }
    [objc_allocWithZone((Class)PRMutableEditingLook) initWithIdentifier:v8 displayName:v9 initialTimeFontConfiguration:v7 initialTitleColor:v6];

    swift_unknownObjectRelease();
    sub_100018C70();
    sub_100018CA0();
    sub_100018CB0();
    sub_100018C80();
    --v0;
  }
  while (v0);
  return v16;
}

uint64_t sub_10000B6B4(void *a1)
{
  sub_1000060C0((uint64_t *)&unk_100027570);
  id v2 = [a1 environment];
  sub_100018810();
  swift_unknownObjectRelease();
  uint64_t v4 = v10[0];
  unint64_t v3 = v10[1];
  if (qword_100026C98 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100018920();
  sub_10000923C(v5, (uint64_t)qword_100029B78);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_100018900();
  os_log_type_t v7 = sub_100018B40();
  if (os_log_type_enabled(v6, v7))
  {
    NSString v8 = (uint8_t *)swift_slowAlloc();
    v10[0] = swift_slowAlloc();
    *(_DWORD *)NSString v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1000100B8(v4, v3, v10);
    sub_100018BC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "initialLook poster look: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_10000B8A0()
{
  return swift_release();
}

unint64_t sub_10000B8A8()
{
  unint64_t result = qword_1000275A8;
  if (!qword_1000275A8)
  {
    sub_10000B91C(&qword_1000275A0);
    sub_10000B964();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000275A8);
  }
  return result;
}

uint64_t sub_10000B91C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000B964()
{
  unint64_t result = qword_1000275B0;
  if (!qword_1000275B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000275B0);
  }
  return result;
}

uint64_t sub_10000B9B8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000B9F4@<X0>(uint64_t *a1@<X8>)
{
  sub_100018970();
  swift_allocObject();
  sub_100018980();
  sub_100018940();
  swift_allocObject();
  swift_retain();
  sub_100018950();
  sub_1000060C0(&qword_100027640);
  sub_1000186C0();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001A9D0;
  sub_10000BE84(&qword_100027648, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_1000186B0();
  sub_10000BE84(&qword_100027650, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_1000186B0();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_10000BC1C()
{
  return sub_10000BC4C((uint64_t (*)(void))type metadata accessor for ExtragalacticPosterRenderer);
}

id sub_10000BC34()
{
  return sub_10000BC4C((uint64_t (*)(void))type metadata accessor for ExtragalacticPosterEditor);
}

id sub_10000BC4C(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_10000BC8C()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000BDE8()
{
  unint64_t result = qword_100027620;
  if (!qword_100027620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027620);
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterExtension()
{
  return &type metadata for PosterExtension;
}

uint64_t sub_10000BE4C()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10000BE84(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BECC()
{
  return sub_10000BF00(&qword_100027658);
}

uint64_t sub_10000BF00(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B91C(&qword_100027630);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10000BF48()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  sub_1000071C0((void *)v0, v1);
  unint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  sub_1000071C0((void *)(v0 + 40), v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  os_log_type_t v7 = (void *)v6;
  double v8 = *(double *)(v0 + 80);
  if (v8 <= 0.0)
  {
    uint64_t v10 = (void *)v6;
  }
  else if (v8 >= 1.0)
  {
    uint64_t v10 = v3;
    unint64_t v3 = (void *)v6;
  }
  else
  {
    sub_10000C5CC();
    uint64_t v9 = sub_100018B90();

    uint64_t v10 = v7;
    unint64_t v3 = (void *)v9;
  }

  return v3;
}

void *sub_10000C048()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  sub_1000071C0((void *)v0, v1);
  unint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v1, v2);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  sub_1000071C0((void *)(v0 + 40), v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 48))(v4, v5);
  os_log_type_t v7 = (void *)v6;
  double v8 = *(double *)(v0 + 80);
  if (v8 <= 0.0)
  {
    uint64_t v10 = (void *)v6;
  }
  else if (v8 >= 1.0)
  {
    uint64_t v10 = v3;
    unint64_t v3 = (void *)v6;
  }
  else
  {
    sub_10000C5CC();
    uint64_t v9 = sub_100018B90();

    uint64_t v10 = v7;
    unint64_t v3 = (void *)v9;
  }

  return v3;
}

void *sub_10000C148()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  sub_1000071C0((void *)v0, v1);
  unint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  sub_1000071C0((void *)(v0 + 40), v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
  os_log_type_t v7 = (void *)v6;
  double v8 = *(double *)(v0 + 80);
  if (v8 <= 0.0)
  {
    uint64_t v10 = (void *)v6;
  }
  else if (v8 >= 1.0)
  {
    uint64_t v10 = v3;
    unint64_t v3 = (void *)v6;
  }
  else
  {
    sub_10000C5CC();
    uint64_t v9 = sub_100018B90();

    uint64_t v10 = v7;
    unint64_t v3 = (void *)v9;
  }

  return v3;
}

uint64_t sub_10000C248()
{
  uint64_t v1 = v0;
  v3._countAndFlagsBits = 40;
  v3._object = (void *)0xE100000000000000;
  sub_100018A30(v3);
  sub_1000071C0(v1, v1[3]);
  sub_100018DC0();
  v4._countAndFlagsBits = 2633001;
  v4._object = (void *)0xE300000000000000;
  sub_100018A30(v4);
  sub_1000071C0(v1 + 5, v1[8]);
  sub_100018DC0();
  v5._countAndFlagsBits = 2633001;
  v5._object = (void *)0xE300000000000000;
  sub_100018A30(v5);
  v6._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_100018A30(v7);
  return 0;
}

uint64_t sub_10000C334@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C248();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000C35C()
{
  uint64_t v0 = sub_10000C248();
  uint64_t v2 = v1;
  if (v0 == sub_10000C248() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_100018DE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_10000C3F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  *(void *)(a4 + 24) = a3;
  unint64_t v10 = sub_10000711C();
  *(void *)(a4 + 32) = v10;
  uint64_t v11 = swift_allocObject();
  *(void *)a4 = v11;
  sub_10000C64C(a1, v11 + 16);
  *(void *)(a4 + 64) = a3;
  *(void *)(a4 + 72) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(a4 + 40) = v12;
  uint64_t result = sub_10000C64C(a2, v12 + 16);
  *(double *)(a4 + 80) = a5;
  return result;
}

unint64_t sub_10000C498(void *a1)
{
  a1[1] = sub_10000C4D0();
  a1[2] = sub_10000C524();
  unint64_t result = sub_10000C578();
  a1[3] = result;
  return result;
}

unint64_t sub_10000C4D0()
{
  unint64_t result = qword_100027660;
  if (!qword_100027660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027660);
  }
  return result;
}

unint64_t sub_10000C524()
{
  unint64_t result = qword_100027668;
  if (!qword_100027668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027668);
  }
  return result;
}

unint64_t sub_10000C578()
{
  unint64_t result = qword_100027670;
  if (!qword_100027670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027670);
  }
  return result;
}

unint64_t sub_10000C5CC()
{
  unint64_t result = qword_100027678;
  if (!qword_100027678)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100027678);
  }
  return result;
}

uint64_t sub_10000C60C()
{
  sub_1000070CC(v0 + 16);
  sub_1000070CC(v0 + 56);
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_10000C64C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t destroy for InterpolatedColorProvider(uint64_t a1)
{
  sub_1000070CC(a1);
  return sub_1000070CC(a1 + 40);
}

uint64_t initializeWithCopy for InterpolatedColorProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t *assignWithCopy for InterpolatedColorProvider(uint64_t *a1, uint64_t *a2)
{
  a1[10] = a2[10];
  return a1;
}

uint64_t *sub_10000C7B0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for InterpolatedColorProvider(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for InterpolatedColorProvider(uint64_t a1, uint64_t a2)
{
  sub_1000070CC(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_1000070CC(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for InterpolatedColorProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InterpolatedColorProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InterpolatedColorProvider()
{
  return &type metadata for InterpolatedColorProvider;
}

uint64_t sub_10000CB14()
{
  uint64_t v1 = sub_100018800();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  long long v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000187A0();
  uint64_t v5 = v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_rotationFrame;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 40))(v5, v4, v1);
  swift_endAccess();
  sub_1000075BC();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    [*(id *)(result + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer) noteContentSignificantlyChanged];
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_10000CC58()
{
  uint64_t v1 = sub_100018800();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  long long v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000187D0();
  uint64_t v5 = v0 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_rotationFrame;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 40))(v5, v4, v1);
  swift_endAccess();
  sub_1000075BC();
}

uint64_t sub_10000CD7C()
{
  if (qword_100026C90 != -1) {
    uint64_t result = swift_once();
  }
  double v0 = 0.419847328;
  if (byte_100029B70) {
    double v0 = 0.4167;
  }
  qword_100027680 = *(void *)&v0;
  return result;
}

uint64_t sub_10000CDE8()
{
  if (qword_100026C90 != -1) {
    uint64_t result = swift_once();
  }
  double v0 = 0.454054054;
  if (byte_100029B70) {
    double v0 = 0.5;
  }
  qword_100027688 = *(void *)&v0;
  return result;
}

uint64_t sub_10000CE50(void *a1, CGFloat a2, CGFloat a3, double a4, double a5, double a6, double a7)
{
  uint64_t v8 = v7;
  double v82 = 0.0;
  double v83 = -2.68156159e154;
  sub_100018C30(24);
  uint64_t v85 = 0;
  unint64_t v86 = 0xE000000000000000;
  v87._countAndFlagsBits = 0x282D4E414250;
  v87._object = (void *)0xE600000000000000;
  sub_100018A30(v87);
  sub_1000071C0(a1, a1[3]);
  sub_100018DC0();
  v88._countAndFlagsBits = 2633001;
  v88._object = (void *)0xE300000000000000;
  sub_100018A30(v88);
  v94.CGFloat width = a2;
  v94.CGFloat height = a3;
  id v16 = NSStringFromCGSize(v94);
  uint64_t v17 = sub_1000189F0();
  NSString v19 = v18;

  v89._countAndFlagsBits = v17;
  v89._object = v19;
  sub_100018A30(v89);
  swift_bridgeObjectRelease();
  v90._countAndFlagsBits = 2633001;
  v90._object = (void *)0xE300000000000000;
  sub_100018A30(v90);
  double v77 = a4;
  v91._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v91);
  swift_bridgeObjectRelease();
  v92._countAndFlagsBits = 2633001;
  v92._object = (void *)0xE300000000000000;
  sub_100018A30(v92);
  double v79 = a5;
  double v80 = a6;
  double v82 = a5;
  double v83 = a6;
  double v84 = a7;
  sub_100018CC0();
  v93._countAndFlagsBits = 41;
  v93._object = (void *)0xE100000000000000;
  sub_100018A30(v93);
  double v24 = a7 * 0.5;
  if (qword_100026CB0 != -1) {
    swift_once();
  }
  double v25 = v24 + *(double *)&qword_100027680 * a2;
  if (qword_100026CB8 != -1) {
    swift_once();
  }
  v21.n128_f64[0] = v24 + *(double *)&qword_100027688 * a3;
  v20.n128_f64[0] = v25;
  double v26 = nullsub_1(v20, v21, v22, v23);
  double v28 = v27;
  sub_10000605C((uint64_t)a1, (uint64_t)&v82);
  double v81 = a3;
  uint64_t v29 = sub_100006BC4(0, &v82, v26, v28, v79, v80, a7);
  double v30 = a2 / 3.0 + a7;
  double v75 = v26;
  v31.n128_f64[0] = a2 - v26 + a7 * 4.0 + a2 - v30 - v26 - v24;
  v32.n128_f64[0] = v28 - a7;
  double v73 = v28 - a7;
  double v35 = a2;
  double v36 = nullsub_1(v31, v32, v33, v34);
  unint64_t v38 = v37;
  sub_10000605C((uint64_t)a1, (uint64_t)&v82);
  v39.n128_f64[0] = v36;
  double v40 = v35;
  v41.n128_u64[0] = v38;
  v42.n128_f64[0] = v79;
  v43.n128_f64[0] = v80;
  uint64_t v44 = sub_1000081A8(0, &v82, v39, v41, v42, v43, a7, v30);
  v45.n128_f64[0] = v81 - v28 + a7;
  v46.n128_f64[0] = v35;
  double v53 = nullsub_1(v46, v45, v47, v48);
  double v54 = v50.n128_f64[0];
  if (qword_100026C90 != -1) {
    swift_once();
  }
  if (byte_100029B70 == 1)
  {
    double v55 = v54 / 5.0;
  }
  else if (v53 > v54)
  {
    double v55 = v53 / 3.0 * 0.75;
  }
  else
  {
    double v55 = v53 / 3.0;
  }
  double v56 = v35 * v77;
  v49.n128_f64[0] = -(v40 * v77);
  v50.n128_f64[0] = v73;
  double v78 = nullsub_1(v49, v50, v51, v52);
  uint64_t v74 = v57;
  double v58 = v75 - a7;
  v59.n128_f64[0] = v56 + v75 - a7;
  v60.n128_u64[0] = 0;
  double v63 = nullsub_1(v59, v60, v61, v62);
  double v76 = v40;
  uint64_t v65 = v64;
  sub_10000605C((uint64_t)a1, (uint64_t)&v82);
  v66.n128_f64[0] = v53;
  v67.n128_f64[0] = v54;
  v68.n128_f64[0] = v79;
  v69.n128_f64[0] = v80;
  uint64_t v70 = sub_100012CF4(&v82, v66, v67, v68, v69, a7, v58, v55 - a7 * 0.5);
  sub_1000060C0((uint64_t *)&unk_1000274D0);
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_10001ADA0;
  *(void *)(v71 + 32) = v44;
  *(double *)(v71 + 40) = v63;
  *(void *)(v71 + 48) = v65;
  *(void *)(v71 + 56) = v70;
  *(double *)(v71 + 64) = v78;
  *(void *)(v71 + 72) = v74;
  *(void *)(v71 + 80) = v29;
  *(double *)(v71 + 88) = v56;
  *(void *)(v71 + 96) = 0;
  *(double *)(v8 + 16) = v76;
  *(double *)(v8 + 24) = v81;
  *(void *)(v8 + 32) = v71;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0xE000000000000000;
  sub_1000070CC((uint64_t)a1);
  return v8;
}

uint64_t type metadata accessor for ExtragalacticPortraitBannerDescriptor()
{
  return self;
}

uint64_t sub_10000D2DC()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SnapshotImageFactory()
{
  return self;
}

id sub_10000D380()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtragalacticPosterUpdating();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExtragalacticPosterUpdating()
{
  return self;
}

void sub_10000D3D8()
{
  algn_100027848[7] = -18;
}

uint64_t sub_10000D58C(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_10000B9B8(0, &qword_100027940);
  uint64_t v7 = sub_1000189A0();
  v4[6] = v7;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_100027948 + dword_100027948);
  id v8 = a2;
  id v9 = a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[7] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_10000D6A4;
  return v12(v7);
}

uint64_t sub_10000D6A4()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  long long v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v7 = sub_100018680();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_100018A80().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    id v9 = isa;
  }
  uint64_t v10 = *(void (***)(void, void, void))(v3 + 32);
  ((void (**)(void, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  uint64_t v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

uint64_t sub_10000D9EC(void *a1, int a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = (void (*)(void *, id, void))v5[2];
  id v7 = a1;
  v6(v5, v7, 0);
  _Block_release(v5);

  id v8 = *(uint64_t (**)(void))(v3 + 8);
  return sub_10000E454(v8);
}

uint64_t sub_10000DAAC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  long long v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000EF1C;
  uint64_t v6 = (uint64_t (*)(void *, int, void *))((char *)&dword_1000278E0 + dword_1000278E0);
  return v6(v2, v3, v4);
}

uint64_t sub_10000DB6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *long long v4 = v3;
  v4[1] = sub_10000EF1C;
  return v6();
}

uint64_t sub_10000DC3C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  long long v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000EF1C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000278F0 + dword_1000278F0);
  return v6(v2, v3, v4);
}

uint64_t sub_10000DCFC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000EF1C;
  return v7();
}

uint64_t sub_10000DDCC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000EF1C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100027900 + dword_100027900);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000DE98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100018AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100018AD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000E03C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100018AC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000E03C(uint64_t a1)
{
  uint64_t v2 = sub_1000060C0(&qword_1000278D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E09C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000E178;
  return v6(a1);
}

uint64_t sub_10000E178()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000E270()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E2A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000E360;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100027910 + dword_100027910);
  return v6(a1, v4);
}

uint64_t sub_10000E360()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000E454(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000E460()
{
  _Block_release(*(const void **)(v0 + 32));
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E4B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_10000E360;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_100027920 + dword_100027920);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000E578()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E5B8(uint64_t a1)
{
  *(void *)(v1 + 312) = a1;
  return _swift_task_switch(sub_10000E648, 0, 0);
}

uint64_t sub_10000E648()
{
  uint64_t v50 = v0;
  uint64_t v1 = 0;
  *(void *)(v0 + 152) = 0x7974696E75;
  __n128 v43 = (void **)(v0 + 296);
  uint64_t v44 = v0 + 272;
  uint64_t v2 = *(void *)(v0 + 312);
  *(_OWORD *)(v0 + 136) = xmmword_10001ADA0;
  *(void *)(v0 + 160) = 0xE500000000000000;
  *(void *)(v0 + 168) = 0x6B63616C62;
  *(void *)(v0 + 176) = 0xE500000000000000;
  *(void *)(v0 + 184) = 1702194274;
  *(void *)(v0 + 192) = 0xE400000000000000;
  uint64_t v42 = v2;
  do
  {
    uint64_t v5 = *(void *)(v0 + v1 + 152);
    uint64_t v6 = *(void *)(v0 + v1 + 160);
    uint64_t v7 = *(void *)(v2 + 16);
    swift_bridgeObjectRetain();
    if (v7)
    {
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_100016D48(v5, v6);
      if (v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 56) + 8 * v8);
        swift_bridgeObjectRelease_n();
        id v11 = v10;
        sub_100018A70();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100018AA0();
        }
        sub_100018AB0();
        sub_100018A90();
        goto LABEL_6;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    NSString v12 = sub_1000189E0();
    swift_bridgeObjectRelease();
    id v13 = [self mutableDescriptorWithIdentifier:v12];

    id v11 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
    [v11 setAllowsSystemSuggestedComplications:0];
    *__n128 v43 = 0;
    unsigned int v14 = [v13 storeGalleryOptions:v11 error:v43];
    long long v15 = *v43;
    uint64_t v46 = v5;
    __n128 v47 = v13;
    if (v14)
    {
      id v16 = v15;
    }
    else
    {
      id v45 = v11;
      id v17 = v15;
      sub_100018690();

      swift_willThrow();
      if (qword_100026CA0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_100018920();
      sub_10000923C(v18, (uint64_t)qword_100029B90);
      swift_errorRetain();
      swift_errorRetain();
      NSString v19 = sub_100018900();
      os_log_type_t v20 = sub_100018B60();
      if (os_log_type_enabled(v19, v20))
      {
        __n128 v21 = (uint8_t *)swift_slowAlloc();
        v49[0] = swift_slowAlloc();
        *(_DWORD *)__n128 v21 = 136315138;
        swift_getErrorValue();
        uint64_t v22 = sub_100018E00();
        *(void *)(v48 + 304) = sub_1000100B8(v22, v23, v49);
        uint64_t v0 = v48;
        sub_100018BC0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Could not set descriptor gallery options with error: %s", v21, 0xCu);
        swift_arrayDestroy();
        uint64_t v2 = v42;
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      id v11 = v45;
    }
    sub_1000060C0(&qword_100027590);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_10001AE00;
    if (qword_100026C80 != -1) {
      swift_once();
    }
    double v25 = (void *)qword_100029B40;
    *(void *)(v24 + 32) = qword_100029B40;
    v49[0] = v24;
    sub_100018A90();
    sub_10000B9B8(0, &qword_100027598);
    id v26 = v25;
    Class isa = sub_100018A80().super.isa;
    swift_bridgeObjectRelease();
    [v47 setPreferredTimeFontConfigurations:isa];

    sub_1000060C0((uint64_t *)&unk_100027950);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10001A9C0;
    if (qword_100026CC0 != -1) {
      swift_once();
    }
    uint64_t v29 = *(void *)algn_100027848;
    *(void *)(v0 + 248) = qword_100027840;
    *(void *)(v0 + 256) = v29;
    swift_bridgeObjectRetain();
    sub_100018C20();
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 72) = v46;
    *(void *)(inited + 80) = v6;
    sub_100015978(inited);
    Class v30 = sub_100018990().super.isa;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 272) = 0;
    unsigned int v31 = [v47 storeUserInfo:v30 error:v44];

    __n128 v32 = *(void **)(v0 + 272);
    if (v31)
    {
      id v3 = v32;
    }
    else
    {
      id v33 = v32;
      sub_100018690();

      swift_willThrow();
      if (qword_100026CA0 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_100018920();
      sub_10000923C(v34, (uint64_t)qword_100029B90);
      swift_errorRetain();
      swift_errorRetain();
      double v35 = sub_100018900();
      os_log_type_t v36 = sub_100018B60();
      if (os_log_type_enabled(v35, v36))
      {
        unint64_t v37 = (uint8_t *)swift_slowAlloc();
        v49[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v37 = 136315138;
        swift_getErrorValue();
        uint64_t v38 = sub_100018E00();
        *(void *)(v48 + 280) = sub_1000100B8(v38, v39, v49);
        sub_100018BC0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "Could not store user info with error: %s", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v0 = v48;
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v2 = v42;
    }
    id v4 = v47;
    sub_100018A70();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100018AA0();
    }
    sub_100018AB0();
    sub_100018A90();

LABEL_6:
    v1 += 16;
  }
  while (v1 != 48);
  swift_arrayDestroy();
  double v40 = *(uint64_t (**)(void *))(v0 + 8);
  return v40(&_swiftEmptyArrayStorage);
}

BOOL sub_10000EF20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000EF34()
{
  Swift::UInt v1 = *v0;
  sub_100018E10();
  sub_100018E20(v1);
  return sub_100018E30();
}

void sub_10000EF7C()
{
  sub_100018E20(*v0);
}

Swift::Int sub_10000EFA8()
{
  Swift::UInt v1 = *v0;
  sub_100018E10();
  sub_100018E20(v1);
  return sub_100018E30();
}

uint64_t sub_10000EFEC(char a1)
{
  return *(void *)&aUnity_2[8 * a1];
}

uint64_t sub_10000F00C(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_10000EFEC(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000EFEC(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100018DE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10000F098()
{
  char v1 = *v0;
  sub_100018E10();
  sub_10000EFEC(v1);
  sub_100018A20();
  swift_bridgeObjectRelease();
  return sub_100018E30();
}

uint64_t sub_10000F0FC()
{
  sub_10000EFEC(*v0);
  sub_100018A20();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000F150()
{
  char v1 = *v0;
  sub_100018E10();
  sub_10000EFEC(v1);
  sub_100018A20();
  swift_bridgeObjectRelease();
  return sub_100018E30();
}

uint64_t sub_10000F1B0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100010A74(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10000F1E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000EFEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000F20C()
{
  return sub_100018A60();
}

uint64_t sub_10000F26C()
{
  return sub_100018A50();
}

void sub_10000F2BC(void *a1@<X8>)
{
  *a1 = &off_100021138;
}

void sub_10000F2CC()
{
  *(_WORD *)&algn_100027968[6] = -4864;
}

id sub_10000F2FC()
{
  char v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    uint64_t v3 = sub_100010980(v0, (void *)0xEF746867694C646ELL, (SEL *)&selRef_systemGreenColor);
    uint64_t v4 = *(void **)(v0 + 24);
    *(void *)(v0 + 24) = v3;
    id v2 = v3;

    char v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_10000F370()
{
  char v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    id v3 = sub_1000108B4(v0);
    uint64_t v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v3;
    id v2 = v3;

    char v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_10000F3CC()
{
  char v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = *(id *)(v0 + 40);
  }
  else
  {
    id v3 = sub_100010980(v0, (void *)0xEE006B726144646ELL, (SEL *)&selRef_systemRedColor);
    uint64_t v4 = *(void **)(v0 + 40);
    *(void *)(v0 + 40) = v3;
    id v2 = v3;

    char v1 = 0;
  }
  id v5 = v1;
  return v2;
}

id sub_10000F440(uint64_t a1, void *a2)
{
  if (qword_100026CC8 != -1) {
    swift_once();
  }
  strcpy((char *)v18, "extragalactic/");
  HIBYTE(v18[1]) = -18;
  v19._countAndFlagsBits = sub_10000EFEC(*(unsigned char *)(v2 + 16));
  sub_100018A30(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 47;
  v20._object = (void *)0xE100000000000000;
  sub_100018A30(v20);
  v21._countAndFlagsBits = a1;
  v21._object = a2;
  sub_100018A30(v21);
  uint64_t v6 = v18[0];
  unint64_t v5 = v18[1];
  swift_bridgeObjectRetain();
  NSString v7 = sub_1000189E0();
  swift_bridgeObjectRelease();
  char v8 = self;
  id v9 = [v8 colorNamed:v7];

  if (v9)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    strcpy((char *)v18, "extragalactic/");
    HIBYTE(v18[1]) = -18;
    v22._countAndFlagsBits = a1;
    v22._object = a2;
    sub_100018A30(v22);
    uint64_t v11 = v18[0];
    unint64_t v10 = v18[1];
    swift_bridgeObjectRetain();
    NSString v12 = sub_1000189E0();
    swift_bridgeObjectRelease();
    id v9 = [v8 colorNamed:v12];

    if (v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100026C98 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_100018920();
      sub_10000923C(v13, (uint64_t)qword_100029B78);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned int v14 = sub_100018900();
      os_log_type_t v15 = sub_100018B50();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        v18[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315394;
        swift_bridgeObjectRetain();
        sub_1000100B8(v6, v5, v18);
        sub_100018BC0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v16 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_1000100B8(v11, v10, v18);
        sub_100018BC0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "No matching color found for %s or %s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      return 0;
    }
  }
  return v9;
}

uint64_t sub_10000F7B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  if (a5 <= 0.0)
  {
    sub_10000605C(a1, (uint64_t)v18);
    uint64_t v14 = a2;
    goto LABEL_7;
  }
  if (a5 >= 1.0)
  {
    sub_10000605C(a2, (uint64_t)v18);
    uint64_t v14 = a3;
LABEL_7:
    sub_10000605C(v14, (uint64_t)v17);
    if (a6 <= 0.0) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  v18[3] = &type metadata for InterpolatedColorProvider;
  unint64_t v12 = sub_10000711C();
  v18[4] = v12;
  v18[0] = swift_allocObject();
  sub_10000605C(a1, v18[0] + 16);
  sub_10000605C(a2, v18[0] + 56);
  *(double *)(v18[0] + 96) = a5;
  v17[3] = &type metadata for InterpolatedColorProvider;
  v17[4] = v12;
  v17[0] = swift_allocObject();
  sub_10000605C(a2, v17[0] + 16);
  sub_10000605C(a3, v17[0] + 56);
  *(double *)(v17[0] + 96) = a5;
  if (a6 <= 0.0)
  {
LABEL_4:
    uint64_t v13 = v18;
LABEL_11:
    sub_10000605C((uint64_t)v13, (uint64_t)a4);
    goto LABEL_12;
  }
LABEL_8:
  if (a6 >= 1.0)
  {
    uint64_t v13 = v17;
    goto LABEL_11;
  }
  a4[3] = (uint64_t)&type metadata for InterpolatedColorProvider;
  a4[4] = sub_10000711C();
  uint64_t v15 = swift_allocObject();
  *a4 = v15;
  sub_10000605C((uint64_t)v18, v15 + 16);
  sub_10000605C((uint64_t)v17, v15 + 56);
  *(double *)(v15 + 96) = a6;
LABEL_12:
  sub_1000070CC((uint64_t)v17);
  return sub_1000070CC((uint64_t)v18);
}

uint64_t sub_10000F96C()
{
  return *(void *)&aUnity_2[8 * *(char *)(v0 + 16)];
}

uint64_t sub_10000F990()
{
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ColorPalette()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for ColorPalette.Option(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ColorPalette.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ColorPalette.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000FB64);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000FB8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000FB94(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ColorPalette.State()
{
  return &type metadata for ColorPalette.State;
}

uint64_t getEnumTagSinglePayload for ColorPalette.Option(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ColorPalette.Option(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000FD08);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPalette.Option()
{
  return &type metadata for ColorPalette.Option;
}

unint64_t sub_10000FD44()
{
  unint64_t result = qword_100027A98;
  if (!qword_100027A98)
  {
    sub_10000B91C(&qword_100027AA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027A98);
  }
  return result;
}

unint64_t sub_10000FDA4()
{
  unint64_t result = qword_100027AA8;
  if (!qword_100027AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027AA8);
  }
  return result;
}

unint64_t sub_10000FDFC()
{
  unint64_t result = qword_100027AB0;
  if (!qword_100027AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027AB0);
  }
  return result;
}

id sub_10000FE50()
{
  return sub_10000F370();
}

id sub_10000FE74()
{
  return sub_10000F2FC();
}

id sub_10000FE98()
{
  return sub_10000F3CC();
}

uint64_t sub_10000FEBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000F96C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000FEE8()
{
  return sub_10000F96C();
}

uint64_t sub_10000FF0C()
{
  uint64_t v0 = swift_retain();
  char v1 = sub_100010720(v0);
  swift_release();
  return v1 & 1;
}

uint64_t sub_10000FF50(void *a1)
{
  a1[1] = sub_100010874(&qword_100027AB8);
  a1[2] = sub_100010874(&qword_100027AC0);
  uint64_t result = sub_100010874(&qword_100027AC8);
  a1[3] = result;
  return result;
}

uint64_t sub_10000FFDC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100010018(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100010040(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000100B8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100018BC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000100B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001018C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100010B54((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100010B54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000070CC((uint64_t)v12);
  return v7;
}

uint64_t sub_10001018C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100018BD0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100010348(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100018C60();
  if (!v8)
  {
    sub_100018D10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100018D80();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100010348(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000103E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000105C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000105C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000103E0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100010558(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100018C40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100018D10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100018A40();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100018D80();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100018D10();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100010558(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000060C0((uint64_t *)&unk_100027AE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000105C0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000060C0((uint64_t *)&unk_100027AE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100018D80();
  __break(1u);
  return result;
}

unsigned char **sub_100010710(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100010720(uint64_t a1)
{
  v9[3] = type metadata accessor for ColorPalette();
  v9[4] = sub_100010874((unint64_t *)&qword_1000270F0);
  v9[0] = a1;
  sub_10000605C((uint64_t)v9, (uint64_t)v8);
  swift_retain();
  sub_1000060C0(&qword_100027AD0);
  if (swift_dynamicCast())
  {
    uint64_t v2 = sub_10000F96C();
    uint64_t v4 = v3;
    if (v2 == sub_10000F96C() && v4 == v5) {
      char v6 = 1;
    }
    else {
      char v6 = sub_100018DE0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    char v6 = 0;
  }
  sub_1000070CC((uint64_t)v9);
  return v6 & 1;
}

uint64_t sub_100010874(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ColorPalette();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1000108B4(uint64_t a1)
{
  id result = sub_10000F440(0x746E65636361, (void *)0xE600000000000000);
  if (!result) {
    id result = [self systemYellowColor];
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(a1 + 17) == 1)
  {
    sub_10000C5CC();
    id v4 = [self blackColor];
    uint64_t v5 = sub_100018B90();

    return (id)v5;
  }
  return result;
}

void *sub_100010980(uint64_t a1, void *a2, SEL *a3)
{
  id v5 = sub_10000F440(0x756F72676B636162, a2);
  if (!v5) {
    id v5 = [self *a3];
  }
  char v6 = v5;
  if (*(unsigned char *)(a1 + 17))
  {
    if (*(unsigned char *)(a1 + 17) == 1)
    {
      sub_10000C5CC();
      id v7 = [self blackColor];
      uint64_t v8 = sub_100018B90();

      char v6 = v7;
LABEL_8:

      return (void *)v8;
    }
    if (*(unsigned char *)(a1 + 16) == 9)
    {
      uint64_t v8 = (uint64_t)sub_100008DD0(0.1);
      goto LABEL_8;
    }
  }
  return v6;
}

uint64_t sub_100010A74(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100021028;
  v6._object = a2;
  unint64_t v4 = sub_100018D90(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xA) {
    return 10;
  }
  else {
    return v4;
  }
}

unint64_t sub_100010AC0()
{
  unint64_t result = qword_100027AD8;
  if (!qword_100027AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027AD8);
  }
  return result;
}

uint64_t sub_100010B14()
{
  sub_1000070CC(v0 + 16);
  sub_1000070CC(v0 + 56);
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_100010B54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100010BB8()
{
  uint64_t v1 = OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_controller;
  id v2 = objc_allocWithZone((Class)type metadata accessor for ExtragalacticPosterController());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  *(void *)&v3[OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer] = 0;
  uint64_t v4 = OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_colorPaletteCache;
  type metadata accessor for ColorPaletteCache();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = sub_1000167EC((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)&v3[v4] = v5;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for ExtragalacticPosterRenderer();
  id v6 = objc_msgSendSuper2(&v14, "init");
  uint64_t v7 = qword_100026CA8;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100018920();
  sub_10000923C(v9, (uint64_t)qword_100029BA8);
  uint64_t v10 = sub_100018900();
  os_log_type_t v11 = sub_100018B30();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "PosterRenderer created", v12, 2u);
    swift_slowDealloc();
  }

  return v8;
}

uint64_t sub_100010D64(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer);
  *(void *)(v3 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer) = a1;
  id v6 = a1;

  *(void *)(*(void *)(v3 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_controller)
            + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_delegate
            + 8) = &off_100021A28;
  swift_unknownObjectWeakAssign();
  id v7 = [v6 backgroundView];
  sub_100007408(v7);

  if ((sub_100018850() & 1) == 0) {
    sub_1000075BC();
  }
  return sub_100010F90((uint64_t)v6, a2);
}

uint64_t sub_100010F90(uint64_t a1, void *a2)
{
  Swift::String v20 = a2;
  uint64_t v3 = sub_1000188D0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v22 = sub_1000188F0();
  uint64_t v10 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100018750();
  uint64_t v13 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018B10();
  sub_100018B20();
  sub_1000112DC(v20, v2, v24);
  uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_controller);
  sub_10000605C((uint64_t)v24, (uint64_t)v23);
  uint64_t v17 = v16 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_colorProvider;
  swift_beginAccess();
  sub_1000070CC(v17);
  sub_100007204(v23, v17);
  swift_endAccess();
  sub_1000188E0();
  sub_100018740();
  sub_1000188A0();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  uint64_t v18 = v16 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_progress;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v18, v7, v3);
  swift_endAccess();
  sub_1000075BC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  sub_1000070CC((uint64_t)v24);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v21);
}

uint64_t sub_1000112DC@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  if ((sub_100018B00() & 1) == 0)
  {
LABEL_13:
    sub_1000060C0((uint64_t *)&unk_100027570);
    sub_100018820();
    goto LABEL_14;
  }
  v30[0] = 0;
  id v6 = objc_msgSend(objc_msgSend(a1, "contents"), "loadUserInfoWithError:", v30);
  swift_unknownObjectRelease();
  id v7 = v30[0];
  if (v6)
  {
    uint64_t v8 = sub_1000189A0();
    id v9 = v7;

    strcpy((char *)v29, "lookIdentifier");
    HIBYTE(v29[1]) = -18;
    sub_100018C20();
    if (*(void *)(v8 + 16) && (unint64_t v10 = sub_100016D04((uint64_t)v30), (v11 & 1) != 0))
    {
      sub_100010B54(*(void *)(v8 + 56) + 32 * v10, (uint64_t)&v31);
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100011724((uint64_t)v30);
    if (*((void *)&v32 + 1))
    {
      if (swift_dynamicCast())
      {
        char v12 = sub_100010A74(v29[0], (void *)v29[1]);
        if (v12 != 10)
        {
          id v13 = (id)sub_1000141E4(v12);
          goto LABEL_15;
        }
      }
    }
    else
    {
      sub_100011778((uint64_t)&v31);
    }
    goto LABEL_13;
  }
  id v15 = v30[0];
  sub_100018690();

  swift_willThrow();
  sub_1000060C0((uint64_t *)&unk_100027570);
  sub_100018820();
  swift_errorRelease();
LABEL_14:
  id v13 = v30[0];
  id v14 = v30[1];
LABEL_15:
  char v16 = sub_100010A74((uint64_t)v13, v14);
  if (v16 == 10) {
    __break(1u);
  }
  uint64_t v17 = *(void *)(a2 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_colorPaletteCache);
  char v18 = *(unsigned char *)(v17 + 16);
  *(unsigned char *)(v17 + 16) = v16;
  uint64_t v19 = sub_10000EFEC(v16);
  uint64_t v21 = v20;
  if (v19 == sub_10000EFEC(v18) && v21 == v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  char v24 = sub_100018DE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
  {
    swift_beginAccess();
    *(void *)(v17 + 24) = &_swiftEmptyDictionarySingleton;
LABEL_23:
    swift_bridgeObjectRelease();
  }
  sub_1000188E0();
  double v26 = v25;
  sub_100018730();
  return sub_100016954(a3, v26, v27);
}

id sub_100011660()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtragalacticPosterRenderer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExtragalacticPosterRenderer()
{
  return self;
}

uint64_t sub_100011714(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100011724(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011778(uint64_t a1)
{
  uint64_t v2 = sub_1000060C0(&qword_100027B98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000117D8()
{
  uint64_t v1 = v0;
  if (qword_100026CA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100018920();
  sub_10000923C(v2, (uint64_t)qword_100029BA8);
  uint64_t v3 = sub_100018900();
  os_log_type_t v4 = sub_100018B30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "PosterRenderer invalidate", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_controller);
  *(void *)(v6 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_delegate + 8) = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v7 = OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC19ExtragalacticPoster29ExtragalacticPosterController_backgroundView);
  if (v8)
  {
    id v9 = v8;
    [v9 removeFromSuperview];
    unint64_t v10 = *(void **)(v6 + v7);
    *(void *)(v6 + v7) = 0;
  }
  sub_100018860();
  char v11 = *(void **)(v1 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer);
  *(void *)(v1 + OBJC_IVAR____TtC19ExtragalacticPoster27ExtragalacticPosterRenderer_renderer) = 0;
}

void sub_100011958(uint64_t a1, char *a2, uint64_t *a3, double a4, double a5)
{
  sub_10000605C(a1, (uint64_t)v38);
  uint64_t v9 = v39;
  uint64_t v10 = v40;
  sub_1000071C0(v38, v39);
  sub_1000120E0(v9, v10);
  uint64_t v11 = v39;
  uint64_t v12 = v40;
  sub_1000071C0(v38, v39);
  double v13 = sub_1000120B4(v11, v12);
  uint64_t v14 = v39;
  uint64_t v15 = v40;
  sub_1000071C0(v38, v39);
  char v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
  uint64_t v17 = v39;
  uint64_t v18 = v40;
  sub_1000071C0(v38, v39);
  double v19 = (*(double (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18) + a4;
  double v21 = v20 + a5;
  sub_10000C5CC();
  uint64_t v22 = self;
  id v23 = [v22 blackColor];
  char v24 = (void *)sub_100018B90();

  id v25 = sub_100011C78(a2, a3);
  [v16 bounds];
  CGFloat Width = CGRectGetWidth(v41);
  [v16 bounds];
  v27.n128_u64[0] = CGRectGetHeight(v42);
  v28.n128_f64[0] = v19;
  v29.n128_f64[0] = v21;
  v30.n128_f64[0] = Width;
  objc_msgSend(v25, "setFrame:", nullsub_1(v28, v29, v30, v27));
  id v31 = [v16 CGPath];
  [v25 setPath:v31];

  id v32 = [v24 CGColor];
  [v25 setFillColor:v32];

  [v25 setLineWidth:v13];
  if (v13 > 0.0)
  {
    uint64_t v33 = v39;
    uint64_t v34 = v40;
    sub_1000071C0(v38, v39);
    sub_1000120F4(v33, v34);
    id v35 = [v22 blackColor];
    os_log_type_t v36 = (void *)sub_100018B90();

    id v37 = [v36 CGColor];
    [v25 setStrokeColor:v37];
  }
  if (__OFADD__(*a3, 1))
  {
    __break(1u);
  }
  else
  {
    ++*a3;
    sub_1000070CC((uint64_t)v38);
  }
}

id sub_100011C78(char *a1, uint64_t *a2)
{
  unint64_t v3 = (unint64_t)a1;
  os_log_type_t v4 = (unint64_t *)&a1[OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_shapeLayers];
  swift_beginAccess();
  if (*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100018D30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = *a2;
  if (v6 >= v5)
  {
    id v9 = [objc_allocWithZone((Class)CAShapeLayer) init];
    swift_beginAccess();
    uint64_t v6 = (uint64_t)v9;
    sub_100018A70();
    if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_11:
      sub_100018AB0();
      sub_100018A90();
      swift_endAccess();
      [(id)v3 addSublayer:v6];
      return (id)v6;
    }
LABEL_17:
    sub_100018AA0();
    goto LABEL_11;
  }
  unint64_t v3 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100018C50();
    swift_bridgeObjectRelease();
    return (id)v6;
  }
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)v6 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = *(void **)(v3 + 8 * v6 + 32);
  return v7;
}

id sub_100011FB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BannerLayer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BannerLayer()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PathConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PathConfiguration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PathConfiguration()
{
  return &type metadata for PathConfiguration;
}

double sub_1000120B4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 32))();
  return v2;
}

uint64_t sub_1000120E0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

double sub_1000120F4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 32))();
  return v2;
}

uint64_t sub_100012120@<X0>(void *a1@<X8>)
{
  sub_1000186A0();
  uint64_t v3 = v2;
  sub_1000186A0();
  uint64_t v5 = v4;
  uint64_t result = sub_1000186A0();
  *a1 = v3;
  a1[1] = v5;
  a1[2] = v7;
  return result;
}

id sub_1000121A4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v9 = [objc_allocWithZone((Class)UIBezierPath) init];
  v39.origin.CGFloat x = a1;
  v39.origin.CGFloat y = a2;
  v39.size.CGFloat width = a3;
  v39.size.CGFloat height = a4;
  CGFloat MinX = CGRectGetMinX(v39);
  v40.origin.CGFloat x = a1;
  v40.origin.CGFloat y = a2;
  v40.size.CGFloat width = a3;
  v40.size.CGFloat height = a4;
  v11.n128_u64[0] = CGRectGetMinY(v40);
  v12.n128_f64[0] = MinX;
  double v15 = nullsub_1(v12, v11, v13, v14);
  objc_msgSend(v9, "moveToPoint:");
  v41.origin.CGFloat x = a1;
  v41.origin.CGFloat y = a2;
  v41.size.CGFloat width = a3;
  v41.size.CGFloat height = a4;
  CGFloat MaxX = CGRectGetMaxX(v41);
  v42.origin.CGFloat x = a1;
  v42.origin.CGFloat y = a2;
  v42.size.CGFloat width = a3;
  v42.size.CGFloat height = a4;
  v17.n128_u64[0] = CGRectGetMinY(v42);
  v18.n128_f64[0] = MaxX;
  objc_msgSend(v9, "addLineToPoint:", nullsub_1(v18, v17, v19, v20));
  v43.origin.CGFloat x = a1;
  v43.origin.CGFloat y = a2;
  v43.size.CGFloat width = a3;
  v43.size.CGFloat height = a4;
  double v21 = CGRectGetMaxX(v43);
  v22.n128_u64[0] = *(void *)(v4 + OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius);
  v23.n128_u64[0] = v22.n128_u64[0];
  double v26 = nullsub_1(v22, v23, v24, v25);
  double v28 = v27;
  double v29 = v21 - v26;
  v44.origin.CGFloat x = a1;
  v44.origin.CGFloat y = a2;
  v44.size.CGFloat width = a3;
  v44.size.CGFloat height = a4;
  v30.n128_f64[0] = CGRectGetMaxY(v44) - v28;
  v31.n128_f64[0] = v29;
  [v9 addArcWithCenter:1 radius:nullsub_1(v31 startAngle:v30 endAngle:v32 clockwise:v33)];
  v45.origin.CGFloat x = a1;
  v45.origin.CGFloat y = a2;
  v45.size.CGFloat width = a3;
  v45.size.CGFloat height = a4;
  v34.n128_u64[0] = CGRectGetMaxY(v45);
  v35.n128_f64[0] = v15;
  objc_msgSend(v9, "addLineToPoint:", nullsub_1(v35, v34, v36, v37));
  [v9 closePath];
  return v9;
}

id sub_100012368()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LetterURectangleDescriptor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LetterURectangleDescriptor()
{
  return self;
}

uint64_t sub_1000123C0(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  id v9 = v8;
  BOOL v16 = sub_100012848(a1);
  char v17 = sub_100018B70();
  double v18 = 3.14159265;
  double x = 0.0;
  if ((v17 & 1) == 0) {
    double v18 = 0.0;
  }
  double v20 = 1.57079633;
  if (v17) {
    double v20 = -1.57079633;
  }
  if (v16)
  {
    double v21 = a3;
  }
  else
  {
    double v18 = v20;
    double v21 = a4;
  }
  if (v16) {
    double v22 = a4;
  }
  else {
    double v22 = a3;
  }
  CATransform3DMakeRotation(&v42, v18, 0.0, 0.0, 1.0);
  [v9 setTransform:&v42];
  double y = (1.0 - a3 / a4) * a4;
  if (a1 != 4)
  {
    if (a1 == 3)
    {
      double x = -y;
      double y = 0.0;
    }
    else
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
  }
  objc_msgSend(v9, "setFrame:", x, y, v21, v22, *(void *)&a7);
  sub_10000605C(a2, (uint64_t)&v42);
  if (v16)
  {
    type metadata accessor for ExtragalacticPortraitBannerDescriptor();
    swift_allocObject();
    uint64_t v24 = sub_10000CE50(&v42, a3, a4, a5, a6, v39, a8);
  }
  else
  {
    type metadata accessor for ExtragalacticLandscapeBannerDescriptor();
    swift_allocObject();
    uint64_t v24 = sub_100009378(&v42, a4, a3, a5, a6, v39, a8);
  }
  uint64_t v25 = OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_descriptor;
  *(void *)&v9[OBJC_IVAR____TtC19ExtragalacticPoster11BannerLayer_descriptor] = v24;
  swift_retain_n();
  swift_release();
  uint64_t v26 = *(void *)&v9[v25];
  if (!v26) {
    return swift_release_n();
  }
  uint64_t v41 = 0;
  uint64_t v27 = *(void *)(v26 + 32);
  uint64_t v28 = *(void *)(v27 + 16);
  if (!v28) {
    return swift_release_n();
  }
  uint64_t v29 = v27 + 32;
  swift_bridgeObjectRetain_n();
  for (uint64_t i = 0; i != v28; ++i)
  {
    __n128 v31 = (double *)(v29 + 24 * i);
    uint64_t v32 = *(void *)(*(void *)v31 + 56);
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      double v34 = v31[1];
      double v35 = v31[2];
      uint64_t v36 = v32 + 32;
      swift_bridgeObjectRetain_n();
      swift_retain();
      do
      {
        sub_100008BD0(v36, (uint64_t)&v42);
        sub_100011958((uint64_t)&v42, v9, &v41, v34, v35);
        sub_100008C2C((uint64_t)&v42);
        v36 += 48;
        --v33;
      }
      while (v33);
      swift_release();
      swift_bridgeObjectRelease_n();
    }
  }
  swift_release_n();
  return swift_bridgeObjectRelease_n();
}

id sub_1000127F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtragalacticBannerLayer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExtragalacticBannerLayer()
{
  return self;
}

BOOL sub_100012848(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_100012858()
{
  swift_bridgeObjectRelease();
  sub_1000070CC(v0 + 64);
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for LetterDescriptor()
{
  return self;
}

void destroy for LetterDescriptor.Element(uint64_t a1)
{
  sub_1000070CC(a1);
  objc_super v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for LetterDescriptor.Element(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for LetterDescriptor.Element(uint64_t *a1, uint64_t *a2)
{
  sub_10000C7B0(a1, a2);
  long long v4 = (void *)a2[5];
  uint64_t v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for LetterDescriptor.Element(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LetterDescriptor.Element(uint64_t a1, uint64_t a2)
{
  sub_1000070CC(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for LetterDescriptor.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LetterDescriptor.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LetterDescriptor.Element()
{
  return &type metadata for LetterDescriptor.Element;
}

uint64_t sub_100012AA0()
{
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  v10._countAndFlagsBits = 40;
  v10._object = (void *)0xE100000000000000;
  sub_100018A30(v10);
  uint64_t v1 = v0[13];
  unint64_t v2 = (void *)v0[14];
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v1;
  v11._object = v2;
  sub_100018A30(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 2633001;
  v12._object = (void *)0xE300000000000000;
  sub_100018A30(v12);
  uint64_t v3 = v0[11];
  long long v4 = sub_1000071C0(v0 + 8, v3);
  uint64_t v5 = *(void *)(v3 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  sub_100018DC0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  v13._countAndFlagsBits = 41;
  v13._object = (void *)0xE100000000000000;
  sub_100018A30(v13);
  return v9[0];
}

uint64_t sub_100012C00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012AA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100012C2C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*(void *)a2 + 104);
  uint64_t v4 = *(void *)(*(void *)a2 + 112);
  if (v3 == *(void *)(v2 + 104) && v4 == *(void *)(v2 + 112)) {
    return 1;
  }
  else {
    return sub_100018DE0();
  }
}

uint64_t sub_100012C58()
{
  swift_bridgeObjectRelease();
  sub_1000070CC(v0 + 64);
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for LetterITYDescriptor()
{
  return self;
}

uint64_t sub_100012CC4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>, double a4@<D0>)
{
  uint64_t result = sub_10001398C(*a1, *a2, a4);
  *a3 = result;
  return result;
}

uint64_t sub_100012CF4(void *a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, double a6, double a7, double a8)
{
  unint64_t v10 = a5.n128_u64[0];
  double v222 = a5.n128_f64[0];
  double v223 = a4.n128_f64[0];
  unint64_t v11 = a4.n128_u64[0];
  double v224 = a3.n128_f64[0];
  double v221 = a2.n128_f64[0];
  double v226 = a6 * 0.5;
  double v12 = a2.n128_f64[0] / 3.0;
  a4.n128_f64[0] = a2.n128_f64[0] / 3.0 + a7 + v226 + v226;
  a5.n128_f64[0] = a2.n128_f64[0] / 3.0 + v226 + v226;
  double v214 = a5.n128_f64[0];
  a2.n128_u64[0] = 0;
  a3.n128_u64[0] = 0;
  CGFloat v13 = nullsub_1(a2, a3, a4, a5);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  CGFloat rect = v18;
  double v20 = (objc_class *)type metadata accessor for RectangleDescriptor();
  double v21 = (char *)objc_allocWithZone(v20);
  double v22 = (CGFloat *)&v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *double v22 = v13;
  v22[1] = v15;
  CGFloat v196 = v15;
  CGFloat v198 = v13;
  id v22[2] = v17;
  v22[3] = v19;
  __n128 v23 = &v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  *(void *)__n128 v23 = 0;
  v23[8] = 1;
  *(void *)&v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
  uint64_t v24 = &v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  *(void *)uint64_t v24 = v11;
  *((void *)v24 + 1) = v10;
  *((double *)v24 + 2) = a6;
  uint64_t v25 = &v21[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)uint64_t v25 = 2;
  v25[8] = 0;
  v234.receiver = v21;
  v234.super_class = v20;
  id v201 = objc_msgSendSuper2(&v234, "init");
  double v205 = v12;
  double v26 = v224 - v12;
  v244.origin.double x = v13;
  v244.origin.double y = v15;
  v244.size.CGFloat width = v17;
  v244.size.CGFloat height = rect;
  v27.n128_f64[0] = CGRectGetMaxY(v244) - (v226 + v226);
  v28.n128_f64[0] = v224 - v12 + v226 + v226;
  v29.n128_f64[0] = v12 - v226;
  v30.n128_f64[0] = v214;
  double v31 = nullsub_1(v29, v27, v30, v28);
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v38 = (char *)objc_allocWithZone(v20);
  double v39 = (double *)&v38[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *double v39 = v31;
  *((void *)v39 + 1) = v33;
  *((void *)v39 + 2) = v35;
  *((void *)v39 + 3) = v37;
  CGRect v40 = &v38[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  *(void *)CGRect v40 = 0;
  v40[8] = 1;
  *(void *)&v38[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
  uint64_t v41 = (double *)&v38[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  *uint64_t v41 = v223;
  v41[1] = v222;
  v41[2] = a6;
  CATransform3D v42 = &v38[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)CATransform3D v42 = 4;
  v42[8] = 0;
  v233.receiver = v38;
  v233.super_class = v20;
  id v200 = objc_msgSendSuper2(&v233, "init");
  double v186 = v205 * 0.5;
  double v43 = v26 - v205 * 0.5;
  v44.n128_f64[0] = v224 - v43 - v226 + 0.0;
  v45.n128_f64[0] = v43 + v226;
  v46.n128_u64[0] = 0;
  v47.n128_f64[0] = v205 + v226;
  CGFloat v48 = nullsub_1(v46, v44, v47, v45);
  CGFloat v192 = v49;
  double v50 = v49;
  double v52 = v51;
  CGFloat v188 = v53;
  CGFloat v190 = v51;
  double v54 = v53;
  double v55 = (char *)objc_allocWithZone(v20);
  double v56 = (CGFloat *)&v55[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *double v56 = v48;
  v56[1] = v50;
  v56[2] = v52;
  v56[3] = v54;
  uint64_t v57 = &v55[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  *(void *)uint64_t v57 = 0;
  v57[8] = 1;
  *(void *)&v55[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
  double v58 = (double *)&v55[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  *double v58 = v223;
  v58[1] = v222;
  v58[2] = a6;
  __n128 v59 = &v55[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)__n128 v59 = 6;
  v59[8] = 0;
  v232.receiver = v55;
  v232.super_class = v20;
  id v203 = objc_msgSendSuper2(&v232, "init");
  v60.n128_f64[0] = v205 + v205 - v226;
  v61.n128_f64[0] = v224 - a8 - v226 + 0.0;
  v62.n128_f64[0] = v226 + a8;
  v63.n128_f64[0] = v205 + v226;
  double v64 = nullsub_1(v60, v61, v63, v62);
  CGFloat v212 = v65;
  CGFloat v215 = v64;
  double v66 = v65;
  double v68 = v67;
  CGFloat v208 = v69;
  CGFloat v210 = v67;
  double v70 = v69;
  uint64_t v71 = (char *)objc_allocWithZone(v20);
  double v72 = (double *)&v71[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_frame];
  *double v72 = v64;
  v72[1] = v66;
  v72[2] = v68;
  v72[3] = v70;
  double v73 = &v71[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_roundedCorners];
  *(void *)double v73 = 0;
  v73[8] = 1;
  *(void *)&v71[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_cornerRadius] = 0;
  uint64_t v74 = (double *)&v71[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_configuration];
  *uint64_t v74 = v223;
  v74[1] = v222;
  v74[2] = a6;
  double v75 = &v71[OBJC_IVAR____TtC19ExtragalacticPoster19RectangleDescriptor_excludingEdges];
  *(void *)double v75 = 12;
  v75[8] = 0;
  v231.receiver = v71;
  v231.super_class = v20;
  id v202 = objc_msgSendSuper2(&v231, "init");
  v245.origin.double y = v192;
  v245.origin.double x = v48;
  v245.size.CGFloat height = v188;
  v245.size.CGFloat width = v190;
  v76.n128_f64[0] = v226 + v226 + CGRectGetMinY(v245) - (v205 + v226) + 0.0;
  v77.n128_u64[0] = 0;
  v78.n128_f64[0] = v205 + v226;
  v79.n128_f64[0] = v205 + v226;
  CGFloat v80 = nullsub_1(v77, v76, v78, v79);
  double v191 = v81;
  CGFloat v193 = v80;
  CGFloat v82 = v81;
  CGFloat v84 = v83;
  double v187 = v85;
  double v189 = v83;
  CGFloat v86 = v85;
  v246.origin.double y = v196;
  v246.origin.double x = v198;
  v246.size.CGFloat width = v17;
  v246.size.CGFloat height = rect;
  double MaxY = CGRectGetMaxY(v246);
  v247.origin.double x = v80;
  v247.origin.double y = v82;
  v247.size.CGFloat width = v84;
  v247.size.CGFloat height = v86;
  double v88 = MaxY - CGRectGetMinY(v247);
  v248.origin.double x = v80;
  v248.origin.double y = v82;
  v248.size.CGFloat width = v84;
  v248.size.CGFloat height = v86;
  v89.n128_u64[0] = CGRectGetMinY(v248);
  v90.n128_u64[0] = 0;
  v91.n128_f64[0] = v205 + v226;
  v92.n128_f64[0] = v88;
  double v93 = nullsub_1(v90, v89, v91, v92);
  uint64_t v197 = v94;
  double v199 = v93;
  uint64_t v194 = v96;
  uint64_t v195 = v95;
  v97.n128_f64[0] = a7;
  double v185 = v221 - a7 - v205;
  v98.n128_f64[0] = v226 + v221 - a7;
  v99.n128_f64[0] = v226 + v224 - a8;
  v100.n128_u64[0] = 0;
  double v101 = nullsub_1(v97, v100, v98, v99);
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  uint64_t v206 = type metadata accessor for ParallelogramDescriptor();
  swift_allocObject();
  CGFloat v184 = v101;
  CGFloat v183 = v107;
  uint64_t recta = sub_100014B44(0, 0, 1, 1, v101, v103, v105, v107, v223, v222, a6, v185 - v226);
  v249.origin.double y = v212;
  v249.origin.double x = v215;
  v249.size.CGFloat height = v208;
  v249.size.CGFloat width = v210;
  CGFloat MinX = CGRectGetMinX(v249);
  v250.origin.double x = v101;
  v250.origin.double y = v103;
  v250.size.CGFloat width = v105;
  v250.size.CGFloat height = v107;
  CGFloat Width = CGRectGetWidth(v250);
  v251.origin.double x = v101;
  v251.origin.double y = v103;
  v251.size.CGFloat width = v105;
  v251.size.CGFloat height = v107;
  v110.n128_u64[0] = CGRectGetHeight(v251);
  v111.n128_u64[0] = 0;
  v112.n128_f64[0] = MinX;
  v113.n128_f64[0] = Width;
  double v114 = nullsub_1(v112, v111, v113, v110);
  double v116 = v115;
  double v118 = v117;
  double v120 = v119;
  swift_allocObject();
  uint64_t v207 = sub_100014B44(0, 0, 0, 1, v114, v116, v118, v120, v223, v222, a6, v185);
  v252.origin.double x = v114;
  v252.origin.double y = v116;
  v252.size.CGFloat width = v118;
  v252.size.CGFloat height = v120;
  double v121 = v226 * 1.5 + v186 * ((CGRectGetHeight(v252) + a6) / v185);
  v253.size.CGFloat width = v105;
  v253.origin.double x = v184;
  v253.origin.double y = v103;
  v253.size.CGFloat height = v183;
  double v122 = v185 + CGRectGetMinX(v253) - v226 * 1.5;
  v254.origin.double x = v114;
  v254.origin.double y = v116;
  v254.size.CGFloat width = v118;
  v254.size.CGFloat height = v120;
  CGFloat v123 = CGRectGetMaxY(v254) - v121;
  v255.origin.double y = v212;
  v255.origin.double x = v215;
  v255.size.CGFloat height = v208;
  v255.size.CGFloat width = v210;
  v124.n128_f64[0] = v226 * 1.5 + v226 * 1.5 + CGRectGetWidth(v255);
  v125.n128_f64[0] = v122;
  v126.n128_f64[0] = v123;
  v127.n128_f64[0] = v121;
  double v128 = nullsub_1(v125, v126, v124, v127);
  uint64_t v130 = v129;
  double v132 = v131;
  double v134 = v133;
  uint64_t v213 = type metadata accessor for IsoscelesTriangleDescriptor();
  uint64_t v135 = swift_allocObject();
  double v136 = atan(v134 * 0.5 / v132);
  unint64_t v137 = sub_100007D58(1, 1, v226, v136, v132, v134, v134 * 0.5 / v132);
  uint64_t v138 = sub_10001474C(v137);
  swift_bridgeObjectRelease();
  uint64_t v211 = v135;
  *(void *)(v135 + 72) = v138;
  *(double *)(v135 + 16) = v128;
  *(void *)(v135 + 24) = v130;
  *(double *)(v135 + 32) = v132;
  *(double *)(v135 + 40) = v134;
  *(double *)(v135 + 48) = v223;
  *(double *)(v135 + 56) = v222;
  *(double *)(v135 + 64) = a6;
  sub_1000060C0(&qword_100026F90);
  uint64_t v139 = swift_allocObject();
  *(_OWORD *)(v139 + 16) = xmmword_10001B760;
  v229 = (ValueMetadata *)v20;
  v230 = &off_100021498;
  *(void *)&long long v228 = v201;
  uint64_t v141 = a1[3];
  uint64_t v140 = a1[4];
  sub_1000071C0(a1, v141);
  Swift::String v142 = *(uint64_t (**)(uint64_t, uint64_t))(v140 + 48);
  id v227 = v201;
  uint64_t v143 = v142(v141, v140);
  sub_100007204(&v228, v139 + 32);
  *(void *)(v139 + 72) = v143;
  v229 = (ValueMetadata *)v20;
  v230 = &off_100021498;
  *(void *)&long long v228 = v200;
  uint64_t v145 = a1[3];
  uint64_t v144 = a1[4];
  sub_1000071C0(a1, v145);
  v146 = *(uint64_t (**)(uint64_t, uint64_t))(v144 + 32);
  id v216 = v200;
  uint64_t v147 = v146(v145, v144);
  sub_100007204(&v228, v139 + 80);
  *(void *)(v139 + 120) = v147;
  v229 = &type metadata for CircleDescriptor;
  v230 = &off_1000214D8;
  uint64_t v148 = swift_allocObject();
  *(void *)&long long v228 = v148;
  *(CGFloat *)(v148 + 16) = v193;
  *(double *)(v148 + 24) = v191;
  *(double *)(v148 + 32) = v189;
  *(double *)(v148 + 40) = v187;
  *(double *)(v148 + 48) = v223;
  *(double *)(v148 + 56) = v222;
  *(double *)(v148 + 64) = a6;
  uint64_t v150 = a1[3];
  uint64_t v149 = a1[4];
  sub_1000071C0(a1, v150);
  uint64_t v151 = (*(uint64_t (**)(uint64_t, uint64_t))(v149 + 40))(v150, v149);
  sub_100007204(&v228, v139 + 128);
  *(void *)(v139 + 168) = v151;
  v229 = &type metadata for CircleDescriptor;
  v230 = &off_1000214D8;
  uint64_t v152 = swift_allocObject();
  *(void *)&long long v228 = v152;
  *(double *)(v152 + 16) = v199;
  *(void *)(v152 + 24) = v197;
  *(void *)(v152 + 32) = v195;
  *(void *)(v152 + 40) = v194;
  *(double *)(v152 + 48) = v223;
  *(double *)(v152 + 56) = v222;
  *(double *)(v152 + 64) = a6;
  uint64_t v153 = a1[3];
  uint64_t v154 = a1[4];
  sub_1000071C0(a1, v153);
  uint64_t v155 = (*(uint64_t (**)(uint64_t, uint64_t))(v154 + 32))(v153, v154);
  sub_100007204(&v228, v139 + 176);
  *(void *)(v139 + 216) = v155;
  v229 = (ValueMetadata *)v20;
  v230 = &off_100021498;
  *(void *)&long long v228 = v203;
  uint64_t v156 = a1[3];
  uint64_t v157 = a1[4];
  sub_1000071C0(a1, v156);
  v158 = *(uint64_t (**)(uint64_t, uint64_t))(v157 + 48);
  id v209 = v203;
  uint64_t v159 = v158(v156, v157);
  sub_100007204(&v228, v139 + 224);
  *(void *)(v139 + 264) = v159;
  v229 = (ValueMetadata *)v20;
  v230 = &off_100021498;
  *(void *)&long long v228 = v202;
  uint64_t v160 = a1[3];
  uint64_t v161 = a1[4];
  sub_1000071C0(a1, v160);
  v162 = *(uint64_t (**)(uint64_t, uint64_t))(v161 + 40);
  id v204 = v202;
  uint64_t v163 = v162(v160, v161);
  sub_100007204(&v228, v139 + 272);
  *(void *)(v139 + 312) = v163;
  v229 = (ValueMetadata *)v206;
  v230 = &off_100021458;
  *(void *)&long long v228 = recta;
  uint64_t v164 = a1[3];
  uint64_t v165 = a1[4];
  sub_1000071C0(a1, v164);
  v166 = *(uint64_t (**)(uint64_t, uint64_t))(v165 + 40);
  swift_retain();
  uint64_t v167 = v166(v164, v165);
  sub_100007204(&v228, v139 + 320);
  *(void *)(v139 + 360) = v167;
  v229 = (ValueMetadata *)v206;
  v230 = &off_100021458;
  *(void *)&long long v228 = v207;
  uint64_t v168 = a1[3];
  uint64_t v169 = a1[4];
  sub_1000071C0(a1, v168);
  v170 = *(uint64_t (**)(uint64_t, uint64_t))(v169 + 48);
  swift_retain();
  uint64_t v171 = v170(v168, v169);
  sub_100007204(&v228, v139 + 368);
  *(void *)(v139 + 408) = v171;
  v229 = (ValueMetadata *)v213;
  v230 = &off_100021458;
  *(void *)&long long v228 = v211;
  uint64_t v172 = a1[3];
  uint64_t v173 = a1[4];
  sub_1000071C0(a1, v172);
  v174 = *(uint64_t (**)(uint64_t, uint64_t))(v173 + 32);
  swift_retain();
  uint64_t v175 = v174(v172, v173);
  sub_100007204(&v228, v139 + 416);
  *(void *)(v139 + 456) = v175;
  *(void *)&long long v228 = 0;
  *((void *)&v228 + 1) = 0xE000000000000000;
  sub_100018C30(23);
  v235._countAndFlagsBits = 0x282D595449;
  v235._object = (void *)0xE500000000000000;
  sub_100018A30(v235);
  v243.CGFloat width = v221;
  v243.CGFloat height = v224;
  v176 = NSStringFromCGSize(v243);
  uint64_t v177 = sub_1000189F0();
  v179 = v178;

  v236._countAndFlagsBits = v177;
  v236._object = v179;
  sub_100018A30(v236);
  swift_bridgeObjectRelease();
  v237._countAndFlagsBits = 2633001;
  v237._object = (void *)0xE300000000000000;
  sub_100018A30(v237);
  v238._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v238);
  swift_bridgeObjectRelease();
  v239._countAndFlagsBits = 2633001;
  v239._object = (void *)0xE300000000000000;
  sub_100018A30(v239);
  v240._countAndFlagsBits = sub_100018AF0();
  sub_100018A30(v240);
  swift_bridgeObjectRelease();
  v241._countAndFlagsBits = 2633001;
  v241._object = (void *)0xE300000000000000;
  sub_100018A30(v241);
  sub_1000071C0(a1, a1[3]);
  sub_100018DC0();
  v242._countAndFlagsBits = 41;
  v242._object = (void *)0xE100000000000000;
  sub_100018A30(v242);

  swift_release();
  swift_release();
  swift_release();
  long long v180 = v228;
  sub_10000605C((uint64_t)a1, (uint64_t)&v228);
  type metadata accessor for LetterITYDescriptor();
  uint64_t v181 = swift_allocObject();
  *(void *)(v181 + 120) = 0;
  *(void *)(v181 + 128) = 0;
  *(double *)(v181 + 40) = v221;
  *(double *)(v181 + 48) = v224;
  *(double *)(v181 + 16) = v223;
  *(double *)(v181 + 24) = v222;
  *(double *)(v181 + 32) = a6;
  *(void *)(v181 + 56) = v139;
  *(_OWORD *)(v181 + 104) = v180;
  sub_100007204(&v228, v181 + 64);
  *(double *)(v181 + 120) = a7;
  *(double *)(v181 + 128) = a8;
  sub_1000070CC((uint64_t)a1);
  return v181;
}

uint64_t sub_10001398C(uint64_t a1, uint64_t a2, double a3)
{
  sub_100018B80();
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  sub_1000186A0();
  unint64_t v11 = v10;
  sub_1000186A0();
  unint64_t v13 = v12;
  sub_1000186A0();
  double v15 = v14;
  sub_1000186A0();
  double v17 = v16;
  sub_10000605C(a1 + 64, (uint64_t)v29);
  sub_10000605C(a2 + 64, (uint64_t)v28);
  if (a3 <= 0.0)
  {
    double v19 = v29;
LABEL_6:
    sub_10000605C((uint64_t)v19, (uint64_t)v30);
    goto LABEL_7;
  }
  if (a3 >= 1.0)
  {
    double v19 = v28;
    goto LABEL_6;
  }
  v30[3] = &type metadata for InterpolatedColorProvider;
  v30[4] = sub_10000711C();
  uint64_t v18 = swift_allocObject();
  v30[0] = v18;
  sub_10000605C((uint64_t)v29, v18 + 16);
  sub_10000605C((uint64_t)v28, v18 + 56);
  *(double *)(v18 + 96) = a3;
LABEL_7:
  sub_1000070CC((uint64_t)v28);
  sub_1000070CC((uint64_t)v29);
  sub_1000186A0();
  double v21 = v20;
  sub_10000605C((uint64_t)v30, (uint64_t)v29);
  v22.n128_u64[0] = v7;
  v23.n128_u64[0] = v9;
  v24.n128_u64[0] = v11;
  v25.n128_u64[0] = v13;
  uint64_t v26 = sub_100012CF4(v29, v22, v23, v24, v25, v15, v17, v21);
  sub_1000070CC((uint64_t)v30);
  return v26;
}

uint64_t sub_100013B48()
{
  sub_1000070CC(v0 + 16);
  sub_1000070CC(v0 + 56);
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_100013B88()
{
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100013B98()
{
  sub_100018C30(19);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = sub_100018A00();
  sub_100018A30(v2);
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_100018A10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100013C68@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100021168;
  v7._object = v3;
  Swift::Int v5 = sub_100018D90(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100013CBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000144D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100013CE8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_1000211A0;
  v8._object = a2;
  Swift::Int v6 = sub_100018D90(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_100013D40()
{
  return 0;
}

void sub_100013D4C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100013D58(uint64_t a1)
{
  unint64_t v2 = sub_1000143FC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100013D94(uint64_t a1)
{
  unint64_t v2 = sub_1000143FC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100013DD8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100010A74(a1, a2);
  if (result == 10)
  {
    uint64_t result = swift_bridgeObjectRelease();
    a1 = 0;
    a2 = 0;
  }
  *a3 = a1;
  a3[1] = (uint64_t)a2;
  return result;
}

uint64_t sub_100013E3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000144F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100013E68()
{
  return sub_100013B98();
}

uint64_t sub_100013E70()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100013EA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000060C0(&qword_100027EE0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000071C0(a1, a1[3]);
  sub_1000143FC();
  sub_100018E40();
  if (v2) {
    return sub_1000070CC((uint64_t)a1);
  }
  uint64_t v9 = sub_100018DA0();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1000070CC((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_100014018(void *a1)
{
  uint64_t v2 = sub_1000060C0(&qword_100027ED0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000071C0(a1, a1[3]);
  sub_1000143FC();
  sub_100018E50();
  sub_100018DB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100014150(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_100018DE0();
  }
}

uint64_t sub_100014180()
{
  return 1;
}

Swift::Int sub_100014188()
{
  return sub_100018E30();
}

uint64_t sub_1000141E4(char a1)
{
  return *(void *)&aUnity_3[8 * a1];
}

void *initializeBufferWithCopyOfBuffer for ExtragalacticPosterData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExtragalacticPosterData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ExtragalacticPosterData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ExtragalacticPosterData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtragalacticPosterData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtragalacticPosterData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtragalacticPosterData()
{
  return &type metadata for ExtragalacticPosterData;
}

unint64_t sub_10001434C()
{
  unint64_t result = qword_100027EC0;
  if (!qword_100027EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027EC0);
  }
  return result;
}

unint64_t sub_1000143A8()
{
  unint64_t result = qword_100027EC8;
  if (!qword_100027EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027EC8);
  }
  return result;
}

unint64_t sub_1000143FC()
{
  unint64_t result = qword_100027ED8;
  if (!qword_100027ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027ED8);
  }
  return result;
}

Swift::Int sub_100014450()
{
  return sub_100018E30();
}

uint64_t sub_1000144B0()
{
  return sub_100018A20();
}

uint64_t sub_1000144D4()
{
  return 0x6E6564496B6F6F6CLL;
}

uint64_t sub_1000144F8()
{
  return 0x7974696E75;
}

uint64_t getEnumTagSinglePayload for ExtragalacticPosterData.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ExtragalacticPosterData.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000145FCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100014624()
{
  return 0;
}

ValueMetadata *type metadata accessor for ExtragalacticPosterData.CodingKeys()
{
  return &type metadata for ExtragalacticPosterData.CodingKeys;
}

unint64_t sub_100014640()
{
  unint64_t result = qword_100027EE8;
  if (!qword_100027EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027EE8);
  }
  return result;
}

unint64_t sub_100014698()
{
  unint64_t result = qword_100027EF0;
  if (!qword_100027EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027EF0);
  }
  return result;
}

unint64_t sub_1000146F0()
{
  unint64_t result = qword_100027EF8;
  if (!qword_100027EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027EF8);
  }
  return result;
}

uint64_t sub_10001474C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100018D30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  int v3 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  double v16 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t result = sub_100015268(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    int v3 = v16;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = sub_100018C50();
        double v16 = v3;
        unint64_t v8 = v3[2];
        unint64_t v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_100015268(v7 > 1, v8 + 1, 1);
          int v3 = v16;
        }
        ++v5;
        uint64_t v14 = type metadata accessor for PolygonPathPointStep();
        unint64_t v15 = sub_100015288();
        *(void *)&long long v13 = v6;
        v3[2] = v8 + 1;
        sub_100007204(&v13, (uint64_t)&v3[5 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        double v16 = v3;
        unint64_t v11 = v3[2];
        unint64_t v12 = v3[3];
        swift_retain();
        if (v11 >= v12 >> 1)
        {
          sub_100015268(v12 > 1, v11 + 1, 1);
          int v3 = v16;
        }
        uint64_t v14 = type metadata accessor for PolygonPathPointStep();
        unint64_t v15 = sub_100015288();
        *(void *)&long long v13 = v10;
        v3[2] = v11 + 1;
        sub_100007204(&v13, (uint64_t)&v3[5 * v11 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014910(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100018D30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  int v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  long long v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_1000152E0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_100018C50();
        sub_1000154A4();
        swift_dynamicCast();
        int v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000152E0(0, v3[2] + 1, 1);
          int v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_1000152E0(v6 > 1, v7 + 1, 1);
          int v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_1000154E4(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      unint64_t v8 = (id *)(a1 + 32);
      sub_1000154A4();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        int v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000152E0(0, v3[2] + 1, 1);
          int v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_1000152E0(v10 > 1, v11 + 1, 1);
          int v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_1000154E4(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014B44(char a1, char a2, char a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v21 = 0.0;
  if (a2) {
    double v21 = a11;
  }
  long double v22 = atan((a12 - v21) / a7);
  double v23 = a11 * 0.5 / cos(v22);
  if (a2) {
    double v24 = a11 - a11 - v23;
  }
  else {
    double v24 = v23 - a11;
  }
  if (a1) {
    double v25 = -(a11 * 0.5);
  }
  else {
    double v25 = a11 * 0.5;
  }
  double v26 = sub_1000067B4();
  if (a4) {
    CGFloat v30 = v25;
  }
  else {
    CGFloat v30 = v24;
  }
  if (a4) {
    CGFloat v31 = v24;
  }
  else {
    CGFloat v31 = v25;
  }
  *(CGRect *)v34.n128_u64 = CGRectInset(*(CGRect *)&v26, v31, v30);
  CGFloat v32 = v34.n128_f64[0];
  CGFloat width = v53.size.width;
  CGFloat y = v53.origin.y;
  CGFloat height = v53.size.height;
  v34.n128_f64[0] = v23 * 0.25;
  double v35 = v23 * 0.5 + a11;
  if (a4)
  {
    v34.n128_f64[0] = a7 - a12 + v34.n128_f64[0];
    v53.origin.CGFloat y = 0.0;
    double v38 = nullsub_1(v34, *(__n128 *)&v53.origin.y, (__n128)v53.size, *(__n128 *)&v53.size.height);
    double v39 = v40.n128_f64[0];
    v40.n128_u64[0] = 0;
    v41.n128_f64[0] = v35;
  }
  else
  {
    v53.origin.CGFloat y = a8 - a12 + v34.n128_f64[0];
    v34.n128_u64[0] = 0;
    double v38 = nullsub_1(v34, *(__n128 *)&v53.origin.y, (__n128)v53.size, *(__n128 *)&v53.size.height);
    double v39 = v40.n128_f64[0];
    v41.n128_u64[0] = 0;
    v40.n128_f64[0] = v35;
  }
  double v42 = nullsub_1(v41, v40, v36, v37);
  unint64_t v44 = sub_100014CF0(a3 & 1, a4 & 1, v32, y, width, height, v42, v43, v38, v39);
  uint64_t v45 = sub_10001474C(v44);
  swift_bridgeObjectRelease();
  *(void *)(v12 + 72) = v45;
  *(double *)(v12 + 16) = a5;
  *(double *)(v12 + 24) = a6;
  *(double *)(v12 + 32) = a7;
  *(double *)(v12 + 40) = a8;
  *(double *)(v12 + 48) = a9;
  *(double *)(v12 + 56) = a10;
  *(double *)(v12 + 64) = a11;
  return v12;
}

uint64_t sub_100014CF0(char a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9, double a10)
{
  sub_1000060C0(&qword_100027590);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10001A940;
  if (a1)
  {
    double v129 = a8;
    double v130 = a7;
    CGFloat v19 = a3;
    CGFloat v20 = a4;
    CGFloat v21 = a5;
    CGFloat v22 = a6;
    if (a2)
    {
      CGFloat v23 = CGRectGetMaxX(*(CGRect *)&v19) - a7;
      v133.origin.double x = a3;
      v133.origin.CGFloat y = a4;
      v133.size.CGFloat width = a5;
      v133.size.CGFloat height = a6;
      v24.n128_f64[0] = CGRectGetMaxY(v133) - a8;
      v25.n128_f64[0] = v23;
      double v28 = nullsub_1(v25, v24, v26, v27);
      uint64_t v30 = v29;
      type metadata accessor for PolygonPathPointStep();
      uint64_t v31 = swift_allocObject();
      *(double *)(v31 + 16) = v28;
      *(void *)(v31 + 24) = v30;
      *(void *)(v18 + 32) = v31;
      v134.origin.double x = a3;
      v134.origin.CGFloat y = a4;
      v134.size.CGFloat width = a5;
      v134.size.CGFloat height = a6;
      double v32 = a9;
      CGFloat v33 = CGRectGetMaxX(v134) - a9;
      v135.origin.double x = a3;
      v135.origin.CGFloat y = a4;
      v135.size.CGFloat width = a5;
      v135.size.CGFloat height = a6;
      double v34 = a10;
      v35.n128_f64[0] = CGRectGetMaxY(v135) - a10;
      v36.n128_f64[0] = v33;
      double v39 = nullsub_1(v36, v35, v37, v38);
      uint64_t v41 = v40;
      uint64_t v42 = swift_allocObject();
      *(double *)(v42 + 16) = v39;
      *(void *)(v42 + 24) = v41;
      *(void *)(v18 + 40) = v42;
      v136.origin.double x = a3;
      v136.origin.CGFloat y = a4;
      v136.size.CGFloat width = a5;
      v136.size.CGFloat height = a6;
      double v43 = CGRectGetMinX(v136) + v130;
      v137.origin.double x = a3;
      v137.origin.CGFloat y = a4;
      v137.size.CGFloat width = a5;
      v137.size.CGFloat height = a6;
      v45.n128_f64[0] = CGRectGetMinY(v137) + v129;
    }
    else
    {
      CGFloat v84 = CGRectGetMinX(*(CGRect *)&v19) + a7;
      v145.origin.double x = a3;
      v145.origin.CGFloat y = a4;
      v145.size.CGFloat width = a5;
      v145.size.CGFloat height = a6;
      v85.n128_f64[0] = CGRectGetMinY(v145) + a8;
      v86.n128_f64[0] = v84;
      double v89 = nullsub_1(v86, v85, v87, v88);
      uint64_t v91 = v90;
      type metadata accessor for PolygonPathPointStep();
      uint64_t v92 = swift_allocObject();
      *(double *)(v92 + 16) = v89;
      *(void *)(v92 + 24) = v91;
      *(void *)(v18 + 32) = v92;
      v146.origin.double x = a3;
      v146.origin.CGFloat y = a4;
      v146.size.CGFloat width = a5;
      v146.size.CGFloat height = a6;
      double v32 = a9;
      CGFloat v93 = CGRectGetMaxX(v146) - a9;
      v147.origin.double x = a3;
      v147.origin.CGFloat y = a4;
      v147.size.CGFloat width = a5;
      v147.size.CGFloat height = a6;
      double v34 = a10;
      v94.n128_f64[0] = CGRectGetMaxY(v147) - a10;
      v95.n128_f64[0] = v93;
      double v98 = nullsub_1(v95, v94, v96, v97);
      uint64_t v100 = v99;
      uint64_t v101 = swift_allocObject();
      *(double *)(v101 + 16) = v98;
      *(void *)(v101 + 24) = v100;
      *(void *)(v18 + 40) = v101;
      v148.origin.double x = a3;
      v148.origin.CGFloat y = a4;
      v148.size.CGFloat width = a5;
      v148.size.CGFloat height = a6;
      double v43 = CGRectGetMaxX(v148) - v130;
      v149.origin.double x = a3;
      v149.origin.CGFloat y = a4;
      v149.size.CGFloat width = a5;
      v149.size.CGFloat height = a6;
      v45.n128_f64[0] = CGRectGetMaxY(v149) - v129;
    }
    v44.n128_f64[0] = v43;
    double v102 = nullsub_1(v44, v45, v46, v47);
    uint64_t v104 = v103;
    uint64_t v105 = swift_allocObject();
    *(double *)(v105 + 16) = v102;
    *(void *)(v105 + 24) = v104;
    *(void *)(v18 + 48) = v105;
    v150.origin.double x = a3;
    v150.origin.CGFloat y = a4;
    v150.size.CGFloat width = a5;
    v150.size.CGFloat height = a6;
    double v79 = CGRectGetMinX(v150) + v32;
    v151.origin.double x = a3;
    v151.origin.CGFloat y = a4;
    v151.size.CGFloat width = a5;
    v151.size.CGFloat height = a6;
    v81.n128_f64[0] = CGRectGetMinY(v151) + v34;
  }
  else
  {
    v138.origin.double x = a3;
    v138.origin.CGFloat y = a4;
    v138.size.CGFloat width = a5;
    v138.size.CGFloat height = a6;
    CGFloat v48 = CGRectGetMinX(v138) + a7;
    v139.origin.double x = a3;
    v139.origin.CGFloat y = a4;
    v139.size.CGFloat width = a5;
    v139.size.CGFloat height = a6;
    v49.n128_f64[0] = CGRectGetMaxY(v139) - a8;
    v50.n128_f64[0] = v48;
    double v53 = nullsub_1(v50, v49, v51, v52);
    uint64_t v55 = v54;
    type metadata accessor for PolygonPathPointStep();
    uint64_t v56 = swift_allocObject();
    *(double *)(v56 + 16) = v53;
    *(void *)(v56 + 24) = v55;
    *(void *)(v18 + 32) = v56;
    CGFloat v57 = a3;
    CGFloat v58 = a4;
    CGFloat v59 = a5;
    CGFloat v60 = a6;
    if (a2)
    {
      CGFloat v61 = CGRectGetMinX(*(CGRect *)&v57) + a9;
      v140.origin.double x = a3;
      v140.origin.CGFloat y = a4;
      v140.size.CGFloat width = a5;
      v140.size.CGFloat height = a6;
      v62.n128_f64[0] = CGRectGetMaxY(v140) - a10;
      v63.n128_f64[0] = v61;
      double v66 = nullsub_1(v63, v62, v64, v65);
      uint64_t v68 = v67;
      uint64_t v69 = swift_allocObject();
      *(double *)(v69 + 16) = v66;
      *(void *)(v69 + 24) = v68;
      *(void *)(v18 + 40) = v69;
      v141.origin.double x = a3;
      v141.origin.CGFloat y = a4;
      v141.size.CGFloat width = a5;
      v141.size.CGFloat height = a6;
      CGFloat v70 = CGRectGetMaxX(v141) - a7;
      v142.origin.double x = a3;
      v142.origin.CGFloat y = a4;
      v142.size.CGFloat width = a5;
      v142.size.CGFloat height = a6;
      v71.n128_f64[0] = CGRectGetMinY(v142) + a8;
      v72.n128_f64[0] = v70;
      double v75 = nullsub_1(v72, v71, v73, v74);
      uint64_t v77 = v76;
      uint64_t v78 = swift_allocObject();
      *(double *)(v78 + 16) = v75;
      *(void *)(v78 + 24) = v77;
      *(void *)(v18 + 48) = v78;
      v143.origin.double x = a3;
      v143.origin.CGFloat y = a4;
      v143.size.CGFloat width = a5;
      v143.size.CGFloat height = a6;
      double v79 = CGRectGetMaxX(v143) - a9;
      v144.origin.double x = a3;
      v144.origin.CGFloat y = a4;
      v144.size.CGFloat width = a5;
      v144.size.CGFloat height = a6;
      v81.n128_f64[0] = CGRectGetMinY(v144) + a10;
    }
    else
    {
      CGFloat v106 = CGRectGetMaxX(*(CGRect *)&v57) - a9;
      v152.origin.double x = a3;
      v152.origin.CGFloat y = a4;
      v152.size.CGFloat width = a5;
      v152.size.CGFloat height = a6;
      v107.n128_f64[0] = CGRectGetMinY(v152) + a10;
      v108.n128_f64[0] = v106;
      double v111 = nullsub_1(v108, v107, v109, v110);
      uint64_t v113 = v112;
      uint64_t v114 = swift_allocObject();
      *(double *)(v114 + 16) = v111;
      *(void *)(v114 + 24) = v113;
      *(void *)(v18 + 40) = v114;
      v153.origin.double x = a3;
      v153.origin.CGFloat y = a4;
      v153.size.CGFloat width = a5;
      v153.size.CGFloat height = a6;
      CGFloat v115 = CGRectGetMaxX(v153) - a7;
      v154.origin.double x = a3;
      v154.origin.CGFloat y = a4;
      v154.size.CGFloat width = a5;
      v154.size.CGFloat height = a6;
      v116.n128_f64[0] = CGRectGetMinY(v154) + a8;
      v117.n128_f64[0] = v115;
      double v120 = nullsub_1(v117, v116, v118, v119);
      uint64_t v122 = v121;
      uint64_t v123 = swift_allocObject();
      *(double *)(v123 + 16) = v120;
      *(void *)(v123 + 24) = v122;
      *(void *)(v18 + 48) = v123;
      v155.origin.double x = a3;
      v155.origin.CGFloat y = a4;
      v155.size.CGFloat width = a5;
      v155.size.CGFloat height = a6;
      double v79 = CGRectGetMinX(v155) + a9;
      v156.origin.double x = a3;
      v156.origin.CGFloat y = a4;
      v156.size.CGFloat width = a5;
      v156.size.CGFloat height = a6;
      v81.n128_f64[0] = CGRectGetMaxY(v156) - a10;
    }
  }
  v80.n128_f64[0] = v79;
  double v124 = nullsub_1(v80, v81, v82, v83);
  uint64_t v126 = v125;
  uint64_t v127 = swift_allocObject();
  *(double *)(v127 + 16) = v124;
  *(void *)(v127 + 24) = v126;
  *(void *)(v18 + 56) = v127;
  sub_100018A90();
  return v18;
}

uint64_t type metadata accessor for ParallelogramDescriptor()
{
  return self;
}

uint64_t sub_100015268(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100015300(a1, a2, a3, (void *)*v3);
  *int v3 = result;
  return result;
}

unint64_t sub_100015288()
{
  unint64_t result = qword_100027FB8;
  if (!qword_100027FB8)
  {
    type metadata accessor for PolygonPathPointStep();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100027FB8);
  }
  return result;
}

uint64_t sub_1000152E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000154F4(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_100015300(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000060C0(&qword_100027FC0);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    uint64_t v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_1000060C0(&qword_100026DE0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100018D80();
  __break(1u);
  return result;
}

unint64_t sub_1000154A4()
{
  unint64_t result = qword_100027FC8;
  if (!qword_100027FC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100027FC8);
  }
  return result;
}

_OWORD *sub_1000154E4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000154F4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000060C0(&qword_100027FD0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100018D80();
  __break(1u);
  return result;
}

unint64_t sub_100015664(uint64_t a1)
{
  uint64_t v2 = sub_1000060C0(&qword_100028038);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    int64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060C0(&qword_100028040);
  uint64_t v6 = sub_100018D70();
  int64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000168F0(v12, (uint64_t)v5, &qword_100028038);
    unint64_t result = sub_100016C28((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100018890();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7] + 24 * v16;
    uint64_t v20 = *((void *)v9 + 2);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v9;
    *(void *)(v19 + 16) = v20;
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10001586C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060C0(&qword_100027580);
  uint64_t v2 = (void *)sub_100018D70();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_100016CC0((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100015978(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000060C0(&qword_100028050);
  uint64_t v2 = sub_100018D70();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000168F0(v6, (uint64_t)v15, &qword_100028058);
    unint64_t result = sub_100016D04((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000154E4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100015ABC()
{
  if (qword_100026C90 != -1) {
    uint64_t result = swift_once();
  }
  double v0 = 3.6;
  if (byte_100029B70) {
    double v0 = 4.6;
  }
  qword_100027FD8 = *(void *)&v0;
  return result;
}

void *sub_100015B2C()
{
  if (qword_100026CD0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100027FD8;
  sub_1000060C0(&qword_100028030);
  uint64_t v1 = (int *)(sub_1000060C0(&qword_100028038) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001ADA0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v5 + v1[14];
  uint64_t v7 = enum case for Keyframe.Name.off(_:);
  uint64_t v8 = sub_100018890();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v5, v7, v8);
  *(_OWORD *)unint64_t v6 = xmmword_10001BB60;
  *(void *)(v6 + 16) = v0;
  unint64_t v10 = v5 + v2 + v1[14];
  v9();
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)unint64_t v10 = _Q0;
  *(void *)(v10 + 16) = 0;
  uint64_t v16 = v5 + 2 * v2 + v1[14];
  v9();
  *(_OWORD *)uint64_t v16 = xmmword_10001BB70;
  *(void *)(v16 + 16) = v0;
  uint64_t result = (void *)sub_100015664(v4);
  off_100027FE0 = result;
  return result;
}

id sub_100015D20(double a1, double a2, double a3, double a4)
{
  *(CGSize *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize] = CGSizeZero;
  uint64_t v9 = OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_primaryBannerLayer;
  unint64_t v10 = (objc_class *)type metadata accessor for ExtragalacticBannerLayer();
  id v11 = objc_allocWithZone(v10);
  uint64_t v12 = v4;
  *(void *)&v4[v9] = [v11 init];
  uint64_t v13 = OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer;
  *(void *)&v12[v13] = [objc_allocWithZone(v10) init];

  v16.receiver = v12;
  v16.super_class = (Class)type metadata accessor for BackgroundContentView();
  id v14 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  sub_100015F58();

  return v14;
}

id sub_100015E44(void *a1)
{
  *(CGSize *)&v1[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize] = CGSizeZero;
  uint64_t v3 = OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_primaryBannerLayer;
  uint64_t v4 = (objc_class *)type metadata accessor for ExtragalacticBannerLayer();
  id v5 = objc_allocWithZone(v4);
  unint64_t v6 = v1;
  *(void *)&v1[v3] = [v5 init];
  uint64_t v7 = OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer;
  *(void *)&v6[v7] = [objc_allocWithZone(v4) init];

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for BackgroundContentView();
  id v8 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    sub_100015F58();
  }
  return v9;
}

void sub_100015F58()
{
  id v1 = [self blackColor];
  [v0 setBackgroundColor:v1];

  [v0 setClipsToBounds:0];
  id v2 = [v0 layer];
  [v2 setMasksToBounds:0];

  id v3 = [v0 layer];
  [v3 addSublayer:*(void *)&v0[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer]];

  id v4 = [v0 layer];
  [v4 addSublayer:*(void *)&v0[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_primaryBannerLayer]];
}

id sub_100016078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  double v6 = COERCE_DOUBLE(sub_1000163C4(a3));
  if (v9) {
    double v10 = 1.0;
  }
  else {
    double v10 = v6;
  }
  if (v9) {
    double v11 = 0.0;
  }
  else {
    double v11 = v7;
  }
  if (v9) {
    double v12 = 0.0;
  }
  else {
    double v12 = v8;
  }
  uint64_t v13 = self;
  [v13 begin];
  [v13 setDisableActions:1];
  sub_10000605C(a1, (uint64_t)v27);
  sub_1000187E0();
  double v15 = v14;
  if (v14 > 0.0)
  {
    uint64_t v16 = sub_1000187B0();
    uint64_t v17 = sub_1000187B0();
    sub_1000187F0();
    sub_100012848(v17);
    sub_1000187E0();
    sub_1000186A0();
    sub_1000123C0(v16, (uint64_t)v27, *(CGFloat *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize], *(CGFloat *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize + 8], v18, v10, v11, v12);
  }
  uint64_t v19 = *(void **)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_primaryBannerLayer];
  [v19 setHidden:v15 <= 0.0];
  if (v15 < 1.0)
  {
    uint64_t v20 = sub_1000187C0();
    uint64_t v21 = sub_1000187C0();
    sub_1000187F0();
    sub_100012848(v21);
    sub_1000187E0();
    sub_1000186A0();
    uint64_t v22 = *(void *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer];
    sub_1000123C0(v20, (uint64_t)v27, *(CGFloat *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize], *(CGFloat *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_portraitSize + 8], v23, v10, v11, v12);
    sub_1000070CC((uint64_t)v27);
    LODWORD(v20) = sub_100016788(v20);
    id v24 = [v4 layer];
    __n128 v25 = v24;
    if (v20) {
      [v24 insertSublayer:v22 above:v19];
    }
    else {
      [v24 insertSublayer:v22 below:v19];
    }
  }
  else
  {
    sub_1000070CC((uint64_t)v27);
  }
  [*(id *)&v4[OBJC_IVAR____TtC19ExtragalacticPoster21BackgroundContentView_secondaryBannerLayer] setHidden:v15 >= 1.0];
  return [v13 commit];
}

id sub_100016320()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundContentView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BackgroundContentView()
{
  return self;
}

uint64_t sub_1000163C4(uint64_t a1)
{
  uint64_t v2 = sub_100018890();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  double v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  char v9 = (char *)&v36 - v8;
  __chkstk_darwin(v7);
  double v11 = (char *)&v36 - v10;
  if (qword_100026CD8 != -1) {
    swift_once();
  }
  double v12 = off_100027FE0;
  uint64_t v13 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v13(v11, enum case for Keyframe.Name.off(_:), v2);
  uint64_t v14 = v12[2];
  uint64_t v44 = a1;
  if (v14 && (unint64_t v15 = sub_100016C28((uint64_t)v11), (v16 & 1) != 0))
  {
    int v43 = 0;
    uint64_t v17 = (uint64_t *)(v12[7] + 24 * v15);
    uint64_t v42 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v18 = v17[2];
    uint64_t v41 = v19;
    uint64_t v40 = v18;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v41 = 0;
    uint64_t v40 = 0;
    int v43 = 1;
  }
  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v11, v2);
  uint64_t v21 = off_100027FE0;
  v13(v9, enum case for Keyframe.Name.wake(_:), v2);
  if (v21[2] && (unint64_t v22 = sub_100016C28((uint64_t)v9), (v23 & 1) != 0))
  {
    char v24 = 0;
    __n128 v25 = (uint64_t *)(v21[7] + 24 * v22);
    uint64_t v39 = *v25;
    uint64_t v27 = v25[1];
    uint64_t v26 = v25[2];
    uint64_t v38 = v27;
    uint64_t v37 = v26;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v38 = 0;
    uint64_t v37 = 0;
    char v24 = 1;
  }
  v20(v9, v2);
  double v28 = off_100027FE0;
  v13(v6, enum case for Keyframe.Name.unlocked(_:), v2);
  if (v28[2] && (unint64_t v29 = sub_100016C28((uint64_t)v6), (v30 & 1) != 0))
  {
    uint64_t v31 = (uint64_t *)(v28[7] + 24 * v29);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    uint64_t v34 = v31[2];
    v20(v6, v2);
    if ((v24 & 1) == 0)
    {
      sub_1000188B0();
      sub_1000188C0();
      uint64_t v53 = v42;
      uint64_t v54 = v41;
      uint64_t v55 = v40;
      char v56 = v43;
      uint64_t v49 = v39;
      uint64_t v50 = v38;
      uint64_t v51 = v37;
      char v52 = 0;
      uint64_t v45 = v32;
      uint64_t v46 = v33;
      uint64_t v47 = v34;
      char v48 = 0;
      sub_100016798();
      sub_100018930();
      return v57;
    }
  }
  else
  {
    v20(v6, v2);
  }
  return 0;
}

BOOL sub_100016788(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

unint64_t sub_100016798()
{
  unint64_t result = qword_100028028;
  if (!qword_100028028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028028);
  }
  return result;
}

unint64_t sub_1000167EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_1000060C0(&qword_100028048);
  uint64_t v3 = (void *)sub_100018D70();
  unsigned __int8 v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t result = sub_100016DC0(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    double v12 = v8 + 2;
    unsigned __int8 v4 = *((unsigned char *)v8 - 8);
    uint64_t v13 = *v8;
    swift_retain();
    unint64_t result = sub_100016DC0(v4);
    uint64_t v8 = v12;
    uint64_t v5 = v13;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000168F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000060C0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016954@<X0>(uint64_t *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6 = sub_100016ABC(0);
  uint64_t v7 = sub_100016ABC(1u);
  uint64_t v8 = sub_100016ABC(2u);
  uint64_t v9 = type metadata accessor for ColorPalette();
  v14[3] = v9;
  uint64_t v10 = sub_100017F34((unint64_t *)&qword_1000270F0, (void (*)(uint64_t))type metadata accessor for ColorPalette);
  v14[4] = v10;
  v13[4] = v10;
  v14[0] = v6;
  v13[3] = v9;
  v12[4] = v10;
  v13[0] = v7;
  uint64_t v12[3] = v9;
  v12[0] = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10000F7B0((uint64_t)v14, (uint64_t)v13, (uint64_t)v12, (uint64_t *)&v15, a2, a3);
  sub_1000070CC((uint64_t)v12);
  sub_1000070CC((uint64_t)v13);
  sub_1000070CC((uint64_t)v14);
  if (v16)
  {
    swift_release();
    swift_release();
    swift_release();
    return sub_100007204(&v15, (uint64_t)a1);
  }
  else
  {
    a1[3] = v9;
    a1[4] = v10;
    swift_release();
    swift_release();
    *a1 = v6;
    return sub_100017ED4((uint64_t)&v15);
  }
}

uint64_t sub_100016ABC(unsigned __int8 a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 24);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_100016DC0(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * v5);
    swift_retain();
  }
  else
  {
    char v8 = *(unsigned char *)(v2 + 16);
    type metadata accessor for ColorPalette();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 40) = 0;
    *(void *)(v7 + 24) = 0;
    *(unsigned char *)(v7 + 16) = v8;
    *(unsigned char *)(v7 + 17) = a1;
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 24) = 0x8000000000000000;
    sub_100017A50(v7, a1, isUniquelyReferenced_nonNull_native);
    *(void *)(v2 + 24) = v11;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  return v7;
}

uint64_t sub_100016BCC()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ColorPaletteCache()
{
  return self;
}

unint64_t sub_100016C28(uint64_t a1)
{
  sub_100018890();
  sub_100017F34(&qword_100028158, (void (*)(uint64_t))&type metadata accessor for Keyframe.Name);
  uint64_t v2 = sub_1000189C0();
  return sub_100016E2C(a1, v2);
}

unint64_t sub_100016CC0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100018BA0(*(void *)(v2 + 40));
  return sub_100016FEC(a1, v4);
}

unint64_t sub_100016D04(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100018C00(*(void *)(v2 + 40));
  return sub_1000170F8(a1, v4);
}

unint64_t sub_100016D48(uint64_t a1, uint64_t a2)
{
  sub_100018E10();
  sub_100018A20();
  Swift::Int v4 = sub_100018E30();
  return sub_1000171C0(a1, a2, v4);
}

unint64_t sub_100016DC0(unsigned __int8 a1)
{
  sub_100018E10();
  sub_100018E20(a1);
  Swift::Int v2 = sub_100018E30();
  return sub_1000172A4(a1, v2);
}

unint64_t sub_100016E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100018890();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100017F34(&qword_100028160, (void (*)(uint64_t))&type metadata accessor for Keyframe.Name);
      char v15 = sub_1000189D0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_100016FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_100017FD8();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100018BB0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100018BB0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1000170F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100017F7C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100018C10();
      sub_100011724((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000171C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100018DE0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100018DE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000172A4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100017344(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000060C0(&qword_100027580);
  uint64_t v6 = sub_100018D50();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    char v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_100018BA0(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  char v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100017618(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000060C0(&qword_100028048);
  uint64_t result = sub_100018D50();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      Swift::UInt v26 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_100018E10();
      sub_100018E20(v26);
      uint64_t result = sub_100018E30();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

void sub_1000178EC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100016CC0((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_100017B88();
LABEL_7:
    unint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100017344(v12, a3 & 1);
  unint64_t v17 = sub_100016CC0((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_100017FD8();
    sub_100018DF0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  unint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v22;
  id v23 = a2;
}

uint64_t sub_100017A50(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100016DC0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100017D30();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_100017618(result, a3 & 1);
  uint64_t result = sub_100016DC0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_100018DF0();
  __break(1u);
  return result;
}

id sub_100017B88()
{
  uint64_t v1 = v0;
  sub_1000060C0(&qword_100027580);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018D40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100017D30()
{
  uint64_t v1 = v0;
  sub_1000060C0(&qword_100028048);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018D40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = (void *)swift_retain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100017ED4(uint64_t a1)
{
  uint64_t v2 = sub_1000060C0(&qword_100028150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017F34(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100017F7C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100017FD8()
{
  unint64_t result = qword_100027588;
  if (!qword_100027588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100027588);
  }
  return result;
}

uint64_t sub_100018018(char a1, char a2, char a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v16 = a10 * 0.5;
  int v17 = a3 & 1;
  double v18 = 0.0;
  if (a3) {
    double v18 = a10;
  }
  double v19 = (a7 - v18) / a6;
  long double v24 = atan(v19);
  if (v17)
  {
    double v25 = -v16;
    v20.n128_f64[0] = -v16;
    v21.n128_f64[0] = v16;
    double v26 = nullsub_1(v20, v21, v22, v23);
    double v50 = v27;
    double v51 = v26;
    v28.n128_f64[0] = a10 / cos(v24) - v19 * a10;
  }
  else
  {
    v20.n128_f64[0] = v16;
    v21.n128_f64[0] = v16;
    double v32 = nullsub_1(v20, v21, v22, v23);
    double v50 = v33;
    double v51 = v32;
    v28.n128_f64[0] = v19 * a10 + a10 / cos(v24);
    double v25 = v16;
  }
  v29.n128_f64[0] = v28.n128_f64[0] * 0.5;
  v28.n128_f64[0] = v25;
  double v34 = nullsub_1(v28, v29, v30, v31);
  double v36 = v35;
  double v37 = a10 / v19;
  v38.n128_f64[0] = a10 / sin(v24);
  v41.n128_f64[0] = -v37;
  if ((a3 & 1) == 0) {
    v41.n128_f64[0] = v37;
  }
  v38.n128_f64[0] = (v41.n128_f64[0] + v38.n128_f64[0]) * 0.5;
  v41.n128_f64[0] = v16;
  double v42 = nullsub_1(v38, v41, v39, v40);
  double v44 = v43;
  double v45 = sub_1000067B4();
  *(void *)(v10 + 72) = sub_1000181AC(a2 & 1, a1 & 1, v45, v46, v47, v48, v51, v50, v34, v36, v42, v44);
  *(double *)(v10 + 16) = a4;
  *(double *)(v10 + 24) = a5;
  *(double *)(v10 + 32) = a6;
  *(double *)(v10 + 40) = a7;
  *(double *)(v10 + 48) = a8;
  *(double *)(v10 + 56) = a9;
  *(double *)(v10 + 64) = a10;
  return v10;
}

uint64_t sub_1000181AC(char a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  sub_1000060C0(&qword_100027FC0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10001ADA0;
  CGFloat v29 = a3;
  CGFloat v30 = a4;
  CGFloat v31 = a5;
  CGFloat v32 = a6;
  if ((a1 & 1) == 0)
  {
    double v58 = CGRectGetMinX(*(CGRect *)&v29) + a7;
    CGFloat v59 = a3;
    CGFloat v60 = a4;
    CGFloat v61 = a5;
    CGFloat v62 = a6;
    if (a2)
    {
      v63.n128_f64[0] = CGRectGetMinY(*(CGRect *)&v59) + a8;
      v64.n128_f64[0] = v58;
      double v67 = nullsub_1(v64, v63, v65, v66);
      uint64_t v69 = v68;
      uint64_t v45 = type metadata accessor for PolygonPathPointStep();
      uint64_t v70 = swift_allocObject();
      *(double *)(v70 + 16) = v67;
      *(void *)(v70 + 24) = v69;
      *(void *)(v28 + 56) = v45;
      unint64_t v47 = sub_100015288();
      *(void *)(v28 + 64) = v47;
      *(void *)(v28 + 32) = v70;
      v126.origin.double x = a3;
      v126.origin.CGFloat y = a4;
      v126.size.CGFloat width = a5;
      v126.size.CGFloat height = a6;
      CGFloat v71 = CGRectGetMinX(v126) + a9;
      v127.origin.double x = a3;
      v127.origin.CGFloat y = a4;
      v127.size.CGFloat width = a5;
      v127.size.CGFloat height = a6;
      v72.n128_f64[0] = CGRectGetMaxY(v127) - a10;
      v73.n128_f64[0] = v71;
      double v76 = nullsub_1(v73, v72, v74, v75);
      uint64_t v78 = v77;
      uint64_t v79 = swift_allocObject();
      *(double *)(v79 + 16) = v76;
      *(void *)(v79 + 24) = v78;
      *(void *)(v28 + 96) = v45;
      *(void *)(v28 + 104) = v47;
      *(void *)(v28 + 72) = v79;
      v128.origin.double x = a3;
      v128.origin.CGFloat y = a4;
      v128.size.CGFloat width = a5;
      v128.size.CGFloat height = a6;
      double v57 = CGRectGetMaxX(v128) - a11;
      goto LABEL_6;
    }
    v101.n128_f64[0] = CGRectGetMaxY(*(CGRect *)&v59) - a8;
    v102.n128_f64[0] = v58;
    double v105 = nullsub_1(v102, v101, v103, v104);
    uint64_t v107 = v106;
    uint64_t v45 = type metadata accessor for PolygonPathPointStep();
    uint64_t v108 = swift_allocObject();
    *(double *)(v108 + 16) = v105;
    *(void *)(v108 + 24) = v107;
    *(void *)(v28 + 56) = v45;
    unint64_t v47 = sub_100015288();
    *(void *)(v28 + 64) = v47;
    *(void *)(v28 + 32) = v108;
    v133.origin.double x = a3;
    v133.origin.CGFloat y = a4;
    v133.size.CGFloat width = a5;
    v133.size.CGFloat height = a6;
    CGFloat v109 = CGRectGetMinX(v133) + a9;
    v134.origin.double x = a3;
    v134.origin.CGFloat y = a4;
    v134.size.CGFloat width = a5;
    v134.size.CGFloat height = a6;
    v110.n128_f64[0] = CGRectGetMinY(v134) + a10;
    v111.n128_f64[0] = v109;
    double v114 = nullsub_1(v111, v110, v112, v113);
    uint64_t v116 = v115;
    uint64_t v117 = swift_allocObject();
    *(double *)(v117 + 16) = v114;
    *(void *)(v117 + 24) = v116;
    *(void *)(v28 + 96) = v45;
    *(void *)(v28 + 104) = v47;
    *(void *)(v28 + 72) = v117;
    v135.origin.double x = a3;
    v135.origin.CGFloat y = a4;
    v135.size.CGFloat width = a5;
    v135.size.CGFloat height = a6;
    double v57 = CGRectGetMaxX(v135) - a11;
LABEL_9:
    v136.origin.double x = a3;
    v136.origin.CGFloat y = a4;
    v136.size.CGFloat width = a5;
    v136.size.CGFloat height = a6;
    v81.n128_f64[0] = CGRectGetMaxY(v136) - a12;
    goto LABEL_10;
  }
  double v33 = CGRectGetMaxX(*(CGRect *)&v29) - a7;
  CGFloat v34 = a3;
  CGFloat v35 = a4;
  CGFloat v36 = a5;
  CGFloat v37 = a6;
  if ((a2 & 1) == 0)
  {
    v84.n128_f64[0] = CGRectGetMaxY(*(CGRect *)&v34) - a8;
    v85.n128_f64[0] = v33;
    double v88 = nullsub_1(v85, v84, v86, v87);
    uint64_t v90 = v89;
    uint64_t v45 = type metadata accessor for PolygonPathPointStep();
    uint64_t v91 = swift_allocObject();
    *(double *)(v91 + 16) = v88;
    *(void *)(v91 + 24) = v90;
    *(void *)(v28 + 56) = v45;
    unint64_t v47 = sub_100015288();
    *(void *)(v28 + 64) = v47;
    *(void *)(v28 + 32) = v91;
    v130.origin.double x = a3;
    v130.origin.CGFloat y = a4;
    v130.size.CGFloat width = a5;
    v130.size.CGFloat height = a6;
    CGFloat v92 = CGRectGetMaxX(v130) - a9;
    v131.origin.double x = a3;
    v131.origin.CGFloat y = a4;
    v131.size.CGFloat width = a5;
    v131.size.CGFloat height = a6;
    v93.n128_f64[0] = CGRectGetMinY(v131) + a10;
    v94.n128_f64[0] = v92;
    double v97 = nullsub_1(v94, v93, v95, v96);
    uint64_t v99 = v98;
    uint64_t v100 = swift_allocObject();
    *(double *)(v100 + 16) = v97;
    *(void *)(v100 + 24) = v99;
    *(void *)(v28 + 96) = v45;
    *(void *)(v28 + 104) = v47;
    *(void *)(v28 + 72) = v100;
    v132.origin.double x = a3;
    v132.origin.CGFloat y = a4;
    v132.size.CGFloat width = a5;
    v132.size.CGFloat height = a6;
    double v57 = CGRectGetMinX(v132) + a11;
    goto LABEL_9;
  }
  v38.n128_f64[0] = CGRectGetMinY(*(CGRect *)&v34) + a8;
  v39.n128_f64[0] = v33;
  double v42 = nullsub_1(v39, v38, v40, v41);
  uint64_t v44 = v43;
  uint64_t v45 = type metadata accessor for PolygonPathPointStep();
  uint64_t v46 = swift_allocObject();
  *(double *)(v46 + 16) = v42;
  *(void *)(v46 + 24) = v44;
  *(void *)(v28 + 56) = v45;
  unint64_t v47 = sub_100015288();
  *(void *)(v28 + 64) = v47;
  *(void *)(v28 + 32) = v46;
  v123.origin.double x = a3;
  v123.origin.CGFloat y = a4;
  v123.size.CGFloat width = a5;
  v123.size.CGFloat height = a6;
  CGFloat v48 = CGRectGetMaxX(v123) - a9;
  v124.origin.double x = a3;
  v124.origin.CGFloat y = a4;
  v124.size.CGFloat width = a5;
  v124.size.CGFloat height = a6;
  v49.n128_f64[0] = CGRectGetMaxY(v124) - a10;
  v50.n128_f64[0] = v48;
  double v53 = nullsub_1(v50, v49, v51, v52);
  uint64_t v55 = v54;
  uint64_t v56 = swift_allocObject();
  *(double *)(v56 + 16) = v53;
  *(void *)(v56 + 24) = v55;
  *(void *)(v28 + 96) = v45;
  *(void *)(v28 + 104) = v47;
  *(void *)(v28 + 72) = v56;
  v125.origin.double x = a3;
  v125.origin.CGFloat y = a4;
  v125.size.CGFloat width = a5;
  v125.size.CGFloat height = a6;
  double v57 = CGRectGetMinX(v125) + a11;
LABEL_6:
  v129.origin.double x = a3;
  v129.origin.CGFloat y = a4;
  v129.size.CGFloat width = a5;
  v129.size.CGFloat height = a6;
  v81.n128_f64[0] = CGRectGetMinY(v129) + a12;
LABEL_10:
  v80.n128_f64[0] = v57;
  double v118 = nullsub_1(v80, v81, v82, v83);
  uint64_t v120 = v119;
  uint64_t v121 = swift_allocObject();
  *(double *)(v121 + 16) = v118;
  *(void *)(v121 + 24) = v120;
  *(void *)(v28 + 136) = v45;
  *(void *)(v28 + 144) = v47;
  *(void *)(v28 + 112) = v121;
  return v28;
}

uint64_t type metadata accessor for RightTriangleDescriptor()
{
  return self;
}

uint64_t sub_10001864C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100018680()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100018690()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000186A0()
{
  return static CGFloat.interpolate(start:end:fraction:)();
}

uint64_t sub_1000186B0()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_1000186C0()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_1000186D0()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_1000186E0()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_1000186F0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100018700()
{
  return PosterData.editingLook.getter();
}

uint64_t sub_100018710()
{
  return PosterData.init(lookIdentifier:)();
}

uint64_t sub_100018720()
{
  return PosterData.init(data:)();
}

uint64_t sub_100018730()
{
  return UnlockState.lockProgress.getter();
}

uint64_t sub_100018740()
{
  return UnlockState.progress.getter();
}

uint64_t sub_100018750()
{
  return type metadata accessor for UnlockState();
}

uint64_t sub_100018760()
{
  return static PosterLayout.currentLayoutType.getter();
}

uint64_t sub_100018770()
{
  return static PosterLayout.LayoutType.== infix(_:_:)();
}

uint64_t sub_100018780()
{
  return type metadata accessor for PosterLayout.LayoutType();
}

uint64_t sub_100018790()
{
  return type metadata accessor for PosterLayout();
}

uint64_t sub_1000187A0()
{
  return RotationFrame.init(orientation:)();
}

uint64_t sub_1000187B0()
{
  return RotationFrame.toOrientation.getter();
}

uint64_t sub_1000187C0()
{
  return RotationFrame.fromOrientation.getter();
}

uint64_t sub_1000187D0()
{
  return RotationFrame.init(from:to:fraction:)();
}

uint64_t sub_1000187E0()
{
  return RotationFrame.fraction.getter();
}

uint64_t sub_1000187F0()
{
  return RotationFrame.clockwise.getter();
}

uint64_t sub_100018800()
{
  return type metadata accessor for RotationFrame();
}

uint64_t sub_100018810()
{
  return static PosterDataLoader.from(editingEnvironment:)();
}

uint64_t sub_100018820()
{
  return static PosterDataLoader.from(renderingEnvironment:)();
}

uint64_t sub_100018830()
{
  return static PosterDataLoader.from(look:)();
}

uint64_t sub_100018840()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)();
}

uint64_t sub_100018850()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)();
}

uint64_t sub_100018860()
{
  return dispatch thunk of PosterRotationAnimator.delegate.setter();
}

uint64_t sub_100018870()
{
  return PosterRotationAnimator.init()();
}

uint64_t sub_100018880()
{
  return type metadata accessor for PosterRotationAnimator();
}

uint64_t sub_100018890()
{
  return type metadata accessor for Keyframe.Name();
}

uint64_t sub_1000188A0()
{
  return Keyframe.Progress.init(wakeProgress:unlockProgress:)();
}

uint64_t sub_1000188B0()
{
  return Keyframe.Progress.wakeProgress.getter();
}

uint64_t sub_1000188C0()
{
  return Keyframe.Progress.unlockProgress.getter();
}

uint64_t sub_1000188D0()
{
  return type metadata accessor for Keyframe.Progress();
}

uint64_t sub_1000188E0()
{
  return WakeState.backlightProgress.getter();
}

uint64_t sub_1000188F0()
{
  return type metadata accessor for WakeState();
}

uint64_t sub_100018900()
{
  return Logger.logObject.getter();
}

uint64_t sub_100018910()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100018920()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100018930()
{
  return static Interpolatable.trilinearInterpolation(a:b:c:x:y:)();
}

uint64_t sub_100018940()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100018950()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100018960()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100018970()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100018980()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100018990()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000189A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

unint64_t sub_1000189B0()
{
  return (unint64_t)Encodable.userInfo()();
}

uint64_t sub_1000189C0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000189D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000189E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000189F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018A00()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_100018A10()
{
  return static String.localized(key:tableSuffix:comment:)();
}

uint64_t sub_100018A20()
{
  return String.hash(into:)();
}

void sub_100018A30(Swift::String a1)
{
}

Swift::Int sub_100018A40()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100018A50()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100018A60()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100018A70()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100018A80()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100018A90()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100018AA0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100018AB0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100018AC0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100018AD0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100018AE0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100018AF0()
{
  return Double.description.getter();
}

uint64_t sub_100018B00()
{
  return PRRenderer.isSnapshot.getter();
}

uint64_t sub_100018B10()
{
  return PRRenderer.unlockState.getter();
}

uint64_t sub_100018B20()
{
  return PRRenderer.wakeState.getter();
}

uint64_t sub_100018B30()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100018B40()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100018B50()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100018B60()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100018B70()
{
  return UIInterfaceOrientation.useFlippedRotation.getter();
}

uint64_t sub_100018B80()
{
  return static CGSize.interpolate(start:end:fraction:)();
}

uint64_t sub_100018B90()
{
  return static UIColor.interpolate(start:end:fraction:)();
}

Swift::Int sub_100018BA0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100018BB0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100018BC0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100018BD0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100018BE0()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_100018C00(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100018C10()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100018C20()
{
  return AnyHashable.init<A>(_:)();
}

void sub_100018C30(Swift::Int a1)
{
}

uint64_t sub_100018C40()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100018C50()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100018C60()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100018C70()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100018C80()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100018C90()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100018CA0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100018CB0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100018CC0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100018CD0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100018CE0()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100018CF0()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100018D00()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100018D10()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018D20()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018D30()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100018D40()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100018D50()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018D60()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_100018D70()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100018D80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100018D90(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100018DA0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100018DB0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100018DC0()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_100018DD0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100018DE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018DF0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018E00()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100018E10()
{
  return Hasher.init(_seed:)();
}

void sub_100018E20(Swift::UInt a1)
{
}

Swift::Int sub_100018E30()
{
  return Hasher._finalize()();
}

uint64_t sub_100018E40()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100018E50()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return _CGPointEqualToPoint(point1, point2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

long double asin(long double __x)
{
  return _asin(__x);
}

long double atan(long double __x)
{
  return _atan(__x);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double sin(long double __x)
{
  return _sin(__x);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}