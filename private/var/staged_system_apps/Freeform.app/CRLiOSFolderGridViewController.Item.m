@interface CRLiOSFolderGridViewController.Item
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithCoder:(id)a3;
- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation CRLiOSFolderGridViewController.Item

- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithFrame:(CGRect)a3
{
  return (_TtCC8Freeform30CRLiOSFolderGridViewController4Item *)sub_100D2201C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController4Item)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100D27AC0();
}

- (BOOL)isSelected
{
  return sub_100D22460(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_100D22248(a3);
}

- (BOOL)isHighlighted
{
  return sub_100D22460(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_100D224F8(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_100D25AFC(self, (uint64_t)a2, (void (*)(void))sub_100D25284);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_100D25AFC(self, (uint64_t)a2, (void (*)(void))sub_100D25904);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_100D25AFC(self, (uint64_t)a2, (void (*)(void))sub_100D25B7C);
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  id v3 = sub_100D25E90();

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
  char v3 = sub_100D26960();

  return v3 & 1;
}

- (void).cxx_destruct
{
  sub_1007E6ED8((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_item);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_crlaxDelegate);
  char v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController4Item_viewController);
}

@end