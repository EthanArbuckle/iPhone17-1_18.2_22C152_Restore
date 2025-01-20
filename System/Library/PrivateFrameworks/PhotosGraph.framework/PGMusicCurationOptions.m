@interface PGMusicCurationOptions
- (BOOL)includeChillMixInMusicForYou;
- (BOOL)includeGetUpMixInMusicForYou;
- (BOOL)shouldCurateUpNextMemories;
- (BOOL)shouldForceShareableInBestSuggestions;
- (BOOL)shouldRefreshSongMetadata;
- (BOOL)shouldUseSpecificationOptionsForCuration;
- (BOOL)useMemoryCreationMusicCuratorConfiguration;
- (BOOL)useOnlyMusicForTopicInTopPickSuggestions;
- (NSArray)recentlyUsedBundledSongIDs;
- (NSArray)recentlyUsedSongAdamIDs;
- (NSDictionary)topicKeywordsAndWeights;
- (NSString)assetCollectionLocalIdentifier;
- (NSString)backingCollectionLocalIdentifier;
- (NSString)rootMemoryLocalIdentifier;
- (PGMusicCurationOptions)init;
- (PGMusicCurationOptions)initWithOptionsDictionary:(id)a3;
- (PGMusicCurationSpecificationOptions)musicCurationSpecificationOptions;
- (id)_init;
- (id)copyWithAssetCollectionLocalIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMemoryEnrichment;
- (id)initForUpNextMemoryRequestWithOptionsDictionary:(id)a3;
- (unint64_t)suggestedMood;
@end

@implementation PGMusicCurationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_musicCurationSpecificationOptions, 0);
  objc_storeStrong((id *)&self->_topicKeywordsAndWeights, 0);
  objc_storeStrong((id *)&self->_rootMemoryLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_recentlyUsedBundledSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedSongAdamIDs, 0);
}

- (BOOL)useMemoryCreationMusicCuratorConfiguration
{
  return self->_useMemoryCreationMusicCuratorConfiguration;
}

- (NSString)backingCollectionLocalIdentifier
{
  return self->_backingCollectionLocalIdentifier;
}

- (NSString)assetCollectionLocalIdentifier
{
  return self->_assetCollectionLocalIdentifier;
}

- (PGMusicCurationSpecificationOptions)musicCurationSpecificationOptions
{
  return self->_musicCurationSpecificationOptions;
}

- (unint64_t)suggestedMood
{
  return self->_suggestedMood;
}

- (NSDictionary)topicKeywordsAndWeights
{
  return self->_topicKeywordsAndWeights;
}

- (NSString)rootMemoryLocalIdentifier
{
  return self->_rootMemoryLocalIdentifier;
}

- (BOOL)shouldUseSpecificationOptionsForCuration
{
  return self->_shouldUseSpecificationOptionsForCuration;
}

- (BOOL)shouldCurateUpNextMemories
{
  return self->_shouldCurateUpNextMemories;
}

- (BOOL)shouldForceShareableInBestSuggestions
{
  return self->_shouldForceShareableInBestSuggestions;
}

- (BOOL)shouldRefreshSongMetadata
{
  return self->_shouldRefreshSongMetadata;
}

- (BOOL)includeGetUpMixInMusicForYou
{
  return self->_includeGetUpMixInMusicForYou;
}

- (BOOL)includeChillMixInMusicForYou
{
  return self->_includeChillMixInMusicForYou;
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  return self->_useOnlyMusicForTopicInTopPickSuggestions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[PGMusicCurationOptions alloc] _init];
  v4[6] = self->_suggestedMood;
  uint64_t v5 = [(NSDictionary *)self->_topicKeywordsAndWeights copy];
  v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSString *)self->_rootMemoryLocalIdentifier copy];
  v8 = (void *)v4[4];
  v4[4] = v7;

  *((unsigned char *)v4 + 11) = self->_shouldRefreshSongMetadata;
  uint64_t v9 = [(NSString *)self->_assetCollectionLocalIdentifier copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(NSString *)self->_backingCollectionLocalIdentifier copy];
  v12 = (void *)v4[9];
  v4[9] = v11;

  uint64_t v13 = [(PGMusicCurationSpecificationOptions *)self->_musicCurationSpecificationOptions copy];
  v14 = (void *)v4[7];
  v4[7] = v13;

  *((unsigned char *)v4 + 13) = self->_shouldCurateUpNextMemories;
  uint64_t v15 = [(NSArray *)self->_recentlyUsedSongAdamIDs copy];
  v16 = (void *)v4[2];
  v4[2] = v15;

  uint64_t v17 = [(NSArray *)self->_recentlyUsedBundledSongIDs copy];
  v18 = (void *)v4[3];
  v4[3] = v17;

  *((unsigned char *)v4 + 12) = self->_shouldForceShareableInBestSuggestions;
  *((unsigned char *)v4 + 9) = self->_includeChillMixInMusicForYou;
  *((unsigned char *)v4 + 10) = self->_includeGetUpMixInMusicForYou;
  *((unsigned char *)v4 + 8) = self->_useOnlyMusicForTopicInTopPickSuggestions;
  return v4;
}

- (id)copyWithAssetCollectionLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(PGMusicCurationOptions *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (NSArray)recentlyUsedBundledSongIDs
{
  if (self->_recentlyUsedBundledSongIDs) {
    return self->_recentlyUsedBundledSongIDs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)recentlyUsedSongAdamIDs
{
  if (self->_recentlyUsedSongAdamIDs) {
    return self->_recentlyUsedSongAdamIDs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)initForUpNextMemoryRequestWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PGMusicCurationOptions *)self initWithOptionsDictionary:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_shouldForceShareableInBestSuggestions = 257;
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B188]];
    rootMemoryLocalIdentifier = v6->_rootMemoryLocalIdentifier;
    v6->_rootMemoryLocalIdentifier = (NSString *)v7;
  }
  return v6;
}

- (id)initForMemoryEnrichment
{
  id result = [(PGMusicCurationOptions *)self initWithOptionsDictionary:MEMORY[0x1E4F1CC08]];
  if (result) {
    *(_WORD *)((char *)result + 11) = 257;
  }
  return result;
}

- (PGMusicCurationOptions)initWithOptionsDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PGMusicCurationOptions;
  uint64_t v5 = [(PGMusicCurationOptions *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B038]];
    recentlyUsedSongAdamIDs = v5->_recentlyUsedSongAdamIDs;
    v5->_recentlyUsedSongAdamIDs = (NSArray *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B030]];
    recentlyUsedBundledSongIDs = v5->_recentlyUsedBundledSongIDs;
    v5->_recentlyUsedBundledSongIDs = (NSArray *)v8;

    uint64_t v10 = *MEMORY[0x1E4F8B290];
    uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B290]];
    if (v11)
    {
      v12 = [v4 objectForKeyedSubscript:v10];
      v5->_useOnlyMusicForTopicInTopPickSuggestions = [v12 BOOLValue];
    }
    else
    {
      v5->_useOnlyMusicForTopicInTopPickSuggestions = 0;
    }

    uint64_t v13 = *MEMORY[0x1E4F8B228];
    v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B228]];
    if (v14)
    {
      uint64_t v15 = [v4 objectForKeyedSubscript:v13];
      v5->_includeChillMixInMusicForYou = [v15 BOOLValue];
    }
    else
    {
      v5->_includeChillMixInMusicForYou = 0;
    }

    uint64_t v16 = *MEMORY[0x1E4F8B230];
    uint64_t v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B230]];
    if (v17)
    {
      v18 = [v4 objectForKeyedSubscript:v16];
      v5->_includeGetUpMixInMusicForYou = [v18 BOOLValue];
    }
    else
    {
      v5->_includeGetUpMixInMusicForYou = 0;
    }

    uint64_t v19 = *MEMORY[0x1E4F8AF50];
    v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF50]];
    if (v20)
    {
      v21 = [v4 objectForKeyedSubscript:v19];
      char v22 = [v21 BOOLValue];

      char v23 = v22 ^ 1;
    }
    else
    {
      char v23 = 1;
    }

    v5->_shouldForceShareableInBestSuggestions = v23;
    uint64_t v24 = *MEMORY[0x1E4F8AF60];
    v25 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF60]];
    if (v25)
    {
      v26 = [v4 objectForKeyedSubscript:v24];
      v5->_shouldUseSpecificationOptionsForCuration = [v26 BOOLValue];
    }
    else
    {
      v5->_shouldUseSpecificationOptionsForCuration = 0;
    }

    uint64_t v27 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B130]];
    v28 = (void *)v27;
    v29 = (void *)MEMORY[0x1E4F1CC08];
    if (v27) {
      v30 = (void *)v27;
    }
    else {
      v30 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v5->_topicKeywordsAndWeights, v30);

    v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF58]];
    v5->_suggestedMood = _moodFromMoodAsNumber(v31);
    uint64_t v32 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AF30]];
    v33 = (void *)v32;
    if (v32) {
      v34 = (void *)v32;
    }
    else {
      v34 = v29;
    }
    id v35 = v34;

    v36 = [[PGMusicCurationSpecificationOptions alloc] initWithOptionsDictionary:v35];
    musicCurationSpecificationOptions = v5->_musicCurationSpecificationOptions;
    v5->_musicCurationSpecificationOptions = v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AE58]];
    assetCollectionLocalIdentifier = v5->_assetCollectionLocalIdentifier;
    v5->_assetCollectionLocalIdentifier = (NSString *)v38;

    uint64_t v40 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AE60]];
    backingCollectionLocalIdentifier = v5->_backingCollectionLocalIdentifier;
    v5->_backingCollectionLocalIdentifier = (NSString *)v40;

    uint64_t v42 = *MEMORY[0x1E4F8B1B0];
    v43 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B1B0]];
    if (v43)
    {
      v44 = [v4 objectForKeyedSubscript:v42];
      v5->_useMemoryCreationMusicCuratorConfiguration = [v44 BOOLValue];
    }
    else
    {
      v5->_useMemoryCreationMusicCuratorConfiguration = 0;
    }
  }
  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PGMusicCurationOptions;
  return [(PGMusicCurationOptions *)&v3 init];
}

- (PGMusicCurationOptions)init
{
}

@end