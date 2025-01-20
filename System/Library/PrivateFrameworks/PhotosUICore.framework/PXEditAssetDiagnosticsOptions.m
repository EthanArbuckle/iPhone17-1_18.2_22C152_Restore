@interface PXEditAssetDiagnosticsOptions
- (BOOL)includeOriginalRender;
- (NUScalePolicy)scalePolicyForRenders;
- (PXEditAssetDiagnosticsOptions)init;
- (void)setIncludeOriginalRender:(BOOL)a3;
- (void)setScalePolicyForRenders:(id)a3;
@end

@implementation PXEditAssetDiagnosticsOptions

- (void).cxx_destruct
{
}

- (void)setIncludeOriginalRender:(BOOL)a3
{
  self->_includeOriginalRender = a3;
}

- (BOOL)includeOriginalRender
{
  return self->_includeOriginalRender;
}

- (void)setScalePolicyForRenders:(id)a3
{
}

- (NUScalePolicy)scalePolicyForRenders
{
  return self->_scalePolicyForRenders;
}

- (PXEditAssetDiagnosticsOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXEditAssetDiagnosticsOptions;
  v2 = [(PXEditAssetDiagnosticsOptions *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F7A478] oneToOneScalePolicy];
    [(PXEditAssetDiagnosticsOptions *)v2 setScalePolicyForRenders:v3];
  }
  return v2;
}

@end