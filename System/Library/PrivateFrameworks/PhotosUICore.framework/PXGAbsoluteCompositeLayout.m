@interface PXGAbsoluteCompositeLayout
- (BOOL)shouldUpdateSublayoutsInStrictOrder;
- (PXGAbsoluteCompositeLayout)init;
- (PXGAbsoluteCompositeLayout)initWithComposition:(id)a3;
- (_PXGAbsoluteSublayoutComposition)absoluteComposition;
- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4;
- (void)removeSublayoutsInRange:(_NSRange)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3 forSublayoutAtIndex:(int64_t)a4;
- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setOrigin:(CGPoint)a3 forSublayoutAtIndex:(int64_t)a4;
- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setReferenceDepth:(double)a3 forSublayoutAtIndex:(int64_t)a4;
- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3;
- (void)setSpriteTransform:(id *)a3 forSublayoutAtIndex:(int64_t)a4;
- (void)setZPosition:(double)a3 forSublayoutAtIndex:(int64_t)a4;
- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4;
@end

@implementation PXGAbsoluteCompositeLayout

- (void).cxx_destruct
{
}

- (_PXGAbsoluteSublayoutComposition)absoluteComposition
{
  return self->_absoluteComposition;
}

- (BOOL)shouldUpdateSublayoutsInStrictOrder
{
  v2 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  char v3 = [v2 shouldUpdateSublayoutsInStrictOrder];

  return v3;
}

- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  [v4 setShouldUpdateSublayoutsInStrictOrder:v3];
}

- (void)setSpriteTransform:(id *)a3 forSublayoutAtIndex:(int64_t)a4
{
  id v6 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v6, "setSpriteTransforms:forSublayoutsInRange:", a3, a4, 1);
}

- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v7, "setReferenceDepths:forSublayoutsInRange:", a3, location, length);
}

- (void)setReferenceDepth:(double)a3 forSublayoutAtIndex:(int64_t)a4
{
  double v4 = a3;
  -[PXGAbsoluteCompositeLayout setReferenceDepths:forSublayoutsInRange:](self, "setReferenceDepths:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v7, "setZPositions:forSublayoutsInRange:", a3, location, length);
}

- (void)setZPosition:(double)a3 forSublayoutAtIndex:(int64_t)a4
{
  double v4 = a3;
  -[PXGAbsoluteCompositeLayout setZPositions:forSublayoutsInRange:](self, "setZPositions:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v7, "setFrames:forSublayoutsInRange:", a3, location, length);
}

- (void)setFrame:(CGRect)a3 forSublayoutAtIndex:(int64_t)a4
{
  CGRect v4 = a3;
  -[PXGAbsoluteCompositeLayout setFrames:forSublayoutsInRange:](self, "setFrames:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v7, "setOrigins:forSublayoutsInRange:", a3, location, length);
}

- (void)setOrigin:(CGPoint)a3 forSublayoutAtIndex:(int64_t)a4
{
  CGPoint v4 = a3;
  -[PXGAbsoluteCompositeLayout setOrigins:forSublayoutsInRange:](self, "setOrigins:forSublayoutsInRange:", &v4, a4, 1);
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGLayout setContentSize:](&v7, sel_setContentSize_);
  id v6 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v6, "setContentSize:", width, height);
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7.receiver = self;
  v7.super_class = (Class)PXGAbsoluteCompositeLayout;
  [(PXGLayout *)&v7 removeSublayoutsInRange:sel_removeSublayoutsInRange_];
  id v6 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v6, "removeRange:", location, length);
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v8, "insertRange:", location, length);

  v9.receiver = self;
  v9.super_class = (Class)PXGAbsoluteCompositeLayout;
  -[PXGCompositeLayout insertSublayoutProvider:inRange:](&v9, sel_insertSublayoutProvider_inRange_, v7, location, length);
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PXGAbsoluteCompositeLayout *)self absoluteComposition];
  objc_msgSend(v7, "insertRange:", a4, 1);

  v8.receiver = self;
  v8.super_class = (Class)PXGAbsoluteCompositeLayout;
  [(PXGLayout *)&v8 insertSublayout:v6 atIndex:a4];
}

- (PXGAbsoluteCompositeLayout)initWithComposition:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGAbsoluteCompositeLayout.m", 45, @"%s is not available as initializer", "-[PXGAbsoluteCompositeLayout initWithComposition:]");

  abort();
}

- (PXGAbsoluteCompositeLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGAbsoluteCompositeLayout;
  v2 = [(PXGCompositeLayout *)&v6 init];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(_PXGAbsoluteSublayoutComposition);
    absoluteComposition = v2->_absoluteComposition;
    v2->_absoluteComposition = v3;

    [(PXGCompositeLayout *)v2 setComposition:v2->_absoluteComposition];
  }
  return v2;
}

@end