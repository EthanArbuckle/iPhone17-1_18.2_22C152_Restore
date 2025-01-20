@interface RAPWebBundleTransitSystemContext
- (NSArray)lines;
- (NSDictionary)context;
- (NSString)system;
- (void)setLines:(id)a3;
- (void)setSystem:(id)a3;
@end

@implementation RAPWebBundleTransitSystemContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(RAPWebBundleTransitSystemContext *)self system];

  if (v4)
  {
    v5 = [(RAPWebBundleTransitSystemContext *)self system];
    [v3 setObject:v5 forKeyedSubscript:@"system"];
  }
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [(RAPWebBundleTransitSystemContext *)self lines];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) context];
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v13 = [v6 copy];
    [v3 setObject:v13 forKeyedSubscript:@"lines"];
  }
  id v14 = [v3 copy];

  return (NSDictionary *)v14;
}

- (NSString)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);

  objc_storeStrong((id *)&self->_system, 0);
}

@end