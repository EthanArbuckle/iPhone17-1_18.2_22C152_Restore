@interface SSCAMetalLayerConfiguration
- (BOOL)hasEqualConfiguration:(id)a3;
- (BOOL)includeTimelines;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)heightPixels;
- (NSNumber)mtlPixelFormat;
- (NSNumber)widthPixels;
- (NSString)debugDescription;
- (NSString)layerName;
- (SSCAMetalLayerConfiguration)initWithInterval:(id)a3;
- (SSCAMetalLayerConfiguration)initWithLayerName:(id)a3 heightInPixels:(id)a4 widthInPixels:(id)a5 mtlPixelFormat:(id)a6 startMachContinuousTime:(unint64_t)a7 startDate:(id)a8 endMachContinuousTime:(unint64_t)a9 endDate:(id)a10 timebaseRatio:(double)a11;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)setEndDate:(id)a3;
- (void)setEndMachContinuousTime:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStartMachContinuousTime:(unint64_t)a3;
- (void)updateTimeRange:(id)a3;
@end

@implementation SSCAMetalLayerConfiguration

- (double)startSeconds
{
  unint64_t v3 = [(SSCAMetalLayerConfiguration *)self startMachContinuousTime];
  [(SSCAMetalLayerConfiguration *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3 = [(SSCAMetalLayerConfiguration *)self endMachContinuousTime];
  [(SSCAMetalLayerConfiguration *)self timebaseRatio];
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3 = [(SSCAMetalLayerConfiguration *)self endMachContinuousTime];
  return v3 - [(SSCAMetalLayerConfiguration *)self startMachContinuousTime];
}

- (float)durationSeconds
{
  [(SSCAMetalLayerConfiguration *)self endSeconds];
  double v4 = v3;
  [(SSCAMetalLayerConfiguration *)self startSeconds];
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  [(SSCAMetalLayerConfiguration *)self startSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  [(SSCAMetalLayerConfiguration *)self endSeconds];
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  [(SSCAMetalLayerConfiguration *)self durationSeconds];
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  [(SSCAMetalLayerConfiguration *)self startSeconds];
  return v2 * 1000.0;
}

- (double)endMs
{
  [(SSCAMetalLayerConfiguration *)self endSeconds];
  return v2 * 1000.0;
}

- (double)durationMs
{
  [(SSCAMetalLayerConfiguration *)self durationSeconds];
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerConfiguration)initWithLayerName:(id)a3 heightInPixels:(id)a4 widthInPixels:(id)a5 mtlPixelFormat:(id)a6 startMachContinuousTime:(unint64_t)a7 startDate:(id)a8 endMachContinuousTime:(unint64_t)a9 endDate:(id)a10 timebaseRatio:(double)a11
{
  id v18 = a3;
  id v19 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a8;
  id v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)SSCAMetalLayerConfiguration;
  v21 = [(SSCAMetalLayerConfiguration *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_layerName, a3);
    objc_storeStrong((id *)&v22->_heightPixels, a4);
    objc_storeStrong((id *)&v22->_widthPixels, a5);
    objc_storeStrong((id *)&v22->_mtlPixelFormat, a6);
    v22->_startMachContinuousTime = a7;
    objc_storeStrong((id *)&v22->_startDate, a8);
    v22->_endMachContinuousTime = a9;
    objc_storeStrong((id *)&v22->_endDate, a10);
    v22->_timebaseRatio = a11;
  }

  return v22;
}

- (SSCAMetalLayerConfiguration)initWithInterval:(id)a3
{
  id v3 = a3;
  double v4 = [v3 beginEvent];
  double v5 = [v4 placeholderTokenValueDictForTokenKey:@"name"];

  id v6 = v5;
  objc_opt_class();
  v7 = _objectValueForKey(@"name", v6, 1);

  id v8 = v6;
  objc_opt_class();
  v9 = _objectValueForKey(@"Height", v8, 3);

  id v10 = v8;
  objc_opt_class();
  v11 = _objectValueForKey(@"Width", v10, 3);

  id v12 = v10;
  objc_opt_class();
  v13 = _objectValueForKey(@"PixelFormat", v12, 3);

  uint64_t v14 = [v3 startMachContinuousTime];
  v15 = [v3 beginDate];
  uint64_t v16 = [v3 endMachContinuousTime];
  v17 = [v3 endDate];
  [v3 timebaseRatio];
  double v19 = v18;

  id v20 = [(SSCAMetalLayerConfiguration *)self initWithLayerName:v7 heightInPixels:v9 widthInPixels:v11 mtlPixelFormat:v13 startMachContinuousTime:v14 startDate:v15 endMachContinuousTime:v19 endDate:v16 timebaseRatio:v17];
  return v20;
}

- (void)updateTimeRange:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SSCAMetalLayerConfiguration *)self startMachContinuousTime];
  unint64_t v6 = [v4 startMachContinuousTime];
  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  if (v5 + 1 >= 2) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  self->_startMachContinuousTime = v8;
  unint64_t v9 = [(SSCAMetalLayerConfiguration *)self endMachContinuousTime];
  unint64_t v10 = [v4 endMachContinuousTime];
  if (v9 <= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  if (v9 + 1 >= 2) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  self->_endMachContinuousTime = v12;
  v13 = [(SSCAMetalLayerConfiguration *)self startDate];
  uint64_t v14 = [v4 startDate];
  _getEarliestDate(v13, v14);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v15;

  id v20 = [(SSCAMetalLayerConfiguration *)self endDate];
  v17 = [v4 endDate];

  _getLatestDate(v20, v17);
  double v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v18;
}

- (id)dictionaryRepresentation
{
  id v3 = _timeIntervalDict(self);
  id v4 = [(SSCAMetalLayerConfiguration *)self layerName];

  if (v4)
  {
    unint64_t v5 = [(SSCAMetalLayerConfiguration *)self layerName];
    [v3 setObject:v5 forKeyedSubscript:kSSCAMLConfigurationKey_Name];
  }
  unint64_t v6 = [(SSCAMetalLayerConfiguration *)self heightPixels];

  if (v6)
  {
    unint64_t v7 = [(SSCAMetalLayerConfiguration *)self heightPixels];
    [v3 setObject:v7 forKeyedSubscript:kSSCAMLConfigurationKey_HeightInPixels];
  }
  unint64_t v8 = [(SSCAMetalLayerConfiguration *)self widthPixels];

  if (v8)
  {
    unint64_t v9 = [(SSCAMetalLayerConfiguration *)self widthPixels];
    [v3 setObject:v9 forKeyedSubscript:kSSCAMLConfigurationKey_WidthInPixels];
  }
  unint64_t v10 = [(SSCAMetalLayerConfiguration *)self mtlPixelFormat];

  if (v10)
  {
    unint64_t v11 = [(SSCAMetalLayerConfiguration *)self mtlPixelFormat];
    [v3 setObject:v11 forKeyedSubscript:kSSCAMLConfigurationKey_MTLPixelFormat];
  }

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerConfiguration *)self jsonDescription:3];
}

- (BOOL)hasEqualConfiguration:(id)a3
{
  id v4 = (SSCAMetalLayerConfiguration *)a3;
  unint64_t v5 = v4;
  if (v4)
  {
    if (self != v4)
    {
      unint64_t v6 = [(SSCAMetalLayerConfiguration *)self layerName];
      unint64_t v7 = [(SSCAMetalLayerConfiguration *)v5 layerName];
      unint64_t v8 = v6;
      unint64_t v9 = v7;
      unint64_t v10 = (void *)v9;
      if (!v8 && v9)
      {
        char v11 = 0;
        unint64_t v12 = v9;
LABEL_34:

        goto LABEL_35;
      }
      if (v8 | v9)
      {
        int v13 = [(id)v8 isEqual:v9];

        if (!v13)
        {
          char v11 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      uint64_t v14 = [(SSCAMetalLayerConfiguration *)self heightPixels];
      v15 = [(SSCAMetalLayerConfiguration *)v5 heightPixels];
      unint64_t v12 = v14;
      unint64_t v16 = v15;
      v17 = (void *)v16;
      if (!v12 && v16)
      {
        char v11 = 0;
        unint64_t v12 = 0;
        unint64_t v18 = v16;
LABEL_32:

        goto LABEL_33;
      }
      if (v12 | v16)
      {
        int v19 = [(id)v12 isEqual:v16];

        if (!v19)
        {
          char v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      id v20 = [(SSCAMetalLayerConfiguration *)self widthPixels];
      v21 = [(SSCAMetalLayerConfiguration *)v5 widthPixels];
      unint64_t v18 = v20;
      unint64_t v22 = v21;
      v23 = (void *)v22;
      if (v18 || !v22)
      {
        if (v18 | v22)
        {
          int v25 = [(id)v18 isEqual:v22];

          if (!v25)
          {
            char v11 = 0;
LABEL_31:

            goto LABEL_32;
          }
        }
        id v26 = [(SSCAMetalLayerConfiguration *)self mtlPixelFormat];
        id v27 = [(SSCAMetalLayerConfiguration *)v5 mtlPixelFormat];
        unint64_t v24 = v26;
        unint64_t v28 = v27;
        v29 = (void *)v28;
        if (v24 || !v28)
        {
          if (v24 | v28) {
            char v11 = [(id)v24 isEqual:v28];
          }
          else {
            char v11 = 1;
          }
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        unint64_t v18 = 0;
        char v11 = 0;
        unint64_t v24 = v22;
      }

      goto LABEL_31;
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
LABEL_36:

  return v11;
}

- (BOOL)includeTimelines
{
  return 1;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (NSNumber)heightPixels
{
  return self->_heightPixels;
}

- (NSNumber)widthPixels
{
  return self->_widthPixels;
}

- (NSNumber)mtlPixelFormat
{
  return self->_mtlPixelFormat;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_mtlPixelFormat, 0);
  objc_storeStrong((id *)&self->_widthPixels, 0);
  objc_storeStrong((id *)&self->_heightPixels, 0);

  objc_storeStrong((id *)&self->_layerName, 0);
}

@end