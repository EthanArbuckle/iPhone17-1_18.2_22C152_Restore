@interface H13FastLumaSharpeningShaders
- (H13FastLumaSharpeningShaders)initWithMetalContext:(id)a3;
- (SoftISPKernelWithFunctionConstants)lumaSharpening;
@end

@implementation H13FastLumaSharpeningShaders

- (H13FastLumaSharpeningShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)H13FastLumaSharpeningShaders;
  self = [(H13FastLumaSharpeningShaders *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastLumaSharpening::lumaSharpening" usingNamespace:@"H13FastLumaSharpening::FunctionConstants" paramCombinations:&unk_270E98F30];
  lumaSharpening = self->_lumaSharpening;
  self->_lumaSharpening = v5;

  if (!self->_lumaSharpening)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (SoftISPKernelWithFunctionConstants)lumaSharpening
{
  return self->_lumaSharpening;
}

- (void).cxx_destruct
{
}

@end