@interface MTLToolsIOScratchBuffer
- (MTLBuffer)buffer;
- (MTLToolsIOScratchBuffer)initWithBaseObject:(id)a3 parent:(id)a4;
- (void)dealloc;
@end

@implementation MTLToolsIOScratchBuffer

- (MTLToolsIOScratchBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsIOScratchBuffer;
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
  v2.super_class = (Class)MTLToolsIOScratchBuffer;
  [(MTLToolsObject *)&v2 dealloc];
}

- (MTLBuffer)buffer
{
  objc_super v2 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "buffer");

  return (MTLBuffer *)[v2 baseObject];
}

@end