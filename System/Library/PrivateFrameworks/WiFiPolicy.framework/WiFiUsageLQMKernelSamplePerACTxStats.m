@interface WiFiUsageLQMKernelSamplePerACTxStats
+ (id)sampleWithTimestamp:(id)a3;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSamplePerACTxStats)initWithTimestamp:(id)a3;
- (double)duration;
- (id)description;
- (void)populateTXStats:(int)a3 With:(unsigned int)a4 ForQueue:(int)a5;
- (void)setDuration:(double)a3;
@end

@implementation WiFiUsageLQMKernelSamplePerACTxStats

+ (id)sampleWithTimestamp:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTimestamp:v3];

  return v4;
}

- (WiFiUsageLQMKernelSamplePerACTxStats)initWithTimestamp:(id)a3
{
  v4 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMKernelSamplePerACTxStats;
  v5 = [(WiFiUsageLQMKernelSamplePerACTxStats *)&v8 init];
  timestamp = v5->_timestamp;
  v5->_timestamp = v4;

  return v5;
}

- (void)populateTXStats:(int)a3 With:(unsigned int)a4 ForQueue:(int)a5
{
  uint64_t v6 = *(void *)&a3;
  objc_super v8 = @"BE";
  int v9 = 1;
  switch(a5)
  {
    case 0:
      break;
    case 1:
      objc_super v8 = @"BK";
      break;
    case 2:
      objc_super v8 = @"VI";
      break;
    case 3:
      objc_super v8 = @"VO";
      break;
    case 4:
      objc_super v8 = @"Mcast";
      break;
    default:
      NSLog(&cfstr_SUnknownQueueT.isa, a2, "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]", a5);
      int v9 = 0;
      objc_super v8 = 0;
      break;
  }
  if (v6 >= 0xB)
  {
    NSLog(&cfstr_SUnknownStatTa.isa, a2, "-[WiFiUsageLQMKernelSamplePerACTxStats populateTXStats:With:ForQueue:]", v6);
  }
  else if (v9)
  {
    v10 = off_1E69BDCA8[(int)v6];
    id v12 = [NSNumber numberWithLong:a4];
    v11 = [NSString stringWithFormat:@"tx%@%@Perc", v8, v10];
    [(WiFiUsageLQMKernelSamplePerACTxStats *)self setValue:v12 forKey:v11];
  }
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(id)objc_opt_class() allLQMProperties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(WiFiUsageLQMSample *)self numberForKeyPath:v9];

        if (v10)
        {
          v11 = [(WiFiUsageLQMSample *)self numberForKeyPath:v9];
          [v3 appendFormat:@"%@:%@,", v9, v11, (void)v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [NSString stringWithString:v3];

  return v12;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end