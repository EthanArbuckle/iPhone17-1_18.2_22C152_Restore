@interface OIAxisRenderVerticalDates
@end

@implementation OIAxisRenderVerticalDates

CFStringRef ___OIAxisRenderVerticalDates_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  double v3 = (double)a2;
  if (*(double *)(a1 + 32) <= (double)a2)
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    double MinValue = OIAxisGetMinValue(*(void *)(a1 + 40));
    double v6 = MinValue + v3 * OIAxisGetUnit(*(void *)(a1 + 40));
    uint64_t CustomNumberFormatter = OIAxisGetCustomNumberFormatter(*(void *)(a1 + 40));
    if (CustomNumberFormatter)
    {
      uint64_t v8 = CustomNumberFormatter;
      CustomFormatterCallback = (uint64_t (*)(void))OIChartGetCustomFormatterCallback(*(void *)(a1 + 48));
      return (CFStringRef)OIFormatterCreateStringUsingCustomFormatter(v8, CustomFormatterCallback);
    }
    else
    {
      CFStringRef ICUFormating = (const __CFString *)OIAxisGetICUFormating(*(void *)(a1 + 40));
      return OIFormatterCreateDateStringFromDouble(ICUFormating, v6);
    }
  }
}

double ___OIAxisRenderVerticalDates_block_invoke_2(uint64_t a1, double a2)
{
  double v2 = ceil(a2);
  uint64_t v3 = 32;
  if (!*(unsigned char *)(a1 + 88)) {
    uint64_t v3 = 48;
  }
  return floor(*(double *)(a1 + v3) - v2 - *(double *)(a1 + 80)) + 0.5;
}

@end