@interface ColorConvertStageShaders
- (ColorConvertStageShaders)initWithMetal:(id)a3;
@end

@implementation ColorConvertStageShaders

- (ColorConvertStageShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ColorConvertStageShaders;
  v6 = [(ColorConvertStageShaders *)&v14 init];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"convertColor", 0);
  convertColor = v6->_convertColor;
  v6->_convertColor = (MTLComputePipelineState *)v7;

  if (!v6->_convertColor) {
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"convertColorYCbCr", 0);
  convertColorYCbCr = v6->_convertColorYCbCr;
  v6->_convertColorYCbCr = (MTLComputePipelineState *)v10;

  if (v6->_convertColorYCbCr)
  {
LABEL_4:
    v12 = v6;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertColorYCbCr, 0);

  objc_storeStrong((id *)&self->_convertColor, 0);
}

@end