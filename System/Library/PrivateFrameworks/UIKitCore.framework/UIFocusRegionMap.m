@interface UIFocusRegionMap
@end

@implementation UIFocusRegionMap

uint64_t __83___UIFocusRegionMap_linearlyOrderedFocusRegionMapEntriesForFocusMovement_fromView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  int v22 = *(unsigned __int8 *)(a1 + 32);
  int v23 = *(unsigned __int8 *)(a1 + 33);
  return _UIFocusRectCompare(v22, v23, v7, v9, v11, v13, v15, v17, v19, v21);
}

@end