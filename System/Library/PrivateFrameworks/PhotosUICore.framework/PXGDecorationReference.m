@interface PXGDecorationReference
- (PXGDecorationReference)init;
- (PXGDecorationReference)initWithDecoratedSpriteReference:(id)a3 decorationType:(int64_t)a4;
- (PXGSpriteReference)decoratedSpriteReference;
- (int64_t)decorationType;
@end

@implementation PXGDecorationReference

- (void).cxx_destruct
{
}

- (int64_t)decorationType
{
  return self->_decorationType;
}

- (PXGSpriteReference)decoratedSpriteReference
{
  return self->_decoratedSpriteReference;
}

- (PXGDecorationReference)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGDecoratingLayout.m", 1170, @"%s is not available as initializer", "-[PXGDecorationReference init]");

  abort();
}

- (PXGDecorationReference)initWithDecoratedSpriteReference:(id)a3 decorationType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGDecorationReference;
  v8 = [(PXGDecorationReference *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_decoratedSpriteReference, a3);
    v9->_decorationType = a4;
  }

  return v9;
}

@end