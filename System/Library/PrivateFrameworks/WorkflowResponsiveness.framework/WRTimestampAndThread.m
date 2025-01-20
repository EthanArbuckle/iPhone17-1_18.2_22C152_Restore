@interface WRTimestampAndThread
- (NSDate)date;
- (id)encodedDict;
- (id)initWithEncodedDict:(uint64_t *)a3 error:;
- (id)initWithPID:(void *)a3 threadID:(void *)a4 machContTimeNs:(void *)a5 date:;
- (int)pid;
- (unint64_t)machContTimeNs;
- (unint64_t)threadID;
- (void)insertIntoSortedArray:(uint64_t)a1;
@end

@implementation WRTimestampAndThread

- (id)initWithPID:(void *)a3 threadID:(void *)a4 machContTimeNs:(void *)a5 date:
{
  id v10 = a5;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)WRTimestampAndThread;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      *((_DWORD *)v11 + 2) = a2;
      v11[4] = a3;
      v11[2] = a4;
      objc_storeStrong(v11 + 3, a5);
    }
  }

  return a1;
}

- (id)encodedDict
{
  if (a1)
  {
    v2 = [a1 date];

    id v3 = objc_alloc(NSDictionary);
    v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "pid"));
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "threadID"));
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "machContTimeNs"));
    v7 = (void *)v6;
    if (v2)
    {
      v8 = NSNumber;
      v9 = [a1 date];
      [v9 timeIntervalSinceReferenceDate];
      id v10 = objc_msgSend(v8, "numberWithDouble:");
      v11 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"tat_pid", v5, @"tat_threadId", v7, @"tat_machContTimeNs", v10, @"tat_date", 0);
    }
    else
    {
      v11 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"tat_pid", v5, @"tat_threadId", v6, @"tat_machContTimeNs", 0);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initWithEncodedDict:(uint64_t *)a3 error:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a1)
  {
    v26 = 0;
    goto LABEL_21;
  }
  uint64_t v29 = 0;
  if (a3) {
    *a3 = 0;
  }
  else {
    a3 = &v29;
  }
  v7 = DictGetNumber(v5, @"tat_pid", a3);
  v8 = v7;
  if (v7) {
    int v9 = [v7 intValue];
  }
  else {
    int v9 = -1;
  }
  v16 = DictGetNumber(v6, @"tat_threadId", a3);
  if (!v16)
  {
    if (*a3)
    {
      WRMakeError(7, @"WRTimestampAndThread: No threadID in dict", v10, v11, v12, v13, v14, v15, v28);
      v26 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_20;
  }
  v23 = DictGetNumber(v6, @"tat_machContTimeNs", a3);
  if (!v23)
  {
    if (*a3)
    {
      WRMakeError(7, @"WRTimestampAndThread: No machContTimeNs in dict", v17, v18, v19, v20, v21, v22, v28);
      v26 = 0;
      *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    goto LABEL_19;
  }
  v24 = DictGetNumber(v6, @"tat_date", a3);
  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x263EFF910]);
    [v24 doubleValue];
    v26 = (id *)objc_msgSend(v25, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v26 = 0;
    if (*a3) {
      goto LABEL_18;
    }
  }
  a1 = -[WRTimestampAndThread initWithPID:threadID:machContTimeNs:date:](a1, v9, (void *)[v16 unsignedLongLongValue], objc_msgSend(v23, "unsignedLongLongValue"), v26);

  v26 = a1;
LABEL_18:

LABEL_19:
LABEL_20:

LABEL_21:
  return v26;
}

- (void)insertIntoSortedArray:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    objc_msgSend(v3, "insertObject:atIndex:", a1, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", a1, 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global));
  }
}

uint64_t __46__WRTimestampAndThread_insertIntoSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 machContTimeNs];
  if (v6 <= [v5 machContTimeNs])
  {
    unint64_t v8 = [v4 machContTimeNs];
    if (v8 >= [v5 machContTimeNs]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)machContTimeNs
{
  return self->_machContTimeNs;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void).cxx_destruct
{
}

@end