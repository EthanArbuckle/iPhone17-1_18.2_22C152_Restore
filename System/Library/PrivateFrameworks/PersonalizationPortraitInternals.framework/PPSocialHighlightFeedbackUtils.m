@interface PPSocialHighlightFeedbackUtils
+ (id)biomeEventFromFeedback:(id)a3;
+ (id)feedbackFromBiomeEvent:(id)a3;
+ (id)stringifyBiomeFeedbackType:(unint64_t)a3;
@end

@implementation PPSocialHighlightFeedbackUtils

+ (id)feedbackFromBiomeEvent:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 clientIdentifier];
  [v4 setClientIdentifier:v5];

  unint64_t v6 = [v3 feedbackType];
  self;
  if (v6 >= 0xB) {
    uint64_t v7 = 11;
  }
  else {
    uint64_t v7 = v6;
  }
  [v4 setFeedbackType:v7];
  v8 = [v3 feedbackCreationDate];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "setFeedbackCreationSecondsSinceReferenceDate:");

  id v9 = [v3 highlight];
  self;
  if (v9)
  {
    v10 = objc_opt_new();
    v11 = [v9 applicationIdentifiers];
    v12 = (void *)[v11 mutableCopy];
    [v10 setApplicationIdentifiers:v12];

    v13 = [v9 attributionIdentifier];
    [v10 setAttributionIdentifier:v13];

    v14 = [v9 batchIdentifier];
    [v10 setBatchIdentifier:v14];

    v15 = [v9 calculatedFeatures];

    if (v15)
    {
      v16 = [v9 calculatedFeatures];
      [v10 setCalculatedFeaturesFromDictionary:v16];
    }
    v17 = [v9 clientIdentifier];
    [v10 setClientIdentifier:v17];

    v18 = [v9 clientVariant];
    [v10 setVariant:v18];

    v19 = [v9 contentCreationDate];

    if (v19)
    {
      v20 = [v9 contentCreationDate];
      [v20 timeIntervalSinceReferenceDate];
      objc_msgSend(v10, "setContentCreationSecondsSinceReferenceDate:");
    }
    v21 = [v9 displayName];
    [v10 setDisplayName:v21];

    v22 = [v9 domainIdentifier];
    [v10 setDomainIdentifier:v22];

    v23 = [v9 groupPhotoPathDigest];
    [v10 setGroupPhotoPathDigest:v23];

    v24 = [v9 highlightIdentifier];
    [v10 setHighlightIdentifier:v24];

    uint64_t v25 = [v9 highlightType];
    self;
    if (v25 == 1) {
      unsigned int v26 = 1;
    }
    else {
      unsigned int v26 = 2;
    }
    if (v25) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    [v10 setHighlightType:v27];
    v28 = [v9 isConversationAutoDonating];

    if (v28)
    {
      v29 = [v9 isConversationAutoDonating];
      objc_msgSend(v10, "setIsConversationAutoDonating:", objc_msgSend(v29, "BOOLValue"));
    }
    v30 = [v9 isPrimary];

    if (v30)
    {
      v31 = [v9 isPrimary];
      objc_msgSend(v10, "setIsPrimary:", objc_msgSend(v31, "BOOLValue"));
    }
    v32 = [v9 originatingDeviceId];
    [v10 setOriginatingDeviceId:v32];

    v33 = [v9 rank];

    if (v33)
    {
      v34 = [v9 rank];
      objc_msgSend(v10, "setRank:", objc_msgSend(v34, "unsignedIntValue"));
    }
    v35 = [v9 rankingDate];

    if (v35)
    {
      v36 = [v9 rankingDate];
      [v36 timeIntervalSinceReferenceDate];
      objc_msgSend(v10, "setRankingSecondsSinceReferenceDate:");
    }
    v37 = [v9 resolvedUrl];
    [v10 setResolvedUrl:v37];

    v38 = [v9 resourceUrl];
    v39 = [v38 absoluteString];
    [v10 setResourceUrl:v39];

    v40 = [v9 score];

    if (v40)
    {
      v41 = [v9 score];
      [v41 doubleValue];
      objc_msgSend(v10, "setScore:");
    }
    id v42 = [v9 sender];
    self;
    if (v42)
    {
      v43 = objc_opt_new();
      v44 = [v42 handle];
      [v43 setHandle:v44];

      objc_msgSend(v43, "setIsMe:", objc_msgSend(v42, "isMe"));
      objc_msgSend(v43, "setIsSignificant:", objc_msgSend(v42, "isSignificant"));
    }
    else
    {
      v43 = 0;
    }

    [v10 setSender:v43];
    v45 = [v9 sourceBundleId];
    [v10 setSourceBundleId:v45];

    v46 = [v9 syndicationDate];

    if (v46)
    {
      v47 = [v9 syndicationDate];
      [v47 timeIntervalSinceReferenceDate];
      objc_msgSend(v10, "setSyndicationSecondsSinceReferenceDate:");
    }
  }
  else
  {
    v10 = 0;
  }

  [v4 setHighlight:v10];
  v48 = [v3 clientVariant];

  [v4 setVariant:v48];
  return v4;
}

+ (id)biomeEventFromFeedback:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 feedbackCreationSecondsSinceReferenceDate];
  unint64_t v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
  id v7 = objc_alloc(MEMORY[0x1E4F50470]);
  v8 = [v4 clientIdentifier];
  unsigned int v9 = [v4 feedbackType];
  self;
  id v10 = [v4 highlight];
  self;
  if (v10
    && (([v10 hasHighlightIdentifier] & 1) != 0
     || [v10 hasAttributionIdentifier]))
  {
    if ([v10 hasSyndicationSecondsSinceReferenceDate])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v10 syndicationSecondsSinceReferenceDate];
      uint64_t v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      uint64_t v12 = 0;
    }
    if ([v10 hasContentCreationSecondsSinceReferenceDate])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v10 contentCreationSecondsSinceReferenceDate];
      v60 = objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v60 = 0;
    }
    if ([v10 hasRankingSecondsSinceReferenceDate])
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v10 rankingSecondsSinceReferenceDate];
      v59 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v59 = 0;
    }
    id v48 = objc_alloc(MEMORY[0x1E4F503F0]);
    uint64_t v16 = [v10 highlightIdentifier];
    v17 = &stru_1F253DF18;
    v47 = (void *)v16;
    if (v16) {
      v17 = (__CFString *)v16;
    }
    v45 = v17;
    int v18 = [v10 highlightType];
    self;
    if (v18 == 2) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = v18 == 1;
    }
    v68 = [v10 sourceBundleId];
    v67 = [v10 applicationIdentifiers];
    int v46 = [v10 hasResourceUrl];
    uint64_t v44 = v19;
    uint64_t v20 = v12;
    if (v46)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1CB10]);
      v41 = [v10 resourceUrl];
      v57 = objc_msgSend(v21, "initWithString:");
    }
    else
    {
      v57 = 0;
    }
    id v22 = [v10 sender];
    self;
    v53 = v22;
    unsigned int v50 = v9;
    if (v22 && [v22 hasHandle])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F50468]);
      v24 = [v22 handle];
      if ([v22 hasIsSignificant]) {
        uint64_t v25 = [v22 isSignificant];
      }
      else {
        uint64_t v25 = 0;
      }
      if ([v22 hasIsMe]) {
        uint64_t v26 = [v22 isMe];
      }
      else {
        uint64_t v26 = 0;
      }
      v58 = (void *)[v23 initWithHandle:v24 isSignificant:v25 isMe:v26];
    }
    else
    {
      v58 = 0;
    }

    v66 = [v10 domainIdentifier];
    v65 = [v10 batchIdentifier];
    v64 = [v10 clientIdentifier];
    v63 = [v10 groupPhotoPathDigest];
    v62 = [v10 displayName];
    int v43 = [v10 hasIsPrimary];
    if (v43)
    {
      v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isPrimary"));
    }
    else
    {
      v56 = 0;
    }
    uint64_t v27 = (void *)v20;
    v61 = [v10 attributionIdentifier];
    int v42 = [v10 hasRank];
    if (v42)
    {
      v55 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "rank"));
    }
    else
    {
      v55 = 0;
    }
    int v28 = [v10 hasScore];
    v52 = v6;
    if (v28)
    {
      v29 = NSNumber;
      [v10 score];
      v54 = objc_msgSend(v29, "numberWithDouble:");
    }
    else
    {
      v54 = 0;
    }
    int v30 = [v10 hasIsConversationAutoDonating];
    id v51 = v7;
    v31 = v8;
    if (v30)
    {
      v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isConversationAutoDonating"));
    }
    else
    {
      v32 = 0;
    }
    v33 = [v10 originatingDeviceId];
    v34 = [v10 resolvedUrl];
    v35 = [v10 variant];
    v36 = v48;
    v49 = v27;
    v13 = objc_msgSend(v36, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v45, v44, v27, v68, v67, v57, v58, v66, v65, 0, v64, v60, v63, v62,
                    v56,
                    v61,
                    v55,
                    v54,
                    v32,
                    v33,
                    v59,
                    v34,
                    v35);

    if (v30) {
    v8 = v31;
    }
    id v7 = v51;
    if (v28) {

    }
    unint64_t v6 = v52;
    unsigned int v9 = v50;
    if (v42) {

    }
    if (v43) {
    if (v46)
    }
    {
    }
  }
  else
  {
    v13 = 0;
  }
  if (v9 >= 0xB) {
    uint64_t v37 = 11;
  }
  else {
    uint64_t v37 = v9;
  }

  v38 = [v4 variant];

  v39 = (void *)[v7 initWithClientIdentifier:v8 feedbackType:v37 feedbackCreationDate:v6 highlight:v13 clientVariant:v38];
  return v39;
}

+ (id)stringifyBiomeFeedbackType:(unint64_t)a3
{
  self;
  unint64_t v4 = 11;
  if (a3 < 0xB) {
    unint64_t v4 = a3;
  }
  id v5 = off_1E65D4C78[v4];
  return v5;
}

@end