@interface UIStatusBarRegionAxisAligningLayout
@end

@implementation UIStatusBarRegionAxisAligningLayout

void __101___UIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  id v55 = a2;
  v4 = [v55 layoutItem];
  uint64_t v5 = [v55 overriddenVerticalAlignment];
  uint64_t v6 = v5;
  if (*(void *)(a1 + 56) != 1 || v5 == 0) {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v8 = [v55 displayable];
    if (v6 == 7)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 prefersCenterVerticalAlignment])
      {
LABEL_15:
        uint64_t v6 = 1;
        goto LABEL_16;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 || ([v8 prefersBaselineAlignment] & 1) == 0)
    {
      goto LABEL_15;
    }
    uint64_t v6 = 5;
LABEL_16:
  }
  if (v6 == 2)
  {
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(a1 + 56);
    id v16 = v4;
    v17 = v16;
    if (v15 == (void *)1)
    {
      uint64_t v18 = [v16 topAnchor];
    }
    else
    {
      if (v15) {
        goto LABEL_34;
      }
      uint64_t v18 = [v16 leadingAnchor];
    }
    v2 = (void *)v18;
LABEL_34:

    uint64_t v27 = *(void *)(a1 + 56);
    id v28 = *(id *)(a1 + 48);
    v29 = v28;
    if (v27 == 1)
    {
      uint64_t v30 = [v28 topAnchor];
    }
    else
    {
      if (v27) {
        goto LABEL_39;
      }
      uint64_t v30 = [v28 leadingAnchor];
    }
    v15 = (void *)v30;
LABEL_39:

    v31 = [v2 constraintEqualToAnchor:v15];
    LODWORD(v32) = 1112276992;
    v33 = objc_msgSend(v31, "_ui_constraintWithPriority:", v32);
    [v14 addObject:v33];

    v34 = *(void **)(a1 + 40);
    v35 = *(void **)(a1 + 56);
    id v36 = v17;
    v12 = v36;
    if (v35 == (void *)1)
    {
      uint64_t v37 = [v36 bottomAnchor];
    }
    else
    {
      if (v35) {
        goto LABEL_44;
      }
      uint64_t v37 = [v36 trailingAnchor];
    }
    v2 = (void *)v37;
LABEL_44:

    uint64_t v38 = *(void *)(a1 + 56);
    id v39 = *(id *)(a1 + 48);
    v40 = v39;
    if (v38 == 1)
    {
      uint64_t v41 = [v39 bottomAnchor];
    }
    else
    {
      if (v38) {
        goto LABEL_49;
      }
      uint64_t v41 = [v39 trailingAnchor];
    }
    v35 = (void *)v41;
LABEL_49:

    v42 = [v2 constraintEqualToAnchor:v35];
    LODWORD(v43) = 1112276992;
    v44 = objc_msgSend(v42, "_ui_constraintWithPriority:", v43);
    [v34 addObject:v44];

    v11 = *(void **)(a1 + 40);
    uint64_t v45 = *(void *)(a1 + 56);
    id v46 = v12;
    v47 = v46;
    if (v45 == 1)
    {
      uint64_t v48 = [v46 centerYAnchor];
    }
    else
    {
      if (v45) {
        goto LABEL_54;
      }
      uint64_t v48 = [v46 centerXAnchor];
    }
    v12 = (void *)v48;
LABEL_54:

    uint64_t v49 = *(void *)(a1 + 56);
    id v50 = *(id *)(a1 + 48);
    v51 = v50;
    if (v49 == 1)
    {
      uint64_t v52 = [v50 centerYAnchor];
    }
    else
    {
      if (v49)
      {
LABEL_59:

        uint64_t v13 = [v12 constraintEqualToAnchor:a1];
        goto LABEL_60;
      }
      uint64_t v52 = [v50 centerXAnchor];
    }
    a1 = v52;
    goto LABEL_59;
  }
  if (v6 == 5)
  {
    [v55 baselineOffset];
    double v10 = v9;
    v11 = *(void **)(a1 + 40);
    v12 = [v4 lastBaselineAnchor];
    a1 = [*(id *)(a1 + 48) bottomAnchor];
    uint64_t v13 = [v12 constraintEqualToAnchor:a1 constant:-v10];
LABEL_60:
    v53 = (void *)v13;
    [v11 addObject:v13];

    goto LABEL_67;
  }
  uint64_t v19 = *(void *)(a1 + 56);
  BOOL v20 = v19 != 0;
  if (v19 == 1)
  {
    [v55 centerOffset];
    double v22 = v21;
    uint64_t v19 = *(void *)(a1 + 56);
  }
  else
  {
    double v22 = 0.0;
  }
  if (v19)
  {
    switch(v6)
    {
      case 0:
      case 3:
      case 4:
        break;
      case 1:
        uint64_t v6 = 10;
        break;
      case 5:
        uint64_t v6 = 11;
        break;
      case 6:
      case 7:
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        v24 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        [v23 handleFailureInFunction:v24 file:@"_UIStatusBarRegionAxisLayout_Internal.h" lineNumber:102 description:@"Mixed alignments must be resolved before getting the attribute"];

        goto LABEL_65;
      default:
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"_UIStatusBarRegionAxisLayout_Internal.h", 105, @"Horizontal alignment given for vertical axis: %ld", v6);
        goto LABEL_64;
    }
  }
  else if (!v20 && ((0x7Bu >> v6) & 1) != 0)
  {
    uint64_t v6 = qword_186B9C4F8[v6];
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = objc_msgSend(NSString, "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"_UIStatusBarRegionAxisLayout_Internal.h", 83, @"Vertical alignment given for horizontal axis: %ld", v6);
LABEL_64:

LABEL_65:
    uint64_t v6 = 0;
  }
  v54 = *(void **)(a1 + 40);
  v12 = [MEMORY[0x1E4F5B268] constraintWithItem:v4 attribute:v6 relatedBy:0 toItem:*(void *)(a1 + 48) attribute:v6 multiplier:1.0 constant:-v22];
  [v54 addObject:v12];
LABEL_67:
}

@end