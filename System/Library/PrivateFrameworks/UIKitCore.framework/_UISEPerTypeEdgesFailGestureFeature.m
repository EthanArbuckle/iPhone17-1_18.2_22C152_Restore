@interface _UISEPerTypeEdgesFailGestureFeature
- (NSDictionary)edgeTypeSubfeatures;
- (_UISEPerTypeEdgesFailGestureFeature)initWithEdgeTypeSubfeatures:(id)a3;
- (id)debugDictionary;
- (unint64_t)touchedEdges;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
- (void)featureDidChangeState:(id)a3;
@end

@implementation _UISEPerTypeEdgesFailGestureFeature

- (void).cxx_destruct
{
}

- (_UISEPerTypeEdgesFailGestureFeature)initWithEdgeTypeSubfeatures:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UISEPerTypeEdgesFailGestureFeature;
  v4 = [(_UISEPerTypeEdgesFailGestureFeature *)&v17 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_edgeTypeSubfeatures, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = a3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
          [v11 setDelegate:v5];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (unint64_t)touchedEdges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_edgeTypeSubfeatures;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = -[NSDictionary objectForKeyedSubscript:](self->_edgeTypeSubfeatures, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v6 |= [v9 touchedEdges];
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)featureDidChangeState:(id)a3
{
  if ([a3 state] == 2)
  {
    [(_UISEGestureFeature *)self _setState:2];
  }
}

- (id)debugDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = self->_edgeTypeSubfeatures;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [(NSDictionary *)self->_edgeTypeSubfeatures objectForKeyedSubscript:v9];
        long long v11 = [v10 debugDictionary];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v15.receiver = self;
  v15.super_class = (Class)_UISEPerTypeEdgesFailGestureFeature;
  long long v12 = [(_UISEGestureFeature *)&v15 debugDictionary];
  long long v13 = (void *)[v12 mutableCopy];

  [v13 setObject:v3 forKeyedSubscript:@"edgeTypeSubfeatures"];
  return v13;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (![(_UISEGestureFeature *)self state])
  {
    edgeTypeSubfeatures = self->_edgeTypeSubfeatures;
    id v7 = [NSNumber numberWithInteger:a3->var3];
    uint64_t v6 = [(NSDictionary *)edgeTypeSubfeatures objectForKeyedSubscript:v7];
    [v6 incorporateSample:a3];
  }
}

- (NSDictionary)edgeTypeSubfeatures
{
  return self->_edgeTypeSubfeatures;
}

@end