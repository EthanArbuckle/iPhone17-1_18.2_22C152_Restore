@interface _UICollectionCompositionalLayoutSolverUpdate
+ (id)solverUpdateForVisibleBounds:(double)a3 updateItems:(double)a4 updateTranslator:(uint64_t)a5 finalDataSourceSnapshot:(void *)a6;
@end

@implementation _UICollectionCompositionalLayoutSolverUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_updateTranslator, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
}

+ (id)solverUpdateForVisibleBounds:(double)a3 updateItems:(double)a4 updateTranslator:(uint64_t)a5 finalDataSourceSnapshot:(void *)a6
{
  self;
  v15 = [_UICollectionCompositionalLayoutSolverUpdate alloc];
  if (v15)
  {
    v19.receiver = v15;
    v19.super_class = (Class)_UICollectionCompositionalLayoutSolverUpdate;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      *((double *)v16 + 4) = a1;
      *((double *)v16 + 5) = a2;
      *((double *)v16 + 6) = a3;
      *((double *)v16 + 7) = a4;
      objc_storeStrong(v16 + 1, a6);
      objc_storeStrong(v17 + 2, a7);
      objc_storeStrong(v17 + 3, a8);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

@end