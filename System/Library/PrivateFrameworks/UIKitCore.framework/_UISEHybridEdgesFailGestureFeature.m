@interface _UISEHybridEdgesFailGestureFeature
- (NSArray)subfeatures;
- (_UISEHybridEdgesFailGestureFeature)initWithSubfeatures:(id)a3;
- (id)debugDictionary;
- (unint64_t)touchedEdges;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
- (void)featureDidChangeState:(id)a3;
@end

@implementation _UISEHybridEdgesFailGestureFeature

- (void).cxx_destruct
{
}

- (_UISEHybridEdgesFailGestureFeature)initWithSubfeatures:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_UISEHybridEdgesFailGestureFeature;
  v4 = [(_UISEHybridEdgesFailGestureFeature *)&v16 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_subfeatures, a3);
    v5->_fails = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = a3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "setDelegate:", v5, (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (unint64_t)touchedEdges
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_subfeatures;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "touchedEdges", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)featureDidChangeState:(id)a3
{
  if ([a3 state] == 2)
  {
    unint64_t v4 = self->_fails + 1;
    self->_fails = v4;
    if (v4 == [(NSArray *)self->_subfeatures count])
    {
      [(_UISEGestureFeature *)self _setState:2];
    }
  }
}

- (id)debugDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = self->_subfeatures;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) debugDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v13.receiver = self;
  v13.super_class = (Class)_UISEHybridEdgesFailGestureFeature;
  long long v10 = [(_UISEGestureFeature *)&v13 debugDictionary];
  long long v11 = (void *)[v10 mutableCopy];

  [v11 setObject:v3 forKeyedSubscript:@"subfeatures"];
  return v11;
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_subfeatures;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
      if ([(_UISEGestureFeature *)self state]) {
        break;
      }
      [v10 incorporateSample:a3];
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (NSArray)subfeatures
{
  return self->_subfeatures;
}

@end