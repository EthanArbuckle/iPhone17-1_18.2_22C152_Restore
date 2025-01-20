@interface TCMPSStyleTransferPreProcessing
- (MPSNNImageNode)output;
- (MPSNNMultiplicationNode)multiplicationNode;
- (MPSNNSubtractionNode)subtractionNode;
- (TCMPSStyleTransferPreProcessing)initWithParameters:(id)a3 inputNode:(id)a4 scaleNode:(id)a5 meanNode:(id)a6;
- (id)backwardPass:(id)a3;
- (void)setMultiplicationNode:(id)a3;
- (void)setOutput:(id)a3;
- (void)setSubtractionNode:(id)a3;
@end

@implementation TCMPSStyleTransferPreProcessing

- (TCMPSStyleTransferPreProcessing)initWithParameters:(id)a3 inputNode:(id)a4 scaleNode:(id)a5 meanNode:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TCMPSStyleTransferPreProcessing;
  v12 = [(TCMPSStyleTransferPreProcessing *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F13390] nodeWithLeftSource:v9 rightSource:v10];
    multiplicationNode = v12->_multiplicationNode;
    v12->_multiplicationNode = (MPSNNMultiplicationNode *)v13;

    v15 = (void *)MEMORY[0x263F133C0];
    v16 = [(MPSNNMultiplicationNode *)v12->_multiplicationNode resultImage];
    uint64_t v17 = [v15 nodeWithLeftSource:v16 rightSource:v11];
    subtractionNode = v12->_subtractionNode;
    v12->_subtractionNode = (MPSNNSubtractionNode *)v17;

    uint64_t v19 = [(MPSNNSubtractionNode *)v12->_subtractionNode resultImage];
    output = v12->_output;
    v12->_output = (MPSNNImageNode *)v19;
  }
  return v12;
}

- (id)backwardPass:(id)a3
{
  v4 = [(MPSNNSubtractionNode *)self->_subtractionNode gradientFilterWithSource:a3];
  multiplicationNode = self->_multiplicationNode;
  v6 = [v4 resultImage];
  v7 = [(MPSNNMultiplicationNode *)multiplicationNode gradientFilterWithSource:v6];

  v8 = [v7 resultImage];

  return v8;
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (MPSNNMultiplicationNode)multiplicationNode
{
  return self->_multiplicationNode;
}

- (void)setMultiplicationNode:(id)a3
{
}

- (MPSNNSubtractionNode)subtractionNode
{
  return self->_subtractionNode;
}

- (void)setSubtractionNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtractionNode, 0);
  objc_storeStrong((id *)&self->_multiplicationNode, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end