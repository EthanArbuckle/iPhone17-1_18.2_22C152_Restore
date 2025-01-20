@interface MTLToolsIOScratchBufferAllocator
- (MTLToolsIOScratchBufferAllocator)initWithBaseObject:(id)a3 parent:(id)a4;
- (id)newScratchBufferWithMinimumSize:(unint64_t)a3;
- (void)dealloc;
@end

@implementation MTLToolsIOScratchBufferAllocator

- (MTLToolsIOScratchBufferAllocator)initWithBaseObject:(id)a3 parent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOScratchBufferAllocator;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOScratchBufferAllocator;
  [(MTLToolsObject *)&v2 dealloc];
}

- (id)newScratchBufferWithMinimumSize:(unint64_t)a3
{
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newScratchBufferWithMinimumSize:", a3);
  objc_super v5 = [[MTLToolsIOScratchBuffer alloc] initWithBaseObject:v4 parent:self];

  return v5;
}

@end