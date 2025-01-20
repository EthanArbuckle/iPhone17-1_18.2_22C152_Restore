@interface MTLGPUDebugFunctionHandle
- (MTLGPUDebugFunctionHandle)initWithFunctionHandle:(id)a3 computePiplineState:(id)a4 function:(id)a5;
- (MTLGPUDebugFunctionHandle)initWithFunctionHandle:(id)a3 renderPipelineState:(id)a4 stage:(unint64_t)a5 function:(id)a6;
@end

@implementation MTLGPUDebugFunctionHandle

- (MTLGPUDebugFunctionHandle)initWithFunctionHandle:(id)a3 computePiplineState:(id)a4 function:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugFunctionHandle;
  return [(MTLToolsFunctionHandle *)&v6 initWithBaseObject:a3 parent:a4 function:a5];
}

- (MTLGPUDebugFunctionHandle)initWithFunctionHandle:(id)a3 renderPipelineState:(id)a4 stage:(unint64_t)a5 function:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugFunctionHandle;
  return [(MTLToolsFunctionHandle *)&v7 initWithBaseObject:a3 parent:a4 function:a6];
}

@end