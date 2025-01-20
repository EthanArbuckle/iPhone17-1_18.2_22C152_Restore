@interface MTLTelemetryDepthStencilState
- (MTLTelemetryDepthStencilState)initWithBaseDepthStencilState:(id)a3 device:(id)a4 descriptor:(id)a5;
@end

@implementation MTLTelemetryDepthStencilState

- (MTLTelemetryDepthStencilState)initWithBaseDepthStencilState:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v25.receiver = self;
  v25.super_class = (Class)MTLTelemetryDepthStencilState;
  v7 = -[MTLToolsObject initWithBaseObject:parent:](&v25, sel_initWithBaseObject_parent_, a3);
  if (v7 && [a4 enableTelemetry])
  {
    uint64_t v8 = *((void *)a4 + 55);
    uint64_t v9 = [a5 depthCompareFunction];
    ++*(_DWORD *)(v8 + 4 * v9 + 4);
    ++**((_DWORD **)a4 + 55);
    if ([a5 frontFaceStencil])
    {
      unsigned int v10 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "stencilCompareFunction");
      unsigned int v11 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "stencilFailureOperation");
      unsigned int v12 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "depthFailureOperation");
      unsigned int v13 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "depthStencilPassOperation");
      uint64_t v14 = 32 * v10;
      ++*(_DWORD *)(*((void *)a4 + 56) + v14 + 4 * v11);
      uint64_t v15 = *((void *)a4 + 56) + v14 + 4 * v12;
      ++*(_DWORD *)(v15 + 256);
      uint64_t v16 = *((void *)a4 + 56) + v14 + 4 * v13;
      ++*(_DWORD *)(v16 + 512);
    }
    if ([a5 backFaceStencil])
    {
      unsigned int v17 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "stencilCompareFunction");
      unsigned int v18 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "stencilFailureOperation");
      unsigned int v19 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "depthFailureOperation");
      unsigned int v20 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "depthStencilPassOperation");
      uint64_t v21 = 32 * v17;
      ++*(_DWORD *)(*((void *)a4 + 57) + v21 + 4 * v18);
      uint64_t v22 = *((void *)a4 + 57) + v21 + 4 * v19;
      ++*(_DWORD *)(v22 + 256);
      uint64_t v23 = *((void *)a4 + 57) + v21 + 4 * v20;
      ++*(_DWORD *)(v23 + 512);
    }
  }
  return v7;
}

@end