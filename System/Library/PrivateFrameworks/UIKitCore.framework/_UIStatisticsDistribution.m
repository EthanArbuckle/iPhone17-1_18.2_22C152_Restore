@interface _UIStatisticsDistribution
- (BOOL)isTimingForObject:(id)a3;
- (void)cancelTimingForObject:(id)a3;
- (void)recordTimingForObject:(id)a3;
- (void)startTimingForObject:(id)a3;
@end

@implementation _UIStatisticsDistribution

- (void)startTimingForObject:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", +[_UIStatistics currentTime](_UIStatistics, "currentTime"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, self, v6, (void *)0x303);
}

- (void)recordTimingForObject:(id)a3
{
  id object = a3;
  v4 = objc_getAssociatedObject(object, self);
  id v5 = v4;
  if (v4)
  {
    -[_UIStatistics _recordDistributionTime:](self, "_recordDistributionTime:", [v4 unsignedLongLongValue]);
    objc_setAssociatedObject(object, self, 0, (void *)0x303);
  }
}

- (BOOL)isTimingForObject:(id)a3
{
  v3 = objc_getAssociatedObject(a3, self);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)cancelTimingForObject:(id)a3
{
}

@end