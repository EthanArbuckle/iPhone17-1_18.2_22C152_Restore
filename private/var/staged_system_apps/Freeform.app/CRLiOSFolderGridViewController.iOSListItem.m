@interface CRLiOSFolderGridViewController.iOSListItem
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)isAccessibilityElement;
- (BOOL)isSelected;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithCoder:(id)a3;
- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CRLiOSFolderGridViewController.iOSListItem

- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem *)sub_1007E3740(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007E7274();
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)_s11iOSListItemCMa();
  return [(CRLiOSFolderGridViewController.iOSListItem *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_1007E3BB8(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1007E4FFC(self, (uint64_t)a2, (void (*)(void))sub_1007E4784);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1007E4FFC(self, (uint64_t)a2, (void (*)(void))sub_1007E4E04);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1007E4FFC(self, (uint64_t)a2, (void (*)(void))sub_1007E507C);
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  objc_super v3 = sub_1007E5390();

  if (v3)
  {
    sub_10050BF48(0, &qword_10167AE48);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  char v3 = sub_1007E6184();

  return v3 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1007E6ED8((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_item);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_crlaxDelegate);
  char v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController11iOSListItem_viewController);
}

@end