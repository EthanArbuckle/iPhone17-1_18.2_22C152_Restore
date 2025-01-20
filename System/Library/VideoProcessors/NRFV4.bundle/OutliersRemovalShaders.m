@interface OutliersRemovalShaders
- (OutliersRemovalShaders)initWithMetal:(id)a3;
@end

@implementation OutliersRemovalShaders

- (OutliersRemovalShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OutliersRemovalShaders;
  v5 = [(OutliersRemovalShaders *)&v10 init];
  if (v5
    && v4
    && ([v4 computePipelineStateFor:@"OutliersRemoval" constants:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        outiersRemovalFilter = v5->_outiersRemovalFilter,
        v5->_outiersRemovalFilter = (MTLComputePipelineState *)v6,
        outiersRemovalFilter,
        v5->_outiersRemovalFilter))
  {
    v8 = v5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end