@interface ColorConvertStageShaders
- (ColorConvertStageShaders)initWithMetal:(id)a3;
@end

@implementation ColorConvertStageShaders

- (ColorConvertStageShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ColorConvertStageShaders;
  v5 = [(ColorConvertStageShaders *)&v16 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"convertColor" constants:0];
  convertColor = v5->_convertColor;
  v5->_convertColor = (MTLComputePipelineState *)v6;

  if (!v5->_convertColor) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"convertColorYCbCr" constants:0];
  convertColorYCbCr = v5->_convertColorYCbCr;
  v5->_convertColorYCbCr = (MTLComputePipelineState *)v8;

  if (!v5->_convertColorYCbCr) {
    goto LABEL_8;
  }
  uint64_t v10 = [v4 computePipelineStateFor:@"convertColorAndDownsample" constants:0];
  convertColorAndDownsample = v5->_convertColorAndDownsample;
  v5->_convertColorAndDownsample = (MTLComputePipelineState *)v10;

  if (!v5->_convertColorAndDownsample) {
    goto LABEL_8;
  }
  uint64_t v12 = [v4 computePipelineStateFor:@"ccDownsample" constants:0];
  ccDownsample = v5->_ccDownsample;
  v5->_ccDownsample = (MTLComputePipelineState *)v12;

  if (v5->_ccDownsample)
  {
LABEL_6:
    v14 = v5;
  }
  else
  {
LABEL_8:
    FigDebugAssert3();
    FigSignalErrorAt();
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccDownsample, 0);
  objc_storeStrong((id *)&self->_convertColorAndDownsample, 0);
  objc_storeStrong((id *)&self->_convertColorYCbCr, 0);

  objc_storeStrong((id *)&self->_convertColor, 0);
}

@end