@interface FollowHeaderButton
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (_TtC23ShelfKitCollectionViews18FollowHeaderButton)initWithCoder:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)primaryActionTriggered;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation FollowHeaderButton

- (_TtC23ShelfKitCollectionViews18FollowHeaderButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18FD04();
}

- (void)primaryActionTriggered
{
  v2 = self;
  sub_18E5E0();
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_18E8C8((uint64_t)a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_18FDC4();

  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18FollowHeaderButton_userDefaults));
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (NSString)accessibilityIdentifier
{
  v2 = self;
  sub_18F56C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)accessibilityLabel
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews18FollowHeaderButton_followState);
  if (v2 == 6 || (sub_145064(v2), !v3))
  {
    NSString v4 = 0;
  }
  else
  {
    NSString v4 = sub_384380();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v4;
}

@end