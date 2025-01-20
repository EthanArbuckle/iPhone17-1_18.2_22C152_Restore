@interface MXMSampleSet
+ (BOOL)supportsSecureCoding;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)index;
- (MXMSample)distance;
- (MXMSample)geoMean;
- (MXMSample)max;
- (MXMSample)min;
- (MXMSample)relativeStandardDeviation;
- (MXMSample)standardDeviation;
- (MXMSample)sum;
- (MXMSampleSet)initWithCoder:(id)a3;
- (MXMSampleSet)initWithTag:(id)a3 unit:(id)a4 attributes:(id)a5;
- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6;
- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 doubleValues:(double *)a7 length:(unint64_t)a8;
- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 values:(void *)a7 length:(unint64_t)a8 valueSize:(unint64_t)a9;
- (MXMSampleSet)range;
- (MXMSampleTag)tag;
- (MXMSampleTimeSeries)timeIndex;
- (NSArray)cachedSamples;
- (NSArray)samples;
- (NSMutableDictionary)attributesMap;
- (NSSet)attributes;
- (NSUnit)unit;
- (double)doubleValues;
- (double)lastDoubleValue;
- (id)attributeWithName:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)sampleWithIndex:(unint64_t)a3;
- (int64_t)underlyingBufferLength;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)length;
- (void)_appendAttribute:(id)a3;
- (void)_appendDoubleValue:(double)a3 timestamp:(unint64_t)a4;
- (void)_appendSample:(id)a3;
- (void)_appendSet:(id)a3;
- (void)_prepareUnderlyingBufferSizeWithAdditionalBytes:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedSamples:(id)a3;
- (void)setIndex:(id *)a3;
- (void)setUnderlyingBuffer:(void *)a3;
- (void)setUnderlyingBufferLength:(int64_t)a3;
- (void)underlyingBuffer;
@end

@implementation MXMSampleSet

- (MXMSample)min
{
  if ([(MXMSampleSet *)self length])
  {
    double __C = 0.0;
    vDSP_minvD([(MXMSampleSet *)self doubleValues], 1, &__C, [(MXMSampleSet *)self length]);
    v3 = [MXMSample alloc];
    v4 = [(MXMSampleSet *)self tag];
    v5 = [(MXMSampleSet *)self attributes];
    double v6 = __C;
    v7 = [(MXMSampleSet *)self unit];
    v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MXMSample)max
{
  if ([(MXMSampleSet *)self length])
  {
    double __C = 0.0;
    vDSP_maxvD([(MXMSampleSet *)self doubleValues], 1, &__C, [(MXMSampleSet *)self length]);
    v3 = [MXMSample alloc];
    v4 = [(MXMSampleSet *)self tag];
    v5 = [(MXMSampleSet *)self attributes];
    double v6 = __C;
    v7 = [(MXMSampleSet *)self unit];
    v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MXMSample)distance
{
  if ([(MXMSampleSet *)self length] == 2)
  {
    v4 = [(MXMSampleSet *)self firstDoubleValue];
    v5 = [(MXMSampleSet *)self lastDoubleValue];
    double v6 = v5;
    if (!v4 || !v5)
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"MXMSampleSet+Stats.m", 32, @"Length is correct (2), but failed to retrieve values from set. Internal Error." object file lineNumber description];
    }
    double v7 = vabdd_f64(*v4, *v6);
    v8 = [MXMSample alloc];
    v9 = [(MXMSampleSet *)self tag];
    v10 = [(MXMSampleSet *)self attributes];
    v11 = [(MXMSampleSet *)self unit];
    v12 = [(MXMSample *)v8 initWithTag:v9 attributes:v10 doubleValue:v11 unit:v7];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (MXMSampleSet)range
{
  v16[2] = *MEMORY[0x263EF8340];
  if ([(MXMSampleSet *)self length])
  {
    v3 = [(MXMSampleSet *)self min];
    [v3 floatValue];
    uint64_t v5 = v4;

    double v6 = [(MXMSampleSet *)self max];
    [v6 floatValue];
    uint64_t v8 = v7;

    v16[0] = v5;
    v16[1] = v8;
    v9 = [MXMSampleSet alloc];
    v10 = [(MXMSampleSet *)self timeIndex];
    v11 = [(MXMSampleSet *)self tag];
    v12 = [(MXMSampleSet *)self unit];
    v13 = [(MXMSampleSet *)self attributes];
    v14 = [(MXMSampleSet *)v9 initWithTime:v10 tag:v11 unit:v12 attributes:v13 doubleValues:v16 length:2];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (MXMSample)geoMean
{
  double __Mean = 0.0;
  vDSP_normalizeD([(MXMSampleSet *)self doubleValues], 1, 0, 0, &__Mean, (double *)&v10, [(MXMSampleSet *)self length]);
  v3 = [MXMSample alloc];
  uint64_t v4 = [(MXMSampleSet *)self tag];
  uint64_t v5 = [(MXMSampleSet *)self attributes];
  double v6 = __Mean;
  uint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];

  return v8;
}

- (MXMSample)standardDeviation
{
  double v10 = 0.0;
  double __Mean = 0.0;
  vDSP_normalizeD([(MXMSampleSet *)self doubleValues], 1, 0, 0, &__Mean, &v10, [(MXMSampleSet *)self length]);
  v3 = [MXMSample alloc];
  uint64_t v4 = [(MXMSampleSet *)self tag];
  uint64_t v5 = [(MXMSampleSet *)self attributes];
  double v6 = v10;
  uint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];

  return v8;
}

- (MXMSample)relativeStandardDeviation
{
  double v10 = 0.0;
  double __Mean = 0.0;
  vDSP_normalizeD([(MXMSampleSet *)self doubleValues], 1, 0, 0, &__Mean, &v10, [(MXMSampleSet *)self length]);
  v3 = [MXMSample alloc];
  uint64_t v4 = [(MXMSampleSet *)self tag];
  uint64_t v5 = [(MXMSampleSet *)self attributes];
  double v6 = v10 / __Mean;
  uint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];

  return v8;
}

- (MXMSample)sum
{
  double __C = 0.0;
  vDSP_sveD([(MXMSampleSet *)self doubleValues], 1, &__C, [(MXMSampleSet *)self length]);
  v3 = [MXMSample alloc];
  uint64_t v4 = [(MXMSampleSet *)self tag];
  uint64_t v5 = [(MXMSampleSet *)self attributes];
  double v6 = __C;
  uint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSample *)v3 initWithTag:v4 attributes:v5 doubleValue:v7 unit:v6];

  return v8;
}

- (double)lastDoubleValue
{
  v3 = [(MXMSampleSet *)self doubleValues];
  return &v3[[(MXMSampleSet *)self length] - 1];
}

- (double)doubleValues
{
  return (double *)self->_underlyingBuffer;
}

- (NSArray)samples
{
  v3 = [(MXMSampleSet *)self cachedSamples];

  if (v3)
  {
    p_cachedSamples = &self->_cachedSamples;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_index->var1];
    p_cachedSamples = &self->_cachedSamples;
    cachedSamples = self->_cachedSamples;
    self->_cachedSamples = v5;

    if (self->_index->var1)
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = self->_cachedSamples;
        v9 = [MXMSample alloc];
        double v10 = [(MXMSampleSet *)self tag];
        v11 = [(MXMSampleSet *)self attributes];
        double v12 = [(MXMSampleSet *)self doubleValues][8 * v7];
        v13 = [(MXMSampleSet *)self unit];
        v14 = [(MXMSampleSet *)self timeIndex];
        v15 = -[MXMSample initWithTag:attributes:doubleValue:unit:timestamp:](v9, "initWithTag:attributes:doubleValue:unit:timestamp:", v10, v11, v13, (unint64_t)*(double *)([v14 doubleValues] + 8 * v7), v12);
        [(NSArray *)v8 addObject:v15];

        ++v7;
      }
      while (v7 < self->_index->var1);
    }
  }
  v16 = *p_cachedSamples;
  return v16;
}

- (unint64_t)length
{
  return self->_index->var1;
}

- (NSSet)attributes
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(MXMSampleSet *)self attributesMap];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)attributeWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXMSampleSet *)self attributesMap];
  double v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (MXMSampleSet)initWithTag:(id)a3 unit:(id)a4 attributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(MXMSampleTimeSeries);
  double v12 = [(MXMSampleSet *)self initWithTime:v11 tag:v10 unit:v9 attributes:v8];

  return v12;
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6
{
  return [(MXMSampleSet *)self initWithTime:a3 tag:a4 unit:a5 attributes:a6 doubleValues:0 length:0];
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 doubleValues:(double *)a7 length:(unint64_t)a8
{
  return [(MXMSampleSet *)self initWithTime:a3 tag:a4 unit:a5 attributes:a6 values:a7 length:a8 valueSize:8];
}

- (MXMSampleSet)initWithTime:(id)a3 tag:(id)a4 unit:(id)a5 attributes:(id)a6 values:(void *)a7 length:(unint64_t)a8 valueSize:(unint64_t)a9
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v48.receiver = self;
  v48.super_class = (Class)MXMSampleSet;
  v20 = [(MXMSampleSet *)&v48 init];
  v21 = v20;
  if (v20)
  {
    __src = a7;
    id v43 = v16;
    objc_storeStrong((id *)&v20->_timeIndex, a3);
    id v41 = v17;
    uint64_t v22 = [v17 copy];
    tag = v21->_tag;
    v21->_tag = (MXMSampleTag *)v22;

    id v40 = v18;
    uint64_t v24 = [v18 copy];
    unit = v21->_unit;
    v21->_unit = (NSUnit *)v24;

    uint64_t v26 = [MEMORY[0x263EFF9A0] dictionary];
    attributesMap = v21->_attributesMap;
    v21->_attributesMap = (NSMutableDictionary *)v26;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v19;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v34 = (void *)[v33 copy];
          v35 = v21->_attributesMap;
          v36 = [v33 name];
          [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:v36];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v30);
    }

    v37 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v21->_index = v37;
    v37->var0 = a9;
    v37->var1 = a8;
    v21->_underlyingBufferLength = a9 * a8;
    v38 = malloc_type_malloc(a9 * a8, 0xF58C802EuLL);
    v21->_underlyingBuffer = v38;
    memcpy(v38, __src, v21->_index->var0 * a8);
    id v16 = v43;
    id v18 = v40;
    id v17 = v41;
  }

  return v21;
}

- (id)sampleWithIndex:(unint64_t)a3
{
  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(MXMSampleSet *)self samples];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MXMSampleSet *)self timeIndex];

  if (v4 != self) {
    [v5 encodeObject:self->_timeIndex forKey:@"_timeIndex"];
  }
  [v5 encodeObject:self->_tag forKey:@"_tag"];
  [v5 encodeObject:self->_unit forKey:@"_unit"];
  [v5 encodeBytes:self->_index length:16 forKey:@"_index"];
  [v5 encodeBytes:self->_underlyingBuffer length:self->_index->var1 * self->_index->var0 forKey:@"_underlyingBuffer"];
  [v5 encodeObject:self->_attributesMap forKey:@"_attributesMap"];
}

- (MXMSampleSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MXMSampleSet;
  id v5 = [(MXMSampleSet *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeIndex"];
    timeIndex = v5->_timeIndex;
    v5->_timeIndex = (MXMSampleTimeSeries *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tag"];
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_unit"];
    unit = v5->_unit;
    v5->_unit = (NSUnit *)v10;

    v5->_index = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    unint64_t v28 = 0;
    id v12 = v4;
    v13 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02 *)[v12 decodeBytesForKey:@"_index" returnedLength:&v28];
    if (v28 < 0x10) {
      goto LABEL_7;
    }
    *v5->_index = *v13;
    unint64_t var0 = v5->_index->var0;
    unint64_t var1 = v5->_index->var1;
    if (!is_mul_ok(var1, var0)
      || (size_t v16 = var1 * var0,
          v5->_underlyingBuffer = malloc_type_malloc(var1 * var0, 0x90F1E023uLL),
          uint64_t v27 = 0,
          id v17 = v12,
          id v18 = (const void *)[v17 decodeBytesForKey:@"_underlyingBuffer" returnedLength:&v27],
          v16 != v27))
    {
LABEL_7:
      v25 = 0;
      goto LABEL_8;
    }
    memcpy(v5->_underlyingBuffer, v18, v16);
    v5->_underlyingBufferLength = v16;
    id v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v17 decodeObjectOfClasses:v22 forKey:@"_attributesMap"];
    attributesMap = v5->_attributesMap;
    v5->_attributesMap = (NSMutableDictionary *)v23;
  }
  v25 = v5;
LABEL_8:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  return [(MXMSampleSet *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MXMSampleSet alloc];
  id v5 = [(MXMSampleSet *)self timeIndex];
  uint64_t v6 = [(MXMSampleSet *)self tag];
  unint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSampleSet *)self attributes];
  unint64_t v9 = [(MXMSampleSet *)v4 initWithTime:v5 tag:v6 unit:v7 attributes:v8 values:self->_underlyingBuffer length:self->_index->var1 valueSize:self->_index->var0];

  return v9;
}

- (id)mutableCopy
{
  return [(MXMSampleSet *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [MXMMutableSampleSet alloc];
  id v5 = [(MXMSampleSet *)self timeIndex];
  uint64_t v6 = [(MXMSampleSet *)self tag];
  unint64_t v7 = [(MXMSampleSet *)self unit];
  uint64_t v8 = [(MXMSampleSet *)self attributes];
  unint64_t v9 = [(MXMSampleSet *)v4 initWithTime:v5 tag:v6 unit:v7 attributes:v8 values:self->_underlyingBuffer length:self->_index->var1 valueSize:self->_index->var0];

  return v9;
}

- (void)dealloc
{
  free(self->_underlyingBuffer);
  free(self->_index);
  v3.receiver = self;
  v3.super_class = (Class)MXMSampleSet;
  [(MXMSampleSet *)&v3 dealloc];
}

- (void)_prepareUnderlyingBufferSizeWithAdditionalBytes:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  index = obj->_index;
  unint64_t var0 = index->var0;
  unint64_t v7 = a3 + index->var1 * index->var0;
  if (v7 > obj->_underlyingBufferLength)
  {
    size_t v8 = v7 + 10 * var0;
    obj->_underlyingBufferLength = v8;
    unint64_t v9 = malloc_type_realloc(obj->_underlyingBuffer, v8, 0x2B8D194DuLL);
    if (!v9)
    {
      id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"MetricMeasurement" reason:@"Failed to allocate more space for samples." userInfo:0];
      objc_exception_throw(v10);
    }
    obj->_underlyingBuffer = v9;
    id v4 = obj;
  }
  objc_sync_exit(v4);
}

- (void)_appendAttribute:(id)a3
{
  attributesMap = self->_attributesMap;
  id v6 = a3;
  unint64_t v7 = [v6 name];
  size_t v8 = [(NSMutableDictionary *)attributesMap objectForKeyedSubscript:v7];

  if (v8)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MXMSampleSet.m", 272, @"Invalid parameter not satisfying: %@", @"!_attributesMap[attribute.name]" object file lineNumber description];
  }
  unint64_t v9 = self->_attributesMap;
  id v10 = [v6 name];
  [(NSMutableDictionary *)v9 setObject:v6 forKeyedSubscript:v10];

  [(MXMSampleSet *)self setCachedSamples:0];
}

- (void)_appendDoubleValue:(double)a3 timestamp:(unint64_t)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  [(MXMSampleSet *)v6 _prepareUnderlyingBufferSizeWithAdditionalBytes:8];
  unint64_t v7 = [(MXMSampleSet *)v6 timeIndex];
  [v7 _appendAbsoluteTime:a4];

  index = v6->_index;
  unint64_t var1 = index->var1;
  *((double *)v6->_underlyingBuffer + var1) = a3;
  index->unint64_t var1 = var1 + 1;
  objc_sync_exit(v6);

  [(MXMSampleSet *)v6 setCachedSamples:0];
}

- (void)_appendSet:(id)a3
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
        [(MXMSampleSet *)self _appendSample:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_appendSample:(id)a3
{
  id v6 = a3;
  if ([v6 valueType])
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:@"Not implemented" reason:@"Not implemented" userInfo:0];
    objc_exception_throw(v5);
  }
  [v6 floatValue];
  -[MXMSampleSet _appendDoubleValue:timestamp:](self, "_appendDoubleValue:timestamp:", [v6 timestamp], v4);
}

- (MXMSampleTag)tag
{
  return (MXMSampleTag *)objc_getProperty(self, a2, 8, 1);
}

- (NSUnit)unit
{
  return (NSUnit *)objc_getProperty(self, a2, 16, 1);
}

- (MXMSampleTimeSeries)timeIndex
{
  return (MXMSampleTimeSeries *)objc_getProperty(self, a2, 24, 1);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)index
{
  return self->_index;
}

- (void)setIndex:(id *)a3
{
  self->_index = a3;
}

- (void)underlyingBuffer
{
  return self->_underlyingBuffer;
}

- (void)setUnderlyingBuffer:(void *)a3
{
  self->_underlyingBuffer = a3;
}

- (int64_t)underlyingBufferLength
{
  return self->_underlyingBufferLength;
}

- (void)setUnderlyingBufferLength:(int64_t)a3
{
  self->_underlyingBufferLength = a3;
}

- (NSArray)cachedSamples
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedSamples:(id)a3
{
}

- (NSMutableDictionary)attributesMap
{
  return self->_attributesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesMap, 0);
  objc_storeStrong((id *)&self->_cachedSamples, 0);
  objc_storeStrong((id *)&self->_timeIndex, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end