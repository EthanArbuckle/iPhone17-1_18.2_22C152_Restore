@interface CRLWPTextSelectionManager_i
- (BOOL)isSelectingCaret:(CGPoint)a3;
- (CGRect)caretRectFor:(id)a3;
- (CGRect)firstRectFor:(id)a3;
- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4;
- (id)closestPositionTo:(CGPoint)a3;
- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5;
- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4;
- (id)selectionRectsFor:(id)a3;
- (void)beginLoupeSessionAt:(CGPoint)a3;
- (void)endLoupeSession;
- (void)moveLoupeTo:(CGPoint)a3;
- (void)updateSelectionViews;
@end

@implementation CRLWPTextSelectionManager_i

- (CGRect)firstRectFor:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    [v6 convertUnscaledToBoundsRect:sub_10069DC54(v7)];
    CGFloat x = v9;
    CGFloat y = v11;
    CGFloat width = v13;
    CGFloat height = v15;
  }
  else
  {
    CGFloat x = CGRectInfinite.origin.x;
    CGFloat y = CGRectInfinite.origin.y;
    CGFloat width = CGRectInfinite.size.width;
    CGFloat height = CGRectInfinite.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5
{
  v8 = (char *)a3;
  double v9 = self;
  v10 = sub_100F4EECC(v8, a4, a5);

  return v10;
}

- (id)selectionRectsFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100F4F19C(v4);

  sub_10069FE48();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (CGRect)caretRectFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = sub_100F4F7A4(v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)closestPositionTo:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = self;
  double v6 = sub_100F4EAB4(x, y);

  return v6;
}

- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  double v8 = (void *)sub_100F4EDAC((uint64_t)v6, a4);

  return v8;
}

- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  double v8 = (void *)sub_100F4EDC4((uint64_t)v6, a4);

  return v8;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  unsigned __int8 v6 = sub_100F4FB80(x, y);

  return v6 & 1;
}

- (void)updateSelectionViews
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  if (v2)
  {
    v3 = *(void (**)(void))((*v2 & swift_isaMask) + 0x188);
    id v4 = self;
    v5 = v2;
    v3();
  }
}

- (void)beginLoupeSessionAt:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = qword_10166EE60;
  unsigned __int8 v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  sub_100F4FED8((uint64_t)v6, x, y);
}

- (void)moveLoupeTo:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = qword_10166EE60;
  unsigned __int8 v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  sub_100F500B0(v6, x, y);
}

- (void)endLoupeSession
{
  v2 = self;
  sub_100F4EFBC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLWPTextSelectionManager_i_loupeSession));
}

@end