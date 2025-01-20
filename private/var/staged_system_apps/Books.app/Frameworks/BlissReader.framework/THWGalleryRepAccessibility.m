@interface THWGalleryRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxButtonControlRepIsIgnored:(id)a3;
- (BOOL)thaxButtonControlRepIsSelected:(id)a3;
- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3;
- (BOOL)tsaxIsReadyToLoadChildren;
- (NSArray)_thaxItems;
- (NSString)thaxCaptionForCurrentItem;
- (NSString)thaxGalleryTitle;
- (NSString)thaxItemCountDescriptionForCurrentItem;
- (THTSDCanvasViewAccessibility)thaxStageCanvasView;
- (THTSDCanvasViewAccessibility)thaxThumbnailCanvasView;
- (THWGalleryItemAccessibility)_thaxCurrentItem;
- (THWPagedCanvasControllerAccessibility)_thaxStageCanvasController;
- (THWPagedCanvasControllerAccessibility)_thaxThumbnailTrackCanvasController;
- (id)_thaxItemOrderDescriptionForItemAtIndex:(unint64_t)a3;
- (id)accessibilityLabel;
- (id)thaxLabelForButtonControlRep:(id)a3;
- (int64_t)accessibilityContainerType;
- (unint64_t)_thaxCurrentItemIndex;
- (unint64_t)thaxTotalItemCount;
- (void)p_goToPage:(unint64_t)a3;
- (void)thaxAnnounceCurrentGalleryItem;
@end

@implementation THWGalleryRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  return [(THWGalleryRepAccessibility *)self thaxGalleryTitle];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return [(THWGalleryRepAccessibility *)self thaxStageCanvasView] != 0;
}

- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3
{
  return 1;
}

- (void)thaxAnnounceCurrentGalleryItem
{
  v3 = [(THWGalleryRepAccessibility *)self thaxItemCountDescriptionForCurrentItem];
  v4 = [(THWGalleryRepAccessibility *)self thaxCaptionForCurrentItem];
  v11 = __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  TSAccessibilityPostAnnouncementNotification(0, (uint64_t)v11);
}

+ (id)tsaxTargetClassName
{
  return @"THWGalleryRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxGalleryTitle
{
  v2 = [[-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo")] tsaxValueForKey:@"titleString"];
  if ([(NSString *)v2 length]) {
    return v2;
  }

  return THAccessibilityLocalizedString(@"gallery");
}

- (NSString)thaxCaptionForCurrentItem
{
  v2 = [(THWGalleryRepAccessibility *)self _thaxCurrentItem];

  return [(THWGalleryItemAccessibility *)v2 thaxDescription];
}

- (NSString)thaxItemCountDescriptionForCurrentItem
{
  unint64_t v3 = [(THWGalleryRepAccessibility *)self _thaxCurrentItemIndex];

  return (NSString *)[(THWGalleryRepAccessibility *)self _thaxItemOrderDescriptionForItemAtIndex:v3];
}

- (THTSDCanvasViewAccessibility)thaxStageCanvasView
{
  v2 = [(THWGalleryRepAccessibility *)self _thaxStageCanvasController];

  return [(THWPagedCanvasControllerAccessibility *)v2 thaxCanvasView];
}

- (THTSDCanvasViewAccessibility)thaxThumbnailCanvasView
{
  v2 = [(THWGalleryRepAccessibility *)self _thaxThumbnailTrackCanvasController];

  return [(THWPagedCanvasControllerAccessibility *)v2 thaxCanvasView];
}

- (unint64_t)thaxTotalItemCount
{
  v2 = [(THWGalleryRepAccessibility *)self _thaxItems];

  return [(NSArray *)v2 count];
}

- (void)p_goToPage:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWGalleryRepAccessibility;
  [(THWGalleryRepAccessibility *)&v5 p_goToPage:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_28B50C;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 0.5);
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  id v4 = [a3 thaxIndex];

  return [(THWGalleryRepAccessibility *)self _thaxItemOrderDescriptionForItemAtIndex:v4];
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  return 0;
}

- (BOOL)thaxButtonControlRepIsSelected:(id)a3
{
  id v4 = [a3 thaxIndex];
  return v4 == (id)[(THWGalleryRepAccessibility *)self _thaxCurrentItemIndex];
}

- (THWPagedCanvasControllerAccessibility)_thaxStageCanvasController
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"stageCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THWPagedCanvasControllerAccessibility)_thaxThumbnailTrackCanvasController
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THWPagedCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"thumbnailTrackCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (unint64_t)_thaxCurrentItemIndex
{
  v2 = [(THWGalleryRepAccessibility *)self _thaxStageCanvasController];

  return (unint64_t)[(THWPagedCanvasControllerAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"pageIndex"];
}

- (id)_thaxItemOrderDescriptionForItemAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(THWGalleryRepAccessibility *)self thaxTotalItemCount];
  char v5 = THAccessibilityLocalizedString(@"gallery.item.number.of.number %@ %@");
  id v6 = TSAccessibilityLocalizedUnsignedInteger(a3 + 1);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6, TSAccessibilityLocalizedUnsignedInteger(v4));
}

- (NSArray)_thaxItems
{
  char v5 = 0;
  unint64_t v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo") tsaxValueForKey:@"items"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THWGalleryItemAccessibility)_thaxCurrentItem
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THWGalleryItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"currentItem"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end