@interface CREngineAccurateResult
- (CRRecognizedTextRegion)titleRegion;
- (NSArray)blocks;
- (NSArray)cachedLines;
- (NSArray)lines;
- (int64_t)filteredFeatureCount;
- (void)setBlocks:(id)a3;
- (void)setCachedLines:(id)a3;
- (void)setFilteredFeatureCount:(int64_t)a3;
- (void)setTitleRegion:(id)a3;
@end

@implementation CREngineAccurateResult

- (NSArray)lines
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(CREngineAccurateResult *)self cachedLines];

  if (!v3)
  {
    v4 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(CREngineAccurateResult *)self blocks];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) subregions];
          [v4 addObjectsFromArray:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    [(CREngineAccurateResult *)self setCachedLines:v4];
  }
  v10 = [(CREngineAccurateResult *)self cachedLines];
  return (NSArray *)v10;
}

- (NSArray)blocks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBlocks:(id)a3
{
}

- (CRRecognizedTextRegion)titleRegion
{
  return (CRRecognizedTextRegion *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitleRegion:(id)a3
{
}

- (int64_t)filteredFeatureCount
{
  return self->_filteredFeatureCount;
}

- (void)setFilteredFeatureCount:(int64_t)a3
{
  self->_filteredFeatureCount = a3;
}

- (NSArray)cachedLines
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLines, 0);
  objc_storeStrong((id *)&self->_titleRegion, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end