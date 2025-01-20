@interface NRFCompletionStatus
- (FigMetalExecutionStatus)metalExecutionStatus;
- (MTLCommandBuffer)commandBuffer;
- (NRFCompletionStatus)init;
- (void)setCommandBuffer:(id)a3;
- (void)setMetalExecutionStatus:(id)a3;
- (void)waitForCompletion;
@end

@implementation NRFCompletionStatus

- (NRFCompletionStatus)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRFCompletionStatus;
  v2 = [(NRFCompletionStatus *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    metalExecutionStatus = v2->_metalExecutionStatus;
    v2->_metalExecutionStatus = (FigMetalExecutionStatus *)v3;

    if (!v2->_metalExecutionStatus)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
      v6 = 0;
      goto LABEL_5;
    }
    commandBuffer = v2->_commandBuffer;
    v2->_commandBuffer = 0;
  }
  v6 = v2;
LABEL_5:

  return v6;
}

- (void)waitForCompletion
{
  [(MTLCommandBuffer *)self->_commandBuffer waitUntilCompleted];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;
}

- (FigMetalExecutionStatus)metalExecutionStatus
{
  return self->_metalExecutionStatus;
}

- (void)setMetalExecutionStatus:(id)a3
{
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);

  objc_storeStrong((id *)&self->_metalExecutionStatus, 0);
}

@end