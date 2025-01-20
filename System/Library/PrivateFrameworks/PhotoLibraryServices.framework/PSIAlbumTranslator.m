@interface PSIAlbumTranslator
+ (id)_psiAssetForAlbum:(id)a3 calendar:(id)a4;
+ (id)psiCollectionFromAlbum:(id)a3 indexingContext:(id)a4;
@end

@implementation PSIAlbumTranslator

+ (id)_psiAssetForAlbum:(id)a3 calendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 keyAssets];
  v8 = [v7 firstObject];

  if (!v8)
  {
    v9 = [v5 assets];
    v8 = [v9 firstObject];
  }
  v10 = [v8 uuid];
  v11 = [v8 dateCreated];
  if ([v10 length] || v11)
  {
    v13 = [[PSIDate alloc] initWithUniversalDate:v11 calendar:v6];
    v12 = [[PSIAsset alloc] initWithUUID:v10 creationDate:v13];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)psiCollectionFromAlbum:(id)a3 indexingContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 uuid];
  char valid = PLIsValidUUIDString();

  if (valid)
  {
    v10 = [v7 calendar];
    v11 = [a1 _psiAssetForAlbum:v6 calendar:v10];
    if (v11)
    {
      id v30 = v7;
      v12 = [PSIDate alloc];
      v13 = [v6 startDate];
      v29 = [(PSIDate *)v12 initWithUniversalDate:v13 calendar:v10];

      v14 = [PSIDate alloc];
      v15 = [v6 endDate];
      v16 = [(PSIDate *)v14 initWithUniversalDate:v15 calendar:v10];

      v17 = [PSICollection alloc];
      v18 = [v6 uuid];
      v19 = [v6 title];
      v20 = [v6 assets];
      uint64_t v21 = [v20 count];
      v22 = [v6 startDate];
      v23 = [(PSICollection *)v17 initWithUUID:v18 startDate:v29 endDate:v16 title:v19 subtitle:0 keyAssetPrivate:v11 keyAssetShared:0 type:3 assetsCountPrivate:v21 assetsCountShared:0 sortDate:v22];

      v24 = [v6 title];
      [(PSIObject *)v23 addContentString:v24 category:1400 owningCategory:0];

      id v7 = v30;
    }
    else
    {
      v26 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v6 uuid];
        *(_DWORD *)buf = 138412290;
        v32 = v27;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "No key asset found for Album. Not translating Album: %@", buf, 0xCu);
      }
      v23 = 0;
    }
  }
  else
  {
    v10 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v25 = [v6 uuid];
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Invalid Album UUID: %{public}@. Not inserting Album into PSI.", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

@end