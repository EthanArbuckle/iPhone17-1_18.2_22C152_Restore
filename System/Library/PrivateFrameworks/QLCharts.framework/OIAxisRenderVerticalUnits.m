@interface OIAxisRenderVerticalUnits
@end

@implementation OIAxisRenderVerticalUnits

CFStringRef ___OIAxisRenderVerticalUnits_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  double v3 = (double)a2;
  double v4 = *(double *)(a1 + 40);
  double v5 = 1.0;
  if (*(double *)(a1 + 32) / v4 + 1.0 <= (double)a2)
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    double v7 = v4 * v3;
    if (((v4 * v3 <= 0.0) & OIAxisIsLogarithmic(*(void *)(a1 + 48))) == 0) {
      double v5 = v7;
    }
    uint64_t Type = OIAxisGetType(*(void *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 48);
    if (Type == 3)
    {
      CFStringRef ICUFormating = (const __CFString *)OIAxisGetICUFormating(v9);
      return OIFormatterCreatePercentStringFromDouble(ICUFormating, v5);
    }
    else
    {
      uint64_t v12 = OIAxisGetType(v9);
      uint64_t v13 = *(void *)(a1 + 48);
      if (v12 == 2)
      {
        CFStringRef v14 = (const __CFString *)OIAxisGetICUFormating(v13);
        return OIFormatterCreateDateStringFromDouble(v14, v5);
      }
      else
      {
        uint64_t CustomNumberFormatter = OIAxisGetCustomNumberFormatter(v13);
        if (CustomNumberFormatter)
        {
          uint64_t v16 = CustomNumberFormatter;
          CustomFormatterCallback = (uint64_t (*)(void))OIChartGetCustomFormatterCallback(*(void *)(a1 + 56));
          return (CFStringRef)OIFormatterCreateStringUsingCustomFormatter(v16, CustomFormatterCallback);
        }
        else
        {
          CFStringRef v18 = (const __CFString *)OIAxisGetICUFormating(*(void *)(a1 + 48));
          return OIFormatterCreateStringFromDouble(v18, v5);
        }
      }
    }
  }
}

double ___OIAxisRenderVerticalUnits_block_invoke_2(uint64_t a1, double a2)
{
  if (*(void *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 32);
    double v3 = 5.0;
  }
  else
  {
    double v2 = *(double *)(a1 + 32) - a2 - *(double *)(a1 + 56);
    double v3 = -5.0;
  }
  return floor(v2 + v3) + 0.5;
}

@end