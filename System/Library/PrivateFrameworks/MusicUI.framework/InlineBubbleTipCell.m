@interface InlineBubbleTipCell
- (_TtC7MusicUI19InlineBubbleTipCell)initWithCoder:(id)a3;
- (_TtC7MusicUI19InlineBubbleTipCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation InlineBubbleTipCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2294F5EC0(v4);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2294F5FD8();
}

- (_TtC7MusicUI19InlineBubbleTipCell)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUI19InlineBubbleTipCell *)InlineBubbleTipCell.init(frame:)();
}

- (_TtC7MusicUI19InlineBubbleTipCell)initWithCoder:(id)a3
{
  return (_TtC7MusicUI19InlineBubbleTipCell *)InlineBubbleTipCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end