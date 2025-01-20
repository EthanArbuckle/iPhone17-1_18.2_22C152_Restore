@interface PXTitleSubtitleLabelSpec(CuratedLibrary)
+ (void)px_headerTitleSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:;
@end

@implementation PXTitleSubtitleLabelSpec(CuratedLibrary)

+ (void)px_headerTitleSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)off_1E5DA9618);
  if (PXCuratedLibraryHeaderWantsTitleForZoomLevel(a3, v5))
  {
    v7 = objc_msgSend(off_1E5DA6FD0, "px_headerTitleLabelSpecForZoomLevel:featureSpec:", a3, v5);
    [v6 setTitleLabelSpec:v7];
  }
  if (PXCuratedLibraryHeaderWantsSubtitleForZoomLevel(a3, v5))
  {
    v8 = objc_msgSend(off_1E5DA6FD0, "px_headerSubtitleLabelSpecForZoomLevel:featureSpec:", a3, v5);
    [v6 setSubtitleLabelSpec:v8];
  }
  _DistanceBetweenTitleAndSubtitleForZoomLevelFeatureSpec(a3, v5);
  [v5 contentSizeCategory];
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
}

@end