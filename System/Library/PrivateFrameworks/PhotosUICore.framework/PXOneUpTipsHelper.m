@interface PXOneUpTipsHelper
+ (NSString)actionsMenuTipID;
+ (NSString)infoPanelTipID;
+ (NSString)livePhotosTipID;
+ (NSString)quickCropTipID;
+ (NSString)syndicatedPhotosTipID;
+ (void)setTip:(id)a3 isPresentable:(BOOL)a4;
+ (void)setTipActionPerformed:(id)a3;
+ (void)setTipsPresentationDelegate:(id)a3;
+ (void)signalDidQuickCrop;
+ (void)signalOneUpPhotoOpened;
+ (void)signalSyndicatedPhotosPresented;
@end

@implementation PXOneUpTipsHelper

+ (void)signalDidQuickCrop
{
}

+ (void)signalSyndicatedPhotosPresented
{
}

+ (void)signalOneUpPhotoOpened
{
}

+ (void)setTipActionPerformed:(id)a3
{
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
}

+ (void)setTipsPresentationDelegate:(id)a3
{
}

+ (NSString)quickCropTipID
{
  return +[PXOneUpTipsHelper_Swift quickCropTipID];
}

+ (NSString)actionsMenuTipID
{
  return +[PXOneUpTipsHelper_Swift actionsMenuTipID];
}

+ (NSString)syndicatedPhotosTipID
{
  return +[PXOneUpTipsHelper_Swift syndicatedPhotosTipID];
}

+ (NSString)infoPanelTipID
{
  return +[PXOneUpTipsHelper_Swift infoPanelTipID];
}

+ (NSString)livePhotosTipID
{
  return +[PXOneUpTipsHelper_Swift livePhotosTipID];
}

@end