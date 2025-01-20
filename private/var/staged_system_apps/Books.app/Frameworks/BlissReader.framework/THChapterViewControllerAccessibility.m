@interface THChapterViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3;
- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3;
- (id)thaxDelegate;
- (unint64_t)thaxChapterIndex;
@end

@implementation THChapterViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THChapterViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxDelegate
{
  return [(THChapterViewControllerAccessibility *)self tsaxValueForKey:@"mDelegate"];
}

- (unint64_t)thaxChapterIndex
{
  return (unint64_t)[(THChapterViewControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"chapterIndex"];
}

- (BOOL)thaxShouldClipRepAccessibilityFrameToVisibleBoundsForICC:(id)a3
{
  return 1;
}

- (BOOL)thaxShouldFilterOutNonVisibleRepsForICC:(id)a3
{
  return 1;
}

@end