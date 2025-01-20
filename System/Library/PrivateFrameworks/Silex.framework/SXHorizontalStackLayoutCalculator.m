@interface SXHorizontalStackLayoutCalculator
- (NSMutableArray)flexibleItems;
- (NSMutableArray)items;
- (NSMutableArray)sortedItems;
- (NSMutableDictionary)componentsGroupedByMaximumWidth;
- (NSMutableDictionary)componentsGroupedByMinimumWidth;
- (NSMutableDictionary)maximumWidths;
- (NSMutableDictionary)minimumWidths;
- (SXHorizontalStackLayoutCalculator)init;
- (double)combinedMaximumWidth;
- (double)combinedMinimumWidth;
- (id)layoutForComponentWidth:(double)a3;
- (void)addFlexibleItemWithIdentifier:(id)a3;
- (void)addItemWithMinimumWidth:(double)a3 maximumWidth:(double)a4 identifier:(id)a5;
- (void)setCombinedMaximumWidth:(double)a3;
- (void)setCombinedMinimumWidth:(double)a3;
@end

@implementation SXHorizontalStackLayoutCalculator

- (SXHorizontalStackLayoutCalculator)init
{
  v18.receiver = self;
  v18.super_class = (Class)SXHorizontalStackLayoutCalculator;
  v2 = [(SXHorizontalStackLayoutCalculator *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    items = v2->_items;
    v2->_items = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    flexibleItems = v2->_flexibleItems;
    v2->_flexibleItems = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    sortedItems = v2->_sortedItems;
    v2->_sortedItems = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    componentsGroupedByMaximumWidth = v2->_componentsGroupedByMaximumWidth;
    v2->_componentsGroupedByMaximumWidth = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    componentsGroupedByMinimumWidth = v2->_componentsGroupedByMinimumWidth;
    v2->_componentsGroupedByMinimumWidth = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    minimumWidths = v2->_minimumWidths;
    v2->_minimumWidths = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    maximumWidths = v2->_maximumWidths;
    v2->_maximumWidths = (NSMutableDictionary *)v15;
  }
  return v2;
}

- (void)addFlexibleItemWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(SXHorizontalStackLayoutCalculator *)self flexibleItems];
    [v5 addObject:v4];

    id v6 = [(SXHorizontalStackLayoutCalculator *)self sortedItems];
    [v6 addObject:v4];
  }
}

- (void)addItemWithMinimumWidth:(double)a3 maximumWidth:(double)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    id v34 = v8;
    v10 = [(SXHorizontalStackLayoutCalculator *)self items];
    [v10 addObject:v34];

    uint64_t v11 = [(SXHorizontalStackLayoutCalculator *)self sortedItems];
    [v11 addObject:v34];

    [(SXHorizontalStackLayoutCalculator *)self combinedMaximumWidth];
    [(SXHorizontalStackLayoutCalculator *)self setCombinedMaximumWidth:floor(a4) + v12];
    [(SXHorizontalStackLayoutCalculator *)self combinedMinimumWidth];
    [(SXHorizontalStackLayoutCalculator *)self setCombinedMinimumWidth:floor(a3) + v13];
    v14 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMinimumWidth];
    uint64_t v15 = [NSNumber numberWithDouble:a3];
    v16 = [v14 objectForKey:v15];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x263EFF980] array];
    }
    v19 = v18;

    v20 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMaximumWidth];
    v21 = [NSNumber numberWithDouble:a4];
    v22 = [v20 objectForKey:v21];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [MEMORY[0x263EFF980] array];
    }
    v25 = v24;

    [v19 addObject:v34];
    [v25 addObject:v34];
    v26 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMinimumWidth];
    v27 = [NSNumber numberWithDouble:a3];
    [v26 setObject:v19 forKey:v27];

    v28 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMaximumWidth];
    v29 = [NSNumber numberWithDouble:a4];
    [v28 setObject:v25 forKey:v29];

    v30 = [(SXHorizontalStackLayoutCalculator *)self minimumWidths];
    v31 = [NSNumber numberWithDouble:a3];
    [v30 setObject:v31 forKey:v34];

    v32 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
    v33 = [NSNumber numberWithDouble:a4];
    [v32 setObject:v33 forKey:v34];

    id v9 = v34;
  }
  MEMORY[0x270F9A758](v8, v9);
}

- (id)layoutForComponentWidth:(double)a3
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_alloc_init(SXHorizontalStackLayout);
  uint64_t v173 = 0;
  v174 = (double *)&v173;
  uint64_t v175 = 0x2020000000;
  uint64_t v176 = 0;
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x2020000000;
  char v172 = 0;
  id v6 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
  v164[0] = MEMORY[0x263EF8330];
  v164[1] = 3221225472;
  v164[2] = __61__SXHorizontalStackLayoutCalculator_layoutForComponentWidth___block_invoke;
  v164[3] = &unk_264651E48;
  uint64_t v7 = v5;
  v165 = v7;
  v166 = &v173;
  double v168 = a3;
  v167 = &v169;
  [v6 enumerateKeysAndObjectsUsingBlock:v164];

  if (*((unsigned char *)v170 + 24))
  {
    v174[3] = 0.0;
    id v8 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMaximumWidth];
    id v9 = [v8 allKeys];
    v10 = objc_msgSend(v9, "sortedArrayUsingSelector:");
    uint64_t v11 = [v10 reverseObjectEnumerator];

    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    obuint64_t j = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v160 objects:v184 count:16];
    if (v12)
    {
      uint64_t v127 = *(void *)v161;
      do
      {
        id v129 = (id)v12;
        for (i = 0; i != v129; i = (char *)i + 1)
        {
          if (*(void *)v161 != v127) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          uint64_t v15 = [(SXHorizontalStackLayoutCalculator *)self componentsGroupedByMaximumWidth];
          v16 = [v15 objectForKey:v14];

          [v14 doubleValue];
          double v18 = v17;
          [(SXHorizontalStackLayoutCalculator *)self combinedMaximumWidth];
          if (v19 >= 1.0) {
            double v20 = v19;
          }
          else {
            double v20 = 1.0;
          }
          long long v158 = 0u;
          long long v159 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          id v21 = v16;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v156 objects:v183 count:16];
          if (v22)
          {
            double v23 = floor(v18 / v20 * a3);
            uint64_t v24 = *(void *)v157;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v157 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v156 + 1) + 8 * j);
                v27 = [(SXHorizontalStackLayoutCalculator *)self minimumWidths];
                v28 = [v27 objectForKey:v26];
                [v28 doubleValue];
                double v30 = v29;

                if (v30 >= v23) {
                  double v23 = v30;
                }
                [(SXHorizontalStackLayout *)v7 setWidth:v26 forIdentifier:v23];
                double v31 = v23 + v174[3];
                v174[3] = v31;
                if (v31 > a3)
                {

                  int v130 = 1;
                  goto LABEL_25;
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v156 objects:v183 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v160 objects:v184 count:16];
        int v130 = 0;
      }
      while (v12);
    }
    else
    {
      int v130 = 0;
    }
LABEL_25:

    double v32 = v174[3];
    v33 = [(SXHorizontalStackLayoutCalculator *)self items];
    [v33 count];

    double v34 = a3 - v32;
    if (a3 - v32 > 0.0)
    {
      v35 = [(SXHorizontalStackLayoutCalculator *)self items];
      unint64_t v36 = [v35 count];

      v37 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
      v38 = [v37 keysSortedByValueUsingSelector:sel_compare_];

      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id v39 = v38;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v152 objects:v182 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v153;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v153 != v41) {
              objc_enumerationMutation(v39);
            }
            uint64_t v43 = *(void *)(*((void *)&v152 + 1) + 8 * k);
            [(SXHorizontalStackLayout *)v7 widthForIdentifier:v43];
            double v45 = v44;
            v46 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
            v47 = [v46 objectForKey:v43];

            [v47 doubleValue];
            if (v34 / (double)v36 + v45 < v48) {
              double v48 = v34 / (double)v36 + v45;
            }
            double v49 = floor(v48);
            [(SXHorizontalStackLayout *)v7 setWidth:v43 forIdentifier:v49];
            double v50 = v49 - v45;
            v174[3] = v50 + v174[3];

            double v34 = v34 - v50;
            --v36;
          }
          uint64_t v40 = [v39 countByEnumeratingWithState:&v152 objects:v182 count:16];
        }
        while (v40);
      }
    }
    if (v130)
    {
      v174[3] = 0.0;
      v51 = [(SXHorizontalStackLayoutCalculator *)self items];
      unint64_t v52 = [v51 count];

      v53 = [(SXHorizontalStackLayoutCalculator *)self minimumWidths];
      v54 = [v53 keysSortedByValueUsingSelector:sel_compare_];
      v55 = [v54 reverseObjectEnumerator];

      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      id v131 = v55;
      uint64_t v56 = [v131 countByEnumeratingWithState:&v148 objects:v181 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v149;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v149 != v57) {
              objc_enumerationMutation(v131);
            }
            uint64_t v59 = *(void *)(*((void *)&v148 + 1) + 8 * m);
            v60 = [(SXHorizontalStackLayoutCalculator *)self minimumWidths];
            v61 = [v60 objectForKey:v59];

            v62 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
            v63 = [v62 objectForKey:v59];

            double v64 = v174[3];
            [v61 doubleValue];
            double v66 = v65;
            [(SXHorizontalStackLayoutCalculator *)self combinedMinimumWidth];
            double v68 = v67;
            [v63 doubleValue];
            double v70 = (a3 - v64) / (double)v52;
            if (v68 >= 1.0) {
              double v71 = v68;
            }
            else {
              double v71 = 1.0;
            }
            double v72 = v66 / v71 * a3;
            if (v72 >= v70) {
              double v70 = v72;
            }
            if (v70 < v69) {
              double v69 = v70;
            }
            double v73 = floor(v69);
            [(SXHorizontalStackLayout *)v7 setWidth:v59 forIdentifier:v73];
            v174[3] = v73 + v174[3];

            --v52;
          }
          uint64_t v56 = [v131 countByEnumeratingWithState:&v148 objects:v181 count:16];
        }
        while (v56);
      }

      double v74 = a3 - v174[3];
      if (v74 > 0.0)
      {
        v75 = [(SXHorizontalStackLayoutCalculator *)self items];
        unint64_t v76 = [v75 count];

        v77 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
        v78 = [v77 keysSortedByValueUsingSelector:sel_compare_];

        long long v146 = 0u;
        long long v147 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        id v79 = v78;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v144 objects:v180 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v145;
          do
          {
            for (uint64_t n = 0; n != v80; ++n)
            {
              if (*(void *)v145 != v81) {
                objc_enumerationMutation(v79);
              }
              uint64_t v83 = *(void *)(*((void *)&v144 + 1) + 8 * n);
              [(SXHorizontalStackLayout *)v7 widthForIdentifier:v83];
              double v85 = v84;
              v86 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
              v87 = [v86 objectForKey:v83];

              [v87 doubleValue];
              if (v74 / (double)v76 + v85 < v88) {
                double v88 = v74 / (double)v76 + v85;
              }
              double v89 = floor(v88);
              [(SXHorizontalStackLayout *)v7 setWidth:v83 forIdentifier:v89];
              double v90 = v89 - v85;
              v174[3] = v90 + v174[3];

              double v74 = v74 - v90;
              --v76;
            }
            uint64_t v80 = [v79 countByEnumeratingWithState:&v144 objects:v180 count:16];
          }
          while (v80);
        }
      }
    }
  }
  v91 = v174;
  if (v174[3] < a3)
  {
    v92 = [(SXHorizontalStackLayoutCalculator *)self flexibleItems];
    BOOL v93 = [v92 count] == 0;

    v91 = v174;
    if (!v93)
    {
      double v94 = v174[3];
      v95 = [(SXHorizontalStackLayoutCalculator *)self flexibleItems];
      unint64_t v96 = [v95 count];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      v97 = [(SXHorizontalStackLayoutCalculator *)self flexibleItems];
      uint64_t v98 = [v97 countByEnumeratingWithState:&v140 objects:v179 count:16];
      if (v98)
      {
        double v99 = floor((a3 - v94) / (double)v96);
        uint64_t v100 = *(void *)v141;
        do
        {
          for (uint64_t ii = 0; ii != v98; ++ii)
          {
            if (*(void *)v141 != v100) {
              objc_enumerationMutation(v97);
            }
            [(SXHorizontalStackLayout *)v7 setWidth:*(void *)(*((void *)&v140 + 1) + 8 * ii) forIdentifier:v99];
            v174[3] = v99 + v174[3];
          }
          uint64_t v98 = [v97 countByEnumeratingWithState:&v140 objects:v179 count:16];
        }
        while (v98);
      }

      v91 = v174;
    }
  }
  double v102 = v91[3];
  if (v102 < a3)
  {
    v103 = [(SXHorizontalStackLayoutCalculator *)self sortedItems];
    v104 = [v103 reverseObjectEnumerator];

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v105 = v104;
    uint64_t v106 = [v105 countByEnumeratingWithState:&v136 objects:v178 count:16];
    if (v106)
    {
      double v107 = a3 - v102;
      uint64_t v108 = *(void *)v137;
LABEL_77:
      uint64_t v109 = 0;
      while (1)
      {
        if (*(void *)v137 != v108) {
          objc_enumerationMutation(v105);
        }
        uint64_t v110 = *(void *)(*((void *)&v136 + 1) + 8 * v109);
        [(SXHorizontalStackLayout *)v7 widthForIdentifier:v110];
        double v112 = v111;
        v113 = [(SXHorizontalStackLayoutCalculator *)self maximumWidths];
        v114 = [v113 objectForKey:v110];
        [v114 doubleValue];
        double v116 = v115;

        double v117 = v107 + v112;
        if (v116 >= v107 + v112) {
          double v118 = v107 + v112;
        }
        else {
          double v118 = v116;
        }
        if (v116 <= 0.0) {
          double v107 = 0.0;
        }
        else {
          double v107 = v118 - v112;
        }
        if (v116 > 0.0) {
          double v117 = v118;
        }
        [(SXHorizontalStackLayout *)v7 setWidth:v110 forIdentifier:v117];
        if (v107 < 2.22044605e-16) {
          break;
        }
        if (v106 == ++v109)
        {
          uint64_t v106 = [v105 countByEnumeratingWithState:&v136 objects:v178 count:16];
          if (v106) {
            goto LABEL_77;
          }
          break;
        }
      }
    }
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v119 = [(SXHorizontalStackLayoutCalculator *)self sortedItems];
  uint64_t v120 = [v119 countByEnumeratingWithState:&v132 objects:v177 count:16];
  if (v120)
  {
    uint64_t v121 = *(void *)v133;
    double v122 = 0.0;
    do
    {
      for (juint64_t j = 0; jj != v120; ++jj)
      {
        if (*(void *)v133 != v121) {
          objc_enumerationMutation(v119);
        }
        uint64_t v124 = *(void *)(*((void *)&v132 + 1) + 8 * jj);
        [(SXHorizontalStackLayout *)v7 setPosition:v124 forIdentifier:v122];
        [(SXHorizontalStackLayout *)v7 widthForIdentifier:v124];
        double v122 = v122 + v125;
      }
      uint64_t v120 = [v119 countByEnumeratingWithState:&v132 objects:v177 count:16];
    }
    while (v120);
  }

  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);
  return v7;
}

void __61__SXHorizontalStackLayoutCalculator_layoutForComponentWidth___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  [a3 doubleValue];
  double v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setWidth:forIdentifier:", v7);

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > *(double *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSMutableArray)flexibleItems
{
  return self->_flexibleItems;
}

- (NSMutableArray)sortedItems
{
  return self->_sortedItems;
}

- (NSMutableDictionary)componentsGroupedByMaximumWidth
{
  return self->_componentsGroupedByMaximumWidth;
}

- (NSMutableDictionary)componentsGroupedByMinimumWidth
{
  return self->_componentsGroupedByMinimumWidth;
}

- (NSMutableDictionary)minimumWidths
{
  return self->_minimumWidths;
}

- (NSMutableDictionary)maximumWidths
{
  return self->_maximumWidths;
}

- (double)combinedMaximumWidth
{
  return self->_combinedMaximumWidth;
}

- (void)setCombinedMaximumWidth:(double)a3
{
  self->_combinedMaximumWidth = a3;
}

- (double)combinedMinimumWidth
{
  return self->_combinedMinimumWidth;
}

- (void)setCombinedMinimumWidth:(double)a3
{
  self->_combinedMinimumWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWidths, 0);
  objc_storeStrong((id *)&self->_minimumWidths, 0);
  objc_storeStrong((id *)&self->_componentsGroupedByMinimumWidth, 0);
  objc_storeStrong((id *)&self->_componentsGroupedByMaximumWidth, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
  objc_storeStrong((id *)&self->_flexibleItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end