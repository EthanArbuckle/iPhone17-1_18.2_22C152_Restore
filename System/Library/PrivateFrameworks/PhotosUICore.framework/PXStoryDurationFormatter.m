@interface PXStoryDurationFormatter
- (NSDateComponentsFormatter)dateComponentsFormatter;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation PXStoryDurationFormatter

- (void).cxx_destruct
{
}

- (id)stringFromTimeInterval:(double)a3
{
  if (fabs(a3) == INFINITY)
  {
    v4 = @"<infinite duration>";
    goto LABEL_19;
  }
  if (a3 == 0.0)
  {
    v4 = @"0s";
    goto LABEL_19;
  }
  if (a3 < 0.0)
  {
    v5 = [(PXStoryDurationFormatter *)self stringFromTimeInterval:-a3];
    v4 = [@"-" stringByAppendingString:v5];
LABEL_7:

    goto LABEL_19;
  }
  if (a3 * 1000000.0 >= 10.0)
  {
    if (a3 * 1000.0 >= 1.0)
    {
      if (a3 * 1000.0 >= 10.0)
      {
        if (a3 >= 1.0)
        {
          if (a3 >= 10.0)
          {
            v5 = [(PXStoryDurationFormatter *)self dateComponentsFormatter];
            uint64_t v8 = [v5 stringFromTimeInterval:a3];
            v9 = (void *)v8;
            v10 = @"?";
            if (v8) {
              v10 = (__CFString *)v8;
            }
            v4 = v10;

            goto LABEL_7;
          }
          uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.1fs", *(void *)&a3);
        }
        else
        {
          uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.0fms", a3 * 1000.0);
        }
      }
      else
      {
        uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.1fms", a3 * 1000.0);
      }
    }
    else
    {
      uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.0fµs", a3 * 1000000.0);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%0.1fµs", a3 * 1000000.0);
  }
  v4 = (__CFString *)v6;
LABEL_19:
  return v4;
}

- (NSDateComponentsFormatter)dateComponentsFormatter
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dateComponentsFormatter)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    dateComponentsFormatter = v2->_dateComponentsFormatter;
    v2->_dateComponentsFormatter = v3;

    [(NSDateComponentsFormatter *)v2->_dateComponentsFormatter setAllowedUnits:224];
    [(NSDateComponentsFormatter *)v2->_dateComponentsFormatter setUnitsStyle:1];
    [(NSDateComponentsFormatter *)v2->_dateComponentsFormatter setZeroFormattingBehavior:1];
  }
  objc_sync_exit(v2);

  v5 = v2->_dateComponentsFormatter;
  return v5;
}

@end