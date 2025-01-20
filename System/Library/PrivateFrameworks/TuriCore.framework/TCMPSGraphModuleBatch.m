@interface TCMPSGraphModuleBatch
- (MTLCommandBuffer)commandBuffer;
- (NSArray)grad;
- (NSArray)input;
- (NSArray)lossState;
- (NSArray)output;
- (TCMPSGraphModuleBatch)initWithCommandBuffer:(id)a3;
- (void)setGrad:(id)a3;
- (void)setInput:(id)a3;
- (void)setLossState:(id)a3;
- (void)setOutput:(id)a3;
@end

@implementation TCMPSGraphModuleBatch

- (TCMPSGraphModuleBatch)initWithCommandBuffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCMPSGraphModuleBatch;
  v6 = [(TCMPSGraphModuleBatch *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_commandBuffer, a3);
  }

  return v7;
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSArray)grad
{
  return self->_grad;
}

- (void)setGrad:(id)a3
{
}

- (NSArray)lossState
{
  return self->_lossState;
}

- (void)setLossState:(id)a3
{
}

- (NSArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_lossState, 0);
  objc_storeStrong((id *)&self->_grad, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
}

@end