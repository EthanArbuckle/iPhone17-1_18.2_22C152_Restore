@interface TRIPBDuration
+ (id)descriptor;
- (TRIPBDuration)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (void)setTimeInterval:(double)a3;
@end

@implementation TRIPBDuration

+ (id)descriptor
{
  id v2 = (id)_MergedGlobals_15;
  if (!_MergedGlobals_15)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    if (!qword_1EB3EE588) {
      qword_1EB3EE588 = [[TRIPBFileDescriptor alloc] initWithPackage:@"google.protobuf" objcPrefix:@"TRIPB" syntax:3];
    }
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, v8);
    if (_MergedGlobals_15) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"TRIDuration.pbobjc.m", 96, @"Startup recursed!");
    }
    _MergedGlobals_15 = (uint64_t)v2;
  }
  return v2;
}

- (TRIPBDuration)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TRIPBDuration;
  v4 = [(TRIPBMessage *)&v7 init];
  if (v4)
  {
    double __y = 0.0;
    uint64_t v5 = (int)(modf(a3, &__y) * 1000000000.0);
    [(TRIPBDuration *)v4 setSeconds:(uint64_t)__y];
    [(TRIPBDuration *)v4 setNanos:v5];
  }
  return v4;
}

- (double)timeInterval
{
  uint64_t v3 = [(TRIPBDuration *)self seconds];
  return (double)(int)[(TRIPBDuration *)self nanos] / 1000000000.0 + (double)v3;
}

- (void)setTimeInterval:(double)a3
{
  double __y = 0.0;
  uint64_t v4 = (int)(modf(a3, &__y) * 1000000000.0);
  [(TRIPBDuration *)self setSeconds:(uint64_t)__y];
  [(TRIPBDuration *)self setNanos:v4];
}

@end