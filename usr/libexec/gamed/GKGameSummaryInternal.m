@interface GKGameSummaryInternal
- (id)initWithGameSummary:(id)a3;
@end

@implementation GKGameSummaryInternal

- (id)initWithGameSummary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKGameSummaryInternal;
  v5 = [(GKGameSummaryInternal *)&v25 init];
  if (v5)
  {
    v6 = [v4 adamID];
    [(GKGameSummaryInternal *)v5 setAdamID:v6];

    v7 = [v4 bundleID];
    [(GKGameSummaryInternal *)v5 setBundleID:v7];

    id v8 = objc_alloc_init((Class)NSMutableSet);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = [v4 compatiblePlatforms];
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v14 name];
          id v16 = [v15 length];

          if (v16)
          {
            v17 = [v14 name];
            [v8 addObject:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    v18 = [v4 playedAt];
    [(GKGameSummaryInternal *)v5 setPlayedAt:v18];

    [(GKGameSummaryInternal *)v5 setCompatiblePlatforms:v8];
    v19 = [v4 isArcade];
    -[GKGameSummaryInternal setIsArcade:](v5, "setIsArcade:", [v19 BOOLValue]);
  }
  return v5;
}

@end