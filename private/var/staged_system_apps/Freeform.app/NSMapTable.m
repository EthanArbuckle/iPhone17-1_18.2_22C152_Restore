@interface NSMapTable
- (id)crl_allKeys;
- (id)crl_allObjects;
- (void)crl_enumerateKeysAndObjectsUsingBlock:(id)a3;
@end

@implementation NSMapTable

- (id)crl_allKeys
{
  v2 = [(NSMapTable *)self keyEnumerator];
  v3 = [v2 allObjects];

  return v3;
}

- (id)crl_allObjects
{
  v2 = [(NSMapTable *)self objectEnumerator];
  v3 = [v2 allObjects];

  return v3;
}

- (void)crl_enumerateKeysAndObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  if (v4)
  {
    char v16 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(NSMapTable *)self crl_allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = [(NSMapTable *)self objectForKey:v10];
        v4[2](v4, v10, v11, &v16);

        if (v16) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end