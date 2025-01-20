@interface SXDataTableView
- (CGPoint)originOffset;
- (id)dataSource;
- (id)initWithDataSource:(id *)a1;
- (id)setDataSource:(id *)result;
- (id)viewForColumnAtIndex:(uint64_t)a1;
- (id)viewForRowAtIndex:(uint64_t)a1;
- (uint64_t)blueprint;
- (uint64_t)indexPathForPoint:(CGFloat)a3;
- (uint64_t)reset;
- (void)draw:(uint64_t)a3 forIndexPath:(uint64_t)a4;
- (void)layoutCellsForBlueprint:(id *)a1;
- (void)prepareDrawingForBlueprint:(id *)a1;
- (void)setBlueprint:(id *)a1;
@end

@implementation SXDataTableView

- (id)initWithDataSource:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SXDataTableView;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 52, v3);
    }
  }

  return a1;
}

- (void)setBlueprint:(id *)a1
{
  id v7 = a2;
  if (a1)
  {
    -[SXDataTableView reset]((uint64_t)a1);
    [v7 tableSize];
    double v5 = v4;
    [v7 tableSize];
    objc_msgSend(a1, "setFrame:", 0.0, 0.0, v5, v6);
    -[SXDataTableView layoutCellsForBlueprint:](a1, v7);
    -[SXDataTableView prepareDrawingForBlueprint:](a1, v7);
    objc_storeStrong(a1 + 54, a2);
  }
}

- (uint64_t)reset
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 440) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_89];
    [*(id *)(v1 + 448) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2_0];
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    id v3 = *(void **)(v1 + 440);
    *(void *)(v1 + 440) = v2;

    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = *(void *)(v1 + 448);
    *(void *)(v1 + 448) = v4;
    return MEMORY[0x270F9A758](v4, v5);
  }
  return result;
}

- (void)layoutCellsForBlueprint:(id *)a1
{
  id v52 = a2;
  if (a1 && [v52 numberOfRows])
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = -[SXDataTableView viewForRowAtIndex:]((uint64_t)a1, v3);
      uint64_t v5 = v52;
      if (v4)
      {
        [v52 rectForRowAtIndex:v3];
        objc_msgSend(v4, "setFrame:");
        [a1 addSubview:v4];
        uint64_t v5 = v52;
      }
      if (objc_msgSend(v5, "numberOfColumns", v4)) {
        break;
      }
LABEL_26:

      if (++v3 >= (unint64_t)[v52 numberOfRows]) {
        goto LABEL_27;
      }
    }
    uint64_t v6 = 0;
    if (v49) {
      id v7 = (id *)v49;
    }
    else {
      id v7 = a1;
    }
    while (1)
    {
      v8 = v7;
      v9 = -[SXDataTableView viewForColumnAtIndex:]((uint64_t)a1, v6);
      if (v9)
      {
        [v52 rectForColumnAtIndex:v6];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        id v18 = v9;

        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
        [a1 addSubview:v18];
        v19 = v52;
        v8 = (id *)v18;
      }
      else
      {
        v19 = v52;
      }
      objc_msgSend(v19, "cellRectForIndexPath:", v3, v6);
      CGFloat v51 = v20;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      objc_msgSend(v52, "cellContentRectForIndexPath:", v3, v6);
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      id WeakRetained = objc_loadWeakRetained(a1 + 52);
      v36 = objc_msgSend(WeakRetained, "dataTableView:viewForCellAtIndexPath:constraintToSize:", a1, v3, v6, v32, v34);

      id v37 = objc_loadWeakRetained(a1 + 53);
      uint64_t v38 = objc_msgSend(v37, "verticalAlignmentForCellAtIndexPath:", v3, v6);

      [v36 frame];
      double v40 = v39;
      [v36 frame];
      CGFloat rect = v41;
      if ((v38 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        if (v38 != 3) {
          goto LABEL_18;
        }
        [v36 frame];
        double Height = CGRectGetHeight(v54);
      }
      else
      {
        double v34 = v34 * 0.5;
        [v36 frame];
        double Height = CGRectGetHeight(v55) * 0.5;
      }
      double v30 = v30 + v34 - Height;
LABEL_18:
      id v43 = objc_loadWeakRetained(a1 + 53);
      unint64_t v44 = objc_msgSend(v43, "horizontalAlignmentForCellAtIndexPath:", v3, v6);

      if (v44 <= 1) {
        uint64_t v45 = 1;
      }
      else {
        uint64_t v45 = v44;
      }
      double v46 = v32 - v40;
      if (v45 == 3) {
        goto LABEL_24;
      }
      if (v45 == 2)
      {
        double v46 = v46 * 0.5;
LABEL_24:
        double v28 = v28 + v46;
      }
      v56.origin.x = v51;
      v56.origin.y = v22;
      v56.size.width = v24;
      v56.size.height = v26;
      CGFloat MinX = CGRectGetMinX(v56);
      v57.origin.x = v51;
      v57.origin.y = v22;
      v57.size.width = v24;
      v57.size.height = v26;
      CGFloat MinY = CGRectGetMinY(v57);
      v58.origin.x = v28;
      v58.origin.y = v30;
      v58.size.width = v40;
      v58.size.height = rect;
      CGRect v59 = CGRectOffset(v58, MinX, MinY);
      objc_msgSend(v36, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
      [v8 addSubview:v36];

      if (++v6 >= (unint64_t)[v52 numberOfColumns]) {
        goto LABEL_26;
      }
    }
  }
LABEL_27:
}

- (void)prepareDrawingForBlueprint:(id *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ([v3 numberOfRows])
    {
      unint64_t v5 = 0;
      CGFloat v86 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v87 = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat v84 = *MEMORY[0x263F001A8];
      CGFloat v85 = *(double *)(MEMORY[0x263F001A8] + 24);
      v81 = v4;
      do
      {
        if ([v4 numberOfColumns])
        {
          unint64_t v6 = 0;
          do
          {
            objc_msgSend(v4, "cellRectForIndexPath:", v5, v6);
            CGFloat v8 = v7;
            double v98 = v9;
            double v99 = v7;
            CGFloat v10 = v9;
            double v12 = v11;
            double v14 = v13;
            objc_msgSend(v4, "cellContentRectForIndexPath:", v5, v6);
            CGFloat v95 = v16;
            CGFloat v97 = v15;
            CGFloat v91 = v18;
            CGFloat rect1a = v17;
            objc_msgSend(v4, "rectForColumnDividerAtIndexPath:", v5, v6);
            CGFloat v102 = v20;
            CGFloat v103 = v19;
            CGFloat v104 = v21;
            CGFloat rect = v22;
            objc_msgSend(v4, "rectForRowDividerAtIndexPath:", v5, v6);
            CGFloat v24 = v23;
            CGFloat v100 = v25;
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            v174.origin.CGFloat x = v8;
            v174.origin.CGFloat y = v10;
            v174.size.CGFloat width = v12;
            v174.size.CGFloat height = v14;
            CGFloat MinX = CGRectGetMinX(v174);
            v175.origin.CGFloat x = v8;
            v175.origin.CGFloat y = v10;
            v175.size.CGFloat width = v12;
            v175.size.CGFloat height = v14;
            CGFloat MinY = CGRectGetMinY(v175);
            v176.origin.CGFloat y = v95;
            v176.origin.CGFloat x = v97;
            v176.size.CGFloat height = v91;
            v176.size.CGFloat width = rect1a;
            CGRect v177 = CGRectOffset(v176, MinX, MinY);
            CGFloat x = v177.origin.x;
            CGFloat width = v177.size.width;
            CGFloat y = v177.origin.y;
            CGFloat height = v177.size.height;
            v177.origin.CGFloat y = v102;
            v177.origin.CGFloat x = v103;
            v177.size.CGFloat width = v104;
            v177.size.CGFloat height = rect;
            double v92 = v12;
            CGFloat rect1 = v29;
            double v33 = v12 + CGRectGetWidth(v177);
            CGFloat v96 = v27;
            v178.origin.CGFloat x = v24;
            v178.origin.CGFloat y = v100;
            v178.size.CGFloat width = v27;
            v178.size.CGFloat height = v29;
            double v34 = v14 + CGRectGetHeight(v178);
            v35 = -[SXDataTableView dataSource](a1);
            v36 = [v35 backgroundColorForRowAtIndex:v5];

            if (v36)
            {
              v168[0] = MEMORY[0x263EF8330];
              v168[1] = 3221225472;
              v168[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke;
              v168[3] = &unk_264654100;
              double v170 = v99;
              double v171 = v98;
              double v172 = v33;
              double v173 = v34;
              id v169 = v36;
              id v37 = (void *)MEMORY[0x223CA5030](v168);
              [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
            }
            uint64_t v38 = -[SXDataTableView dataSource](a1);
            double v39 = [v38 backgroundColorForColumnAtIndex:v6];

            if (v39)
            {
              v162[0] = MEMORY[0x263EF8330];
              v162[1] = 3221225472;
              v162[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_2;
              v162[3] = &unk_264654100;
              double v164 = v99;
              double v165 = v98;
              double v166 = v33;
              double v167 = v34;
              id v163 = v39;
              double v40 = (void *)MEMORY[0x223CA5030](v162);
              [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
            }
            double v41 = -[SXDataTableView dataSource](a1);
            v42 = objc_msgSend(v41, "backgroundColorForCellAtIndexPath:", v5, v6);

            if (v42)
            {
              id v43 = -[SXDataTableView dataSource](a1);
              objc_msgSend(v43, "paddingForCellAtIndexPath:", v5, v6);
              CGFloat v44 = x;
              double v46 = v45;
              double v48 = v47;
              double v83 = v49;
              double v51 = v50;

              v179.origin.CGFloat x = v44;
              v179.origin.CGFloat y = y;
              v179.size.CGFloat width = width;
              v179.size.CGFloat height = height;
              CGFloat v82 = CGRectGetMinX(v179) - v51;
              v180.origin.CGFloat x = v44;
              v180.origin.CGFloat y = y;
              v180.size.CGFloat width = width;
              v180.size.CGFloat height = height;
              CGFloat v52 = CGRectGetMinY(v180) - v46;
              v181.origin.CGFloat x = v44;
              v181.origin.CGFloat y = y;
              v181.size.CGFloat width = width;
              v181.size.CGFloat height = height;
              double v53 = v48 + v51 + CGRectGetWidth(v181);
              v182.origin.CGFloat x = v44;
              v182.origin.CGFloat y = y;
              v182.size.CGFloat width = width;
              v182.size.CGFloat height = height;
              CGFloat v54 = CGRectGetHeight(v182);
              v156[0] = MEMORY[0x263EF8330];
              v156[1] = 3221225472;
              v156[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_3;
              v156[3] = &unk_264654100;
              CGFloat v158 = v82;
              CGFloat v159 = v52;
              double v160 = v53;
              double v161 = v83 + v46 + v54;
              id v157 = v42;
              CGRect v55 = (void *)MEMORY[0x223CA5030](v156);
              [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
            }
            CGRect v56 = -[SXDataTableView dataSource](a1);
            CGRect v57 = [v56 rowDividerAtIndex:v5];

            uint64_t v58 = [v57 color];
            if (v58)
            {
              CGRect v59 = (void *)v58;
              v183.size.CGFloat width = v96;
              v183.origin.CGFloat x = v24;
              v183.origin.CGFloat y = v100;
              v183.size.CGFloat height = rect1;
              v185.origin.CGFloat x = v84;
              v185.size.CGFloat height = v85;
              v185.size.CGFloat width = v86;
              v185.origin.CGFloat y = v87;
              BOOL v60 = CGRectEqualToRect(v183, v185);

              if (!v60)
              {
                v150[0] = MEMORY[0x263EF8330];
                v150[1] = 3221225472;
                v150[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_4;
                v150[3] = &unk_264654100;
                id v151 = v57;
                CGFloat v152 = v24;
                CGFloat v153 = v100;
                CGFloat v154 = v96;
                CGFloat v155 = rect1;
                v61 = (void *)MEMORY[0x223CA5030](v150);
                [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
              }
            }
            v62 = -[SXDataTableView dataSource](a1);
            v63 = [v62 columnDividerAtIndex:v6];

            uint64_t v64 = [v63 color];
            if (v64)
            {
              v65 = (void *)v64;
              v184.origin.CGFloat y = v102;
              v184.origin.CGFloat x = v103;
              v184.size.CGFloat width = v104;
              v184.size.CGFloat height = rect;
              v186.origin.CGFloat x = v84;
              v186.size.CGFloat height = v85;
              v186.size.CGFloat width = v86;
              v186.origin.CGFloat y = v87;
              BOOL v66 = CGRectEqualToRect(v184, v186);

              if (!v66)
              {
                v144[0] = MEMORY[0x263EF8330];
                v144[1] = 3221225472;
                v144[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_5;
                v144[3] = &unk_264654100;
                id v145 = v63;
                CGFloat v146 = v103;
                CGFloat v147 = v102;
                CGFloat v148 = v104;
                CGFloat v149 = rect;
                v67 = (void *)MEMORY[0x223CA5030](v144);
                [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
              }
            }
            v68 = -[SXDataTableView dataSource](a1);
            v69 = objc_msgSend(v68, "cellBorderForCellAtIndexPath:", v5, v6);

            if (v69)
            {
              v138[0] = MEMORY[0x263EF8330];
              v138[1] = 3221225472;
              v138[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_6;
              v138[3] = &unk_264654100;
              double v140 = v99;
              double v141 = v98;
              double v142 = v92;
              double v143 = v14;
              id v139 = v69;
              v70 = (void *)MEMORY[0x223CA5030](v138);
              [(SXDataTableView *)(uint64_t)a1 draw:v5 forIndexPath:v6];
            }
            ++v6;
            uint64_t v4 = v81;
          }
          while (v6 < [v81 numberOfColumns]);
        }
        ++v5;
      }
      while (v5 < [v4 numberOfRows]);
    }
    v135[0] = 0;
    v135[1] = v135;
    v135[2] = 0x4010000000;
    v135[3] = &unk_222C045A1;
    long long v71 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v136 = *MEMORY[0x263F001A8];
    long long v137 = v71;
    v132[0] = 0;
    v132[1] = v132;
    v132[2] = 0x4010000000;
    v132[3] = &unk_222C045A1;
    long long v133 = v136;
    long long v134 = v71;
    v129[0] = 0;
    v129[1] = v129;
    v129[2] = 0x4010000000;
    v129[3] = &unk_222C045A1;
    long long v130 = v136;
    long long v131 = v71;
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x4010000000;
    v126[3] = &unk_222C045A1;
    long long v127 = v136;
    long long v128 = v71;
    objc_initWeak(&location, a1);
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_7;
    v121[3] = &unk_264654128;
    objc_copyWeak(&v124, &location);
    v123 = v135;
    id v72 = v4;
    id v122 = v72;
    v73 = (void *)MEMORY[0x223CA5030](v121);
    [(SXDataTableView *)(uint64_t)a1 draw:0 forIndexPath:0x7FFFFFFFFFFFFFFFLL];
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_8;
    v117[3] = &unk_264654128;
    objc_copyWeak(&v120, &location);
    v119 = v132;
    id v74 = v72;
    id v118 = v74;
    v75 = (void *)MEMORY[0x223CA5030](v117);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v75, [v74 numberOfRows] - 1, 0x7FFFFFFFFFFFFFFFLL);
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_9;
    v111[3] = &unk_264654150;
    objc_copyWeak(&v116, &location);
    v113 = v126;
    id v76 = v74;
    id v112 = v76;
    v114 = v135;
    v115 = v132;
    v77 = (void *)MEMORY[0x223CA5030](v111);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v77, 0x7FFFFFFFFFFFFFFFLL, [v76 numberOfColumns] - 1);
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_10;
    v105[3] = &unk_264654178;
    objc_copyWeak(&v110, &location);
    v107 = v129;
    v108 = v135;
    id v106 = v76;
    v109 = v132;
    v78 = (void *)MEMORY[0x223CA5030](v105);
    [(SXDataTableView *)(uint64_t)a1 draw:0x7FFFFFFFFFFFFFFFLL forIndexPath:0];
    id v79 = a1[56];
    [v79 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9_1];

    id v80 = a1[55];
    [v80 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_11];

    [a1 setNeedsDisplay];
    objc_destroyWeak(&v110);

    objc_destroyWeak(&v116);
    objc_destroyWeak(&v120);

    objc_destroyWeak(&v124);
    objc_destroyWeak(&location);
    _Block_object_dispose(v126, 8);
    _Block_object_dispose(v129, 8);
    _Block_object_dispose(v132, 8);
    _Block_object_dispose(v135, 8);
  }
}

void __24__SXDataTableView_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 removeFromSuperview];
  }
}

void __24__SXDataTableView_reset__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 removeFromSuperview];
  }
}

- (id)viewForRowAtIndex:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = NSNumber;
    id v5 = *(id *)(a1 + 440);
    unint64_t v6 = [v4 numberWithUnsignedInteger:a2];
    double v7 = [v5 objectForKey:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CGFloat v8 = v7;
    }
    else {
      CGFloat v8 = 0;
    }
    double v9 = v7;
    if (!v8)
    {
      CGFloat v10 = [MEMORY[0x263EFF9D0] null];

      if (v7 == v10)
      {
        double v9 = 0;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 416));
        char v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0
          && (id v13 = objc_loadWeakRetained((id *)(a1 + 416)),
              [v13 dataTableView:a1 drawViewForRowAtIndex:a2],
              double v9 = objc_claimAutoreleasedReturnValue(),
              v13,
              v9))
        {
          double v14 = *(void **)(a1 + 440);
          double v15 = NSNumber;
          id v16 = v14;
          double v17 = [v15 numberWithUnsignedInteger:a2];
          [v16 setObject:v9 forKey:v17];
        }
        else
        {
          double v18 = *(void **)(a1 + 440);
          double v19 = (void *)MEMORY[0x263EFF9D0];
          id v20 = v18;
          double v17 = [v19 null];
          id v16 = [NSNumber numberWithUnsignedInteger:a2];
          [v20 setObject:v17 forKey:v16];

          double v9 = 0;
        }
      }
    }
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (id)viewForColumnAtIndex:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = NSNumber;
    id v5 = *(id *)(a1 + 448);
    unint64_t v6 = [v4 numberWithUnsignedInteger:a2];
    double v7 = [v5 objectForKey:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CGFloat v8 = v7;
    }
    else {
      CGFloat v8 = 0;
    }
    double v9 = v7;
    if (!v8)
    {
      CGFloat v10 = [MEMORY[0x263EFF9D0] null];

      if (v7 == v10)
      {
        double v9 = 0;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 416));
        char v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0
          && (id v13 = objc_loadWeakRetained((id *)(a1 + 416)),
              [v13 dataTableView:a1 drawViewForColumnAtIndex:a2],
              double v9 = objc_claimAutoreleasedReturnValue(),
              v13,
              v9))
        {
          double v14 = *(void **)(a1 + 448);
          double v15 = NSNumber;
          id v16 = v14;
          double v17 = [v15 numberWithUnsignedInteger:a2];
          [v16 setObject:v9 forKey:v17];
        }
        else
        {
          double v18 = *(void **)(a1 + 448);
          double v19 = (void *)MEMORY[0x263EFF9D0];
          id v20 = v18;
          double v17 = [v19 null];
          id v16 = [NSNumber numberWithUnsignedInteger:a2];
          [v20 setObject:v17 forKey:v16];

          double v9 = 0;
        }
      }
    }
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (id)dataSource
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 53);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (uint64_t)indexPathForPoint:(CGFloat)a3
{
  if (!a1) {
    return 0;
  }
  if (![*(id *)(a1 + 432) numberOfRows]) {
    return -1;
  }
  unint64_t v6 = 0;
  uint64_t v7 = -1;
  do
  {
    [*(id *)(a1 + 432) rectForRowAtIndex:v6];
    v10.CGFloat x = a2;
    v10.CGFloat y = a3;
    if (CGRectContainsPoint(v12, v10) && [*(id *)(a1 + 432) numberOfColumns])
    {
      uint64_t v8 = 0;
      while (1)
      {
        [*(id *)(a1 + 432) rectForColumnAtIndex:v8];
        v11.CGFloat x = a2;
        v11.CGFloat y = a3;
        if (CGRectContainsPoint(v13, v11)) {
          break;
        }
        if (++v8 >= (unint64_t)[*(id *)(a1 + 432) numberOfColumns]) {
          goto LABEL_11;
        }
      }
      uint64_t v7 = v6;
    }
LABEL_11:
    ++v6;
  }
  while (v6 < [*(id *)(a1 + 432) numberOfRows]);
  return v7;
}

- (uint64_t)blueprint
{
  if (result) {
    return *(void *)(result + 432);
  }
  return result;
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGRect v15 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextFillRect(a2, *(CGRect *)&v10);
}

- (void)draw:(uint64_t)a3 forIndexPath:(uint64_t)a4
{
  id v12 = a2;
  if (a1)
  {
    uint64_t v7 = -[SXDataTableView viewForRowAtIndex:](a1, a3);
    uint64_t v8 = -[SXDataTableView viewForColumnAtIndex:](a1, a4);
    double v9 = (void *)v8;
    if (!v8)
    {
      if (v7) {
        uint64_t v8 = (uint64_t)v7;
      }
      else {
        uint64_t v8 = a1;
      }
    }
    CGFloat v10 = -[SXDataTableDrawView drawBlocks](v8);
    CGFloat v11 = (void *)[v12 copy];
    [v10 addObject:v11];
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGRect v15 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextFillRect(a2, *(CGRect *)&v10);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_3(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGRect v15 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGContextFillRect(a2, *(CGRect *)&v10);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_4(uint64_t a1, CGContext *a2, double a3, double a4)
{
  id v8 = [*(id *)(a1 + 32) color];
  CGContextSetFillColorWithColor(a2, (CGColorRef)[v8 CGColor]);

  CGRect v10 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGContextFillRect(a2, v10);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_5(uint64_t a1, CGContext *a2, double a3, double a4)
{
  id v8 = [*(id *)(a1 + 32) color];
  CGContextSetFillColorWithColor(a2, (CGColorRef)[v8 CGColor]);

  CGRect v10 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGContextFillRect(a2, v10);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_6(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGRect v99 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGFloat x = v99.origin.x;
  CGFloat y = v99.origin.y;
  CGFloat width = v99.size.width;
  CGFloat height = v99.size.height;
  uint64_t v10 = [*(id *)(a1 + 32) top];
  if (v10)
  {
    CGFloat v11 = (void *)v10;
    uint64_t v12 = [*(id *)(a1 + 32) top];
    if (v12)
    {
      CGFloat v13 = (void *)v12;
      double v14 = [*(id *)(a1 + 32) top];
      [v14 width];
      double v16 = v15;

      if (v16 > 0.0)
      {
        v100.origin.CGFloat x = x;
        v100.origin.CGFloat y = y;
        v100.size.CGFloat width = width;
        v100.size.CGFloat height = height;
        CGFloat MinX = CGRectGetMinX(v100);
        v101.origin.CGFloat x = x;
        v101.origin.CGFloat y = y;
        v101.size.CGFloat width = width;
        v101.size.CGFloat height = height;
        CGFloat MinY = CGRectGetMinY(v101);
        v102.origin.CGFloat x = x;
        v102.origin.CGFloat y = y;
        v102.size.CGFloat width = width;
        v102.size.CGFloat height = height;
        CGFloat v19 = CGRectGetWidth(v102);
        id v20 = [*(id *)(a1 + 32) top];
        [v20 width];
        CGFloat v22 = v21;

        double v23 = [*(id *)(a1 + 32) top];
        id v24 = [v23 color];
        CGContextSetFillColorWithColor(a2, (CGColorRef)[v24 CGColor]);

        v103.origin.CGFloat x = MinX;
        v103.origin.CGFloat y = MinY;
        v103.size.CGFloat width = v19;
        v103.size.CGFloat height = v22;
        CGContextFillRect(a2, v103);
      }
    }
    else
    {
    }
  }
  uint64_t v25 = [*(id *)(a1 + 32) right];
  if (v25)
  {
    double v26 = (void *)v25;
    uint64_t v27 = [*(id *)(a1 + 32) right];
    if (v27)
    {
      double v28 = (void *)v27;
      CGFloat v29 = [*(id *)(a1 + 32) right];
      [v29 width];
      double v31 = v30;

      if (v31 > 0.0)
      {
        v104.origin.CGFloat x = x;
        v104.origin.CGFloat y = y;
        v104.size.CGFloat width = width;
        v104.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v104);
        double v33 = [*(id *)(a1 + 32) right];
        [v33 width];
        CGFloat recta = MaxX - v34;
        v105.origin.CGFloat x = x;
        v105.origin.CGFloat y = y;
        v105.size.CGFloat width = width;
        v105.size.CGFloat height = height;
        double v35 = CGRectGetMinY(v105);
        v36 = [*(id *)(a1 + 32) top];
        [v36 width];
        CGFloat v38 = v35 + v37;
        double v39 = [*(id *)(a1 + 32) right];
        [v39 width];
        CGFloat v41 = v40;
        v106.origin.CGFloat x = x;
        v106.origin.CGFloat y = y;
        v106.size.CGFloat width = width;
        v106.size.CGFloat height = height;
        double v42 = CGRectGetHeight(v106);
        id v43 = [*(id *)(a1 + 32) top];
        [v43 width];
        double v45 = v44;
        double v46 = [*(id *)(a1 + 32) bottom];
        [v46 width];
        CGFloat v48 = v42 - (v45 + v47);

        double v49 = [*(id *)(a1 + 32) right];
        id v50 = [v49 color];
        CGContextSetFillColorWithColor(a2, (CGColorRef)[v50 CGColor]);

        v107.origin.CGFloat x = recta;
        v107.origin.CGFloat y = v38;
        v107.size.CGFloat width = v41;
        v107.size.CGFloat height = v48;
        CGContextFillRect(a2, v107);
      }
    }
    else
    {
    }
  }
  uint64_t v51 = [*(id *)(a1 + 32) bottom];
  if (v51)
  {
    CGFloat v52 = (void *)v51;
    uint64_t v53 = [*(id *)(a1 + 32) bottom];
    if (v53)
    {
      CGFloat v54 = (void *)v53;
      CGRect v55 = [*(id *)(a1 + 32) bottom];
      [v55 width];
      double v57 = v56;

      if (v57 > 0.0)
      {
        v108.origin.CGFloat x = x;
        v108.origin.CGFloat y = y;
        v108.size.CGFloat width = width;
        v108.size.CGFloat height = height;
        CGFloat v58 = CGRectGetMinX(v108);
        v109.origin.CGFloat x = x;
        v109.origin.CGFloat y = y;
        v109.size.CGFloat width = width;
        v109.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v109);
        BOOL v60 = [*(id *)(a1 + 32) bottom];
        [v60 width];
        CGFloat v62 = MaxY - v61;
        v110.origin.CGFloat x = x;
        v110.origin.CGFloat y = y;
        v110.size.CGFloat width = width;
        v110.size.CGFloat height = height;
        CGFloat v63 = CGRectGetWidth(v110);
        uint64_t v64 = [*(id *)(a1 + 32) bottom];
        [v64 width];
        CGFloat v66 = v65;

        v67 = [*(id *)(a1 + 32) bottom];
        id v68 = [v67 color];
        CGContextSetFillColorWithColor(a2, (CGColorRef)[v68 CGColor]);

        v111.origin.CGFloat x = v58;
        v111.origin.CGFloat y = v62;
        v111.size.CGFloat width = v63;
        v111.size.CGFloat height = v66;
        CGContextFillRect(a2, v111);
      }
    }
    else
    {
    }
  }
  uint64_t v69 = [*(id *)(a1 + 32) left];
  if (v69)
  {
    CGFloat rect = (void *)v69;
    uint64_t v70 = [*(id *)(a1 + 32) left];
    if (v70)
    {
      long long v71 = (void *)v70;
      id v72 = [*(id *)(a1 + 32) left];
      [v72 width];
      double v74 = v73;

      if (v74 > 0.0)
      {
        v112.origin.CGFloat x = x;
        v112.origin.CGFloat y = y;
        v112.size.CGFloat width = width;
        v112.size.CGFloat height = height;
        CGFloat v75 = CGRectGetMinX(v112);
        v113.origin.CGFloat x = x;
        v113.origin.CGFloat y = y;
        v113.size.CGFloat width = width;
        v113.size.CGFloat height = height;
        double v76 = CGRectGetMinY(v113);
        v77 = [*(id *)(a1 + 32) top];
        [v77 width];
        double v79 = v76 + v78;
        id v80 = [*(id *)(a1 + 32) left];
        [v80 width];
        uint64_t v82 = v81;
        v114.origin.CGFloat x = x;
        v114.origin.CGFloat y = y;
        v114.size.CGFloat width = width;
        v114.size.CGFloat height = height;
        double v83 = CGRectGetHeight(v114);
        CGFloat v84 = [*(id *)(a1 + 32) top];
        [v84 width];
        double v86 = v85;
        CGFloat v87 = [*(id *)(a1 + 32) bottom];
        [v87 width];
        double v89 = v83 - (v86 + v88);

        v90 = [*(id *)(a1 + 32) left];
        id v91 = [v90 color];
        CGContextSetFillColorWithColor(a2, (CGColorRef)[v91 CGColor]);

        CGFloat v92 = v75;
        double v93 = v79;
        uint64_t v94 = v82;
        double v95 = v89;
        CGContextFillRect(a2, *(CGRect *)&v92);
      }
    }
    else
    {
    }
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_7(uint64_t a1, CGContext *a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = -[SXDataTableView dataSource](WeakRetained);
  id v14 = [v5 tableBorder];

  unint64_t v6 = [v14 top];

  if (v6)
  {
    [*(id *)(a1 + 32) tableSize];
    uint64_t v8 = v7;
    double v9 = [v14 left];
    [v9 width];
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 8);
    v10[4] = 0;
    v10[5] = 0;
    v10[6] = v8;
    v10[7] = v11;

    uint64_t v12 = [v14 top];
    id v13 = [v12 color];
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v13 CGColor]);

    CGContextFillRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_8(uint64_t a1, CGContext *a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = -[SXDataTableView dataSource](WeakRetained);
  id v19 = [v5 tableBorder];

  unint64_t v6 = [v19 bottom];

  if (v6)
  {
    [*(id *)(a1 + 32) tableSize];
    double v8 = v7;
    double v9 = [v19 bottom];
    [v9 width];
    double v11 = v8 - v10;
    [*(id *)(a1 + 32) tableSize];
    uint64_t v13 = v12;
    id v14 = [v19 bottom];
    [v14 width];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v15 + 32) = 0;
    *(double *)(v15 + 40) = v11;
    *(void *)(v15 + 48) = v13;
    *(void *)(v15 + 56) = v16;

    double v17 = [v19 bottom];
    id v18 = [v17 color];
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v18 CGColor]);

    CGContextFillRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_9(uint64_t a1, CGContext *a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = -[SXDataTableView dataSource](WeakRetained);
  id v22 = [v5 tableBorder];

  unint64_t v6 = [v22 right];

  if (v6)
  {
    [*(id *)(a1 + 32) tableSize];
    double v8 = v7;
    double v9 = [v22 right];
    [v9 width];
    double v11 = v8 - v10;
    CGFloat Height = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    uint64_t v13 = [v22 right];
    [v13 width];
    uint64_t v15 = v14;
    [*(id *)(a1 + 32) tableSize];
    double v17 = v16 - CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    CGFloat v18 = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    *(double *)(v19 + 32) = v11;
    *(CGFloat *)(v19 + 40) = Height;
    *(void *)(v19 + 48) = v15;
    *(double *)(v19 + 56) = v17 - v18;

    id v20 = [v22 right];
    id v21 = [v20 color];
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v21 CGColor]);

    CGContextFillRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_10(uint64_t a1, CGContext *a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = -[SXDataTableView dataSource](WeakRetained);
  id v17 = [v5 tableBorder];

  unint64_t v6 = [v17 left];

  if (v6)
  {
    CGFloat Height = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    double v8 = [v17 left];
    [v8 width];
    uint64_t v10 = v9;
    [*(id *)(a1 + 32) tableSize];
    double v12 = v11 - CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    CGFloat v13 = CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v14 + 32) = 0;
    *(CGFloat *)(v14 + 40) = Height;
    *(void *)(v14 + 48) = v10;
    *(double *)(v14 + 56) = v12 - v13;

    uint64_t v15 = [v17 left];
    id v16 = [v15 color];
    CGContextSetFillColorWithColor(a2, (CGColorRef)[v16 CGColor]);

    CGContextFillRect(a2, *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setNeedsDisplay];
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setNeedsDisplay];
  }
}

- (CGPoint)originOffset
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (id)setDataSource:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 53, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_viewDataSource);
}

@end