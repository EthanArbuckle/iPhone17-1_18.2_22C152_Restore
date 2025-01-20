@interface PLManagedAsset(PXLocalization)
- (uint64_t)px_displayType;
@end

@implementation PLManagedAsset(PXLocalization)

- (uint64_t)px_displayType
{
  switch([a1 playbackStyle])
  {
    case 0u:
      uint64_t result = 1;
      break;
    case 1u:
    case 3u:
      if ([a1 playbackVariation] == 3) {
        uint64_t result = 5;
      }
      else {
        uint64_t result = 1;
      }
      break;
    case 2u:
      uint64_t result = 6;
      break;
    case 4u:
      uint64_t result = 2;
      break;
    case 5u:
      int v3 = [a1 playbackVariation];
      uint64_t v4 = 2;
      if (v3 == 2) {
        uint64_t v4 = 3;
      }
      if (v3 == 1) {
        uint64_t result = 4;
      }
      else {
        uint64_t result = v4;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

@end