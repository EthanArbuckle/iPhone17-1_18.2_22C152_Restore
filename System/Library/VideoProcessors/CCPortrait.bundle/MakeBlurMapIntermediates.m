@interface MakeBlurMapIntermediates
- (BOOL)validateForMetal;
- (MTLTexture)inputAlphaMaskDeltaTex;
- (MTLTexture)inputBlurRefineIntermediateTex;
- (MTLTexture)inputDisparityRefineBlurTex;
- (MTLTexture)inputFaceMaskAdjBlurTex;
- (MTLTexture)inputHairMaskDeltaTex;
- (MTLTexture)inputPreprocTex;
- (MTLTexture)inputSampledDTex;
- (MTLTexture)inputWeightsXTex;
- (MTLTexture)inputWeightsYTex;
- (void)setInputAlphaMaskDeltaTex:(id)a3;
- (void)setInputBlurRefineIntermediateTex:(id)a3;
- (void)setInputDisparityRefineBlurTex:(id)a3;
- (void)setInputFaceMaskAdjBlurTex:(id)a3;
- (void)setInputHairMaskDeltaTex:(id)a3;
- (void)setInputPreprocTex:(id)a3;
- (void)setInputSampledDTex:(id)a3;
- (void)setInputWeightsXTex:(id)a3;
- (void)setInputWeightsYTex:(id)a3;
@end

@implementation MakeBlurMapIntermediates

- (BOOL)validateForMetal
{
  int v3 = objc_msgSend_conformsToProtocol_(self->_inputFaceMaskAdjBlurTex, a2, (uint64_t)&unk_270E2A1A0);
  if (v3)
  {
    int v3 = objc_msgSend_conformsToProtocol_(self->_inputWeightsXTex, v4, (uint64_t)&unk_270E2A1A0);
    if (v3)
    {
      int v3 = objc_msgSend_conformsToProtocol_(self->_inputWeightsYTex, v5, (uint64_t)&unk_270E2A1A0);
      if (v3)
      {
        int v3 = objc_msgSend_conformsToProtocol_(self->_inputPreprocTex, v6, (uint64_t)&unk_270E2A1A0);
        if (v3)
        {
          int v3 = objc_msgSend_conformsToProtocol_(self->_inputSampledDTex, v7, (uint64_t)&unk_270E2A1A0);
          if (v3)
          {
            int v3 = objc_msgSend_conformsToProtocol_(self->_inputDisparityRefineBlurTex, v8, (uint64_t)&unk_270E2A1A0);
            if (v3)
            {
              int v3 = objc_msgSend_conformsToProtocol_(self->_inputAlphaMaskDeltaTex, v9, (uint64_t)&unk_270E2A1A0);
              if (v3)
              {
                int v3 = objc_msgSend_conformsToProtocol_(self->_inputHairMaskDeltaTex, v10, (uint64_t)&unk_270E2A1A0);
                if (v3) {
                  LOBYTE(v3) = (objc_msgSend_conformsToProtocol_(self->_inputBlurRefineIntermediateTex, v11, (uint64_t)&unk_270E2A1A0) & 1) != 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (MTLTexture)inputFaceMaskAdjBlurTex
{
  return self->_inputFaceMaskAdjBlurTex;
}

- (void)setInputFaceMaskAdjBlurTex:(id)a3
{
}

- (MTLTexture)inputWeightsXTex
{
  return self->_inputWeightsXTex;
}

- (void)setInputWeightsXTex:(id)a3
{
}

- (MTLTexture)inputWeightsYTex
{
  return self->_inputWeightsYTex;
}

- (void)setInputWeightsYTex:(id)a3
{
}

- (MTLTexture)inputPreprocTex
{
  return self->_inputPreprocTex;
}

- (void)setInputPreprocTex:(id)a3
{
}

- (MTLTexture)inputSampledDTex
{
  return self->_inputSampledDTex;
}

- (void)setInputSampledDTex:(id)a3
{
}

- (MTLTexture)inputDisparityRefineBlurTex
{
  return self->_inputDisparityRefineBlurTex;
}

- (void)setInputDisparityRefineBlurTex:(id)a3
{
}

- (MTLTexture)inputAlphaMaskDeltaTex
{
  return self->_inputAlphaMaskDeltaTex;
}

- (void)setInputAlphaMaskDeltaTex:(id)a3
{
}

- (MTLTexture)inputHairMaskDeltaTex
{
  return self->_inputHairMaskDeltaTex;
}

- (void)setInputHairMaskDeltaTex:(id)a3
{
}

- (MTLTexture)inputBlurRefineIntermediateTex
{
  return self->_inputBlurRefineIntermediateTex;
}

- (void)setInputBlurRefineIntermediateTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBlurRefineIntermediateTex, 0);
  objc_storeStrong((id *)&self->_inputHairMaskDeltaTex, 0);
  objc_storeStrong((id *)&self->_inputAlphaMaskDeltaTex, 0);
  objc_storeStrong((id *)&self->_inputDisparityRefineBlurTex, 0);
  objc_storeStrong((id *)&self->_inputSampledDTex, 0);
  objc_storeStrong((id *)&self->_inputPreprocTex, 0);
  objc_storeStrong((id *)&self->_inputWeightsYTex, 0);
  objc_storeStrong((id *)&self->_inputWeightsXTex, 0);

  objc_storeStrong((id *)&self->_inputFaceMaskAdjBlurTex, 0);
}

@end