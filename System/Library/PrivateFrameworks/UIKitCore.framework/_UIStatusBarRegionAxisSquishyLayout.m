@interface _UIStatusBarRegionAxisSquishyLayout
- (BOOL)canOverflowItems;
- (BOOL)compressItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5;
- (_UIStatusBarRegionAxisSquishyLayout)init;
- (_UIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate;
- (double)interspace;
- (double)itemDynamicScale;
- (double)minInterspaceDynamicScale;
- (double)minItemDynamicScale;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (int64_t)maxNumberOfItems;
- (int64_t)maxNumberOfVisibleItems;
- (void)setAlignment:(int64_t)a3;
- (void)setCompressItems:(BOOL)a3;
- (void)setDynamicHidingDelegate:(id)a3;
- (void)setInterspace:(double)a3;
- (void)setItemDynamicScale:(double)a3;
- (void)setMaxNumberOfItems:(int64_t)a3;
- (void)setMaxNumberOfVisibleItems:(int64_t)a3;
- (void)setMinInterspaceDynamicScale:(double)a3;
- (void)setMinItemDynamicScale:(double)a3;
@end

@implementation _UIStatusBarRegionAxisSquishyLayout

- (_UIStatusBarRegionAxisSquishyLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarRegionAxisSquishyLayout;
  result = [(_UIStatusBarRegionAxisSquishyLayout *)&v8 init];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_itemDynamicScale = _Q0;
  result->_minInterspaceDynamicScale = 0.0;
  result->_interspace = -1.0;
  return result;
}

- (void)setMinItemDynamicScale:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minItemDynamicScale) {
    self->_minItemDynamicScale = v3;
  }
}

- (void)setMinInterspaceDynamicScale:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minInterspaceDynamicScale) {
    self->_minInterspaceDynamicScale = v3;
  }
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA48] array];
  int64_t alignment = self->_alignment;
  if (a6 == 1)
  {
    BOOL v15 = 1;
    uint64_t v60 = 4;
    uint64_t v17 = 8;
    int64_t v16 = self->_alignment;
    switch(alignment)
    {
      case 0:
        goto LABEL_17;
      case 1:
        int64_t alignment = 10;
        goto LABEL_17;
      case 3:
        break;
      case 4:
        goto LABEL_7;
      case 5:
        int64_t alignment = 11;
        goto LABEL_17;
      case 6:
      case 7:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v20 = @"Mixed alignments must be resolved before getting the attribute";
        v21 = v18;
        v22 = v19;
        uint64_t v23 = 102;
        goto LABEL_15;
      default:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v20 = @"Horizontal alignment given for vertical axis: %ld";
        int64_t v55 = alignment;
        v21 = v18;
        v22 = v19;
        uint64_t v23 = 105;
LABEL_15:
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"_UIStatusBarRegionAxisLayout_Internal.h", v23, v20, v55);
LABEL_16:

        int64_t alignment = 0;
LABEL_17:
        int64_t v16 = alignment;
        BOOL v15 = a6 == 1;
        uint64_t v17 = 7;
        if (a6) {
          uint64_t v17 = 8 * (a6 == 1);
        }
        int64_t alignment = self->_alignment;
        uint64_t v60 = v16;
        break;
    }
  }
  else if (a6)
  {
LABEL_7:
    BOOL v15 = a6 == 1;
    uint64_t v17 = 8 * (a6 == 1);
    uint64_t v60 = 3;
    int64_t v16 = 4;
  }
  else
  {
    BOOL v15 = 0;
    uint64_t v60 = 2;
    int64_t v16 = 1;
    uint64_t v17 = 7;
    switch(alignment)
    {
      case 0:
        goto LABEL_17;
      case 1:
        int64_t alignment = 9;
        goto LABEL_17;
      case 3:
        BOOL v15 = 0;
        uint64_t v60 = 6;
        int64_t v16 = 5;
        goto LABEL_12;
      case 4:
        BOOL v15 = 0;
        uint64_t v60 = 5;
        int64_t v16 = 6;
        goto LABEL_12;
      case 5:
        break;
      case 6:
        BOOL v15 = 0;
        uint64_t v60 = 1;
        int64_t v16 = 2;
LABEL_12:
        uint64_t v17 = 7;
        break;
      default:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_UIStatusBarRegionAxisLayout_Internal.h", 83, @"Vertical alignment given for horizontal axis: %ld", alignment);
        goto LABEL_16;
    }
  }
  double v24 = 1.0;
  if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    double v25 = -1.0;
  }
  else {
    double v25 = 1.0;
  }
  double minItemDynamicScale = self->_minItemDynamicScale;
  if (self->_itemDynamicScale >= minItemDynamicScale) {
    double itemDynamicScale = self->_itemDynamicScale;
  }
  else {
    double itemDynamicScale = self->_minItemDynamicScale;
  }
  if (minItemDynamicScale < 1.0) {
    double v24 = self->_minInterspaceDynamicScale
  }
        + (itemDynamicScale - minItemDynamicScale)
        / (1.0 - minItemDynamicScale)
        * (1.0 - self->_minInterspaceDynamicScale);
  uint64_t v58 = v17;
  BOOL v56 = v15;
  if ((alignment | 2) == 6)
  {
    v28 = [v10 reverseObjectEnumerator];
    uint64_t v29 = [v28 allObjects];

    id v10 = (id)v29;
  }
  id v30 = v10;
  unint64_t maxNumberOfVisibleItems = self->_maxNumberOfVisibleItems;
  v32 = v12;
  if (maxNumberOfVisibleItems >= [v30 count])
  {
    v57 = (void *)MEMORY[0x1E4F1CBF0];
    v35 = v30;
  }
  else
  {
    v33 = _UIStatusBarGetPriorityComparator();
    v34 = [v30 sortedArrayUsingComparator:v33];

    v57 = objc_msgSend(v34, "subarrayWithRange:", self->_maxNumberOfVisibleItems, objc_msgSend(v30, "count") - self->_maxNumberOfVisibleItems);
    v35 = objc_msgSend(v30, "arrayByExcludingObjectsInArray:");
  }
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__161;
  v77[4] = __Block_byref_object_dispose__161;
  id v78 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v76[3] = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __100___UIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v61[3] = &unk_1E5300F60;
  id v36 = v35;
  id v62 = v36;
  id v37 = v30;
  v68 = v76;
  double v70 = v25;
  id v63 = v37;
  v64 = self;
  id v38 = v13;
  int64_t v71 = v16;
  uint64_t v72 = v60;
  double v73 = v24;
  uint64_t v74 = v58;
  id v65 = v38;
  v69 = v77;
  id v39 = v11;
  id v66 = v39;
  id v40 = v32;
  id v67 = v40;
  double v75 = itemDynamicScale;
  [v37 enumerateObjectsUsingBlock:v61];
  if ([v36 count])
  {
    v41 = [v36 firstObject];
    v59 = [v41 layoutItem];

    v42 = [v36 lastObject];
    v43 = [v42 layoutItem];

    if (v56) {
      uint64_t v44 = 10;
    }
    else {
      uint64_t v44 = 9;
    }
    v45 = objc_alloc_init(UILayoutGuide);
    v46 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:v16 relatedBy:0 toItem:v59 attribute:v16 multiplier:1.0 constant:0.0];
    [v38 addObject:v46];

    v47 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:v60 relatedBy:0 toItem:v43 attribute:v60 multiplier:1.0 constant:0.0];
    [v38 addObject:v47];

    v48 = [MEMORY[0x1E4F5B268] constraintWithItem:v45 attribute:v44 relatedBy:0 toItem:v40 attribute:v44 multiplier:1.0 constant:(1.0 - v24) * (v25 * self->_interspace)];
    [v38 addObject:v48];

    [v39 addObject:v45];
    if (v25 == 1.0) {
      uint64_t v49 = -1;
    }
    else {
      uint64_t v49 = 1;
    }
    v50 = objc_msgSend(MEMORY[0x1E4F5B268], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, v60, v49, v40, v60);
    LODWORD(v51) = 1111752704;
    [v50 setPriority:v51];
    [v38 addObject:v50];
  }
  v52 = v67;
  id v53 = v38;

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v77, 8);

  return v53;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)[a3 count] <= self->_maxNumberOfItems;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

- (BOOL)compressItems
{
  return self->_compressItems;
}

- (void)setCompressItems:(BOOL)a3
{
  self->_compressItems = a3;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

- (int64_t)maxNumberOfVisibleItems
{
  return self->_maxNumberOfVisibleItems;
}

- (void)setMaxNumberOfVisibleItems:(int64_t)a3
{
  self->_unint64_t maxNumberOfVisibleItems = a3;
}

- (double)itemDynamicScale
{
  return self->_itemDynamicScale;
}

- (void)setItemDynamicScale:(double)a3
{
  self->_double itemDynamicScale = a3;
}

- (double)minItemDynamicScale
{
  return self->_minItemDynamicScale;
}

- (double)minInterspaceDynamicScale
{
  return self->_minInterspaceDynamicScale;
}

- (_UIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicHidingDelegate);
  return (_UIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate *)WeakRetained;
}

- (void)setDynamicHidingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end