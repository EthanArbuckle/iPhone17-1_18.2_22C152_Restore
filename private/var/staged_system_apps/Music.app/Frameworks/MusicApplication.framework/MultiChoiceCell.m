@interface MultiChoiceCell
- (BOOL)accessibilityIsSelectedChoice;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication15MultiChoiceCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication15MultiChoiceCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityIsSelectedChoice:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation MultiChoiceCell

- (_TtC16MusicApplication15MultiChoiceCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15MultiChoiceCell *)sub_D31B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15MultiChoiceCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D53C0();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_D3F80();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_D4548();
}

- (BOOL)accessibilityIsSelectedChoice
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_accessibilityIsSelectedChoice];
}

- (void)setAccessibilityIsSelectedChoice:(BOOL)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_accessibilityIsSelectedChoice] = a3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_checkmarkView];
}

@end