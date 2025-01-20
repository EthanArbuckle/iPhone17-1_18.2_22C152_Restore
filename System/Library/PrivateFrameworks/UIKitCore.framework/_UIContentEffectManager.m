@interface _UIContentEffectManager
+ (id)sharedManager;
- (NSMutableDictionary)effects;
- (id)compatibleEffectForDescriptor:(id)a3;
- (id)compatibleEffectForKey:(id)a3 descriptor:(id)a4 constructor:(id)a5;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_stopManagingEffect:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation _UIContentEffectManager

+ (id)sharedManager
{
  if (_MergedGlobals_1262 != -1) {
    dispatch_once(&_MergedGlobals_1262, &__block_literal_global_552);
  }
  v2 = (void *)qword_1EB264798;
  return v2;
}

- (id)compatibleEffectForKey:(id)a3 descriptor:(id)a4 constructor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__203;
  v37 = __Block_byref_object_dispose__203;
  id v38 = [(_UIContentEffectManager *)self objectForKeyedSubscript:v8];
  v11 = (void *)v34[5];
  if (v11) {
    goto LABEL_5;
  }
  id location = 0;
  p_id location = &location;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__203;
  v31 = __Block_byref_object_dispose__203;
  id v32 = 0;
  v12 = [(_UIContentEffectManager *)self effects];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke;
  v23[3] = &unk_1E530A290;
  id v24 = v9;
  v25 = &location;
  v26 = &v33;
  [v12 enumerateKeysAndObjectsUsingBlock:v23];

  if (p_location[5])
  {
    -[_UIContentEffectManager setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0);
    [(_UIContentEffectManager *)self setObject:v34[5] forKeyedSubscript:v8];
  }

  _Block_object_dispose(&location, 8);
  v11 = (void *)v34[5];
  if (v11)
  {
LABEL_5:
    [v11 setDescriptor:v9 andKey:v8];
  }
  else
  {
    uint64_t v15 = v10[2](v10);
    v16 = (void *)v34[5];
    v34[5] = v15;

    objc_initWeak(&location, self);
    v17 = (void *)v34[5];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke_2;
    v21 = &unk_1E530A2B8;
    objc_copyWeak(&v22, &location);
    [v17 addCompletion:&v18];
    -[_UIContentEffectManager setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v34[5], v8, v18, v19, v20, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  id v13 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v13;
}

- (id)compatibleEffectForDescriptor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(_UIContentEffectManager *)self effects];
  v6 = [v5 allValues];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 descriptor];
        int canTransitionBetweenEffects = _canTransitionBetweenEffects(v11, v4);

        if (canTransitionBetweenEffects)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_stopManagingEffect:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContentEffectManager *)self effects];
  id v7 = [v5 allKeysForObject:v4];

  if ([v7 count])
  {
    v6 = [(_UIContentEffectManager *)self effects];
    [v6 removeObjectsForKeys:v7];
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContentEffectManager *)self effects];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContentEffectManager *)self effects];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (NSMutableDictionary)effects
{
  return self->_effects;
}

- (void).cxx_destruct
{
}

@end