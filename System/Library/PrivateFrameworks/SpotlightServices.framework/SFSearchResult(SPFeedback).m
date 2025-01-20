@interface SFSearchResult(SPFeedback)
- (id)objectForFeedback;
- (void)copyBasePropertiesOverToResult:()SPFeedback;
- (void)setFeedbackPropertiesOnResultCopy:()SPFeedback;
@end

@implementation SFSearchResult(SPFeedback)

- (void)setFeedbackPropertiesOnResultCopy:()SPFeedback
{
  id v14 = a3;
  [a1 copyBasePropertiesOverToResult:v14];
  v4 = [a1 compactCard];
  v5 = (void *)[v4 copyForFeedback];
  [v14 setCompactCard:v5];

  v6 = [a1 inlineCard];
  v7 = (void *)[v6 copyForFeedback];
  [v14 setInlineCard:v7];

  v8 = [a1 tophitCard];
  v9 = (void *)[v8 copyForFeedback];
  [v14 setTophitCard:v9];

  v10 = [a1 mapsData];
  uint64_t v11 = GEOUsageSearchFoundationFeedbackDataForMapsData();
  [v14 setMapsData:v11];

  v12 = [a1 sectionBundleIdentifier];
  LOBYTE(v11) = [v12 isEqualToString:@"com.apple.DocumentsApp"];

  if ((v11 & 1) == 0)
  {
    v13 = [a1 punchout];
    [v14 setPunchout:v13];
  }
}

- (id)objectForFeedback
{
  if (objectForFeedback_onceToken != -1) {
    dispatch_once(&objectForFeedback_onceToken, &__block_literal_global_45);
  }
  if (objectForFeedback_atxAppClass && (objc_msgSend(object, "isMemberOfClass:") & 1) != 0
    || objectForFeedback_atxResultClass && (objc_msgSend(object, "isMemberOfClass:") & 1) != 0
    || objectForFeedback_atxSuggestionResultClass && objc_msgSend(object, "isMemberOfClass:"))
  {
    id v2 = object;
  }
  else
  {
    uint64_t v4 = objc_getAssociatedObject(object, "_feedbackobject");
    if (v4)
    {
      id v2 = (id)v4;
      if (v4 == *MEMORY[0x1E4F1D260])
      {
        id v5 = object;

        id v2 = v5;
      }
    }
    else
    {
      id v2 = objc_alloc_init((Class)objc_opt_class());
      [object setFeedbackPropertiesOnResultCopy:v2];
      objc_setAssociatedObject(object, "_feedbackobject", v2, (void *)1);
      objc_setAssociatedObject(v2, "_feedbackobject", (id)*MEMORY[0x1E4F1D260], (void *)1);
    }
  }
  return v2;
}

- (void)copyBasePropertiesOverToResult:()SPFeedback
{
  id v29 = a3;
  uint64_t v4 = [a1 action];
  [v29 setAction:v4];

  id v5 = [a1 applicationBundleIdentifier];
  [v29 setApplicationBundleIdentifier:v5];

  objc_msgSend(v29, "setBlockId:", objc_msgSend(a1, "blockId"));
  v6 = [a1 calendarIdentifier];
  [v29 setCalendarIdentifier:v6];

  v7 = [a1 completedQuery];
  [v29 setCompletedQuery:v7];

  v8 = [a1 completion];
  [v29 setCompletion:v8];

  v9 = [a1 contactIdentifier];
  [v29 setContactIdentifier:v9];

  v10 = [a1 contentType];
  [v29 setContentType:v10];

  uint64_t v11 = [a1 correctedQuery];
  [v29 setCorrectedQuery:v11];

  v12 = [a1 descriptions];
  [v29 setDescriptions:v12];

  v13 = [a1 fbr];
  [v29 setFbr:v13];

  id v14 = [a1 footnote];
  [v29 setFootnote:v14];

  v15 = [a1 identifier];
  [v29 setIdentifier:v15];

  v16 = [a1 intendedQuery];
  [v29 setIntendedQuery:v16];

  objc_msgSend(v29, "setIsFuzzyMatch:", objc_msgSend(a1, "isFuzzyMatch"));
  objc_msgSend(v29, "setIsLocalApplicationResult:", objc_msgSend(a1, "isLocalApplicationResult"));
  objc_msgSend(v29, "setIsStaticCorrection:", objc_msgSend(a1, "isStaticCorrection"));
  v17 = [a1 localFeatures];
  [v29 setLocalFeatures:v17];

  objc_msgSend(v29, "setNoGoTakeover:", objc_msgSend(a1, "noGoTakeover"));
  objc_msgSend(v29, "setPreferTopPlatter:", objc_msgSend(a1, "preferTopPlatter"));
  objc_msgSend(v29, "setPubliclyIndexable:", objc_msgSend(a1, "publiclyIndexable"));
  objc_msgSend(v29, "setQueryId:", objc_msgSend(a1, "queryId"));
  [a1 rankingScore];
  objc_msgSend(v29, "setRankingScore:");
  v18 = [a1 resultBundleId];
  [v29 setResultBundleId:v18];

  v19 = [a1 resultType];
  [v29 setResultType:v19];

  v20 = [a1 secondaryTitle];
  [v29 setSecondaryTitle:v20];

  v21 = [a1 sectionBundleIdentifier];
  [v29 setSectionBundleIdentifier:v21];

  objc_msgSend(v29, "setShouldUseCompactDisplay:", objc_msgSend(a1, "shouldUseCompactDisplay"));
  v22 = [a1 title];
  [v29 setTitle:v22];

  objc_msgSend(v29, "setTopHit:", objc_msgSend(a1, "topHit"));
  objc_msgSend(v29, "setType:", objc_msgSend(a1, "type"));
  v23 = [a1 userInput];
  [v29 setUserInput:v23];

  objc_msgSend(v29, "setUsesCompactDisplay:", objc_msgSend(a1, "usesCompactDisplay"));
  objc_msgSend(v29, "setUsesTopHitDisplay:", objc_msgSend(a1, "usesTopHitDisplay"));
  objc_msgSend(v29, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(a1, "renderHorizontallyWithOtherResultsInCategory"));
  objc_msgSend(v29, "setContainsPersonalResult:", objc_msgSend(a1, "containsPersonalResult"));
  objc_msgSend(v29, "setDidRerankPersonalResult:", objc_msgSend(a1, "didRerankPersonalResult"));
  v24 = [a1 itemProviderDataTypes];
  [v29 setItemProviderDataTypes:v24];

  v25 = [a1 itemProviderFileTypes];
  [v29 setItemProviderFileTypes:v25];

  objc_msgSend(v29, "setCoreSpotlightIndexUsed:", objc_msgSend(a1, "coreSpotlightIndexUsed"));
  objc_msgSend(v29, "setCoreSpotlightIndexUsedReason:", objc_msgSend(a1, "coreSpotlightIndexUsedReason"));
  v26 = [a1 coreSpotlightRankingSignals];
  [v29 setCoreSpotlightRankingSignals:v26];

  v27 = [a1 indexOfSectionWhenRanked];
  [v29 setIndexOfSectionWhenRanked:v27];

  v28 = [a1 indexOfResultInSectionWhenRanked];
  [v29 setIndexOfResultInSectionWhenRanked:v28];

  objc_msgSend(v29, "setHasAppTopHitShortcut:", objc_msgSend(a1, "hasAppTopHitShortcut"));
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_serverFeatures]
    && [(id)objc_opt_class() instancesRespondToSelector:sel_setServerFeatures_])
  {
    objc_msgSend(v29, "performSelector:withObject:", sel_setServerFeatures_, objc_msgSend(a1, "performSelector:", sel_serverFeatures));
  }
}

@end