@interface SearchHomeDataDownloaderCache
- (BOOL)keyIsValid:(id)a3;
- (GEOMapsSearchHomeResult)cachedResults;
- (SearchHomeDataDownloaderCacheKey)cachedKey;
- (id)objectForKey:(id)a3;
- (void)replaceCachedObject:(id)a3 withKey:(id)a4;
- (void)setCachedKey:(id)a3;
- (void)setCachedResults:(id)a3;
@end

@implementation SearchHomeDataDownloaderCache

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(SearchHomeDataDownloaderCache *)self cachedResults];

  if (v5 && [(SearchHomeDataDownloaderCache *)self keyIsValid:v4])
  {
    v6 = [(SearchHomeDataDownloaderCache *)self cachedResults];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)replaceCachedObject:(id)a3 withKey:(id)a4
{
  v6 = (GEOMapsSearchHomeResult *)a3;
  objc_storeStrong((id *)&self->_cachedKey, a4);
  id v8 = a4;
  cachedResults = self->_cachedResults;
  self->_cachedResults = v6;
}

- (BOOL)keyIsValid:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  double v6 = v5;
  v7 = [(SearchHomeDataDownloaderCache *)self cachedKey];
  [v7 timestamp];
  double v9 = v8;

  v10 = [(SearchHomeDataDownloaderCache *)self cachedKey];
  [v10 mapRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v4 mapRect];
  BOOL v22 = v16 != v21;
  if (v18 != v23) {
    BOOL v22 = 1;
  }
  char v25 = v12 != v19 || v14 != v20 || v22;

  id v26 = [v4 mapType];
  v27 = [(SearchHomeDataDownloaderCache *)self cachedKey];
  id v28 = [v27 mapType];

  v29 = [v4 lprPowerType];
  if (v29)
  {
LABEL_12:
    uint64_t v31 = [v4 lprPowerType];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [(SearchHomeDataDownloaderCache *)self cachedKey];
      uint64_t v34 = [v33 lprPowerType];
      if (v34)
      {
        v35 = (void *)v34;
        [v4 lprPowerType];
        id v45 = v28;
        id v36 = v26;
        v38 = char v37 = v25;
        v39 = [(SearchHomeDataDownloaderCache *)self cachedKey];
        v40 = [v39 lprPowerType];
        BOOL v41 = v38 == v40;

        char v25 = v37;
        id v26 = v36;
        id v28 = v45;

        if (v29) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    BOOL v41 = 0;
    if (v29) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v47 = [(SearchHomeDataDownloaderCache *)self cachedKey];
  uint64_t v30 = [v47 lprPowerType];
  if (v30)
  {
    v46 = (void *)v30;
    goto LABEL_12;
  }
  v46 = 0;
  BOOL v41 = 1;
LABEL_20:

LABEL_21:
  char v42 = (v6 - v9 < 900.0) & ~v25;
  if (v26 != v28) {
    char v42 = 0;
  }
  BOOL v43 = v42 & v41;

  return v43;
}

- (SearchHomeDataDownloaderCacheKey)cachedKey
{
  return self->_cachedKey;
}

- (void)setCachedKey:(id)a3
{
}

- (GEOMapsSearchHomeResult)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResults, 0);

  objc_storeStrong((id *)&self->_cachedKey, 0);
}

@end