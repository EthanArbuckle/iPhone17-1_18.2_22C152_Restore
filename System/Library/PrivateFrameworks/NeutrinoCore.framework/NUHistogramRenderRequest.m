@interface NUHistogramRenderRequest
- (NUColorSpace)histogramCalculationColorSpace;
- (NUHistogramParameters)parameters;
- (NUHistogramRenderRequest)initWithComposition:(id)a3;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setHistogramCalculationColorSpace:(id)a3;
- (void)setParameters:(id)a3;
- (void)setScalePolicy:(id)a3;
@end

@implementation NUHistogramRenderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_histogramCalculationColorSpace, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 168, 1);
}

- (void)setHistogramCalculationColorSpace:(id)a3
{
}

- (NUColorSpace)histogramCalculationColorSpace
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  histogramCalculationColorSpace = self->_histogramCalculationColorSpace;
  if (!histogramCalculationColorSpace)
  {
    v4 = [NUImagePropertiesRequest alloc];
    v5 = [(NURenderRequest *)self composition];
    v6 = [(NURenderRequest *)v4 initWithComposition:v5];

    v7 = NSString;
    v8 = [(NURenderRequest *)self name];
    v9 = [v7 stringWithFormat:@"%@-imageProperties", v8];
    [(NURenderRequest *)v6 setName:v9];

    id v19 = 0;
    v10 = [(NUImagePropertiesRequest *)v6 submitSynchronous:&v19];
    id v11 = v19;
    v12 = +[NUColorSpace sRGBColorSpace];
    if (v10)
    {
      v13 = [v10 properties];
      v14 = [v13 colorSpace];

      if ([v14 isHDR])
      {
        uint64_t v15 = +[NUColorSpace itur2100HLGColorSpace];

        v12 = (NUColorSpace *)v15;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_6169);
      }
      v16 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Could not determine image properties: %@", buf, 0xCu);
      }
    }
    v17 = self->_histogramCalculationColorSpace;
    self->_histogramCalculationColorSpace = v12;

    histogramCalculationColorSpace = self->_histogramCalculationColorSpace;
  }

  return histogramCalculationColorSpace;
}

- (NUHistogramParameters)parameters
{
  v2 = (void *)[(NUHistogramParameters *)self->_parameters copy];

  return (NUHistogramParameters *)v2;
}

- (void)setParameters:(id)a3
{
  self->_parameters = (NUHistogramParameters *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)newRenderJob
{
  v3 = [NUHistogramRenderJob alloc];

  return [(NUHistogramRenderJob *)v3 initWithHistogramRequest:self];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUHistogramRenderRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 19, self->_parameters);
    objc_storeStrong(v5 + 21, self->_scalePolicy);
    objc_storeStrong(v5 + 20, self->_histogramCalculationColorSpace);
  }
  return v5;
}

- (NUHistogramRenderRequest)initWithComposition:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NUHistogramRenderRequest;
  v3 = [(NURenderRequest *)&v9 initWithComposition:a3];
  v4 = objc_alloc_init(NUHistogramParameters);
  parameters = v3->_parameters;
  v3->_parameters = v4;

  v6 = [[NUPixelCountScalePolicy alloc] initWithTargetPixelCount:0x80000];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v6;

  return v3;
}

@end