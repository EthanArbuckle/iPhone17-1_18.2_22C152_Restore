@interface OIAxisRenderVerticalLabels
@end

@implementation OIAxisRenderVerticalLabels

CFStringRef ___OIAxisRenderVerticalLabels_block_invoke(uint64_t a1, CFIndex a2, unsigned char *a3)
{
  if (*(void *)(a1 + 32) <= a2 || *(double *)(a1 + 40) + 1.0 <= (double)a2)
  {
    CFStringRef result = 0;
    *a3 = 1;
  }
  else
  {
    uint64_t Type = OIAxisGetType(*(void *)(a1 + 48));
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), a2);
    if (Type == 2)
    {
      double valuePtr = 0.0;
      CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr);
      CFAbsoluteTime v7 = valuePtr;
      CFStringRef ICUFormating = (const __CFString *)OIAxisGetICUFormating(*(void *)(a1 + 48));
      return OIFormatterCreateDateStringFromDouble(ICUFormating, v7);
    }
    else
    {
      return (CFStringRef)CFRetain(ValueAtIndex);
    }
  }
  return result;
}

double ___OIAxisRenderVerticalLabels_block_invoke_2(uint64_t a1, double a2)
{
  double v2 = ceil(a2);
  uint64_t v3 = 32;
  if (!*(unsigned char *)(a1 + 88)) {
    uint64_t v3 = 48;
  }
  return floor(*(double *)(a1 + v3) - v2 - *(double *)(a1 + 80)) + 0.5;
}

@end