@interface TUIAnimationGroupCollection
- (NSDictionary)groups;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateAllGroupRenderModelsFromSource:(id)a3;
- (void)setGroups:(id)a3;
@end

@implementation TUIAnimationGroupCollection

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIAnimationGroupCollection allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSDictionary *)[(NSDictionary *)self->_groups copy];
    groups = v4->_groups;
    v4->_groups = v5;
  }
  return v4;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)generateAllGroupRenderModelsFromSource:(id)a3
{
  id v4 = a3;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(TUIAnimationGroupCollection *)self groups];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        v12 = [v11 generateAnimationRenderModelsForAllPhasesFromSource:v4];
        v13 = [v12 phaseRenderModels];
        id v14 = [v13 count];

        if (v14) {
          [v17 setObject:v12 forKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  if ([v17 count])
  {
    v15 = objc_alloc_init(TUIAnimationGroupRenderModelCollection);
    [(TUIAnimationGroupRenderModelCollection *)v15 setGroupPhases:v17];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end