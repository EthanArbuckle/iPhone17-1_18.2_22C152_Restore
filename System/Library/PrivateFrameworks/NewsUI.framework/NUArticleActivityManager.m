@interface NUArticleActivityManager
- (BOOL)articleDislikedForHeadline:(id)a3;
- (BOOL)articleLikedForHeadline:(id)a3;
- (BOOL)articleSavedForHeadline:(id)a3;
- (BOOL)channelMutedForHeadline:(id)a3;
- (FCHeadlineProviding)headline;
- (FCReadingHistory)readingHistory;
- (FCReadingList)readingList;
- (FCSubscriptionList)subscriptionList;
- (NUArticleActivityManager)initWithHeadline:(id)a3 readingHistory:(id)a4 readingList:(id)a5 subscriptionList:(id)a6 URLHandler:(id)a7 reportConcernViewPresenter:(id)a8 URLModifier:(id)a9 optionsProvider:(id)a10;
- (NUArticleActivityOptionsProvider)optionsProvider;
- (NUReportConcernViewPresenter)reportConcernViewPresenter;
- (NUURLHandling)URLHandler;
- (NUURLModifying)URLModifier;
- (id)activities;
- (id)activityForType:(unint64_t)a3;
- (id)activityImageForHeadline:(id)a3 withType:(unint64_t)a4;
- (id)activityItemSources;
- (id)activityTitleForHeadline:(id)a3 withType:(unint64_t)a4;
- (id)activityTypeForHeadline:(id)a3 withType:(unint64_t)a4;
- (id)performBlockForHeadline:(id)a3 withType:(unint64_t)a4;
- (id)supportedActivities;
- (void)toggleArticleDislikeStatusForHeadline:(id)a3;
- (void)toggleArticleLikeStatusForHeadline:(id)a3;
- (void)toggleMuteForHeadline:(id)a3;
- (void)toggleSaveForHeadline:(id)a3;
@end

@implementation NUArticleActivityManager

- (NUArticleActivityManager)initWithHeadline:(id)a3 readingHistory:(id)a4 readingList:(id)a5 subscriptionList:(id)a6 URLHandler:(id)a7 reportConcernViewPresenter:(id)a8 URLModifier:(id)a9 optionsProvider:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)NUArticleActivityManager;
  v18 = [(NUArticleActivityManager *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_headline, a3);
    objc_storeStrong((id *)&v19->_readingHistory, a4);
    objc_storeStrong((id *)&v19->_readingList, a5);
    objc_storeStrong((id *)&v19->_subscriptionList, a6);
    objc_storeStrong((id *)&v19->_URLHandler, a7);
    objc_storeStrong((id *)&v19->_reportConcernViewPresenter, a8);
    objc_storeStrong((id *)&v19->_URLModifier, a9);
    objc_storeStrong((id *)&v19->_optionsProvider, a10);
  }

  return v19;
}

- (id)activityItemSources
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = [NUArticleImageActivityItemSource alloc];
  v4 = [(NUArticleActivityManager *)self headline];
  v5 = [(NUArticleImageActivityItemSource *)v3 initWithHeadline:v4];

  v6 = [NUArticleURLActivityItemSource alloc];
  v7 = [(NUArticleActivityManager *)self headline];
  v8 = [(NUArticleActivityManager *)self URLModifier];
  v9 = [(NUArticleURLActivityItemSource *)v6 initWithHeadline:v7 URLModifier:v8];

  v10 = [NUArticleTextActivityItemSource alloc];
  v11 = [(NUArticleActivityManager *)self headline];
  v12 = [(NUArticleTextActivityItemSource *)v10 initWithHeadline:v11];

  v15[0] = v5;
  v15[1] = v12;
  v15[2] = v9;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

- (id)activities
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(NUArticleActivityManager *)self supportedActivities];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) unsignedIntegerValue];
        v9 = [(NUArticleActivityManager *)self activityForType:v8];
        if (!v9)
        {
          v10 = [(NUArticleActivityManager *)self headline];
          v11 = [(NUArticleActivityManager *)self activityTypeForHeadline:v10 withType:v8];

          v12 = [(NUArticleActivityManager *)self headline];
          v13 = [(NUArticleActivityManager *)self activityTitleForHeadline:v12 withType:v8];

          v14 = [(NUArticleActivityManager *)self headline];
          v15 = [(NUArticleActivityManager *)self activityImageForHeadline:v14 withType:v8];

          v16 = [(NUArticleActivityManager *)self headline];
          id v17 = [(NUArticleActivityManager *)self performBlockForHeadline:v16 withType:v8];

          v9 = [[NUArticleActivity alloc] initWithActivityType:v11 title:v13 image:v15 performBlock:v17];
        }
        [v3 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  v18 = (void *)[v3 copy];

  return v18;
}

- (id)activityForType:(unint64_t)a3
{
  if (a3 == 6)
  {
    uint64_t v5 = +[NUAddToSafariReadingListActivityFactory createAddToSafariReadingListActivity];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)supportedActivities
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(NUArticleActivityManager *)self optionsProvider];
  uint64_t v5 = [(NUArticleActivityManager *)self headline];
  char v6 = [v4 articleActivityOptionsForHeadline:v5];

  if (v6)
  {
    [v3 addObject:&unk_26D4A8D50];
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:&unk_26D4A8D68];
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 addObject:&unk_26D4A8D80];
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 addObject:&unk_26D4A8D98];
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 addObject:&unk_26D4A8DB0];
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  [v3 addObject:&unk_26D4A8DC8];
  if ((v6 & 0x40) != 0) {
LABEL_8:
  }
    [v3 addObject:&unk_26D4A8DE0];
LABEL_9:

  return v3;
}

- (id)activityTypeForHeadline:(id)a3 withType:(unint64_t)a4
{
  if (a4 > 5) {
    return 0;
  }
  else {
    return off_2645FF160[a4];
  }
}

- (id)activityTitleForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      BOOL v7 = [(NUArticleActivityManager *)self articleLikedForHeadline:v6];
      uint64_t v8 = NUBundle();
      if (v7) {
        v9 = @"Undo Suggest More";
      }
      else {
        v9 = @"Suggest More";
      }
      goto LABEL_18;
    case 1uLL:
      BOOL v10 = [(NUArticleActivityManager *)self articleDislikedForHeadline:v6];
      uint64_t v8 = NUBundle();
      if (v10) {
        v9 = @"Undo Suggest Less";
      }
      else {
        v9 = @"Suggest Less";
      }
      goto LABEL_18;
    case 2uLL:
      BOOL v11 = [(NUArticleActivityManager *)self channelMutedForHeadline:v6];
      uint64_t v8 = NUBundle();
      if (v11) {
        v9 = @"Unblock Channel";
      }
      else {
        v9 = @"Block Channel";
      }
      goto LABEL_18;
    case 3uLL:
      v12 = NUBundle();
      uint64_t v8 = v12;
      v9 = @"Open in Safari";
      goto LABEL_19;
    case 4uLL:
      v12 = NUBundle();
      uint64_t v8 = v12;
      v9 = @"Report a Concern";
      goto LABEL_19;
    case 5uLL:
      BOOL v13 = [(NUArticleActivityManager *)self articleSavedForHeadline:v6];
      uint64_t v8 = NUBundle();
      if (v13) {
        v9 = @"Unsave";
      }
      else {
        v9 = @"Save";
      }
LABEL_18:
      v12 = v8;
LABEL_19:
      v14 = [v12 localizedStringForKey:v9 value:&stru_26D495918 table:0];

      break;
    default:
      v14 = 0;
      break;
  }

  return v14;
}

- (id)activityImageForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = @"safari";
  switch(a4)
  {
    case 0uLL:
      BOOL v8 = [(NUArticleActivityManager *)self articleLikedForHeadline:v6];
      v9 = @"hand.thumbsup";
      BOOL v10 = @"hand.thumbsup.fill";
      goto LABEL_8;
    case 1uLL:
      BOOL v8 = [(NUArticleActivityManager *)self articleDislikedForHeadline:v6];
      v9 = @"hand.thumbsdown";
      BOOL v10 = @"hand.thumbsdown.fill";
      goto LABEL_8;
    case 2uLL:
      BOOL v8 = [(NUArticleActivityManager *)self channelMutedForHeadline:v6];
      v9 = @"hand.raised";
      BOOL v10 = @"hand.raised.slash.fill";
      goto LABEL_8;
    case 3uLL:
      goto LABEL_11;
    case 4uLL:
      BOOL v7 = @"exclamationmark.bubble";
      goto LABEL_11;
    case 5uLL:
      BOOL v8 = [(NUArticleActivityManager *)self articleSavedForHeadline:v6];
      v9 = @"bookmark";
      BOOL v10 = @"bookmark.fill";
LABEL_8:
      if (v8) {
        BOOL v7 = v10;
      }
      else {
        BOOL v7 = v9;
      }
LABEL_11:
      v12 = [MEMORY[0x263F1C6B0] systemImageNamed:v7];
      BOOL v13 = [MEMORY[0x263F1C550] labelColor];
      BOOL v11 = [v12 imageWithTintColor:v13 renderingMode:2];

      break;
    default:
      BOOL v11 = 0;
      break;
  }

  return v11;
}

- (id)performBlockForHeadline:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  switch(a4)
  {
    case 0uLL:
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke;
      v24[3] = &unk_2645FF0D0;
      BOOL v7 = &v26;
      objc_copyWeak(&v26, &location);
      id v25 = v6;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v24);
      v9 = v25;
      goto LABEL_9;
    case 1uLL:
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_2;
      v21[3] = &unk_2645FF0D0;
      BOOL v7 = &v23;
      objc_copyWeak(&v23, &location);
      id v22 = v6;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v21);
      v9 = v22;
      goto LABEL_9;
    case 2uLL:
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_4;
      v15[3] = &unk_2645FF0D0;
      BOOL v7 = &v17;
      objc_copyWeak(&v17, &location);
      id v16 = v6;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v15);
      v9 = v16;
      goto LABEL_9;
    case 3uLL:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_5;
      v14[3] = &unk_2645FF118;
      v14[4] = self;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v14);
      break;
    case 4uLL:
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_7;
      v12[3] = &unk_2645FF140;
      v12[4] = self;
      id v13 = v6;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v12);

      break;
    case 5uLL:
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_3;
      v18[3] = &unk_2645FF0D0;
      BOOL v7 = &v20;
      objc_copyWeak(&v20, &location);
      id v19 = v6;
      BOOL v8 = (void *)MEMORY[0x223C968A0](v18);
      v9 = v19;
LABEL_9:

      objc_destroyWeak(v7);
      break;
    default:
      BOOL v8 = 0;
      break;
  }
  BOOL v10 = (void *)MEMORY[0x223C968A0](v8);

  objc_destroyWeak(&location);

  return v10;
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained toggleArticleLikeStatusForHeadline:*(void *)(a1 + 32)];
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained toggleArticleDislikeStatusForHeadline:*(void *)(a1 + 32)];
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained toggleSaveForHeadline:*(void *)(a1 + 32)];
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained toggleMuteForHeadline:*(void *)(a1 + 32)];
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_5(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "fc_firstObjectPassingTest:", &__block_literal_global_11);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    uint64_t v3 = [*(id *)(a1 + 32) URLHandler];
    [v3 openURL:v4 options:0 completion:0];
  }
}

uint64_t __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __61__NUArticleActivityManager_performBlockForHeadline_withType___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reportConcernViewPresenter];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) reportConcernViewPresenter];
    [v4 presentReportConcernViewForHeadline:*(void *)(a1 + 40)];
  }
}

- (void)toggleArticleLikeStatusForHeadline:(id)a3
{
  id v4 = a3;
  id v6 = [(NUArticleActivityManager *)self readingHistory];
  uint64_t v5 = [v4 articleID];

  [v6 toggleLikeForArticleWithID:v5];
}

- (void)toggleArticleDislikeStatusForHeadline:(id)a3
{
  id v4 = a3;
  id v6 = [(NUArticleActivityManager *)self readingHistory];
  uint64_t v5 = [v4 articleID];

  [v6 toggleDislikeForArticleWithID:v5];
}

- (void)toggleSaveForHeadline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUArticleActivityManager *)self articleSavedForHeadline:v4];
  id v7 = [(NUArticleActivityManager *)self readingList];
  id v6 = [v4 articleID];

  if (v5) {
    [v7 removeArticleFromReadingList:v6];
  }
  else {
    [v7 addArticleToReadingList:v6 eventInitiationLevel:0 origin:1];
  }
}

- (void)toggleMuteForHeadline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUArticleActivityManager *)self headline];
  id v6 = [v5 sourceChannel];
  id v9 = [v6 identifier];

  LODWORD(v5) = [(NUArticleActivityManager *)self channelMutedForHeadline:v4];
  id v7 = [(NUArticleActivityManager *)self subscriptionList];
  BOOL v8 = v7;
  if (v5) {
    [v7 removeSubscriptionForTagID:v9 type:2];
  }
  else {
    [v7 addSubscriptionForTagID:v9 type:2];
  }
}

- (BOOL)articleLikedForHeadline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUArticleActivityManager *)self readingHistory];
  id v6 = [v4 articleID];

  LOBYTE(v4) = [v5 likingStatusForArticleID:v6] == 1;
  return (char)v4;
}

- (BOOL)articleDislikedForHeadline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUArticleActivityManager *)self readingHistory];
  id v6 = [v4 articleID];

  LOBYTE(v4) = [v5 likingStatusForArticleID:v6] == 2;
  return (char)v4;
}

- (BOOL)articleSavedForHeadline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NUArticleActivityManager *)self readingList];
  id v6 = [v4 articleID];

  LOBYTE(v4) = [v5 isArticleOnReadingList:v6];
  return (char)v4;
}

- (BOOL)channelMutedForHeadline:(id)a3
{
  id v4 = [(NUArticleActivityManager *)self subscriptionList];
  BOOL v5 = [(NUArticleActivityManager *)self headline];
  id v6 = [v5 sourceChannel];
  id v7 = [v6 identifier];
  char v8 = [v4 hasMutedSubscriptionForTagID:v7];

  return v8;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCSubscriptionList)subscriptionList
{
  return self->_subscriptionList;
}

- (NUURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (NUReportConcernViewPresenter)reportConcernViewPresenter
{
  return self->_reportConcernViewPresenter;
}

- (NUURLModifying)URLModifier
{
  return self->_URLModifier;
}

- (NUArticleActivityOptionsProvider)optionsProvider
{
  return self->_optionsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_URLModifier, 0);
  objc_storeStrong((id *)&self->_reportConcernViewPresenter, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);

  objc_storeStrong((id *)&self->_headline, 0);
}

@end