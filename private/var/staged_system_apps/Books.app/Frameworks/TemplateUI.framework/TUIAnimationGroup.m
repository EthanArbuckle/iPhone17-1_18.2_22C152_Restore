@interface TUIAnimationGroup
- (NSDictionary)phases;
- (id)_generateModelsForPhase:(id)a3 sourceRenderModel:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)generateAnimationRenderModelsForAllPhasesFromSource:(id)a3;
- (void)setPhases:(id)a3;
@end

@implementation TUIAnimationGroup

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationGroup allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSDictionary *)[(NSDictionary *)self->_phases copy];
    phases = v4->_phases;
    v4->_phases = v5;
  }
  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"<"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 addObject:v5];

  v6 = +[NSString stringWithFormat:@" %p", self];
  [v3 addObject:v6];

  [v3 addObject:@" phases: { "];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  phases = self->_phases;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_7A7EC;
  v11[3] = &unk_253E60;
  v13 = &v14;
  id v8 = v3;
  id v12 = v8;
  [(NSDictionary *)phases enumerateKeysAndObjectsUsingBlock:v11];
  if (*((unsigned char *)v15 + 24)) {
    [v8 addObject:@" "];
  }
  [v8 addObject:@"}>"];
  v9 = [v8 componentsJoinedByString:&stru_257BF0];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (NSDictionary)phases
{
  return self->_phases;
}

- (void)setPhases:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)_generateModelsForPhase:(id)a3 sourceRenderModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = [(TUIAnimationGroup *)self phases];
  v10 = [v9 objectForKeyedSubscript:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [v10 animations];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) generateRenderModelsFromSource:v7];
        if (v16)
        {
          [v10 delay];
          [v10 delay];
          [v16 setDelay:];
          [v10 duration];
          [v10 duration];
          [v16 setDuration:];
          [v16 setOptions:[v16 options] | [v10 options]];
          [v8 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if (![v8 count])
  {

    id v8 = 0;
  }

  return v8;
}

- (id)generateAnimationRenderModelsForAllPhasesFromSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(TUIAnimationGroup *)self phases];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(TUIAnimationGroup *)self _generateModelsForPhase:v11 sourceRenderModel:v4];
        if ([v12 count]) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v13 = objc_alloc_init(TUIAnimationGroupPhaseRenderModelCollection);
    [(TUIAnimationGroupPhaseRenderModelCollection *)v13 setPhaseRenderModels:v5];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end