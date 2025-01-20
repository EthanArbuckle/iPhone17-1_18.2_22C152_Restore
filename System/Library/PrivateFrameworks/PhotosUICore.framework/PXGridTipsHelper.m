@interface PXGridTipsHelper
+ (NSString)curatedLibrarySwitchTipID;
+ (NSString)filterAllPhotosTipID;
+ (NSString)filterScreenshotsHiddenTipID;
+ (NSString)syndicatedAssetsTipID;
+ (void)setTip:(id)a3 isPresentable:(BOOL)a4;
+ (void)setTipActionPerformed:(id)a3;
+ (void)setTipsPresentationDelegate:(id)a3;
+ (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4;
@end

@implementation PXGridTipsHelper

+ (NSString)curatedLibrarySwitchTipID
{
  return +[PXGridTipsHelper_Swift curatedLibrarySwitchTipID];
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
}

+ (NSString)syndicatedAssetsTipID
{
  return +[PXGridTipsHelper_Swift syndicatedAssetsTipID];
}

+ (NSString)filterAllPhotosTipID
{
  return +[PXGridTipsHelper_Swift filterAllPhotosTipID];
}

+ (void)setTipsPresentationDelegate:(id)a3
{
}

+ (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  id v9 = +[PXGridTipsHelper_Swift shared];
  objc_msgSend(v9, "updatePopoverTip:sourceRect:", v8, x, y, width, height);
}

+ (void)setTipActionPerformed:(id)a3
{
}

+ (NSString)filterScreenshotsHiddenTipID
{
  return +[PXGridTipsHelper_Swift filterScreenshotsHiddenTipID];
}

@end