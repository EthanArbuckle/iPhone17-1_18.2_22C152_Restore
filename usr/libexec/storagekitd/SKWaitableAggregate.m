@interface SKWaitableAggregate
- (BOOL)waitWithError:(id *)a3;
- (NSArray)waitables;
- (SKWaitableAggregate)initWithWaitables:(id)a3;
- (void)setWaitables:(id)a3;
@end

@implementation SKWaitableAggregate

- (SKWaitableAggregate)initWithWaitables:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKWaitableAggregate;
  v6 = [(SKWaitableAggregate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_waitables, a3);
  }

  return v7;
}

- (BOOL)waitWithError:(id *)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(SKWaitableAggregate *)self waitables];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        unsigned __int8 v12 = [v11 waitWithError:&v16];
        id v13 = v16;
        v14 = v13;
        if (!v7 && v13) {
          id v7 = v13;
        }
        v9 &= v12;
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
    char v9 = 1;
  }

  if (a3) {
    *a3 = v7;
  }

  return v9;
}

- (NSArray)waitables
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWaitables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end