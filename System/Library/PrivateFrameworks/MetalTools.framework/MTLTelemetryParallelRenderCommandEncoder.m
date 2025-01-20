@interface MTLTelemetryParallelRenderCommandEncoder
- (MTLTelemetryParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (id)renderCommandEncoder;
- (void)endEncoding;
@end

@implementation MTLTelemetryParallelRenderCommandEncoder

- (MTLTelemetryParallelRenderCommandEncoder)initWithBaseRenderPass:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLTelemetryParallelRenderCommandEncoder;
  v7 = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:](&v9, sel_initWithParallelRenderCommandEncoder_parent_descriptor_, a3);
  if (v7)
  {
    v7->_descriptor = (MTLRenderPassDescriptor *)[a5 copy];
    v7->_telemetryDevice = (MTLTelemetryDevice *)[(MTLToolsObject *)v7 device];
    v7->_telemetryCommandBuffer = (MTLTelemetryCommandBuffer *)a4;
    v7->_encoderCount = 0;
  }
  return v7;
}

- (id)renderCommandEncoder
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoder");
  if (result)
  {
    ++self->_encoderCount;
    v4 = [[MTLTelemetryRenderCommandEncoder alloc] initWithRenderCommandEncoder:result parent:self commandBuffer:self->_telemetryCommandBuffer descriptor:self->_descriptor];
    return v4;
  }
  return result;
}

- (void)endEncoding
{
  uint64_t encoderCount = self->_encoderCount;
  if (encoderCount)
  {
    parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
    if (parallellRenderEncoderDistribution->count)
    {
      if (encoderCount > parallellRenderEncoderDistribution->max)
      {
        parallellRenderEncoderDistribution->max = encoderCount;
        parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
      }
      if (encoderCount >= parallellRenderEncoderDistribution->min) {
        goto LABEL_9;
      }
    }
    else
    {
      parallellRenderEncoderDistribution->max = encoderCount;
      parallellRenderEncoderDistribution = self->_telemetryCommandBuffer->parallellRenderEncoderDistribution;
    }
    parallellRenderEncoderDistribution->min = encoderCount;
LABEL_9:
    self->_telemetryCommandBuffer->parallellRenderEncoderDistribution->total += encoderCount;
    ++self->_telemetryCommandBuffer->parallellRenderEncoderDistribution->count;
  }
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 endEncoding];
}

@end