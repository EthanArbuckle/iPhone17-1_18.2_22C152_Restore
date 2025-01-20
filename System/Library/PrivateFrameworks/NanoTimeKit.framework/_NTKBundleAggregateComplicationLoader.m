@interface _NTKBundleAggregateComplicationLoader
- (NSOrderedSet)loaders;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_loadClassesUsingBlock:(id)a3;
- (void)setLoaders:(id)a3;
@end

@implementation _NTKBundleAggregateComplicationLoader

- (void)_loadClassesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_loaders;
  uint64_t v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_loadClassesUsingBlock:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)[(NSOrderedSet *)self->_loaders copyWithZone:a3];
  [v5 setLoaders:v6];

  return v5;
}

- (NSOrderedSet)loaders
{
  return self->_loaders;
}

- (void)setLoaders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end