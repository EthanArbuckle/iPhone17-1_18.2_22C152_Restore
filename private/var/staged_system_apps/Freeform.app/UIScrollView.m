@interface UIScrollView
- (BOOL)crlaxAnimationEndedShouldHandleDelegateCallbacks;
- (BOOL)crlaxContentOffsetWasChanged;
- (BOOL)crlaxIsScrollingDisabled;
- (BOOL)crlaxScrollStatusPrefersHorizontal;
- (BOOL)crlaxShouldIgnoreSiblingPageControl;
- (BOOL)crlaxUseContentInset;
- (NSString)crlaxScrollStatusFormatString;
- (double)crlaxScrollAnnouncementDelay;
- (void)crlaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3;
- (void)crlaxSetContentOffsetWasChanged:(BOOL)a3;
- (void)crlaxSetScrollAnnouncementDelay:(double)a3;
- (void)crlaxSetScrollStatusFormatString:(id)a3;
- (void)crlaxSetScrollStatusPrefersHorizontal:(BOOL)a3;
- (void)crlaxSetScrollingDisabled:(BOOL)a3;
- (void)crlaxSetShouldIgnoreSiblingPageControl:(BOOL)a3;
- (void)crlaxSetUseContentInset:(BOOL)a3;
@end

@implementation UIScrollView

- (NSString)crlaxScrollStatusFormatString
{
  return (NSString *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9200);
}

- (void)crlaxSetScrollStatusFormatString:(id)a3
{
}

- (BOOL)crlaxUseContentInset
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9201);
}

- (void)crlaxSetUseContentInset:(BOOL)a3
{
}

- (double)crlaxScrollAnnouncementDelay
{
  __CRLAccessibilityGetAssociatedTimeInterval(self, &unk_1016A9202);
  return result;
}

- (void)crlaxSetScrollAnnouncementDelay:(double)a3
{
}

- (BOOL)crlaxScrollStatusPrefersHorizontal
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9203);
}

- (void)crlaxSetScrollStatusPrefersHorizontal:(BOOL)a3
{
}

- (BOOL)crlaxShouldIgnoreSiblingPageControl
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9204);
}

- (void)crlaxSetShouldIgnoreSiblingPageControl:(BOOL)a3
{
}

- (BOOL)crlaxIsScrollingDisabled
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9205);
}

- (void)crlaxSetScrollingDisabled:(BOOL)a3
{
}

- (BOOL)crlaxAnimationEndedShouldHandleDelegateCallbacks
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9206);
}

- (void)crlaxSetAnimationEndedShouldHandleDelegateCallbacks:(BOOL)a3
{
}

- (BOOL)crlaxContentOffsetWasChanged
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9207);
}

- (void)crlaxSetContentOffsetWasChanged:(BOOL)a3
{
}

@end