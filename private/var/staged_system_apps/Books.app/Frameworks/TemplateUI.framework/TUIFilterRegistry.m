@interface TUIFilterRegistry
- (TUIFilterRegistry)init;
- (id)imageFilterWithIdentifier:(id)a3;
- (id)imageSetFilterWithIdentifier:(id)a3;
- (void)registerImageFilters:(id)a3;
- (void)registerImageSetFilters:(id)a3;
@end

@implementation TUIFilterRegistry

- (TUIFilterRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIFilterRegistry;
  v2 = [(TUIFilterRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    imageFilters = v2->_imageFilters;
    v2->_imageFilters = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    imageSetFilters = v2->_imageSetFilters;
    v2->_imageSetFilters = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)registerImageFilters:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v9 identifier];
        if ([v10 length]) {
          [(NSMutableDictionary *)self->_imageFilters setObject:v9 forKeyedSubscript:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)registerImageSetFilters:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v9 identifier];
        if ([v10 length]) {
          [(NSMutableDictionary *)self->_imageSetFilters setObject:v9 forKeyedSubscript:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)imageFilterWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(NSMutableDictionary *)self->_imageFilters objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)imageSetFilterWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(NSMutableDictionary *)self->_imageSetFilters objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetFilters, 0);

  objc_storeStrong((id *)&self->_imageFilters, 0);
}

@end