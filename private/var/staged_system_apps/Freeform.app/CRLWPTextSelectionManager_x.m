@interface CRLWPTextSelectionManager_x
- (BOOL)isSelectingCaret:(CGPoint)a3;
- (CGRect)caretRectFor:(id)a3;
- (CGRect)firstRectFor:(id)a3;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4;
- (id)selectionRectsFor:(id)a3;
@end

@implementation CRLWPTextSelectionManager_x

- (id)selectionRectsFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100ACFD68(v4);

  sub_10069FE48();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  unsigned __int8 v6 = sub_100AD025C(x, y);

  return v6 & 1;
}

- (CGRect)firstRectFor:(id)a3
{
  double v3 = sub_100AD0E80(self, (uint64_t)a2, a3, sub_100AD04D4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = self;
  sub_100AD0668(location, length, (char **)a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)caretRectFor:(id)a3
{
  double v3 = sub_100AD0E80(self, (uint64_t)a2, a3, sub_100AD0D54);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

@end