@interface MXMClockMetric
+ (BOOL)supportsSecureCoding;
+ (MXMClockMetric)absoluteTime;
+ (MXMClockMetric)allTime;
+ (MXMClockMetric)continuousTime;
- (BOOL)_shouldConstructProbe;
- (BOOL)harvestData:(id *)a3 error:(id *)a4;
- (MXMClockMetric)initWithCoder:(id)a3;
- (MXMClockMetric)initWithTag:(id)a3;
- (id)_unit;
- (id)_unitWithTag:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMClockMetric

- (id)_unit
{
  return [(MXMClockMetric *)self _unitWithTag:self->_tag];
}

- (id)_unitWithTag:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C98], "nanoseconds", a3);
}

+ (MXMClockMetric)allTime
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[MXMSampleTag ancestery];
  v4 = (void *)[v2 initWithTag:v3];

  return (MXMClockMetric *)v4;
}

+ (MXMClockMetric)absoluteTime
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[MXMClockSampleTag absoluteTime];
  v4 = (void *)[v2 initWithTag:v3];

  return (MXMClockMetric *)v4;
}

+ (MXMClockMetric)continuousTime
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[MXMClockSampleTag continuousTime];
  v4 = (void *)[v2 initWithTag:v3];

  return (MXMClockMetric *)v4;
}

- (MXMClockMetric)initWithTag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  v6 = [(MXMMetric *)&v9 initWithIdentifier:@"com.apple.metricmeasurement.metric.clock"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tag, a3);
  }

  return v7;
}

- (BOOL)_shouldConstructProbe
{
  return 0;
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = +[MXMInstrument activeInstrument];
  uint64_t v7 = [v6 currentIteration];

  if (v7)
  {
    v8 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    tag = self->_tag;
    v10 = +[MXMClockSampleTag absoluteTime];
    if ([(MXMSampleTag *)tag containsTag:v10])
    {
    }
    else
    {
      v11 = self->_tag;
      v12 = +[MXMClockSampleTag absoluteTime];
      LODWORD(v11) = [(MXMSampleTag *)v11 isEqualToTag:v12];

      if (!v11) {
        goto LABEL_6;
      }
    }
    long long v21 = *(_OWORD *)(v7 + 40);
    v13 = [[MXMSampleTimeSeries alloc] initWithAbsoluteTimeSeries:&v21 length:2];
    objc_msgSend(v8, "addObject:", v13, v21);

LABEL_6:
    v14 = self->_tag;
    v15 = +[MXMClockSampleTag continuousTime];
    if ([(MXMSampleTag *)v14 containsTag:v15])
    {
    }
    else
    {
      v16 = self->_tag;
      v17 = +[MXMClockSampleTag continuousTime];
      LODWORD(v16) = [(MXMSampleTag *)v16 isEqualToTag:v17];

      if (!v16)
      {
LABEL_10:
        v19 = [[MXMSampleData alloc] initWithSets:v8];
        *a3 = v19;

        return v7 != 0;
      }
    }
    long long v21 = *(_OWORD *)(v7 + 56);
    v18 = [[MXMSampleTimeSeries alloc] initWithContinuousTimeSeries:&v21 length:2];
    [v8 addObject:v18];

    goto LABEL_10;
  }
  return v7 != 0;
}

- (id)copy
{
  return [(MXMClockMetric *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  id v5 = -[MXMMetric copyWithZone:](&v9, sel_copyWithZone_);
  id v6 = [(MXMSampleTag *)self->_tag copyWithZone:a3];
  uint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXMClockMetric;
  id v4 = a3;
  [(MXMMetric *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, @"_tag", v5.receiver, v5.super_class);
}

- (MXMClockMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMClockMetric;
  objc_super v5 = [(MXMMetric *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tag"];
    tag = v5->_tag;
    v5->_tag = (MXMSampleTag *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end