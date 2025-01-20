@interface _UISEAllGestureFeature
- (NSArray)subfeatures;
- (_UISEAllGestureFeature)initWithSubfeatures:(id)a3;
- (id)debugDictionary;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
- (void)featureDidChangeState:(id)a3;
@end

@implementation _UISEAllGestureFeature

- (_UISEAllGestureFeature)initWithSubfeatures:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_UISEAllGestureFeature;
  v4 = [(_UISEAllGestureFeature *)&v18 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_subfeatures, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = a3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10++), "setDelegate:", v5, (void)v14);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    unrecognizedIndexes = v5->_unrecognizedIndexes;
    v5->_unrecognizedIndexes = (NSMutableIndexSet *)v11;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
  objc_storeStrong((id *)&self->_unrecognizedIndexes, 0);
}

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t var0 = a3->var0;
  if (a3->var0) {
    BOOL v6 = var0 == 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_subfeatures;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
LABEL_8:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if ([(_UISEGestureFeature *)self state]) {
          break;
        }
        [v12 incorporateSample:a3];
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
  }
  else if (var0 == 1 && ![(_UISEGestureFeature *)self state])
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v14 = [(NSMutableIndexSet *)self->_unrecognizedIndexes firstIndex];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 == v13) {
        break;
      }
      uint64_t v16 = v14;
      long long v17 = [(NSArray *)self->_subfeatures objectAtIndexedSubscript:v14];
      [v17 incorporateSample:a3];

      uint64_t v13 = v16;
    }
    while (![(_UISEGestureFeature *)self state]);
  }
}

- (void)featureDidChangeState:(id)a3
{
  if (![(_UISEGestureFeature *)self state])
  {
    uint64_t v5 = [a3 state];
    if (v5 == 1)
    {
      NSUInteger v8 = [(NSArray *)self->_subfeatures indexOfObject:a3];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      [(NSMutableIndexSet *)self->_unrecognizedIndexes removeIndex:v8];
      if ([(NSMutableIndexSet *)self->_unrecognizedIndexes count]) {
        return;
      }
      BOOL v6 = self;
      uint64_t v7 = 1;
    }
    else
    {
      if (v5 != 2) {
        return;
      }
      BOOL v6 = self;
      uint64_t v7 = 2;
    }
    [(_UISEGestureFeature *)v6 _setState:v7];
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
  v4 = self->_subfeatures;
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
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) debugDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v13.receiver = self;
  v13.super_class = (Class)_UISEAllGestureFeature;
  uint64_t v10 = [(_UISEGestureFeature *)&v13 debugDictionary];
  uint64_t v11 = (void *)[v10 mutableCopy];

  [v11 setObject:v3 forKeyedSubscript:@"subfeatures"];
  return v11;
}

- (NSArray)subfeatures
{
  return self->_subfeatures;
}

@end