@interface PXStoryViewAccessibilityHUDContentProvider
- (PXStoryViewAccessibilityHUDContentProvider)initWithViewModel:(id)a3;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
@end

@implementation PXStoryViewAccessibilityHUDContentProvider

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return @"HUD not available on the current platform";
}

- (PXStoryViewAccessibilityHUDContentProvider)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewAccessibilityHUDContentProvider;
  return [(PXStoryViewAccessibilityHUDContentProvider *)&v4 init];
}

@end