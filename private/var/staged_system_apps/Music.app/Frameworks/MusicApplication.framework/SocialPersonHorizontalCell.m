@interface SocialPersonHorizontalCell
- (BOOL)accessibilityIsFollowRequest;
- (MPButton)accessibilityApproveButton;
- (MPButton)accessibilityDeclineButton;
- (NSString)accessibilityPersonName;
- (NSString)accessibilityPersonSubtitle;
- (UIControl)accessibilityFollowButton;
- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SocialPersonHorizontalCell

- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication26SocialPersonHorizontalCell *)sub_BDEEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication26SocialPersonHorizontalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_C020C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_BEA9C();
}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_42EA8();
}

- (MPButton)accessibilityApproveButton
{
  v2 = self;
  sub_BF154();
  v4 = v3;

  return (MPButton *)v4;
}

- (MPButton)accessibilityDeclineButton
{
  v2 = self;
  sub_BF4A4();
  v4 = v3;

  return (MPButton *)v4;
}

- (UIControl)accessibilityFollowButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)(*(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_relationshipButtonController]
                                                              + 160));
}

- (BOOL)accessibilityIsFollowRequest
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_layoutStyle];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_approveRequestHandler]);
  sub_1A528(*(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell_declineRequestHandler]);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication26SocialPersonHorizontalCell____lazy_storage___declineButton];
}

@end