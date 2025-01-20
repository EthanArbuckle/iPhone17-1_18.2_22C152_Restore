@interface PTOutlet
+ (BOOL)supportsSecureCoding;
- (id)_init;
- (id)addAction:(id)a3;
- (void)_invokeActions;
- (void)removeActionForToken:(id)a3;
@end

@implementation PTOutlet

- (id)addAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t nextToken = self->_nextToken;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInteger:nextToken];
  actionsByToken = self->_actionsByToken;
  ++self->_nextToken;
  v9 = (void *)[v6 copy];

  v10 = (void *)MEMORY[0x1C1899990](v9);
  [(NSMutableDictionary *)actionsByToken setObject:v10 forKey:v7];

  return v7;
}

- (void)removeActionForToken:(id)a3
{
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)PTOutlet;
  v2 = [(PTOutlet *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t nextToken = 1;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionsByToken = v3->_actionsByToken;
    v3->_actionsByToken = v4;
  }
  return v3;
}

- (void)_invokeActions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_actionsByToken allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_actionsByToken objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end