@interface NUGainMapClearFilter
- (CIImage)inputGainMap;
- (CIImage)inputMatte;
- (NSNumber)inputInvertMatte;
- (id)outputImage;
- (void)setInputGainMap:(id)a3;
- (void)setInputInvertMatte:(id)a3;
- (void)setInputMatte:(id)a3;
@end

@implementation NUGainMapClearFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputInvertMatte, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);

  objc_storeStrong((id *)&self->_inputGainMap, 0);
}

- (void)setInputInvertMatte:(id)a3
{
}

- (NSNumber)inputInvertMatte
{
  return self->_inputInvertMatte;
}

- (void)setInputMatte:(id)a3
{
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
}

- (void)setInputGainMap:(id)a3
{
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (id)outputImage
{
  v3 = [(NUGainMapClearFilter *)self inputGainMap];
  if (v3)
  {
    uint64_t v4 = [(NUGainMapClearFilter *)self inputMatte];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(NUGainMapClearFilter *)self inputInvertMatte];
      int v7 = [v6 BOOLValue];

      if (v7)
      {
        __asm { FMOV            V3.4S, #1.0 }
        uint64_t v13 = [v5 _imageByApplyingColorMatrixRed:COERCE_DOUBLE(3212836864) green:-0.0078125 blue:0.0 bias:*(double *)&_Q3];

        v5 = (void *)v13;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      [v5 extent];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [v3 extent];
      NUCGAffineTransformByMappingFromRectToRect((uint64_t)&v32, v15, v17, v19, v21, v22, v23, v24, v25);
      v31[0] = v32;
      v31[1] = v33;
      v31[2] = v34;
      v26 = [v5 imageByApplyingTransform:v31];

      v27 = [MEMORY[0x1E4F1E000] componentMultiply];
      v28 = [v27 applyWithForeground:v26 background:v3];

      v29 = [v28 _imageByRenderingToIntermediate];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1E050] blackImage];
      [v3 extent];
      v29 = objc_msgSend(v26, "imageByCroppingToRect:");
    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

@end