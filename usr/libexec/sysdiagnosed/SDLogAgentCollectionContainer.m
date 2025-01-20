@interface SDLogAgentCollectionContainer
- (BOOL)addRulesFromHelperReply:(id)a3;
- (BOOL)flattenReturnedDirectoryPaths;
- (id)createRulesFromPaths:(id)a3;
- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3;
@end

@implementation SDLogAgentCollectionContainer

- (id)createRulesFromPaths:(id)a3
{
  id v4 = a3;
  if ([(SDLogAgentCollectionContainer *)self flattenReturnedDirectoryPaths])
  {
    v5 = +[SDUnitLogPathArray logRuleWithMutablePaths:v4];
    v26 = v5;
    id v6 = +[NSArray arrayWithObjects:&v26 count:1];
  }
  else
  {
    v5 = +[NSMutableArray array];
    +[NSMutableArray array];
    v19 = id v18 = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          char v20 = 0;
          v13 = +[NSFileManager defaultManager];
          unsigned int v14 = [v13 fileExistsAtPath:v12 isDirectory:&v20];

          if (v14)
          {
            if (v20)
            {
              v15 = +[SDUnitLogDirectory logRuleWithDirectory:v12];
              [v5 addObject:v15];
            }
            else
            {
              [v19 addObject:v12];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    if ([v19 count])
    {
      v16 = +[SDUnitLogPathArray logRuleWithMutablePaths:v19];
      [v5 addObject:v16];
    }
    id v6 = [v5 copy];

    id v4 = v18;
  }

  return v6;
}

- (BOOL)addRulesFromHelperReply:(id)a3
{
  id v4 = xpc_dictionary_get_value(a3, "resultPaths");
  v5 = v4;
  if (v4)
  {
    id v6 = sub_100025528(v4);
    id v7 = [(SDLogAgentCollectionContainer *)self createRulesFromPaths:v6];
    id v8 = [v7 count];
    BOOL v9 = v8 != 0;
    if (v8) {
      [(SDLogCollectionContainer *)self addRules:v7];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

@end