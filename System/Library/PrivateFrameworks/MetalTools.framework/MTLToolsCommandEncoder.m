@interface MTLToolsCommandEncoder
- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parallelRenderCommandEncoder:(id)a4;
- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLToolsRetainingContainer)commandBuffer;
- (NSString)label;
- (unint64_t)globalTraceObjectID;
- (void)addRetainedObject:(id)a3;
- (void)endEncoding;
- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5;
- (void)insertDebugSignpost:(id)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsCommandEncoder

- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MTLToolsCommandEncoder;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result) {
    result->_commandBuffer = (MTLToolsRetainingContainer *)a4;
  }
  return result;
}

- (MTLToolsCommandEncoder)initWithBaseObject:(id)a3 parallelRenderCommandEncoder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLToolsCommandEncoder;
  v5 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3);
  if (v5) {
    v5->_commandBuffer = (MTLToolsRetainingContainer *)[a4 commandBuffer];
  }
  return v5;
}

- (void)addRetainedObject:(id)a3
{
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

- (void)endEncoding
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 endEncoding];
}

- (void)insertDebugSignpost:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 insertDebugSignpost:a3];
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 pushDebugGroup:a3];
}

- (void)popDebugGroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 popDebugGroup];
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 filterCounterRangeWithFirstBatch:v7 lastBatch:v6 filterIndex:v5];
}

- (MTLToolsRetainingContainer)commandBuffer
{
  return self->_commandBuffer;
}

@end