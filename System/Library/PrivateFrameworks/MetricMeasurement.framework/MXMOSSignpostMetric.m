@interface MXMOSSignpostMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldAlwaysWrapInProxy;
- (BOOL)_shouldConstructProbe;
- (BOOL)_shouldNeverWrapInProxy;
- (MXMOSSignpostMetric)init;
- (MXMOSSignpostMetric)initWithCoder:(id)a3;
- (MXMOSSignpostMetric)initWithSubsystem:(id)a3;
- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4;
- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (NSString)category;
- (NSString)name;
- (NSString)subsystem;
- (id)_constructProbe;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_sampleMode;
- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5;
- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4;
- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5;
- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMOSSignpostMetric

- (NSString)subsystem
{
  v2 = [(MXMMetric *)self filter];
  v3 = [v2 attributeFilterWithName:@"os_signpost subsystem"];
  v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)category
{
  v2 = [(MXMMetric *)self filter];
  v3 = [v2 attributeFilterWithName:@"os_signpost category"];
  v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)name
{
  v2 = [(MXMMetric *)self filter];
  v3 = [v2 attributeFilterWithName:@"os_signpost name"];
  v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (unint64_t)_sampleMode
{
  return 2;
}

- (BOOL)_shouldConstructProbe
{
  if (!self->_startDate_semaphore)
  {
    v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    startDate_semaphore = self->_startDate_semaphore;
    self->_startDate_semaphore = v3;
  }
  if (!self->_stopDate_semaphore)
  {
    v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    stopDate_semaphore = self->_stopDate_semaphore;
    self->_stopDate_semaphore = v5;
  }
  return 1;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 1;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 0;
}

- (id)_constructProbe
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  startDate_semaphore = self->_startDate_semaphore;
  if (startDate_semaphore)
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(startDate_semaphore, v5);
  }
  stopDate_semaphore = self->_stopDate_semaphore;
  if (stopDate_semaphore)
  {
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(stopDate_semaphore, v7);
  }
  if (!self->_startDate || !self->_stopDate)
  {
    v8 = _MXMGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      startDate = self->_startDate;
      stopDate = self->_stopDate;
      *(_DWORD *)buf = 138412546;
      v16 = startDate;
      __int16 v17 = 2112;
      v18 = stopDate;
      _os_log_impl(&dword_21FA7B000, v8, OS_LOG_TYPE_ERROR, "Bad date range to search archive. Start date is %@. Stop date is %@.", buf, 0x16u);
    }

    if (!self->_startDate)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"MXMOSSignpostMetric.m", 92, @"Invalid parameter not satisfying: %@", @"_startDate" object file lineNumber description];
    }
    if (!self->_stopDate)
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"MXMOSSignpostMetric.m", 93, @"Invalid parameter not satisfying: %@", @"_stopDate" object file lineNumber description];
    }
  }
  v11 = +[MXMOSSignpostProbe probeHostSystemLogArchiveWithStartDate:endDate:startMachTime:stopMachTime:](MXMOSSignpostProbe, "probeHostSystemLogArchiveWithStartDate:endDate:startMachTime:stopMachTime:", self->_startDate);
  return v11;
}

- (MXMOSSignpostMetric)init
{
  return [(MXMOSSignpostMetric *)self initWithSubsystem:0];
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3
{
  return [(MXMOSSignpostMetric *)self initWithSubsystem:a3 category:0 name:0];
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4
{
  return [(MXMOSSignpostMetric *)self initWithSubsystem:a3 category:a4 name:0];
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF9C0] set];
  if (v8)
  {
    v12 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"os_signpost subsystem" stringValue:v8];
    [v11 addObject:v12];
  }
  if (v9)
  {
    v13 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"os_signpost category" stringValue:v9];
    [v11 addObject:v13];
  }
  if (v10)
  {
    v14 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"os_signpost name" stringValue:v10];
    [v11 addObject:v14];
  }
  v15 = [[MXMSampleFilter alloc] initWithAttributeFilters:v11];
  v16 = [(MXMMetric *)self initWithIdentifier:@"com.apple.metricmeasurement.metric.os_signpost" filter:v15];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MXMOSSignpostMetric;
  dispatch_time_t v5 = -[MXMMetric copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
    dispatch_time_t v7 = (void *)v5[8];
    v5[8] = v6;

    uint64_t v8 = [(NSDate *)self->_stopDate copyWithZone:a3];
    id v9 = (void *)v5[9];
    v5[9] = v8;

    v5[10] = self->_startMachContTime;
    v5[11] = self->_stopMachContTime;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXMOSSignpostMetric;
  id v4 = a3;
  [(MXMMetric *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"_startDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_stopDate forKey:@"_stopDate"];
  [v4 encodeInt64:self->_startMachContTime forKey:@"_startMachContTime"];
  [v4 encodeInt64:self->_stopMachContTime forKey:@"_stopMachContTime"];
}

- (MXMOSSignpostMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMOSSignpostMetric;
  objc_super v5 = [(MXMMetric *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stopDate"];
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v8;

    v5->_startMachContTime = [v4 decodeInt64ForKey:@"_startMachContTime"];
    v5->_stopMachContTime = [v4 decodeInt64ForKey:@"_stopMachContTime"];
  }

  return v5;
}

- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MXMOSSignpostMetric;
  id v6 = a4;
  [(MXMMetric *)&v9 didStartAtTime:a3 startDate:v6];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0, v9.receiver, v9.super_class);
  dispatch_time_t v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

  startDate = self->_startDate;
  self->_startDate = v7;

  self->_startMachContTime = 0;
}

- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MXMOSSignpostMetric;
  id v8 = a5;
  [(MXMMetric *)&v12 didStartAtContinuousTime:a3 absoluteTime:a4 startDate:v8];
  objc_msgSend(v8, "dateByAddingTimeInterval:", -1.0, v12.receiver, v12.super_class);
  objc_super v9 = (NSDate *)objc_claimAutoreleasedReturnValue();

  startDate = self->_startDate;
  self->_startDate = v9;

  self->_startMachContTime = a3;
  startDate_semaphore = self->_startDate_semaphore;
  if (startDate_semaphore) {
    dispatch_semaphore_signal(startDate_semaphore);
  }
}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  self->_stopMachContTime = 0;
  id v6 = a4;
  dispatch_time_t v7 = [v6 dateByAddingTimeInterval:1.0];
  stopDate = self->_stopDate;
  self->_stopDate = v7;

  v9.receiver = self;
  v9.super_class = (Class)MXMOSSignpostMetric;
  [(MXMMetric *)&v9 didStopAtTime:a3 stopDate:v6];
}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  id v8 = a5;
  self->_stopMachContTime = a3;
  objc_super v9 = [v8 dateByAddingTimeInterval:1.0];
  stopDate = self->_stopDate;
  self->_stopDate = v9;

  stopDate_semaphore = self->_stopDate_semaphore;
  if (stopDate_semaphore) {
    dispatch_semaphore_signal(stopDate_semaphore);
  }
  v12.receiver = self;
  v12.super_class = (Class)MXMOSSignpostMetric;
  [(MXMMetric *)&v12 didStopAtContinuousTime:a3 absoluteTime:a4 stopDate:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopDate_semaphore, 0);
  objc_storeStrong((id *)&self->_startDate_semaphore, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end