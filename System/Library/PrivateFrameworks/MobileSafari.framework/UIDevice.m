@interface UIDevice
@end

@implementation UIDevice

uint64_t __54__UIDevice_MobileSafariExtras__safari_mainScreenClass__block_invoke()
{
  uint64_t result = _SFDeviceHasRectangularScreen();
  if (result)
  {
    uint64_t v1 = 0;
    goto LABEL_20;
  }
  uint64_t result = _SFDeviceIsPad();
  if (result)
  {
    uint64_t v1 = 1;
    goto LABEL_20;
  }
  uint64_t result = MGGetSInt32Answer();
  if (result > 0x1F) {
    goto LABEL_17;
  }
  if (((1 << result) & 0xC8000) != 0)
  {
    uint64_t v1 = 2;
    goto LABEL_20;
  }
  if (((1 << result) & 0x3400000) == 0)
  {
    if (((1 << result) & 0xC0000000) != 0)
    {
      uint64_t v1 = 4;
      goto LABEL_20;
    }
LABEL_17:
    if (result == -1) {
      uint64_t v1 = 0;
    }
    else {
      uint64_t v1 = 3;
    }
    goto LABEL_20;
  }
  uint64_t v1 = 2;
  uint64_t result = MGGetProductType();
  if (result != 1169082144 && result != 3001488778 && result != 3885279870)
  {
    if (result == 4201643249) {
      uint64_t v1 = 2;
    }
    else {
      uint64_t v1 = 3;
    }
  }
LABEL_20:
  safari_mainScreenClass_mainScreenClass = v1;
  return result;
}

@end