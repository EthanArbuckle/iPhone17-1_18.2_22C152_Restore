@interface SizedToLabelButton
- (CGSize)intrinsicContentSize;
- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithCoder:(id)a3;
- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithFrame:(CGRect)a3;
@end

@implementation SizedToLabelButton

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(SizedToLabelButton *)v2 titleLabel];
  if (v3)
  {
    v4 = v3;
    [v3 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithFrame:(CGRect)a3
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton *)sub_100173128(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SizedToLabelButton);
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SizedToLabelButton();
  return [(SizedToLabelButton *)&v5 initWithCoder:a3];
}

@end