@interface WLKBrowseItem
+ (id)browseItemsWithDictionaries:(id)a3 context:(id)a4;
- (BOOL)isWatchlistable;
- (BOOL)isWatchlisted;
- (NSArray)playables;
- (WLKBasicContentMetadata)content;
- (WLKBrowseItem)currentEpisode;
- (WLKBrowseItem)initWithDictionary:(id)a3 context:(id)a4;
- (WLKComingSoonInfo)contentComingSoonInfo;
- (id)preferredComingSoonInfo;
- (void)setContentComingSoonInfo:(id)a3;
@end

@implementation WLKBrowseItem

+ (id)browseItemsWithDictionaries:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1BA9E92A0](v9);
        v15 = [WLKBrowseItem alloc];
        v16 = -[WLKBrowseItem initWithDictionary:context:](v15, "initWithDictionary:context:", v13, v6, (void)v20);
        if (v16) {
          [v7 addObject:v16];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  if ([v7 count]) {
    v17 = v7;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  return v18;
}

- (WLKBrowseItem)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)WLKBrowseItem;
    id v8 = [(WLKBrowseItem *)&v24 init];
    if (v8)
    {
      uint64_t v9 = [[WLKBasicContentMetadata alloc] initWithDictionary:v6];
      content = v8->_content;
      v8->_content = v9;

      uint64_t v11 = objc_msgSend(v6, "wlk_arrayForKey:", @"playables");
      if (v11)
      {
        uint64_t v12 = +[WLKPlayable playablesWithDictionaries:v11 context:v7];
        playables = v8->_playables;
        v8->_playables = (NSArray *)v12;
      }
      v14 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"currentEpisode");
      if (v14)
      {
        v15 = [[WLKBrowseItem alloc] initWithDictionary:v14 context:v7];
        currentEpisode = v8->_currentEpisode;
        v8->_currentEpisode = v15;
      }
      v8->_watchlisted = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"isWatchlisted", 0);
      v8->_watchlistable = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"isWatchlistable", 0);
      v17 = objc_msgSend(v6, "wlk_arrayForKey:", @"availableChannels");
      id v18 = +[WLKComingSoonInfo comingSoonItemsWithDictionaries:v17];
      v19 = v18;
      if (v18)
      {
        uint64_t v20 = [v18 firstObject];
        contentComingSoonInfo = v8->_contentComingSoonInfo;
        v8->_contentComingSoonInfo = (WLKComingSoonInfo *)v20;
      }
    }
    self = v8;
    long long v22 = self;
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (id)preferredComingSoonInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  contentComingSoonInfo = self->_contentComingSoonInfo;
  if (contentComingSoonInfo)
  {
    v3 = contentComingSoonInfo;
  }
  else
  {
    id v5 = [(WLKBrowseItem *)self playables];
    if (![v5 count])
    {
      id v6 = [(WLKBrowseItem *)self currentEpisode];
      uint64_t v7 = [v6 playables];

      id v5 = (void *)v7;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "comingSoonInfo", (void)v15);
          if (v13)
          {
            v3 = (WLKComingSoonInfo *)v13;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    v3 = 0;
LABEL_15:
  }

  return v3;
}

- (WLKBasicContentMetadata)content
{
  return self->_content;
}

- (WLKBrowseItem)currentEpisode
{
  return self->_currentEpisode;
}

- (NSArray)playables
{
  return self->_playables;
}

- (BOOL)isWatchlisted
{
  return self->_watchlisted;
}

- (BOOL)isWatchlistable
{
  return self->_watchlistable;
}

- (WLKComingSoonInfo)contentComingSoonInfo
{
  return self->_contentComingSoonInfo;
}

- (void)setContentComingSoonInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentComingSoonInfo, 0);
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_currentEpisode, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end