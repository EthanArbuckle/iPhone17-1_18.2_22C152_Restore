@interface DOCCircularCancelButton
- (BOOL)translatesAutoresizingMaskIntoConstraints;
- (_TtC5Files23DOCCircularCancelButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
@end

@implementation DOCCircularCancelButton

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularCancelButton();
  return [(DOCCircularCancelButton *)&v3 translatesAutoresizingMaskIntoConstraints];
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCircularCancelButton();
  [(DOCCircularCancelButton *)&v4 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  v9 = sub_100403D48(x, y);

  return v9;
}

- (_TtC5Files23DOCCircularCancelButton)initWithFrame:(CGRect)a3
{
  result = (_TtC5Files23DOCCircularCancelButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end