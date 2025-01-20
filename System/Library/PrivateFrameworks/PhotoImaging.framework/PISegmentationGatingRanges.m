@interface PISegmentationGatingRanges
+ (id)loadFromURL:(id)a3;
- (NSArray)scoreKeys;
- (PISegmentationGatingRanges)initWithRanges:(id)a3;
- (id)rangeForKey:(id)a3;
- (void)setScoreKeys:(id)a3;
@end

@implementation PISegmentationGatingRanges

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreKeys, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
}

- (void)setScoreKeys:(id)a3
{
}

- (NSArray)scoreKeys
{
  return [(NSDictionary *)self->_ranges allKeys];
}

- (id)rangeForKey:(id)a3
{
  return [(NSDictionary *)self->_ranges objectForKeyedSubscript:a3];
}

- (PISegmentationGatingRanges)initWithRanges:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PISegmentationGatingRanges;
  id v3 = a3;
  v4 = [(PISegmentationGatingRanges *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  ranges = v4->_ranges;
  v4->_ranges = (NSDictionary *)v5;

  return v4;
}

+ (id)loadFromURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v19 = 0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3 error:&v19];
  id v5 = v19;
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __42__PISegmentationGatingRanges_loadFromURL___block_invoke;
    v17 = &unk_1E5D80590;
    id v18 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:&v14];
    objc_super v8 = [PISegmentationGatingRanges alloc];
    v9 = -[PISegmentationGatingRanges initWithRanges:](v8, "initWithRanges:", v7, v14, v15, v16, v17);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_100);
    }
    v10 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      v13 = [v3 path];
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Unable to load scoring ranges dictionary from %{public}@, error: %{public}@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

void __42__PISegmentationGatingRanges_loadFromURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v43 = a2;
  id v5 = a3;
  if (([v43 isEqualToString:*MEMORY[0x1E4F8D238]] & 1) == 0)
  {
    uint64_t v6 = [v5 objectForKey:@"min"];
    id v7 = (void *)v6;
    if (v6) {
      objc_super v8 = (void *)v6;
    }
    else {
      objc_super v8 = &unk_1F000A578;
    }
    id v9 = v8;

    uint64_t v10 = [v5 objectForKey:@"max"];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = &unk_1F000A588;
    }
    id v13 = v12;

    uint64_t v14 = [v5 objectForKey:@"manualMin"];
    uint64_t v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = v9;
    }
    id v17 = v16;

    uint64_t v18 = [v5 objectForKey:@"manualMax"];
    id v19 = (void *)v18;
    if (v18) {
      v20 = (void *)v18;
    }
    else {
      v20 = v13;
    }
    id v21 = v20;

    uint64_t v22 = [v5 objectForKey:@"depthMin"];
    id v23 = (void *)v22;
    if (v22) {
      uint64_t v24 = (void *)v22;
    }
    else {
      uint64_t v24 = &unk_1F000A578;
    }
    id v25 = v24;

    uint64_t v26 = [v5 objectForKey:@"depthMax"];
    v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = &unk_1F000A588;
    }
    id v29 = v28;

    [v9 doubleValue];
    double v31 = v30;
    [v13 doubleValue];
    double v33 = v32;
    [v17 doubleValue];
    double v35 = v34;
    [v21 doubleValue];
    double v37 = v36;
    [v25 doubleValue];
    double v39 = v38;

    [v29 doubleValue];
    double v41 = v40;

    v42 = [[PISegmentationGatingRange alloc] initWithMin:v31 max:v33 manualMin:v35 manualMax:v37 depthMin:v39 depthMax:v41];
    [*(id *)(a1 + 32) setObject:v42 forKeyedSubscript:v43];
  }
}

@end