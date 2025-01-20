@interface CLIPInferenceEngine
- (CLIPInferenceEngine)init;
- (PNCVNLPWrapper)clipModelWrapper;
- (id)encodeQuery:(id)a3;
- (void)setClipModelWrapper:(id)a3;
@end

@implementation CLIPInferenceEngine

- (void).cxx_destruct
{
}

- (void)setClipModelWrapper:(id)a3
{
}

- (PNCVNLPWrapper)clipModelWrapper
{
  return self->_clipModelWrapper;
}

- (id)encodeQuery:(id)a3
{
  id v4 = a3;
  v5 = [(CLIPInferenceEngine *)self clipModelWrapper];
  uint64_t v9 = 0;
  v6 = [v5 encodeText:v4 error:&v9];

  if (v6)
  {
    v7 = +[PLEmbeddingUtilities extractNumericalValuesForScenePrint:v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (CLIPInferenceEngine)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLIPInferenceEngine;
  v2 = [(CLIPInferenceEngine *)&v9 init];
  if (!v2) {
    goto LABEL_3;
  }
  id v8 = 0;
  v3 = [[PNCVNLPWrapper alloc] initWithCLIPModelName:@"v3.1" error:&v8];
  id v4 = v8;
  clipModelWrapper = v2->_clipModelWrapper;
  v2->_clipModelWrapper = v3;

  v6 = 0;
  if (!v4) {
LABEL_3:
  }
    v6 = v2;

  return v6;
}

@end