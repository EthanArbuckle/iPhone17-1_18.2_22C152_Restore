@interface BEEvaluateJavaScriptResultContext
- (BEEvaluateJavaScriptResultContext)init;
- (NSArray)allKeys;
- (NSMutableDictionary)results;
- (id)description;
- (id)dictionaryResultForKey:(id)a3;
- (id)resultForKey:(id)a3;
- (id)stringResultForKey:(id)a3;
- (id)valueResultForKey:(id)a3;
- (void)addResult:(id)a3 forKey:(id)a4;
- (void)setResults:(id)a3;
@end

@implementation BEEvaluateJavaScriptResultContext

- (BEEvaluateJavaScriptResultContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)BEEvaluateJavaScriptResultContext;
  v2 = [(BEEvaluateJavaScriptResultContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    results = v2->_results;
    v2->_results = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addResult:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = v9;
  if (!v9)
  {
    v7 = +[NSNull null];
  }
  v8 = [(BEEvaluateJavaScriptResultContext *)self results];
  [v8 setObject:v7 forKeyedSubscript:v6];

  if (!v9) {
}
  }

- (id)resultForKey:(id)a3
{
  id v4 = a3;
  v5 = [(BEEvaluateJavaScriptResultContext *)self results];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)stringResultForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(BEEvaluateJavaScriptResultContext *)self resultForKey:v4];

  id v6 = BUDynamicCast();

  return v6;
}

- (id)dictionaryResultForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(BEEvaluateJavaScriptResultContext *)self resultForKey:v4];

  id v6 = BUDynamicCast();

  return v6;
}

- (id)valueResultForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(BEEvaluateJavaScriptResultContext *)self resultForKey:v4];

  id v6 = BUDynamicCast();

  return v6;
}

- (NSArray)allKeys
{
  v2 = [(BEEvaluateJavaScriptResultContext *)self results];
  uint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(BEEvaluateJavaScriptResultContext *)self results];
  id v6 = +[NSString stringWithFormat:@"<%@: %p> - results: %@", v4, self, v5];

  return v6;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end