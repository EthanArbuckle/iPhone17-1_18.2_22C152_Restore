@interface _TVLockupFactory
+ (TVCellMetrics)cellMetricsForCollectionElement:(SEL)a3;
+ (UIEdgeInsets)_customCellPaddingForCellMetrics:(TVCellMetrics *)a3 withCollectionCellMetrics:(TVCellMetrics *)a4 contentAlignment:(int64_t)a5;
+ (id)_configurationIdentifierForElement:(id)a3;
+ (void)_configureCell:(id)a3 layout:(id)a4 element:(id)a5;
+ (void)_configureStackingPoster:(id)a3 layout:(id)a4 element:(id)a5 forMetrics:(BOOL)a6;
+ (void)updateViewLayoutForCell:(id)a3 forSize:(CGSize)a4;
- (_TVLockupFactory)init;
- (void)_registerLockup;
@end

@implementation _TVLockupFactory

- (_TVLockupFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVLockupFactory;
  v2 = [(_TVLockupFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_TVLockupFactory *)v2 _registerLockup];
  }
  return v3;
}

- (void)_registerLockup
{
  id v2 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v2 _registerViewCreatorEx:&__block_literal_global_45 withType:24];
}

+ (TVCellMetrics)cellMetricsForCollectionElement:(SEL)a3
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v77 = a4;
  v76 = [v77 objectForKeyedSubscript:@"TVFactoryKeyCellMetrics"];
  if ([v77 updateType] || !v76)
  {
    unsigned int v74 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
    [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
    objc_super v5 = [v77 style];
    unint64_t v6 = objc_msgSend(v5, "tv_contentAlignment");
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }

    uint64_t v155 = 0;
    v156 = (CGSize *)&v155;
    uint64_t v157 = 0x3010000000;
    v158 = &unk_230C43B61;
    long long v159 = *MEMORY[0x263F001B0];
    uint64_t v149 = 0;
    v150 = &v149;
    uint64_t v151 = 0x4010000000;
    v152 = &unk_230C43B61;
    long long v8 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    long long v153 = *MEMORY[0x263F1D1C0];
    long long v154 = v8;
    uint64_t v143 = 0;
    v144 = &v143;
    uint64_t v145 = 0x4010000000;
    v146 = &unk_230C43B61;
    long long v147 = v153;
    long long v148 = v8;
    uint64_t v137 = 0;
    v138 = &v137;
    uint64_t v139 = 0x4010000000;
    v140 = &unk_230C43B61;
    long long v141 = v153;
    long long v142 = v8;
    uint64_t v131 = 0;
    v132 = &v131;
    uint64_t v133 = 0x4010000000;
    v134 = &unk_230C43B61;
    long long v135 = v153;
    long long v136 = v8;
    v130[0] = MEMORY[0x263EF8330];
    v130[1] = 3221225472;
    v130[2] = __52___TVLockupFactory_cellMetricsForCollectionElement___block_invoke;
    v130[3] = &unk_264BA9098;
    v130[4] = &v155;
    v130[5] = &v149;
    v130[6] = &v143;
    v130[7] = &v137;
    v130[8] = &v131;
    v130[9] = v7;
    v90 = (void *)MEMORY[0x230FC9DC0](v130);
    v9 = [_TVStackingPosterView alloc];
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    v14 = -[_TVStackingPosterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    [(_TVStackingPosterView *)v14 setConfiguresForCollectionViewCell:1];
    -[_TVStackingPosterView setMaxBoundsSize:](v14, "setMaxBoundsSize:", v156[2].width, v156[2].height);
    v89 = v14;
    v78 = -[_TVOrganizerView initWithFrame:]([_TVOrganizerView alloc], "initWithFrame:", v10, v11, v12, v13);
    v88 = [MEMORY[0x263EFF9A0] dictionary];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    v15 = [v77 sections];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v126 objects:v163 count:16];
    if (!v16)
    {
LABEL_15:
      id v80 = 0;
      goto LABEL_17;
    }
    uint64_t v17 = *(void *)v127;
LABEL_9:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v127 != v17) {
        objc_enumerationMutation(v15);
      }
      v19 = *(void **)(*((void *)&v126 + 1) + 8 * v18);
      v20 = [v19 attributes];
      v21 = [v20 objectForKeyedSubscript:@"prominent"];
      int v22 = [v21 BOOLValue];

      if (v22) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v15 countByEnumeratingWithState:&v126 objects:v163 count:16];
        if (!v16) {
          goto LABEL_15;
        }
        goto LABEL_9;
      }
    }
    id v80 = v19;
LABEL_17:

    v23 = [v77 attributes];
    v24 = objc_msgSend(v23, "objectForKeyedSubscript:");
    int v82 = [v24 BOOLValue];

    v87 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id obj = [v77 sections];
    uint64_t v83 = [obj countByEnumeratingWithState:&v122 objects:v162 count:16];
    if (!v83) {
      goto LABEL_78;
    }
    uint64_t v81 = *(void *)v123;
    double v25 = *MEMORY[0x263F001B0];
    double v26 = *(double *)(MEMORY[0x263F001B0] + 8);
LABEL_19:
    uint64_t v84 = 0;
LABEL_20:
    if (*(void *)v123 != v81) {
      objc_enumerationMutation(obj);
    }
    id v85 = *(id *)(*((void *)&v122 + 1) + 8 * v84);
    v27 = [v85 attributes];
    v86 = [v27 objectForKeyedSubscript:@"homogeneous"];

    int v95 = v82;
    if (v86) {
      int v95 = [v86 BOOLValue];
    }
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    CGSize cellSize = (CGSize)0;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v28 = [v85 prototypes];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v109 objects:v161 count:16];
    if (!v29) {
      goto LABEL_76;
    }
    uint64_t v94 = *(void *)v110;
    if (v80) {
      BOOL v30 = v85 == v80;
    }
    else {
      BOOL v30 = 1;
    }
    int v31 = v30;
    int v93 = v31;
    id v91 = v28;
LABEL_32:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v110 != v94) {
        objc_enumerationMutation(v91);
      }
      v33 = *(void **)(*((void *)&v109 + 1) + 8 * v32);
      v34 = [v33 objectForKeyedSubscript:@"TVFactoryKeyCellMetrics"];
      if ([v33 updateType] || v34 == 0) {
        break;
      }
      objc_msgSend(v34, "tv_cellMetricsValue");
      long long v119 = v106;
      long long v120 = v107;
      long long v121 = v108;
      long long v115 = v102;
      long long v116 = v103;
      long long v117 = v104;
      long long v118 = v105;
      CGSize cellSize = v100;
      long long v114 = v101;
LABEL_62:
      if (v93)
      {
        v57 = (void (*)(void *, CGSize *))v90[2];
        long long v106 = v119;
        long long v107 = v120;
        long long v108 = v121;
        long long v102 = v115;
        long long v103 = v116;
        long long v104 = v117;
        long long v105 = v118;
        CGSize v100 = cellSize;
        long long v101 = v114;
        v57(v90, &v100);
      }
      if (v95)
      {
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        v58 = [v85 prototypes];
        uint64_t v59 = [v58 countByEnumeratingWithState:&v96 objects:v160 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v97 != v60) {
                objc_enumerationMutation(v58);
              }
              v62 = *(void **)(*((void *)&v96 + 1) + 8 * i);
              long long v106 = v119;
              long long v107 = v120;
              long long v108 = v121;
              long long v102 = v115;
              long long v103 = v116;
              long long v104 = v117;
              long long v105 = v118;
              CGSize v100 = cellSize;
              long long v101 = v114;
              v63 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithCellMetrics:", &v100);
              [v62 setObject:v63 forKeyedSubscript:@"TVFactoryKeyCellMetrics"];
            }
            uint64_t v59 = [v58 countByEnumeratingWithState:&v96 objects:v160 count:16];
          }
          while (v59);
        }

        v28 = v91;
        goto LABEL_76;
      }

      if (v29 == ++v32)
      {
        v28 = v91;
        uint64_t v29 = [v91 countByEnumeratingWithState:&v109 objects:v161 count:16];
        if (v29) {
          goto LABEL_32;
        }
LABEL_76:

        if (++v84 == v83)
        {
          uint64_t v83 = [obj countByEnumeratingWithState:&v122 objects:v162 count:16];
          if (!v83)
          {
LABEL_78:

            [MEMORY[0x263F1CB60] setAnimationsEnabled:v74];
            retstr->CGSize cellSize = v156[2];
            long long v64 = *((_OWORD *)v150 + 3);
            *(_OWORD *)&retstr->cellPadding.top = *((_OWORD *)v150 + 2);
            *(_OWORD *)&retstr->cellPadding.bottom = v64;
            long long v65 = *((_OWORD *)v144 + 3);
            *(_OWORD *)&retstr->cellInset.top = *((_OWORD *)v144 + 2);
            *(_OWORD *)&retstr->cellInset.bottom = v65;
            long long v66 = *((_OWORD *)v138 + 3);
            *(_OWORD *)&retstr->cellInsetAlt.top = *((_OWORD *)v138 + 2);
            *(_OWORD *)&retstr->cellInsetAlt.bottom = v66;
            long long v67 = *((_OWORD *)v132 + 3);
            *(_OWORD *)&retstr->cellMargin.top = *((_OWORD *)v132 + 2);
            *(_OWORD *)&retstr->cellMargin.bottom = v67;
            long long v68 = *(_OWORD *)&retstr->cellMargin.top;
            long long v119 = *(_OWORD *)&retstr->cellInsetAlt.bottom;
            long long v120 = v68;
            long long v121 = *(_OWORD *)&retstr->cellMargin.bottom;
            long long v69 = *(_OWORD *)&retstr->cellInset.top;
            long long v115 = *(_OWORD *)&retstr->cellPadding.bottom;
            long long v116 = v69;
            long long v70 = *(_OWORD *)&retstr->cellInsetAlt.top;
            long long v117 = *(_OWORD *)&retstr->cellInset.bottom;
            long long v118 = v70;
            long long v71 = *(_OWORD *)&retstr->cellPadding.top;
            CGSize cellSize = retstr->cellSize;
            long long v114 = v71;
            v72 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithCellMetrics:", &cellSize);
            [v77 setObject:v72 forKeyedSubscript:@"TVFactoryKeyCellMetrics"];

            _Block_object_dispose(&v131, 8);
            _Block_object_dispose(&v137, 8);
            _Block_object_dispose(&v143, 8);
            _Block_object_dispose(&v149, 8);
            _Block_object_dispose(&v155, 8);
            v4 = v76;
            goto LABEL_79;
          }
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    if (objc_msgSend(v33, "tv_elementType") == 24)
    {
      v36 = [a2 _configurationIdentifierForElement:v33];
      if (v36
        && ([v87 objectForKeyedSubscript:v36],
            v37 = objc_claimAutoreleasedReturnValue(),
            (v38 = v37) != 0))
      {
        objc_msgSend(v37, "tv_cellMetricsValue");
        long long v119 = v106;
        long long v120 = v107;
        long long v121 = v108;
        long long v115 = v102;
        long long v116 = v103;
        long long v117 = v104;
        long long v118 = v105;
        CGSize cellSize = v100;
        long long v114 = v101;
      }
      else
      {
        +[TVViewLayout layoutClassForElement:v33];
        v38 = objc_opt_new();
        [v38 setAcceptsFocus:1];
        [a2 _configureStackingPoster:v89 layout:v38 element:v33 forMetrics:1];
        if (v89)
        {
          [(_TVStackingPosterView *)v89 cellMetrics];
        }
        else
        {
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          CGSize v100 = (CGSize)0;
        }
        long long v119 = v106;
        long long v120 = v107;
        long long v121 = v108;
        long long v115 = v102;
        long long v116 = v103;
        long long v117 = v104;
        long long v118 = v105;
        CGSize cellSize = v100;
        long long v114 = v101;
        if (v36)
        {
          long long v106 = v119;
          long long v107 = v120;
          long long v108 = v121;
          long long v102 = v115;
          long long v103 = v116;
          long long v104 = v117;
          long long v105 = v118;
          CGSize v100 = cellSize;
          long long v101 = v114;
          v51 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithCellMetrics:", &v100);
          [v87 setObject:v51 forKeyedSubscript:v36];
        }
      }

      goto LABEL_61;
    }
    v39 = [v33 style];
    if (objc_msgSend(v39, "tv_hasHeight"))
    {
      v40 = [v33 style];
      int v41 = objc_msgSend(v40, "tv_hasWidth");

      if (v41)
      {
        v42 = [v33 style];
        objc_msgSend(v42, "tv_width");
        CGFloat v44 = v43;
        v45 = [v33 style];
        objc_msgSend(v45, "tv_height");
        CGFloat v47 = v46;
LABEL_60:

        cellSize.width = v44;
        cellSize.height = v47;
        [v33 isDisabled];
LABEL_61:
        [a2 _validateCellMetrics:&cellSize];
        long long v106 = v119;
        long long v107 = v120;
        long long v108 = v121;
        long long v102 = v115;
        long long v103 = v116;
        long long v104 = v117;
        long long v105 = v118;
        CGSize v100 = cellSize;
        long long v101 = v114;
        v56 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithCellMetrics:", &v100);
        [v33 setObject:v56 forKeyedSubscript:@"TVFactoryKeyCellMetrics"];

        goto LABEL_62;
      }
    }
    else
    {
    }
    v42 = [v33 elementName];
    v45 = [v88 objectForKeyedSubscript:v42];
    if (!v45)
    {
      v48 = +[TVInterfaceFactory sharedInterfaceFactory];
      v49 = (objc_class *)[v48 _extendedCollectionViewCellClassForIKElement:v33];

      if (v49) {
        v50 = (_TVOrganizerView *)objc_alloc_init(v49);
      }
      else {
        v50 = v78;
      }
      v45 = v50;
      [v88 setObject:v50 forKeyedSubscript:v42];
    }
    v52 = +[TVInterfaceFactory sharedInterfaceFactory];
    v53 = [v52 _viewFromElement:v33 existingView:v45];

    objc_msgSend(v53, "tv_sizeThatFits:", v25, v26);
    CGFloat v44 = v54;
    CGFloat v47 = v55;

    goto LABEL_60;
  }
  v4 = v76;
  objc_msgSend(v76, "tv_cellMetricsValue");
LABEL_79:

  return result;
}

+ (void)updateViewLayoutForCell:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v8 = [v7 contentView];
  v9 = [v8 subviews];
  double v10 = [v9 firstObject];

  unint64_t v11 = objc_msgSend(v7, "tv_contentAlignment");
  if (v11 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v37 = v12;
    v39 = v8;
    v40 = v7;
    v38 = v10;
    id v13 = v10;
    objc_msgSend(v13, "setMaxBoundsSize:", width, height);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v36 = v13;
    v14 = [v13 components];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v57 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = objc_msgSend(v19, "tv_associatedIKViewElement");
            [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"TVForceUpdate"];
            v21 = +[TVInterfaceFactory sharedInterfaceFactory];
            int v22 = [v21 _viewFromElement:v20 existingView:v19];

            if (v22 != v19)
            {
              v23 = TVMLKitLogObject;
              if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v19;
                _os_log_impl(&dword_230B4C000, v23, OS_LOG_TYPE_DEFAULT, "Dropping layout update for label: %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v57 count:16];
      }
      while (v16);
    }

    [v36 setNeedsUpdateComponentLayout];
    id v7 = v40;
    objc_msgSend(v40, "tv_padding");
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    if (v36) {
      [v36 cellMetrics];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    long long v8 = v39;
    *(double *)&long long buf = width;
    *((double *)&buf + 1) = height;
    uint64_t v47 = v25;
    uint64_t v48 = v27;
    uint64_t v49 = v29;
    uint64_t v50 = v31;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    [a1 _customCellPaddingForCellMetrics:v41 withCollectionCellMetrics:&buf contentAlignment:v37];
    objc_msgSend(v36, "setFrame:", v35, v34, width - (v35 + v32), height - (v34 + v33));

    double v10 = v38;
  }
}

+ (UIEdgeInsets)_customCellPaddingForCellMetrics:(TVCellMetrics *)a3 withCollectionCellMetrics:(TVCellMetrics *)a4 contentAlignment:(int64_t)a5
{
  double height = a3->cellSize.height;
  double top = a3->cellPadding.top;
  double left = a3->cellPadding.left;
  double bottom = a3->cellPadding.bottom;
  double v9 = height - (top + bottom);
  double v10 = a4->cellSize.height;
  double v11 = a4->cellPadding.top;
  double v12 = v10 - (v11 + a4->cellPadding.bottom);
  double right = a3->cellPadding.right;
  double v14 = v11 - top;
  if (a5 == 3)
  {
    double v15 = v12 - v9;
  }
  else
  {
    if (a5 != 2) {
      goto LABEL_6;
    }
    double v15 = floor((v12 - v9) * 0.5);
  }
  double v14 = v14 + v15;
LABEL_6:
  if (v14 <= 0.0) {
    double v14 = -0.0;
  }
  double v16 = top + v14;
  double v17 = height + v14;
  if (v17 >= v10) {
    double v18 = -0.0;
  }
  else {
    double v18 = v10 - v17;
  }
  double v19 = bottom + v18;
  result.double right = right;
  result.double bottom = v19;
  result.double left = left;
  result.double top = v16;
  return result;
}

+ (void)_configureCell:(id)a3 layout:(id)a4 element:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  double v11 = [(objc_class *)+[TVViewLayout layoutClassForElement:v9] layoutWithLayout:v10 element:v9];

  double v12 = [v8 contentView];
  id v13 = [v12 subviews];
  double v14 = [v13 firstObject];

  unint64_t v15 = [v11 contentAlignment];
  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  if (objc_msgSend(v9, "tv_elementType") == 24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v17 = v14;
    }
    else
    {
      double v18 = [_TVStackingPosterView alloc];
      double v17 = -[_TVStackingPosterView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    }
    double v19 = v17;
    [(_TVStackingPosterView *)v17 setSelected:0 animated:0 focusUpdateContext:0 withAnimationCoordinator:0];
    [(_TVStackingPosterView *)v19 setConfiguresForCollectionViewCell:1];
    [v8 bounds];
    -[_TVStackingPosterView setMaxBoundsSize:](v19, "setMaxBoundsSize:", v20, v21);
    int v22 = objc_opt_new();
    [v22 setAcceptsFocus:1];
    objc_msgSend(v22, "setCenterGrowth:", objc_msgSend(v11, "centerGrowth"));
    [a1 _configureStackingPoster:v19 layout:v22 element:v9 forMetrics:0];
    [v8 bounds];
    double v24 = v23;
    double v26 = v25;
    [v8 bounds];
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    [v11 padding];
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    if (v19) {
      [(_TVStackingPosterView *)v19 cellMetrics];
    }
    else {
      memset(v56, 0, sizeof(v56));
    }
    v49[0] = v28;
    v49[1] = v30;
    v49[2] = v32;
    v49[3] = v34;
    v49[4] = v36;
    v49[5] = v38;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    [a1 _customCellPaddingForCellMetrics:v56 withCollectionCellMetrics:v49 contentAlignment:v16];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    objc_msgSend(v11, "setPadding:");
    -[_TVStackingPosterView setFrame:](v19, "setFrame:", v42, v40, v24 - (v42 + v46), v26 - (v40 + v44));
    -[_TVStackingPosterView setSelected:animated:focusUpdateContext:withAnimationCoordinator:](v19, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", [v8 isFocused], 0, 0, 0);

    if (v19 != v14)
    {
      uint64_t v47 = [v12 subviews];
      [v47 makeObjectsPerformSelector:sel_removeFromSuperview];

      [v12 addSubview:v19];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v11 acceptsFocus]) {
      uint64_t v48 = [v9 isDisabled] ^ 1;
    }
    else {
      uint64_t v48 = 0;
    }
    [v8 setAllowsFocus:v48];
  }
  objc_msgSend(v8, "tv_setLayout:", v11);
}

+ (void)_configureStackingPoster:(id)a3 layout:(id)a4 element:(id)a5 forMetrics:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v56 = a3;
  id v9 = a5;
  id v10 = a4;
  long long v53 = v9;
  long long v51 = [(objc_class *)+[TVViewLayout layoutClassForElement:v9] layoutWithLayout:v10 element:v9];

  double v11 = [v9 appDocument];
  long long v50 = [v11 templateElement];

  double v12 = [v9 parent];
  uint64_t v13 = objc_msgSend(v12, "tv_elementType");

  BOOL v15 = objc_msgSend(v50, "tv_elementType") == 72 && v13 != 35;
  uint64_t v16 = (void *)MEMORY[0x263EFF980];
  double v17 = [v9 children];
  long long v54 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  double v18 = [v9 children];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v96 count:16];
  if (v19)
  {
    id v55 = 0;
    uint64_t v20 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v92 != v20) {
          objc_enumerationMutation(v18);
        }
        int v22 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(v22, "tv_elementType");
        if ((!v15 || v23 != 16 && v23 != 35 && v23 != 81) && (!v6 || v23 != 35))
        {
          if (v23 == 35)
          {
            if (!v55) {
              id v55 = v22;
            }
          }
          else if (v23 != 43 && (v23 != 16 || objc_msgSend(v22, "tv_imageType") != 1))
          {
            double v24 = [NSNumber numberWithBool:v6];
            [v22 setObject:v24 forKeyedSubscript:@"TVConfigureForMetrics"];

            [v54 addObject:v22];
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v96 count:16];
    }
    while (v19);
  }
  else
  {
    id v55 = 0;
  }

  double v25 = [v56 overlayView];
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke;
  v89[3] = &unk_264BA90C0;
  id v52 = v56;
  id v90 = v52;
  v57 = (void *)MEMORY[0x230FC9DC0](v89);
  double v26 = (void *)MEMORY[0x263EFF980];
  uint64_t v27 = [v52 components];
  uint64_t v28 = objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v29 = [v52 components];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v86 != v31) {
          objc_enumerationMutation(v29);
        }
        id v33 = *(id *)(*((void *)&v85 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v34 = [v33 overlayView];
          BOOL v35 = v34 == 0;

          if (!v35)
          {
            uint64_t v36 = [v33 overlayView];

            v83[0] = MEMORY[0x263EF8330];
            v83[1] = 3221225472;
            v83[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_2;
            v83[3] = &unk_264BA90C0;
            id v84 = v33;
            uint64_t v37 = MEMORY[0x230FC9DC0](v83);

            v57 = (void *)v37;
            double v25 = (void *)v36;
          }
        }
        if (objc_msgSend(v33, "tv_elementType")) {
          [v28 addObject:v33];
        }
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v95 count:16];
    }
    while (v30);
  }

  uint64_t v79 = 0;
  id v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 0;
  if (!v15)
  {
    uint64_t v38 = [v28 count];
    if (v38 == [v54 count])
    {
      *((unsigned char *)v80 + 24) = 1;
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_3;
      v76[3] = &unk_264BA69F0;
      id v77 = v54;
      v78 = &v79;
      [v28 enumerateObjectsUsingBlock:v76];
    }
  }
  double v39 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  if ([v51 acceptsFocus]) {
    char v40 = [v53 isDisabled] ^ 1;
  }
  else {
    char v40 = 0;
  }
  uint64_t v70 = 0;
  long long v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__10;
  unsigned int v74 = __Block_byref_object_dispose__10;
  id v75 = 0;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 1;
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_23;
  v58[3] = &unk_264BA90E8;
  v62 = &v79;
  id v41 = v28;
  id v59 = v41;
  char v65 = v40;
  id v42 = v53;
  id v60 = v42;
  v63 = &v70;
  long long v64 = &v66;
  id v43 = v39;
  id v61 = v43;
  [v54 enumerateObjectsUsingBlock:v58];
  double v44 = (void (**)(void *, void))v57;
  if (v55)
  {
    double v45 = +[TVInterfaceFactory sharedInterfaceFactory];
    double v46 = [v45 _viewFromElement:v55 existingView:v25];

    double v44 = (void (**)(void *, void))v57;
    if (!v46)
    {
      uint64_t v47 = [v55 children];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v48 = v25;
      }
      else {
        uint64_t v48 = 0;
      }
      double v46 = +[TVMLViewFactory organizerViewWithElements:v47 existingView:v48];

      [v46 transferLayoutStylesFromElement:v55];
      double v44 = (void (**)(void *, void))v57;
      objc_msgSend(v46, "tv_setAssociatedIKViewElement:", v55);
    }
  }
  else
  {
    double v46 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44[2](v44, v71[5]);
    uint64_t v49 = (void *)v71[5];
  }
  else
  {
    ((void (**)(void *, id))v44)[2](v44, v52);
    uint64_t v49 = v52;
  }
  [v49 setOverlayView:v46];
  if (*((unsigned char *)v67 + 24)) {
    [v52 setNeedsUpdateComponentLayout];
  }
  else {
    [v52 setComponents:v43];
  }
  objc_msgSend(v52, "tv_setLayout:", v51);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v79, 8);
}

+ (id)_configurationIdentifierForElement:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_4;
  v42[3] = &unk_264BA9170;
  id v44 = &__block_literal_global_28;
  id v4 = v3;
  id v43 = v4;
  id v45 = &__block_literal_global_33_1;
  uint64_t v32 = (void (**)(void, void))MEMORY[0x230FC9DC0](v42);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_5;
  v37[3] = &unk_264BA9198;
  id v39 = &__block_literal_global_28;
  id v5 = v4;
  id v38 = v5;
  id v40 = &__block_literal_global_39_0;
  id v41 = &__block_literal_global_33_1;
  BOOL v6 = (void (**)(void, void))MEMORY[0x230FC9DC0](v37);
  id v7 = [MEMORY[0x263F089D8] string];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v5 children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v13, "tv_elementType") != 35 && objc_msgSend(v13, "tv_elementType") != 4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = ((void (**)(void, void *))v32)[2](v32, v13);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_19;
            }
            uint64_t v14 = ((void (**)(void, void *))v6)[2](v6, v13);
          }
          BOOL v15 = (void *)v14;
          if (!v14)
          {
LABEL_19:
            uint64_t v30 = 0;
            uint64_t v16 = v5;
            goto LABEL_20;
          }
          if ([v7 length]) {
            [v7 appendString:@" "];
          }
          [v7 appendString:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v8 = [MEMORY[0x263F089D8] string];
  [v8 appendString:@"{"];
  uint64_t v16 = v5;
  double v17 = [v5 style];
  objc_msgSend(v17, "tv_padding");
  objc_msgSend(NSString, "stringWithFormat:", @"%@:%.0f %.0f %.0f %.0f;",
    @"padding",
    v18,
    v21,
    v20,
  int v22 = v19);
  [v8 appendString:v22];

  uint64_t v23 = [v5 style];
  objc_msgSend(v23, "tv_width");
  double v25 = [NSString stringWithFormat:@"%@:%.0f;", @"width", v24];
  [v8 appendString:v25];

  double v26 = [v5 style];
  objc_msgSend(v26, "tv_height");
  uint64_t v28 = [NSString stringWithFormat:@"%@:%.0f;", @"height", v27];
  [v8 appendString:v28];

  [v8 appendString:@"}["];
  uint64_t v29 = (void *)[v7 copy];
  [v8 appendString:v29];

  [v8 appendString:@"]"];
  uint64_t v30 = (void *)[v8 copy];
LABEL_20:

  return v30;
}

@end