@interface MXMMutableSampleSet
- (void)appendAttribute:(id)a3;
- (void)appendDoubleValue:(double)a3 timestamp:(unint64_t)a4;
- (void)appendFloatValue:(float)a3 timestamp:(unint64_t)a4;
- (void)appendIntValue:(int)a3 timestamp:(unint64_t)a4;
- (void)appendIntegerValue:(int64_t)a3 timestamp:(unint64_t)a4;
- (void)appendSample:(id)a3;
- (void)appendSet:(id)a3;
- (void)appendUnsignedIntValue:(unsigned int)a3 timestamp:(unint64_t)a4;
- (void)appendUnsignedIntegerValue:(unint64_t)a3 timestamp:(unint64_t)a4;
@end

@implementation MXMMutableSampleSet

- (void)appendSet:(id)a3
{
  id v9 = a3;
  v5 = [(MXMSampleSet *)self attributes];
  v6 = [v9 attributes];
  char v7 = [v5 isEqualToSet:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MXMSampleSet.m", 392, @"Invalid parameter not satisfying: %@", @"[self.attributes isEqualToSet:set.attributes]" object file lineNumber description];
  }
  [(MXMSampleSet *)self _appendSet:v9];
}

- (void)appendSample:(id)a3
{
  id v9 = a3;
  v5 = [(MXMSampleSet *)self attributes];
  v6 = [v9 attributes];
  char v7 = [v5 isEqualToSet:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MXMSampleSet.m", 397, @"Invalid parameter not satisfying: %@", @"[self.attributes isEqualToSet:sample.attributes]" object file lineNumber description];
  }
  [(MXMSampleSet *)self _appendSample:v9];
}

- (void)appendAttribute:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v3 _appendAttribute:a3];
}

- (void)appendIntValue:(int)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:(double)a3];
}

- (void)appendIntegerValue:(int64_t)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:(double)a3];
}

- (void)appendUnsignedIntValue:(unsigned int)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:(double)a3];
}

- (void)appendUnsignedIntegerValue:(unint64_t)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:(double)a3];
}

- (void)appendDoubleValue:(double)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:a3];
}

- (void)appendFloatValue:(float)a3 timestamp:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleSet;
  [(MXMSampleSet *)&v4 _appendDoubleValue:a4 timestamp:a3];
}

@end