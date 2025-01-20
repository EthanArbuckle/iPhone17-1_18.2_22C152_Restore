@interface MTLCountersComputeCommandEncoder
- (MTLCountersComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setComputePipelineState:(id)a3;
- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
@end

@implementation MTLCountersComputeCommandEncoder

- (MTLCountersComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLCountersComputeCommandEncoder;
  v6 = [(MTLToolsComputeCommandEncoder *)&v8 initWithComputeCommandEncoder:a3 parent:a4 descriptor:a5];
  if (v6)
  {
    v6->_traceEncoder = (MTLCountersTraceComputeCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "computeCommandEncoder");
    *(&v6->_APITimingEnabled + 4) = objc_msgSend((id)objc_msgSend(a4, "device"), "APITimingEnabled");
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCountersComputeCommandEncoder;
  [(MTLToolsObject *)&v3 dealloc];
}

- (void)insertDebugSignpost:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugSignpost:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 insertDebugSignpost:a3];
}

- (void)pushDebugGroup:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v3 = mach_absolute_time();
  }
  else {
    uint64_t v3 = 0;
  }
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  v7 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v7 popDebugGroup];
}

- (void)setLabel:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  v9 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v9 setLabel:a3];
}

- (void)setComputePipelineState:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  v9 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v9 setComputePipelineState:a3];
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  v13 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v13 setBytes:a3 length:a4 atIndex:a5];
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  v13 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v13 setBuffer:a3 offset:a4 atIndex:a5];
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setBufferOffset:a3 atIndex:a4];
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v10 = mach_absolute_time();
  }
  else {
    uint64_t v10 = 0;
  }
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  v14 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setBuffers:offsets:withRange:](v14, "setBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setTexture:a3 atIndex:a4];
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTextures:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setTextures:withRange:](v12, "setTextures:withRange:", a3, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setSamplerState:a3 atIndex:a4];
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerStates:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setSamplerStates:withRange:](v12, "setSamplerStates:withRange:", a3, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v11 = mach_absolute_time();
  }
  else {
    uint64_t v11 = 0;
  }
  self->_traceEncoder->super._timer = v11;
  id v12 = [(MTLToolsObject *)self baseObject];
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  [v12 setSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v13 atIndex:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  v20 = self->_traceEncoder;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;

  [(MTLCountersTraceComputeCommandEncoder *)v20 setSamplerState:a3 lodMinClamp:a6 lodMaxClamp:v15 atIndex:v16];
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v12 = mach_absolute_time();
  }
  else {
    uint64_t v12 = 0;
  }
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  double v16 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setSamplerStates:lodMinClamps:lodMaxClamps:withRange:](v16, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setThreadgroupMemoryLength:a3 atIndex:a4];
}

- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 setImageBlockWidth:a3 height:a4];
}

- (void)setStageInRegion:(id *)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  id v6 = [(MTLToolsObject *)self baseObject];
  long long v7 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v7;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  [v6 setStageInRegion:v14];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;
  long long v12 = *(_OWORD *)&a3->var0.var2;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLCountersTraceComputeCommandEncoder *)v11 setStageInRegion:v13];
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  uint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setStageInRegionWithIndirectBuffer:a3 indirectBufferOffset:a4];
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  id v8 = [(MTLToolsObject *)self baseObject];
  long long v19 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v17 = *(_OWORD *)&a4->var0;
  unint64_t v18 = a4->var2;
  [v8 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  long long v12 = self->_traceEncoder;
  long long v15 = *(_OWORD *)&a3->var0;
  unint64_t v16 = a3->var2;
  long long v13 = *(_OWORD *)&a4->var0;
  unint64_t v14 = a4->var2;
  [(MTLCountersTraceComputeCommandEncoder *)v12 dispatchThreadgroups:&v15 threadsPerThreadgroup:&v13];
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  id v10 = [(MTLToolsObject *)self baseObject];
  long long v17 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  [v10 dispatchThreadgroupsWithIndirectBuffer:a3 indirectBufferOffset:a4 threadsPerThreadgroup:&v17];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  unint64_t v14 = self->_traceEncoder;
  long long v15 = *(_OWORD *)&a5->var0;
  unint64_t v16 = a5->var2;
  [(MTLCountersTraceComputeCommandEncoder *)v14 dispatchThreadgroupsWithIndirectBuffer:a3 indirectBufferOffset:a4 threadsPerThreadgroup:&v15];
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  id v8 = [(MTLToolsObject *)self baseObject];
  long long v19 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  long long v17 = *(_OWORD *)&a4->var0;
  unint64_t v18 = a4->var2;
  [v8 dispatchThreads:&v19 threadsPerThreadgroup:&v17];
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  long long v12 = self->_traceEncoder;
  long long v15 = *(_OWORD *)&a3->var0;
  unint64_t v16 = a3->var2;
  long long v13 = *(_OWORD *)&a4->var0;
  unint64_t v14 = a4->var2;
  [(MTLCountersTraceComputeCommandEncoder *)v12 dispatchThreads:&v15 threadsPerThreadgroup:&v13];
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 dispatchThreadsWithIndirectBuffer:a3 indirectBufferOffset:a4];
}

- (void)updateFence:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v9 updateFence:a3];
}

- (void)waitForFence:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v9 waitForFence:a3];
}

- (void)endEncoding
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v3 = mach_absolute_time();
  }
  else {
    uint64_t v3 = 0;
  }
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  uint64_t v7 = self->_traceEncoder;

  [(MTLCountersTraceCommandEncoder *)v7 endEncoding];
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 useResource:a3 usage:a4];
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v9 = mach_absolute_time();
  }
  else {
    uint64_t v9 = 0;
  }
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResources:count:usage:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  long long v13 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v13 useResources:a3 count:a4 usage:a5];
}

- (void)useHeap:(id)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v9 useHeap:a3];
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeaps:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 useHeaps:a3 count:a4];
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v5 = mach_absolute_time();
  }
  else {
    uint64_t v5 = 0;
  }
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  uint64_t v9 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v9 memoryBarrierWithScope:a3];
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithResources:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 memoryBarrierWithResources:a3 count:a4];
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setVisibleFunctionTable:a3 atBufferIndex:a4];
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withBufferRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](v12, "setVisibleFunctionTables:withBufferRange:", a3, location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v7 = mach_absolute_time();
  }
  else {
    uint64_t v7 = 0;
  }
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  unint64_t v11 = self->_traceEncoder;

  [(MTLCountersTraceComputeCommandEncoder *)v11 setIntersectionFunctionTable:a3 atBufferIndex:a4];
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (*(&self->_APITimingEnabled + 4)) {
    uint64_t v8 = mach_absolute_time();
  }
  else {
    uint64_t v8 = 0;
  }
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withBufferRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    uint64_t v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    unint64_t v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    unint64_t v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  unint64_t v12 = self->_traceEncoder;

  -[MTLCountersTraceComputeCommandEncoder setIntersectionFunctionTables:withBufferRange:](v12, "setIntersectionFunctionTables:withBufferRange:", a3, location, length);
}

@end