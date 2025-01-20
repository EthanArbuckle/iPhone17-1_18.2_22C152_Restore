@interface UISwipeHandler
@end

@implementation UISwipeHandler

uint64_t __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke(uint64_t a1)
{
  v2 = *(unsigned __int8 **)(a1 + 32);
  unsigned int v3 = v2[8];
  if (v3) {
    return (v3 >> 1) & 1;
  }
  uint64_t result = [v2 _swipeRecognizerBegan:*(void *)(a1 + 40)];
  if (result) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(*(void *)(a1 + 32) + 8) & 0xFD | v5;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) |= 1u;
  return result;
}

uint64_t __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end