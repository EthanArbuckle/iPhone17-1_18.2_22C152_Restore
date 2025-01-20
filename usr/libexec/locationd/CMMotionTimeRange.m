@interface CMMotionTimeRange
+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3;
- (CMMotionTimeRange)initWithCoder:(id)a3;
- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMotionTimeRange

- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CMMotionTimeRange;
  v6 = [(CMMotionTimeRange *)&v8 init];
  if (v6)
  {
    v6->fStartDate = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3];
    v6->fEndDate = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMMotionTimeRange;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  if (v4)
  {
    v4[2] = [(NSDate *)self->fStartDate copy];
    v4[3] = [(NSDate *)self->fEndDate copy];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionTimeRange)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMMotionTimeRange;
  v4 = [(CMMotionTimeRange *)&v6 init];
  if (v4)
  {
    v4->fStartDate = (NSDate *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMMotionTimeRangeCodingKeyStartDate"];
    v4->fEndDate = (NSDate *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMMotionTimeRangeCodingKeyEndDate"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->fStartDate forKey:@"kCMMotionTimeRangeCodingKeyStartDate"];
  fEndDate = self->fEndDate;

  [a3 encodeObject:fEndDate forKey:@"kCMMotionTimeRangeCodingKeyEndDate"];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@,<startDate %@, endDate %@>", NSStringFromClass(v3), [(CMMotionTimeRange *)self startDate], [(CMMotionTimeRange *)self endDate]];
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3
{
  objc_super v3 = [[CMMotionTimeRange alloc] initWithStartDate:a3.var0 endDate:a3.var1];

  return v3;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"CMMotionTimeRange.mm", 101, @"Invalid parameter not satisfying: %@", @"timeRange" object file lineNumber description];
  }
  [objc_msgSend(a3, "startDate") timeIntervalSinceReferenceDate];
  double v5 = v4;
  [objc_msgSend(a3, "endDate") timeIntervalSinceReferenceDate];
  double v7 = v6;
  double v8 = v5;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

@end