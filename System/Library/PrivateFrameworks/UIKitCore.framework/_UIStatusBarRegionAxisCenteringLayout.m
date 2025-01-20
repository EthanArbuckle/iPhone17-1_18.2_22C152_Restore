@interface _UIStatusBarRegionAxisCenteringLayout
- (BOOL)canOverflowItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5;
- (_UIStatusBarRegionAxisCenteringLayout)init;
- (double)interspace;
- (double)margin;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)maxNumberOfItems;
- (void)setInterspace:(double)a3;
- (void)setMargin:(double)a3;
- (void)setMaxNumberOfItems:(int64_t)a3;
@end

@implementation _UIStatusBarRegionAxisCenteringLayout

- (_UIStatusBarRegionAxisCenteringLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarRegionAxisCenteringLayout;
  result = [(_UIStatusBarRegionAxisCenteringLayout *)&v8 init];
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&result->_interspace = _Q0;
  result->_maxNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void *)[v11 count];
  v73 = [MEMORY[0x1E4F1CA48] array];
  if (self->_margin != -1.0 && self->_interspace != -1.0)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2 object:self file:@"_UIStatusBarRegionAxisCenteringLayout.m" lineNumber:35 description:@"Can't set both margin and interspace to specific values"];
  }
  if (v14 == (void *)1)
  {
    v15 = [v11 firstObject];
    v16 = [v15 layoutItem];

    id v17 = v16;
    v18 = v17;
    if (a6 == 1)
    {
      self = [v17 centerYAnchor];
      v19 = v73;
    }
    else
    {
      v19 = v73;
      if (!a6)
      {
        self = [v17 centerXAnchor];
      }
    }

    id v36 = v13;
    v37 = v36;
    if (a6 == 1)
    {
      uint64_t v38 = [v36 centerYAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_21;
      }
      uint64_t v38 = [v36 centerXAnchor];
    }
    v15 = (void *)v38;
LABEL_21:

    v39 = [(_UIStatusBarRegionAxisCenteringLayout *)self constraintEqualToAnchor:v15];
    [v19 addObject:v39];

    id v40 = v18;
    v41 = v40;
    if (a6 == 1)
    {
      v42 = [v40 topAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_26;
      }
      v42 = [v40 leadingAnchor];
    }
    self = v42;
LABEL_26:

    id v43 = v37;
    v44 = v43;
    if (a6 == 1)
    {
      uint64_t v45 = [v43 topAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_31;
      }
      uint64_t v45 = [v43 leadingAnchor];
    }
    v15 = (void *)v45;
LABEL_31:

    v46 = [(_UIStatusBarRegionAxisCenteringLayout *)self constraintGreaterThanOrEqualToAnchor:v15];
    [v19 addObject:v46];

    id v47 = v41;
    v48 = v47;
    if (a6 == 1)
    {
      v49 = [v47 bottomAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_36;
      }
      v49 = [v47 trailingAnchor];
    }
    self = v49;
LABEL_36:

    id v50 = v44;
    v51 = v50;
    if (a6 == 1)
    {
      uint64_t v52 = [v50 bottomAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_41:

        v53 = [(_UIStatusBarRegionAxisCenteringLayout *)self constraintLessThanOrEqualToAnchor:v15];
        [v19 addObject:v53];

        goto LABEL_71;
      }
      uint64_t v52 = [v50 trailingAnchor];
    }
    v15 = (void *)v52;
    goto LABEL_41;
  }
  v20 = objc_alloc_init(UILayoutGuide);
  v21 = objc_alloc_init(UILayoutGuide);
  v22 = v85;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = __Block_byref_object_copy__177;
  v85[4] = __Block_byref_object_dispose__177;
  id v86 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __102___UIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v74[3] = &unk_1E5305738;
  id v75 = v73;
  v23 = v20;
  v24 = v11;
  v25 = v23;
  v76 = v23;
  int64_t v83 = a6;
  id v70 = v13;
  id v26 = v13;
  id v27 = v75;
  v28 = (double *)self;
  id v77 = v26;
  v72 = v24;
  v82 = v85;
  id v78 = v24;
  v79 = self;
  id v71 = v12;
  id v29 = v12;
  id v80 = v29;
  v84 = v14;
  v30 = v21;
  v81 = v30;
  [v78 enumerateObjectsUsingBlock:v74];
  double margin = self->_margin;
  v32 = v25;
  v33 = v32;
  if (margin != -1.0)
  {
    if (a6 == 1)
    {
      uint64_t v35 = [(UILayoutGuide *)v32 heightAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_63;
      }
      uint64_t v35 = [(UILayoutGuide *)v32 widthAnchor];
    }
    v14 = (void *)v35;
LABEL_63:

    v64 = [v14 constraintEqualToConstant:v28[2]];
    [v27 addObject:v64];

    v65 = v30;
    v66 = v65;
    if (a6 == 1)
    {
      uint64_t v67 = [(UILayoutGuide *)v65 heightAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_68:

        v28 = [v14 constraintEqualToConstant:v28[2]];
        [v27 addObject:v28];
        goto LABEL_69;
      }
      uint64_t v67 = [(UILayoutGuide *)v65 widthAnchor];
    }
    v14 = (void *)v67;
    goto LABEL_68;
  }
  if (a6 == 1)
  {
    uint64_t v34 = [(UILayoutGuide *)v32 heightAnchor];
  }
  else
  {
    if (a6) {
      goto LABEL_44;
    }
    uint64_t v34 = [(UILayoutGuide *)v32 widthAnchor];
  }
  v14 = (void *)v34;
LABEL_44:

  v54 = v30;
  v55 = v54;
  if (a6 == 1)
  {
    uint64_t v56 = [(UILayoutGuide *)v54 heightAnchor];
  }
  else
  {
    if (a6) {
      goto LABEL_49;
    }
    uint64_t v56 = [(UILayoutGuide *)v54 widthAnchor];
  }
  v22 = (void *)v56;
LABEL_49:

  v57 = [v14 constraintEqualToAnchor:v22];
  [v27 addObject:v57];

  if (v28[1] == -1.0)
  {
    id v58 = [v29 lastObject];
    v14 = v58;
    if (a6 == 1)
    {
      uint64_t v59 = [v58 heightAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_55;
      }
      uint64_t v59 = [v58 widthAnchor];
    }
    v28 = (double *)v59;
LABEL_55:

    v60 = v33;
    v61 = v60;
    if (a6 == 1)
    {
      uint64_t v62 = [(UILayoutGuide *)v60 heightAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_60:

        v63 = [v28 constraintEqualToAnchor:v22];
        [v27 addObject:v63];

LABEL_69:
        goto LABEL_70;
      }
      uint64_t v62 = [(UILayoutGuide *)v60 widthAnchor];
    }
    v22 = (void *)v62;
    goto LABEL_60;
  }
LABEL_70:
  [v29 addObject:v33];
  [v29 addObject:v30];

  _Block_object_dispose(v85, 8);
  id v12 = v71;
  id v11 = v72;
  id v13 = v70;
  v19 = v73;
LABEL_71:

  return v19;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)[a3 count] <= self->_maxNumberOfItems;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_double margin = a3;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

@end