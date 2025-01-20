@interface _PSPETMessageBuilder
- (_PSPETMessageBuilder)initWithInteractionsStatistics:(id)a3 andConfig:(id)a4 andContext:(id)a5 andDeviceIdentifier:(id)a6 andTrialIdentifier:(id)a7 andDefaults:(id)a8;
- (id)getPETMessage;
- (id)privacyMitigatedFeatureValueFromName:(id)a3 forConversationId:(id)a4;
- (void)addFeedbackEvents:(id)a3;
@end

@implementation _PSPETMessageBuilder

- (_PSPETMessageBuilder)initWithInteractionsStatistics:(id)a3 andConfig:(id)a4 andContext:(id)a5 andDeviceIdentifier:(id)a6 andTrialIdentifier:(id)a7 andDefaults:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v70.receiver = self;
  v70.super_class = (Class)_PSPETMessageBuilder;
  v19 = [(_PSPETMessageBuilder *)&v70 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interactionsStatistics, a3);
    uint64_t v21 = objc_opt_new();
    shareEvent = v20->_shareEvent;
    v20->_shareEvent = (PeopleSuggesterShareEvent *)v21;

    id v63 = v16;
    [(PeopleSuggesterShareEvent *)v20->_shareEvent setDeviceIdentifier:v16];
    v23 = [v15 sessionID];
    [(PeopleSuggesterShareEvent *)v20->_shareEvent setSessionId:v23];

    id v62 = v17;
    [(PeopleSuggesterShareEvent *)v20->_shareEvent setTrialIdentifier:v17];
    [(PeopleSuggesterShareEvent *)v20->_shareEvent setVersion:5];
    -[PeopleSuggesterShareEvent setIsFallbackFetch:](v20->_shareEvent, "setIsFallbackFetch:", [v15 isFallbackFetch]);
    -[PeopleSuggesterShareEvent setIsSharePlayAvailable:](v20->_shareEvent, "setIsSharePlayAvailable:", [v15 isSharePlayAvailable]);
    v24 = [v15 bundleID];
    v25 = +[_PSConstants mobilePhotosBundleId];
    int v26 = [v24 isEqualToString:v25];

    if (v26)
    {
      v27 = v20->_shareEvent;
      uint64_t v28 = 1;
    }
    else
    {
      v29 = [v15 bundleID];
      v30 = +[_PSConstants mobileScreenshotsBundleId];
      int v31 = [v29 isEqualToString:v30];

      if (v31)
      {
        v27 = v20->_shareEvent;
        uint64_t v28 = 2;
      }
      else
      {
        v32 = [v15 bundleID];
        v33 = +[_PSConstants mobileCameraBundleId];
        int v34 = [v32 isEqualToString:v33];

        if (v34)
        {
          v27 = v20->_shareEvent;
          uint64_t v28 = 3;
        }
        else
        {
          v35 = [v15 bundleID];
          v36 = +[_PSConstants mobileSafariBundleId];
          int v37 = [v35 isEqualToString:v36];

          v27 = v20->_shareEvent;
          if (v37) {
            uint64_t v28 = 4;
          }
          else {
            uint64_t v28 = 0;
          }
        }
      }
    }
    [(PeopleSuggesterShareEvent *)v27 setAppSharedFrom:v28];
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      v38 = [v18 stringForKey:@"_PSPeopleSuggesterRewritePETMessageKey"];
      [(PeopleSuggesterShareEvent *)v20->_shareEvent setTestKey:v38];
    }
    id v61 = v18;
    v39 = objc_opt_new();
    v40 = objc_opt_new();
    [v39 setObject:v40 forKeyedSubscript:&unk_1EF675A50];

    v41 = objc_opt_new();
    [v39 setObject:v41 forKeyedSubscript:&unk_1EF675A68];

    v42 = objc_opt_new();
    [v39 setObject:v42 forKeyedSubscript:&unk_1EF675A80];

    v43 = objc_opt_new();
    [v39 setObject:v43 forKeyedSubscript:&unk_1EF675A98];

    v44 = objc_opt_new();
    v45 = [v14 conversationIds];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __127___PSPETMessageBuilder_initWithInteractionsStatistics_andConfig_andContext_andDeviceIdentifier_andTrialIdentifier_andDefaults___block_invoke;
    v65[3] = &unk_1E5AE1168;
    id v64 = v14;
    id v66 = v14;
    id v46 = v44;
    id v67 = v46;
    id v47 = v39;
    id v68 = v47;
    v48 = v20;
    v69 = v48;
    [v45 enumerateObjectsUsingBlock:v65];

    v49 = [NSNumber numberWithInt:1];
    v50 = [v47 objectForKeyedSubscript:v49];
    if (![v50 count])
    {
      v51 = [NSNumber numberWithInt:3];
      v52 = [v47 objectForKeyedSubscript:v51];
      if (![v52 count])
      {
        v59 = [NSNumber numberWithInt:4];
        v58 = [v47 objectForKeyedSubscript:v59];
        uint64_t v60 = [v58 count];

        if (!v60)
        {
          v55 = objc_opt_new();
          objc_msgSend(v55, "setFeedbackType:", objc_msgSend(v15, "feedBack"));
          v56 = v20->_shareEvent;
          goto LABEL_18;
        }
LABEL_17:
        v53 = [v47 objectForKeyedSubscript:&unk_1EF675A68];
        [(_PSPETMessageBuilder *)v48 addFeedbackEvents:v53];

        v54 = [v47 objectForKeyedSubscript:&unk_1EF675A80];
        [(_PSPETMessageBuilder *)v48 addFeedbackEvents:v54];

        v55 = [v47 objectForKeyedSubscript:&unk_1EF675A98];
        v56 = (PeopleSuggesterShareEvent *)v48;
LABEL_18:
        [(PeopleSuggesterShareEvent *)v56 addFeedbackEvents:v55];
        id v16 = v63;
        id v14 = v64;
        id v17 = v62;

        id v18 = v61;
        goto LABEL_19;
      }
    }
    goto LABEL_17;
  }
LABEL_19:

  return v20;
}

- (void)addFeedbackEvents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PeopleSuggesterShareEvent *)self->_shareEvent addFeedbackEvents:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)privacyMitigatedFeatureValueFromName:(id)a3 forConversationId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v9 = [(_CDInteractionsStatistics *)self->_interactionsStatistics valueOrDefaultValueForFeature:v6 forConversationId:v7];
  [v9 doubleValue];
  double v11 = v10;
  id v12 = v6;
  if (([v12 isEqualToString:@"timeSinceOutgoingInteractionNumber10"] & 1) != 0
    || ([v12 isEqualToString:@"timeSinceLastIncomingInteraction"] & 1) != 0
    || [v12 isEqualToString:@"timeSinceLastOutgoingInteraction"])
  {
    double v11 = round(v11);
  }

  [v8 setValue:v11];
  objc_msgSend(v8, "setDefaultValue:", -[_CDInteractionsStatistics isUsingDefaultValue:forConversationId:](self->_interactionsStatistics, "isUsingDefaultValue:forConversationId:", v12, v7));

  return v8;
}

- (id)getPETMessage
{
  return self->_shareEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsStatistics, 0);

  objc_storeStrong((id *)&self->_shareEvent, 0);
}

@end