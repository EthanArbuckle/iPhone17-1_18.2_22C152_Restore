@interface _UICollectionViewCompositionLayout
+ (Class)invalidationContextClass;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6;
- (CGSize)collectionViewContentSize;
- (NSArray)sublayouts;
- (_UICollectionViewCompositionLayout)init;
- (id)_originConvertedSublayoutAttributesForAttributes:(id)a3 inLayout:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_prepareLayout:(id)a3;
- (void)addSublayout:(id)a3 forElementKinds:(id)a4;
- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8;
- (void)addSublayout:(id)a3 forRect:(CGRect)a4;
- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)removeSublayout:(id)a3;
@end

@implementation _UICollectionViewCompositionLayout

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (_UICollectionViewCompositionLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewCompositionLayout;
  v2 = [(UICollectionViewLayout *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sublayoutsDict = v2->_sublayoutsDict;
    v2->_sublayoutsDict = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMutableDictionary *)v2->_sublayoutsDict setObject:v5 forKeyedSubscript:@"UINoElementKind"];
  }
  return v2;
}

- (void)addSublayout:(id)a3 forRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  objc_msgSend(v9, "_setFrame:", x, y, width, height);
  [v9 _setSublayoutType:1];
  [v9 _setCompositionLayout:self];
  id v10 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
  [v10 addObject:v9];
}

- (CGRect)_frameForLayout:(id)a3 offset:(CGPoint)a4 relativeToEdges:(unint64_t)a5 fromSiblingLayout:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v12 = a6;
  [a3 collectionViewContentSize];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v12 _frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat rect = v23;

  if ((*((_DWORD *)&self->super._collectionView->super.super._viewFlags + 4) & 0x80000) != 0)
  {
    [(_UICollectionViewCompositionLayout *)self collectionViewContentSize];
    double v27 = v26;
    v40.origin.double x = v11;
    v40.origin.double y = v10;
    v40.size.double width = v14;
    v40.size.double height = v16;
    double v11 = v27 - CGRectGetWidth(v40);
    uint64_t v24 = 8;
    uint64_t v25 = 2;
    if ((a5 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v24 = 2;
    uint64_t v25 = 8;
    if ((a5 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if ((a5 & 4) != 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"UICollectionViewCompositionLayout.m" lineNumber:79 description:@"UICollectionViewCompositionLayout cannot place a sublayout relative to both the top and bottom edge of a sibling layout"];
  }
  v41.origin.double x = v18;
  v41.origin.double y = v20;
  v41.size.double width = v22;
  v41.size.double height = rect;
  double MinY = CGRectGetMinY(v41);
  v42.origin.double x = v11;
  v42.origin.double y = v10;
  v42.size.double width = v14;
  v42.size.double height = v16;
  double v10 = MinY - (y + CGRectGetHeight(v42));
LABEL_8:
  if ((a5 & 4) != 0)
  {
    v43.origin.double x = v18;
    v43.origin.double y = v20;
    v43.size.double width = v22;
    v43.size.double height = rect;
    double v10 = y + CGRectGetMaxY(v43);
  }
  unint64_t v29 = v25 & a5;
  if ((v24 & a5) != 0)
  {
    if (v29)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:self file:@"UICollectionViewCompositionLayout.m" lineNumber:86 description:@"UICollectionViewCompositionLayout cannot place a sublayout relative to both the leading and trailing edge of a sibling layout"];
    }
    v44.origin.double x = v18;
    v44.origin.double y = v20;
    v44.size.double width = v22;
    v44.size.double height = rect;
    double MinX = CGRectGetMinX(v44);
    v45.origin.double x = v11;
    v45.origin.double y = v10;
    v45.size.double width = v14;
    v45.size.double height = v16;
    double v11 = MinX - (x + CGRectGetWidth(v45));
  }
  if (v29)
  {
    v46.origin.double x = v18;
    v46.origin.double y = v20;
    v46.size.double width = v22;
    v46.size.double height = rect;
    double v11 = x + CGRectGetMaxX(v46);
  }
  double v31 = v11;
  double v32 = v10;
  double v33 = v14;
  double v34 = v16;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (void)addSublayout:(id)a3 forSections:(id)a4 offset:(CGPoint)a5 relativeToEdges:(unint64_t)a6 fromSiblingLayout:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  id v19 = a3;
  id v14 = a7;
  [v19 _setSections:a4];
  [v19 _setSublayoutType:2];
  [v19 _setCompositionLayout:self];
  if (v14)
  {
    double v15 = [(_UICollectionViewCompositionLayout *)self sublayouts];
    char v16 = [v15 containsObject:v14];

    if ((v16 & 1) == 0)
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"UICollectionViewCompositionLayout.m", 101, @"attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent", v19, v14 object file lineNumber description];
    }
  }
  objc_msgSend(v19, "_setLayoutOffset:", x, y);
  [v19 _setLayoutOffsetEdges:a6];
  [v19 _setSiblingLayout:v14];
  CGFloat v18 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
  [v18 addObject:v19];
}

- (void)addSublayout:(id)a3 forItems:(id)a4 inSection:(int64_t)a5 offset:(CGPoint)a6 relativeToEdges:(unint64_t)a7 fromSiblingLayout:(id)a8
{
  double y = a6.y;
  double x = a6.x;
  id v24 = a3;
  id v16 = a8;
  double v17 = (void *)MEMORY[0x1E4F28D60];
  id v18 = a4;
  id v19 = [v17 indexSetWithIndex:a5];
  [v24 _setSections:v19];

  [v24 _setItems:v18];
  [v24 _setSublayoutType:3];
  [v24 _setCompositionLayout:self];
  if (v16)
  {
    CGFloat v20 = [(_UICollectionViewCompositionLayout *)self sublayouts];
    char v21 = [v20 containsObject:v16];

    if ((v21 & 1) == 0)
    {
      CGFloat v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"UICollectionViewCompositionLayout.m", 114, @"attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent", v24, v16 object file lineNumber description];
    }
  }
  objc_msgSend(v24, "_setLayoutOffset:", x, y);
  [v24 _setLayoutOffsetEdges:a7];
  [v24 _setSiblingLayout:v16];
  double v23 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
  [v23 addObject:v24];
}

- (void)addSublayout:(id)a3 forElementKinds:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 _setElementKinds:v7];
  [v6 _setSublayoutType:4];
  [v6 _setCompositionLayout:self];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sublayoutsDict, "setObject:forKeyedSubscript:", v6, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)removeSublayout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  sublayoutsDict = self->_sublayoutsDict;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __54___UICollectionViewCompositionLayout_removeSublayout___block_invoke;
  long long v13 = &unk_1E52E6008;
  id v14 = v4;
  id v15 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)sublayoutsDict enumerateKeysAndObjectsUsingBlock:&v10];
  -[NSMutableDictionary removeObjectsForKeys:](self->_sublayoutsDict, "removeObjectsForKeys:", v7, v10, v11, v12, v13);
  uint64_t v9 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
  [v9 removeObject:v8];
}

- (NSArray)sublayouts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(NSMutableDictionary *)self->_sublayoutsDict valueForKey:@"UINoElementKind"];
  id v5 = [v4 allObjects];
  id v6 = (void *)[v3 initWithArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(NSMutableDictionary *)self->_sublayoutsDict objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSArray *)v6;
}

- (CGSize)collectionViewContentSize
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (CGFloat *)MEMORY[0x1E4F1DB28];
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(_UICollectionViewCompositionLayout *)self sublayouts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    CGFloat x = *v2;
    CGFloat y = v2[1];
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v11) _frame];
        v27.origin.CGFloat x = v12;
        v27.origin.CGFloat y = v13;
        v27.size.CGFloat width = v14;
        v27.size.CGFloat height = v15;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v27);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (id)_originConvertedSublayoutAttributesForAttributes:(id)a3 inLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 _frame];
  if (v9 == *MEMORY[0x1E4F1DAD8] && v8 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    id v11 = v6;
  }
  else
  {
    id v11 = (id)[v6 copy];
    [v6 frame];
    -[UICollectionViewLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v7);
    objc_msgSend(v11, "setFrame:");
  }

  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(_UICollectionViewCompositionLayout *)self sublayouts];
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      uint64_t v12 = 0;
      uint64_t v38 = v10;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        CGFloat v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
        objc_msgSend(v13, "_frame", v38);
        v54.origin.double x = v14;
        v54.origin.double y = v15;
        v54.size.double width = v16;
        v54.size.double height = v17;
        v52.origin.double x = x;
        v52.origin.double y = y;
        v52.size.double width = width;
        v52.size.double height = height;
        if (CGRectIntersectsRect(v52, v54))
        {
          -[UICollectionViewLayout convertRect:toLayout:](self, "convertRect:toLayout:", v13, x, y, width, height);
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          CGRect v26 = [v13 layoutAttributesForElementsInRect:v18];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v41 != v29) {
                  objc_enumerationMutation(v26);
                }
                double v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                [v31 frame];
                v55.origin.double x = v32;
                v55.origin.double y = v33;
                v55.size.double width = v34;
                v55.size.double height = v35;
                v53.origin.double x = v19;
                v53.origin.double y = v21;
                v53.size.double width = v23;
                v53.size.double height = v25;
                if (CGRectIntersectsRect(v53, v55))
                {
                  v36 = [(_UICollectionViewCompositionLayout *)self _originConvertedSublayoutAttributesForAttributes:v31 inLayout:v13];
                  [v8 addObject:v36];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v28);
          }

          uint64_t v10 = v38;
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:0x1ED1062C0];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 layoutAttributesForItemAtIndexPath:v5];
    uint64_t v9 = [(_UICollectionViewCompositionLayout *)self _originConvertedSublayoutAttributesForAttributes:v8 inLayout:v7];
  }
  else
  {
    SEL v22 = a2;
    id v23 = v5;
    uint64_t v10 = [v5 section];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v11 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          CGFloat v17 = [v16 _sections];
          char v18 = [v17 containsIndex:v10];

          if (v18)
          {
            id v5 = v23;
            double v20 = [v16 layoutAttributesForItemAtIndexPath:v23];
            uint64_t v9 = [(_UICollectionViewCompositionLayout *)self _originConvertedSublayoutAttributesForAttributes:v20 inLayout:v16];

            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    CGFloat v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:v22, self, @"UICollectionViewCompositionLayout.m", 208, @"composition layout (%@) does not have a sublayout for UICollectionElementKindCell or for section %ld", self, v10 object file lineNumber description];

    uint64_t v9 = 0;
    id v5 = v23;
  }
LABEL_13:

  return v9;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (id *)a4;
  sublayoutsDict = self->_sublayoutsDict;
  uint64_t v10 = -[UIBarButtonItemGroup _items](v8);
  uint64_t v11 = [(NSMutableDictionary *)sublayoutsDict objectForKeyedSubscript:v10];

  if (v11)
  {
    char v12 = [v11 shouldInvalidateLayoutForPreferredLayoutAttributes:v7 withOriginalAttributes:v8];
  }
  else
  {
    SEL v25 = a2;
    id v27 = v7;
    uint64_t v13 = [v8 indexPath];
    uint64_t v14 = [v13 section];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = self;
    CGFloat v15 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CGFloat v21 = [v20 _sections];
          char v22 = [v21 containsIndex:v14];

          if (v22)
          {
            id v7 = v27;
            char v12 = [v20 shouldInvalidateLayoutForPreferredLayoutAttributes:v27 withOriginalAttributes:v8];

            goto LABEL_13;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, v14);

    char v12 = 0;
    id v7 = v27;
  }
LABEL_13:

  return v12;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 layoutAttributesForSupplementaryViewOfKind:v7 atIndexPath:v8];
  }
  else
  {
    SEL v23 = a2;
    id v25 = v8;
    uint64_t v12 = [v8 section];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v24 = self;
    uint64_t v13 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          CGFloat v19 = [v18 _sections];
          char v20 = [v19 containsIndex:v12];

          if (v20)
          {
            id v8 = v25;
            uint64_t v11 = [v18 layoutAttributesForSupplementaryViewOfKind:v7 atIndexPath:v25];

            goto LABEL_13;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    CGFloat v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, v7, v12);

    uint64_t v11 = 0;
    id v8 = v25;
  }
LABEL_13:

  return v11;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 layoutAttributesForDecorationViewOfKind:v7 atIndexPath:v8];
  }
  else
  {
    SEL v23 = a2;
    id v25 = v8;
    uint64_t v12 = [v8 section];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v24 = self;
    uint64_t v13 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          CGFloat v19 = [v18 _sections];
          char v20 = [v19 containsIndex:v12];

          if (v20)
          {
            id v8 = v25;
            uint64_t v11 = [v18 layoutAttributesForDecorationViewOfKind:v7 atIndexPath:v25];

            goto LABEL_13;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    CGFloat v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, v7, v12);

    uint64_t v11 = 0;
    id v8 = v25;
  }
LABEL_13:

  return v11;
}

- (void)prepareLayout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewCompositionLayout;
  [(UICollectionViewLayout *)&v12 prepareLayout];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(_UICollectionViewCompositionLayout *)self sublayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(_UICollectionViewCompositionLayout *)self _prepareLayout:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_prepareLayout:(id)a3
{
  id v4 = a3;
  id v11 = [v4 _siblingLayout];
  if (v11 && ([v11 _isPrepared] & 1) == 0) {
    [(_UICollectionViewCompositionLayout *)self _prepareLayout:v11];
  }
  [v4 prepareLayout];
  [v4 _layoutOffset];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 _layoutOffsetEdges];
  long long v10 = [v4 _siblingLayout];
  -[_UICollectionViewCompositionLayout _frameForLayout:offset:relativeToEdges:fromSiblingLayout:](self, "_frameForLayout:offset:relativeToEdges:fromSiblingLayout:", v4, v9, v10, v6, v8);
  objc_msgSend(v4, "_setFrame:");
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_UICollectionViewCompositionLayout;
  [(UICollectionViewLayout *)&v28 invalidateLayoutWithContext:v4];
  double v5 = [v4 _invalidationContextTable];
  double v6 = v5;
  if (v5)
  {
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    double v7 = [v5 keyEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v6 objectForKey:v12];
          [v12 invalidateLayoutWithContext:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    *((void *)&v20 + 1) = 0;
    long long v21 = 0uLL;
    double v7 = [(_UICollectionViewCompositionLayout *)self sublayouts];
    uint64_t v14 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v7);
          }
          uint64_t v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          id v19 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
          objc_msgSend(v19, "_setInvalidateEverything:", objc_msgSend(v4, "invalidateEverything"));
          objc_msgSend(v19, "_setInvalidateDataSourceCounts:", objc_msgSend(v4, "invalidateDataSourceCounts"));
          [v18 invalidateLayoutWithContext:v19];
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v15);
    }
  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(_UICollectionViewCompositionLayout *)self sublayouts];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "invalidationContextForBoundsChange:", x, y, width, height);
        [v9 setObject:v16 forKey:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [v8 _setInvalidationContextTable:v9];
  return v8;
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (id *)a4;
  v33.receiver = self;
  v33.super_class = (Class)_UICollectionViewCompositionLayout;
  id v8 = [(UICollectionViewLayout *)&v33 invalidationContextForPreferredLayoutAttributes:v6 withOriginalAttributes:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  sublayoutsDict = self->_sublayoutsDict;
  uint64_t v11 = -[UIBarButtonItemGroup _items](v7);
  id v12 = [(NSMutableDictionary *)sublayoutsDict objectForKeyedSubscript:v11];

  if (!v12)
  {
    uint64_t v13 = [v7 indexPath];
    uint64_t v14 = [v13 section];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = [(NSMutableDictionary *)self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      long long v27 = v8;
      id v28 = v6;
      uint64_t v18 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v21 = objc_msgSend(v20, "_sections", v27, v28);
          int v22 = [v21 containsIndex:v14];

          if (v22)
          {
            id v12 = v20;
            goto LABEL_12;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      id v12 = 0;
LABEL_12:
      id v8 = v27;
      id v6 = v28;
    }
    else
    {
      id v12 = 0;
    }
  }
  uint64_t v23 = [v12 invalidationContextForPreferredLayoutAttributes:v6 withOriginalAttributes:v7];
  long long v24 = v23;
  if (v23)
  {
    long long v25 = [v23 invalidatedItemIndexPaths];
    [v8 invalidateItemsAtIndexPaths:v25];

    [v9 setObject:v24 forKey:v12];
  }
  [v8 _setInvalidationContextTable:v9];

  return v8;
}

- (void).cxx_destruct
{
}

@end