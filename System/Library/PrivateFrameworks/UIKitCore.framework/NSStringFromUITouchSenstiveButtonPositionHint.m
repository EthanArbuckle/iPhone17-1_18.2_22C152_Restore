@interface NSStringFromUITouchSenstiveButtonPositionHint
@end

@implementation NSStringFromUITouchSenstiveButtonPositionHint

uint64_t ___NSStringFromUITouchSenstiveButtonPositionHint_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = 0;
  switch(a2)
  {
    case 1:
      v3 = @"fastSwipe";
      break;
    case 2:
      v3 = @"lowConfidenceSwipe";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 4:
      v3 = @"liftOffPredicted";
      break;
    case 8:
      v3 = @"clickDownPredicted";
      break;
    default:
      v3 = @"clickReleaseWindow";
      if (a2 != 16) {
        v3 = 0;
      }
      break;
  }
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = 48;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    uint64_t v5 = 40;
  }
  uint64_t result = [v4 appendFormat:@"%@%@", *(void *)(a1 + v5), v3];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  return result;
}

@end