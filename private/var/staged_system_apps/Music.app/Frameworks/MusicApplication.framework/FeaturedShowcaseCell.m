@interface FeaturedShowcaseCell
- (CGRect)bounds;
- (CGRect)frame;
- (NSString)accessibilityDescription;
- (NSString)accessibilityHeadline;
- (NSString)accessibilitySubtitle;
- (NSString)accessibilityTitle;
- (NSString)descriptionText;
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setDescriptionText:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeadline:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FeaturedShowcaseCell

- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedShowcaseCell *)sub_20A560(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20D274();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
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

- (NSString)descriptionText
{
  return (NSString *)sub_42EA8();
}

- (void)setDescriptionText:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20BC5C(a3);
}

- (CGRect)bounds
{
  sub_20BEB0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGRect)frame
{
  sub_20BEB0(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_20C0B0();
}

- (NSString)accessibilityHeadline
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilityTitle
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilitySubtitle
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessibilityDescription
{
  swift_beginAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end