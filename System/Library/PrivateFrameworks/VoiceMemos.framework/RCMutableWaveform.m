@interface RCMutableWaveform
- (BOOL)clipToTimeRange:(id)a3;
- (id)classForCoder;
- (void)addSegment:(id)a3;
- (void)addSegments:(id)a3;
- (void)removeAllSegments;
- (void)removeSegment:(id)a3;
- (void)setSegments:(id)a3;
@end

@implementation RCMutableWaveform

- (void)setSegments:(id)a3
{
  v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  v6 = (void *)[v5 mutableCopy];

  v7.receiver = v4;
  v7.super_class = (Class)RCMutableWaveform;
  [(RCWaveform *)&v7 setSegments:v6];

  objc_sync_exit(v4);
}

- (BOOL)clipToTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = objc_opt_class();
  objc_super v7 = [(RCWaveform *)v5 segments];
  v8 = objc_msgSend(v6, "_mutableSegmentsByClippingToTimeRange:withSegments:", v7, var0, var1);

  if ([v8 count])
  {
    v9 = [v8 objectAtIndex:0];
    [v9 timeRange];
    if (v10 > 0.0)
    {
      [v9 timeRange];
      uint64_t v12 = +[RCWaveformSegment segmentsByShiftingSegments:v8 byTimeOffset:-v11];

      v8 = (void *)v12;
    }
  }
  objc_sync_exit(v5);

  [(RCMutableWaveform *)v5 setSegments:v8];
  return 1;
}

- (void)addSegment:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(RCWaveform *)v4 segments];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)addSegments:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(RCWaveform *)v4 segments];
  [v5 addObjectsFromArray:v6];

  objc_sync_exit(v4);
}

- (void)removeSegment:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(RCWaveform *)v4 segments];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)removeAllSegments
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(RCWaveform *)obj segments];
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (id)classForCoder
{
  return (id)objc_opt_class();
}

@end