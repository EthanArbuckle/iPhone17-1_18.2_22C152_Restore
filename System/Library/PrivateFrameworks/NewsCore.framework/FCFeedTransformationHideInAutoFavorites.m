@interface FCFeedTransformationHideInAutoFavorites
+ (id)transformationWithFeedContextByFeedID:(id)a3 autoFavoriteTagIDs:(id)a4;
- (NSDictionary)feedContextByFeedID;
- (NSSet)autoFavoriteTagIDs;
- (id)transformFeedItems:(id)a3;
- (void)setAutoFavoriteTagIDs:(id)a3;
- (void)setFeedContextByFeedID:(id)a3;
@end

@implementation FCFeedTransformationHideInAutoFavorites

+ (id)transformationWithFeedContextByFeedID:(id)a3 autoFavoriteTagIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setFeedContextByFeedID:v6];

  [v7 setAutoFavoriteTagIDs:v5];
  return v7;
}

- (id)transformFeedItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__FCFeedTransformationHideInAutoFavorites_transformFeedItems___block_invoke;
  v5[3] = &unk_1E5B4C958;
  v5[4] = self;
  v3 = objc_msgSend(a3, "fc_arrayOfObjectsPassingTest:", v5);
  return v3;
}

uint64_t __62__FCFeedTransformationHideInAutoFavorites_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 isHiddenFromAutoFavorites]) {
    goto LABEL_8;
  }
  v4 = [*(id *)(a1 + 32) feedContextByFeedID];
  id v5 = [v3 feedID];
  id v6 = objc_msgSend(v4, "fc_safeObjectForKey:", v5);

  v7 = [v6 topicID];
  if (!v7)
  {
    v7 = [v6 channelID];
    if (!v7)
    {
      v7 = [v3 sourceFeedID];
      if (!v7)
      {

        goto LABEL_8;
      }
    }
  }
  v8 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  char v9 = [v8 containsObject:v7];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (NSDictionary)feedContextByFeedID
{
  return self->_feedContextByFeedID;
}

- (void)setFeedContextByFeedID:(id)a3
{
}

- (NSSet)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_feedContextByFeedID, 0);
}

@end