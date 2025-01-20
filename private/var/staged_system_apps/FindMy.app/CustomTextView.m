@interface CustomTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC6FindMy14CustomTextView)initWithCoder:(id)a3;
- (_TtC6FindMy14CustomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation CustomTextView

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  unsigned __int8 v8 = sub_1002FD57C((uint64_t)a3, (uint64_t)v10);

  sub_100067244((uint64_t)v10);
  return v8 & 1;
}

- (_TtC6FindMy14CustomTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CustomTextView();
  return -[CustomTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC6FindMy14CustomTextView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CustomTextView();
  return [(CustomTextView *)&v5 initWithCoder:a3];
}

@end