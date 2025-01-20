@interface PKApplicationMessageViewContext
- (PKApplicationMessageViewContext)init;
- (void)initForNode:(void *)a1;
- (void)setNode:(uint64_t)a1;
@end

@implementation PKApplicationMessageViewContext

- (PKApplicationMessageViewContext)init
{
  return 0;
}

- (void)initForNode:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKApplicationMessageViewContext;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    if (v5) {
      v5[2] = v4;
    }
    a1 = v5;
    v6 = a1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setNode:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(id *)(a1 + 16) != v3)
    {
      *(void *)(a1 + 16) = v3;
      uint64_t v4 = *(void *)(a1 + 32);
      id v6 = v3;
      unint64_t v5 = [v3 numberOfChildren] + v4;
      id v3 = v6;
      if (v5 <= 1) {
        *(unsigned char *)(a1 + 8) = 0;
      }
    }
  }
}

@end