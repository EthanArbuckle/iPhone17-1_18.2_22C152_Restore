@interface CMHandDetectionDelegateInternal
- (id).cxx_construct;
- (void)callHandednessManager:(id)a3 didUpdateState:(int64_t)a4;
- (void)registerHandler:(void *)a3;
@end

@implementation CMHandDetectionDelegateInternal

- (void)callHandednessManager:(id)a3 didUpdateState:(int64_t)a4
{
  if (a3)
  {
    uint64_t v4 = *((void *)self + 1);
    if (v4) {
      (*(void (**)(uint64_t, int64_t))(v4 + 16))(v4, a4);
    }
  }
}

- (void)registerHandler:(void *)a3
{
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  v5 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    _Block_release(v5);
  }
}

- (void).cxx_destruct
{
  v2 = (const void *)*((void *)self + 1);
  if (v2) {
    _Block_release(v2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end