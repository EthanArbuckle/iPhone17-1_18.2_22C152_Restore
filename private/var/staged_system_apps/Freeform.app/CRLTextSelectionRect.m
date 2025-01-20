@interface CRLTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (NSString)debugDescription;
- (_TtC8Freeform20CRLTextSelectionRect)init;
- (int64_t)writingDirection;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation CRLTextSelectionRect

- (BOOL)containsStart
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsStart);
}

- (void)setContainsStart:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsStart) = a3;
}

- (BOOL)containsEnd
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsEnd);
}

- (void)setContainsEnd:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsEnd) = a3;
}

- (int64_t)writingDirection
{
  v2 = self;
  int64_t v3 = sub_1006CDD7C();

  return v3;
}

- (void)setWritingDirection:(int64_t)a3
{
  v4 = self;
  sub_1006CDEA8(a3);
}

- (CGRect)rect
{
  double v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect);
  double v3 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect];
  double v4 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect + 8];
  double v5 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1006CE09C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1006CDFA0);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1006CE1C4(self, (uint64_t)a2, (void (*)(void))sub_1006CE234);
}

- (_TtC8Freeform20CRLTextSelectionRect)init
{
  CGRect result = (_TtC8Freeform20CRLTextSelectionRect *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end