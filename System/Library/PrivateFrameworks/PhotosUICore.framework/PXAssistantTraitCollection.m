@interface PXAssistantTraitCollection
- (BOOL)isRTL;
- (PXAssistantTraitCollection)init;
- (PXAssistantTraitCollection)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4;
- (double)displayScale;
@end

@implementation PXAssistantTraitCollection

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXAssistantTraitCollection)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXAssistantTraitCollection;
  result = [(PXAssistantTraitCollection *)&v7 init];
  if (result)
  {
    result->_displayScale = a3;
    result->_isRTL = a4;
  }
  return result;
}

- (PXAssistantTraitCollection)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantTraitCollection.m", 17, @"%s is not available as initializer", "-[PXAssistantTraitCollection init]");

  abort();
}

@end