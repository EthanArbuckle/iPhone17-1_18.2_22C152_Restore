@interface MTLDebugCounterSampleBuffer
- (MTLCounterSampleBufferDescriptor)descriptor;
- (MTLDebugCounterSampleBuffer)initWithCounterSampleBuffer:(id)a3 device:(id)a4 descriptor:(id)a5;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)resolveCounterRange:(_NSRange)a3;
- (unint64_t)storageMode;
- (void)dealloc;
@end

@implementation MTLDebugCounterSampleBuffer

- (MTLDebugCounterSampleBuffer)initWithCounterSampleBuffer:(id)a3 device:(id)a4 descriptor:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugCounterSampleBuffer;
  v6 = [(MTLToolsObject *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6)
  {
    v6->_descriptor = (MTLCounterSampleBufferDescriptor *)[a5 copy];
    v6->_storageMode = [a5 storageMode];
  }
  return v6;
}

- (void)dealloc
{
  self->_descriptor = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCounterSampleBuffer;
  [(MTLToolsObject *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  uint64_t v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", v4);
  v10[0] = v5;
  v10[1] = @"label =";
  if ([(MTLToolsCounterSampleBuffer *)self label]) {
    objc_super v8 = [(MTLToolsCounterSampleBuffer *)self label];
  }
  else {
    objc_super v8 = @"<none>";
  }
  v10[2] = v8;
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLDebugCounterSampleBuffer *)self formattedDescription:0];
}

- (id)resolveCounterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length > [(MTLToolsCounterSampleBuffer *)self sampleCount])
  {
    NSUInteger v9 = v6;
    unint64_t v10 = [(MTLToolsCounterSampleBuffer *)self sampleCount];
    MTLReportFailure();
  }
  if ([(MTLDebugCounterSampleBuffer *)self storageMode] == 2) {
    MTLReportFailure();
  }
  id v7 = [(MTLToolsObject *)self baseObject];

  return (id)objc_msgSend(v7, "resolveCounterRange:", location, length);
}

- (MTLCounterSampleBufferDescriptor)descriptor
{
  return self->_descriptor;
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

@end