@interface PGGraphOptimizedEdge
- (id)description;
- (id)edgeDescription;
- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4;
@end

@implementation PGGraphOptimizedEdge

- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MAEdge *)self propertyDictionary];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
        v15 = [v9 objectForKeyedSubscript:v14];
        v16 = [v8 objectForKey:v14];

        if (!v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v15 doubleValue], v17 != 0.0))
          {
            if (([v7 containsObject:v14] & 1) == 0) {
              [v22 addObject:v14];
            }
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v18 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
      uint64_t v11 = v18;
    }
    while (v18);
  }

  if ([v22 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_opt_class();
    v20 = [v22 allObjects];
    v21 = [v20 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v19;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ doesn't support properties { %@ }", buf, 0x16u);
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(PGGraphOptimizedEdge *)self edgeDescription];
  v5 = [(MAEdge *)self sourceNode];
  id v6 = [(MAEdge *)self targetNode];
  id v7 = [v3 stringWithFormat:@"%@\n\tsourceNode: %@\n\ttargetNode: %@", v4, v5, v6];

  return v7;
}

- (id)edgeDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PGGraphOptimizedEdge *)self label];
  id v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

@end