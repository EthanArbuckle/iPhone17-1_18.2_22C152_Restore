@interface SSTopHitNominationManager
+ (BOOL)_bundleExcludedForTopHit:(id)a3;
+ (BOOL)_freshnessCheck:(id)a3;
+ (BOOL)_hideUnderShowMoreCheck:(id)a3;
+ (BOOL)_imporantPropertyMatch:(id)a3;
+ (BOOL)_isLikelihoodSpecialCase:(id)a3;
+ (BOOL)_keywordMatchCheck:(id)a3;
+ (BOOL)_likelihoodCheck:(id)a3;
+ (BOOL)_minimumKeywordMatch:(id)a3;
+ (BOOL)_needImportantPropertyMatch:(id)a3;
+ (BOOL)_needQUIntentCheck:(id)a3;
+ (BOOL)_nominateServerTopHitCandidate:(id)a3;
+ (BOOL)_recentEngagementOvertakeCheck:(id)a3;
+ (BOOL)_safariCheck:(id)a3;
+ (BOOL)_settingsCheck:(id)a3;
+ (BOOL)_spellCorrectedAppPass:(id)a3;
+ (BOOL)_stricterFreshnessTopicalityEngagementCheck:(id)a3;
+ (BOOL)_topicalityCheck:(id)a3;
+ (BOOL)isTopHit:(id)a3;
+ (BOOL)isTopHitCandidate:(id)a3;
+ (BOOL)passLikelihoodForTopHitCandidate:(id)a3;
+ (float)_likelihoodThresholdForBundle:(id)a3;
+ (float)getTopHitThreshold:(id)a3;
+ (id)_dropSection:(id)a3 targetSection:(id)a4 reasonString:(id)a5;
+ (id)postProcessSectionsBasedOnTopHitSection:(id)a3 withTopHitSection:(id)a4;
+ (void)_setImportantPropertiesPrefixMatched:(id)a3 value:(unint64_t)a4;
+ (void)_setImportantPropertiesWordMatched:(id)a3 value:(unint64_t)a4;
+ (void)clearTopHit:(id)a3;
+ (void)clearTopHitCandidate:(id)a3;
+ (void)finalizeTopHitSection:(id)a3;
+ (void)finalizeTopHitsInSections:(id)a3 withTopHitSection:(id)a4;
+ (void)nominateTopHitCandidate:(id)a3;
+ (void)setTopHitCandidate:(id)a3;
+ (void)setTopHitMustBe:(id)a3;
+ (void)setTopHitShouldBe:(id)a3;
+ (void)topHitCandidacyThresholdingForAppSection:(id)a3;
@end

@implementation SSTopHitNominationManager

+ (float)getTopHitThreshold:(id)a3
{
  id v3 = a3;
  v4 = [(id)thresholds objectForKey:v3];

  if (v4)
  {
    v5 = [(id)thresholds objectForKey:v3];
    [v5 floatValue];
    float v7 = v6;
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

+ (void)setTopHitShouldBe:(id)a3
{
}

+ (void)setTopHitMustBe:(id)a3
{
}

+ (void)clearTopHit:(id)a3
{
}

+ (BOOL)isTopHit:(id)a3
{
  return [a3 topHit] != 0;
}

+ (void)setTopHitCandidate:(id)a3
{
  id v5 = a3;
  id v3 = [v5 rankingItem];

  if (v3)
  {
    v4 = [v5 rankingItem];
    [v4 setIsLocalTopHitCandidate:1];
  }
}

+ (void)clearTopHitCandidate:(id)a3
{
  id v5 = a3;
  id v3 = [v5 rankingItem];

  if (v3)
  {
    v4 = [v5 rankingItem];
    [v4 setIsLocalTopHitCandidate:0];
  }
}

+ (BOOL)isTopHitCandidate:(id)a3
{
  id v3 = a3;
  v4 = [v3 rankingItem];

  if (v4)
  {
    id v5 = [v3 rankingItem];
    LOBYTE(v4) = [v5 isLocalTopHitCandidate];
  }
  return (char)v4;
}

+ (BOOL)passLikelihoodForTopHitCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 rankingItem];

  if (v5)
  {
    float v6 = [v4 rankingItem];
    [v6 likelihood];
    double v8 = v7;
    [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"];
    BOOL v10 = v8 > v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (void)nominateTopHitCandidate:(id)a3
{
  id v10 = a3;
  if ((objc_msgSend(a1, "_bundleExcludedForTopHit:") & 1) == 0)
  {
    id v4 = [v10 rankingItem];

    if (v4)
    {
      [a1 clearTopHitCandidate:v10];
      if (([a1 _recentEngagementOvertakeCheck:v10] & 1) != 0
        || [a1 _isLikelihoodSpecialCase:v10])
      {
        goto LABEL_5;
      }
      if ([a1 _likelihoodCheck:v10]
        && [a1 _topicalityCheck:v10]
        && [a1 _freshnessCheck:v10]
        && [a1 _hideUnderShowMoreCheck:v10])
      {
        if (+[SSQueryIntentManager isServerResult:v10])
        {
          if (![a1 _nominateServerTopHitCandidate:v10]) {
            goto LABEL_6;
          }
LABEL_5:
          [a1 setTopHitCandidate:v10];
          goto LABEL_6;
        }
        if (![a1 _spellCorrectedAppPass:v10]
          || ![a1 _minimumKeywordMatch:v10]
          || ![a1 _safariCheck:v10]
          || [a1 _needImportantPropertyMatch:v10]
          && ![a1 _imporantPropertyMatch:v10]
          || ![a1 _stricterFreshnessTopicalityEngagementCheck:v10])
        {
          goto LABEL_6;
        }
        if (![a1 _needQUIntentCheck:v10]) {
          goto LABEL_5;
        }
        id v5 = [v10 sectionBundleIdentifier];
        +[SSTopHitNominationManager _likelihoodThresholdForBundle:v5];
        float v7 = v6;
        double v8 = [v10 rankingItem];
        if ([v8 matchedQUIntent])
        {
          if (![a1 _imporantPropertyMatch:v10]
            || ([v8 likelihood], v9 <= v7))
          {
LABEL_30:

            goto LABEL_6;
          }
        }
        else if ([v8 quIntentAvailable] {
               && ![a1 _keywordMatchCheck:v10])
        }
        {
          goto LABEL_30;
        }

        goto LABEL_5;
      }
    }
  }
LABEL_6:
}

+ (BOOL)_nominateServerTopHitCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sectionBundleIdentifier];
  id v5 = [v3 rankingItem];

  +[SSTopHitNominationManager _likelihoodThresholdForBundle:v4];
  float v7 = v6;
  BOOL v9 = 1;
  if ([v4 isEqualToString:@"com.apple.parsec.dictionary"])
  {
    [v5 likelihood];
    if (v8 <= v7) {
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (void)finalizeTopHitSection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "results", 0);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setUsesTopHitDisplay:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)finalizeTopHitsInSections:(id)a3 withTopHitSection:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v12 bundleIdentifier];
        int v14 = [v13 isEqual:@"com.apple.spotlight.tophits"];

        if (v14) {
          [a1 finalizeTopHitSection:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  [a1 finalizeTopHitSection:v7];
}

+ (id)postProcessSectionsBasedOnTopHitSection:(id)a3 withTopHitSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7
    && ([v7 results],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v10))
  {
    long long v11 = [v8 results];
    v12 = [v11 firstObject];

    uint64_t v13 = [v12 sectionBundleIdentifier];
    int v14 = [v13 isEqualToString:@"com.apple.MobileAddressBook"];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v12;
        long long v16 = [v15 rankingItem];

        if (v16)
        {
          long long v17 = [v15 rankingItem];
          [v17 topicalityScore];
          if (v18 >= 0.96)
          {
            [v17 engagementScore];
            double v20 = v19;
            [a1 getTopHitThreshold:@"HIGH_ENGAGEMENT_THRESHOLD"];
            if (v20 >= v21)
            {
              v22 = [v17 recentSimilarIntentEngagementDates];
              uint64_t v23 = [v22 count];

              if (v23)
              {
                uint64_t v24 = [a1 _dropSection:v6 targetSection:@"com.apple.parsec.web_images" reasonString:@"Highly Engaged Contact Top Hit"];

                id v6 = (id)v24;
              }
            }
          }
        }
      }
    }
    id v25 = v6;
  }
  else
  {
    id v25 = v6;
  }

  return v25;
}

+ (id)_dropSection:(id)a3 targetSection:(id)a4 reasonString:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  v12 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v23;
LABEL_3:
    uint64_t v16 = 0;
    uint64_t v17 = v14 + v13;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v10);
      }
      double v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v16), "bundleIdentifier", (void)v22);
      char v19 = [v18 isEqual:v8];

      if (v19) {
        break;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        uint64_t v14 = v17;
        if (v13) {
          goto LABEL_3;
        }
        v12 = v10;
        goto LABEL_14;
      }
    }

    if (v14 + v16 < 0) {
      goto LABEL_15;
    }
    double v20 = SSGeneralLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_1BDB2A000, v20, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] postProcessSectionsBasedOnTopHitSection Rule: dropping %@ due to %@.", buf, 0x16u);
    }

    v12 = (void *)[v10 mutableCopy];
    [v12 removeObjectAtIndex:v14 + v16];
  }
LABEL_14:

  id v10 = v12;
LABEL_15:

  return v10;
}

+ (BOOL)_bundleExcludedForTopHit:(id)a3
{
  id v3 = [a3 sectionBundleIdentifier];
  if (_bundleExcludedForTopHit__onceToken != -1) {
    dispatch_once(&_bundleExcludedForTopHit__onceToken, &__block_literal_global_40);
  }
  char v4 = [(id)_bundleExcludedForTopHit___bundlesExcluded containsObject:v3];

  return v4;
}

void __54__SSTopHitNominationManager__bundleExcludedForTopHit___block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.searchd.syndicatedLinks";
  v4[1] = @"com.apple.searchd.syndicatedPhotos";
  v4[2] = @"com.apple.searchd.syndicatedPhotos.MobileSMS";
  v4[3] = @"com.apple.searchd.syndicatedPhotos.mobilenotes";
  v4[4] = @"com.apple.searchd.syndicatedPhotos.mobileslideshow";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)_bundleExcludedForTopHit___bundlesExcluded;
  _bundleExcludedForTopHit___bundlesExcluded = v2;
}

+ (float)_likelihoodThresholdForBundle:(id)a3
{
  id v4 = a3;
  if (_likelihoodThresholdForBundle__onceToken != -1) {
    dispatch_once(&_likelihoodThresholdForBundle__onceToken, &__block_literal_global_155);
  }
  uint64_t v5 = [(id)_likelihoodThresholdForBundle___bundleThresholds objectForKeyedSubscript:v4];
  [v5 floatValue];
  float v7 = v6;
  if (v6 == 0.0)
  {
    [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"];
    float v7 = v8;
  }

  return v7;
}

void __59__SSTopHitNominationManager__likelihoodThresholdForBundle___block_invoke(double a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"com.apple.mobilemail";
  LODWORD(a1) = *(_DWORD *)"ff&?";
  v1 = [MEMORY[0x1E4F28ED0] numberWithFloat:a1];
  v7[0] = v1;
  v6[1] = @"com.apple.MobileSMS";
  LODWORD(v2) = 1060320051;
  id v3 = [MEMORY[0x1E4F28ED0] numberWithFloat:v2];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  uint64_t v5 = (void *)_likelihoodThresholdForBundle___bundleThresholds;
  _likelihoodThresholdForBundle___bundleThresholds = v4;
}

+ (BOOL)_needQUIntentCheck:(id)a3
{
  uint64_t v3 = _needQUIntentCheck__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_needQUIntentCheck__onceToken, &__block_literal_global_159_0);
  }
  uint64_t v5 = (void *)_needQUIntentCheck___quBundlesToCheck;
  float v6 = [v4 sectionBundleIdentifier];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __48__SSTopHitNominationManager__needQUIntentCheck___block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.mobileslideshow";
  v4[1] = @"com.apple.mobilenotes";
  v4[2] = @"com.apple.DocumentsApp";
  v4[3] = @"com.apple.mobilemail";
  v4[4] = @"com.apple.MobileSMS";
  v4[5] = @"com.apple.mobilecal";
  void v4[6] = @"com.apple.reminders";
  v4[7] = @"com.apple.mobilesafari";
  v4[8] = @"com.apple.spotlight.events";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_needQUIntentCheck___quBundlesToCheck;
  _needQUIntentCheck___quBundlesToCheck = v2;
}

+ (BOOL)_needImportantPropertyMatch:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    unint64_t v6 = [v5 bundleIDType];

    id v4 = (void *)((v6 >> 5) & 1);
  }

  return (char)v4;
}

+ (BOOL)_spellCorrectedAppPass:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    int v6 = [v5 spellCorrectedApp];

    if (v6)
    {
      char v7 = [v3 rankingItem];
      LOBYTE(v4) = [v7 exactMatchedLaunchString];
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

+ (BOOL)_settingsCheck:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    if (([v5 bundleIDType] & 0x10) != 0)
    {
      char v7 = [v3 rankingItem];
      int v8 = [v7 settingsPreferencePriority];

      if (v8 < 3)
      {
        BOOL v6 = 1;
        goto LABEL_9;
      }
      uint64_t v5 = [v3 rankingItem];
      id v9 = [v5 recentSimilarIntentEngagementDates];
      BOOL v6 = [v9 count] != 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

+ (BOOL)_safariCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (!v5) {
    goto LABEL_21;
  }
  BOOL v6 = [v4 rankingItem];
  char v7 = [v6 bundleIDType];

  if ((v7 & 0x80) == 0)
  {
LABEL_3:
    BOOL v8 = 1;
    goto LABEL_22;
  }
  id v9 = [v4 resultBundleId];
  if ([v9 isEqualToString:@"com.apple.safari.userTypedURL"])
  {
    id v10 = [v4 rankingItem];
    [v10 topicalityScore];
    if (v11 >= 0.99)
    {
      float v21 = [v4 rankingItem];
      [v21 keywordMatchScore];
      double v23 = v22;

      if (v23 >= 0.99) {
        goto LABEL_3;
      }
      goto LABEL_8;
    }
  }
LABEL_8:
  v12 = [v4 rankingItem];
  [v12 keywordMatchScore];
  float v14 = v13;

  if (v14 < 2.2204e-16) {
    goto LABEL_21;
  }
  uint64_t v15 = [v4 rankingItem];
  if ([v15 wasEngagedInSpotlight])
  {
    uint64_t v16 = [v4 rankingItem];
    [v16 engagementScore];
    double v18 = v17;
    [a1 getTopHitThreshold:@"MIN_ENGAGEMENT_THRESHOLD"];
    double v20 = v19;

    if (v18 >= v20) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  long long v24 = [v4 contentType];
  if ([v24 isEqualToString:@"com.apple.safari.bookmark"])
  {
    long long v25 = [v4 rankingItem];
    [v25 keywordMatchScore];
    float v27 = v26;
    [a1 getTopHitThreshold:@"SAFARI_BOOKMARK_KEYWORDMATCH_THRESHOLD"];
    float v29 = v28;

    if (v27 >= v29) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  v30 = [v4 rankingItem];
  [v30 mostRecentUseInMinutes];
  float v32 = v31;

  if (v32 <= 0.0
    || ([a1 getTopHitThreshold:@"IN_APP_USAGE_RECENCY_DAYS"], (float)(v33 * 1440.0) < v32))
  {
LABEL_21:
    BOOL v8 = 0;
    goto LABEL_22;
  }
  v35 = [v4 rankingItem];
  [v35 safariMatchScoreTitle];
  float v37 = v36;
  [a1 getTopHitThreshold:@"SAFARI_KEYWORDMATCH_THRESHOLD_TITLE"];
  if (v37 >= v38)
  {
    BOOL v8 = 1;
  }
  else
  {
    v39 = [v4 rankingItem];
    [v39 safariMatchScoreContentURL];
    float v41 = v40;
    [a1 getTopHitThreshold:@"SAFARI_KEYWORDMATCH_THRESHOLD_URL"];
    BOOL v8 = v41 >= v42;
  }
LABEL_22:

  return v8;
}

+ (BOOL)_minimumKeywordMatch:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    if (([v5 bundleIDType] & 0x100000) == 0)
    {
      BOOL v6 = [v3 rankingItem];
      if (([v6 bundleIDType] & 0x80) == 0)
      {
        char v7 = [v3 rankingItem];
        if (([v7 bundleIDType] & 2) == 0)
        {
          BOOL v8 = [v3 rankingItem];
          if (([v8 bundleIDType] & 0x20) == 0)
          {
            id v9 = [v3 rankingItem];
            __int16 v10 = [v9 bundleIDType];

            if ((v10 & 0x800) == 0)
            {
              LOBYTE(v4) = 1;
              goto LABEL_13;
            }
LABEL_12:
            double v11 = [v3 rankingItem];
            [v11 keywordMatchScore];
            LOBYTE(v4) = v12 > 0.0;

            goto LABEL_13;
          }
        }
      }
    }
    goto LABEL_12;
  }
LABEL_13:

  return (char)v4;
}

+ (BOOL)_keywordMatchCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (v5)
  {
    BOOL v6 = [v4 rankingItem];
    [v6 keywordMatchScore];
    float v8 = v7;
    [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_KEYWORDMATCH_THRESHOLD"];
    BOOL v10 = v8 >= v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_imporantPropertyMatch:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v5))
    {
      BOOL v6 = 1;
    }
    else
    {
      float v7 = [v3 rankingItem];
      BOOL v6 = -[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v7) != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_isLikelihoodSpecialCase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (v5)
  {
    BOOL v6 = [v4 rankingItem];
    [v6 likelihood];
    double v8 = v7;
    [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_SPECIAL_CASE_THRESHOLD"];
    BOOL v10 = v8 >= v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_likelihoodCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (v5)
  {
    BOOL v6 = [v4 rankingItem];
    [v6 likelihood];
    double v8 = v7;
    [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"];
    BOOL v10 = v8 >= v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_topicalityCheck:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    [v5 finalTopicality];
    LOBYTE(v4) = v6 > 0.0;
  }
  return (char)v4;
}

+ (BOOL)_freshnessCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (v5)
  {
    double v6 = [v4 rankingItem];
    char v7 = [v6 bundleIDType];

    if ((v7 & 8) != 0)
    {
      float v9 = [v4 rankingItem];
      [v9 freshnessScore];
      double v11 = v10;
      [a1 getTopHitThreshold:@"TOPHIT_FRESHNESS_THRESHOLD"];
      BOOL v8 = v11 >= v12;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)_hideUnderShowMoreCheck:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    char v6 = [v5 bundleIDType];

    if ((v6 & 8) != 0)
    {
      char v7 = [v3 rankingItem];
      LODWORD(v4) = [v7 shouldHideUnderShowMore] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

+ (BOOL)_recentEngagementOvertakeCheck:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rankingItem];

  if (v4)
  {
    uint64_t v5 = [v3 rankingItem];
    char v6 = [v5 recentSimilarIntentEngagementDates];
    LOBYTE(v4) = (unint64_t)[v6 count] > 1;
  }
  return (char)v4;
}

+ (BOOL)_stricterFreshnessTopicalityEngagementCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rankingItem];

  if (v5)
  {
    char v6 = [v4 rankingItem];
    __int16 v7 = [v6 bundleIDType];

    BOOL v8 = [v4 rankingItem];
    float v9 = v8;
    if ((v7 & 0x800) == 0)
    {
      if (([v8 bundleIDType] & 0x100000) == 0)
      {
        BOOL v10 = 1;
LABEL_23:

        goto LABEL_24;
      }
      float v14 = [v4 rankingItem];
      if (([v14 quIntentAvailable] & 1) == 0)
      {

LABEL_16:
        float v9 = [v4 rankingItem];
        [v9 freshnessScore];
        double v31 = v30;
        [a1 getTopHitThreshold:@"TOPHIT_FRESHNESS_THRESHOLD_MAIL"];
        if (v31 < v32) {
          goto LABEL_17;
        }
        long long v25 = [v4 rankingItem];
        [v25 keywordMatchScore];
        float v34 = v33;
        [a1 getTopHitThreshold:@"LOCAL_TOPHIT_CANDIDATE_KEYWORDMATCH_THRESHOLD_MAIL"];
        BOOL v29 = v34 < v35;
        goto LABEL_19;
      }
      uint64_t v15 = [v4 rankingItem];
      char v16 = [v15 matchedQUIntent];

      if ((v16 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    [v8 topicalityScore];
    double v12 = v11;
    [a1 getTopHitThreshold:@"FILES_IN_TOPHIT_TOPICALITY_THRESHOLD"];
    if (v12 >= v13)
    {
      double v17 = [v4 rankingItem];
      [v17 freshnessScore];
      double v19 = v18;
      [a1 getTopHitThreshold:@"TOPHIT_FRESHNESS_THRESHOLD"];
      double v21 = v20;

      if (v19 >= v21)
      {
LABEL_14:
        BOOL v10 = 1;
        goto LABEL_24;
      }
    }
    else
    {
    }
    float v9 = [v4 rankingItem];
    [v9 engagementScore];
    double v23 = v22;
    [a1 getTopHitThreshold:@"FILTER_FILES_IN_TOPHIT_ENGAGEMENT_THRESHOLD"];
    if (v23 < v24)
    {
LABEL_17:
      BOOL v10 = 0;
      goto LABEL_23;
    }
    long long v25 = [v4 rankingItem];
    [v25 topicalityScore];
    double v27 = v26;
    [a1 getTopHitThreshold:@"FILES_IN_TOPHIT_TOPICALITY_WITH_ENGAGEMENT_THRESHOLD"];
    BOOL v29 = v27 < v28;
LABEL_19:
    BOOL v10 = !v29;

    goto LABEL_23;
  }
  BOOL v10 = 0;
LABEL_24:

  return v10;
}

+ (void)topHitCandidacyThresholdingForAppSection:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 bundleIdentifier];
  if (![v6 isEqualToString:@"com.apple.application"]
    || (unint64_t)[v5 resultsCount] < 2)
  {
    goto LABEL_10;
  }
  __int16 v7 = [v5 resultSet];
  BOOL v8 = [v7 objectAtIndexedSubscript:0];
  float v9 = [v8 rankingItem];
  if (![v9 isLocalTopHitCandidate]) {
    goto LABEL_9;
  }
  v88 = [v5 resultSet];
  v86 = [v88 objectAtIndexedSubscript:1];
  BOOL v10 = [v86 rankingItem];
  if (![v10 isLocalTopHitCandidate])
  {

LABEL_9:
    goto LABEL_10;
  }
  double v11 = [v5 resultSet];
  v84 = [v11 objectAtIndexedSubscript:1];
  v82 = [v84 rankingItem];
  [v82 freshnessScore];
  double v13 = v12;
  if (v12 < 0.96)
  {
    v79 = v11;
    v80 = v10;
    char v81 = 0;
    goto LABEL_13;
  }
  v77 = [v5 resultSet];
  v76 = [v77 objectAtIndexedSubscript:1];
  v75 = [v76 rankingItem];
  [v75 topicalityScore];
  if (v14 < 0.6)
  {
    v79 = v11;
    v80 = v10;
    char v81 = 0;
    goto LABEL_13;
  }
  v73 = [v5 resultSet];
  double v27 = [v73 objectAtIndexedSubscript:1];
  float v28 = [v27 rankingItem];
  [v28 freshnessScore];
  if (v29 >= 0.9999)
  {
LABEL_27:

    BOOL v26 = 0;
    goto LABEL_28;
  }
  v74 = v28;
  v68 = v27;
  [v5 resultSet];
  v66 = char v81 = 1;
  double v30 = [v66 objectAtIndexedSubscript:1];
  double v31 = [v30 rankingItem];
  [v31 topicalityScore];
  if (v32 >= 0.9)
  {

    double v27 = v68;
    float v28 = v74;
    goto LABEL_27;
  }
  v64 = v31;
  v65 = v30;
  v79 = v11;
  v80 = v10;
  id v3 = v68;
LABEL_13:
  uint64_t v15 = [v5 resultSet];
  char v16 = [v15 objectAtIndexedSubscript:1];
  double v17 = [v16 rankingItem];
  [v17 topicalityScore];
  if (v18 >= 1.0)
  {

    BOOL v78 = 0;
    long long v25 = v74;
    if ((v81 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v72 = v15;
  v71 = [v5 resultSet];
  v70 = [v71 objectAtIndexedSubscript:0];
  v69 = [v70 rankingItem];
  [v69 likelihood];
  if (v19 <= 0.65)
  {
    BOOL v78 = 0;
    long long v25 = v74;
  }
  else
  {
    v63 = [v5 resultSet];
    v62 = [v63 objectAtIndexedSubscript:0];
    v61 = [v62 rankingItem];
    [v61 likelihood];
    double v21 = v20;
    v60 = [v5 resultSet];
    [v60 objectAtIndexedSubscript:1];
    double v22 = v67 = v3;
    double v23 = [v22 rankingItem];
    [v23 likelihood];
    BOOL v78 = v21 - v24 > 0.25;

    long long v25 = v74;
    id v3 = v67;
  }
  if (v81)
  {
LABEL_17:
  }
LABEL_18:
  double v11 = v79;
  BOOL v10 = v80;
  BOOL v26 = v78;
  if (v13 >= 0.96)
  {
LABEL_28:
  }
  if (!v26) {
    goto LABEL_11;
  }
  float v33 = [v5 resultSet];
  float v34 = [v33 objectAtIndexedSubscript:0];
  float v35 = [v34 rankingItem];
  char v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[v35 attributes], 0x77uLL);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 BOOLValue])
  {
    *(void *)buf = 0;
    float v36 = [v5 resultSet];
    float v37 = [v36 objectAtIndexedSubscript:0];
    float v38 = [v37 rankingItem];
    SSCompactRankingAttrsGetFloat([v38 attributes], 0x154uLL, &buf[4]);

    v39 = [v5 resultSet];
    float v40 = [v39 objectAtIndexedSubscript:1];
    float v41 = [v40 rankingItem];
    SSCompactRankingAttrsGetFloat([v41 attributes], 0x154uLL, buf);

    if (*(float *)&buf[4] > 10.0 && *(float *)buf < 5.0) {
      goto LABEL_40;
    }
    if (*(float *)buf > 0.0 && (float)(*(float *)&buf[4] / *(float *)buf) > 3.0) {
      goto LABEL_40;
    }
  }
  __int16 v7 = [v5 resultSet];
  BOOL v8 = [v7 objectAtIndexedSubscript:1];
  float v9 = [v8 rankingItem];
  [v9 topicalityScore];
  if (v42 >= 0.6) {
    goto LABEL_9;
  }
  v43 = [v5 resultSet];
  v44 = [v43 objectAtIndexedSubscript:1];
  v45 = [v44 rankingItem];
  [v45 engagementScore];
  if (v46 < 0.6)
  {

    goto LABEL_40;
  }
  v85 = [v5 resultSet];
  v47 = [v85 objectAtIndexedSubscript:1];
  [v47 rankingItem];
  v48 = v89 = v6;
  [v48 recentSimilarIntentEngagementDates];
  v49 = v83 = v43;
  uint64_t v87 = [v49 count];

  char v6 = v89;
  if (v87)
  {
LABEL_10:

    goto LABEL_11;
  }
LABEL_40:

  if ((unint64_t)[v5 resultsCount] >= 2)
  {
    unint64_t v50 = 1;
    do
    {
      v51 = [v5 resultSet];
      v52 = [v51 objectAtIndexedSubscript:v50];
      [a1 clearTopHitCandidate:v52];

      v53 = SSGeneralLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = [v5 resultSet];
        v55 = [v54 objectAtIndexedSubscript:v50];
        v56 = [v55 identifier];
        v57 = [v5 resultSet];
        v58 = [v57 objectAtIndexedSubscript:0];
        v59 = [v58 identifier];
        *(_DWORD *)&uint8_t buf[4] = 138412546;
        v91 = v56;
        __int16 v92 = 2112;
        v93 = v59;
        _os_log_impl(&dword_1BDB2A000, v53, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: app %@ TH candidacy thresholded in favor of app %@ with shortcuts.", &buf[4], 0x16u);
      }
      ++v50;
    }
    while (v50 < [v5 resultsCount]);
  }
LABEL_11:
}

+ (void)_setImportantPropertiesPrefixMatched:(id)a3 value:(unint64_t)a4
{
}

+ (void)_setImportantPropertiesWordMatched:(id)a3 value:(unint64_t)a4
{
}

@end