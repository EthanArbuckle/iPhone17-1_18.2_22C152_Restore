@interface UIScreenHasScreens
@end

@implementation UIScreenHasScreens

void ___UIScreenHasScreens_block_invoke(uint64_t a1)
{
  if (qword_1EB25C5E8 != -1) {
    dispatch_once(&qword_1EB25C5E8, &__block_literal_global_899_0);
  }
  id v2 = (id)qword_1EB25C5F0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 count] != 0;
}

@end