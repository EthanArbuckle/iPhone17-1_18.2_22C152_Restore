@interface MRDServerMessageProxy
+ (id)proxyForObject:(id)a3 protocol:(id)a4;
+ (id)proxyForObjects:(id)a3 protocol:(id)a4;
- (NSHashTable)objects;
- (Protocol)protocol;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setObjects:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation MRDServerMessageProxy

+ (id)proxyForObject:(id)a3 protocol:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];

  v9 = objc_msgSend(a1, "proxyForObjects:protocol:", v8, v6, v11);

  return v9;
}

+ (id)proxyForObjects:(id)a3 protocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v9 = +[NSHashTable weakObjectsHashTable];
  [v8 setObjects:v9];

  [v8 setProtocol:v7];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = objc_msgSend(v8, "objects", (void)v18);
        [v16 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(MRDServerMessageProxy *)self objects];
  id v6 = [v5 allObjects];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v10);
        [v4 selector];
        if (objc_opt_respondsToSelector()) {
          [v4 invokeWithTarget:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (a3 == a2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v6 = [(MRDServerMessageProxy *)self protocol];
    types = protocol_getMethodDescription(v6, a3, 0, 1).types;

    if (types
      || ([(MRDServerMessageProxy *)self protocol],
          id v8 = (Protocol *)objc_claimAutoreleasedReturnValue(),
          types = protocol_getMethodDescription(v8, a3, 1, 1).types,
          v8,
          types))
    {
      uint64_t v9 = +[NSMethodSignature signatureWithObjCTypes:types];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (NSHashTable)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end