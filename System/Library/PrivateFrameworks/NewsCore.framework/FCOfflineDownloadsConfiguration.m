@interface FCOfflineDownloadsConfiguration
- (BOOL)useSmallestArticleImages;
- (BOOL)useSmallestArticleThumbnails;
- (BOOL)useSmallestPuzzleThumbnails;
- (FCOfflineDownloadsConfiguration)initWithDictionary:(id)a3 optimized:(BOOL)a4;
- (FCOfflineFeedRules)audioFeedRules;
- (FCOfflineFeedRules)historyFeedRules;
- (FCOfflineFeedRules)magazineFeedRules;
- (FCOfflineFeedRules)puzzleHubFeedRules;
- (FCOfflineFeedRules)puzzleTypeFeedRules;
- (FCOfflineFeedRules)savedFeedRules;
- (FCOfflineFeedRules)sharedWithYouFeedRules;
- (FCOfflineFeedRules)sportsFeedRules;
- (FCOfflineFeedRules)todayFeedRules;
- (int64_t)maxArticleDownloads;
- (int64_t)maxAudioDownloads;
- (int64_t)maxDownloadStorage;
- (int64_t)maxImagesPerArticle;
- (int64_t)maxIssueDownloads;
- (int64_t)maxPuzzleDownloads;
- (int64_t)minDeviceStorage;
@end

@implementation FCOfflineDownloadsConfiguration

- (FCOfflineDownloadsConfiguration)initWithDictionary:(id)a3 optimized:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)FCOfflineDownloadsConfiguration;
  v7 = [(FCOfflineDownloadsConfiguration *)&v57 init];
  if (v7)
  {
    v7->_minDeviceStorage = FCAppConfigurationIntegerValue(v6, @"minDeviceStorage", 1000000000);
    if (v4) {
      uint64_t v8 = 2000000000;
    }
    else {
      uint64_t v8 = 5000000000;
    }
    if (v4) {
      uint64_t v9 = 100;
    }
    else {
      uint64_t v9 = 250;
    }
    if (v4) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 10;
    }
    if (v4) {
      uint64_t v11 = 50;
    }
    else {
      uint64_t v11 = 250;
    }
    if (v4) {
      uint64_t v12 = 10;
    }
    else {
      uint64_t v12 = 25;
    }
    if (v4) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFLL;
    }
    if (v4) {
      uint64_t v14 = 25;
    }
    else {
      uint64_t v14 = 50;
    }
    if (v4) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 5;
    }
    if (v4) {
      uint64_t v16 = 10;
    }
    else {
      uint64_t v16 = 20;
    }
    uint64_t v17 = 15;
    if (v4) {
      uint64_t v17 = 10;
    }
    uint64_t v55 = v16;
    uint64_t v56 = v17;
    v7->_maxDownloadStorage = FCAppConfigurationIntegerValue(v6, @"maxDownloadStorage", v8);
    v7->_maxArticleDownloads = FCAppConfigurationIntegerValue(v6, @"maxArticleDownloads", v9);
    v7->_maxIssueDownloads = FCAppConfigurationIntegerValue(v6, @"maxIssueDownloads", v10);
    v7->_maxPuzzleDownloads = FCAppConfigurationIntegerValue(v6, @"maxPuzzleDownloads", v11);
    v7->_maxAudioDownloads = FCAppConfigurationIntegerValue(v6, @"maxAudioDownloads", v12);
    v7->_maxImagesPerArticle = FCAppConfigurationIntegerValue(v6, @"maxImagesPerArticle", v13);
    v7->_useSmallestArticleThumbnails = FCAppConfigurationBoolValue(v6, @"useSmallestArticleThumbnails", v4);
    v7->_useSmallestPuzzleThumbnails = FCAppConfigurationBoolValue(v6, @"useSmallestPuzzleThumbnails", v4);
    v7->_useSmallestArticleImages = FCAppConfigurationBoolValue(v6, @"useSmallestArticleImages", v4);
    v18 = [FCOfflineFeedRules alloc];
    v19 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"todayFeed", 0);
    uint64_t v20 = [(FCOfflineFeedRules *)v18 initWithDictionary:v19 defaultMaxGroups:20 defaultMaxArticleDownloads:v14 defaultMaxIssueDownloads:1 defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:v15];
    todayFeedRules = v7->_todayFeedRules;
    v7->_todayFeedRules = (FCOfflineFeedRules *)v20;

    v22 = [FCOfflineFeedRules alloc];
    v23 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"puzzleHubFeed", 0);
    uint64_t v24 = [(FCOfflineFeedRules *)v22 initWithDictionary:v23 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:0x7FFFFFFFLL defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0x7FFFFFFFLL];
    puzzleHubFeedRules = v7->_puzzleHubFeedRules;
    v7->_puzzleHubFeedRules = (FCOfflineFeedRules *)v24;

    v26 = [FCOfflineFeedRules alloc];
    v27 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"puzzleFeed", 0);
    uint64_t v28 = [(FCOfflineFeedRules *)v26 initWithDictionary:v27 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:0x7FFFFFFFLL defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0x7FFFFFFFLL];
    puzzleTypeFeedRules = v7->_puzzleTypeFeedRules;
    v7->_puzzleTypeFeedRules = (FCOfflineFeedRules *)v28;

    v30 = [FCOfflineFeedRules alloc];
    v31 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"sportsFeed", 0);
    uint64_t v32 = [(FCOfflineFeedRules *)v30 initWithDictionary:v31 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v55 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0x7FFFFFFFLL];
    sportsFeedRules = v7->_sportsFeedRules;
    v7->_sportsFeedRules = (FCOfflineFeedRules *)v32;

    v34 = [FCOfflineFeedRules alloc];
    v35 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"magazineFeed", 0);
    uint64_t v36 = [(FCOfflineFeedRules *)v34 initWithDictionary:v35 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v55 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0x7FFFFFFFLL];
    magazineFeedRules = v7->_magazineFeedRules;
    v7->_magazineFeedRules = (FCOfflineFeedRules *)v36;

    v38 = [FCOfflineFeedRules alloc];
    v39 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"audioFeed", 0);
    uint64_t v40 = [(FCOfflineFeedRules *)v38 initWithDictionary:v39 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v56 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:v56];
    audioFeedRules = v7->_audioFeedRules;
    v7->_audioFeedRules = (FCOfflineFeedRules *)v40;

    v42 = [FCOfflineFeedRules alloc];
    v43 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"savedFeed", 0);
    uint64_t v44 = [(FCOfflineFeedRules *)v42 initWithDictionary:v43 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v14 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0];
    savedFeedRules = v7->_savedFeedRules;
    v7->_savedFeedRules = (FCOfflineFeedRules *)v44;

    v46 = [FCOfflineFeedRules alloc];
    v47 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"historyFeed", 0);
    uint64_t v48 = [(FCOfflineFeedRules *)v46 initWithDictionary:v47 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v14 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0];
    historyFeedRules = v7->_historyFeedRules;
    v7->_historyFeedRules = (FCOfflineFeedRules *)v48;

    v50 = [FCOfflineFeedRules alloc];
    v51 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"sharedWithYouFeed", 0);
    uint64_t v52 = [(FCOfflineFeedRules *)v50 initWithDictionary:v51 defaultMaxGroups:0x7FFFFFFFLL defaultMaxArticleDownloads:v10 defaultMaxIssueDownloads:0x7FFFFFFFLL defaultMaxPuzzleDownloads:0x7FFFFFFFLL defaultMaxAudioDownloads:0];
    sharedWithYouFeedRules = v7->_sharedWithYouFeedRules;
    v7->_sharedWithYouFeedRules = (FCOfflineFeedRules *)v52;
  }
  return v7;
}

- (FCOfflineFeedRules)todayFeedRules
{
  return self->_todayFeedRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWithYouFeedRules, 0);
  objc_storeStrong((id *)&self->_historyFeedRules, 0);
  objc_storeStrong((id *)&self->_savedFeedRules, 0);
  objc_storeStrong((id *)&self->_audioFeedRules, 0);
  objc_storeStrong((id *)&self->_magazineFeedRules, 0);
  objc_storeStrong((id *)&self->_sportsFeedRules, 0);
  objc_storeStrong((id *)&self->_puzzleTypeFeedRules, 0);
  objc_storeStrong((id *)&self->_puzzleHubFeedRules, 0);
  objc_storeStrong((id *)&self->_todayFeedRules, 0);
}

- (int64_t)minDeviceStorage
{
  return self->_minDeviceStorage;
}

- (int64_t)maxDownloadStorage
{
  return self->_maxDownloadStorage;
}

- (int64_t)maxArticleDownloads
{
  return self->_maxArticleDownloads;
}

- (int64_t)maxIssueDownloads
{
  return self->_maxIssueDownloads;
}

- (int64_t)maxPuzzleDownloads
{
  return self->_maxPuzzleDownloads;
}

- (int64_t)maxAudioDownloads
{
  return self->_maxAudioDownloads;
}

- (int64_t)maxImagesPerArticle
{
  return self->_maxImagesPerArticle;
}

- (BOOL)useSmallestArticleThumbnails
{
  return self->_useSmallestArticleThumbnails;
}

- (BOOL)useSmallestPuzzleThumbnails
{
  return self->_useSmallestPuzzleThumbnails;
}

- (BOOL)useSmallestArticleImages
{
  return self->_useSmallestArticleImages;
}

- (FCOfflineFeedRules)puzzleHubFeedRules
{
  return self->_puzzleHubFeedRules;
}

- (FCOfflineFeedRules)puzzleTypeFeedRules
{
  return self->_puzzleTypeFeedRules;
}

- (FCOfflineFeedRules)sportsFeedRules
{
  return self->_sportsFeedRules;
}

- (FCOfflineFeedRules)magazineFeedRules
{
  return self->_magazineFeedRules;
}

- (FCOfflineFeedRules)audioFeedRules
{
  return self->_audioFeedRules;
}

- (FCOfflineFeedRules)savedFeedRules
{
  return self->_savedFeedRules;
}

- (FCOfflineFeedRules)historyFeedRules
{
  return self->_historyFeedRules;
}

- (FCOfflineFeedRules)sharedWithYouFeedRules
{
  return self->_sharedWithYouFeedRules;
}

@end