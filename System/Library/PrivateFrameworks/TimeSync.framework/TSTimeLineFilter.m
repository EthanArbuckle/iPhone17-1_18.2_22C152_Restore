@interface TSTimeLineFilter
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)rateRatio;
- (BOOL)canConvertTime;
- (unint64_t)domainAIntervalFromDomainBInterval:(unint64_t)a3;
- (unint64_t)domainATimeFromDomainBTime:(unint64_t)a3;
- (unint64_t)domainBIntervalFromDomainAInterval:(unint64_t)a3;
- (unint64_t)domainBTimeFromDomainATime:(unint64_t)a3;
- (void)getAnchors:(id *)a3 andRateRatio:(id *)a4;
@end

@implementation TSTimeLineFilter

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)rateRatio
{
  unint64_t v2 = -1;
  unint64_t v3 = -1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)getAnchors:(id *)a3 andRateRatio:(id *)a4
{
  if (a3)
  {
    a3->var0 = -1;
    a3->var1 = -1;
  }
  if (a4)
  {
    a4->var0 = -1;
    a4->var1 = -1;
  }
}

- (unint64_t)domainATimeFromDomainBTime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)domainAIntervalFromDomainBInterval:(unint64_t)a3
{
  return -1;
}

- (unint64_t)domainBTimeFromDomainATime:(unint64_t)a3
{
  return -1;
}

- (unint64_t)domainBIntervalFromDomainAInterval:(unint64_t)a3
{
  return -1;
}

- (BOOL)canConvertTime
{
  return 0;
}

@end