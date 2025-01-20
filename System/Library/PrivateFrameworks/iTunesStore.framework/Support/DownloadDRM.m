@interface DownloadDRM
- (BOOL)isDRMFree;
- (DownloadDRM)init;
- (DownloadDRM)initWithSinfArray:(id)a3;
- (NSArray)sinfs;
- (SinfsArray)pinfsArray;
- (SinfsArray)sinfsArray;
- (id)_sinfsArrayWithDataKey:(id)a3;
- (id)firstDataForSinfDataKey:(id)a3;
- (id)sinfForIdentifier:(int64_t)a3;
- (void)dealloc;
@end

@implementation DownloadDRM

- (DownloadDRM)init
{
  return [(DownloadDRM *)self initWithSinfArray:0];
}

- (DownloadDRM)initWithSinfArray:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)DownloadDRM;
  v4 = [(DownloadDRM *)&v17 init];
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a3);
          }
          v10 = [[DownloadSinf alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9)];
          if (v10)
          {
            v11 = v10;
            [(NSArray *)v5 addObject:v10];
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }
    v4->_sinfs = v5;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadDRM;
  [(DownloadDRM *)&v3 dealloc];
}

- (id)firstDataForSinfDataKey:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sinfs = self->_sinfs;
  id result = [(NSArray *)sinfs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(sinfs);
      }
      id result = [*(id *)(*((void *)&v9 + 1) + 8 * v8) dataForSinfDataKey:a3];
      if (result) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id result = [(NSArray *)sinfs countByEnumeratingWithState:&v9 objects:v13 count:16];
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (BOOL)isDRMFree
{
  return [(DownloadDRM *)self firstDataForSinfDataKey:off_100400C58] != 0;
}

- (SinfsArray)pinfsArray
{
  return (SinfsArray *)[(DownloadDRM *)self _sinfsArrayWithDataKey:off_100400C60];
}

- (id)sinfForIdentifier:(int64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  sinfs = self->_sinfs;
  id result = [(NSArray *)sinfs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(sinfs);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 identifier] == (id)a3) {
          return v9;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [(NSArray *)sinfs countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSArray)sinfs
{
  v2 = self->_sinfs;

  return v2;
}

- (SinfsArray)sinfsArray
{
  return (SinfsArray *)[(DownloadDRM *)self _sinfsArrayWithDataKey:off_100400C68];
}

- (id)_sinfsArrayWithDataKey:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(DownloadDRM *)self sinfs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) dataForSinfDataKey:a3];
        if (v11) {
          [v5 addObject:v11];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  if ([v5 count]) {
    long long v12 = [[SinfsArray alloc] initWithSINFs:v5];
  }
  else {
    long long v12 = 0;
  }

  return v12;
}

@end