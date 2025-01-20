@interface OIAxisRenderHorizontalDates
@end

@implementation OIAxisRenderHorizontalDates

CFStringRef ___OIAxisRenderHorizontalDates_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
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

double ___OIAxisRenderHorizontalDates_block_invoke_2(uint64_t a1, double a2)
{
  return floor(*(double *)(a1 + 32) - a2 * 0.5) + 0.5;
}

@end