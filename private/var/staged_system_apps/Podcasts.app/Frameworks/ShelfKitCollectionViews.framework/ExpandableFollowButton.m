@interface ExpandableFollowButton
- (BOOL)_supportsMacIdiom;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (NSString)accessibilityLabel;
- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)didTapButton;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ExpandableFollowButton

- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22ExpandableFollowButton *)sub_26CE00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews22ExpandableFollowButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_26E9F8();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 28.0;
  if (*((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_followState) == 4)
  {
    v4.receiver = self;
    v4.super_class = (Class)type metadata accessor for ExpandableFollowButton();
    [(ExpandableFollowButton *)&v4 intrinsicContentSize];
  }
  double v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandableFollowButton();
  return [(ExpandableFollowButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExpandableFollowButton();
  id v4 = v5.receiver;
  [(ExpandableFollowButton *)&v5 setHighlighted:v3];
  sub_26D9E8();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_26EAD0();

  return v7;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (void)didTapButton
{
  double v2 = self;
  sub_26DB54();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton____lazy_storage___loadingIndicator));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton____lazy_storage___overlayGlyphView);
}

- (NSString)accessibilityLabel
{
  sub_145064(*((unsigned char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC23ShelfKitCollectionViews22ExpandableFollowButton_followState));
  if (v2)
  {
    NSString v3 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

@end