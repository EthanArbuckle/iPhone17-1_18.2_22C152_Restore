@interface FCFetchGroup
- (NSDate)requestDate;
- (OS_dispatch_queue)completionQueue;
- (id)completion;
- (id)initWithKeys:(void *)a3 context:(char)a4 shouldFilter:(void *)a5 qualityOfService:(void *)a6 relativePriority:(void *)a7 completionQueue:(void *)a8 completion:;
- (int64_t)comparePriority:(id)a3;
- (void)fireCompletion;
- (void)setRequestDate:(id)a3;
@end

@implementation FCFetchGroup

- (void)fireCompletion
{
  if (a1)
  {
    uint64_t v2 = [a1 completionQueue];
    if (v2)
    {
      v3 = (void *)v2;
      v4 = [a1 completion];

      if (v4)
      {
        queue = [a1 completionQueue];
        v5 = [a1 completion];
        dispatch_async(queue, v5);
      }
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)initWithKeys:(void *)a3 context:(char)a4 shouldFilter:(void *)a5 qualityOfService:(void *)a6 relativePriority:(void *)a7 completionQueue:(void *)a8 completion:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a7;
  id v18 = a8;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)FCFetchGroup;
    a1 = (id *)objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      uint64_t v19 = [v15 copy];
      id v20 = a1[2];
      a1[2] = (id)v19;

      objc_storeStrong(a1 + 3, a3);
      *((unsigned char *)a1 + 8) = a4;
      BOOL v21 = 1;
      a1[4] = a5;
      a1[5] = a6;
      if (a5 != (void *)25 && a5 != (void *)33) {
        BOOL v21 = a6 == (void *)1;
      }
      *((unsigned char *)a1 + 9) = v21;
      objc_storeStrong(a1 + 7, a7);
      v22 = _Block_copy(v18);
      id v23 = a1[8];
      a1[8] = v22;

      uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
      id v25 = a1[9];
      a1[9] = (id)v24;
    }
  }

  return a1;
}

- (int64_t)comparePriority:(id)a3
{
  v4 = (int64_t *)a3;
  v5 = v4;
  if (self)
  {
    int64_t relativePriority = self->_relativePriority;
    if (v4)
    {
      int64_t v7 = v4[5];
      if (relativePriority == v7)
      {
        if (self->_isUserFacing)
        {
          if (!*((unsigned char *)v4 + 9))
          {
LABEL_6:
            int64_t v8 = -1;
            goto LABEL_19;
          }
LABEL_18:
          v11 = [(FCFetchGroup *)self requestDate];
          v12 = [v5 requestDate];
          int64_t v8 = [v11 compare:v12];

          goto LABEL_19;
        }
LABEL_10:
        if (*((unsigned char *)v4 + 9))
        {
          int64_t v8 = 1;
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (!relativePriority)
      {
        if (self->_isUserFacing) {
          goto LABEL_6;
        }
        goto LABEL_18;
      }
      int64_t v7 = 0;
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_18;
    }
    int64_t v7 = v4[5];
    if (!v7) {
      goto LABEL_10;
    }
    int64_t relativePriority = 0;
  }
  BOOL v9 = v7 < relativePriority;
  BOOL v10 = v7 > relativePriority;
  if (v9) {
    int64_t v8 = -1;
  }
  else {
    int64_t v8 = v10;
  }
LABEL_19:

  return v8;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

@end