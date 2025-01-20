@interface FilterTier
- (NSMutableDictionary)childTiers;
- (SRDownsampleEntry)downsampleEntry;
- (id)entryForQuery:(id)a3;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
- (void)setCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4 forQuery:(id)a5;
- (void)setChildTiers:(id)a3;
- (void)setDownsampleEntry:(id)a3;
@end

@implementation FilterTier

- (id)entryForQuery:(id)a3
{
  id v4 = a3;
  v5 = [(FilterTier *)self keyForChildren:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [(FilterTier *)self childTiers];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7
    || ([v7 entryForQuery:v4], v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
LABEL_4:
    v8 = [(FilterTier *)self downsampleEntry];
  }

  return v8;
}

- (id)keyForChildren:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[FilterTier keyForChildren:]", "SRSubsystemCategoryNameFilter.m", 121, "false");
}

- (id)newChildInstance
{
}

- (void)setCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4 forQuery:(id)a5
{
  id v12 = a5;
  v8 = -[FilterTier keyForChildren:](self, "keyForChildren:");
  if (v8)
  {
    v9 = [(FilterTier *)self childTiers];
    v10 = [v9 objectForKeyedSubscript:v8];

    if (!v10)
    {
      v10 = [(FilterTier *)self newChildInstance];
      v11 = [(FilterTier *)self childTiers];
      [v11 setObject:v10 forKeyedSubscript:v8];
    }
    [(SRDownsampleEntry *)v10 setCap:a3 downsampleRatio:a4 forQuery:v12];
  }
  else
  {
    v10 = [[SRDownsampleEntry alloc] initWithCap:a3 downsampleRatio:a4];
    [(FilterTier *)self setDownsampleEntry:v10];
  }
}

- (NSMutableDictionary)childTiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChildTiers:(id)a3
{
}

- (SRDownsampleEntry)downsampleEntry
{
  return (SRDownsampleEntry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDownsampleEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleEntry, 0);

  objc_storeStrong((id *)&self->_childTiers, 0);
}

@end