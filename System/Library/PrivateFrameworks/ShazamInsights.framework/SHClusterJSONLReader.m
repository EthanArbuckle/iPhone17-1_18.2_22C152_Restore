@interface SHClusterJSONLReader
- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4;
- (BOOL)readDataLineByLineFromURL:(id)a3 error:(id *)a4 callback:(id)a5;
- (id)callback;
- (unint64_t)index;
- (void)importClusters:(id)a3 toParentCluster:(id)a4 startIndex:(unint64_t)a5;
- (void)setCallback:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation SHClusterJSONLReader

- (BOOL)readDataLineByLineFromURL:(id)a3 error:(id *)a4 callback:(id)a5
{
  id v8 = a3;
  [(SHClusterJSONLReader *)self setCallback:a5];
  id v9 = objc_alloc_init(MEMORY[0x263F6C4A8]);
  [v9 setDelegate:self];
  LOBYTE(a4) = [v9 loadDataFromURL:v8 error:a4];

  return (char)a4;
}

- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void *)MEMORY[0x22A6583E0]();
  v9[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [(SHClusterJSONLReader *)self importClusters:v7 toParentCluster:&stru_26DA42830 startIndex:[(SHClusterJSONLReader *)self index]];

  [(SHClusterJSONLReader *)self setIndex:[(SHClusterJSONLReader *)self index] + 1];

  return 1;
}

- (void)importClusters:(id)a3 toParentCluster:(id)a4 startIndex:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v25 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x22A6583E0]();
        v11 = [v9 objectForKeyedSubscript:@"clusters"];
        uint64_t v12 = [v11 count];
        v13 = &stru_26DA42830;
        if (v12) {
          v13 = @" ";
        }
        v14 = [NSString stringWithFormat:@"%lu%@", a5 + i, v13];
        v15 = [v25 stringByAppendingString:v14];

        if ([v11 count]) {
          [(SHClusterJSONLReader *)self importClusters:v11 toParentCluster:v15 startIndex:0];
        }
        v16 = [v9 objectForKeyedSubscript:@"tracks"];
        [v9 setObject:0 forKeyedSubscript:@"tracks"];
        if ([v16 count])
        {
          v17 = [v15 componentsSeparatedByString:@" "];
          if ([v17 count])
          {
            v18 = [v17 objectAtIndexedSubscript:0];
          }
          else
          {
            v18 = 0;
          }
          if ((unint64_t)[v17 count] < 2)
          {
            v19 = 0;
          }
          else
          {
            v19 = [v17 objectAtIndexedSubscript:1];
          }
          v28 = v10;
          if ((unint64_t)[v17 count] < 3)
          {
            v20 = 0;
          }
          else
          {
            v20 = [v17 objectAtIndexedSubscript:2];
          }
          [(SHClusterJSONLReader *)self callback];
          v21 = self;
          v22 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *, void *, void *, void *))v22)[2](v22, v20, v19, v18, v16);

          self = v21;
          v10 = v28;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      a5 += i;
    }
    while (v26);
  }
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end