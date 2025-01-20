@interface WRIntervalAndThreads
- (WRTimestampAndThread)end;
- (WRTimestampAndThread)start;
- (id)encodedDict;
- (id)initWithEncodedDict:(uint64_t *)a3 error:;
- (id)initWithStart:(void *)a3 end:;
- (void)insertIntoSortedArray:(uint64_t)a1;
@end

@implementation WRIntervalAndThreads

- (id)initWithStart:(void *)a3 end:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)WRIntervalAndThreads;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)encodedDict
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(NSDictionary);
    v3 = [v1 start];
    v4 = -[WRTimestampAndThread encodedDict](v3);
    v5 = [v1 end];
    id v6 = -[WRTimestampAndThread encodedDict](v5);
    id v1 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, @"iat_start", v6, @"iat_end", 0);
  }

  return v1;
}

- (id)initWithEncodedDict:(uint64_t *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v26 = 0;
    if (a3) {
      *a3 = 0;
    }
    else {
      a3 = &v26;
    }
    v13 = DictGetDict(v5, @"iat_start", a3);
    if (v13)
    {
      v20 = DictGetDict(v6, @"iat_end", a3);
      if (v20)
      {
        v21 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v13, a3);
        if (v21)
        {
          v22 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], v20, a3);
          if (v22)
          {
            a1 = -[WRIntervalAndThreads initWithStart:end:](a1, v21, v22);
            v23 = a1;
          }
          else
          {
            v23 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
      }
      else if (*a3)
      {
        WRMakeError(7, @"WRIntervalAndThreads: No end in dict", v14, v15, v16, v17, v18, v19, v25);
        v23 = 0;
        *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
    }
    else if (*a3)
    {
      WRMakeError(7, @"WRIntervalAndThreads: No start in dict", v7, v8, v9, v10, v11, v12, v25);
      v23 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)insertIntoSortedArray:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    objc_msgSend(v3, "insertObject:atIndex:", a1, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", a1, 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global_71));
  }
}

uint64_t __46__WRIntervalAndThreads_insertIntoSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 start];
  unint64_t v7 = [v6 machContTimeNs];
  uint64_t v8 = [v5 start];
  unint64_t v9 = [v8 machContTimeNs];

  if (v7 <= v9)
  {
    uint64_t v11 = [v4 start];
    unint64_t v12 = [v11 machContTimeNs];
    v13 = [v5 start];
    unint64_t v14 = [v13 machContTimeNs];

    if (v12 >= v14) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (WRTimestampAndThread)start
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 8, 1);
}

- (WRTimestampAndThread)end
{
  return (WRTimestampAndThread *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end