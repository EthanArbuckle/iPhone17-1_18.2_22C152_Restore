@interface CRLWPTextSelectionManager
- (BOOL)displayingSelectionView;
- (BOOL)isSelectingCaret:(CGPoint)a3;
- (CGRect)caretRectFor:(id)a3;
- (CGRect)firstRectFor:(id)a3;
- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4;
- (NSString)selectedText;
- (_NSRange)selectedRange;
- (_TtC8Freeform11CRLWPLayout)layout;
- (_TtC8Freeform12CRLTextRange)markedTextSelection;
- (_TtC8Freeform12CRLTextRange)selectedTextRange;
- (_TtC8Freeform12CRLTextRange)selectedTextRangeWithoutMarkedText;
- (_TtC8Freeform15CRLTextPosition)beginningOfDocument;
- (_TtC8Freeform15CRLTextPosition)endOfDocument;
- (_TtC8Freeform25CRLWPTextSelectionManager)init;
- (_TtC8Freeform26CRLSelectionViewController)selectionViewController;
- (double)minimumCaretHitRegionWidth;
- (id)characterRangeAt:(CGPoint)a3;
- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4;
- (id)closestPositionTo:(CGPoint)a3;
- (id)closestPositionTo:(CGPoint)a3 within:(id)a4;
- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFrom:(id)a3 offset:(int64_t)a4;
- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4;
- (id)selectWordAt:(CGPoint)a3;
- (id)selectionRectsFor:(id)a3;
- (id)textIn:(id)a3;
- (id)textRangeFrom:(id)a3 to:(id)a4;
- (int64_t)characterIndexForPoint:(CGPoint)a3;
- (int64_t)compare:(id)a3 to:(id)a4;
- (int64_t)offsetFrom:(id)a3 to:(id)a4;
- (void)beginLoupeSessionAt:(CGPoint)a3;
- (void)dealloc;
- (void)endLoupeSession;
- (void)moveLoupeTo:(CGPoint)a3;
- (void)refresh;
- (void)setMinimumCaretHitRegionWidth:(double)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectedTextRangeFor:(CGPoint)a3;
- (void)setSelectionViewController:(id)a3;
- (void)updateSelectionViews;
@end

@implementation CRLWPTextSelectionManager

- (double)minimumCaretHitRegionWidth
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_minimumCaretHitRegionWidth);
}

- (void)setMinimumCaretHitRegionWidth:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_minimumCaretHitRegionWidth) = a3;
}

- (_TtC8Freeform11CRLWPLayout)layout
{
  v2 = self;
  v3 = sub_10069C248();

  return (_TtC8Freeform11CRLWPLayout *)v3;
}

- (_TtC8Freeform12CRLTextRange)markedTextSelection
{
  v2 = self;
  v3 = sub_10069C344();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (_TtC8Freeform12CRLTextRange)selectedTextRange
{
  v2 = self;
  v3 = sub_10069C510();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (void)setSelectedTextRange:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange) = (Class)a3;
  id v6 = a3;
  v5 = self;

  (*(void (**)(void))((swift_isaMask & (uint64_t)v5->super.isa) + 0x268))();
}

- (_TtC8Freeform12CRLTextRange)selectedTextRangeWithoutMarkedText
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange));
}

- (_NSRange)selectedRange
{
  v2 = self;
  sub_10069C6BC();
  NSUInteger v4 = v3;
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  v11 = self;
  NSUInteger v7 = (objc_class *)sub_1006CC83C(location, length);
  NSUInteger v8 = *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange);
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager__selectedTextRange) = v7;
  v9 = v7;

  v10 = *(void (**)(void))((swift_isaMask & (uint64_t)v11->super.isa) + 0x268);
  v10();

  v10();
}

- (NSString)selectedText
{
  v2 = self;
  sub_10069C944();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (_TtC8Freeform15CRLTextPosition)beginningOfDocument
{
  v2 = self;
  id v3 = sub_10069CCD0();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (_TtC8Freeform15CRLTextPosition)endOfDocument
{
  v2 = self;
  id v3 = sub_10069CE3C();

  return (_TtC8Freeform15CRLTextPosition *)v3;
}

- (id)selectWordAt:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  NSString v5 = self;
  id v6 = sub_10069CF78(x, y);

  return v6;
}

- (void)dealloc
{
  v2 = self;
  sub_10069D464();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_lastEditingShape);
}

- (id)textIn:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_10069D5EC((uint64_t)v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)textRangeFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1006CE79C((uint64_t)v5, (uint64_t)v6);

  return v7;
}

- (id)positionFrom:(id)a3 offset:(int64_t)a4
{
  id v6 = (char *)a3;
  id v7 = self;
  id v8 = sub_10069D9A4(v6, a4);

  return v8;
}

- (int64_t)offsetFrom:(id)a3 to:(id)a4
{
  uint64_t v6 = qword_10166EE60;
  id v7 = (char *)a3;
  id v8 = (char *)a4;
  v9 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location];
  uint64_t v11 = *(void *)&v7[OBJC_IVAR____TtC8Freeform15CRLTextPosition_location];

  int64_t result = v10 - v11;
  if (__OFSUB__(v10, v11)) {
    __break(1u);
  }
  return result;
}

- (int64_t)compare:(id)a3 to:(id)a4
{
  type metadata accessor for CRLTextPosition();
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5) {
    return 1;
  }
  uint64_t v6 = *(void *)((char *)a3 + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC8Freeform15CRLTextPosition_location);
  if (v7 < v6) {
    return 1;
  }
  if (v6 >= v7) {
    return 0;
  }
  return -1;
}

- (CGRect)firstRectFor:(id)a3
{
  double v3 = sub_10069E790(self, (uint64_t)a2, a3, sub_10069DC54);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)firstRectForCharacterRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = qword_10166EE60;
  id v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  id v9 = (id)qword_10171A478;
  sub_10069DE84((uint64_t)v8, location, length, a4, &v14);

  double v11 = *((double *)&v14 + 1);
  double v10 = *(double *)&v14;
  double v12 = v15;
  double v13 = v16;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)caretRectFor:(id)a3
{
  double v3 = sub_10069E790(self, (uint64_t)a2, a3, sub_10069E570);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)closestPositionTo:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = sub_10069E810(x, y);

  return v6;
}

- (id)closestPositionTo:(CGPoint)a3 within:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_10069EA60(v7, x, y);

  return v9;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = qword_10166EE60;
  double v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_10171A478;
  int64_t v8 = sub_10069EED0(1, x, y);

  return v8;
}

- (id)characterRangeAt:(CGPoint)a3
{
  double v3 = self;
  sub_1007FEEC4((uint64_t)v3, (uint64_t)&_mh_execute_header, (uint64_t)"characterRange(at:)", 19, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 269);

  return 0;
}

- (void)setSelectedTextRangeFor:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = self;
  sub_10069F16C(x, y);
}

- (_TtC8Freeform26CRLSelectionViewController)selectionViewController
{
  return (_TtC8Freeform26CRLSelectionViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController));
}

- (void)setSelectionViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController) = (Class)a3;
  id v3 = a3;
}

- (BOOL)displayingSelectionView
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  return v2 && *(void *)(v2 + OBJC_IVAR____TtC8Freeform26CRLSelectionViewController_rotatedOverlayView) != 0;
}

- (void)refresh
{
  uint64_t v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x268);
  id v3 = self;
  v2();
}

- (void)updateSelectionViews
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLWPTextSelectionManager_selectionViewController);
  if (v2)
  {
    id v3 = *(void (**)(void))((*v2 & swift_isaMask) + 0x188);
    id v4 = self;
    uint64_t v5 = v2;
    v3();
  }
}

- (id)selectionRectsFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1007FEEC4((uint64_t)v5, (uint64_t)&_mh_execute_header, (uint64_t)"selectionRects(for:)", 20, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 393);

  sub_10069FE48();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v6.super.isa;
}

- (id)positionWithin:(id)a3 farthestIn:(int64_t)a4
{
  id v5 = a3;
  NSArray v6 = self;
  sub_1007FEEC4((uint64_t)v6, (uint64_t)&_mh_execute_header, (uint64_t)"position(within:farthestIn:)", 28, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 398);

  return 0;
}

- (id)characterRangeByExtending:(id)a3 in:(int64_t)a4
{
  id v5 = a3;
  NSArray v6 = self;
  sub_1007FEEC4((uint64_t)v6, (uint64_t)&_mh_execute_header, (uint64_t)"characterRange(byExtending:in:)", 31, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 403);

  return 0;
}

- (id)positionFrom:(id)a3 in:(int64_t)a4 offset:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_1007FEEC4((uint64_t)v7, (uint64_t)&_mh_execute_header, (uint64_t)"position(from:in:offset:)", 25, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 408);

  return 0;
}

- (BOOL)isSelectingCaret:(CGPoint)a3
{
  id v3 = self;
  sub_1007FEEC4((uint64_t)v3, (uint64_t)&_mh_execute_header, (uint64_t)"isSelectingCaret(_:)", 20, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 413);

  return 0;
}

- (void)beginLoupeSessionAt:(CGPoint)a3
{
  id v3 = self;
  sub_1007FEEC4((uint64_t)v3, (uint64_t)&_mh_execute_header, (uint64_t)"beginLoupeSession(at:)", 22, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 418);
}

- (void)moveLoupeTo:(CGPoint)a3
{
  id v3 = self;
  sub_1007FEEC4((uint64_t)v3, (uint64_t)&_mh_execute_header, (uint64_t)"moveLoupe(to:)", 14, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 422);
}

- (void)endLoupeSession
{
  uint64_t v2 = self;
  sub_1007FEEC4((uint64_t)v2, (uint64_t)&_mh_execute_header, (uint64_t)"endLoupeSession()", 17, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPTextSelectionManager.swift", 98, 2u, 426);
}

- (_TtC8Freeform25CRLWPTextSelectionManager)init
{
  CGRect result = (_TtC8Freeform25CRLWPTextSelectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end