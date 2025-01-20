@interface PXStoryHitTestResult
- (PXStoryHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5;
- (id)clipIdentifier:(int64_t)a3;
- (int64_t)clipIdentifier;
@end

@implementation PXStoryHitTestResult

- (int64_t)clipIdentifier
{
  return self->_clipIdentifier;
}

- (id)clipIdentifier:(int64_t)a3
{
  *((void *)self + 16) = a3;
  return self;
}

- (PXStoryHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 spriteReferenceForSpriteIndex:v6];
  v13.receiver = self;
  v13.super_class = (Class)PXStoryHitTestResult;
  v11 = [(PXGHitTestResult *)&v13 initWithSpriteReference:v10 layout:v9 identifier:v8 userData:0];

  v11->_clipIdentifier = 0;
  return v11;
}

@end