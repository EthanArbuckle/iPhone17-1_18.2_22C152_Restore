@interface OutliersRemovalShaders
- (OutliersRemovalShaders)initWithMetal:(id)a3;
@end

@implementation OutliersRemovalShaders

- (OutliersRemovalShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OutliersRemovalShaders;
  v6 = [(OutliersRemovalShaders *)&v11 init];
  if (v6
    && v4
    && (objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"OutliersRemoval", 0),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        outiersRemovalFilter = v6->_outiersRemovalFilter,
        v6->_outiersRemovalFilter = (MTLComputePipelineState *)v7,
        outiersRemovalFilter,
        v6->_outiersRemovalFilter))
  {
    v9 = v6;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end