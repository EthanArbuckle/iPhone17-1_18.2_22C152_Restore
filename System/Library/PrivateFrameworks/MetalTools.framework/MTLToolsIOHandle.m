@interface MTLToolsIOHandle
- (MTLToolsIOHandle)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSString)label;
- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7;
- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7;
- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8;
- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4;
- (unint64_t)globalTraceObjectID;
- (unint64_t)length;
- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4;
- (unsigned)vnioID;
- (void)dealloc;
- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6;
- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsIOHandle

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

- (unsigned)vnioID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 vnioID];
}

- (MTLToolsIOHandle)initWithBaseObject:(id)a3 parent:(id)a4
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsIOHandle;
    return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOHandle;
  [(MTLToolsObject *)&v2 dealloc];
}

- (unint64_t)globalTraceObjectID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 globalTraceObjectID];
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8
{
  id v14 = [(MTLToolsObject *)self baseObject];

  return [v14 read:a3 size:a4 offset:a5 stagingBuffer:a6 stagingBufferSize:a7 needsDecompress:a8];
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  return (void *)[v12 readIntoStagingBuffer:a3 offset:a4 stagingBuffer:a5 stagingBufferSize:a6 needsDecompress:a7];
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  return [v12 read:a3 size:a4 offset:a5 stagingBuffer:a6 stagingBufferSize:a7];
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  return (void *)[v10 readIntoStagingBuffer:a3 offset:a4 stagingBuffer:a5 stagingBufferSize:a6];
}

- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 stagingBufferSize:a3 offset:a4];
}

- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 getHandleOffset:a3 offset:a4];
}

- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  return [v12 decompress:a3 size:a4 offset:a5 stagingBuffer:a6 stagingBufferSize:a7];
}

- (unint64_t)length
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 length];
}

@end