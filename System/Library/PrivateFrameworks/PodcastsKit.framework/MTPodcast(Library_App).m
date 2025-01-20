@interface MTPodcast(Library_App)
+ (void)setRemovePlayedDownloadsSetting:()Library_App forPodcastUuid:;
- (id)prepareForDeletion;
- (uint64_t)countOfNewEpisodes;
- (uint64_t)countOfUnplayedEpisodes;
- (uint64_t)countOfUnplayedRssEpisodes;
- (void)_updateChannelRelationship:()Library_App deassociate:;
- (void)setChannel:()Library_App;
- (void)setSubscribed:()Library_App;
- (void)setTitle:()Library_App;
- (void)setUpdatedFeedURL:()Library_App;
- (void)updateEpisodesMetadataIdentifiers;
@end

@implementation MTPodcast(Library_App)

- (void)setTitle:()Library_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 title];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    v6 = [a1 title];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5ED10];
      [a1 willChangeValueForKey:*MEMORY[0x263F5ED10]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
      [a1 updateEpisodesMetadataIdentifiers];
    }
  }
}

- (void)setUpdatedFeedURL:()Library_App
{
  uint64_t v4 = *MEMORY[0x263F5ED30];
  id v5 = a3;
  [a1 willChangeValueForKey:v4];
  [a1 setPrimitiveValue:v5 forKey:v4];

  [a1 didChangeValueForKey:v4];
  [a1 updateEpisodesMetadataIdentifiers];
  id v6 = [MEMORY[0x263F5EA48] shared];
  objc_msgSend(v6, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));
}

- (void)setSubscribed:()Library_App
{
  if ([a1 subscribed] != a3)
  {
    uint64_t v5 = *MEMORY[0x263F5ED08];
    [a1 willChangeValueForKey:*MEMORY[0x263F5ED08]];
    id v6 = [NSNumber numberWithBool:a3];
    [a1 setPrimitiveValue:v6 forKey:v5];

    [a1 didChangeValueForKey:v5];
    id v7 = [MEMORY[0x263F5EA48] shared];
    objc_msgSend(v7, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));
  }
}

- (void)setChannel:()Library_App
{
  id v8 = a3;
  uint64_t v4 = [a1 channel];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [a1 channel];
    uint64_t v7 = *MEMORY[0x263F5EC60];
    [a1 willChangeValueForKey:*MEMORY[0x263F5EC60]];
    [a1 setPrimitiveValue:v8 forKey:v7];
    [a1 didChangeValueForKey:v7];
    objc_msgSend(a1, "setChannelStoreId:", objc_msgSend(v8, "storeId"));
    [a1 _updateChannelRelationship:v6 deassociate:1];
    [a1 _updateChannelRelationship:v8 deassociate:0];
  }
}

- (void)_updateChannelRelationship:()Library_App deassociate:
{
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [v6 podcastUuids];
    id v10 = (id)[v7 mutableCopy];

    uint64_t v8 = (uint64_t)v10;
    if (!v10) {
      uint64_t v8 = objc_opt_new();
    }
    id v11 = (id)v8;
    unint64_t v9 = [a1 uuid];
    if (a4) {
      [v11 removeObject:v9];
    }
    else {
      [v11 addObject:v9];
    }

    [v6 setPodcastUuids:v11];
  }
}

- (void)updateEpisodesMetadataIdentifiers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "episodes", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateUPPIdentifierIfNeeded];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)prepareForDeletion
{
  uint64_t v2 = [a1 channel];
  [a1 _updateChannelRelationship:v2 deassociate:1];

  v4.receiver = a1;
  v4.super_class = (Class)&off_26F2DC630;
  return objc_msgSendSuper2(&v4, sel_prepareForDeletion);
}

+ (void)setRemovePlayedDownloadsSetting:()Library_App forPodcastUuid:
{
  id v5 = a4;
  long long v6 = [MEMORY[0x263F5E9D0] sharedInstance];
  long long v7 = [v6 mainOrPrivateContext];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__MTPodcast_Library_App__setRemovePlayedDownloadsSetting_forPodcastUuid___block_invoke;
  v10[3] = &unk_265055E90;
  id v11 = v7;
  id v12 = v5;
  uint64_t v13 = a3;
  id v8 = v5;
  id v9 = v7;
  [v9 performBlockAndWaitWithSave:v10];
}

- (uint64_t)countOfNewEpisodes
{
  return [NSNumber numberWithInteger:0];
}

- (uint64_t)countOfUnplayedEpisodes
{
  return [NSNumber numberWithInteger:0];
}

- (uint64_t)countOfUnplayedRssEpisodes
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v2 = [a1 managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__MTPodcast_Library_App__countOfUnplayedRssEpisodes__block_invoke;
  v6[3] = &unk_265055BD8;
  v6[4] = a1;
  id v8 = &v9;
  id v3 = v2;
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  uint64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

@end