@interface MXMMutableSampleData
- (id)appendDoubleValue:(double)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)appendFloatValue:(float)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)appendIntValue:(int)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)appendIntegerValue:(int64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)appendSample:(id)a3;
- (id)appendUnsignedIntValue:(unsigned int)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)appendUnsignedIntegerValue:(unint64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendAttributes:(id)a3;
- (void)appendData:(id)a3;
- (void)appendSet:(id)a3;
@end

@implementation MXMMutableSampleData

- (void)appendAttributes:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MXMSampleData *)self _appendAttribute:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)appendData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleData;
  [(MXMSampleData *)&v3 _appendData:a3];
}

- (void)appendSet:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MXMMutableSampleData;
  [(MXMSampleData *)&v3 _appendSet:a3];
}

- (id)appendSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];
  uint64_t v6 = [v4 attributes];
  uint64_t v7 = [(MXMSampleData *)self sampleSetWithTag:v5 attributes:v6];

  if (!v7)
  {
    uint64_t v8 = [MXMMutableSampleSet alloc];
    long long v9 = [v4 tag];
    long long v10 = [v4 unit];
    long long v11 = [v4 attributes];
    long long v12 = [(MXMSampleSet *)v8 initWithTag:v9 unit:v10 attributes:v11];
    [(MXMSampleData *)self _appendSet:v12];
  }
  switch([v4 valueType])
  {
    case 0:
      [v4 floatValue];
      double v14 = v13;
      v15 = [v4 tag];
      -[MXMMutableSampleData appendDoubleValue:tag:timestamp:](self, "appendDoubleValue:tag:timestamp:", v15, [v4 timestamp], v14);
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      uint64_t v17 = [v4 integerValue];
      v15 = [v4 tag];
      -[MXMMutableSampleData appendIntegerValue:tag:timestamp:](self, "appendIntegerValue:tag:timestamp:", v17, v15, [v4 timestamp]);
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      uint64_t v18 = [v4 unsignedValue];
      v15 = [v4 tag];
      -[MXMMutableSampleData appendUnsignedIntegerValue:tag:timestamp:](self, "appendUnsignedIntegerValue:tag:timestamp:", v18, v15, [v4 timestamp]);
      v16 = (MXMMutableSampleData *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      self = v16;

      break;
    case 3:
      id v20 = (id)objc_opt_new();
      objc_exception_throw(v20);
    default:
      break;
  }

  return self;
}

- (id)appendFloatValue:(float)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    double v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MXMSampleData.m", 272, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  *(float *)&double v11 = a3;
  [v10 appendFloatValue:a5 timestamp:v11];
  return v10;
}

- (id)appendDoubleValue:(double)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMSampleData.m", 276, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  [v10 appendDoubleValue:a5 timestamp:a3];
  return v10;
}

- (id)appendUnsignedIntValue:(unsigned int)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMSampleData.m", 280, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  [v10 appendUnsignedIntValue:v6 timestamp:a5];
  return v10;
}

- (id)appendIntValue:(int)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMSampleData.m", 284, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  [v10 appendIntValue:v6 timestamp:a5];
  return v10;
}

- (id)appendIntegerValue:(int64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMSampleData.m", 288, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  [v10 appendIntegerValue:a3 timestamp:a5];
  return v10;
}

- (id)appendUnsignedIntegerValue:(unint64_t)a3 tag:(id)a4 timestamp:(unint64_t)a5
{
  long long v9 = [(MXMSampleData *)self sampleSetsWithTag:a4];
  long long v10 = [v9 firstObject];

  if (!v10)
  {
    long long v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMSampleData.m", 292, @"Invalid parameter not satisfying: %@", @"set" object file lineNumber description];
  }
  [v10 appendUnsignedIntegerValue:a3 timestamp:a5];
  return v10;
}

- (id)copy
{
  return [(MXMMutableSampleData *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MXMMutableSampleData;
  return [(MXMSampleData *)&v4 mutableCopyWithZone:a3];
}

@end