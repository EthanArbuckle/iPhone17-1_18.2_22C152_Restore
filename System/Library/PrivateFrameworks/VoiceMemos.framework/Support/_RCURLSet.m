@interface _RCURLSet
+ (id)setWithURLs:(id)a3;
- (BOOL)containsURL:(id)a3;
- (_RCURLSet)init;
- (id)URLs;
- (id)debugDescription;
- (void)addURL:(id)a3;
@end

@implementation _RCURLSet

- (_RCURLSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)_RCURLSet;
  v2 = [(_RCURLSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    set = v2->_set;
    v2->_set = (NSMutableSet *)v3;
  }
  return v2;
}

+ (id)setWithURLs:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addURL:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)addURL:(id)a3
{
  set = self->_set;
  id v4 = [a3 URLByStandardizingPath];
  [(NSMutableSet *)set addObject:v4];
}

- (BOOL)containsURL:(id)a3
{
  id v4 = [a3 URLByStandardizingPath];
  LOBYTE(self) = [(NSMutableSet *)self->_set containsObject:v4];

  return (char)self;
}

- (void).cxx_destruct
{
}

- (id)debugDescription
{
  return [(NSMutableSet *)self->_set debugDescription];
}

- (id)URLs
{
  id v2 = [(NSMutableSet *)self->_set copy];
  return v2;
}

@end