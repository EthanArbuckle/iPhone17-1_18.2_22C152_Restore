@interface MXMMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldAlwaysWrapInProxy;
- (BOOL)_shouldConstructProbe;
- (BOOL)_shouldNeverWrapInProxy;
- (BOOL)_shouldWrapInProxy;
- (BOOL)harvestData:(id *)a3 error:(id *)a4;
- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4;
- (MXMInstrument)instrument;
- (MXMMetric)initWithCoder:(id)a3;
- (MXMMetric)initWithIdentifier:(id)a3;
- (MXMMetric)initWithIdentifier:(id)a3 filter:(id)a4;
- (MXMSampleFilter)filter;
- (NSString)build;
- (NSString)identifier;
- (NSString)version;
- (id)_constructProbe;
- (id)_getProbe;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)preferredSampleMode;
- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5;
- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)probeDidUpdate:(id)a3 data:(id)a4 stop:(BOOL *)a5;
- (void)setFilter:(id)a3;
- (void)setPreferredSampleMode:(unint64_t)a3;
- (void)willStartAtEstimatedTime:(unint64_t)a3;
@end

@implementation MXMMetric

- (MXMInstrument)instrument
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  v3 = +[MXMInstrument instrumentWithInstrumentals:v2];

  return (MXMInstrument *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)build
{
  return self->_build;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 0;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 0;
}

- (BOOL)_shouldWrapInProxy
{
  if (![(MXMMetric *)self _shouldConstructProbe]) {
    return 0;
  }
  v3 = [(MXMMetric *)self _constructProbe];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  [v3 setFilter:self->_filter];
  v5 = [v4 sampleWithTimeout:60.0];
  BOOL v6 = [v5 numberOfSets] == 0;

  return v6;
}

- (BOOL)_shouldConstructProbe
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Abstract Method" reason:@"Subclass must implement" userInfo:0];
  objc_exception_throw(v2);
}

- (id)_constructProbe
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Abstract Method" reason:@"Subclass must implement" userInfo:0];
  objc_exception_throw(v2);
}

- (id)_getProbe
{
  if ([(MXMMetric *)self _shouldConstructProbe])
  {
    v3 = self->_probe;
    objc_sync_enter(v3);
    if (!self->_probe)
    {
      v4 = [(MXMMetric *)self _constructProbe];
      probe = self->_probe;
      self->_probe = v4;

      [(MXMProbe *)self->_probe setFilter:self->_filter];
      [(MXMProbe *)self->_probe setDelegate:self];
    }
    objc_sync_exit(v3);

    BOOL v6 = self->_probe;
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (id)copy
{
  return [(MXMMetric *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL v6 = [(MXMMetric *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(MXMMetric *)self filter];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = (void *)[v5 initWithIdentifier:v7 filter:v9];

  objc_msgSend(v10, "setPreferredSampleMode:", -[MXMMetric preferredSampleMode](self, "preferredSampleMode"));
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(MXMMetric *)self identifier];
  [v8 encodeObject:v4 forKey:@"Identifier"];

  id v5 = [(MXMMetric *)self version];
  [v8 encodeObject:v5 forKey:@"Version"];

  BOOL v6 = [(MXMMetric *)self build];
  [v8 encodeObject:v6 forKey:@"Build"];

  v7 = [(MXMMetric *)self filter];
  [v8 encodeObject:v7 forKey:@"Filter"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[MXMMetric preferredSampleMode](self, "preferredSampleMode"), @"SuggestedPollMode");
}

- (MXMMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXMMetric;
  id v5 = [(MXMMetric *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Build"];
    build = v5->_build;
    v5->_build = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Filter"];
    filter = v5->_filter;
    v5->_filter = (MXMSampleFilter *)v12;

    v5->_preferredSampleMode = [v4 decodeIntegerForKey:@"SuggestedPollMode"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXMMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)MXMMetric;
    v9 = [(MXMMetric *)&v19 init];
    self = v9;
    if (v9)
    {
      v9->_preferredSampleMode = -1;
      uint64_t v10 = (NSString *)[v6 copy];
      identifier = self->_identifier;
      self->_identifier = v10;

      uint64_t v12 = [v8 infoDictionary];
      v13 = [v12 objectForKeyedSubscript:@"CFBundleShortVersionString"];
      version = self->_version;
      self->_version = v13;

      objc_super v15 = [v8 infoDictionary];
      v16 = [v15 objectForKeyedSubscript:@"CFBundleVersion"];
      build = self->_build;
      self->_build = v16;

      objc_storeStrong((id *)&self->_filter, a4);
    }
  }

  return self;
}

- (MXMMetric)initWithIdentifier:(id)a3
{
  return [(MXMMetric *)self initWithIdentifier:a3 filter:0];
}

- (void)probeDidUpdate:(id)a3 data:(id)a4 stop:(BOOL *)a5
{
  data = self->_data;
  if (data) {
    [(MXMMutableSampleData *)data appendData:a4];
  }
}

- (BOOL)prepareWithOptions:(id)a3 error:(id *)a4
{
  if ([(MXMMetric *)self _shouldConstructProbe])
  {
    id v5 = objc_alloc_init(MXMMutableSampleData);
    data = self->_data;
    self->_data = v5;
  }
  else
  {
    data = self->_data;
    self->_data = 0;
  }

  return 0;
}

- (void)willStartAtEstimatedTime:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((([(MXMMetric *)self _sampleMode] & 1) != 0
     || ([(MXMMetric *)self _sampleMode] & 4) != 0)
    && [(MXMMetric *)self _shouldConstructProbe])
  {
    id v5 = [(MXMMetric *)self _getProbe];
    if (!v5)
    {
      uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"MXMMetric.m", 176, @"Invalid parameter not satisfying: %@", @"probe" object file lineNumber description];
    }
    if ([(MXMMetric *)self _sampleMode])
    {
      if (([(MXMMetric *)self _sampleMode] & 4) != 0)
      {
        [v5 updateNowUntilStopped];
      }
      else
      {
        if ([(MXMMetric *)self _shouldAlwaysWrapInProxy])
        {
          id v6 = 0;
        }
        else
        {
          id v6 = [v5 sampleWithTimeout:60.0];
        }
        if (![v6 numberOfSets] && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          id v7 = _MXMGetLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = [(MXMMetric *)self identifier];
            *(_DWORD *)buf = 138412546;
            v14 = v8;
            __int16 v15 = 2048;
            v16 = self;
            _os_log_impl(&dword_21FA7B000, v7, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in willStartAtEstimatedTime:", buf, 0x16u);
          }
          v9 = +[MXMProxyServiceManager shared];
          uint64_t v10 = [[MXMProxyMetric alloc] initWithMetric:self];
          uint64_t v11 = [v9 _sampleWithProxyMetric:v10 timeout:0 stopReason:60.0];

          id v6 = (void *)v11;
        }
        [(MXMMutableSampleData *)self->_data appendData:v6];
      }
    }
  }
}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ((([(MXMMetric *)self _sampleMode] & 2) != 0
     || ([(MXMMetric *)self _sampleMode] & 4) != 0)
    && [(MXMMetric *)self _shouldConstructProbe])
  {
    id v6 = [(MXMMetric *)self _getProbe];
    if (!v6)
    {
      v23 = [MEMORY[0x263F08690] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"MXMMetric.m", 212, @"Invalid parameter not satisfying: %@", @"probe" object file lineNumber description];
    }
    if (([(MXMMetric *)self _sampleMode] & 2) != 0)
    {
      if (([(MXMMetric *)self _sampleMode] & 4) != 0)
      {
        [v6 updateNowUntilTimeout:60.0];
        [v6 stopUpdates];
        [v6 waitUntilStoppedWithTimeout:60.0];
      }
      else
      {
        if ([(MXMMetric *)self _shouldAlwaysWrapInProxy])
        {
          id v7 = 0;
        }
        else
        {
          id v7 = [v6 sampleWithTimeout:60.0];
        }
        if (![v7 numberOfSets] && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          uint64_t v8 = _MXMGetLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v9 = [(MXMMetric *)self identifier];
            *(_DWORD *)buf = 138412546;
            v25 = v9;
            __int16 v26 = 2048;
            v27 = self;
            _os_log_impl(&dword_21FA7B000, v8, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in didStopAtTime:stopDate:", buf, 0x16u);
          }
          uint64_t v10 = +[MXMProxyServiceManager shared];
          uint64_t v11 = [[MXMProxyMetric alloc] initWithMetric:self];
          uint64_t v12 = [v10 _sampleWithProxyMetric:v11 timeout:0 stopReason:60.0];

          id v7 = (void *)v12;
        }
        if (v7
          && ([v7 samples],
              v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v14 = [v13 count],
              v13,
              v14))
        {
          __int16 v15 = [MXMSampleAttributeFilter alloc];
          v16 = [v7 samples];
          uint64_t v17 = [v16 lastObject];
          v18 = [v17 attributeWithName:@"Process Identifier"];
          objc_super v19 = [v18 numericValue];
          v20 = [(MXMSampleAttributeFilter *)v15 initWithAttributeName:@"Process Identifier" numericValue:v19];
        }
        else
        {
          v20 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"Process Identifier" numericValue:&unk_26D14D510];
        }
        v21 = [(MXMMetric *)self filter];
        v22 = [MEMORY[0x263EFFA08] setWithObject:v20];
        [v21 addAttributeFilters:v22];

        [(MXMMutableSampleData *)self->_data appendData:v7];
      }
    }
  }
}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((([(MXMMetric *)self _sampleMode] & 2) != 0
     || ([(MXMMetric *)self _sampleMode] & 4) != 0)
    && [(MXMMetric *)self _shouldConstructProbe])
  {
    id v7 = [(MXMMetric *)self _getProbe];
    if (!v7)
    {
      uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"MXMMetric.m", 252, @"Invalid parameter not satisfying: %@", @"probe" object file lineNumber description];
    }
    if (([(MXMMetric *)self _sampleMode] & 2) != 0)
    {
      if (([(MXMMetric *)self _sampleMode] & 4) != 0)
      {
        [v7 updateNowUntilTimeout:60.0];
        [v7 stopUpdates];
        [v7 waitUntilStoppedWithTimeout:60.0];
      }
      else
      {
        if ([(MXMMetric *)self _shouldAlwaysWrapInProxy])
        {
          uint64_t v8 = 0;
        }
        else
        {
          uint64_t v8 = [v7 sampleWithTimeout:60.0];
        }
        if (![v8 numberOfSets] && !-[MXMMetric _shouldNeverWrapInProxy](self, "_shouldNeverWrapInProxy"))
        {
          v9 = _MXMGetLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = [(MXMMetric *)self identifier];
            *(_DWORD *)buf = 138412546;
            v16 = v10;
            __int16 v17 = 2048;
            v18 = self;
            _os_log_impl(&dword_21FA7B000, v9, OS_LOG_TYPE_DEFAULT, "Metric: %@(%p) is being wrapped in a proxy in didStopAtTime:stopDate:", buf, 0x16u);
          }
          uint64_t v11 = +[MXMProxyServiceManager shared];
          uint64_t v12 = [[MXMProxyMetric alloc] initWithMetric:self];
          uint64_t v13 = [v11 _sampleWithProxyMetric:v12 timeout:0 stopReason:60.0];

          uint64_t v8 = (void *)v13;
        }
        [(MXMMutableSampleData *)self->_data appendData:v8];
      }
    }
  }
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  if (![(MXMMetric *)self _shouldConstructProbe])
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MXMMetric.m", 275, @"Invalid parameter not satisfying: %@", @"[self _shouldConstructProbe]" object file lineNumber description];
  }
  if ([(MXMMetric *)self _shouldNeverWrapInProxy])
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MXMMetric.m", 276, @"Invalid parameter not satisfying: %@", @"![self _shouldNeverWrapInProxy]" object file lineNumber description];
  }
  id v7 = [(MXMMetric *)self _getProbe];

  if (v7)
  {
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MXMMetric.m", 277, @"Invalid parameter not satisfying: %@", @"[self _getProbe]" object file lineNumber description];

    if (a3) {
      goto LABEL_7;
    }
  }
  uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"MXMMetric.m", 278, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

LABEL_7:
  data = self->_data;
  if (!data)
  {
    __int16 v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MXMMetric.m", 279, @"Invalid parameter not satisfying: %@", @"_data" object file lineNumber description];

    data = self->_data;
  }
  *a3 = data;
  v9 = self->_data;
  self->_data = 0;

  return 0;
}

- (MXMSampleFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (unint64_t)preferredSampleMode
{
  return self->_preferredSampleMode;
}

- (void)setPreferredSampleMode:(unint64_t)a3
{
  self->_preferredSampleMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_probe, 0);
}

@end