@interface _WKTargetedElementInfo(ScribbleUtilities)
- (BOOL)safari_coversWebView:()ScribbleUtilities;
- (id)safari_selectorsForStyleSheetRules;
- (id)safari_uniqueSelectorsIncludingShadowHosts;
- (uint64_t)safari_isOutOfFlow;
- (uint64_t)safari_isProbablyFullPageModalOverlay:()ScribbleUtilities;
- (uint64_t)safari_prefersImageAnalysisTextWhenCheckingSimilarity;
- (void)safari_imageAnalysisTextWithCompletion:()ScribbleUtilities;
- (void)safari_renderedTextForCheckingSimilarityWithCompletion:()ScribbleUtilities;
@end

@implementation _WKTargetedElementInfo(ScribbleUtilities)

- (id)safari_selectorsForStyleSheetRules
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 selectorsIncludingShadowHosts];
  if ([v1 count] == 1)
  {
    v2 = [v1 lastObject];
    v3 = [v2 firstObject];

    if ([v3 length])
    {
      v6[0] = v3;
      v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    else
    {
      v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)safari_coversWebView:()ScribbleUtilities
{
  [a3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [a1 boundsInWebView];
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRect v15 = CGRectIntersection(v14, v16);
  return targetedElementRectsAreSimilar(v5, v7, v9, v11, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
}

- (uint64_t)safari_isProbablyFullPageModalOverlay:()ScribbleUtilities
{
  id v4 = a3;
  if (objc_msgSend(a1, "safari_isOutOfFlow")
    && ([a1 renderedText],
        CGFloat v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
    uint64_t v7 = objc_msgSend(a1, "safari_coversWebView:", v4);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_isOutOfFlow
{
  unint64_t v1 = [a1 positionType];
  return (v1 < 5) & (0x1Cu >> v1);
}

- (uint64_t)safari_prefersImageAnalysisTextWhenCheckingSimilarity
{
  v2 = [a1 renderedText];
  if (objc_msgSend(v2, "safari_isLongEnoughToCheckSimilarity")) {
    uint64_t v3 = [a1 hasLargeReplacedDescendant];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (void)safari_renderedTextForCheckingSimilarityWithCompletion:()ScribbleUtilities
{
  id v4 = a3;
  CGFloat v5 = [a1 renderedText];
  if (objc_msgSend(a1, "safari_prefersImageAnalysisTextWhenCheckingSimilarity"))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __100___WKTargetedElementInfo_ScribbleUtilities__safari_renderedTextForCheckingSimilarityWithCompletion___block_invoke;
    v6[3] = &unk_1E5E43B48;
    id v8 = v4;
    id v7 = v5;
    objc_msgSend(a1, "safari_imageAnalysisTextWithCompletion:", v6);
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, v5);
  }
}

- (void)safari_imageAnalysisTextWithCompletion:()ScribbleUtilities
{
  id v4 = a3;
  [a1 boundsInWebView];
  if (v6 < 30.0 || v5 < 30.0)
  {
    v4[2](v4, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84___WKTargetedElementInfo_ScribbleUtilities__safari_imageAnalysisTextWithCompletion___block_invoke;
    v8[3] = &unk_1E5E43B98;
    CGFloat v9 = v4;
    [a1 takeSnapshotWithCompletionHandler:v8];
  }
}

- (id)safari_uniqueSelectorsIncludingShadowHosts
{
  unint64_t v1 = [a1 selectorsIncludingShadowHosts];
  v2 = objc_msgSend(v1, "safari_mapObjectsUsingBlock:", &__block_literal_global_28);

  return v2;
}

@end