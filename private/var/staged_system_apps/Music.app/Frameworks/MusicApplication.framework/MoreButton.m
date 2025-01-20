@interface MoreButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)init;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithFrame:(CGRect)a3;
@end

@implementation MoreButton

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)init
{
  return (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *)sub_2D5AB8();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8 = (double *)((char *)self
                + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea);
  if (self->hitArea[OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea + 24])
  {
    id v9 = a4;
    [(MoreButton *)self bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
  }
  else
  {
    CGFloat v15 = v8[2];
    CGFloat v17 = v8[3];
    CGFloat v11 = *v8;
    CGFloat v13 = v8[1];
    id v18 = a4;
    v19 = self;
  }
  v23.origin.CGFloat x = v11;
  v23.origin.CGFloat y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  BOOL v20 = CGRectContainsPoint(v23, v22);

  return v20;
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton_hitArea;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  id v5 = a3;

  result = (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton *)sub_AB8280();
  __break(1u);
  return result;
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710MoreButton)initWithFrame:(CGRect)a3
{
}

@end