@interface TISKPositionalMetricSample
+ (BOOL)supportsSecureCoding;
+ (id)makeMetric:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)positionalMetricSample;
- (TISKPositionalMetricSample)initWithCapacity:(unint64_t)a3;
- (TISKPositionalMetricSample)initWithCoder:(id)a3;
- (id)description:(BOOL)a3;
- (id)generateDataForSR:(id)a3;
- (id)singleMetricSample:(unint64_t)a3;
- (unint64_t)size;
- (void)addSample:(id)a3 withPosition:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)setPositionalMetricSample:(id)a3;
@end

@implementation TISKPositionalMetricSample

- (void).cxx_destruct
{
}

- (void)setPositionalMetricSample:(id)a3
{
}

- (NSMutableArray)positionalMetricSample
{
  return self->_positionalMetricSample;
}

- (TISKPositionalMetricSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TISKPositionalMetricSample;
  v5 = [(TISKPositionalMetricSample *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PositionalMetricSample"];
    positionalMetricSample = v5->_positionalMetricSample;
    v5->_positionalMetricSample = (NSMutableArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)generateDataForSR:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  if (![(NSMutableArray *)self->_positionalMetricSample count]) {
    goto LABEL_8;
  }
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  do
  {
    v8 = [(NSMutableArray *)self->_positionalMetricSample objectAtIndexedSubscript:v6];
    id v9 = [v8 generateDataForSR:v4];

    if (!v9) {
      id v9 = objc_alloc_init((Class)getSRKeyboardProbabilityMetricClass());
    }
    [v5 addObject:v9];
    v7 += [v9 totalDataSamples];

    ++v6;
  }
  while (v6 < [(NSMutableArray *)self->_positionalMetricSample count]);
  if (v7) {
    id v10 = v5;
  }
  else {
LABEL_8:
  }
    id v10 = 0;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  positionalMetricSample = self->_positionalMetricSample;
  id v4 = [a3 positionalMetricSample];
  LOBYTE(positionalMetricSample) = [(NSMutableArray *)positionalMetricSample isEqual:v4];

  return (char)positionalMetricSample;
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  if ([(TISKPositionalMetricSample *)self size])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_positionalMetricSample objectAtIndexedSubscript:v6];
      objc_msgSend(v5, "appendFormat:", @"%lu:%lu ", v6, objc_msgSend(v7, "size"));
      if (v3)
      {
        [v5 appendString:@"<"];
        v8 = [v7 description];
        [v5 appendString:v8];

        [v5 appendString:@">"];
      }
      [v5 appendString:@", "];

      ++v6;
    }
    while (v6 < [(TISKPositionalMetricSample *)self size]);
  }

  return v5;
}

- (void)merge:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSString;
      positionalMetricSample = self->_positionalMetricSample;
      objc_super v12 = [v4 positionalMetricSample];
      v13 = [v10 stringWithFormat:@"%s [SensorKit] positional metric merge: other doesn't respond to positionalMetricSample selector %@ : %@", "-[TISKPositionalMetricSample merge:]", positionalMetricSample, v12];
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if ([(TISKPositionalMetricSample *)self size])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_positionalMetricSample objectAtIndexedSubscript:v6];
      v8 = [v4 positionalMetricSample];
      id v9 = [v8 objectAtIndexedSubscript:v6];
      [v7 merge:v9];

      ++v6;
    }
    while ([(TISKPositionalMetricSample *)self size] > v6);
  }
}

- (BOOL)isEmpty
{
  if (![(TISKPositionalMetricSample *)self size]) {
    return 1;
  }
  unint64_t v3 = 0;
  do
  {
    id v4 = [(NSMutableArray *)self->_positionalMetricSample objectAtIndexedSubscript:v3];
    char v5 = [v4 isEmpty];

    if ((v5 & 1) == 0) {
      break;
    }
    ++v3;
  }
  while ([(TISKPositionalMetricSample *)self size] > v3);
  return v5;
}

- (unint64_t)size
{
  return [(NSMutableArray *)self->_positionalMetricSample count];
}

- (id)singleMetricSample:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_positionalMetricSample objectAtIndexedSubscript:a3];
}

- (void)addSample:(id)a3 withPosition:(unint64_t)a4
{
  positionalMetricSample = self->_positionalMetricSample;
  id v6 = a3;
  id v7 = [(NSMutableArray *)positionalMetricSample objectAtIndexedSubscript:a4];
  [v7 addSample:v6];
}

- (TISKPositionalMetricSample)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TISKPositionalMetricSample;
  id v4 = [(TISKPositionalMetricSample *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    positionalMetricSample = v4->_positionalMetricSample;
    v4->_positionalMetricSample = (NSMutableArray *)v5;

    if (a3)
    {
      uint64_t v7 = 0;
      do
      {
        v8 = objc_alloc_init(TISKSingleMetricSample);
        [(NSMutableArray *)v4->_positionalMetricSample setObject:v8 atIndexedSubscript:v7];

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeMetric:(unint64_t)a3
{
  unint64_t v3 = [[TISKPositionalMetricSample alloc] initWithCapacity:a3];

  return v3;
}

@end