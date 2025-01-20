@interface FCPersistenceCoder
- (id)_codeData:(uint64_t)a1;
- (id)encodeData:(void *)a1;
- (void)initWithKey:(void *)a1;
@end

@implementation FCPersistenceCoder

- (void)initWithKey:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FCPersistenceCoder;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (id)encodeData:(void *)a1
{
  if (a1)
  {
    a1 = -[FCPersistenceCoder _codeData:]((uint64_t)a1, a2);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_codeData:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 8) length])
    {
      id v4 = (id) [v3 mutableCopy];
      v5 = (unsigned char *)[v4 mutableBytes];
      uint64_t v6 = [v4 length];
      objc_super v7 = (char *)[*(id *)(a1 + 8) bytes];
      uint64_t v8 = [*(id *)(a1 + 8) length];
      if (v6 >= 1)
      {
        v9 = &v5[v6];
        v10 = &v7[v8];
        do
        {
          char v11 = *v7++;
          *v5++ ^= v11;
          if (v7 == v10) {
            objc_super v7 = (char *)[*(id *)(a1 + 8) bytes];
          }
        }
        while (v5 < v9);
      }
    }
    else
    {
      id v4 = v3;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __32__FCPersistenceCoder__codeData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
}

@end