@interface ICAuthorHighlightsController
- (BOOL)allowsAnimations;
- (BOOL)coalesceAuthorHighlightUpdates;
- (BOOL)isAnimating;
- (BOOL)isPerformingHighlightUpdatesForTextStorage:(id)a3;
- (BOOL)rangeHasOrNeedsHighlights:(_NSRange)a3 inTextStorage:(id)a4;
- (BOOL)shouldAnimateInTextStorage:(id)a3;
- (CADisplayLink)highlightAnimationsDisplayLink;
- (ICAuthorHighlightsController)initWithNote:(id)a3;
- (ICAuthorHighlightsController)initWithNote:(id)a3 textLayoutManager:(id)a4;
- (ICNote)note;
- (ICTTTextEditGrouper)editGrouper;
- (ICTTTextStorage)invalidHighlightsTextStorage;
- (NSCache)editGroupsForTextStorageDocument;
- (NSDate)now;
- (NSMutableSet)textStorageDocumentsBeingUpdated;
- (NSMutableSet)textStorageDocumentsNeedingHighlightUpdates;
- (NSTextLayoutManager)textLayoutManager;
- (_NSRange)invalidHighlightsRange;
- (double)fadedMultiplier;
- (double)highlightedMultiplier;
- (id)attributesForHighlightingTextLineFragment:(id)a3 characterRange:(_NSRange)a4 defaultRenderingAttributes:(id)a5 effectiveRange:(_NSRange *)a6 textView:(id)a7;
- (id)editGroupsForTextStorage:(id)a3;
- (id)highlightColorForUserID:(id)a3;
- (id)highlightsAttributedStringForTextStorage:(id)a3;
- (void)dealloc;
- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4;
- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4 reverse:(BOOL)a5;
- (void)flashHighlightsForRange:(_NSRange)a3 withDuration:(id)a4 inTextStorage:(id)a5;
- (void)performHighlightUpdatesForRange:(_NSRange)a3 inTextStorage:(id)a4 updates:(id)a5;
- (void)removeHighlightAnimationsForRange:(_NSRange)a3 inTextStorage:(id)a4;
- (void)removeHighlightValuesForRange:(_NSRange)a3 inTextStorage:(id)a4;
- (void)setAllowsAnimations:(BOOL)a3;
- (void)setAttachmentHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6;
- (void)setCheckmarkHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6;
- (void)setCoalesceAuthorHighlightUpdates:(BOOL)a3;
- (void)setFadedMultiplier:(double)a3;
- (void)setHighlightAnimation:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5;
- (void)setHighlightAttributesForHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6 editGroups:(id)a7;
- (void)setHighlightValue:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5;
- (void)setHighlightedMultiplier:(double)a3;
- (void)setInvalidHighlightsRange:(_NSRange)a3;
- (void)setInvalidHighlightsTextStorage:(id)a3;
- (void)setNow:(id)a3;
- (void)setTextHighlightValue:(double)a3 highlightColor:(id)a4 blendsTextColor:(BOOL)a5 forRange:(_NSRange)a6 inTextStorage:(id)a7;
- (void)textStorageDidProcessEndEditing:(id)a3;
- (void)updateDerivedConfiguration;
- (void)updateHighlightAnimationsIfNeeded;
- (void)updateHighlightAttributesForRange:(_NSRange)a3 inTextStorage:(id)a4;
@end

@implementation ICAuthorHighlightsController

void __72__ICAuthorHighlightsController_rangeHasOrNeedsHighlights_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v19 = a2;
  v8 = [*(id *)(a1 + 32) attributesAtIndex:a3 effectiveRange:0];
  v9 = [v19 allKeys];
  char v10 = [v9 containsObject:*MEMORY[0x1E4F83550]];
  char v11 = [v9 containsObject:*MEMORY[0x1E4F83548]];
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  v13 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
  if (v13)
  {
    v14 = [v19 objectForKeyedSubscript:v12];
    v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83588]];
    BOOL v16 = v14 != v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  char v17 = [v9 containsObject:*MEMORY[0x1E4FB06C0]];
  char v18 = [v9 containsObject:*MEMORY[0x1E4F83558]];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10 | v11 | v16 | v17 | v18 | [v9 containsObject:*MEMORY[0x1E4F83200]];
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)removeHighlightValuesForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:a4];
  objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F83550], location, length);
}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v29 = a2;
  v7 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F83588]];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  }
  char v10 = v9;

  objc_opt_class();
  char v11 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];
  uint64_t v12 = ICDynamicCast();

  v13 = (void *)ICEmphasisColorTypeForTag((int)[v12 intValue]);
  if (v13)
  {
    v14 = ICColorForEmphasisColorType(v13);

    if ([*(id *)(a1 + 32) isForTextKit2])
    {
      v15 = 0;
    }
    else
    {
      v15 = [v14 colorWithAlphaComponent:0.2];
    }
    char v10 = v14;
  }
  else
  {
    v15 = 0;
  }
  BOOL v16 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F83558]];
  uint64_t v17 = [v16 color];
  char v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v10;
  }
  id v20 = v19;

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v20, a3, a4);
  if (v15) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06C0], v15, a3, a4);
  }
  uint64_t v21 = [v16 underlineStyle];
  v22 = *(void **)(a1 + 40);
  uint64_t v23 = *MEMORY[0x1E4FB0808];
  v24 = [NSNumber numberWithInteger:v21];
  objc_msgSend(v22, "addAttribute:value:range:", v23, v24, a3, a4);

  uint64_t v25 = [v16 underlineColor];
  v26 = (void *)v25;
  if (v25) {
    v27 = (void *)v25;
  }
  else {
    v27 = v20;
  }
  id v28 = v27;

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB0800], v28, a3, a4);
}

void __80__ICAuthorHighlightsController_updateHighlightAttributesForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4F83550];
  id v8 = a2;
  id v29 = [v8 objectForKeyedSubscript:v7];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83548]];

  [v29 value];
  double v11 = v10;
  uint64_t v12 = [v9 color];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v29 color];
  }
  v15 = v14;

  if (v9)
  {
    BOOL v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v9 startDate];
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;

    [v9 duration];
    double v21 = v19 / v20;
    if (v21 < 0.0) {
      double v21 = 0.0;
    }
    double v22 = fmin(v21, 1.0);
    [v9 fromValue];
    double v24 = v23;
    [v9 toValue];
    double v26 = v25 * v22 + v24 * (1.0 - v22);
    int v27 = [v9 isAboveExistingHighlights];
    double v28 = -0.0;
    if (v27) {
      double v28 = v11;
    }
    double v11 = v28 + v26;
    if (v22 < 1.0 && ([*(id *)(a1 + 40) shouldAnimateInTextStorage:*(void *)(a1 + 48)] & 1) != 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else {
      objc_msgSend(*(id *)(a1 + 40), "removeHighlightAnimationsForRange:inTextStorage:", a3, a4, *(void *)(a1 + 48));
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setHighlightAttributesForHighlightValue:highlightColor:forRange:inTextStorage:editGroups:", v15, a3, a4, *(void *)(a1 + 48), *(void *)(a1 + 56), v11);
}

- (void)setHighlightAttributesForHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6 editGroups:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v14];
  uint64_t v17 = *MEMORY[0x1E4F83568];
  double v18 = [NSNumber numberWithDouble:a3];
  objc_msgSend(v16, "addAttribute:value:range:", v17, v18, location, length);

  -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", 0, location, length, v14, a3);
  double v19 = 0.0;
  if (!v13) {
    double v19 = a3;
  }
  -[ICAuthorHighlightsController setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:](self, "setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:", 0, location, length, v14, v19);
  range2[0] = location;
  NSUInteger v20 = location;
  NSUInteger v21 = length;
  -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", 0, 0, v20, length, v14, a3);
  if (a3 > 0.0)
  {
    if (v13)
    {
      -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", v13, range2[0], length, v14, a3);
      -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", v13, 0, range2[0], length, v14, a3);
    }
    else
    {
      v30 = v16;
      id v31 = v15;
      long long v35 = 0u;
      long long v36 = 0u;
      *(_OWORD *)&range2[1] = 0u;
      long long v34 = 0u;
      id obj = v15;
      uint64_t v22 = [obj countByEnumeratingWithState:&range2[1] objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(obj);
            }
            double v26 = *(void **)(range2[2] + 8 * i);
            v39.NSUInteger location = [v26 range];
            v40.NSUInteger location = range2[0];
            v40.NSUInteger length = v21;
            NSRange v27 = NSIntersectionRange(v39, v40);
            if (v27.length)
            {
              double v28 = [v26 userID];
              id v29 = [(ICAuthorHighlightsController *)self highlightColorForUserID:v28];

              -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", v29, v27.location, v27.length, v14, a3);
              -[ICAuthorHighlightsController setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:](self, "setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:", v29, v27.location, v27.length, v14, a3);
              -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", v29, 1, v27.location, v27.length, v14, a3);
            }
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&range2[1] objects:v37 count:16];
        }
        while (v23);
      }

      id v15 = v31;
      id v13 = 0;
      BOOL v16 = v30;
    }
  }
}

- (void)setTextHighlightValue:(double)a3 highlightColor:(id)a4 blendsTextColor:(BOOL)a5 forRange:(_NSRange)a6 inTextStorage:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v10 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a7;
  [(ICAuthorHighlightsController *)self fadedMultiplier];
  double v16 = a3 * v15 + 1.0;
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  [(ICAuthorHighlightsController *)self highlightedMultiplier];
  double v19 = v18 * a3;
  if (v19 < 0.0) {
    double v19 = 0.0;
  }
  NSUInteger v20 = objc_msgSend(v13, "colorWithAlphaComponent:", fmin(v19, 1.0));
  NSUInteger v21 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v14];
  uint64_t v22 = v21;
  if (v17 >= 1.0)
  {
    if (v20)
    {
      id v33 = v13;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_2;
      v48[3] = &unk_1E5FDB078;
      id v32 = v14;
      id v49 = v14;
      id v34 = v49;
      objc_msgSend(v49, "ic_componentRangesSeparatedByPredicate:inRange:", v48, location, length);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v45;
        uint64_t v27 = *MEMORY[0x1E4FB06C0];
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v45 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = [*(id *)(*((void *)&v44 + 1) + 8 * i) rangeValue];
            uint64_t v31 = v29;
            if (v10)
            {
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_3;
              v39[3] = &unk_1E5FDB0A0;
              id v40 = v20;
              id v41 = v34;
              double v43 = a3;
              id v42 = v22;
              objc_msgSend(v42, "enumerateAttributesInRange:options:usingBlock:", v30, v31, 0, v39);
            }
            else
            {
              objc_msgSend(v22, "addAttribute:value:range:", v27, v20, v30, v29);
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v25);
      }

      id v14 = v32;
      id v13 = v33;
      uint64_t v23 = &v49;
    }
    else
    {
      objc_msgSend(v21, "removeAttribute:range:", *MEMORY[0x1E4FB06C0], location, length);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_4;
      v36[3] = &unk_1E5FD9010;
      uint64_t v23 = &v37;
      id v37 = v14;
      id v38 = v22;
      objc_msgSend(v38, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v36);
    }
  }
  else
  {
    objc_msgSend(v21, "removeAttribute:range:", *MEMORY[0x1E4FB06C0], location, length);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke;
    v50[3] = &unk_1E5FD90D8;
    v51[1] = *(id *)&a3;
    v51[2] = *(id *)&v17;
    uint64_t v23 = v51;
    v51[0] = v22;
    objc_msgSend(v51[0], "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v50);
  }
}

- (void)setCheckmarkHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a4;
  id v12 = a6;
  [(ICAuthorHighlightsController *)self fadedMultiplier];
  double v14 = a3 * v13 + 1.0;
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  double v15 = fmin(v14, 1.0);
  double v16 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v12];
  objc_msgSend(v16, "removeAttribute:range:", *MEMORY[0x1E4F83560], location, length);
  uint64_t v17 = *MEMORY[0x1E4F83220];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__ICAuthorHighlightsController_setCheckmarkHighlightValue_highlightColor_forRange_inTextStorage___block_invoke;
  v21[3] = &unk_1E5FDB050;
  v21[4] = self;
  id v22 = v11;
  double v25 = a3;
  double v26 = v15;
  id v23 = v12;
  id v24 = v16;
  id v18 = v16;
  id v19 = v12;
  id v20 = v11;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v17, location, length, 0, v21);
}

- (double)fadedMultiplier
{
  return self->_fadedMultiplier;
}

- (id)highlightsAttributedStringForTextStorage:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = ICDynamicCast();
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_opt_class();
    uint64_t v7 = [v3 highlightsAttributedString];
    ICCheckedDynamicCast();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)setAttachmentHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a6;
  id v12 = a4;
  [(ICAuthorHighlightsController *)self fadedMultiplier];
  double v14 = a3 * v13 + 1.0;
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  double v15 = fmin(v14, 1.0);
  if (a3 >= 0.0) {
    double v16 = a3;
  }
  else {
    double v16 = 0.0;
  }
  uint64_t v17 = objc_msgSend(v12, "colorWithAlphaComponent:", fmin(v16, 1.0));

  uint64_t v18 = *MEMORY[0x1E4FB06B8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__ICAuthorHighlightsController_setAttachmentHighlightValue_highlightColor_forRange_inTextStorage___block_invoke;
  v21[3] = &unk_1E5FDB028;
  id v22 = v17;
  id v23 = v11;
  double v24 = v15;
  double v25 = a3;
  id v19 = v11;
  id v20 = v17;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v18, location, length, 0, v21);
}

- (double)highlightedMultiplier
{
  return self->_highlightedMultiplier;
}

void __98__ICAuthorHighlightsController_setAttachmentHighlightValue_highlightColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_opt_class();
  v5 = ICDynamicCast();
  id v6 = v5;
  if (v5)
  {
    [v5 setForegroundAlpha:*(double *)(a1 + 48)];
    [v6 setHighlightColor:*(void *)(a1 + 32)];
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([*(id *)(a1 + 40) textLayoutManagers],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 count],
          v7,
          v8))
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v9 = [*(id *)(a1 + 40) textLayoutManagers];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v31 = v4;
        uint64_t v33 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v39 != v33) {
              objc_enumerationMutation(v9);
            }
            double v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            double v14 = [v6 viewIdentifier];
            double v15 = [v13 existingAttachmentViewForIdentifier:v14];

            objc_opt_class();
            double v16 = ICDynamicCast();
            uint64_t v17 = v16;
            if (v16)
            {
              [v16 setForegroundAlpha:*(double *)(a1 + 48)];
              [v17 setHighlightColor:*(void *)(a1 + 32)];
            }
            objc_opt_class();
            uint64_t v18 = ICDynamicCast();
            if (v18)
            {
              id v19 = [*(id *)(a1 + 40) attributesAtIndex:a3 effectiveRange:0];
              id v20 = (void *)[v19 mutableCopy];

              NSUInteger v21 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
              [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F83568]];

              id v22 = (void *)[v20 copy];
              [v18 updateHighlightsWithAttributes:v22];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v11);
        id v4 = v31;
      }
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = [*(id *)(a1 + 40) layoutManagers];
      uint64_t v23 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        id v25 = v4;
        uint64_t v26 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v35 != v26) {
              objc_enumerationMutation(v9);
            }
            double v28 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            objc_opt_class();
            uint64_t v29 = [v28 viewForTextAttachmentNoCreate:v6];
            uint64_t v30 = ICDynamicCast();

            [v30 setForegroundAlpha:*(double *)(a1 + 48)];
            [v30 setHighlightColor:*(void *)(a1 + 32)];
          }
          uint64_t v24 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v24);
        id v4 = v25;
      }
    }
  }
}

void __97__ICAuthorHighlightsController_setCheckmarkHighlightValue_highlightColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v22 = a2;
  uint64_t v7 = [v22 todo];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) note];
    id v9 = [v22 todo];
    uint64_t v10 = [v9 uuid];
    uint64_t v11 = [v10 UUIDString];
    id v12 = [v8 userIDForChecklistItemWithIdentifier:v11];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 32) highlightColorForUserID:v12];
    }
    else
    {
      id v13 = *(id *)(a1 + 40);
    }
    double v14 = v13;
    double v15 = *(double *)(a1 + 64);
    if (v15 < 0.0) {
      double v15 = 0.0;
    }
    double v16 = objc_msgSend(v13, "colorWithAlphaComponent:", fmin(v15, 1.0));

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      uint64_t v17 = [*(id *)(a1 + 48) attribute:*MEMORY[0x1E4FB0738] atIndex:a3 effectiveRange:0];
      uint64_t v18 = [(ICCheckmarkAuthorHighlightValueAttribute *)v17 textLists];
      id v19 = [v18 firstObject];

      objc_opt_class();
      id v20 = [v19 markerTextAttachment];
      NSUInteger v21 = ICCheckedDynamicCast();

      [v21 setForegroundAlpha:*(double *)(a1 + 72)];
      [v21 setHighlightColor:v16];
    }
    else
    {
      uint64_t v17 = objc_alloc_init(ICCheckmarkAuthorHighlightValueAttribute);
      [(ICCheckmarkAuthorHighlightValueAttribute *)v17 setForegroundAlpha:*(double *)(a1 + 72)];
      [(ICCheckmarkAuthorHighlightValueAttribute *)v17 setHighlightColor:v16];
      objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", *MEMORY[0x1E4F83560], v17, a3, a4);
    }
  }
}

- (ICAuthorHighlightsController)initWithNote:(id)a3 textLayoutManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICAuthorHighlightsController;
  id v9 = [(ICAuthorHighlightsController *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_textLayoutManager, a4);
    v10->_allowsAnimations = 1;
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel_textStorageDidProcessEndEditing_ name:@"ICTTTextStorageDidProcessEndEditingNotification" object:0];

    [(ICAuthorHighlightsController *)v10 updateDerivedConfiguration];
  }

  return v10;
}

- (void)updateHighlightAttributesForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(ICAuthorHighlightsController *)self now];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] now];
  }
  uint64_t v11 = v10;

  id v12 = [(ICAuthorHighlightsController *)self editGroupsForTextStorage:v7];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  objc_super v13 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v7];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__ICAuthorHighlightsController_updateHighlightAttributesForRange_inTextStorage___block_invoke;
  v22[3] = &unk_1E5FDB000;
  id v14 = v11;
  id v23 = v14;
  uint64_t v24 = self;
  id v15 = v7;
  id v25 = v15;
  uint64_t v27 = &v28;
  id v16 = v12;
  id v26 = v16;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v22);
  if (*((unsigned char *)v29 + 24))
  {
    uint64_t v17 = [(ICAuthorHighlightsController *)self textStorageDocumentsNeedingHighlightUpdates];
    uint64_t v18 = [v15 document];
    [v17 addObject:v18];

    id v19 = [(ICAuthorHighlightsController *)self highlightAnimationsDisplayLink];
    [v19 setPaused:0];
LABEL_9:

    goto LABEL_10;
  }
  if (location == objc_msgSend(v15, "ic_range") && length == v20)
  {
    id v19 = [(ICAuthorHighlightsController *)self textStorageDocumentsNeedingHighlightUpdates];
    NSUInteger v21 = [v15 document];
    [v19 removeObject:v21];

    goto LABEL_9;
  }
LABEL_10:

  _Block_object_dispose(&v28, 8);
}

- (NSMutableSet)textStorageDocumentsNeedingHighlightUpdates
{
  textStorageDocumentsNeedingHighlightUpdates = self->_textStorageDocumentsNeedingHighlightUpdates;
  if (textStorageDocumentsNeedingHighlightUpdates)
  {
    id v4 = textStorageDocumentsNeedingHighlightUpdates;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
  }
  v5 = self->_textStorageDocumentsNeedingHighlightUpdates;
  self->_textStorageDocumentsNeedingHighlightUpdates = v4;

  id v6 = self->_textStorageDocumentsNeedingHighlightUpdates;
  return v6;
}

- (NSDate)now
{
  return self->_now;
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];

  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (![(ICAuthorHighlightsController *)self isPerformingHighlightUpdatesForTextStorage:v8])
  {
    id v6 = [(ICAuthorHighlightsController *)self editGroupsForTextStorageDocument];
    id v7 = [v8 document];
    [v6 removeObjectForKey:v7];
  }
}

- (id)editGroupsForTextStorage:(id)a3
{
  id v4 = a3;
  v5 = [(ICAuthorHighlightsController *)self editGroupsForTextStorageDocument];
  id v6 = [v4 document];
  id v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v8 = [(ICAuthorHighlightsController *)self editGrouper];
    uint64_t v9 = objc_msgSend(v4, "ic_range");
    uint64_t v11 = objc_msgSend(v4, "editsInRange:", v9, v10);
    id v7 = [v8 groupedEditsForEdits:v11 inAttributedString:v4];

    id v12 = [(ICAuthorHighlightsController *)self editGroupsForTextStorageDocument];
    objc_super v13 = [v4 document];
    [v12 setObject:v7 forKey:v13];
  }
  return v7;
}

- (NSCache)editGroupsForTextStorageDocument
{
  editGroupsForTextStorageDocument = self->_editGroupsForTextStorageDocument;
  if (editGroupsForTextStorageDocument) {
    id v4 = editGroupsForTextStorageDocument;
  }
  else {
    id v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
  }
  v5 = self->_editGroupsForTextStorageDocument;
  self->_editGroupsForTextStorageDocument = v4;

  id v6 = self->_editGroupsForTextStorageDocument;
  return v6;
}

- (void)performHighlightUpdatesForRange:(_NSRange)a3 inTextStorage:(id)a4 updates:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = (void (**)(id, NSUInteger, NSUInteger))a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (!v9) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textStorage) != nil)", "-[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:]", 1, 0, @"Expected non-nil value for '%s'", "textStorage");
  }
  if ([v9 length] && length)
  {
    if (v10)
    {
      [(ICAuthorHighlightsController *)self updateDerivedConfiguration];
LABEL_9:
      uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v29 = @"ICAuthorHighlightsControllerTextStorageKey";
      v30[0] = v9;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      [v11 postNotificationName:@"ICAuthorHighlightsControllerWillPerformHighlightUpdatesNotification" object:self userInfo:v12];

      objc_super v13 = [(ICAuthorHighlightsController *)self textStorageDocumentsBeingUpdated];
      id v14 = [v9 document];
      [v13 addObject:v14];

      objc_opt_class();
      id v15 = ICDynamicCast();
      [v15 beginPreventEditingUpdates];

      [v9 beginTemporaryAttributeEditing];
      if (v10) {
        v10[2](v10, location, length);
      }
      v33.NSUInteger location = objc_msgSend(v9, "ic_range");
      v33.NSUInteger length = v16;
      v31.NSUInteger location = location;
      v31.NSUInteger length = length;
      NSRange v17 = NSIntersectionRange(v31, v33);
      -[ICAuthorHighlightsController updateHighlightAttributesForRange:inTextStorage:](self, "updateHighlightAttributesForRange:inTextStorage:", v17.location, v17.length, v9);
      [v9 endTemporaryAttributeEditing];
      objc_opt_class();
      uint64_t v18 = ICDynamicCast();
      [v18 endPreventEditingUpdates];

      id v19 = [(ICAuthorHighlightsController *)self textStorageDocumentsBeingUpdated];
      uint64_t v20 = [v9 document];
      [v19 removeObject:v20];

      NSUInteger v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v27 = @"ICAuthorHighlightsControllerTextStorageKey";
      id v28 = v9;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v21 postNotificationName:@"ICAuthorHighlightsControllerDidPerformHighlightUpdatesNotification" object:self userInfo:v22];

      goto LABEL_20;
    }
    if ([(ICAuthorHighlightsController *)self isPerformingHighlightUpdatesForTextStorage:v9])
    {
      goto LABEL_20;
    }
    [(ICAuthorHighlightsController *)self updateDerivedConfiguration];
    if (!-[ICAuthorHighlightsController rangeHasOrNeedsHighlights:inTextStorage:](self, "rangeHasOrNeedsHighlights:inTextStorage:", location, length, v9))goto LABEL_20; {
    if (![(ICAuthorHighlightsController *)self coalesceAuthorHighlightUpdates])
    }
      goto LABEL_9;
    uint64_t v23 = [(ICAuthorHighlightsController *)self invalidHighlightsTextStorage];
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      id v25 = [(ICAuthorHighlightsController *)self invalidHighlightsTextStorage];

      if (v25 != v9) {
        goto LABEL_9;
      }
    }
    [(ICAuthorHighlightsController *)self setInvalidHighlightsTextStorage:v9];
    if ([(ICAuthorHighlightsController *)self invalidHighlightsRange] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32.NSUInteger location = [(ICAuthorHighlightsController *)self invalidHighlightsRange];
      v34.NSUInteger location = location;
      v34.NSUInteger length = length;
      NSRange v26 = NSUnionRange(v32, v34);
      NSUInteger location = v26.location;
      NSUInteger length = v26.length;
    }
    -[ICAuthorHighlightsController setInvalidHighlightsRange:](self, "setInvalidHighlightsRange:", location, length);
  }
LABEL_20:
}

- (BOOL)isPerformingHighlightUpdatesForTextStorage:(id)a3
{
  id v4 = a3;
  v5 = [(ICAuthorHighlightsController *)self textStorageDocumentsBeingUpdated];
  id v6 = [v4 document];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (NSMutableSet)textStorageDocumentsBeingUpdated
{
  textStorageDocumentsBeingUpdated = self->_textStorageDocumentsBeingUpdated;
  if (textStorageDocumentsBeingUpdated)
  {
    id v4 = textStorageDocumentsBeingUpdated;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
  }
  v5 = self->_textStorageDocumentsBeingUpdated;
  self->_textStorageDocumentsBeingUpdated = v4;

  id v6 = self->_textStorageDocumentsBeingUpdated;
  return v6;
}

- (void)updateDerivedConfiguration
{
  [(ICAuthorHighlightsController *)self setFadedMultiplier:0.6];
  id v6 = [(ICAuthorHighlightsController *)self note];
  id v3 = [v6 textStorage];
  int v4 = [v3 hasAnyTextViewWithDarkAppearance];
  double v5 = 0.2;
  if (v4) {
    double v5 = 0.25;
  }
  [(ICAuthorHighlightsController *)self setHighlightedMultiplier:v5];
}

- (ICNote)note
{
  return self->_note;
}

- (void)setHighlightedMultiplier:(double)a3
{
  self->_highlightedMultiplier = a3;
}

- (void)setFadedMultiplier:(double)a3
{
  self->_fadedMultiplier = a3;
}

- (BOOL)rangeHasOrNeedsHighlights:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v19.NSUInteger location = objc_msgSend(v7, "ic_range");
  v20.NSUInteger location = location;
  v20.NSUInteger length = length;
  NSRange v8 = NSIntersectionRange(v19, v20);
  uint64_t v15 = 0;
  NSUInteger v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v9 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__ICAuthorHighlightsController_rangeHasOrNeedsHighlights_inTextStorage___block_invoke;
  v12[3] = &unk_1E5FDAF68;
  id v10 = v7;
  id v13 = v10;
  id v14 = &v15;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", v8.location, v8.length, 0, v12);
  LOBYTE(length) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return length;
}

- (ICTTTextEditGrouper)editGrouper
{
  editGrouper = self->_editGrouper;
  if (!editGrouper)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F83500]);
    double v5 = [(ICAuthorHighlightsController *)self note];
    id v6 = (ICTTTextEditGrouper *)[v4 initWithNote:v5];
    id v7 = self->_editGrouper;
    self->_editGrouper = v6;

    [(ICTTTextEditGrouper *)self->_editGrouper setJoinsWhitespaceAndNewlineGaps:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4F834F8]);
    [(ICTTTextEditGrouper *)self->_editGrouper setFilter:v8];

    id v9 = [(ICTTTextEditGrouper *)self->_editGrouper filter];
    [v9 setAllowsMissingUsers:0];

    editGrouper = self->_editGrouper;
  }
  return editGrouper;
}

- (ICAuthorHighlightsController)initWithNote:(id)a3
{
  return [(ICAuthorHighlightsController *)self initWithNote:a3 textLayoutManager:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAuthorHighlightsController;
  [(ICAuthorHighlightsController *)&v4 dealloc];
}

- (id)highlightColorForUserID:(id)a3
{
  id v4 = a3;
  double v5 = [(ICAuthorHighlightsController *)self note];
  id v6 = [v5 collaborationColorManager];
  id v7 = [(ICAuthorHighlightsController *)self note];
  id v8 = [v6 highlightColorForUserID:v4 note:v7];

  return v8;
}

- (void)setHighlightValue:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  [(ICAuthorHighlightsController *)self updateDerivedConfiguration];
  v20.NSUInteger location = objc_msgSend(v10, "ic_range");
  v21.NSUInteger location = location;
  v21.NSUInteger length = length;
  NSRange v11 = NSIntersectionRange(v20, v21);
  id v12 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v10];

  uint64_t v13 = *MEMORY[0x1E4F83550];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__ICAuthorHighlightsController_setHighlightValue_forRange_inTextStorage___block_invoke;
  v16[3] = &unk_1E5FDAEA0;
  id v17 = v9;
  id v18 = v12;
  NSRange v19 = v11;
  id v14 = v12;
  id v15 = v9;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v13, v11.location, v11.length, 0x100000, v16);
}

void __73__ICAuthorHighlightsController_setHighlightValue_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_alloc_init(ICAuthorHighlightValueAttribute);
  id v4 = [*(id *)(a1 + 32) value];
  if (v4)
  {
    double v5 = [*(id *)(a1 + 32) value];
    [v5 floatValue];
    [(ICAuthorHighlightValueAttribute *)v3 setValue:v6];
  }
  else
  {
    [v8 value];
    -[ICAuthorHighlightValueAttribute setValue:](v3, "setValue:");
  }

  id v7 = [*(id *)(a1 + 32) color];
  [(ICAuthorHighlightValueAttribute *)v3 setColor:v7];

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4F83550], v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (BOOL)isAnimating
{
  v2 = [(ICAuthorHighlightsController *)self textStorageDocumentsNeedingHighlightUpdates];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldAnimateInTextStorage:(id)a3
{
  id v4 = a3;
  if ([(ICAuthorHighlightsController *)self allowsAnimations])
  {
    double v5 = [(ICAuthorHighlightsController *)self now];
    if (v5)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = [v4 textViews];
      BOOL v6 = [v7 count] != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setHighlightAnimation:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if ([(ICAuthorHighlightsController *)self shouldAnimateInTextStorage:v10]
    || ([v9 isRemovedOnCompletion] & 1) == 0)
  {
    -[ICAuthorHighlightsController removeHighlightAnimationsForRange:inTextStorage:](self, "removeHighlightAnimationsForRange:inTextStorage:", location, length, v10);
    [(ICAuthorHighlightsController *)self updateDerivedConfiguration];
    NSRange v11 = [(ICAuthorHighlightsController *)self now];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1C9C8] now];
    }
    id v14 = v13;

    v27.NSUInteger location = objc_msgSend(v10, "ic_range");
    v28.NSUInteger location = location;
    v28.NSUInteger length = length;
    NSRange v15 = NSIntersectionRange(v27, v28);
    NSUInteger v16 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v10];
    uint64_t v17 = *MEMORY[0x1E4F83550];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__ICAuthorHighlightsController_setHighlightAnimation_forRange_inTextStorage___block_invoke;
    v21[3] = &unk_1E5FDAEC8;
    id v22 = v14;
    id v23 = v9;
    id v24 = v16;
    id v25 = self;
    id v18 = v10;
    id v26 = v18;
    id v19 = v16;
    id v20 = v14;
    objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v17, v15.location, v15.length, 0x100000, v21);
    if (![(ICAuthorHighlightsController *)self shouldAnimateInTextStorage:v18]) {
      -[ICAuthorHighlightsController removeHighlightAnimationsForRange:inTextStorage:](self, "removeHighlightAnimationsForRange:inTextStorage:", v15.location, v15.length, v18);
    }
  }
}

void __77__ICAuthorHighlightsController_setHighlightAnimation_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v21 = a2;
  id v7 = [[ICAuthorHighlightAnimationAttribute alloc] initWithStartDate:*(void *)(a1 + 32)];
  id v8 = [*(id *)(a1 + 40) duration];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) duration];
    [v9 floatValue];
    [(ICAuthorHighlightAnimationAttribute *)v7 setDuration:v10];
  }
  else
  {
    [(ICAuthorHighlightAnimationAttribute *)v7 setDuration:0.25];
  }

  NSRange v11 = [*(id *)(a1 + 40) fromValue];
  if (v11)
  {
    id v12 = [*(id *)(a1 + 40) fromValue];
    [v12 floatValue];
    [(ICAuthorHighlightAnimationAttribute *)v7 setFromValue:v13];
  }
  else
  {
    [v21 value];
    -[ICAuthorHighlightAnimationAttribute setFromValue:](v7, "setFromValue:");
  }

  id v14 = [*(id *)(a1 + 40) toValue];
  [v14 floatValue];
  [(ICAuthorHighlightAnimationAttribute *)v7 setToValue:v15];

  NSUInteger v16 = [*(id *)(a1 + 40) color];
  [(ICAuthorHighlightAnimationAttribute *)v7 setColor:v16];

  -[ICAuthorHighlightAnimationAttribute setAboveExistingHighlights:](v7, "setAboveExistingHighlights:", [*(id *)(a1 + 40) isAboveExistingHighlights]);
  -[ICAuthorHighlightAnimationAttribute setRemovedOnCompletion:](v7, "setRemovedOnCompletion:", [*(id *)(a1 + 40) isRemovedOnCompletion]);
  [(ICAuthorHighlightAnimationAttribute *)v7 fromValue];
  double v18 = v17;
  [(ICAuthorHighlightAnimationAttribute *)v7 toValue];
  if (vabdd_f64(v18, v19) >= 0.00999999978)
  {
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4F83548], v7, a3, a4);
    if ([(ICAuthorHighlightAnimationAttribute *)v7 isRemovedOnCompletion])
    {
      [(ICAuthorHighlightAnimationAttribute *)v7 duration];
      if (v20 <= 0.0) {
        objc_msgSend(*(id *)(a1 + 56), "removeHighlightAnimationsForRange:inTextStorage:", a3, a4, *(void *)(a1 + 64));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E4F83550], a3, a4);
    }
  }
}

- (void)removeHighlightAnimationsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v15.NSUInteger location = objc_msgSend(v7, "ic_range");
  v16.NSUInteger location = location;
  v16.NSUInteger length = length;
  NSRange v8 = NSIntersectionRange(v15, v16);
  id v9 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v7];

  float v10 = (void *)MEMORY[0x1E4F83548];
  uint64_t v11 = *MEMORY[0x1E4F83548];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke;
  v13[3] = &unk_1E5FDAF18;
  id v14 = v9;
  id v12 = v9;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v11, v8.location, v8.length, 0x100000, v13);
  objc_msgSend(v12, "removeAttribute:range:", *v10, v8.location, v8.length);
}

void __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  NSRange v8 = v7;
  if (v7 && ([v7 isRemovedOnCompletion] & 1) == 0)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *MEMORY[0x1E4F83550];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke_2;
    v11[3] = &unk_1E5FDAEF0;
    id v12 = v8;
    id v13 = *(id *)(a1 + 32);
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v11);
  }
}

void __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  id v7 = objc_alloc_init(ICAuthorHighlightValueAttribute);
  if ([*(id *)(a1 + 32) isAboveExistingHighlights])
  {
    [v13 value];
    double v9 = v8;
    [*(id *)(a1 + 32) toValue];
    double v11 = v9 + v10;
  }
  else
  {
    [*(id *)(a1 + 32) toValue];
  }
  [(ICAuthorHighlightValueAttribute *)v7 setValue:v11];
  id v12 = [*(id *)(a1 + 32) color];
  [(ICAuthorHighlightValueAttribute *)v7 setColor:v12];

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4F83550], v7, a3, a4);
}

- (void)flashHighlightsForRange:(_NSRange)a3 withDuration:(id)a4 inTextStorage:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  if ([(ICAuthorHighlightsController *)self shouldAnimateInTextStorage:v10])
  {
    [(ICAuthorHighlightsController *)self updateDerivedConfiguration];
    v18.NSUInteger location = objc_msgSend(v10, "ic_range");
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    NSRange v11 = NSIntersectionRange(v18, v19);
    id v12 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v10];
    uint64_t v13 = *MEMORY[0x1E4F83550];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__ICAuthorHighlightsController_flashHighlightsForRange_withDuration_inTextStorage___block_invoke;
    v14[3] = &unk_1E5FDAF40;
    id v15 = v9;
    NSRange v16 = self;
    id v17 = v10;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, v11.location, v11.length, 0, v14);
  }
}

void __83__ICAuthorHighlightsController_flashHighlightsForRange_withDuration_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v19 = a2;
  id v7 = objc_alloc_init(ICAuthorHighlightAnimation);
  double v8 = v7;
  if (*(void *)(a1 + 32))
  {
    -[ICAuthorHighlightAnimation setDuration:](v7, "setDuration:");
  }
  else
  {
    id v9 = [NSNumber numberWithDouble:2.0];
    [(ICAuthorHighlightAnimation *)v8 setDuration:v9];
  }
  [v19 value];
  double v11 = v10;
  id v12 = NSNumber;
  [v19 value];
  double v14 = -1.0;
  if (v11 <= 0.0) {
    double v14 = 1.0;
  }
  id v15 = [v12 numberWithDouble:v13 + v14];
  [(ICAuthorHighlightAnimation *)v8 setFromValue:v15];

  NSRange v16 = NSNumber;
  [v19 value];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [(ICAuthorHighlightAnimation *)v8 setToValue:v17];

  NSRange v18 = [v19 color];
  [(ICAuthorHighlightAnimation *)v8 setColor:v18];

  [(ICAuthorHighlightAnimation *)v8 setRemovedOnCompletion:1];
  objc_msgSend(*(id *)(a1 + 40), "setHighlightAnimation:forRange:inTextStorage:", v8, a3, a4, *(void *)(a1 + 48));
}

- (void)setCoalesceAuthorHighlightUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAuthorHighlightsController setCoalesceAuthorHighlightUpdates:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (self->_coalesceAuthorHighlightUpdates != v3)
  {
    self->_coalesceAuthorHighlightUpdates = v3;
    if (!v3
      && [(ICAuthorHighlightsController *)self invalidHighlightsRange] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(ICAuthorHighlightsController *)self invalidHighlightsRange];
      if (v5)
      {
        BOOL v6 = [(ICAuthorHighlightsController *)self invalidHighlightsTextStorage];

        if (v6)
        {
          uint64_t v7 = [(ICAuthorHighlightsController *)self invalidHighlightsRange];
          uint64_t v9 = v8;
          double v10 = [(ICAuthorHighlightsController *)self invalidHighlightsTextStorage];
          -[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:](self, "performHighlightUpdatesForRange:inTextStorage:updates:", v7, v9, v10, 0);
        }
      }
    }
    -[ICAuthorHighlightsController setInvalidHighlightsRange:](self, "setInvalidHighlightsRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(ICAuthorHighlightsController *)self setInvalidHighlightsTextStorage:0];
  }
}

- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a4;
  v12.NSUInteger location = objc_msgSend(v10, "ic_range");
  v13.NSUInteger location = location;
  v13.NSUInteger length = length;
  NSRange v7 = NSIntersectionRange(v12, v13);
  uint64_t v8 = [(ICAuthorHighlightsController *)self editGroupsForTextStorageDocument];
  uint64_t v9 = [v10 document];
  [v8 removeObjectForKey:v9];

  -[ICAuthorHighlightsController extendHighlightsForRange:inTextStorage:reverse:](self, "extendHighlightsForRange:inTextStorage:reverse:", v7.location, v7.length, v10, 0);
  -[ICAuthorHighlightsController extendHighlightsForRange:inTextStorage:reverse:](self, "extendHighlightsForRange:inTextStorage:reverse:", v7.location, v7.length, v10, 1);
}

- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = v9;
  if (v5) {
    uint64_t v11 = length;
  }
  else {
    uint64_t v11 = -1;
  }
  NSRange v12 = [v9 attributesAtIndex:location + v11 effectiveRange:0];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__26;
  void v22[4] = __Block_byref_object_dispose__26;
  id v23 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F83550]];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__26;
  v20[4] = __Block_byref_object_dispose__26;
  id v21 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F83548]];
  NSRange v13 = [(ICAuthorHighlightsController *)self highlightsAttributedStringForTextStorage:v10];
  if (v5) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__ICAuthorHighlightsController_extendHighlightsForRange_inTextStorage_reverse___block_invoke;
  v16[3] = &unk_1E5FDAF90;
  NSRange v18 = v22;
  id v15 = v13;
  id v17 = v15;
  id v19 = v20;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", location, length, v14, v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __79__ICAuthorHighlightsController_extendHighlightsForRange_inTextStorage_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4F83550];
  id v18 = v7;
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F83550]];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = v9;
  if (!v9) {
    uint64_t v11 = *(void **)(v10 + 40);
  }
  objc_storeStrong((id *)(v10 + 40), v11);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    NSRange v12 = [v18 objectForKeyedSubscript:v8];

    if (!v12) {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3, a4);
    }
  }
  NSRange v13 = (void *)MEMORY[0x1E4F83548];
  uint64_t v14 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F83548]];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  NSRange v16 = v14;
  if (!v14) {
    NSRange v16 = *(void **)(v15 + 40);
  }
  objc_storeStrong((id *)(v15 + 40), v16);

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v17 = [v18 objectForKeyedSubscript:*v13];

    if (!v17) {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v13, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3, a4);
    }
  }
}

- (CADisplayLink)highlightAnimationsDisplayLink
{
  highlightAnimationsDisplayLink = self->_highlightAnimationsDisplayLink;
  if (!highlightAnimationsDisplayLink)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    BOOL v5 = [v4 displayLinkWithTarget:self selector:sel_updateHighlightAnimationsIfNeeded];
    BOOL v6 = self->_highlightAnimationsDisplayLink;
    self->_highlightAnimationsDisplayLink = v5;

    id v7 = self->_highlightAnimationsDisplayLink;
    uint64_t v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    highlightAnimationsDisplayLink = self->_highlightAnimationsDisplayLink;
  }
  return highlightAnimationsDisplayLink;
}

- (void)updateHighlightAnimationsIfNeeded
{
  BOOL v3 = [(ICAuthorHighlightsController *)self textStorageDocumentsNeedingHighlightUpdates];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    performBlockOnMainThreadAndWait();
  }
  else
  {
    id v5 = [(ICAuthorHighlightsController *)self highlightAnimationsDisplayLink];
    [v5 setPaused:1];
  }
}

void __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v2 = [*(id *)(a1 + 32) textStorageDocumentsNeedingHighlightUpdates];
  BOOL v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        objc_opt_class();
        uint64_t v8 = ICDynamicCast();
        id v9 = [v8 mergeableString];
        uint64_t v10 = [v9 delegate];
        uint64_t v11 = ICDynamicCast();

        if (v11)
        {
          uint64_t v21 = 0;
          id v22 = &v21;
          uint64_t v23 = 0x3010000000;
          id v24 = &unk_1B0BF84BB;
          long long v25 = xmmword_1B0B987A0;
          NSRange v12 = [*(id *)(a1 + 32) highlightsAttributedStringForTextStorage:v11];
          uint64_t v13 = *MEMORY[0x1E4F83548];
          uint64_t v14 = objc_msgSend(v11, "ic_range");
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke_2;
          v20[3] = &unk_1E5FDAFB8;
          v20[4] = &v21;
          objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, v14, v15, 0, v20);
          uint64_t v16 = v22[5];
          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "performHighlightUpdatesForRange:inTextStorage:updates:", v22[4], v16, v11, &__block_literal_global_31);
          }
          else
          {
            id v18 = [*(id *)(a1 + 32) textStorageDocumentsNeedingHighlightUpdates];
            id v19 = [v11 document];
            [v18 removeObject:v19];
          }
          _Block_object_dispose(&v21, 8);
        }
        else
        {
          id v17 = [*(id *)(a1 + 32) textStorageDocumentsNeedingHighlightUpdates];
          [v17 removeObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }
}

void __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger length)
{
  v7.id location = (NSUInteger)a2;
  if (v7.location)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v7.NSUInteger length = *(void *)(v8 + 40);
    if (v7.length)
    {
      id location = (id)v7.location;
      v7.id location = *(void *)(v8 + 32);
      v11.id location = a3;
      v11.NSUInteger length = length;
      NSRange v7 = NSUnionRange(v7, v11);
      a3 = v7.location;
      v7.id location = (NSUInteger)location;
      NSUInteger length = v7.length;
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(v8 + 32) = a3;
    *(void *)(v8 + 40) = length;
  }
}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x1E4F83588];
  id v8 = a2;
  id v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  }
  NSRange v12 = v11;

  uint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83558]];

  uint64_t v14 = [v13 color];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = v12;
  }
  id v17 = v16;

  id v18 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  id v19 = objc_msgSend(v17, "ic_colorBlendedWithColor:fraction:", v18, fabs(*(double *)(a1 + 40)));

  id v27 = [v19 colorWithAlphaComponent:*(double *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v27, a3, a4);
  uint64_t v20 = [v13 underlineStyle];
  uint64_t v21 = *(void **)(a1 + 32);
  uint64_t v22 = *MEMORY[0x1E4FB0808];
  uint64_t v23 = [NSNumber numberWithInteger:v20];
  objc_msgSend(v21, "addAttribute:value:range:", v22, v23, a3, a4);

  id v24 = [v13 underlineColor];
  if (v24) {
    long long v25 = v24;
  }
  else {
    long long v25 = v27;
  }
  id v26 = v25;

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0800], v26, a3, a4);
}

uint64_t __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  char v7 = [v6 characterIsMember:a3];

  if (v7)
  {
    char isKindOfClass = 1;
  }
  else if (a3 == 65532)
  {
    id v9 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB06B8] atIndex:a2 effectiveRange:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v42 = a2;
  char v7 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F83588]];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  }
  uint64_t v10 = v9;

  id v11 = *(id *)(a1 + 32);
  objc_opt_class();
  NSRange v12 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];
  uint64_t v13 = ICDynamicCast();

  uint64_t v14 = (void *)ICEmphasisColorTypeForTag((int)[v13 intValue]);
  if (v14)
  {
    uint64_t v15 = ICColorForEmphasisColorType(v14);

    if (([*(id *)(a1 + 40) isForTextKit2] & 1) == 0)
    {
      uint64_t v16 = [v15 colorWithAlphaComponent:0.2];
      uint64_t v17 = objc_msgSend(v16, "ic_colorBlendedWithColor:fraction:", v11, *(double *)(a1 + 56));

      id v11 = (id)v17;
    }
  }
  else
  {
    uint64_t v15 = v10;
  }
  id v18 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F83558]];
  long long v40 = v13;
  id v19 = v11;
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  if ([v18 type] == 1)
  {
    uint64_t v22 = objc_msgSend(*(id *)(a1 + 40), "textViews", v40);
    uint64_t v23 = [v22 anyObject];
    id v24 = [v23 tintColor];
  }
  else
  {
    id v24 = 0;
  }
  if (v24) {
    long long v25 = v24;
  }
  else {
    long long v25 = v15;
  }
  id v26 = v25;

  id v27 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
  long long v28 = objc_msgSend(v26, "ic_colorBlendedWithColor:fraction:", v27, *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v28, v20, a4);
  long long v29 = v19;
  if (v19) {
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB06C0], v19, v20, v21);
  }
  uint64_t v30 = objc_msgSend(v18, "underlineStyle", v40);
  uint64_t v31 = *(void **)(a1 + 48);
  uint64_t v32 = *MEMORY[0x1E4FB0808];
  NSRange v33 = [NSNumber numberWithInteger:v30];
  objc_msgSend(v31, "addAttribute:value:range:", v32, v33, v20, v21);

  uint64_t v34 = [v18 underlineColor];
  long long v35 = (void *)v34;
  if (v34) {
    long long v36 = (void *)v34;
  }
  else {
    long long v36 = v28;
  }
  id v37 = v36;

  long long v38 = [MEMORY[0x1E4FB1618] clearColor];
  long long v39 = objc_msgSend(v37, "ic_colorBlendedWithColor:fraction:", v38, *(double *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB0800], v39, v20, v21);
}

- (id)attributesForHighlightingTextLineFragment:(id)a3 characterRange:(_NSRange)a4 defaultRenderingAttributes:(id)a5 effectiveRange:(_NSRange *)a6 textView:(id)a7
{
  NSUInteger location = a4.location;
  v73[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  id v14 = a3;
  objc_opt_class();
  uint64_t v15 = [v14 textLayoutFragment];

  uint64_t v16 = [v15 textElement];
  uint64_t v17 = ICDynamicCast();

  v70 = v13;
  if (!v17
    || ([v17 locationForCharacterIndex:location dataSourceLocationsOnly:1 actualRange:0],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        (uint64_t v19 = v18) == 0)
    && ([v17 locationForCharacterIndex:location dataSourceLocationsOnly:0 actualRange:0],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v33 = v12;
    goto LABEL_29;
  }
  v71.NSUInteger location = 0;
  v71.NSUInteger length = 0;
  uint64_t v20 = [(ICAuthorHighlightsController *)self note];
  uint64_t v21 = [v20 textContentStorage];

  uint64_t v22 = [v21 documentRange];
  uint64_t v23 = [v22 location];
  v69 = (void *)v19;
  NSUInteger v24 = [v21 offsetFromLocation:v23 toLocation:v19];

  long long v25 = [v21 textStorage];
  id v26 = [v25 highlightsAttributedString];
  id v27 = [v26 attributesAtIndex:v24 effectiveRange:&v71];

  v28.NSUInteger location = objc_msgSend(v13, "ic_markedTextRange");
  if (v28.location == 0x7FFFFFFFFFFFFFFFLL
    || (v29 = v28.location, NSUInteger length = v28.length, !NSIntersectionRange(v28, v71).location))
  {
    BOOL v32 = 0;
  }
  else
  {
    if (v71.location <= v24) {
      NSUInteger v31 = v24;
    }
    else {
      NSUInteger v31 = v71.location;
    }
    if (v29 <= v31)
    {
      if (v29 + length <= v31)
      {
        BOOL v32 = v29 == v71.location && length == v71.length;
      }
      else
      {
        v71.NSUInteger location = v31;
        v71.NSUInteger length = v29 + length - v31;
        BOOL v32 = 1;
      }
    }
    else
    {
      BOOL v32 = 0;
      v71.NSUInteger location = v31;
      v71.NSUInteger length = v29 - v31;
    }
  }
  uint64_t v34 = [v21 documentRange];
  long long v35 = [v34 location];
  long long v36 = [v21 locationFromLocation:v35 withOffset:v71.location];

  NSUInteger v37 = [v17 rangeForLocation:v36 allowsTrailingEdge:1];
  NSUInteger v38 = v71.length;
  a6->NSUInteger location = v37;
  a6->NSUInteger length = v38;
  long long v39 = (void *)[v12 mutableCopy];
  if (!v18)
  {
    objc_opt_class();
    uint64_t v46 = *MEMORY[0x1E4FB0700];
    long long v47 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    v48 = ICCheckedDynamicCast();

    objc_opt_class();
    id v49 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F83568]];
    v50 = ICCheckedDynamicCast();
    [v50 floatValue];
    double v52 = v51;

    if (fabs(v52) >= 0.00999999978)
    {
      uint64_t v53 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4FB0720]];

      if (!v53)
      {
        [v68 fadedMultiplier];
        double v55 = v52 * v54 + 1.0;
        if (v55 < 0.0) {
          double v55 = 0.0;
        }
        v56 = objc_msgSend(v48, "colorWithAlphaComponent:", fmin(v55, 1.0));
        [v39 setObject:v56 forKeyedSubscript:v46];
      }
    }
    goto LABEL_27;
  }
  uint64_t v40 = *MEMORY[0x1E4FB06C0];
  long long v41 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FB06C0]];
  [v39 setObject:v41 forKeyedSubscript:v40];

  if (v32)
  {
    uint64_t v42 = *MEMORY[0x1E4FB0700];
    double v43 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    uint64_t v72 = v42;
    uint64_t v44 = [v43 colorWithAlphaComponent:0.8];
    v73[0] = v44;
    long long v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];

    [v39 addEntriesFromDictionary:v45];
  }
  else
  {
    v57 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4FB0720]];

    if (v57) {
      goto LABEL_24;
    }
    uint64_t v58 = *MEMORY[0x1E4FB0700];
    double v43 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    [v39 setObject:v43 forKeyedSubscript:v58];
  }

LABEL_24:
  uint64_t v59 = *MEMORY[0x1E4FB0808];
  uint64_t v60 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FB0808]];
  if (!v60) {
    goto LABEL_28;
  }
  v61 = (void *)v60;
  v62 = [v27 objectForKeyedSubscript:v59];
  char v63 = [v62 isEqual:&unk_1F09A42E0];

  if (v63) {
    goto LABEL_28;
  }
  v64 = [v27 objectForKeyedSubscript:v59];
  [v39 setObject:v64 forKeyedSubscript:v59];

  uint64_t v65 = *MEMORY[0x1E4FB0800];
  v48 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FB0800]];
  [v39 setObject:v48 forKeyedSubscript:v65];
LABEL_27:

LABEL_28:
  id v33 = (id)[v39 copy];

LABEL_29:
  return v33;
}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (BOOL)allowsAnimations
{
  return self->_allowsAnimations;
}

- (void)setAllowsAnimations:(BOOL)a3
{
  self->_allowsAnimations = a3;
}

- (BOOL)coalesceAuthorHighlightUpdates
{
  return self->_coalesceAuthorHighlightUpdates;
}

- (void)setNow:(id)a3
{
}

- (_NSRange)invalidHighlightsRange
{
  NSUInteger length = self->_invalidHighlightsRange.length;
  NSUInteger location = self->_invalidHighlightsRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInvalidHighlightsRange:(_NSRange)a3
{
  self->_invalidHighlightsRange = a3;
}

- (ICTTTextStorage)invalidHighlightsTextStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidHighlightsTextStorage);
  return (ICTTTextStorage *)WeakRetained;
}

- (void)setInvalidHighlightsTextStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_invalidHighlightsTextStorage);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_editGroupsForTextStorageDocument, 0);
  objc_storeStrong((id *)&self->_editGrouper, 0);
  objc_storeStrong((id *)&self->_highlightAnimationsDisplayLink, 0);
  objc_storeStrong((id *)&self->_textStorageDocumentsNeedingHighlightUpdates, 0);
  objc_storeStrong((id *)&self->_textStorageDocumentsBeingUpdated, 0);
}

@end