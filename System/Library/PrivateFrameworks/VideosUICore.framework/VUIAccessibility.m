@interface VUIAccessibility
+ (BOOL)contentSizeCategoryIsAccessibility:(unint64_t)a3;
+ (BOOL)isAXLargeEnabled:(unint64_t)a3;
+ (BOOL)isAXSmallEnabled:(unint64_t)a3;
+ (BOOL)isFeatureEnabled:(int64_t)a3;
+ (id)makeAccessibilityIdentifierString:(id)a3 additionalString:(id)a4;
+ (id)sharedInstance;
- (VUIAccessibility)init;
- (void)_addObserverToAccessibilityNotifications;
- (void)_didChangeAccessibilityReduceMotionStatus;
- (void)_didChangeAccessibilityVoiceOverStatus;
- (void)dealloc;
@end

@implementation VUIAccessibility

+ (BOOL)isAXLargeEnabled:(unint64_t)a3
{
  v3 = +[VUICoreUtilities uiContentSizeCategoryFor:a3];
  v4 = v3;
  if (!v3 || [v3 isEqual:*MEMORY[0x1E4F437D0]])
  {
    v5 = [MEMORY[0x1E4F42D90] mainScreen];
    v6 = [v5 traitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];

    v4 = (void *)v7;
  }
  BOOL v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4F43778]) == NSOrderedDescending;

  return v8;
}

uint64_t __34__VUIAccessibility_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIAccessibility);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (VUIAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIAccessibility;
  v2 = [(VUIAccessibility *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VUIAccessibility *)v2 _addObserverToAccessibilityNotifications];
  }
  return v3;
}

- (void)_addObserverToAccessibilityNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__didChangeAccessibilityVoiceOverStatus name:*MEMORY[0x1E4F43580] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__didChangeAccessibilityReduceMotionStatus name:*MEMORY[0x1E4F43478] object:0];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

+ (BOOL)contentSizeCategoryIsAccessibility:(unint64_t)a3
{
  v3 = +[VUICoreUtilities uiContentSizeCategoryFor:a3];
  id v4 = v3;
  if (!v3 || [v3 isEqual:*MEMORY[0x1E4F437D0]])
  {
    objc_super v5 = [MEMORY[0x1E4F42D90] mainScreen];
    v6 = [v5 traitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];

    id v4 = (void *)v7;
  }
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4);

  return IsAccessibilityCategory;
}

+ (BOOL)isAXSmallEnabled:(unint64_t)a3
{
  v3 = +[VUICoreUtilities uiContentSizeCategoryFor:a3];
  id v4 = v3;
  if (!v3 || [v3 isEqual:*MEMORY[0x1E4F437D0]])
  {
    objc_super v5 = [MEMORY[0x1E4F42D90] mainScreen];
    v6 = [v5 traitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];

    id v4 = (void *)v7;
  }
  BOOL v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4F43790]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4F43770]) == NSOrderedAscending;

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIAccessibility;
  [(VUIAccessibility *)&v4 dealloc];
}

+ (BOOL)isFeatureEnabled:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      return UIAccessibilityIsVoiceOverRunning();
    case 1:
      return UIAccessibilityIsReduceMotionEnabled();
    case 2:
      return UIAccessibilityIsSwitchControlRunning();
    case 3:
      int v5 = _AXSFullKeyboardAccessEnabled();
      return v5 != 0;
    case 4:
      v6 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v7 = [v6 preferredContentSizeCategory];
      BOOL v3 = v7 != 0;

      return v3;
    case 5:
      return UIAccessibilityIsVideoAutoplayEnabled();
    case 6:
      int v5 = _AXSEnhanceBackgroundContrastEnabled();
      return v5 != 0;
    default:
      return v3;
  }
}

- (void)_didChangeAccessibilityVoiceOverStatus
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIAccessibilityVoiceOverStatusDidChangeNotification" object:0];
}

- (void)_didChangeAccessibilityReduceMotionStatus
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"VUIAccessibilityReduceMotionStatusDidChangeNotification" object:0];
}

+ (id)makeAccessibilityIdentifierString:(id)a3 additionalString:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  uint64_t v7 = v6;
  if (!v6)
  {
    BOOL v8 = [NSString stringWithFormat:@"Accessibility:: no additionalString for %@. Using Default", v5];
    NSLog(&stru_1F3DEFCE0.isa, v8);

    uint64_t v7 = @"Default";
  }
  v9 = [NSString stringWithFormat:@"%@%@.%@", @"UIA.TV.", v5, v7];

  return v9;
}

@end