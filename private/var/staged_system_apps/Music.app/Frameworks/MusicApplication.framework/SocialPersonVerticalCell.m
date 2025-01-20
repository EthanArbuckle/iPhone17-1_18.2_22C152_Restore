@interface SocialPersonVerticalCell
- (CGRect)bounds;
- (CGRect)frame;
- (MPButton)accessibilityCloseButton;
- (NSString)accessibilityPersonName;
- (NSString)accessibilityPersonSubtitle;
- (UIControl)accessibilityFollowButton;
- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SocialPersonVerticalCell

- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24SocialPersonVerticalCell *)sub_131FD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24SocialPersonVerticalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_135238();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_133064();
}

- (CGRect)frame
{
  sub_1338E0(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1339B0((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_1338E0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1339B0((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_133AD8(a3);
}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_42EA8();
}

- (MPButton)accessibilityCloseButton
{
  double v2 = self;
  sub_13420C();
  double v4 = v3;

  return (MPButton *)v4;
}

- (UIControl)accessibilityFollowButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue((*(id **)((char *)&self->super.super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_relationshipButtonController))[20]);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_networkArtworkCatalog));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___button));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell____lazy_storage___closeButton));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication24SocialPersonVerticalCell_measurementStackView);
}

@end