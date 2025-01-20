@interface TSNSObjectAccessibility_iOS
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityServesAsFirstElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation TSNSObjectAccessibility_iOS

+ (id)tsaxTargetClassName
{
  return @"NSObject";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityElementDidBecomeFocused
{
  v3.receiver = self;
  v3.super_class = (Class)TSNSObjectAccessibility_iOS;
  [(TSNSObjectAccessibility_iOS *)&v3 accessibilityElementDidBecomeFocused];
  [+[TSAccessibility sharedInstance] _setCurrentlyFocusedElement:self];
}

- (void)accessibilityElementDidLoseFocus
{
  v2.receiver = self;
  v2.super_class = (Class)TSNSObjectAccessibility_iOS;
  [(TSNSObjectAccessibility_iOS *)&v2 accessibilityElementDidLoseFocus];
  [+[TSAccessibility sharedInstance] _setCurrentlyFocusedElement:0];
}

- (BOOL)_accessibilityServesAsFirstElement
{
  if ([+[TSAccessibility sharedInstance] _firstElementForUpcomingScreenChange] == self)return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)TSNSObjectAccessibility_iOS;
  return [(TSNSObjectAccessibility_iOS *)&v4 _accessibilityServesAsFirstElement];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSNSObjectAccessibility_iOS;
  [(TSNSObjectAccessibility_iOS *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TSNSObjectAccessibility_iOS *)self tsaxLoadAccessibilityInformation];
}

@end