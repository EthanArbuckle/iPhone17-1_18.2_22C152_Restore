@interface FCFeedTransformationOnlySurfacedBy
+ (id)transformationWithTagIDs:(id)a3 feedContextByFeedID:(id)a4;
- (NSDictionary)feedContextByFeedID;
- (NSSet)tagIDs;
- (id)transformFeedItems:(id)a3;
- (void)setFeedContextByFeedID:(id)a3;
- (void)setTagIDs:(id)a3;
@end

@implementation FCFeedTransformationOnlySurfacedBy

+ (id)transformationWithTagIDs:(id)a3 feedContextByFeedID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTagIDs:v6];

  [v7 setFeedContextByFeedID:v5];
  return v7;
}

- (id)transformFeedItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__FCFeedTransformationOnlySurfacedBy_transformFeedItems___block_invoke;
  v5[3] = &unk_1E5B4C958;
  v5[4] = self;
  v3 = objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v5);
  return v3;
}

uint64_t __57__FCFeedTransformationOnlySurfacedBy_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 feedContextByFeedID];
  v7 = [v5 feedID];

  v8 = objc_msgSend(v6, "fc_safeObjectForKey:", v7);

  v9 = [v8 topicID];
  if (v9)
  {
    id v6 = [*(id *)(a1 + 32) tagIDs];
    v7 = [v8 topicID];
    if ([v6 containsObject:v7])
    {
      uint64_t v10 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  v11 = [v8 channelID];
  if (v11)
  {
    v12 = [*(id *)(a1 + 32) tagIDs];
    v2 = [v8 channelID];
    if ([v12 containsObject:v2])
    {
      uint64_t v10 = 1;
LABEL_13:

      goto LABEL_14;
    }
    v20 = v12;
  }
  uint64_t v13 = [v8 sectionID];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [*(id *)(a1 + 32) tagIDs];
    [v8 sectionID];
    v16 = v7;
    v18 = v17 = v6;
    uint64_t v10 = [v15 containsObject:v18];

    id v6 = v17;
    v7 = v16;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v12 = v20;
  if (v11) {
    goto LABEL_13;
  }
LABEL_14:
  if (v9) {
    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

- (NSSet)tagIDs
{
  return self->_tagIDs;
}

- (void)setTagIDs:(id)a3
{
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
}

@end