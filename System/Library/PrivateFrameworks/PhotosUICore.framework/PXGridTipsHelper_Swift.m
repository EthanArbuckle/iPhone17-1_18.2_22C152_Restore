@interface PXGridTipsHelper_Swift
+ (NSString)curatedLibrarySwitchTipID;
+ (NSString)filterAllPhotosTipID;
+ (NSString)filterScreenshotsHiddenTipID;
+ (NSString)syndicatedAssetsTipID;
+ (PXGridTipsHelper_Swift)shared;
+ (void)setTip:(id)a3 isPresentable:(BOOL)a4;
+ (void)setTipActionPerformed:(id)a3;
+ (void)setTipsPresentationDelegate:(id)a3;
- (PXGridTipsHelper_Swift)init;
@end

@implementation PXGridTipsHelper_Swift

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  uint64_t v5 = sub_1AB23A76C();
  _s12PhotosUICore16PXGridTipsHelperC6setTip_13isPresentableySS_SbtFZ_0(v5, v6, a4);
  swift_bridgeObjectRelease();
}

+ (void)setTipsPresentationDelegate:(id)a3
{
}

- (PXGridTipsHelper_Swift)init
{
  v2 = self;
  PXDisplayCollectionDetailedCountsMake(v2, v3);
  PXDisplayCollectionDetailedCountsMake(v4, v5);
  PXDisplayCollectionDetailedCountsMake(v6, v7);
  PXDisplayCollectionDetailedCountsMake(v8, v9);
  *((unsigned char *)&v2->super.super.isa + OBJC_IVAR___PXGridTipsHelper_Swift_hasStartedTips) = 0;

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for PXGridTipsHelper();
  return [(PXTipsHelper_Swift *)&v11 init];
}

+ (NSString)curatedLibrarySwitchTipID
{
}

+ (NSString)syndicatedAssetsTipID
{
}

+ (NSString)filterAllPhotosTipID
{
}

+ (PXGridTipsHelper_Swift)shared
{
  if (qword_1E985BC00 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E985BBF8;
  return (PXGridTipsHelper_Swift *)v2;
}

+ (NSString)filterScreenshotsHiddenTipID
{
}

+ (void)setTipActionPerformed:(id)a3
{
  sub_1AB23A76C();
  _s12PhotosUICore16PXGridTipsHelperC21setTipActionPerformedyySSFZ_0();
  swift_bridgeObjectRelease();
}

@end