@interface ActionButton
- (_TtC17SequoiaTranslator12ActionButton)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator12ActionButton)initWithFrame:(CGRect)a3;
@end

@implementation ActionButton

- (_TtC17SequoiaTranslator12ActionButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActionButton();
  return -[ActionButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator12ActionButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActionButton();
  return [(ActionButton *)&v5 initWithCoder:a3];
}

@end