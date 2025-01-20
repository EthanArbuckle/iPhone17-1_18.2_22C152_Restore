@interface _UIStatusBarRegionAxisStackingLayout
- (BOOL)canOverflowItems;
- (BOOL)hugging;
- (double)interspace;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
- (void)setHugging:(BOOL)a3;
- (void)setInterspace:(double)a3;
@end

@implementation _UIStatusBarRegionAxisStackingLayout

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA48] array];
  int64_t alignment = self->_alignment;
  v53 = v11;
  if (a6 == 1)
  {
    double v16 = -1.0;
    int v15 = 1;
    double v18 = 1.0;
    uint64_t v17 = 3;
    uint64_t v22 = 10;
    uint64_t v21 = 4;
    int64_t v19 = self->_alignment;
    switch(alignment)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_29;
      case 3:
        int v15 = 0;
        uint64_t v22 = 3;
        uint64_t v21 = 4;
        uint64_t v17 = 3;
        goto LABEL_29;
      case 4:
        goto LABEL_21;
      case 5:
        int64_t alignment = 11;
        goto LABEL_28;
      case 6:
      case 7:
        id v23 = v12;
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v26 = @"Mixed alignments must be resolved before getting the attribute";
        v27 = v24;
        v28 = v25;
        uint64_t v29 = 102;
        goto LABEL_10;
      default:
        id v23 = v12;
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v26 = @"Horizontal alignment given for vertical axis: %ld";
        int64_t v51 = alignment;
        v27 = v24;
        v28 = v25;
        uint64_t v29 = 105;
LABEL_10:
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"_UIStatusBarRegionAxisLayout_Internal.h", v29, v26, v51);
LABEL_11:

        int64_t alignment = self->_alignment;
        id v12 = v23;
        break;
    }
  }
  else if (!a6)
  {
    int v15 = 0;
    double v16 = -1.0;
    uint64_t v17 = 1;
    double v18 = 1.0;
    int64_t v19 = 2;
    uint64_t v20 = 9;
    uint64_t v21 = 2;
    uint64_t v22 = 1;
    switch(alignment)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_23;
      case 3:
        LODWORD(v17) = 0;
        uint64_t v20 = 5;
        goto LABEL_23;
      case 4:
        int64_t v19 = 6;
        uint64_t v17 = 5;
        goto LABEL_21;
      case 5:
        goto LABEL_29;
      case 6:
        goto LABEL_21;
      default:
        id v23 = v12;
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"_UIStatusBarRegionAxisLayout_Internal.h", 83, @"Vertical alignment given for horizontal axis: %ld", alignment);
        goto LABEL_11;
    }
    goto LABEL_29;
  }
  if (alignment == 1)
  {
    int v15 = 1;
    if (a6)
    {
      uint64_t v22 = 0;
      if (a6 == 1)
      {
        double v18 = 1.0;
        uint64_t v17 = 3;
        uint64_t v21 = 4;
      }
      else
      {
        int64_t alignment = 0;
LABEL_28:
        int v15 = 0;
        double v18 = 1.0;
        uint64_t v21 = alignment;
        uint64_t v22 = alignment;
        uint64_t v17 = alignment;
      }
    }
    else
    {
      LODWORD(v17) = 1;
      uint64_t v20 = 0;
LABEL_23:
      double v18 = 1.0;
      uint64_t v21 = 6;
      uint64_t v22 = v20;
      int v15 = v17;
      uint64_t v17 = 5;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
      double v18 = -1.0;
    }
    else {
      double v18 = 1.0;
    }
    if ((alignment | 2) == 6)
    {
      double v16 = v18;
      uint64_t v17 = 0;
      int64_t v19 = 0;
LABEL_21:
      [v10 reverseObjectEnumerator];
      v31 = id v30 = v12;
      uint64_t v32 = [v31 allObjects];

      id v12 = v30;
      int v15 = 0;
      double v18 = v16;
      uint64_t v21 = v17;
      uint64_t v22 = v19;
      uint64_t v17 = v19;
      id v10 = (id)v32;
    }
    else
    {
      int v15 = 0;
      uint64_t v22 = 0;
      uint64_t v17 = 0;
    }
  }
LABEL_29:
  uint64_t v52 = v22;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __101___UIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v54[3] = &unk_1E5305788;
  id v33 = v10;
  id v55 = v33;
  id v34 = v13;
  uint64_t v59 = v17;
  uint64_t v60 = v21;
  double v61 = v18;
  id v56 = v34;
  v57 = self;
  char v62 = v15;
  id v35 = v12;
  id v58 = v35;
  [v33 enumerateObjectsUsingBlock:v54];
  v36 = [v33 lastObject];
  v37 = [v36 layoutItem];

  if (v15)
  {
    v38 = objc_alloc_init(UILayoutGuide);
    v39 = [v33 firstObject];
    v40 = [v39 layoutItem];

    v41 = [v33 lastObject];
    v42 = [v41 layoutItem];

    v43 = [MEMORY[0x1E4F5B268] constraintWithItem:v38 attribute:v17 relatedBy:0 toItem:v40 attribute:v17 multiplier:1.0 constant:0.0];
    [v34 addObject:v43];

    v44 = [MEMORY[0x1E4F5B268] constraintWithItem:v38 attribute:v21 relatedBy:0 toItem:v42 attribute:v21 multiplier:1.0 constant:0.0];
    [v34 addObject:v44];

    v45 = [MEMORY[0x1E4F5B268] constraintWithItem:v38 attribute:v52 relatedBy:0 toItem:v35 attribute:v52 multiplier:1.0 constant:0.0];
    [v34 addObject:v45];

    v46 = v53;
    [v53 addObject:v38];
  }
  else
  {
    if (self->_hugging)
    {
      v38 = [MEMORY[0x1E4F5B268] constraintWithItem:v37 attribute:v21 relatedBy:0 toItem:v35 attribute:v21 multiplier:1.0 constant:0.0];
    }
    else
    {
      if (v18 == 1.0) {
        uint64_t v47 = -1;
      }
      else {
        uint64_t v47 = 1;
      }
      objc_msgSend(MEMORY[0x1E4F5B268], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, v21, v47, v35, v21);
      v38 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = 1132134400;
      [(UILayoutGuide *)v38 setPriority:v48];
    }
    [v34 addObject:v38];
    v46 = v53;
  }

  id v49 = v34;
  return v49;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (BOOL)hugging
{
  return self->_hugging;
}

- (void)setHugging:(BOOL)a3
{
  self->_hugging = a3;
}

@end