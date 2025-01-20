@interface STHorizontallySegmentedView
- (BOOL)truncateLabels;
- (BOOL)useVibrancy;
- (NSArray)segmentConstraints;
- (NSArray)segmentItems;
- (NSMutableArray)segmentViews;
- (NSNumber)numberOfLines;
- (STHorizontallySegmentedView)init;
- (STHorizontallySegmentedView)initWithCoder:(id)a3;
- (STHorizontallySegmentedView)initWithVibrancy:(BOOL)a3 maximumNumberOfLines:(unint64_t)a4 truncateLabels:(BOOL)a5;
- (double)previousWidth;
- (unint64_t)maximumNumberOfLines;
- (void)_setUpConstraints;
- (void)_stHorizontallySegmentedViewCommonInit;
- (void)layoutSubviews;
- (void)setNumberOfLines:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setSegmentConstraints:(id)a3;
- (void)setSegmentItems:(id)a3;
@end

@implementation STHorizontallySegmentedView

- (STHorizontallySegmentedView)initWithVibrancy:(BOOL)a3 maximumNumberOfLines:(unint64_t)a4 truncateLabels:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)STHorizontallySegmentedView;
  v8 = -[STHorizontallySegmentedView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8->_useVibrancy = a3;
  v8->_maximumNumberOfLines = a4;
  v8->_truncateLabels = a5;
  [(STHorizontallySegmentedView *)v8 _stHorizontallySegmentedViewCommonInit];
  return v8;
}

- (STHorizontallySegmentedView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STHorizontallySegmentedView;
  v3 = [(STHorizontallySegmentedView *)&v5 initWithCoder:a3];
  [(STHorizontallySegmentedView *)v3 _stHorizontallySegmentedViewCommonInit];
  return v3;
}

- (void)_stHorizontallySegmentedViewCommonInit
{
  numberOfLines = self->_numberOfLines;
  self->_numberOfLines = (NSNumber *)&unk_26D967090;

  self->_previousWidth = 0.0;
  segmentItems = self->_segmentItems;
  objc_super v5 = (NSArray *)MEMORY[0x263EFFA68];
  self->_segmentItems = (NSArray *)MEMORY[0x263EFFA68];

  v6 = (NSMutableArray *)objc_opt_new();
  segmentViews = self->_segmentViews;
  self->_segmentViews = v6;

  segmentConstraints = self->_segmentConstraints;
  self->_segmentConstraints = v5;
}

- (STHorizontallySegmentedView)init
{
  return [(STHorizontallySegmentedView *)self initWithVibrancy:0 maximumNumberOfLines:0 truncateLabels:0];
}

- (void)setSegmentItems:(id)a3
{
  v4 = (NSArray *)a3;
  segmentItems = self->_segmentItems;
  if (segmentItems != v4 && ![(NSArray *)segmentItems isEqualToArray:v4])
  {
    v6 = (NSArray *)[(NSArray *)v4 copy];
    v7 = self->_segmentItems;
    self->_segmentItems = v6;

    BOOL v8 = [(STHorizontallySegmentedView *)self useVibrancy];
    BOOL v9 = [(STHorizontallySegmentedView *)self truncateLabels];
    objc_super v10 = [(STHorizontallySegmentedView *)self segmentViews];
    unint64_t v11 = [v10 count];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __47__STHorizontallySegmentedView_setSegmentItems___block_invoke;
    v18 = &unk_264767D00;
    unint64_t v21 = v11;
    id v12 = v10;
    BOOL v22 = v8;
    BOOL v23 = v9;
    id v19 = v12;
    v20 = self;
    [(NSArray *)v4 enumerateObjectsUsingBlock:&v15];
    unint64_t v13 = [(NSArray *)v4 count];
    if (v11 > v13)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v13, v11 - v13);
      [v12 enumerateObjectsAtIndexes:v14 options:0 usingBlock:&__block_literal_global_10];
      [v12 removeObjectsAtIndexes:v14];
    }
    [(STHorizontallySegmentedView *)self _setUpConstraints];
  }
}

void __47__STHorizontallySegmentedView_setSegmentItems___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  if (*(void *)(a1 + 48) <= a3)
  {
    id v7 = a2;
    BOOL v8 = [[STSegmentView alloc] initWithItem:v7 useVibrancy:*(unsigned __int8 *)(a1 + 56) truncateLabels:*(unsigned __int8 *)(a1 + 57)];

    [(STSegmentView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [*(id *)(a1 + 40) addSubview:v8];
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    objc_super v5 = *(void **)(a1 + 32);
    id v6 = a2;
    BOOL v8 = [v5 objectAtIndexedSubscript:a3];
    [(STSegmentView *)v8 setItem:v6];
  }
}

uint64_t __47__STHorizontallySegmentedView_setSegmentItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)layoutSubviews
{
  if (![(STHorizontallySegmentedView *)self useVibrancy])
  {
    [(STHorizontallySegmentedView *)self previousWidth];
    double v4 = v3;
    [(STHorizontallySegmentedView *)self frame];
    if (v4 != CGRectGetWidth(v6)) {
      [(STHorizontallySegmentedView *)self _setUpConstraints];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)STHorizontallySegmentedView;
  [(STHorizontallySegmentedView *)&v5 layoutSubviews];
}

- (void)_setUpConstraints
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  v69 = [(STHorizontallySegmentedView *)self segmentViews];
  v68 = [v69 firstObject];
  v2 = v68;
  if (v68)
  {
    [(STHorizontallySegmentedView *)self frame];
    double Width = CGRectGetWidth(v92);
    -[STHorizontallySegmentedView setPreviousWidth:](self, "setPreviousWidth:");
    unint64_t v4 = [(STHorizontallySegmentedView *)self maximumNumberOfLines];
    if (v4 == 1 || Width <= 0.0) {
      double Width = 1.79769313e308;
    }
    CGRect v6 = objc_opt_new();
    id v7 = [v68 topAnchor];
    BOOL v8 = [(STHorizontallySegmentedView *)self topAnchor];
    BOOL v9 = [v7 constraintEqualToAnchor:v8];
    [v6 addObject:v9];

    objc_super v10 = [v68 leadingAnchor];
    unint64_t v11 = [(STHorizontallySegmentedView *)self leadingAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    [v6 addObject:v12];

    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    uint64_t v85 = 1;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    *(double *)&v81[3] = Width;
    unint64_t v13 = objc_opt_new();
    uint64_t v14 = [v69 count];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 1, v14 - 1);
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __48__STHorizontallySegmentedView__setUpConstraints__block_invoke;
    v71[3] = &unk_264767D48;
    id v16 = v69;
    int64x2_t v78 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    id v72 = v16;
    v76 = v81;
    v77 = &v82;
    id v17 = v6;
    id v73 = v17;
    v74 = self;
    id v18 = v13;
    id v75 = v18;
    unint64_t v79 = v4;
    double v80 = Width;
    [v16 enumerateObjectsAtIndexes:v15 options:0 usingBlock:v71];
    v66 = (void *)v15;
    v67 = [v16 lastObject];
    if (v83[3] == 1 && v14 == 2)
    {
      id v19 = objc_opt_new();
      [(STHorizontallySegmentedView *)self addLayoutGuide:v19];
      [v18 addObject:v19];
      v20 = [v19 topAnchor];
      unint64_t v21 = [v67 topAnchor];
      BOOL v22 = [v20 constraintEqualToAnchor:v21];
      [v17 addObject:v22];

      BOOL v23 = [v19 leadingAnchor];
      v24 = [v67 trailingAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      [v17 addObject:v25];

      v26 = [v19 bottomAnchor];
      v27 = [v67 bottomAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      [v17 addObject:v28];

      v29 = objc_opt_new();
      [(STHorizontallySegmentedView *)self addLayoutGuide:v29];
      [v18 addObject:v29];
      v30 = [v29 topAnchor];
      v31 = [v19 topAnchor];
      v32 = [v30 constraintEqualToAnchor:v31];
      [v17 addObject:v32];

      v33 = [v29 leadingAnchor];
      v34 = [v19 trailingAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      [v17 addObject:v35];

      v36 = [v29 bottomAnchor];
      v37 = [v19 bottomAnchor];
      v38 = [v36 constraintEqualToAnchor:v37];
      [v17 addObject:v38];

      v39 = [v29 bottomAnchor];
      v40 = [(STHorizontallySegmentedView *)self bottomAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      [v17 addObject:v41];

      v42 = [v29 trailingAnchor];
      v43 = [(STHorizontallySegmentedView *)self trailingAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      [v17 addObject:v44];
    }
    else
    {
      v45 = [v67 bottomAnchor];
      v46 = [(STHorizontallySegmentedView *)self bottomAnchor];
      v47 = [v45 constraintEqualToAnchor:v46];
      [v17 addObject:v47];

      id v19 = [v67 trailingAnchor];
      v29 = [(STHorizontallySegmentedView *)self trailingAnchor];
      v42 = [v19 constraintEqualToAnchor:v29];
      [v17 addObject:v42];
    }

    id v48 = v18;
    id v49 = v17;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v50 = v48;
    v51 = 0;
    uint64_t v52 = [v50 countByEnumeratingWithState:&v86 objects:v90 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v87;
      do
      {
        uint64_t v54 = 0;
        v55 = v51;
        do
        {
          if (*(void *)v87 != v53) {
            objc_enumerationMutation(v50);
          }
          v51 = *(void **)(*((void *)&v86 + 1) + 8 * v54);
          v56 = [v51 widthAnchor];
          v57 = [v56 constraintGreaterThanOrEqualToConstant:8.0];
          [v49 addObject:v57];

          if (v55)
          {
            v58 = [v55 widthAnchor];
            v59 = [v51 widthAnchor];
            v60 = [v58 constraintEqualToAnchor:v59];
            [v49 addObject:v60];

            id v61 = v51;
          }
          else
          {
            id v62 = v51;
          }
          ++v54;
          v55 = v51;
        }
        while (v52 != v54);
        uint64_t v52 = [v50 countByEnumeratingWithState:&v86 objects:v90 count:16];
      }
      while (v52);
    }

    v63 = (void *)MEMORY[0x263F08938];
    v64 = [(STHorizontallySegmentedView *)self segmentConstraints];
    [v63 deactivateConstraints:v64];

    [MEMORY[0x263F08938] activateConstraints:v49];
    [(STHorizontallySegmentedView *)self setSegmentConstraints:v49];
    v65 = [NSNumber numberWithUnsignedInteger:v83[3]];
    [(STHorizontallySegmentedView *)self setNumberOfLines:v65];

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(&v82, 8);

    v2 = v68;
  }
}

void __48__STHorizontallySegmentedView__setUpConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3 - 1;
  id v7 = v5;
  BOOL v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
  objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  double v10 = v9;
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24)
                                                              - (v9
                                                               + 8.0);
  objc_msgSend(v7, "sizeThatFits:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= v11)
  {
    v42 = [v8 widthAnchor];
    v43 = [v42 constraintEqualToConstant:v10];

    LODWORD(v44) = 1144750080;
    [v43 setPriority:v44];
    [*(id *)(a1 + 40) addObject:v43];
    uint64_t v45 = a1;
    v46 = objc_opt_new();
    [*(id *)(v45 + 48) addLayoutGuide:v46];
    [*(id *)(v45 + 56) addObject:v46];
    v47 = *(void **)(v45 + 40);
    id v48 = [v46 topAnchor];
    id v49 = [v8 topAnchor];
    id v50 = [v48 constraintEqualToAnchor:v49];
    [v47 addObject:v50];

    v51 = *(void **)(v45 + 40);
    uint64_t v52 = [v46 leadingAnchor];
    uint64_t v53 = [v8 trailingAnchor];
    uint64_t v54 = [v52 constraintEqualToAnchor:v53];
    [v51 addObject:v54];

    v55 = *(void **)(v45 + 40);
    v56 = [v46 bottomAnchor];
    v57 = [v8 bottomAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [v55 addObject:v58];

    v59 = *(void **)(v45 + 40);
    v60 = [v7 topAnchor];
    id v61 = [v46 topAnchor];
    id v62 = [v60 constraintEqualToAnchor:v61];
    [v59 addObject:v62];

    v63 = *(void **)(v45 + 40);
    v64 = [v7 leadingAnchor];
    v65 = [v46 trailingAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    [v63 addObject:v66];

    v67 = *(void **)(v45 + 40);
    [v7 bottomAnchor];
    v69 = v68 = v8;
    v70 = [v46 bottomAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    [v67 addObject:v71];
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    id v12 = *(void **)(a1 + 40);
    [v7 topAnchor];
    v14 = uint64_t v13 = a1;
    uint64_t v15 = [v8 bottomAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 constant:2.0];
    [v12 addObject:v16];

    id v17 = *(void **)(v13 + 40);
    id v75 = v7;
    id v18 = [v7 leadingAnchor];
    id v19 = [*(id *)(v13 + 48) leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v17 addObject:v20];

    unint64_t v21 = *(void **)(v13 + 40);
    v74 = v8;
    BOOL v22 = [v8 trailingAnchor];
    BOOL v23 = [*(id *)(v13 + 48) trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v21 addObject:v24];

    v25 = *(void **)(v13 + 56);
    uint64_t v73 = v13;
    v26 = *(void **)(v13 + 40);
    id v27 = v25;
    id v28 = v26;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v29 = [v27 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      v31 = 0;
      uint64_t v32 = *(void *)v77;
      do
      {
        uint64_t v33 = 0;
        v34 = v31;
        do
        {
          if (*(void *)v77 != v32) {
            objc_enumerationMutation(v27);
          }
          v31 = *(void **)(*((void *)&v76 + 1) + 8 * v33);
          v35 = [v31 widthAnchor];
          v36 = [v35 constraintGreaterThanOrEqualToConstant:8.0];
          [v28 addObject:v36];

          if (v34)
          {
            v37 = [v34 widthAnchor];
            v38 = [v31 widthAnchor];
            v39 = [v37 constraintEqualToAnchor:v38];
            [v28 addObject:v39];

            id v40 = v31;
          }
          else
          {
            id v41 = v31;
          }
          ++v33;
          v34 = v31;
        }
        while (v30 != v33);
        uint64_t v30 = [v27 countByEnumeratingWithState:&v76 objects:v80 count:16];
      }
      while (v30);
    }
    else
    {
      v31 = 0;
    }

    [*(id *)(v73 + 56) removeAllObjects];
    if (*(void *)(*(void *)(*(void *)(v73 + 72) + 8) + 24) == *(void *)(v73 + 96)) {
      uint64_t v72 = 0x7FEFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v72 = *(void *)(v73 + 104);
    }
    v68 = v74;
    id v7 = v75;
    *(void *)(*(void *)(*(void *)(v73 + 64) + 8) + 24) = v72;
  }
}

- (NSArray)segmentItems
{
  return self->_segmentItems;
}

- (NSNumber)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(id)a3
{
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)truncateLabels
{
  return self->_truncateLabels;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousdouble Width = a3;
}

- (NSMutableArray)segmentViews
{
  return self->_segmentViews;
}

- (NSArray)segmentConstraints
{
  return self->_segmentConstraints;
}

- (void)setSegmentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentConstraints, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_numberOfLines, 0);

  objc_storeStrong((id *)&self->_segmentItems, 0);
}

@end