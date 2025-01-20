@interface PXOneUpTipsHelper_Swift
+ (NSString)actionsMenuTipID;
+ (NSString)infoPanelTipID;
+ (NSString)livePhotosTipID;
+ (NSString)quickCropTipID;
+ (NSString)syndicatedPhotosTipID;
+ (PXOneUpTipsHelper_Swift)shared;
+ (void)setTip:(id)a3 isPresentable:(BOOL)a4;
+ (void)setTipActionPerformed:(id)a3;
+ (void)setTipsPresentationDelegate:(id)a3;
+ (void)signalDidQuickCrop;
+ (void)signalOneUpPhotoOpened;
+ (void)signalSyndicatedPhotosPresented;
- (PXOneUpTipsHelper_Swift)init;
@end

@implementation PXOneUpTipsHelper_Swift

+ (PXOneUpTipsHelper_Swift)shared
{
  if (qword_1E9878DD0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9878DC8;
  return (PXOneUpTipsHelper_Swift *)v2;
}

+ (NSString)livePhotosTipID
{
}

+ (NSString)infoPanelTipID
{
}

+ (NSString)syndicatedPhotosTipID
{
}

+ (NSString)actionsMenuTipID
{
}

+ (NSString)quickCropTipID
{
}

+ (void)setTipsPresentationDelegate:(id)a3
{
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  uint64_t v5 = sub_1AB23A76C();
  _s12PhotosUICore17PXOneUpTipsHelperC6setTip_13isPresentableySS_SbtFZ_0(v5, v6, a4);
  swift_bridgeObjectRelease();
}

+ (void)setTipActionPerformed:(id)a3
{
  sub_1AB23A76C();
  _s12PhotosUICore17PXOneUpTipsHelperC21setTipActionPerformedyySSFZ_0();
  swift_bridgeObjectRelease();
}

+ (void)signalOneUpPhotoOpened
{
}

+ (void)signalSyndicatedPhotosPresented
{
}

+ (void)signalDidQuickCrop
{
}

- (PXOneUpTipsHelper_Swift)init
{
  return (PXOneUpTipsHelper_Swift *)PXOneUpTipsHelper.init()();
}

@end