@interface MRDPlaybackQueueArtworkCache
- (id)debugDescription;
- (id)fittedArtworkDataForContentItem:(id)a3 withRequest:(id)a4;
- (void)_pruneCache;
- (void)addArtworkFromItem:(id)a3 fromRequest:(id)a4;
- (void)clearArtworkForItems:(id)a3;
@end

@implementation MRDPlaybackQueueArtworkCache

- (void)addArtworkFromItem:(id)a3 fromRequest:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = [v22 artworks];
  v8 = [v7 objectForKeyedSubscript:MRContentItemArtworkFormatStandard];
  v9 = [v8 imageData];

  if (v9
    || ([v22 artwork],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 imageData],
        v9 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    cache = self->_cache;
    v12 = [v22 identifier];
    id v13 = [(NSMutableDictionary *)cache objectForKeyedSubscript:v12];

    if (!v13)
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      v14 = self->_cache;
      if (!v14)
      {
        v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v16 = self->_cache;
        self->_cache = v15;

        v14 = self->_cache;
      }
      v17 = [v22 identifier];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v17];
    }
    v18 = [v6 artworkCacheSize];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = +[MRDPlaybackQueueArtworkCacheSize defaultSize];
    }
    v21 = v20;

    [v13 setObject:v9 forKeyedSubscript:v21];
    [(MRDPlaybackQueueArtworkCache *)self _pruneCache];
  }
}

- (id)fittedArtworkDataForContentItem:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cache = self->_cache;
  v9 = [v6 identifier];
  v10 = [(NSMutableDictionary *)cache objectForKeyedSubscript:v9];
  v11 = [v10 allKeys];
  v12 = [v11 sortedArrayUsingComparator:&stru_10041E8D0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v14)
  {
    v30 = 0;
    v16 = v13;
LABEL_18:

    goto LABEL_20;
  }
  id v15 = v14;
  v16 = 0;
  uint64_t v17 = *(void *)v41;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v41 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      objc_msgSend(v7, "artworkWidth", (void)v40);
      double v21 = v20;
      [v19 w];
      if (v21 <= v22 + 20.0)
      {
        [v7 artworkHeight];
        double v24 = v23;
        [v19 h];
        if (v24 <= v25 + 20.0)
        {
          id v26 = v19;

          v16 = v26;
        }
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v15);

  if (v16)
  {
    v27 = self->_cache;
    v28 = [v6 identifier];
    uint64_t v29 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v28];
    v30 = [(id)v29 objectForKeyedSubscript:v16];

    v31 = [v7 artworkCacheSize];
    LOBYTE(v29) = [v16 isEqual:v31];

    if ((v29 & 1) == 0)
    {
      [v7 artworkWidth];
      double v33 = v32;
      [v7 artworkHeight];
      uint64_t v35 = +[MRImageUtilities resizeImageData:forFittingSize:error:](MRImageUtilities, "resizeImageData:forFittingSize:error:", v30, 0, v33, v34);
      v36 = (void *)v35;
      if (v35) {
        v37 = (void *)v35;
      }
      else {
        v37 = v30;
      }
      id v38 = v37;

      v30 = v38;
    }
    goto LABEL_18;
  }
  v30 = 0;
LABEL_20:

  return v30;
}

- (void)clearArtworkForItems:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        cache = self->_cache;
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) identifier];
        [(NSMutableDictionary *)cache setObject:0 forKeyedSubscript:v10];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_pruneCache
{
}

- (id)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p> {\n", objc_opt_class(), self];
  id v4 = [(NSMutableDictionary *)self->_cache mr_formattedDebugDescription];
  [v3 appendFormat:@"  cache = %@\n", v4];

  [v3 appendFormat:@"}"];

  return v3;
}

- (void).cxx_destruct
{
}

@end