@interface PGMusicGenreDistributionComputer
- (BOOL)useTaggedGenres;
- (PGMusicGenreDistributionComputer)init;
- (id)musicGenreDistributionForGenres:(id)a3;
- (void)setUseTaggedGenres:(BOOL)a3;
@end

@implementation PGMusicGenreDistributionComputer

- (void)setUseTaggedGenres:(BOOL)a3
{
  self->_useTaggedGenres = a3;
}

- (BOOL)useTaggedGenres
{
  return self->_useTaggedGenres;
}

- (id)musicGenreDistributionForGenres:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28BD0] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) name];
        v12 = v11;
        if (v11 && [v11 length])
        {
          if (self->_useTaggedGenres)
          {
            v13 = [MEMORY[0x1E4F76DB8] taggedGenreForGenre:v12 isExactMatch:0];
            if (v13) {
              [v5 addObject:v13];
            }
          }
          else
          {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  unint64_t v14 = objc_msgSend(v5, "pg_accumulatedCount");
  v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    double v20 = (double)v14;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        unint64_t v23 = objc_msgSend(v16, "countForObject:", v22, (void)v26);
        v24 = [NSNumber numberWithDouble:(double)v23 / v20];
        [v15 setObject:v24 forKeyedSubscript:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }

  return v15;
}

- (PGMusicGenreDistributionComputer)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGMusicGenreDistributionComputer;
  result = [(PGMusicGenreDistributionComputer *)&v3 init];
  if (result) {
    result->_useTaggedGenres = 1;
  }
  return result;
}

@end