@interface ApplyBlurMapIntermediates
- (BOOL)validateForMetal;
- (MTLTexture)inputHalfResRGTex;
- (MTLTexture)inputHalfResTex1;
- (MTLTexture)inputHalfResTex1sRGB;
- (MTLTexture)inputHalfResTex2;
- (MTLTexture)inputHalfResTex2sRGB;
- (MTLTexture)inputIntermediateTex;
- (MTLTexture)inputSmoothedBlurmap;
- (void)setInputHalfResRGTex:(id)a3;
- (void)setInputHalfResTex1:(id)a3;
- (void)setInputHalfResTex1sRGB:(id)a3;
- (void)setInputHalfResTex2:(id)a3;
- (void)setInputHalfResTex2sRGB:(id)a3;
- (void)setInputIntermediateTex:(id)a3;
- (void)setInputSmoothedBlurmap:(id)a3;
@end

@implementation ApplyBlurMapIntermediates

- (BOOL)validateForMetal
{
  int v3 = objc_msgSend_conformsToProtocol_(self->_inputIntermediateTex, a2, (uint64_t)&unk_270E2A1A0);
  if (v3)
  {
    int v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex1, v4, (uint64_t)&unk_270E2A1A0);
    if (v3)
    {
      int v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex2, v5, (uint64_t)&unk_270E2A1A0);
      if (v3)
      {
        int v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex1sRGB, v6, (uint64_t)&unk_270E2A1A0);
        if (v3)
        {
          int v3 = objc_msgSend_conformsToProtocol_(self->_inputHalfResTex2sRGB, v7, (uint64_t)&unk_270E2A1A0);
          if (v3) {
            LOBYTE(v3) = (objc_msgSend_conformsToProtocol_(self->_inputHalfResRGTex, v8, (uint64_t)&unk_270E2A1A0) & 1) != 0;
          }
        }
      }
    }
  }
  return v3;
}

- (MTLTexture)inputIntermediateTex
{
  return self->_inputIntermediateTex;
}

- (void)setInputIntermediateTex:(id)a3
{
}

- (MTLTexture)inputSmoothedBlurmap
{
  return self->_inputSmoothedBlurmap;
}

- (void)setInputSmoothedBlurmap:(id)a3
{
}

- (MTLTexture)inputHalfResTex1
{
  return self->_inputHalfResTex1;
}

- (void)setInputHalfResTex1:(id)a3
{
}

- (MTLTexture)inputHalfResTex2
{
  return self->_inputHalfResTex2;
}

- (void)setInputHalfResTex2:(id)a3
{
}

- (MTLTexture)inputHalfResTex1sRGB
{
  return self->_inputHalfResTex1sRGB;
}

- (void)setInputHalfResTex1sRGB:(id)a3
{
}

- (MTLTexture)inputHalfResTex2sRGB
{
  return self->_inputHalfResTex2sRGB;
}

- (void)setInputHalfResTex2sRGB:(id)a3
{
}

- (MTLTexture)inputHalfResRGTex
{
  return self->_inputHalfResRGTex;
}

- (void)setInputHalfResRGTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHalfResRGTex, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex2sRGB, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex1sRGB, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex2, 0);
  objc_storeStrong((id *)&self->_inputHalfResTex1, 0);
  objc_storeStrong((id *)&self->_inputSmoothedBlurmap, 0);

  objc_storeStrong((id *)&self->_inputIntermediateTex, 0);
}

@end