@interface H13FastOutlierPixelCorrectionShaders
- (H13FastOutlierPixelCorrectionShaders)initWithMetalContext:(id)a3;
- (SoftISPKernelWithFunctionConstants)outlierPixelCorrection;
@end

@implementation H13FastOutlierPixelCorrectionShaders

- (H13FastOutlierPixelCorrectionShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)H13FastOutlierPixelCorrectionShaders;
  self = [(H13FastOutlierPixelCorrectionShaders *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [[SoftISPKernelWithFunctionConstants alloc] initWithMetalContext:v4 kernelName:@"H13FastOutlierPixelCorrection::outlierPixelCorrection" usingNamespace:@"H13FastOutlierPixelCorrection::FunctionConstants" paramCombinations:&unk_270E99098];
  outlierPixelCorrection = self->_outlierPixelCorrection;
  self->_outlierPixelCorrection = v5;

  if (!self->_outlierPixelCorrection)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (SoftISPKernelWithFunctionConstants)outlierPixelCorrection
{
  return self->_outlierPixelCorrection;
}

- (void).cxx_destruct
{
}

@end