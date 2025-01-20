@interface IMConfiguration
- (BOOL)addProhibited;
- (CGPoint)pointForKey:(id)a3 context:(id)a4;
- (CGRect)rectForKey:(id)a3 context:(id)a4;
- (CGSize)sizeForKey:(id)a3 context:(id)a4;
- (IMConfiguration)init;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)pairsToKeyMap;
- (UIEdgeInsets)edgeInsetsForKey:(id)a3 context:(id)a4;
- (double)BOOLForKey:(id)a3 context:(id)a4;
- (double)floatForKey:(id)a3 context:(id)a4;
- (id)_predicateValuePairsForKey:(id)a3;
- (id)_selectTopScoringPairInArray:(id)a3;
- (id)description;
- (id)valueForKey:(id)a3 context:(id)a4;
- (int64_t)integerForKey:(id)a3 context:(id)a4;
- (void)addValue:(id)a3 predicate:(id)a4 forKey:(id)a5;
- (void)addWithPredicate:(id)a3 adder:(id)a4;
- (void)invalidate;
- (void)setAddProhibited:(BOOL)a3;
- (void)setCache:(id)a3;
- (void)setPairsToKeyMap:(id)a3;
@end

@implementation IMConfiguration

- (IMConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMConfiguration;
  v2 = [(IMConfiguration *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pairsToKeyMap = v2->_pairsToKeyMap;
    v2->_pairsToKeyMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v5;
  }
  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IMConfiguration;
  v3 = [(IMConfiguration *)&v7 description];
  v4 = [(IMConfiguration *)self pairsToKeyMap];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)valueForKey:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(IMConfiguration *)self cache];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    v10 = +[NSMutableArray array];
    id v23 = v6;
    v11 = [(IMConfiguration *)self _predicateValuePairsForKey:v6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [v16 predicate];
          unsigned int v18 = [v17 evaluateWithContext:v7];

          if (v18) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v13);
    }
    if ([v10 count])
    {
      if ([v10 count] == (char *)&def_7D91C + 1) {
        [v10 firstObject];
      }
      else {
      v20 = [(IMConfiguration *)self _selectTopScoringPairInArray:v10];
      }
      id v6 = v23;
      v9 = [v20 value];
      if (v9)
      {
        v21 = [(IMConfiguration *)self cache];
        [v21 setObject:v9 forKeyedSubscript:v23];
      }
    }
    else
    {
      v19 = BCIMLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "-[IMConfiguration valueForKey:context:]";
        __int16 v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/Configuration/IMConfiguration.m";
        __int16 v32 = 1024;
        LODWORD(v33) = 114;
        _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v20 = BCIMLog();
      id v6 = v23;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v29 = (const char *)v23;
        __int16 v30 = 2112;
        v31 = (const char *)v11;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_impl(&def_7D91C, v20, OS_LOG_TYPE_INFO, "@\"Failed to match for {%@} in {%@} ctx {%@}\"", buf, 0x20u);
      }
      v9 = 0;
    }
  }

  return v9;
}

- (double)floatForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)BOOLForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  double v5 = (double)[v4 BOOLValue];

  return v5;
}

- (int64_t)integerForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (CGPoint)pointForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  [v4 CGPointValue];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGSize)sizeForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  [v4 CGSizeValue];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)rectForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIEdgeInsets)edgeInsetsForKey:(id)a3 context:(id)a4
{
  v4 = [(IMConfiguration *)self valueForKey:a3 context:a4];
  [v4 uiEdgeInsetsValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)addValue:(id)a3 predicate:(id)a4 forKey:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(IMConfiguration *)self _predicateValuePairsForKey:v13];
  if (!v10)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    double v11 = [(IMConfiguration *)self pairsToKeyMap];
    [v11 setObject:v10 forKeyedSubscript:v13];
  }
  double v12 = objc_alloc_init(IMConfigurationPredicateValuePair);
  [(IMConfigurationPredicateValuePair *)v12 setPredicate:v8];

  [(IMConfigurationPredicateValuePair *)v12 setValue:v9];
  [v10 addObject:v12];
}

- (void)addWithPredicate:(id)a3 adder:(id)a4
{
  id v8 = a3;
  double v6 = (void (**)(id, IMConfigurationAdder *))a4;
  if (self->_addProhibited) {
    +[NSException raise:@"IMConfigurationWrongAdderCalledError" format:@"IMConfiguration addWithPredicate can't be called within an adder block"];
  }
  double v7 = [[IMConfigurationAdder alloc] initWithConfiguration:self predicate:v8];
  [(IMConfiguration *)self setAddProhibited:1];
  [(IMConfigurationAdder *)v7 setAddProhibited:0];
  v6[2](v6, v7);
  [(IMConfigurationAdder *)v7 setAddProhibited:1];
  [(IMConfiguration *)self setAddProhibited:0];
}

- (void)invalidate
{
  id v2 = [(IMConfiguration *)self cache];
  [v2 removeAllObjects];
}

- (id)_predicateValuePairsForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(IMConfiguration *)self pairsToKeyMap];
  double v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_selectTopScoringPairInArray:(id)a3
{
  id v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0x8000000000000000;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A10C;
  v6[3] = &unk_2C41C0;
  v6[4] = v11;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  if (v8[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:];
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

- (NSMutableDictionary)pairsToKeyMap
{
  return self->_pairsToKeyMap;
}

- (void)setPairsToKeyMap:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (BOOL)addProhibited
{
  return self->_addProhibited;
}

- (void)setAddProhibited:(BOOL)a3
{
  self->_addProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_pairsToKeyMap, 0);
}

@end