@interface PUInterfaceManager
+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3;
+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3;
+ (PUInterfaceTheme)currentTheme;
+ (id)beginDisablingUserInteractionForReason:(int64_t)a3;
+ (id)beginDisablingUserInteractionForReason:(int64_t)a3 withExpectedTimeout:(double)a4;
+ (void)_disabledUserInteractionRequestDidTimeOut:(id)a3;
+ (void)_handleInteractionDisablingTimeout;
+ (void)_handleInteractionDisablingTimeoutForAlbumStackTransition;
+ (void)_handleInteractionDisablingTimeoutForBannerViewImagesJump;
+ (void)_handleInteractionDisablingTimeoutForBurningInTrim;
+ (void)_handleInteractionDisablingTimeoutForOneUpToPhotoEditorTransition;
+ (void)_handleInteractionDisablingTimeoutForOverOneUpTransition;
+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserToPhotoEditorTransition;
+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserZoomTransition;
+ (void)_handleInteractionDisablingTimeoutForPhotoEditorComputingAutoEnhance;
+ (void)_handleInteractionDisablingTimeoutForPhotoEditorRevertingChanges;
+ (void)_handleInteractionDisablingTimeoutForPhotoEditorSavingChanges;
+ (void)_handleInteractionDisablingTimeoutForPhotoEditorToPhotoBrowserTransition;
+ (void)_handleInteractionDisablingTimeoutForPhotoEditorWaitingToDismiss;
+ (void)_handleInteractionDisablingTimeoutForRetouching;
+ (void)_handleInteractionDisablingTimeoutForSearchSelectResult;
+ (void)_handleInteractionDisablingTimeoutForSearchSelectSuggestion;
+ (void)_handleInteractionDisablingTimeoutForStartSlideshowFromGrid;
+ (void)endDisablingUserInteraction:(id)a3;
@end

@implementation PUInterfaceManager

+ (BOOL)shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:(id)a3
{
  v4 = (void *)*MEMORY[0x1E4FB2608];
  id v5 = a3;
  v6 = [v4 preferredContentSizeCategory];
  int v7 = [a1 shouldUsePhoneLayoutWithTraitCollection:v5];

  if (v7) {
    LOBYTE(v7) = UIContentSizeCategoryIsAccessibilityCategory(v6);
  }

  return v7;
}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 horizontalSizeClass] == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

+ (void)_handleInteractionDisablingTimeout
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_DisabledUserIn.isa, a2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = objc_msgSend((id)__disabledUserInteractionTokens, "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [a1 endDisablingUserInteraction:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)_handleInteractionDisablingTimeoutForRetouching
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForBurningInTrim
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForOverOneUpTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForOneUpToPhotoEditorTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorComputingAutoEnhance
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorWaitingToDismiss
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorRevertingChanges
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorSavingChanges
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoEditorToPhotoBrowserTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserToPhotoEditorTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForAlbumStackTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForSearchSelectSuggestion
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForSearchSelectResult
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForBannerViewImagesJump
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForStartSlideshowFromGrid
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_handleInteractionDisablingTimeoutForPhotoBrowserZoomTransition
{
  if (MEMORY[0x1B3E7A510](a1, a2)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"No call to +endDisablingUserInteraction: did occur in time for: %@", __disabledUserInteractionTokens format];
  }
  [a1 _handleInteractionDisablingTimeout];
}

+ (void)_disabledUserInteractionRequestDidTimeOut:(id)a3
{
  objc_msgSend((id)__disabledUserInteractionTokens, "anyObject", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  switch([v4 reason])
  {
    case 0:
      [a1 _handleInteractionDisablingTimeout];
      break;
    case 1:
      [a1 _handleInteractionDisablingTimeoutForPhotoBrowserZoomTransition];
      break;
    case 2:
      [a1 _handleInteractionDisablingTimeoutForStartSlideshowFromGrid];
      break;
    case 3:
      [a1 _handleInteractionDisablingTimeoutForBannerViewImagesJump];
      break;
    case 4:
      [a1 _handleInteractionDisablingTimeoutForSearchSelectResult];
      break;
    case 5:
      [a1 _handleInteractionDisablingTimeoutForSearchSelectSuggestion];
      break;
    case 6:
      [a1 _handleInteractionDisablingTimeoutForAlbumStackTransition];
      break;
    case 7:
      [a1 _handleInteractionDisablingTimeoutForPhotoBrowserToPhotoEditorTransition];
      break;
    case 8:
      [a1 _handleInteractionDisablingTimeoutForPhotoEditorToPhotoBrowserTransition];
      break;
    case 9:
      [a1 _handleInteractionDisablingTimeoutForOneUpToPhotoEditorTransition];
      goto LABEL_12;
    case 10:
LABEL_12:
      [a1 _handleInteractionDisablingTimeoutForOverOneUpTransition];
      break;
    case 11:
      [a1 _handleInteractionDisablingTimeoutForPhotoEditorSavingChanges];
      break;
    case 12:
      [a1 _handleInteractionDisablingTimeoutForPhotoEditorRevertingChanges];
      break;
    case 13:
      [a1 _handleInteractionDisablingTimeoutForPhotoEditorWaitingToDismiss];
      break;
    case 14:
      [a1 _handleInteractionDisablingTimeoutForPhotoEditorComputingAutoEnhance];
      break;
    case 16:
      [a1 _handleInteractionDisablingTimeoutForBurningInTrim];
      break;
    case 17:
      [a1 _handleInteractionDisablingTimeoutForRetouching];
      break;
    default:
      break;
  }
}

+ (void)endDisablingUserInteraction:(id)a3
{
  id v6 = a3;
  if (objc_msgSend((id)__disabledUserInteractionTokens, "containsObject:"))
  {
    [(id)__disabledUserInteractionTokens removeObject:v6];
    if (![(id)__disabledUserInteractionTokens count])
    {
      id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v4 = objc_msgSend(v3, "px_firstKeyWindow");
      [v3 endIgnoringInteractionEvents];
      [v4 endDisablingInterfaceAutorotation];
      [(id)__disabledUserInteractionTimeoutTimer invalidate];
      uint64_t v5 = (void *)__disabledUserInteractionTimeoutTimer;
      __disabledUserInteractionTimeoutTimer = 0;
    }
  }
  else if (MEMORY[0x1B3E7A510]())
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Call to +endDisablingUserInteraction: without corresponding call to +beginDisablingUserInteraction"];
  }
  else
  {
    NSLog(&cfstr_IgnoreUnbalana.isa);
  }
}

+ (id)beginDisablingUserInteractionForReason:(int64_t)a3 withExpectedTimeout:(double)a4
{
  if (!a3)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"PUInterfaceManager.m" lineNumber:66 description:@"Need a valid interaction disabling reason."];
  }
  uint64_t v7 = objc_alloc_init(_PUDisabledUserInteractionToken);
  if (MEMORY[0x1B3E7A510]([(_PUDisabledUserInteractionToken *)v7 setReason:a3]))
  {
    long long v8 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v9 = [v8 description];

    [(_PUDisabledUserInteractionToken *)v7 setIdentifier:v9];
  }
  if (![(id)__disabledUserInteractionTokens count])
  {
    long long v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    long long v11 = objc_msgSend(v10, "px_firstKeyWindow");
    [v10 beginIgnoringInteractionEvents];
    [v11 beginDisablingInterfaceAutorotation];
    v12 = (void *)MEMORY[0x1E4F1CB00];
    UIAnimationDragCoefficient();
    uint64_t v14 = [v12 scheduledTimerWithTimeInterval:a1 target:sel__disabledUserInteractionRequestDidTimeOut_ selector:0 userInfo:0 repeats:v13 * a4];
    v15 = (void *)__disabledUserInteractionTimeoutTimer;
    __disabledUserInteractionTimeoutTimer = v14;
  }
  v16 = (void *)__disabledUserInteractionTokens;
  if (!__disabledUserInteractionTokens)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    v18 = (void *)__disabledUserInteractionTokens;
    __disabledUserInteractionTokens = v17;

    v16 = (void *)__disabledUserInteractionTokens;
  }
  [v16 addObject:v7];
  return v7;
}

+ (id)beginDisablingUserInteractionForReason:(int64_t)a3
{
  return (id)[a1 beginDisablingUserInteractionForReason:a3 withExpectedTimeout:10.0];
}

+ (PUInterfaceTheme)currentTheme
{
  v2 = +[PURootSettings sharedInstance];
  id v3 = (objc_class *)[v2 interfaceThemeClass];

  if (!v3) {
    id v3 = (objc_class *)objc_opt_class();
  }
  if (([(id)currentTheme_currentTheme isMemberOfClass:v3] & 1) == 0)
  {
    id v4 = objc_alloc_init(v3);
    uint64_t v5 = (void *)currentTheme_currentTheme;
    currentTheme_currentTheme = (uint64_t)v4;
  }
  id v6 = (void *)currentTheme_currentTheme;
  return (PUInterfaceTheme *)v6;
}

@end