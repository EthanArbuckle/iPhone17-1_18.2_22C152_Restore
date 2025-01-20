@interface LiveRadioCell
- (CGRect)bounds;
- (CGRect)frame;
- (NSString)accessibilityHeaderSubtitle;
- (NSString)accessibilityHeaderTitle;
- (NSString)accessibilityHeadline;
- (NSString)accessibilitySubtitle;
- (NSString)accessibilityTitle;
- (NSString)description;
- (UIButton)accessibilityAccessoryButton;
- (_TtC11MusicCoreUI12SymbolButton)accessibilityAccessoryCalendarButton;
- (_TtC16MusicApplication13LiveRadioCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication13LiveRadioCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LiveRadioCell

- (_TtC16MusicApplication13LiveRadioCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13LiveRadioCell *)sub_172F2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_173D04((uint64_t)a3);
}

- (_TtC16MusicApplication13LiveRadioCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_177D1C();
}

- (CGRect)frame
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  sub_175AB4((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  sub_175AB4((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_175BC4();
}

- (NSString)description
{
  double v2 = self;
  sub_1765EC();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)accessibilityHeaderTitle
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityHeaderSubtitle
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityHeadline
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilitySubtitle
{
  return (NSString *)sub_42EA8();
}

- (UIButton)accessibilityAccessoryButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButton));
}

- (_TtC11MusicCoreUI12SymbolButton)accessibilityAccessoryCalendarButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryCalendarButton));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidChangeHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_videoLooperDidFailHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_isPlayingDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerTextStackView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell____lazy_storage___topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryButton));
  NSString v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13LiveRadioCell_accessoryCalendarButton);
}

@end