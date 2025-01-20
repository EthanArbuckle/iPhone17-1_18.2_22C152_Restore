@interface TCMPSVgg16Network
- (MPSNNImageNode)output;
- (MPSNNImageNode)reluOut1;
- (MPSNNImageNode)reluOut2;
- (MPSNNImageNode)reluOut3;
- (MPSNNImageNode)reluOut4;
- (TCMPSVgg16Block1)block1;
- (TCMPSVgg16Block1)block2;
- (TCMPSVgg16Block2)block3;
- (TCMPSVgg16Block2)block4;
- (TCMPSVgg16Network)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8;
- (id)backwardPass:(id)a3;
- (void)setBlock1:(id)a3;
- (void)setBlock2:(id)a3;
- (void)setBlock3:(id)a3;
- (void)setBlock4:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setOutput:(id)a3;
- (void)setReluOut1:(id)a3;
- (void)setReluOut2:(id)a3;
- (void)setReluOut3:(id)a3;
- (void)setReluOut4:(id)a3;
@end

@implementation TCMPSVgg16Network

- (TCMPSVgg16Network)initWithParameters:(id)a3 inputNode:(id)a4 device:(id)a5 cmdQueue:(id)a6 descriptor:(id)a7 initWeights:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v49.receiver = self;
  v49.super_class = (Class)TCMPSVgg16Network;
  v18 = [(TCMPSVgg16Network *)&v49 init];
  if (v18)
  {
    v19 = [TCMPSVgg16Block1 alloc];
    v20 = [v16 block1];
    uint64_t v21 = [(TCMPSVgg16Block1 *)v19 initWithParameters:@"vgg_block_1_" inputNode:v13 device:v14 cmdQueue:v15 descriptor:v20 initWeights:v17];
    block1 = v18->_block1;
    v18->_block1 = (TCMPSVgg16Block1 *)v21;

    v23 = [TCMPSVgg16Block1 alloc];
    v24 = [(TCMPSVgg16Block1 *)v18->_block1 output];
    v25 = [v16 block2];
    uint64_t v26 = [(TCMPSVgg16Block1 *)v23 initWithParameters:@"vgg_block_2_" inputNode:v24 device:v14 cmdQueue:v15 descriptor:v25 initWeights:v17];
    block2 = v18->_block2;
    v18->_block2 = (TCMPSVgg16Block1 *)v26;

    v28 = [TCMPSVgg16Block2 alloc];
    v29 = [(TCMPSVgg16Block1 *)v18->_block2 output];
    v30 = [v16 block3];
    uint64_t v31 = [(TCMPSVgg16Block2 *)v28 initWithParameters:@"vgg_block_3_" inputNode:v29 device:v14 cmdQueue:v15 descriptor:v30 initWeights:v17];
    block3 = v18->_block3;
    v18->_block3 = (TCMPSVgg16Block2 *)v31;

    v33 = [TCMPSVgg16Block2 alloc];
    v34 = [(TCMPSVgg16Block2 *)v18->_block3 output];
    v35 = [v16 block4];
    uint64_t v36 = [(TCMPSVgg16Block2 *)v33 initWithParameters:@"vgg_block_4_" inputNode:v34 device:v14 cmdQueue:v15 descriptor:v35 initWeights:v17];
    block4 = v18->_block4;
    v18->_block4 = (TCMPSVgg16Block2 *)v36;

    uint64_t v38 = [(TCMPSVgg16Block1 *)v18->_block1 features];
    reluOut1 = v18->_reluOut1;
    v18->_reluOut1 = (MPSNNImageNode *)v38;

    uint64_t v40 = [(TCMPSVgg16Block1 *)v18->_block2 features];
    reluOut2 = v18->_reluOut2;
    v18->_reluOut2 = (MPSNNImageNode *)v40;

    uint64_t v42 = [(TCMPSVgg16Block2 *)v18->_block3 features];
    reluOut3 = v18->_reluOut3;
    v18->_reluOut3 = (MPSNNImageNode *)v42;

    uint64_t v44 = [(TCMPSVgg16Block2 *)v18->_block4 features];
    reluOut4 = v18->_reluOut4;
    v18->_reluOut4 = (MPSNNImageNode *)v44;

    uint64_t v46 = [(TCMPSVgg16Block2 *)v18->_block4 output];
    output = v18->_output;
    v18->_output = (MPSNNImageNode *)v46;
  }
  return v18;
}

- (id)backwardPass:(id)a3
{
  v4 = [(TCMPSVgg16Block2 *)self->_block4 backwardPass:a3];
  v5 = [(TCMPSVgg16Block2 *)self->_block3 backwardPass:v4];
  v6 = [(TCMPSVgg16Block1 *)self->_block2 backwardPass:v5];
  v7 = [(TCMPSVgg16Block1 *)self->_block1 backwardPass:v6];

  return v7;
}

- (void)setLearningRate:(float)a3
{
  -[TCMPSVgg16Block1 setLearningRate:](self->_block1, "setLearningRate:");
  *(float *)&double v5 = a3;
  [(TCMPSVgg16Block1 *)self->_block2 setLearningRate:v5];
  *(float *)&double v6 = a3;
  [(TCMPSVgg16Block2 *)self->_block3 setLearningRate:v6];
  block4 = self->_block4;
  *(float *)&double v8 = a3;
  [(TCMPSVgg16Block2 *)block4 setLearningRate:v8];
}

- (MPSNNImageNode)reluOut1
{
  return self->_reluOut1;
}

- (void)setReluOut1:(id)a3
{
}

- (MPSNNImageNode)reluOut2
{
  return self->_reluOut2;
}

- (void)setReluOut2:(id)a3
{
}

- (MPSNNImageNode)reluOut3
{
  return self->_reluOut3;
}

- (void)setReluOut3:(id)a3
{
}

- (MPSNNImageNode)reluOut4
{
  return self->_reluOut4;
}

- (void)setReluOut4:(id)a3
{
}

- (MPSNNImageNode)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (TCMPSVgg16Block1)block1
{
  return self->_block1;
}

- (void)setBlock1:(id)a3
{
}

- (TCMPSVgg16Block1)block2
{
  return self->_block2;
}

- (void)setBlock2:(id)a3
{
}

- (TCMPSVgg16Block2)block3
{
  return self->_block3;
}

- (void)setBlock3:(id)a3
{
}

- (TCMPSVgg16Block2)block4
{
  return self->_block4;
}

- (void)setBlock4:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block4, 0);
  objc_storeStrong((id *)&self->_block3, 0);
  objc_storeStrong((id *)&self->_block2, 0);
  objc_storeStrong((id *)&self->_block1, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_reluOut4, 0);
  objc_storeStrong((id *)&self->_reluOut3, 0);
  objc_storeStrong((id *)&self->_reluOut2, 0);
  objc_storeStrong((id *)&self->_reluOut1, 0);
}

@end