@interface PCNativeAsset
- (id)initWithAsset:(id)a3;
@end

@implementation PCNativeAsset

- (id)initWithAsset:(id)a3
{
  id v4 = a3;
  v5 = [(PCNativeAsset *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v4 name];
    [(PCNativeAsset *)v6 setName:v7];

    -[PCNativeAsset setLocation:](v6, "setLocation:", (int)[v4 location]);
    -[PCNativeAsset setAdamID:](v6, "setAdamID:", [v4 adamId]);
    v8 = [v4 treatment];
    [(PCNativeAsset *)v6 setTreatment:v8];

    v9 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = [v4 assetInfos];
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [objc_alloc((Class)PCNativeAssetInfo) initWithAssetInfo:*(void *)(*((void *)&v18 + 1) + 8 * (void)v14)];
          [v9 addObject:v15];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    id v16 = [v9 copy];
    [(PCNativeAsset *)v6 setAssetInformation:v16];
  }
  return v6;
}

@end