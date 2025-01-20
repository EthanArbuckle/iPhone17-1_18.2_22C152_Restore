@interface UIScreenAllScreens
@end

@implementation UIScreenAllScreens

void ___UIScreenAllScreens_block_invoke(uint64_t a1)
{
  if (qword_1EB25C5E8 != -1) {
    dispatch_once(&qword_1EB25C5E8, &__block_literal_global_899_0);
  }
  id v5 = (id)qword_1EB25C5F0;
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end