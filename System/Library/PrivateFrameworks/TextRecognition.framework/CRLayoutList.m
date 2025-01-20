@interface CRLayoutList
+ (id)_groupGeometryInfoForGroup:(id)a3;
+ (id)listsWithRegionGroups:(id)a3;
- (CRLayoutList)initWithItems:(id)a3 layoutDirection:(unint64_t)a4;
- (NSArray)items;
- (unint64_t)layoutDirection;
- (void)setItems:(id)a3;
@end

@implementation CRLayoutList

- (CRLayoutList)initWithItems:(id)a3 layoutDirection:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLayoutList;
  v7 = [(CRLayoutList *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CRLayoutList *)v7 setItems:v6];
    v8->_layoutDirection = a4;
  }

  return v8;
}

+ (id)listsWithRegionGroups:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v111 = (id)objc_opt_new();
  v4 = objc_opt_new();
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v5 = v3;
  uint64_t v124 = [v5 countByEnumeratingWithState:&v130 objects:v134 count:16];
  if (v124)
  {
    v122 = 0;
    uint64_t v123 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    id v6 = 0;
    v125 = 0;
    uint64_t v118 = *(void *)v131;
    double v7 = 0.0;
    double v8 = 1.0;
    unint64_t v126 = 1;
    double v9 = 0.0;
    v113 = v4;
    id v114 = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v124; ++i)
      {
        if (*(void *)v131 != v118) {
          objc_enumerationMutation(v5);
        }
        v129 = v6;
        v11 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "_groupGeometryInfoForGroup:", v11, v111);
        v13 = [[CRLayoutListItem alloc] initWithGroup:v11];
        if (!v128) {
          uint64_t v128 = [v11 layoutDirection];
        }
        uint64_t v14 = [v4 count];
        if (v13) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v14 == 0;
        }
        int v16 = !v15;
        if (!v14)
        {
          LOBYTE(v16) = 0;
          char v41 = 0;
          goto LABEL_72;
        }
        v17 = [(CRLayoutListItem *)v13 boundingQuad];
        [v17 baselineAngle];
        double v19 = vabdd_f64(v18, v9);

        v20 = [v125 firstSubregion];
        v21 = [v12 firstSubregion];
        v22 = [v20 mutualGeometryInfoWith:v21];

        v23 = [v129 lastSubregion];
        v24 = [v12 firstSubregion];
        v25 = [v23 mutualGeometryInfoWith:v24];

        [v22 leadingOffsetAlongBaseline];
        double v27 = v26 / v7;
        [v25 leadingOffsetAlongBaseline];
        double v29 = v28;
        [v25 leadingOffsetAlongBaseline];
        double v31 = v30;
        v32 = [v125 firstSubregion];
        [v32 estimatedLineHeight];
        double v34 = v31 / v33;

        double v35 = fabs(v27);
        uint64_t v36 = v127;
        if (v35 >= v8) {
          uint64_t v36 = v127 + 1;
        }
        uint64_t v127 = v36;
        if (v35 < v8) {
          uint64_t v37 = v126 + 1;
        }
        else {
          uint64_t v37 = 1;
        }
        if (v13)
        {
          double v116 = v19;
          double v117 = v9;
          uint64_t v121 = v37;
          double v115 = v34;
          if (v122 == v125)
          {
            id v40 = v22;
          }
          else
          {
            v38 = [v122 firstSubregion];
            v39 = [v12 firstSubregion];
            id v40 = [v38 mutualGeometryInfoWith:v39];
          }
          v4 = v113;
          double v63 = v7;
          double v64 = fabs(v29 / v7);
          [v22 leadingOffsetAlongBaseline];
          double v66 = v65;
          v67 = [v12 firstSubregion];
          [v67 estimatedLineHeight];
          double v69 = v68;

          v120 = v40;
          [v40 leadingOffsetAlongBaseline];
          double v112 = v70;
          v71 = [v12 firstSubregion];
          [v71 estimatedLineHeight];
          double v73 = v72;

          BOOL v76 = v64 >= v8 && v127 != 0 && v126 < 2;
          v77 = [v113 lastObject];
          char v78 = [v77 canBeSucceededByListItem:v13];

          uint64_t v79 = [v11 layoutDirection];
          v80 = [v125 firstSubregion];
          [v80 estimatedLineHeight];
          double v82 = v81;

          v83 = [v12 firstSubregion];
          [v83 estimatedLineHeight];
          double v85 = v84;

          BOOL v86 = v85 / v82 > 1.5 || v82 / v85 > 1.5;
          double v8 = 1.0;
          if (v64 < 1.0)
          {
            BOOL v87 = v66 / v69 > 8.0;
LABEL_53:
            double v7 = v63;
            double v88 = v115;
          }
          else
          {
            if (v35 > 2.0)
            {
              BOOL v87 = 1;
              goto LABEL_53;
            }
            double v88 = v115;
            BOOL v87 = fabs(v112 / v73) >= 2.0 && v35 > 1.0;
            double v7 = v63;
          }
          LOBYTE(v16) = 0;
          char v89 = v116 > 0.34906585 || v76;
          char v90 = v89 | (v86 || v87);
          if (v88 > 4.0) {
            char v90 = 1;
          }
          char v91 = v90 | v78 ^ 1;
          if (v128 == v79) {
            char v41 = v91;
          }
          else {
            char v41 = 1;
          }
          id v5 = v114;
          double v9 = v117;
LABEL_70:

          uint64_t v37 = v121;
          goto LABEL_71;
        }
        if (v16)
        {
          uint64_t v121 = v37;
          BOOL v42 = v35 < v8;
          v43 = [v125 firstSubregion];
          v44 = [v12 lastSubregion];
          v45 = [v43 mutualGeometryInfoWith:v44];

          v120 = v45;
          [v45 leadingOffsetAlongBaseline];
          double v47 = v46;
          v48 = [v125 firstSubregion];
          [v48 estimatedLineHeight];
          double v50 = v47 / v49;

          int v51 = [v12 isCenterJustified];
          v52 = [v12 firstSubregion];
          [v52 estimatedLineHeight];
          double v54 = v53;

          v55 = [v129 lastSubregion];
          [v55 estimatedLineHeight];
          double v57 = v56;

          BOOL v58 = v54 / v57 >= 0.5;
          if (v54 / v57 > 1.5) {
            BOOL v58 = 0;
          }
          BOOL v59 = v50 >= 0.5;
          if (v50 > 8.0) {
            BOOL v59 = 0;
          }
          int v60 = v42 & ~v51;
          if (v19 > 0.34906585) {
            int v60 = 0;
          }
          int v61 = v60 & (v58 && v59);
          if (v34 <= 3.0) {
            int v16 = v61;
          }
          else {
            int v16 = 0;
          }
          v4 = v113;
          if (v16 == 1)
          {
            id v62 = v12;

            v13 = [v113 lastObject];
            [(CRLayoutListItem *)v13 appendGroup:v11];
            [v113 removeLastObject];
            char v41 = 0;
            v129 = v62;
          }
          else
          {
            char v41 = 0;
            v13 = 0;
          }
          id v5 = v114;
          goto LABEL_70;
        }
        char v41 = 0;
        v13 = 0;
        v4 = v113;
        id v5 = v114;
LABEL_71:

        unint64_t v126 = v37;
LABEL_72:
        uint64_t v92 = v123 + i;
        uint64_t v93 = [v5 count];
        uint64_t v94 = [v4 count];
        if (v13) {
          BOOL v95 = v92 == v93 - 1;
        }
        else {
          BOOL v95 = 1;
        }
        char v96 = v95;
        char v97 = v96 | v41;
        if (v94) {
          char v98 = v97;
        }
        else {
          char v98 = 0;
        }
        if (!v13)
        {
          id v6 = v129;
          if ((v98 & 1) == 0) {
            goto LABEL_96;
          }
LABEL_93:
          if ((unint64_t)[v4 count] >= 2)
          {
            v106 = [CRLayoutList alloc];
            v107 = (void *)[v4 copy];
            v108 = [(CRLayoutList *)v106 initWithItems:v107 layoutDirection:v128];

            [v111 addObject:v108];
          }
          [v4 removeAllObjects];
          uint64_t v128 = 0;
          goto LABEL_96;
        }
        if (v98 & 1 | (v92 == 0))
        {
          id v99 = v12;

          [v99 size];
          double v7 = v100;
          unint64_t v126 = 1;
          uint64_t v127 = 0;
          v122 = v99;
        }
        if ((v16 & 1) == 0)
        {
          id v101 = v12;

          v125 = v101;
        }
        id v102 = v12;

        v103 = [(CRLayoutListItem *)v13 boundingQuad];
        [v103 baselineAngle];
        double v9 = v104;

        [v102 size];
        if (v105 > v7) {
          double v7 = v105;
        }
        if ((v41 & 1) == 0) {
          [v4 addObject:v13];
        }
        id v6 = v102;
        if (v98) {
          goto LABEL_93;
        }
LABEL_96:
        if (v13 != 0 && (v41 & 1) != 0) {
          [v4 addObject:v13];
        }
      }
      v123 += v124;
      uint64_t v124 = [v5 countByEnumeratingWithState:&v130 objects:v134 count:16];
      if (!v124) {
        goto LABEL_102;
      }
    }
  }
  id v6 = 0;
  v125 = 0;
  v122 = 0;
LABEL_102:

  id v109 = v111;
  return v109;
}

+ (id)_groupGeometryInfoForGroup:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 geometryInfo];
  }
  else
  {
    id v4 = [[CRRegionGroupGeometryInfo alloc] initFromRegionGroup:v3];
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end