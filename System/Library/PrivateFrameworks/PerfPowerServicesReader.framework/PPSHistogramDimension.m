@interface PPSHistogramDimension
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)range;
- (BOOL)isCategoryDimension;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistogramDimension:(id)a3;
- (NSArray)edges;
- (NSString)metricName;
- (PPSHistogramDimension)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5;
- (PPSHistogramDimension)initWithCategories:(id)a3 metricName:(id)a4;
- (PPSHistogramDimension)initWithCoder:(id)a3;
- (PPSHistogramDimension)initWithEdges:(id)a3 metricName:(id)a4;
- (id)JSONRepresentation;
- (id)debugDescription;
- (id)description;
- (id)dictionary;
- (unint64_t)extent;
- (unint64_t)hash;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSHistogramDimension

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogramDimension)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPSHistogramDimension;
  v5 = [(PPSHistogramDimension *)&v17 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"edges"];
    edges = v5->_edges;
    v5->_edges = (NSArray *)v10;

    v5->_isCategoryDimension = [v4 decodeBoolForKey:@"isCategory"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metric"];
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v12;

    [v4 decodeDoubleForKey:@"minRange"];
    v5->_range.min = v14;
    [v4 decodeDoubleForKey:@"maxRange"];
    v5->_range.max = v15;
    v5->_size = [v4 decodeIntegerForKey:@"size"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_edges forKey:@"edges"];
  [v4 encodeBool:self->_isCategoryDimension forKey:@"isCategory"];
  [v4 encodeObject:self->_metricName forKey:@"metric"];
  [v4 encodeDouble:@"minRange" forKey:self->_range.min];
  [v4 encodeDouble:@"maxRange" forKey:self->_range.max];
  [v4 encodeInteger:self->_size forKey:@"size"];
}

- (PPSHistogramDimension)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a5;
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"invalid number of bins (0)"];
  }
  if (var1 <= var0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"invalid dimension range (max < min)"];
  }
  v21.receiver = self;
  v21.super_class = (Class)PPSHistogramDimension;
  v11 = [(PPSHistogramDimension *)&v21 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_size = a3;
    v13 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    unint64_t v14 = 0;
    double v15 = (var1 - var0) / (double)a3;
    double v16 = var0;
    do
    {
      objc_super v17 = [NSNumber numberWithDouble:v16];
      [v13 addObject:v17];

      double v16 = v15 + v16;
      ++v14;
    }
    while (v14 <= v12->_size);
    uint64_t v18 = [v13 copy];
    edges = v12->_edges;
    v12->_edges = (NSArray *)v18;

    objc_storeStrong((id *)&v12->_metricName, a5);
    v12->_range.min = var0;
    v12->_range.max = var1;
    v12->_isCategoryDimension = 0;
  }
  return v12;
}

- (PPSHistogramDimension)initWithCategories:(id)a3 metricName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSHistogramDimension;
  uint64_t v8 = [(PPSHistogramDimension *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    edges = v8->_edges;
    v8->_edges = (NSArray *)v9;

    v8->_isCategoryDimension = 1;
    objc_storeStrong((id *)&v8->_metricName, a4);
    v8->_range.min = 0.0;
    v8->_range.max = 0.0;
    v8->_size = [v6 count];
  }

  return v8;
}

- (PPSHistogramDimension)initWithEdges:(id)a3 metricName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] <= 1)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = [v7 count];
    objc_msgSend(v9, "raise:format:", *MEMORY[0x263EFF4A0], @"at least two edges are required (%lu)", v10);
  }
  v19.receiver = self;
  v19.super_class = (Class)PPSHistogramDimension;
  v11 = [(PPSHistogramDimension *)&v19 init];
  objc_super v12 = v11;
  v13 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_edges, a3);
    v13->_isCategoryDimension = 0;
    objc_storeStrong((id *)&v12->_metricName, a4);
    v13->_range.min = 0.0;
    v13->_range.max = 0.0;
    if ([v7 count])
    {
      unint64_t v14 = [v7 firstObject];
      [v14 doubleValue];
      v13->_range.min = v15;
      double v16 = [v7 lastObject];

      [v16 doubleValue];
      v13->_range.max = v17;
    }
    v13->_size = [v7 count] - 1;
  }

  return v13;
}

- (unint64_t)extent
{
  BOOL v3 = [(PPSHistogramDimension *)self isCategoryDimension];
  unint64_t v4 = [(PPSHistogramDimension *)self size];
  uint64_t v5 = 1;
  if (!v3) {
    uint64_t v5 = 2;
  }
  return v4 + v5;
}

- (id)dictionary
{
  BOOL v3 = objc_opt_new();
  unint64_t v4 = [(PPSHistogramDimension *)self edges];
  [v3 setObject:v4 forKeyedSubscript:@"edges"];

  uint64_t v5 = [(PPSHistogramDimension *)self metricName];
  [v3 setObject:v5 forKeyedSubscript:@"metric"];

  id v6 = NSNumber;
  [(PPSHistogramDimension *)self range];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"minRange"];

  id v8 = NSNumber;
  [(PPSHistogramDimension *)self range];
  uint64_t v10 = [v8 numberWithDouble:v9];
  [v3 setObject:v10 forKeyedSubscript:@"maxRange"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PPSHistogramDimension size](self, "size"));
  [v3 setObject:v11 forKeyedSubscript:@"size"];

  objc_super v12 = (void *)[v3 copy];
  return v12;
}

- (BOOL)isEqualToHistogramDimension:(id)a3
{
  unint64_t v4 = (PPSHistogramDimension *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    unint64_t v5 = [(PPSHistogramDimension *)self size];
    if (v5 == [(PPSHistogramDimension *)v4 size]
      && ([(PPSHistogramDimension *)self range], double v7 = v6, [(PPSHistogramDimension *)v4 range], v7 == v8)
      && ([(PPSHistogramDimension *)self range],
          double v10 = v9,
          [(PPSHistogramDimension *)v4 range],
          v10 == v11))
    {
      objc_super v12 = [(PPSHistogramDimension *)self metricName];
      v13 = [(PPSHistogramDimension *)v4 metricName];
      if ([v12 isEqualToString:v13])
      {
        unint64_t v14 = [(PPSHistogramDimension *)self edges];
        double v15 = [(PPSHistogramDimension *)v4 edges];
        char v16 = [v14 isEqualToArray:v15];
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (id)JSONRepresentation
{
  v2 = (void *)MEMORY[0x263F08900];
  BOOL v3 = [(PPSHistogramDimension *)self dictionary];
  id v8 = 0;
  unint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    double v6 = PPSReaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(PPSTimeSeries *)(uint64_t)v5 JSONRepresentation];
    }
  }
  return v4;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = [(PPSHistogramDimension *)self description];
  double v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)description
{
  v2 = [(PPSHistogramDimension *)self dictionary];
  BOOL v3 = [v2 description];

  return v3;
}

- (unint64_t)hash
{
  BOOL v3 = [(PPSHistogramDimension *)self edges];
  uint64_t v4 = [v3 hash];
  id v5 = [(PPSHistogramDimension *)self metricName];
  int v6 = [v5 hash];
  [(PPSHistogramDimension *)self range];
  double v8 = v7;
  [(PPSHistogramDimension *)self range];
  unint64_t v10 = v4 ^ ((unint64_t)(v6 ^ (unint64_t)v8 ^ (unint64_t)v9) << 32);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PPSHistogramDimension *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPSHistogramDimension *)self isEqualToHistogramDimension:v4];
  }

  return v5;
}

- (NSArray)edges
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isCategoryDimension
{
  return self->_isCategoryDimension;
}

- (NSString)metricName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

@end