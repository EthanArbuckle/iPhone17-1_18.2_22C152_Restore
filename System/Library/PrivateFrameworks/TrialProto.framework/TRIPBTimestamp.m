@interface TRIPBTimestamp
+ (id)descriptor;
- (NSDate)date;
- (TRIPBTimestamp)initWithDate:(id)a3;
- (TRIPBTimestamp)initWithTimeIntervalSince1970:(double)a3;
- (double)timeIntervalSince1970;
- (void)setDate:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation TRIPBTimestamp

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_11;
  if (!_MergedGlobals_11)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE548) {
      qword_1EB3EE548 = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_11) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRITimestamp.pbobjc.m", 96, @"Startup recursed!");
    }
    _MergedGlobals_11 = (uint64_t)v2;
  }
  return v2;
}

- (TRIPBTimestamp)initWithDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return -[TRIPBTimestamp initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:");
}

- (TRIPBTimestamp)initWithTimeIntervalSince1970:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TRIPBTimestamp;
  v4 = [(TRIPBMessage *)&v9 init];
  if (v4)
  {
    double __y = 0.0;
    double v5 = modf(a3, &__y);
    double v6 = __y;
    if (v5 < 0.0)
    {
      double v6 = __y + -1.0;
      double v5 = v5 + 1.0;
    }
    uint64_t v7 = (int)(v5 * 1000000000.0);
    [(TRIPBTimestamp *)v4 setSeconds:(uint64_t)v6];
    [(TRIPBTimestamp *)v4 setNanos:v7];
  }
  return v4;
}

- (NSDate)date
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(TRIPBTimestamp *)self timeIntervalSince1970];
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  -[TRIPBTimestamp setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:");
}

- (double)timeIntervalSince1970
{
  uint64_t v3 = [(TRIPBTimestamp *)self seconds];
  return (double)(int)[(TRIPBTimestamp *)self nanos] / 1000000000.0 + (double)v3;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  double __y = 0.0;
  double v4 = modf(a3, &__y);
  double v5 = __y;
  if (v4 < 0.0)
  {
    double v5 = __y + -1.0;
    double v4 = v4 + 1.0;
  }
  uint64_t v6 = (int)(v4 * 1000000000.0);
  [(TRIPBTimestamp *)self setSeconds:(uint64_t)v5];
  [(TRIPBTimestamp *)self setNanos:v6];
}

@end