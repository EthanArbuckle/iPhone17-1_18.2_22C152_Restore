@interface PVHostApplicationDelegateHandler
+ (id)sharedInstance;
- (BOOL)cacheDelegateResponses;
- (BOOL)wantsDynamicLineSpacingForDiacritics;
- (BOOL)wantsExtraLineSpacingForDiacritics;
- (BOOL)wantsSameAlignmentForAllLinesOfText;
- (BOOL)wantsToAdjustTextBoundsHeightUsingCapHeight;
- (BOOL)wantsToAssertThatLoadedSceneHasAnimateFlagDisabled;
- (BOOL)wantsToAssertThatTopLevelGroupSpansEntireScene;
- (BOOL)wantsToCacheTopLevelGroupRender;
- (BOOL)wantsToComputeTypographicHeightWithoutLastLineLeading;
- (BOOL)wantsToDownscaleGlyphsToOutputSize;
- (BOOL)wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions;
- (BOOL)wantsToIgnoreTextBoundsOfTransparentObjects;
- (BOOL)wantsToImproveQualityOfDraftQualityText;
- (BOOL)wantsToIncludeCoordinateSystemTranslationInEffectViewTransform;
- (BOOL)wantsToIncludeSubstituteFontNameInAttributedString;
- (BOOL)wantsToIncludeTrackingValueInAttributedString;
- (BOOL)wantsToIncludeTrailingWhitespaceInParagraphLineWidth;
- (BOOL)wantsToLimitLinesOfText;
- (BOOL)wantsToScaleEmojiToCapHeight;
- (BOOL)wantsToSetTranscriptionsUsingArray;
- (BOOL)wantsToSkipSuggestedLineBreaksInParagraphLayout;
- (BOOL)wantsToUseBinarySearchForScalingToBothMargins;
- (BOOL)wantsToUseCachedTextureForText;
- (PVHostApplicationDelegate)hostApplicationDelegate;
- (PVHostApplicationDelegateHandler)init;
- (id)effectTemplatesBundle;
- (id)effectTemplatesDirectoryName;
- (id)preferredDisplayColorSpace;
- (id)preferredExportColorSpace;
- (unsigned)getMaxGlyphResolution;
- (unsigned)getNumberOfLinesToLimitTextTo;
- (void)setCacheDelegateResponses:(BOOL)a3;
- (void)setHostApplicationDelegate:(id)a3;
@end

@implementation PVHostApplicationDelegateHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_s;

  return v2;
}

void __50__PVHostApplicationDelegateHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PVHostApplicationDelegateHandler);
  v1 = (void *)sharedInstance_s;
  sharedInstance_s = (uint64_t)v0;
}

- (PVHostApplicationDelegateHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVHostApplicationDelegateHandler;
  result = [(PVHostApplicationDelegateHandler *)&v3 init];
  if (result) {
    result->_cacheDelegateResponses = 1;
  }
  return result;
}

- (id)preferredDisplayColorSpace
{
  p_hostApplicationDelegate = &self->_hostApplicationDelegate;
  char v3 = objc_opt_respondsToSelector();
  v4 = (id *)off_1E6167DD0;
  if (v3) {
    v4 = (id *)p_hostApplicationDelegate;
  }
  v5 = [*v4 preferredDisplayColorSpace];

  return v5;
}

- (id)preferredExportColorSpace
{
  p_hostApplicationDelegate = &self->_hostApplicationDelegate;
  char v3 = objc_opt_respondsToSelector();
  v4 = (id *)off_1E6167DD0;
  if (v3) {
    v4 = (id *)p_hostApplicationDelegate;
  }
  v5 = [*v4 preferredExportColorSpace];

  return v5;
}

- (id)effectTemplatesDirectoryName
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __64__PVHostApplicationDelegateHandler_effectTemplatesDirectoryName__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (effectTemplatesDirectoryName_once != -1) {
      dispatch_once(&effectTemplatesDirectoryName_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  id v5 = (id)effectTemplatesDirectoryName_s;

  return v5;
}

void __64__PVHostApplicationDelegateHandler_effectTemplatesDirectoryName__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 16) effectTemplatesDirectoryName];
  }
  else
  {
    v2 = @"iOSTemplates.localized";
  }
  char v3 = (void *)effectTemplatesDirectoryName_s;
  effectTemplatesDirectoryName_s = (uint64_t)v2;
}

- (id)effectTemplatesBundle
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __57__PVHostApplicationDelegateHandler_effectTemplatesBundle__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (effectTemplatesBundle_once != -1) {
      dispatch_once(&effectTemplatesBundle_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  id v5 = (id)effectTemplatesBundle_s;

  return v5;
}

void __57__PVHostApplicationDelegateHandler_effectTemplatesBundle__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) effectTemplatesBundle];
    char v3 = (void *)effectTemplatesBundle_s;
    effectTemplatesBundle_s = v2;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = (void *)effectTemplatesBundle_s;
    effectTemplatesBundle_s = v4;

    v6 = [*(id *)(a1 + 32) effectTemplatesDirectoryName];
    v7 = [(id)effectTemplatesBundle_s pathForResource:v6 ofType:0];

    if (!v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = *(void *)"";
      v8[2] = __57__PVHostApplicationDelegateHandler_effectTemplatesBundle__block_invoke_2;
      v8[3] = &unk_1E61690B0;
      id v9 = v6;
      [&unk_1F11EC628 enumerateObjectsUsingBlock:v8];
    }
  }
}

void __57__PVHostApplicationDelegateHandler_effectTemplatesBundle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id obj = [MEMORY[0x1E4F28B50] bundleWithIdentifier:a2];
  v6 = [obj pathForResource:*(void *)(a1 + 32) ofType:0];

  if (v6)
  {
    objc_storeStrong((id *)&effectTemplatesBundle_s, obj);
    *a4 = 1;
  }
}

- (BOOL)wantsExtraLineSpacingForDiacritics
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __70__PVHostApplicationDelegateHandler_wantsExtraLineSpacingForDiacritics__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsExtraLineSpacingForDiacritics_once != -1) {
      dispatch_once(&wantsExtraLineSpacingForDiacritics_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsExtraLineSpacingForDiacritics_s;

  return v5;
}

uint64_t __70__PVHostApplicationDelegateHandler_wantsExtraLineSpacingForDiacritics__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsExtraLineSpacingForDiacritics];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsExtraLineSpacingForDiacritics_s = result;
  return result;
}

- (BOOL)wantsDynamicLineSpacingForDiacritics
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __72__PVHostApplicationDelegateHandler_wantsDynamicLineSpacingForDiacritics__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsDynamicLineSpacingForDiacritics_once != -1) {
      dispatch_once(&wantsDynamicLineSpacingForDiacritics_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsDynamicLineSpacingForDiacritics_s;

  return v5;
}

uint64_t __72__PVHostApplicationDelegateHandler_wantsDynamicLineSpacingForDiacritics__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsDynamicLineSpacingForDiacritics];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsDynamicLineSpacingForDiacritics_s = result;
  return result;
}

- (BOOL)wantsToScaleEmojiToCapHeight
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __64__PVHostApplicationDelegateHandler_wantsToScaleEmojiToCapHeight__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToScaleEmojiToCapHeight_once != -1) {
      dispatch_once(&wantsToScaleEmojiToCapHeight_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToScaleEmojiToCapHeight_s;

  return v5;
}

uint64_t __64__PVHostApplicationDelegateHandler_wantsToScaleEmojiToCapHeight__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToScaleEmojiToCapHeight];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsToScaleEmojiToCapHeight_s = result;
  return result;
}

- (BOOL)wantsToSkipSuggestedLineBreaksInParagraphLayout
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __83__PVHostApplicationDelegateHandler_wantsToSkipSuggestedLineBreaksInParagraphLayout__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToSkipSuggestedLineBreaksInParagraphLayout_once != -1) {
      dispatch_once(&wantsToSkipSuggestedLineBreaksInParagraphLayout_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToSkipSuggestedLineBreaksInParagraphLayout_s;

  return v5;
}

uint64_t __83__PVHostApplicationDelegateHandler_wantsToSkipSuggestedLineBreaksInParagraphLayout__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToSkipSuggestedLineBreaksInParagraphLayout];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsToSkipSuggestedLineBreaksInParagraphLayout_s = result;
  return result;
}

- (BOOL)wantsToUseBinarySearchForScalingToBothMargins
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __81__PVHostApplicationDelegateHandler_wantsToUseBinarySearchForScalingToBothMargins__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToUseBinarySearchForScalingToBothMargins_once != -1) {
      dispatch_once(&wantsToUseBinarySearchForScalingToBothMargins_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToUseBinarySearchForScalingToBothMargins_s;

  return v5;
}

uint64_t __81__PVHostApplicationDelegateHandler_wantsToUseBinarySearchForScalingToBothMargins__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToUseBinarySearchForScalingToBothMargins];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsToUseBinarySearchForScalingToBothMargins_s = result;
  return result;
}

- (BOOL)wantsToLimitLinesOfText
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __59__PVHostApplicationDelegateHandler_wantsToLimitLinesOfText__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToLimitLinesOfText_once != -1) {
      dispatch_once(&wantsToLimitLinesOfText_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToLimitLinesOfText_s;

  return v5;
}

uint64_t __59__PVHostApplicationDelegateHandler_wantsToLimitLinesOfText__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToLimitLinesOfText];
    wantsToLimitLinesOfText_s = result;
  }
  return result;
}

- (unsigned)getNumberOfLinesToLimitTextTo
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __65__PVHostApplicationDelegateHandler_getNumberOfLinesToLimitTextTo__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (getNumberOfLinesToLimitTextTo_once != -1) {
      dispatch_once(&getNumberOfLinesToLimitTextTo_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  unsigned int v5 = getNumberOfLinesToLimitTextTo_s;

  return v5;
}

void __65__PVHostApplicationDelegateHandler_getNumberOfLinesToLimitTextTo__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    int v2 = [*(id *)(*(void *)(a1 + 32) + 16) getNumberOfLinesToLimitTextTo];
LABEL_7:
    getNumberOfLinesToLimitTextTo_s = v2;
    return;
  }
  if (isRunningInMiro_once != -1) {
    dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
  }
  if (isRunningInMiro_s)
  {
    int v2 = 2;
    goto LABEL_7;
  }
}

- (BOOL)wantsToImproveQualityOfDraftQualityText
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __75__PVHostApplicationDelegateHandler_wantsToImproveQualityOfDraftQualityText__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToImproveQualityOfDraftQualityText_once != -1) {
      dispatch_once(&wantsToImproveQualityOfDraftQualityText_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToImproveQualityOfDraftQualityText_s;

  return v5;
}

uint64_t __75__PVHostApplicationDelegateHandler_wantsToImproveQualityOfDraftQualityText__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToImproveQualityOfDraftQualityText];
    wantsToImproveQualityOfDraftQualityText_s = result;
  }
  return result;
}

- (BOOL)wantsSameAlignmentForAllLinesOfText
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __71__PVHostApplicationDelegateHandler_wantsSameAlignmentForAllLinesOfText__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsSameAlignmentForAllLinesOfText_once != -1) {
      dispatch_once(&wantsSameAlignmentForAllLinesOfText_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsSameAlignmentForAllLinesOfText_s;

  return v5;
}

uint64_t __71__PVHostApplicationDelegateHandler_wantsSameAlignmentForAllLinesOfText__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsSameAlignmentForAllLinesOfText];
    wantsSameAlignmentForAllLinesOfText_s = result;
  }
  return result;
}

- (BOOL)wantsToDownscaleGlyphsToOutputSize
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __70__PVHostApplicationDelegateHandler_wantsToDownscaleGlyphsToOutputSize__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToDownscaleGlyphsToOutputSize_once != -1) {
      dispatch_once(&wantsToDownscaleGlyphsToOutputSize_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToDownscaleGlyphsToOutputSize_s;

  return v5;
}

uint64_t __70__PVHostApplicationDelegateHandler_wantsToDownscaleGlyphsToOutputSize__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToDownscaleGlyphsToOutputSize];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsToDownscaleGlyphsToOutputSize_s = result;
  return result;
}

- (BOOL)wantsToSetTranscriptionsUsingArray
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __70__PVHostApplicationDelegateHandler_wantsToSetTranscriptionsUsingArray__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToSetTranscriptionsUsingArray_once != -1) {
      dispatch_once(&wantsToSetTranscriptionsUsingArray_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToSetTranscriptionsUsingArray_s;

  return v5;
}

uint64_t __70__PVHostApplicationDelegateHandler_wantsToSetTranscriptionsUsingArray__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToSetTranscriptionsUsingArray];
    wantsToSetTranscriptionsUsingArray_s = result;
  }
  return result;
}

- (BOOL)wantsToIgnoreTextBoundsOfTransparentObjects
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __79__PVHostApplicationDelegateHandler_wantsToIgnoreTextBoundsOfTransparentObjects__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIgnoreTextBoundsOfTransparentObjects_once != -1) {
      dispatch_once(&wantsToIgnoreTextBoundsOfTransparentObjects_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIgnoreTextBoundsOfTransparentObjects_s;

  return v5;
}

uint64_t __79__PVHostApplicationDelegateHandler_wantsToIgnoreTextBoundsOfTransparentObjects__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIgnoreTextBoundsOfTransparentObjects];
    wantsToIgnoreTextBoundsOfTransparentObjects_s = result;
  }
  return result;
}

- (BOOL)wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __85__PVHostApplicationDelegateHandler_wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions_once != -1) {
      dispatch_once(&wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions_s;

  return v5;
}

uint64_t __85__PVHostApplicationDelegateHandler_wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions];
    wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions_s = result;
  }
  return result;
}

- (BOOL)wantsToUseCachedTextureForText
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __66__PVHostApplicationDelegateHandler_wantsToUseCachedTextureForText__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToUseCachedTextureForText_once != -1) {
      dispatch_once(&wantsToUseCachedTextureForText_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToUseCachedTextureForText_s;

  return v5;
}

uint64_t __66__PVHostApplicationDelegateHandler_wantsToUseCachedTextureForText__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToUseCachedTextureForText];
    wantsToUseCachedTextureForText_s = result;
  }
  return result;
}

- (BOOL)wantsToIncludeSubstituteFontNameInAttributedString
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __86__PVHostApplicationDelegateHandler_wantsToIncludeSubstituteFontNameInAttributedString__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIncludeSubstituteFontNameInAttributedString_once != -1) {
      dispatch_once(&wantsToIncludeSubstituteFontNameInAttributedString_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIncludeSubstituteFontNameInAttributedString_s;

  return v5;
}

uint64_t __86__PVHostApplicationDelegateHandler_wantsToIncludeSubstituteFontNameInAttributedString__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIncludeSubstituteFontNameInAttributedString];
    wantsToIncludeSubstituteFontNameInAttributedString_s = result;
  }
  return result;
}

- (BOOL)wantsToIncludeTrackingValueInAttributedString
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __81__PVHostApplicationDelegateHandler_wantsToIncludeTrackingValueInAttributedString__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIncludeTrackingValueInAttributedString_once != -1) {
      dispatch_once(&wantsToIncludeTrackingValueInAttributedString_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIncludeTrackingValueInAttributedString_s;

  return v5;
}

uint64_t __81__PVHostApplicationDelegateHandler_wantsToIncludeTrackingValueInAttributedString__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIncludeTrackingValueInAttributedString];
    wantsToIncludeTrackingValueInAttributedString_s = result;
  }
  return result;
}

- (BOOL)wantsToComputeTypographicHeightWithoutLastLineLeading
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __89__PVHostApplicationDelegateHandler_wantsToComputeTypographicHeightWithoutLastLineLeading__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToComputeTypographicHeightWithoutLastLineLeading_once != -1) {
      dispatch_once(&wantsToComputeTypographicHeightWithoutLastLineLeading_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToComputeTypographicHeightWithoutLastLineLeading_s;

  return v5;
}

uint64_t __89__PVHostApplicationDelegateHandler_wantsToComputeTypographicHeightWithoutLastLineLeading__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToComputeTypographicHeightWithoutLastLineLeading];
    wantsToComputeTypographicHeightWithoutLastLineLeading_s = result;
  }
  return result;
}

- (BOOL)wantsToAdjustTextBoundsHeightUsingCapHeight
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __79__PVHostApplicationDelegateHandler_wantsToAdjustTextBoundsHeightUsingCapHeight__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToAdjustTextBoundsHeightUsingCapHeight_once != -1) {
      dispatch_once(&wantsToAdjustTextBoundsHeightUsingCapHeight_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToAdjustTextBoundsHeightUsingCapHeight_s;

  return v5;
}

uint64_t __79__PVHostApplicationDelegateHandler_wantsToAdjustTextBoundsHeightUsingCapHeight__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToAdjustTextBoundsHeightUsingCapHeight];
    wantsToAdjustTextBoundsHeightUsingCapHeight_s = result;
  }
  return result;
}

- (BOOL)wantsToIncludeTrailingWhitespaceInParagraphLineWidth
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __88__PVHostApplicationDelegateHandler_wantsToIncludeTrailingWhitespaceInParagraphLineWidth__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIncludeTrailingWhitespaceInParagraphLineWidth_once != -1) {
      dispatch_once(&wantsToIncludeTrailingWhitespaceInParagraphLineWidth_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIncludeTrailingWhitespaceInParagraphLineWidth_s;

  return v5;
}

uint64_t __88__PVHostApplicationDelegateHandler_wantsToIncludeTrailingWhitespaceInParagraphLineWidth__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIncludeTrailingWhitespaceInParagraphLineWidth];
  }
  else
  {
    if (isRunningInMiro_once != -1) {
      dispatch_once(&isRunningInMiro_once, &__block_literal_global_107);
    }
    uint64_t result = isRunningInMiro_s != 0;
  }
  wantsToIncludeTrailingWhitespaceInParagraphLineWidth_s = result;
  return result;
}

- (BOOL)wantsToCacheTopLevelGroupRender
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __67__PVHostApplicationDelegateHandler_wantsToCacheTopLevelGroupRender__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToCacheTopLevelGroupRender_once != -1) {
      dispatch_once(&wantsToCacheTopLevelGroupRender_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToCacheTopLevelGroupRender_s;

  return v5;
}

uint64_t __67__PVHostApplicationDelegateHandler_wantsToCacheTopLevelGroupRender__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToCacheTopLevelGroupRender];
    wantsToCacheTopLevelGroupRender_s = result;
  }
  return result;
}

- (BOOL)wantsToAssertThatLoadedSceneHasAnimateFlagDisabled
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __86__PVHostApplicationDelegateHandler_wantsToAssertThatLoadedSceneHasAnimateFlagDisabled__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToAssertThatLoadedSceneHasAnimateFlagDisabled_once != -1) {
      dispatch_once(&wantsToAssertThatLoadedSceneHasAnimateFlagDisabled_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToAssertThatLoadedSceneHasAnimateFlagDisabled_s;

  return v5;
}

uint64_t __86__PVHostApplicationDelegateHandler_wantsToAssertThatLoadedSceneHasAnimateFlagDisabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToAssertThatLoadedSceneHasAnimateFlagDisabled];
    wantsToAssertThatLoadedSceneHasAnimateFlagDisabled_s = result;
  }
  return result;
}

- (BOOL)wantsToAssertThatTopLevelGroupSpansEntireScene
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __82__PVHostApplicationDelegateHandler_wantsToAssertThatTopLevelGroupSpansEntireScene__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToAssertThatTopLevelGroupSpansEntireScene_once != -1) {
      dispatch_once(&wantsToAssertThatTopLevelGroupSpansEntireScene_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToAssertThatTopLevelGroupSpansEntireScene_s;

  return v5;
}

uint64_t __82__PVHostApplicationDelegateHandler_wantsToAssertThatTopLevelGroupSpansEntireScene__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToAssertThatTopLevelGroupSpansEntireScene];
    wantsToAssertThatTopLevelGroupSpansEntireScene_s = result;
  }
  return result;
}

- (unsigned)getMaxGlyphResolution
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __57__PVHostApplicationDelegateHandler_getMaxGlyphResolution__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (getMaxGlyphResolution_once != -1) {
      dispatch_once(&getMaxGlyphResolution_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  unsigned int v5 = getMaxGlyphResolution_s;

  return v5;
}

uint64_t __57__PVHostApplicationDelegateHandler_getMaxGlyphResolution__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) getMaxGlyphResolution];
    getMaxGlyphResolution_s = result;
  }
  return result;
}

- (BOOL)wantsToIncludeCoordinateSystemTranslationInEffectViewTransform
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __98__PVHostApplicationDelegateHandler_wantsToIncludeCoordinateSystemTranslationInEffectViewTransform__block_invoke;
  v7[3] = &unk_1E6169088;
  v7[4] = self;
  v7[5] = a2;
  char v3 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
  uint64_t v4 = v3;
  if (self->_cacheDelegateResponses)
  {
    if (wantsToIncludeCoordinateSystemTranslationInEffectViewTransform_once != -1) {
      dispatch_once(&wantsToIncludeCoordinateSystemTranslationInEffectViewTransform_once, v3);
    }
  }
  else
  {
    v3[2](v3);
  }
  char v5 = wantsToIncludeCoordinateSystemTranslationInEffectViewTransform_s;

  return v5;
}

uint64_t __98__PVHostApplicationDelegateHandler_wantsToIncludeCoordinateSystemTranslationInEffectViewTransform__block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) wantsToIncludeCoordinateSystemTranslationInEffectViewTransform];
    wantsToIncludeCoordinateSystemTranslationInEffectViewTransform_s = result;
  }
  return result;
}

- (PVHostApplicationDelegate)hostApplicationDelegate
{
  return self->_hostApplicationDelegate;
}

- (void)setHostApplicationDelegate:(id)a3
{
}

- (BOOL)cacheDelegateResponses
{
  return self->_cacheDelegateResponses;
}

- (void)setCacheDelegateResponses:(BOOL)a3
{
  self->_cacheDelegateResponses = a3;
}

- (void).cxx_destruct
{
}

@end