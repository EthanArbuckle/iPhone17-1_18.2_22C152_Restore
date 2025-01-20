@interface LinkAwareTextView
- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation LinkAwareTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  v9 = sub_526650(x, y);

  return v9;
}

- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LinkAwareTextView();
  return -[LinkAwareTextView initWithFrame:textContainer:](&v10, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtC16MusicApplicationP33_01797031205E8C86105A2FFED1C5EC0917LinkAwareTextView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LinkAwareTextView();
  id v4 = a3;
  v5 = [(LinkAwareTextView *)&v7 initWithCoder:v4];

  return v5;
}

@end