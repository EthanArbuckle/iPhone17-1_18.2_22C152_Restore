@interface _UIUpdateVisibleCellsContext
- (_UIUpdateVisibleCellsContext)init;
- (id)description;
- (void)addPreferredAttributes:(uint64_t)a1;
@end

@implementation _UIUpdateVisibleCellsContext

- (void)addPreferredAttributes:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (!a2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_addPreferredAttributes_, a1, @"UICollectionViewLayout.m", 3055, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];
  }
  [a2 size];
  double v5 = v4;
  double v7 = v6;
  id v12 = [a2 indexPath];
  if (v12)
  {
    if (a2) {
      goto LABEL_6;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_addPreferredAttributes_, a1, @"UICollectionViewLayout.m", 3059, @"Received preferred attributes without an index path. Attributes: %@", a2 object file lineNumber description];

    if (a2)
    {
LABEL_6:
      if (a2[144])
      {
        v8 = *(void **)(a1 + 8);
        v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v5, v7);
        [v8 addObject:v9];

        [*(id *)(a1 + 24) addObject:v12];
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v12, "section"));
  [*(id *)(a1 + 16) addObject:a2];
}

- (_UIUpdateVisibleCellsContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UIUpdateVisibleCellsContext;
  v2 = [(_UIUpdateVisibleCellsContext *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sizes = v2->_sizes;
    v2->_sizes = v3;

    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    indexPaths = v2->_indexPaths;
    v2->_indexPaths = v5;

    double v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    sectionIndexes = v2->_sectionIndexes;
    v2->_sectionIndexes = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    attributes = v2->_attributes;
    v2->_attributes = v9;

    v2->_visibleCellsRefCount = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexes, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@:%p ", v5, self];

  if ([(NSMutableArray *)self->_sizes count])
  {
    unint64_t v6 = 0;
    do
    {
      if (v6) {
        [v3 appendString:@"; "];
      }
      double v7 = [(NSMutableArray *)self->_sizes objectAtIndexedSubscript:v6];
      [v7 CGSizeValue];
      CGFloat v9 = v8;
      CGFloat v11 = v10;

      objc_super v12 = [(NSMutableArray *)self->_indexPaths objectAtIndexedSubscript:v6];
      v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "section"));
      v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "item"));
      v18.width = v9;
      v18.height = v11;
      v15 = NSStringFromCGSize(v18);
      [v3 appendFormat:@"(%@,%@) -> %@", v13, v14, v15];

      ++v6;
    }
    while (v6 < [(NSMutableArray *)self->_sizes count]);
  }
  [v3 appendString:@">"];
  return v3;
}

@end