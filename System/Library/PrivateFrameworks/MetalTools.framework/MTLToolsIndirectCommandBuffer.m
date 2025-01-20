@interface MTLToolsIndirectCommandBuffer
- (MTLResourceID)gpuResourceID;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)resourceIndex;
- (unint64_t)size;
- (unint64_t)storageMode;
- (unint64_t)uniqueIdentifier;
- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4;
- (void)resetWithRange:(_NSRange)a3;
@end

@implementation MTLToolsIndirectCommandBuffer

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectComputeCommandAtIndex:", a3);
  if (v6) {
    v7 = [(MTLToolsObject *)[MTLToolsIndirectComputeCommand alloc] initWithBaseObject:v6 parent:self];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  v5 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectRenderCommandAtIndex:", a3);
  if (v6) {
    v7 = [(MTLToolsObject *)[MTLToolsIndirectRenderCommand alloc] initWithBaseObject:v6 parent:self];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)size
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 size];
}

- (unint64_t)storageMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 storageMode];
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 getHeader:a3 headerSize:a4];
}

- (void)resetWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(MTLToolsObject *)self baseObject];

  objc_msgSend(v5, "resetWithRange:", location, length);
}

- (unint64_t)uniqueIdentifier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 uniqueIdentifier];
}

- (unint64_t)gpuAddress
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuAddress];
}

- (unint64_t)resourceIndex
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 resourceIndex];
}

- (unint64_t)gpuHandle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 gpuHandle];
}

- (MTLResourceID)gpuResourceID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLResourceID)[v2 gpuResourceID];
}

@end