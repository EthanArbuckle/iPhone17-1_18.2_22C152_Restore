@interface ParallaxView
- (_TtC16MusicApplication12ParallaxView)initWithCoder:(id)a3;
- (_TtC16MusicApplication12ParallaxView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation ParallaxView

- (_TtC16MusicApplication12ParallaxView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ParallaxView *)sub_5480D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ParallaxView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_548A3C();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParallaxView();
  id v2 = v3.receiver;
  [(ParallaxView *)&v3 layoutSubviews];
  sub_5483C0();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_54828C((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12ParallaxView_contentView));
}

@end