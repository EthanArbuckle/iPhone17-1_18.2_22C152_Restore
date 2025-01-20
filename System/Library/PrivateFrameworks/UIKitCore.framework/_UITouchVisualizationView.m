@interface _UITouchVisualizationView
+ (BOOL)_supportsInvalidatingFocusCache;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_shouldInformFocusAboutBecomingVisible;
- (BOOL)isTransparentFocusItem;
- (id)focusItemsInRect:(CGRect)a3;
@end

@implementation _UITouchVisualizationView

- (BOOL)_shouldInformFocusAboutBecomingVisible
{
  return 0;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

@end