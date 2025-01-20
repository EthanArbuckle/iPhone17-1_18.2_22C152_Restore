@interface _UISEMuxGestureFeature
- (NSDictionary)subfeatures;
- (_UISEMuxGestureFeature)initWithSettings:(id)a3 createFeatureBlock:(id)a4;
- (id)debugDictionary;
- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3;
- (void)featureDidChangeState:(id)a3;
@end

@implementation _UISEMuxGestureFeature

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  id v6 = [NSNumber numberWithUnsignedInteger:a3->var4];
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_subfeatures, "objectForKeyedSubscript:");
  if (!v5)
  {
    v5 = (*((void (**)(void))self->_createFeatureBlock + 2))();
    [v5 setDelegate:self];
    [(NSMutableDictionary *)self->_subfeatures setObject:v5 forKeyedSubscript:v6];
  }
  [v5 incorporateSample:a3];
}

- (_UISEMuxGestureFeature)initWithSettings:(id)a3 createFeatureBlock:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_UISEMuxGestureFeature;
  id v6 = [(_UISEMuxGestureFeature *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = _Block_copy(a4);
    id createFeatureBlock = v7->_createFeatureBlock;
    v7->_id createFeatureBlock = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subfeatures = v7->_subfeatures;
    v7->_subfeatures = v10;

    v7->_fails = 0;
    v7->_recognizes = 0;
  }
  return v7;
}

- (void)featureDidChangeState:(id)a3
{
  if (![(_UISEGestureFeature *)self state])
  {
    uint64_t v5 = [a3 state];
    uint64_t v6 = v5;
    if (v5 == 1)
    {
      unint64_t v7 = self->_recognizes + 1;
      self->_recognizes = v7;
      unint64_t v8 = [(_UISEGestureFeatureSettings *)self->_settings minimumNumberOfSubfeatures];
    }
    else
    {
      if (v5 != 2) {
        return;
      }
      unint64_t v7 = self->_fails + 1;
      self->_fails = v7;
      unint64_t v8 = [(NSMutableDictionary *)self->_subfeatures count];
    }
    if (v7 >= v8)
    {
      [(_UISEGestureFeature *)self _setState:v6];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
  objc_storeStrong(&self->_createFeatureBlock, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (id)debugDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  subfeatures = self->_subfeatures;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41___UISEMuxGestureFeature_debugDictionary__block_invoke;
  v10[3] = &unk_1E52F0938;
  id v11 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)subfeatures enumerateKeysAndObjectsUsingBlock:v10];
  v9.receiver = self;
  v9.super_class = (Class)_UISEMuxGestureFeature;
  uint64_t v6 = [(_UISEGestureFeature *)&v9 debugDictionary];
  unint64_t v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v5 forKeyedSubscript:@"subfeatures"];
  return v7;
}

- (NSDictionary)subfeatures
{
  return &self->_subfeatures->super;
}

@end