@interface GainMapShaders
- (GainMapShaders)initWithMetal:(id)a3;
@end

@implementation GainMapShaders

- (GainMapShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
    goto LABEL_4;
  }
  v9.receiver = self;
  v9.super_class = (Class)GainMapShaders;
  self = [(GainMapShaders *)&v9 init];
  if (!self)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_4;
  }
  objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"GainMap", 0);
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  gainMapFilter = self->_gainMapFilter;
  self->_gainMapFilter = v6;

  if (!self->_gainMapFilter)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
LABEL_4:

  return self;
}

- (void).cxx_destruct
{
}

@end