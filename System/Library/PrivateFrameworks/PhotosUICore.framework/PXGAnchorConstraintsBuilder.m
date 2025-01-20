@interface PXGAnchorConstraintsBuilder
- (NSArray)constraints;
- (PXGAnchorConstraintsBuilder)init;
- (void)_keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 inequality:(int64_t)a6 visibleEdge:(unsigned int)a7 offset:(double)a8;
- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 greaterThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7;
- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 lessThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7;
- (void)keepSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 visuallyStableForAttribute:(int64_t)a5;
- (void)keepVisiblePortionOfSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 padding:(UIEdgeInsets)a5 visuallyStableForAttribute:(int64_t)a6;
@end

@implementation PXGAnchorConstraintsBuilder

- (void).cxx_destruct
{
}

- (PXGAnchorConstraintsBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGAnchorConstraintsBuilder;
  v2 = [(PXGAnchorConstraintsBuilder *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v2->_constraints;
    v2->_constraints = v3;
  }
  return v2;
}

- (NSArray)constraints
{
  v2 = (void *)[(NSMutableArray *)self->_constraints copy];
  return (NSArray *)v2;
}

- (void)_keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 inequality:(int64_t)a6 visibleEdge:(unsigned int)a7 offset:(double)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  if ((((v12 - 1) & 0xFFFFFFFD) != 0) == (((v9 - 1) & 0xFFFFFFFD) == 0)) {
    PXAssertGetLog();
  }
  v15 = objc_alloc_init(PXGAnchorConstraint);
  [(PXGAnchorConstraint *)v15 setSpriteEdge:v12];
  [(PXGAnchorConstraint *)v15 setSpriteReference:v14];
  [(PXGAnchorConstraint *)v15 setReferencingOptions:a5];
  [(PXGAnchorConstraint *)v15 setInequality:a6];
  [(PXGAnchorConstraint *)v15 setVisibleRectEdge:v9];
  [(PXGAnchorConstraint *)v15 setOffset:a8];
  [(NSMutableArray *)self->_constraints addObject:v15];
}

- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 greaterThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7
{
}

- (void)keepEdge:(unsigned int)a3 ofSpriteWithReference:(id)a4 referencingOptions:(unint64_t)a5 lessThanOrEqualToVisibleEdge:(unsigned int)a6 offset:(double)a7
{
}

- (void)keepVisiblePortionOfSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 padding:(UIEdgeInsets)a5 visuallyStableForAttribute:(int64_t)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  if (!a6) {
    PXAssertGetLog();
  }
  id v14 = objc_alloc_init(PXGAnchorConstraint);
  [(PXGAnchorConstraint *)v14 setVisiblePortionOnly:1];
  [(PXGAnchorConstraint *)v14 setSpriteReference:v13];
  [(PXGAnchorConstraint *)v14 setReferencingOptions:a4];
  -[PXGAnchorConstraint setPadding:](v14, "setPadding:", top, left, bottom, right);
  [(PXGAnchorConstraint *)v14 setSpriteAttribute:a6];
  [(NSMutableArray *)self->_constraints addObject:v14];
}

- (void)keepSpriteWithReference:(id)a3 referencingOptions:(unint64_t)a4 visuallyStableForAttribute:(int64_t)a5
{
  id v8 = a3;
  if (!a5) {
    PXAssertGetLog();
  }
  uint64_t v9 = objc_alloc_init(PXGAnchorConstraint);
  [(PXGAnchorConstraint *)v9 setSpriteReference:v8];
  [(PXGAnchorConstraint *)v9 setReferencingOptions:a4];
  [(PXGAnchorConstraint *)v9 setSpriteAttribute:a5];
  [(NSMutableArray *)self->_constraints addObject:v9];
}

@end