@interface FCPersonalizationFeature
+ (id)featureForFreeValuedIdentifier:(id)a3;
+ (id)featureForIdentifier:(char)a3 allowFreeValued:;
+ (id)featureForIdentifier:(id)a3;
+ (id)featureFromTagID:(id)a3;
+ (id)featureObserver;
+ (id)featuresFromIssue:(id)a3;
+ (id)featuresFromPersonalizingItem:(id)a3 personalizationTreatment:(id)a4;
+ (id)featuresFromTag:(id)a3;
+ (id)featuresFromTagIDs:(id)a3;
+ (id)featuresFromTodayPersonalizationEvent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeBoosted;
- (FCPersonalizationFeature)init;
- (NSString)fc_description;
- (NSString)personalizationIdentifier;
- (NSString)tagID;
- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)initWithIdentifier:(void *)a1;
- (void)setShouldBeBoosted:(BOOL)a3;
@end

@implementation FCPersonalizationFeature

+ (id)featuresFromIssue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 sourceChannel];
  v6 = [v5 identifier];

  v7 = [v3 topicTagIDs];

  if (v6 && v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__FCPersonalizationFeature_featuresFromIssue___block_invoke;
    v19[3] = &unk_1E5B51BB0;
    id v20 = v6;
    v8 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v19);
    [v4 addObjectsFromArray:v8];
  }
  v9 = (void *)MEMORY[0x1E4F1C978];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__FCPersonalizationFeature_featuresFromIssue___block_invoke_2;
  v16[3] = &unk_1E5B501A0;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = objc_msgSend(v9, "fc_array:", v16);
  v13 = objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", &__block_literal_global_58_2);
  [v4 addObjectsFromArray:v13];

  v14 = (void *)[v4 copy];
  return v14;
}

FCPublisherTopicFeature *__46__FCPersonalizationFeature_featuresFromIssue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[FCPublisherTopicFeature alloc] initWithPublisherTagID:*(void *)(a1 + 32) topicTagID:v3];

  return v4;
}

void __46__FCPersonalizationFeature_featuresFromIssue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", *(void *)(a1 + 40));
}

FCTagIDFeature *__46__FCPersonalizationFeature_featuresFromIssue___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[FCTagIDFeature alloc] initWithTagID:v2];

  return v3;
}

+ (id)featuresFromTodayPersonalizationEvent:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke;
  v8[3] = &unk_1E5B4BF30;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "fc_array:", v8);

  return v6;
}

void __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) headlinePublisher];
  id v5 = [*(id *)(a1 + 32) personalizationSectionFeatureId];
  v6 = [*(id *)(a1 + 32) headlineTopics];
  v7 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_62_1);

  if (v4) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_3;
    v20[3] = &unk_1E5B51BB0;
    id v21 = v4;
    id v9 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v20);
    [v3 addObjectsFromArray:v9];
  }
  if ([*(id *)(a1 + 32) action] == 3
    || [*(id *)(a1 + 32) action] == 4
    || [*(id *)(a1 + 32) action] == 5
    || [*(id *)(a1 + 32) action] == 6)
  {
    id v10 = +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature];
    [v3 addObject:v10];
  }
  if (v5)
  {
    id v11 = +[FCPersonalizationFeature featureForFreeValuedIdentifier:v5];
    [v3 addObject:v11];
  }
  v12 = (void *)MEMORY[0x1E4F1C978];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_4;
  v17[3] = &unk_1E5B501A0;
  id v18 = v4;
  id v19 = v7;
  id v13 = v7;
  id v14 = v4;
  v15 = objc_msgSend(v12, "fc_array:", v17);
  v16 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_66_0);
  [v3 addObjectsFromArray:v16];
}

uint64_t __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tagId];
}

FCPublisherTopicFeature *__66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[FCPublisherTopicFeature alloc] initWithPublisherTagID:*(void *)(a1 + 32) topicTagID:v3];

  return v4;
}

void __66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", *(void *)(a1 + 40));
}

FCTagIDFeature *__66__FCPersonalizationFeature_featuresFromTodayPersonalizationEvent___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[FCTagIDFeature alloc] initWithTagID:v2];

  return v3;
}

+ (id)featuresFromPersonalizingItem:(id)a3 personalizationTreatment:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v30 = a4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [v5 publisherID];
  if (v7)
  {
    BOOL v8 = [[FCTagIDFeature alloc] initWithTagID:v7];
    [v6 addObject:v8];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v31 = v5;
  id v9 = [v5 topicIDs];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v15 = [[FCTagIDFeature alloc] initWithTagID:v14];
        [v6 addObject:v15];

        if (v7)
        {
          v16 = [[FCPublisherTopicFeature alloc] initWithPublisherTagID:v7 topicTagID:v14];
          [v6 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  if ([v31 isANF]) {
    +[FCHeadlineFeatureArticleTypeFlint articleTypeFlintFeature];
  }
  else {
  id v17 = +[FCHeadlineFeatureArticleTypeNonFlint articleTypeNonFlintFeature];
  }
  [v6 addObject:v17];

  char v18 = objc_opt_respondsToSelector();
  if (v30 && (v18 & 1) != 0 && [v31 bodyTextLength] >= 1)
  {
    uint64_t v19 = [v31 bodyTextLength];
    [v30 articleLengthMediumThreshold];
    if (v19 <= (int)v20)
    {
      uint64_t v23 = +[FCArticleLengthFeature shortLengthFeature];
    }
    else
    {
      uint64_t v21 = [v31 bodyTextLength];
      [v30 articleLengthLongThreshold];
      if (v21 <= (int)v22) {
        +[FCArticleLengthFeature mediumLengthFeature];
      }
      else {
      uint64_t v23 = +[FCArticleLengthFeature longLengthFeature];
      }
    }
    v24 = (void *)v23;
    [v6 addObject:v23];
  }
  if (v7 && [v31 isPaid])
  {
    v25 = [[FCPublisherPremiumFeature alloc] initWithTagID:v7];
    [v6 addObject:v25];
  }
  if ([v31 hasVideo])
  {
    v26 = +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature];
    [v6 addObject:v26];
  }
  if (objc_opt_respondsToSelector())
  {
    v27 = [v31 iAdCategories];
    v28 = objc_msgSend(v27, "fc_arrayByTransformingWithBlock:", &__block_literal_global_75_0);
    [v6 addObjectsFromArray:v28];
  }
  return v6;
}

FCAdCategoryFeature *__83__FCPersonalizationFeature_featuresFromPersonalizingItem_personalizationTreatment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[FCAdCategoryFeature alloc] initWithTagID:v2];

  return v3;
}

+ (id)featuresFromTag:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [FCTagIDFeature alloc];
  v6 = [v3 identifier];

  v7 = [(FCTagIDFeature *)v5 initWithTagID:v6];
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  BOOL v8 = (void *)[v4 copy];
  return v8;
}

+ (id)featuresFromTagIDs:(id)a3
{
  return (id)objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_79);
}

FCTagIDFeature *__47__FCPersonalizationFeature_featuresFromTagIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[FCTagIDFeature alloc] initWithTagID:v2];

  return v3;
}

+ (id)featureFromTagID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v10 count:1];

  v7 = objc_msgSend(a1, "featuresFromTagIDs:", v6, v10, v11);
  BOOL v8 = [v7 firstObject];

  return v8;
}

+ (id)featureForIdentifier:(id)a3
{
  return +[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]((uint64_t)a1, a3, 0);
}

+ (id)featureForIdentifier:(char)a3 allowFreeValued:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  if ([v4 hasPrefix:@"f0"])
  {
    uint64_t v5 = +[FCBaselineFeature baselineFeature];
LABEL_18:
    v7 = (void *)v5;
    goto LABEL_19;
  }
  if ([v4 hasPrefix:@"f1"])
  {
    uint64_t v5 = +[FCHeadlineFeatureArticleTypeFlint articleTypeFlintFeature];
    goto LABEL_18;
  }
  if ([v4 hasPrefix:@"f7"])
  {
LABEL_6:
    uint64_t v5 = +[FCHeadlineFeatureArticleWithVideoContent articleWithVideoContentFeature];
    goto LABEL_18;
  }
  if ([v4 hasPrefix:@"f2"])
  {
    uint64_t v5 = +[FCHeadlineFeatureArticleTypeNonFlint articleTypeNonFlintFeature];
    goto LABEL_18;
  }
  if ([v4 hasPrefix:@"f3"])
  {
    v6 = FCTagIDFeature;
LABEL_17:
    uint64_t v5 = [[v6 alloc] initWithPersonalizationIdentifier:v4];
    goto LABEL_18;
  }
  if ([v4 hasPrefix:@"f4"])
  {
    v6 = FCPublisherTopicFeature;
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"f5"])
  {
    v6 = FCPublisherPremiumFeature;
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"f6"])
  {
    v6 = FCGroupTypeFeature;
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"f7"]) {
    goto LABEL_6;
  }
  if ([v4 hasPrefix:@"f8"])
  {
    uint64_t v5 = (uint64_t)-[FCTodayWidgetSectionIDFeature initWithPersonalizationIdentifier:]([FCTodayWidgetSectionIDFeature alloc], v4);
    goto LABEL_18;
  }
  if ([v4 hasPrefix:@"f9"])
  {
    v6 = FCPublisherVideoContentFeature;
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"fa0"])
  {
    v6 = FCArticleLengthFeature;
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"fa1"])
  {
    v6 = FCAdCategoryFeature;
    goto LABEL_17;
  }
  if (v4 && (a3 & 1) != 0)
  {
    uint64_t v5 = (uint64_t)-[FCPersonalizationFeature initWithIdentifier:]([FCPersonalizationFeature alloc], v4);
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = (void *)[[NSString alloc] initWithFormat:@"The identifier %@ didn't map to any headline features", v4];
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "+[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]";
    __int16 v13 = 2080;
    uint64_t v14 = "FCPersonalizationFeature.m";
    __int16 v15 = 1024;
    int v16 = 330;
    __int16 v17 = 2114;
    char v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v9 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = (const char *)v4;
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, "The identifier %{public}@ didn't map to any headline features", buf, 0xCu);
  }
  v7 = 0;
LABEL_19:

  return v7;
}

- (void)initWithIdentifier:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier");
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = "-[FCPersonalizationFeature initWithIdentifier:]";
      __int16 v12 = 2080;
      __int16 v13 = "FCPersonalizationFeature.m";
      __int16 v14 = 1024;
      int v15 = 357;
      __int16 v16 = 2114;
      __int16 v17 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v9.receiver = a1;
    v9.super_class = (Class)FCPersonalizationFeature;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v5 = [v4 copy];
      v6 = (void *)a1[2];
      a1[2] = v5;
    }
  }

  return a1;
}

+ (id)featureForFreeValuedIdentifier:(id)a3
{
  return +[FCPersonalizationFeature featureForIdentifier:allowFreeValued:]((uint64_t)a1, a3, 1);
}

+ (id)featureObserver
{
  return 0;
}

- (FCPersonalizationFeature)init
{
  return (FCPersonalizationFeature *)-[FCPersonalizationFeature initWithIdentifier:](self, &stru_1EF8299B8);
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(FCPersonalizationFeature *)self personalizationIdentifier];
  v7 = [v3 stringWithFormat:@"FCPersonalizationFeature with type %@ and personalizationIdentifier %@", v5, v6];

  return v7;
}

- (double)featureWeightWithConfigurableValues:(id)a3 publisherID:(id)a4
{
  return 1.0;
}

- (BOOL)shouldBeBoosted
{
  return self->_shouldBeBoosted;
}

- (void)setShouldBeBoosted:(BOOL)a3
{
  self->_shouldBeBoosted = a3;
}

- (NSString)personalizationIdentifier
{
  return self->_personalizationIdentifier;
}

- (NSString)fc_description
{
  return self->_fc_description;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_fc_description, 0);
  objc_storeStrong((id *)&self->_personalizationIdentifier, 0);
}

- (unint64_t)hash
{
  id v2 = [(FCPersonalizationFeature *)self personalizationIdentifier];
  return [(NSString *)v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = [(FCPersonalizationFeature *)self personalizationIdentifier];
  uint64_t v5 = [a3 personalizationIdentifier];
  return [(NSString *)v4 isEqual:v5];
}

@end