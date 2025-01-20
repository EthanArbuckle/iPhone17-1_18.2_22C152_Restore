@interface CRLUSDZLayout
- (BOOL)supportsRotation;
- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3;
- (CGRect)alignmentFrame;
- (CGRect)boundsForStandardKnobs;
- (CGRect)boundsInRoot;
- (CGRect)rectInRootForSelectionPath:(id)a3;
- (CRLBezierPath)pathForClippingConnectionLines;
- (_TtC8Freeform13CRLUSDZLayout)initWithInfo:(id)a3;
- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3;
- (id)computeLayoutGeometry;
- (id)computeWrapPath;
@end

@implementation CRLUSDZLayout

- (CGRect)boundsInRoot
{
  double v2 = sub_1007BD1E0(self, (uint64_t)a2, (double (*)(void))sub_1007BCDE4);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)alignmentFrame
{
  double v2 = sub_1007BD1E0(self, (uint64_t)a2, (double (*)(void))sub_1007BCFE0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  id v4 = a3;
  double v5 = self;
  v6 = [(CRLCanvasLayout *)v5 pureGeometryInRoot];
  if (v6)
  {
    v11 = v6;
    [(CRLCanvasLayoutGeometry *)v6 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    double v7 = v13;
    double v8 = v15;
    double v9 = v17;
    double v10 = v19;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)boundsForStandardKnobs
{
  double v2 = sub_1007BD1E0(self, (uint64_t)a2, (double (*)(void))sub_1007BD244);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)computeLayoutGeometry
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLUSDZLayout();
  id v2 = v7.receiver;
  id result = [(CRLCanvasLayout *)&v7 computeLayoutGeometry];
  if (result)
  {
    id v4 = result;
    id v5 = sub_1007BE314();
    if (v5)
    {
      id v6 = v5;
      [v4 frame];
      [v6 setNaturalBounds:];

      id v2 = v6;
    }

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)computeInfoGeometryFromPureLayoutGeometry:(id)a3
{
  id v5 = a3;
  id v6 = self;
  objc_super v7 = sub_1007BD468(a3);

  return v7;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  return self;
}

- (id)computeWrapPath
{
  id v2 = self;
  sub_1007BD7C4();
  long long v4 = v3;

  return v4;
}

- (CRLBezierPath)pathForClippingConnectionLines
{
  id v2 = self;
  id result = (CRLBezierPath *)[(CRLUSDZLayout *)v2 computeWrapPath];
  if (result)
  {
    long long v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (_TtC8Freeform13CRLUSDZLayout)initWithInfo:(id)a3
{
  return (_TtC8Freeform13CRLUSDZLayout *)sub_1007BE15C((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform13CRLUSDZLayout_cachedWrapPath));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform13CRLUSDZLayout_cachedHitTestManager);
}

@end