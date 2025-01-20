@interface BlockQuoteFragment
- (CGRect)renderingSurfaceBounds;
- (_TtC21JournalShareExtension18BlockQuoteFragment)initWithCoder:(id)a3;
- (_TtC21JournalShareExtension18BlockQuoteFragment)initWithTextElement:(id)a3 range:(id)a4;
- (double)leadingPadding;
- (double)topMargin;
- (double)trailingPadding;
- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4;
@end

@implementation BlockQuoteFragment

- (double)leadingPadding
{
  uint64_t v2 = qword_100158A58;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  double v4 = *(double *)&qword_10015B998;

  return -v4;
}

- (double)trailingPadding
{
  return 0.0;
}

- (double)topMargin
{
  uint64_t v1 = qword_100158A50;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  double v3 = *(double *)&qword_10015B990;

  return v3;
}

- (CGRect)renderingSurfaceBounds
{
  id v2 = self;
  double v3 = sub_100066AC4();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v20.receiver = v2;
  v20.super_class = (Class)type metadata accessor for BlockQuoteFragment();
  [(BlockQuoteFragment *)&v20 renderingSurfaceBounds];
  v24.origin.CGFloat x = v8;
  v24.origin.CGFloat y = v9;
  v24.size.CGFloat width = v10;
  v24.size.CGFloat height = v11;
  v21.size.CGFloat width = 4.0;
  v21.origin.CGFloat x = v3;
  v21.origin.CGFloat y = v5;
  v21.size.CGFloat height = v7;
  CGRect v22 = CGRectUnion(v21, v24);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v7 = a4;
  CGFloat v8 = self;
  sub_100066CEC(v7, x, y);
}

- (_TtC21JournalShareExtension18BlockQuoteFragment)initWithTextElement:(id)a3 range:(id)a4
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_customColor) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_prevHasBlockQuote) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_nextHasBlockQuote) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BlockQuoteFragment();
  return [(BlockQuoteFragment *)&v7 initWithTextElement:a3 range:a4];
}

- (_TtC21JournalShareExtension18BlockQuoteFragment)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_customColor) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_prevHasBlockQuote) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_nextHasBlockQuote) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlockQuoteFragment();
  return [(BlockQuoteFragment *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension18BlockQuoteFragment_customColor));
}

@end