@interface PassThroughStackView
- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithCoder:(id)a3;
- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassThroughStackView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_100172FB4((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithFrame:(CGRect)a3
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView *)sub_100173128(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for PassThroughStackView);
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA20PassThroughStackView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PassThroughStackView();
  return [(PassThroughStackView *)&v5 initWithCoder:a3];
}

@end