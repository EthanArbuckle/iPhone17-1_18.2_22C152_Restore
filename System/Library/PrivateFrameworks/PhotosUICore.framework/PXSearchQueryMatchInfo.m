@interface PXSearchQueryMatchInfo
- (BOOL)isEqual:(id)a3;
- (NSArray)ocrAssetUUIDs;
- (NSArray)ocrTexts;
- (NSSet)audioIdentifiers;
- (NSSet)humanActionIdentifiers;
- (NSSet)personLocalIdentifiers;
- (NSSet)sceneIdentifiers;
- (NSString)identifier;
- (NSString)localizedQueryString;
- (PXSearchQueryMatchInfo)initWithLocalizedQueryString:(id)a3 matchedSceneIdentifiers:(id)a4 personLocalIdentifiers:(id)a5 audioIdentifiers:(id)a6 humanActionIdentifiers:(id)a7 ocrTexts:(id)a8 ocrAssetUUIDS:(id)a9 queryEmbedding:(id)a10 countOfQueryTerms:(unint64_t)a11;
- (_CSEmbedding)queryEmbedding;
- (id)description;
- (unint64_t)countOfQueryTerms;
- (unint64_t)hash;
@end

@implementation PXSearchQueryMatchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_ocrAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_ocrTexts, 0);
  objc_storeStrong((id *)&self->_humanActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_audioIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_localizedQueryString, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)countOfQueryTerms
{
  return self->_countOfQueryTerms;
}

- (_CSEmbedding)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSArray)ocrAssetUUIDs
{
  return self->_ocrAssetUUIDs;
}

- (NSArray)ocrTexts
{
  return self->_ocrTexts;
}

- (NSSet)humanActionIdentifiers
{
  return self->_humanActionIdentifiers;
}

- (NSSet)audioIdentifiers
{
  return self->_audioIdentifiers;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (NSSet)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (NSString)localizedQueryString
{
  return self->_localizedQueryString;
}

- (unint64_t)hash
{
  v2 = [(PXSearchQueryMatchInfo *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXSearchQueryMatchInfo *)self identifier];
    v7 = [v5 identifier];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  [v3 appendFormat:@"identifier: %@\n", self->_identifier];
  [v3 appendFormat:@"query: %@\n", self->_localizedQueryString];
  [v3 appendFormat:@"sceneIdentifiers: %@\n", self->_sceneIdentifiers];
  [v3 appendFormat:@"personLocalIdentifiers: %@\n", self->_personLocalIdentifiers];
  [v3 appendFormat:@"ocrTexts: %@\n", self->_ocrTexts];
  [v3 appendFormat:@"ocrAssetUUIDs: %@\n", self->_ocrAssetUUIDs];
  [v3 appendFormat:@"humanAction: %@\n", self->_humanActionIdentifiers];
  [v3 appendFormat:@"audio: %@\n", self->_audioIdentifiers];
  [v3 appendFormat:@"embedding: %@\n", self->_queryEmbedding];
  objc_msgSend(v3, "appendFormat:", @"countOfQueryTerms: %ld\n", self->_countOfQueryTerms);
  return v3;
}

- (PXSearchQueryMatchInfo)initWithLocalizedQueryString:(id)a3 matchedSceneIdentifiers:(id)a4 personLocalIdentifiers:(id)a5 audioIdentifiers:(id)a6 humanActionIdentifiers:(id)a7 ocrTexts:(id)a8 ocrAssetUUIDS:(id)a9 queryEmbedding:(id)a10 countOfQueryTerms:(unint64_t)a11
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v47 = a8;
  id v22 = a9;
  id v23 = a10;
  v48.receiver = self;
  v48.super_class = (Class)PXSearchQueryMatchInfo;
  v24 = [(PXSearchQueryMatchInfo *)&v48 init];
  if (v24)
  {
    v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v26;

    uint64_t v28 = [v17 copy];
    localizedQueryString = v24->_localizedQueryString;
    v24->_localizedQueryString = (NSString *)v28;

    uint64_t v30 = [v18 copy];
    sceneIdentifiers = v24->_sceneIdentifiers;
    v24->_sceneIdentifiers = (NSSet *)v30;

    uint64_t v32 = [v20 copy];
    audioIdentifiers = v24->_audioIdentifiers;
    v24->_audioIdentifiers = (NSSet *)v32;

    uint64_t v34 = [v21 copy];
    humanActionIdentifiers = v24->_humanActionIdentifiers;
    v24->_humanActionIdentifiers = (NSSet *)v34;

    uint64_t v36 = [v19 copy];
    personLocalIdentifiers = v24->_personLocalIdentifiers;
    v24->_personLocalIdentifiers = (NSSet *)v36;

    uint64_t v38 = [v22 copy];
    ocrAssetUUIDs = v24->_ocrAssetUUIDs;
    v24->_ocrAssetUUIDs = (NSArray *)v38;

    objc_storeStrong((id *)&v24->_queryEmbedding, a10);
    v24->_countOfQueryTerms = a11;
    v40 = +[PXSearchSettings sharedInstance];
    v41 = [v40 overrideMatchedQueryText];

    if ([v41 length])
    {
      v51[0] = v41;
      uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      ocrTexts = v24->_ocrTexts;
      v24->_ocrTexts = (NSArray *)v42;

      p_super = PLSearchUIQueryGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v41;
        _os_log_impl(&dword_1A9AE7000, p_super, OS_LOG_TYPE_DEFAULT, "⚠️ overrideMatchedQueryText is set. Using the overridden value (%@) instead of the matched query strings.", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v45 = [v47 copy];
      p_super = &v24->_ocrTexts->super;
      v24->_ocrTexts = (NSArray *)v45;
    }
  }
  return v24;
}

@end