@interface SVTimeBasedAction
- (double)time;
- (uint64_t)block;
- (void)initWithTime:(double)a3 block:;
@end

@implementation SVTimeBasedAction

- (void)initWithTime:(double)a3 block:
{
  id v5 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SVTimeBasedAction;
    v6 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v6;
    if (v6)
    {
      *((double *)v6 + 1) = a3;
      uint64_t v7 = MEMORY[0x22A63E020](v5);
      v8 = (void *)a1[2];
      a1[2] = v7;
    }
  }

  return a1;
}

- (double)time
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)block
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end