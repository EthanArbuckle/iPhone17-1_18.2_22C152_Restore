@interface UIEventHIDGetTransformEventComponents
@end

@implementation UIEventHIDGetTransformEventComponents

uint64_t ___UIEventHIDGetTransformEventComponents_block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = IOHIDEventGetType();
  switch(result)
  {
    case 4:
      uint64_t v8 = a1[6];
      goto LABEL_7;
    case 5:
      uint64_t v8 = a1[5];
      goto LABEL_7;
    case 7:
      uint64_t v8 = a1[4];
LABEL_7:
      *(void *)(*(void *)(v8 + 8) + 24) = a2;
      break;
  }
  if (*(void *)(*(void *)(a1[4] + 8) + 24) && *(void *)(*(void *)(a1[5] + 8) + 24))
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

@end