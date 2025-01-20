@interface SBContinuousExposeAutoLayoutController
- (CGRect)_performAutoLayoutWithSpace:(id)a3 configuration:(id)a4 stageInset:(UIEdgeInsets)a5;
- (CGRect)boundingBoxForSpace:(id)a3 configuration:(id)a4;
- (CGRect)stageAreaForSpace:(id)a3 configuration:(id)a4;
- (id)_fullyOccludedItemsForSpace:(id)a3 configuration:(id)a4;
- (id)_itemsSortedByXInSpace:(id)a3 configuration:(id)a4;
- (id)_spaceWithoutPerformingAutoLayoutWithSpace:(id)a3 previousSpace:(id)a4 configuration:(id)a5 options:(unint64_t)a6;
- (id)spaceByPerformingAutoLayoutWithSpace:(id)a3 previousSpace:(id)a4 configuration:(id)a5 options:(unint64_t)a6;
- (id)validBottomStageAreaInsetsWithConfiguration:(id)a3;
- (id)validLeadingStageAreaInsetsWithConfiguration:(id)a3;
- (id)validTopStageAreaInsetsWithConfiguration:(id)a3;
- (id)validTrailingStageAreaInsetsWithConfiguration:(id)a3;
- (void)_compactSpacingBetweenItemsInSpace:(id)a3 configuration:(id)a4;
- (void)_snapPositionForAppToEdgesAndCenterOfRectForItem:(id)a3 rect:(CGRect)a4 centerSnapPadding:(double)a5 edgeSnapPadding:(double)a6 requireBothAxesToSnap:(BOOL)a7 configuration:(id)a8;
- (void)_updateCompactedFramesForSpace:(id)a3 configuration:(id)a4;
- (void)_updateItemsCoveredByFullyOccludedPeekingItemsInSpace:(id)a3 configuration:(id)a4;
- (void)_updateOcclusionStatusForItemsInSpace:(id)a3 configuration:(id)a4;
- (void)dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:(id)a3 configuration:(id)a4;
- (void)snapPositionToNearestEdgesIfNecessaryForSpace:(id)a3 stageArea:(CGRect)a4 configuration:(id)a5;
- (void)updateOverlappingScaleAnchorPositionsForSpace:(id)a3 configuration:(id)a4;
@end

@implementation SBContinuousExposeAutoLayoutController

- (id)spaceByPerformingAutoLayoutWithSpace:(id)a3 previousSpace:(id)a4 configuration:(id)a5 options:(unint64_t)a6
{
  uint64_t v191 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[v10 mutableCopy];
  v14 = [v13 items];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    id v18 = v13;
    goto LABEL_95;
  }
  v16 = [v12 chamoisLayoutAttributes];
  if (![v16 isAdditiveModelEnabled])
  {
    v146 = v16;
    v19 = (double *)MEMORY[0x1E4F437F8];
    v150 = v13;
    v147 = self;
    if (v11 && (a6 & 1) != 0)
    {
      id v145 = v12;
      id v148 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      v20 = [v11 items];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v179 objects:v190 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v180;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v180 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = [*(id *)(*((void *)&v179 + 1) + 8 * i) displayItem];
            if ([v13 containsDisplayItem:v25])
            {
              v26 = [v13 autoLayoutItemForDisplayItem:v25];
              [v148 addObject:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v179 objects:v190 count:16];
        }
        while (v22);
      }
      id v143 = v10;
      id v144 = v11;

      v27 = [(SBContinuousExposeAutoLayoutSpace *)[SBMutableContinuousExposeAutoLayoutSpace alloc] initWithItems:v148];
      -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](self, "_performAutoLayoutWithSpace:configuration:stageInset:", v27, v145, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      [(SBContinuousExposeAutoLayoutController *)self boundingBoxForSpace:v27 configuration:v145];
      double v37 = v36;
      double v39 = v38;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      v40 = [v13 items];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v175 objects:v189 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        v43 = 0;
        uint64_t v44 = *(void *)v176;
        double v45 = v31 + v35 * 0.5;
        LOBYTE(v46) = 1;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v176 != v44) {
              objc_enumerationMutation(v40);
            }
            v48 = *(void **)(*((void *)&v175 + 1) + 8 * j);
            v49 = [v48 displayItem];
            BOOL v50 = [(SBContinuousExposeAutoLayoutSpace *)v27 containsDisplayItem:v49];

            if (!v50)
            {
              [v48 setInDefaultPosition:1];
              [v48 size];
              objc_msgSend(v48, "setPosition:", v29 + v51 * 0.5, v45);
              id v52 = v48;

              v43 = v52;
            }
            if (v46) {
              int v46 = [v48 isInDefaultPosition];
            }
            else {
              int v46 = 0;
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v175 objects:v189 count:16];
        }
        while (v42);

        if (v43) {
          int v53 = v46;
        }
        else {
          int v53 = 0;
        }
        if (v53 != 1)
        {
          id v10 = v143;
          v13 = v150;
          self = v147;
          v19 = (double *)MEMORY[0x1E4F437F8];
          goto LABEL_75;
        }
        double v54 = v37 + v39;
        double v55 = v29 + v33;
        v13 = v150;
        self = v147;
        v19 = (double *)MEMORY[0x1E4F437F8];
        if (v37 + v39 >= v29 + v33)
        {
LABEL_72:
          id v10 = v143;
LABEL_75:

          id v11 = v144;
          id v12 = v145;
          goto LABEL_76;
        }
        [v43 size];
        double v57 = v56;
        [v146 stageInterItemSpacing];
        double v59 = v29 + v33 * 0.5;
        double v60 = (v39 + v57 + v58) * 0.5;
        if (v29 < v59 - v60) {
          double v29 = v59 - v60;
        }
        [v43 size];
        double v62 = v61 * 0.5 + v29;
        [v43 position];
        [v43 setPosition:v62];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        v40 = [v150 items];
        uint64_t v63 = [v40 countByEnumeratingWithState:&v171 objects:v188 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v172;
          double v66 = v59 + v60;
          if (v55 < v59 + v60) {
            double v66 = v55;
          }
          double v67 = v66 - v54;
          do
          {
            for (uint64_t k = 0; k != v64; ++k)
            {
              if (*(void *)v172 != v65) {
                objc_enumerationMutation(v40);
              }
              v69 = *(void **)(*((void *)&v171 + 1) + 8 * k);
              if (([v69 isEqual:v43] & 1) == 0)
              {
                [v69 position];
                [v69 setPosition:v67 + v70];
              }
            }
            uint64_t v64 = [v40 countByEnumeratingWithState:&v171 objects:v188 count:16];
          }
          while (v64);
        }
      }
      else
      {
        v43 = 0;
        v19 = (double *)MEMORY[0x1E4F437F8];
      }

      goto LABEL_72;
    }
    if (v11)
    {
      v71 = [v11 items];
      if ((unint64_t)[v71 count] > 2)
      {
        v72 = [v11 items];
        uint64_t v73 = [v72 count];
        v74 = [v13 items];
        uint64_t v75 = [v74 count] + 1;

        BOOL v76 = v73 == v75;
        self = v147;
        if (!v76) {
          goto LABEL_76;
        }
        v77 = [MEMORY[0x1E4F1CA80] set];
        long long v167 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        v78 = [v11 items];
        uint64_t v79 = [v78 countByEnumeratingWithState:&v167 objects:v187 count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v168;
          do
          {
            for (uint64_t m = 0; m != v80; ++m)
            {
              if (*(void *)v168 != v81) {
                objc_enumerationMutation(v78);
              }
              v83 = [*(id *)(*((void *)&v167 + 1) + 8 * m) displayItem];
              [v77 addObject:v83];
            }
            uint64_t v80 = [v78 countByEnumeratingWithState:&v167 objects:v187 count:16];
          }
          while (v80);
        }
        id v84 = v12;

        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        v85 = [v150 items];
        uint64_t v86 = [v85 countByEnumeratingWithState:&v163 objects:v186 count:16];
        if (v86)
        {
          uint64_t v87 = v86;
          uint64_t v88 = *(void *)v164;
          char v89 = 1;
          do
          {
            for (uint64_t n = 0; n != v87; ++n)
            {
              if (*(void *)v164 != v88) {
                objc_enumerationMutation(v85);
              }
              if (v89)
              {
                v91 = [*(id *)(*((void *)&v163 + 1) + 8 * n) displayItem];
                char v89 = [v77 containsObject:v91];
              }
              else
              {
                char v89 = 0;
              }
            }
            uint64_t v87 = [v85 countByEnumeratingWithState:&v163 objects:v186 count:16];
          }
          while (v87);

          if ((v89 & 1) == 0) {
            goto LABEL_120;
          }
        }
        else
        {
        }
        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v121 = [v150 items];
        uint64_t v122 = [v121 countByEnumeratingWithState:&v159 objects:v185 count:16];
        if (v122)
        {
          uint64_t v123 = v122;
          uint64_t v124 = *(void *)v160;
          char v125 = 1;
          do
          {
            for (iuint64_t i = 0; ii != v123; ++ii)
            {
              if (*(void *)v160 != v124) {
                objc_enumerationMutation(v121);
              }
              if (v125) {
                char v125 = [*(id *)(*((void *)&v159 + 1) + 8 * ii) isInDefaultPosition];
              }
              else {
                char v125 = 0;
              }
            }
            uint64_t v123 = [v121 countByEnumeratingWithState:&v159 objects:v185 count:16];
          }
          while (v123);

          if ((v125 & 1) == 0) {
            goto LABEL_120;
          }
        }
        else
        {
        }
        [(SBContinuousExposeAutoLayoutController *)v147 _compactSpacingBetweenItemsInSpace:v150 configuration:v84];
        [(SBContinuousExposeAutoLayoutController *)v147 dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:v150 configuration:v84];
        [(SBContinuousExposeAutoLayoutController *)v147 boundingBoxForSpace:v150 configuration:v84];
        double v128 = v127;
        double v130 = v129;
        [(SBContinuousExposeAutoLayoutController *)v147 stageAreaForSpace:v150 configuration:v84];
        double v132 = v131;
        double v134 = v133;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        v135 = [v150 items];
        uint64_t v136 = [v135 countByEnumeratingWithState:&v155 objects:v184 count:16];
        if (v136)
        {
          uint64_t v137 = v136;
          uint64_t v138 = *(void *)v156;
          double v139 = v132 + v134 * 0.5 - (v128 + v130 * 0.5);
          do
          {
            for (juint64_t j = 0; jj != v137; ++jj)
            {
              if (*(void *)v156 != v138) {
                objc_enumerationMutation(v135);
              }
              v141 = *(void **)(*((void *)&v155 + 1) + 8 * jj);
              [v141 position];
              [v141 setPosition:v139 + v142];
            }
            uint64_t v137 = [v135 countByEnumeratingWithState:&v155 objects:v184 count:16];
          }
          while (v137);
        }

LABEL_120:
        id v12 = v84;
        v13 = v150;
        self = v147;
        v19 = (double *)MEMORY[0x1E4F437F8];
        goto LABEL_76;
      }
    }
LABEL_76:
    -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](self, "_performAutoLayoutWithSpace:configuration:stageInset:", v13, v12, *v19, v19[1], v19[2], v19[3]);
    double v149 = v92;
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    [v12 containerBounds];
    double v100 = v99;
    double v102 = v101;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v103 = [v13 items];
    uint64_t v104 = [v103 countByEnumeratingWithState:&v151 objects:v183 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v152;
      do
      {
        for (kuint64_t k = 0; kk != v105; ++kk)
        {
          if (*(void *)v152 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = *(void **)(*((void *)&v151 + 1) + 8 * kk);
          if (([v108 isInDefaultPosition] & 1) == 0)
          {
            v109 = [v150 items];
            uint64_t v110 = [v109 count];

            if (v110 == 1)
            {
              [v108 position];
              if (BSFloatLessThanOrEqualToFloat())
              {
                if (BSFloatLessThanOrEqualToFloat()) {
                  [v108 setInDefaultPosition:1];
                }
              }
            }
          }
        }
        uint64_t v105 = [v103 countByEnumeratingWithState:&v151 objects:v183 count:16];
      }
      while (v105);
    }

    v13 = v150;
    [v150 setConfiguration:v12];
    objc_msgSend(v150, "setStageArea:", v149, v94, v96, v98);
    [(SBContinuousExposeAutoLayoutController *)v147 boundingBoxForSpace:v150 configuration:v12];
    double v112 = v111;
    double v114 = v113;
    objc_msgSend(v150, "setBoundingBox:");
    v16 = v146;
    [v146 stripWidth];
    double v116 = v115;
    [v146 minimumDefaultWindowSize];
    double v118 = (v102 - v117) * 0.5;
    if (v116 >= v118) {
      double v116 = v118;
    }
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      BOOL v119 = v112 + v114 <= v100 + v102 - v116;
    }
    else {
      BOOL v119 = v112 >= v116;
    }
    objc_msgSend(v150, "setStripVisible:", v119, v112 + v114);
    [(SBContinuousExposeAutoLayoutController *)v147 _updateCompactedFramesForSpace:v150 configuration:v12];
    [(SBContinuousExposeAutoLayoutController *)v147 _updateItemsCoveredByFullyOccludedPeekingItemsInSpace:v150 configuration:v12];
    id v17 = v150;
    goto LABEL_94;
  }
  id v17 = [(SBContinuousExposeAutoLayoutController *)self _spaceWithoutPerformingAutoLayoutWithSpace:v10 previousSpace:v11 configuration:v12 options:a6];
LABEL_94:
  id v18 = v17;

LABEL_95:
  return v18;
}

- (id)_spaceWithoutPerformingAutoLayoutWithSpace:(id)a3 previousSpace:(id)a4 configuration:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[a3 mutableCopy];
  v13 = [v12 items];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v11 containerBounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    if (v10 && (v6 & 1) != 0)
    {
      uint64_t v42 = self;
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v43 = v10;
      v24 = [v10 items];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v24);
            }
            double v29 = [*(id *)(*((void *)&v48 + 1) + 8 * i) displayItem];
            if ([v12 containsDisplayItem:v29])
            {
              double v30 = [v12 autoLayoutItemForDisplayItem:v29];
              [v23 addObject:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v26);
      }
      id v41 = v11;

      double v31 = [(SBContinuousExposeAutoLayoutSpace *)[SBMutableContinuousExposeAutoLayoutSpace alloc] initWithItems:v23];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      double v32 = [v12 items];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v32);
            }
            double v37 = *(void **)(*((void *)&v44 + 1) + 8 * j);
            double v38 = [v37 displayItem];
            BOOL v39 = [(SBContinuousExposeAutoLayoutSpace *)v31 containsDisplayItem:v38];

            if (!v39)
            {
              [v37 setInDefaultPosition:1];
              objc_msgSend(v37, "setPosition:", v16 + v20 * 0.5, v18 + v22 * 0.5);
              objc_msgSend(v37, "setAnchorPosition:", v16 + v20 * 0.5, v18 + v22 * 0.5);
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v34);
      }

      self = v42;
      id v10 = v43;
      id v11 = v41;
    }
    [v12 setConfiguration:v11];
    objc_msgSend(v12, "setStageArea:", v16, v18, v20, v22);
    [(SBContinuousExposeAutoLayoutController *)self boundingBoxForSpace:v12 configuration:v11];
    objc_msgSend(v12, "setBoundingBox:");
    [v12 setStripVisible:0];
    [(SBContinuousExposeAutoLayoutController *)self _updateCompactedFramesForSpace:v12 configuration:v11];
    [(SBContinuousExposeAutoLayoutController *)self _updateOcclusionStatusForItemsInSpace:v12 configuration:v11];
  }

  return v12;
}

- (CGRect)_performAutoLayoutWithSpace:(id)a3 configuration:(id)a4 stageInset:(UIEdgeInsets)a5
{
  double right = a5.right;
  bottouint64_t m = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    uint64_t v122 = [MEMORY[0x1E4F28B00] currentHandler];
    [v122 handleFailureInMethod:a2, self, @"SBContinuousExposeAutoLayoutController.m", 172, @"Invalid parameter not satisfying: %@", @"space" object file lineNumber description];
  }
  v13 = [v11 items];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v128 = left;
    double v129 = right;
    double v126 = top;
    double v130 = bottom;
    double v15 = (void *)[v11 copy];
    uint64_t v124 = [v12 chamoisLayoutAttributes];
    [v12 containerBounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    id v131 = v12;
    double v22 = [v12 chamoisLayoutAttributes];
    [v22 screenEdgePadding];

    int v23 = _os_feature_enabled_impl();
    double v123 = v21;
    double v125 = v19;
    UIRectInset();
    CGFloat v138 = v25;
    CGFloat v140 = v24;
    CGFloat v134 = v27;
    CGFloat v136 = v26;
    double v28 = +[SBAppSwitcherDomain rootSettings];
    double v29 = [v28 chamoisSettings];
    [v29 partiallyOffscreenWindowMargin];
    double v132 = v30;

    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    double v31 = [v11 items];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v160 objects:v167 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v161;
      if (v128 == 0.0) {
        int v35 = v23;
      }
      else {
        int v35 = 0;
      }
      if (bottom == 0.0) {
        int v36 = v23;
      }
      else {
        int v36 = 0;
      }
      if (right == 0.0) {
        int v37 = v23;
      }
      else {
        int v37 = 0;
      }
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v161 != v34) {
            objc_enumerationMutation(v31);
          }
          BOOL v39 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          [v39 position];
          double v41 = v40;
          double v146 = v42;
          [v39 size];
          double v45 = v44;
          double v46 = v43;
          double v47 = v44 - v132;
          if (v35) {
            double v48 = v47;
          }
          else {
            double v48 = 0.0;
          }
          double v49 = v43 - v132;
          if (!v36) {
            double v49 = 0.0;
          }
          if (!v37) {
            double v47 = 0.0;
          }
          double v142 = v47;
          double v144 = v49;
          v169.origin.x = v140;
          v169.origin.y = v138;
          v169.size.width = v136;
          v169.size.height = v134;
          CGFloat v50 = CGRectGetMinX(v169) - v48;
          double v51 = v45 * 0.5;
          double v52 = v45 * 0.5 + v50;
          if (v41 >= v52) {
            double v53 = v41;
          }
          else {
            double v53 = v52;
          }
          v170.origin.x = v140;
          v170.origin.y = v138;
          v170.size.width = v136;
          v170.size.height = v134;
          double v54 = CGRectGetMaxX(v170) + v142 - v51;
          if (v53 >= v54) {
            double v53 = v54;
          }
          v171.origin.x = v140;
          v171.origin.y = v138;
          v171.size.width = v136;
          v171.size.height = v134;
          double v55 = v46 * 0.5;
          double v56 = v46 * 0.5 + CGRectGetMinY(v171);
          if (v146 >= v56) {
            double v57 = v146;
          }
          else {
            double v57 = v56;
          }
          v172.origin.x = v140;
          v172.origin.y = v138;
          v172.size.width = v136;
          v172.size.height = v134;
          double v58 = v144 + CGRectGetMaxY(v172) - v55;
          if (v57 >= v58) {
            double v59 = v58;
          }
          else {
            double v59 = v57;
          }
          objc_msgSend(v39, "setPosition:", v53, v59);
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v160 objects:v167 count:16];
      }
      while (v33);
    }

    [(SBContinuousExposeAutoLayoutController *)self stageAreaForSpace:v11 configuration:v131];
    double v147 = v60;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    double v67 = [v11 items];
    uint64_t v68 = [v67 countByEnumeratingWithState:&v156 objects:v166 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v157;
      double v71 = *MEMORY[0x1E4F1DAD8];
      double v72 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v157 != v70) {
            objc_enumerationMutation(v67);
          }
          v74 = *(void **)(*((void *)&v156 + 1) + 8 * j);
          uint64_t v75 = [v74 displayItem];
          BOOL v76 = [v15 autoLayoutItemForDisplayItemIfExists:v75];

          if (v76)
          {
            [v76 position];
            if (v78 == v71 && v77 == v72) {
              objc_msgSend(v74, "setPosition:", v17 + v125 * 0.5, v62 + v66 * 0.5);
            }
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v156 objects:v166 count:16];
      }
      while (v69);
    }

    uint64_t v80 = [v11 items];
    uint64_t v81 = [v80 count];

    id v12 = v131;
    if (v81 == 1)
    {
      v82 = [v11 items];
      v83 = [v82 firstObject];

      if ([v83 isInDefaultPosition])
      {
        double v143 = v66;
        double v84 = v62 + v66 * 0.5;
LABEL_58:
        double v92 = v124;
        objc_msgSend(v83, "setPosition:", v125 * 0.5, v84);
        goto LABEL_82;
      }
      [v83 size];
      if (v91 == v125 && v90 == v123)
      {
        double v143 = v66;
        double v84 = v123 * 0.5;
        goto LABEL_58;
      }
    }
    double v93 = *MEMORY[0x1E4F437F8];
    double v137 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v139 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    BOOL v94 = v128 == v139;
    if (v126 != *MEMORY[0x1E4F437F8]) {
      BOOL v94 = 0;
    }
    BOOL v95 = v129 == *(double *)(MEMORY[0x1E4F437F8] + 24) && v94;
    double v141 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    if (!v95 || v130 != *(double *)(MEMORY[0x1E4F437F8] + 16))
    {
      double v147 = v128 + v147;
      double v62 = v126 + v62;
      double v64 = v64 - (v128 + v129);
      double v66 = v66 - (v126 + v130);
    }
    -[SBContinuousExposeAutoLayoutController snapPositionToNearestEdgesIfNecessaryForSpace:stageArea:configuration:](self, "snapPositionToNearestEdgesIfNecessaryForSpace:stageArea:configuration:", v11, v131, v147, v62, v64, v66);
    [(SBContinuousExposeAutoLayoutController *)self dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:v11 configuration:v131];
    [(SBContinuousExposeAutoLayoutController *)self updateOverlappingScaleAnchorPositionsForSpace:v11 configuration:v131];
    char v97 = !v95;
    if (self->_reentrancyGuard) {
      char v97 = 1;
    }
    double v92 = v124;
    double v143 = v66;
    if ((v97 & 1) != 0 || v130 != v141) {
      goto LABEL_83;
    }
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    v83 = [v11 items];
    uint64_t v98 = [v83 countByEnumeratingWithState:&v152 objects:v165 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      uint64_t v100 = *(void *)v153;
      while (2)
      {
        for (uint64_t k = 0; k != v99; ++k)
        {
          if (*(void *)v153 != v100) {
            objc_enumerationMutation(v83);
          }
          if ([*(id *)(*((void *)&v152 + 1) + 8 * k) isFullyOccluded])
          {
            double v133 = v93;
            double v135 = v64;

            [v124 stageOcclusionDodgingPeekScale];
            [v124 stageOcclusionDodgingPeekLength];
            double v107 = v106;
            long long v148 = 0u;
            long long v149 = 0u;
            long long v150 = 0u;
            long long v151 = 0u;
            v108 = [v11 items];
            uint64_t v109 = [v108 countByEnumeratingWithState:&v148 objects:v164 count:16];
            double v110 = v137;
            double v145 = v139;
            if (v109)
            {
              uint64_t v111 = v109;
              uint64_t v112 = *(void *)v149;
              double v110 = v137;
              double v145 = v139;
              do
              {
                for (uint64_t m = 0; m != v111; ++m)
                {
                  if (*(void *)v149 != v112) {
                    objc_enumerationMutation(v108);
                  }
                  double v114 = *(void **)(*((void *)&v148 + 1) + 8 * m);
                  if ([v114 isFullyOccluded])
                  {
                    [v114 unoccludedPeekingPosition];
                    if (v116 != 1.79769313e308 || v115 != 1.79769313e308)
                    {
                      [v114 size];
                      if (BSFloatLessThanFloat())
                      {
                        double v145 = v107;
                      }
                      else if (BSFloatGreaterThanFloat())
                      {
                        double v110 = v107;
                      }
                    }
                  }
                }
                uint64_t v111 = [v108 countByEnumeratingWithState:&v148 objects:v164 count:16];
              }
              while (v111);
            }

            double v64 = v135;
            if (v145 != v139 || v110 != v137)
            {
              self->_reentrancyGuard = 1;
              -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](self, "_performAutoLayoutWithSpace:configuration:stageInset:", v11, v131, v133, v145, v141, v110);
              double v147 = v118;
              double v62 = v119;
              double v64 = v120;
              double v143 = v121;
              self->_reentrancyGuard = 0;
            }
            goto LABEL_83;
          }
        }
        uint64_t v99 = [v83 countByEnumeratingWithState:&v152 objects:v165 count:16];
        if (v99) {
          continue;
        }
        break;
      }
    }
LABEL_82:

LABEL_83:
    double v89 = v143;
    goto LABEL_84;
  }
  [v12 containerBounds];
  double v147 = v85;
  double v62 = v86;
  double v64 = v87;
  double v89 = v88;
LABEL_84:

  double v102 = v147;
  double v103 = v62;
  double v104 = v64;
  double v105 = v89;
  result.size.height = v105;
  result.size.width = v104;
  result.origin.y = v103;
  result.origin.x = v102;
  return result;
}

- (CGRect)stageAreaForSpace:(id)a3 configuration:(id)a4
{
  v87[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(SBContinuousExposeAutoLayoutController *)self boundingBoxForSpace:a3 configuration:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 containerBounds];
  double v15 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v72 = v17;
  double v73 = v16;
  double v65 = v16 + v15;
  double v66 = *MEMORY[0x1E4F437F8] + v17;
  double v78 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v79 = v15;
  double v77 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  double v70 = v19;
  double v71 = v18;
  double v75 = *MEMORY[0x1E4F437F8];
  double v67 = v18 - (v15 + v77);
  double v68 = v19 - (*MEMORY[0x1E4F437F8] + v78);
  uint64_t v20 = [(SBContinuousExposeAutoLayoutController *)self validTopStageAreaInsetsWithConfiguration:v6];
  uint64_t v21 = [(SBContinuousExposeAutoLayoutController *)self validLeadingStageAreaInsetsWithConfiguration:v6];
  uint64_t v22 = [(SBContinuousExposeAutoLayoutController *)self validBottomStageAreaInsetsWithConfiguration:v6];
  double v62 = v6;
  uint64_t v23 = [(SBContinuousExposeAutoLayoutController *)self validTrailingStageAreaInsetsWithConfiguration:v6];
  double v61 = (void *)v20;
  v87[0] = v20;
  double v24 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v21;
  }
  v87[1] = v25;
  v87[2] = v22;
  double v59 = (void *)v22;
  double v60 = (void *)v21;
  double v58 = (void *)v23;
  if ([*v24 userInterfaceLayoutDirection] == 1) {
    uint64_t v26 = v21;
  }
  else {
    uint64_t v26 = v23;
  }
  v87[3] = v26;
  double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:4];
  double v28 = [NSNumber numberWithDouble:v10];
  v86[0] = v28;
  double v29 = [NSNumber numberWithDouble:v8];
  v86[1] = v29;
  double v30 = [NSNumber numberWithDouble:v10 + v14];
  v86[2] = v30;
  double v31 = [NSNumber numberWithDouble:v8 + v12];
  v86[3] = v31;
  double v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];

  if ([v27 count])
  {
    unint64_t v32 = 0;
    double v63 = v27;
    do
    {
      uint64_t v33 = [v27 objectAtIndex:v32];
      uint64_t v34 = [v64 objectAtIndex:v32];
      [v34 doubleValue];
      double v74 = v35;

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      obuint64_t j = v33;
      uint64_t v36 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v81;
        double v76 = 1.79769313e308;
LABEL_11:
        uint64_t v39 = 0;
        while (2)
        {
          if (*(void *)v81 != v38) {
            objc_enumerationMutation(obj);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * v39) doubleValue];
          double v41 = v40;
          double v43 = v78;
          double v42 = v79;
          double v44 = v77;
          switch(v32)
          {
            case 0uLL:
              goto LABEL_21;
            case 1uLL:
              double v41 = v75;
              double v42 = v40;
              goto LABEL_19;
            case 2uLL:
              double v41 = v75;
              double v42 = v79;
              double v43 = v40;
              goto LABEL_20;
            case 3uLL:
              double v41 = v75;
              double v43 = v78;
              double v42 = v79;
              double v44 = v40;
              goto LABEL_21;
            default:
              double v41 = v75;
              double v42 = v79;
LABEL_19:
              double v43 = v78;
LABEL_20:
              double v44 = v77;
LABEL_21:
              double v45 = [NSNumber numberWithDouble:v72 + v41];
              v84[0] = v45;
              double v46 = [NSNumber numberWithDouble:v73 + v42];
              v84[1] = v46;
              double v47 = [NSNumber numberWithDouble:v72 + v41 + v70 - (v41 + v43)];
              v84[2] = v47;
              double v48 = [NSNumber numberWithDouble:v73 + v42 + v71 - (v42 + v44)];
              v84[3] = v48;
              double v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];

              CGFloat v50 = [v49 objectAtIndex:v32];
              [v50 doubleValue];
              double v52 = v51;

              double v53 = vabdd_f64(v74, v52);
              if (v53 <= v76)
              {
                double v75 = v41;
                double v78 = v43;
                double v79 = v42;
                double v76 = v53;
                double v77 = v44;
                double v67 = v71 - (v42 + v44);
                double v68 = v70 - (v41 + v43);
                double v65 = v73 + v42;
                double v66 = v72 + v41;
              }

              if (v37 != ++v39) {
                continue;
              }
              uint64_t v37 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
              if (!v37) {
                goto LABEL_25;
              }
              goto LABEL_11;
          }
        }
      }
LABEL_25:

      ++v32;
      double v27 = v63;
    }
    while (v32 < [v63 count]);
  }

  double v54 = v65;
  double v55 = v66;
  double v56 = v67;
  double v57 = v68;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (id)validTopStageAreaInsetsWithConfiguration:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  v4 = [a3 chamoisLayoutAttributes];
  [v4 screenEdgePadding];
  v5 = objc_msgSend(v3, "numberWithDouble:");
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)validBottomStageAreaInsetsWithConfiguration:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 chamoisLayoutAttributes];
  [v4 screenEdgePadding];
  double v6 = v5;

  double v7 = [NSNumber numberWithDouble:v6];
  v15[0] = v7;
  double v8 = NSNumber;
  [v3 dockHeightWithBottomEdgePadding];
  double v10 = v9;

  double v11 = [v8 numberWithDouble:v6 + v10];
  v15[1] = v11;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  double v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_202];

  return v13;
}

uint64_t __86__SBContinuousExposeAutoLayoutController_validBottomStageAreaInsetsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)validLeadingStageAreaInsetsWithConfiguration:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 chamoisLayoutAttributes];
  [v4 stripWidth];
  double v6 = v5;
  [v4 screenEdgePadding];
  double v8 = v7;
  [v4 minimumDefaultWindowSize];
  if (v9 == 0.0)
  {
    double v10 = [NSNumber numberWithDouble:v8];
    v21[0] = v10;
    double v11 = [NSNumber numberWithDouble:v6 * 0.5];
    v21[1] = v11;
    double v12 = [NSNumber numberWithDouble:v6];
    v21[2] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    double v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_17_0];
  }
  else
  {
    double v15 = v9;
    [v3 containerBounds];
    double v17 = (v16 - v15) * 0.5;
    if (v6 < v17) {
      double v17 = v6;
    }
    double v18 = round(v17);
    double v10 = [NSNumber numberWithDouble:v8];
    double v11 = objc_msgSend(NSNumber, "numberWithDouble:", v18, v10);
    v20[1] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    double v14 = [v12 sortedArrayUsingComparator:&__block_literal_global_19_1];
  }

  return v14;
}

uint64_t __87__SBContinuousExposeAutoLayoutController_validLeadingStageAreaInsetsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __87__SBContinuousExposeAutoLayoutController_validLeadingStageAreaInsetsWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)validTrailingStageAreaInsetsWithConfiguration:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  v4 = [a3 chamoisLayoutAttributes];
  [v4 screenEdgePadding];
  double v5 = objc_msgSend(v3, "numberWithDouble:");
  v8[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)snapPositionToNearestEdgesIfNecessaryForSpace:(id)a3 stageArea:(CGRect)a4 configuration:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  double v13 = [v11 items];
  uint64_t v14 = [v13 count];
  double v15 = [v12 chamoisLayoutAttributes];
  double v16 = [v15 snapPaddingSettings];

  [v16 edgePadding];
  double v18 = v17;
  uint64_t v38 = v16;
  uint64_t v39 = v11;
  if (v14 == 1) {
    [v16 singleAppCenterPadding];
  }
  else {
    [v16 multiAppCenterPadding];
  }
  double v40 = v19;
  uint64_t v20 = [v12 chamoisLayoutAttributes];
  [v20 screenEdgePadding];
  double v37 = v21;

  [v12 containerBounds];
  double v36 = v22;
  uint64_t v23 = [v13 objectAtIndex:0];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  double v24 = [v13 reverseObjectEnumerator];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v29, v14 == 1, v12, x, y, width, height, 0.0, v18);
        if (v29 != v23)
        {
          [v29 position];
          double v31 = v30;
          double v33 = v32;
          [v29 size];
          -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v23, 0, v12, v31 - v34 * 0.5, v33 - v35 * 0.5, v34, v35, v40, v18);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v26);
  }

  if (v14 == 1)
  {
    [(SBContinuousExposeAutoLayoutController *)self stageAreaForSpace:v39 configuration:v12];
    -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v23, 1, v12, v37 + v36);
  }
}

- (void)_snapPositionForAppToEdgesAndCenterOfRectForItem:(id)a3 rect:(CGRect)a4 centerSnapPadding:(double)a5 edgeSnapPadding:(double)a6 requireBothAxesToSnap:(BOOL)a7 configuration:(id)a8
{
  BOOL v9 = a7;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v15 = a8;
  double v16 = [v15 chamoisLayoutAttributes];
  [v16 stageInterItemSpacing];
  uint64_t v45 = v17;

  [v14 position];
  double v19 = v18;
  double v21 = v20;
  *(double *)&long long v97 = v18;
  *((double *)&v97 + 1) = v20;
  [v14 size];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v49 = v21;
  double v50 = v19;
  CGFloat v26 = v19 - v22 * 0.5;
  CGFloat v27 = v21 - v24 * 0.5;
  v98.origin.CGFloat x = x;
  v98.origin.CGFloat y = y;
  v98.size.CGFloat width = width;
  v98.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v98);
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v99);
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v100);
  v101.origin.CGFloat x = x;
  v101.origin.CGFloat y = y;
  v101.size.CGFloat width = width;
  v101.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v101);
  v102.origin.CGFloat x = x;
  v102.origin.CGFloat y = y;
  v102.size.CGFloat width = width;
  v102.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v102);
  v103.origin.CGFloat x = x;
  v103.origin.CGFloat y = y;
  v103.size.CGFloat width = width;
  v103.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v103);
  v104.origin.CGFloat x = v26;
  v104.origin.CGFloat y = v27;
  v104.size.CGFloat width = v23;
  v104.size.CGFloat height = v25;
  double v28 = CGRectGetMinX(v104);
  v105.origin.CGFloat x = v26;
  v105.origin.CGFloat y = v27;
  v105.size.CGFloat width = v23;
  v105.size.CGFloat height = v25;
  double v56 = CGRectGetMaxX(v105);
  v106.origin.CGFloat x = v26;
  v106.origin.CGFloat y = v27;
  v106.size.CGFloat width = v23;
  v106.size.CGFloat height = v25;
  double v57 = CGRectGetMinY(v106);
  v107.origin.CGFloat x = v26;
  v107.origin.CGFloat y = v27;
  v107.size.CGFloat width = v23;
  v107.size.CGFloat height = v25;
  double v58 = CGRectGetMaxY(v107);
  v108.origin.CGFloat x = v26;
  v108.origin.CGFloat y = v27;
  v108.size.CGFloat width = v23;
  v108.size.CGFloat height = v25;
  CGRectGetMidX(v108);
  [v15 containerBounds];
  double v46 = CGRectGetMidX(v109);
  [v15 containerBounds];
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;

  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke;
  v96[3] = &__block_descriptor_80_e40_B24__0__CGPoint_dd_8____CGPoint_dd____16l;
  v96[4] = v30;
  v96[5] = v32;
  v96[6] = v34;
  v96[7] = v36;
  *(CGFloat *)&v96[8] = v23;
  *(CGFloat *)&v96[9] = v25;
  uint64_t v37 = MEMORY[0x1D948C7A0](v96);
  uint64_t v38 = (uint64_t (**)(void, void, void))v37;
  if (vabdd_f64(MinX, v28) >= a6)
  {
    double v39 = MinX;
    int v40 = 0;
  }
  else
  {
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_2;
    v94[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    double v39 = MinX;
    *(double *)&v94[4] = MinX;
    *(CGFloat *)&v94[5] = v23;
    *(CGFloat *)&v94[6] = v25;
    long long v95 = v97;
    int v40 = (*(uint64_t (**)(uint64_t, long long *, void *))(v37 + 16))(v37, &v97, v94);
  }
  if (vabdd_f64(MaxX, v56) < a6)
  {
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_3;
    v92[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    *(double *)&v92[4] = MaxX;
    *(CGFloat *)&v92[5] = v23;
    *(CGFloat *)&v92[6] = v25;
    long long v93 = v97;
    v40 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v92);
  }
  if (vabdd_f64(MinY, v57) >= a6)
  {
    int v41 = 0;
  }
  else
  {
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_4;
    v87[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    long long v88 = v97;
    double v89 = MinY;
    CGFloat v90 = v23;
    CGFloat v91 = v25;
    int v41 = ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v87);
  }
  if (vabdd_f64(MaxY, v58) < a6)
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_5;
    v82[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    long long v83 = v97;
    double v84 = MaxY;
    CGFloat v85 = v23;
    CGFloat v86 = v25;
    v41 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v82);
  }
  if (vabdd_f64(MaxX, v28) < a6)
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_6;
    v80[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    *(double *)&v80[4] = MaxX;
    v80[5] = v45;
    *(CGFloat *)&v80[6] = v23;
    *(CGFloat *)&v80[7] = v25;
    long long v81 = v97;
    v40 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v80);
  }
  if (vabdd_f64(v39, v56) < a6)
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_7;
    v78[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    *(double *)&v78[4] = v39;
    v78[5] = v45;
    *(CGFloat *)&v78[6] = v23;
    *(CGFloat *)&v78[7] = v25;
    long long v79 = v97;
    v40 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v78);
  }
  double v42 = v49;
  double v43 = v50;
  if (vabdd_f64(MaxY, v57) < a6)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_8;
    v72[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    long long v73 = v97;
    double v74 = MaxY;
    uint64_t v75 = v45;
    CGFloat v76 = v23;
    CGFloat v77 = v25;
    v41 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v72);
  }
  if (vabdd_f64(MinY, v58) < a6)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_9;
    v66[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    long long v67 = v97;
    double v68 = MinY;
    uint64_t v69 = v45;
    CGFloat v70 = v23;
    CGFloat v71 = v25;
    v41 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v66);
  }
  if (vabdd_f64(*(double *)&v97, MidX) < a5)
  {
    if (v40 && vabdd_f64(v50, MidX) > vabdd_f64(*(double *)&v97, v50))
    {
      int v40 = 1;
    }
    else
    {
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_10;
      v64[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      *(double *)&v64[4] = MidX;
      long long v65 = v97;
      v40 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v64);
    }
  }
  if (vabdd_f64(*((double *)&v97 + 1), MidY) < a5)
  {
    if (v41 && vabdd_f64(v49, MidY) > vabdd_f64(*((double *)&v97 + 1), v49))
    {
      int v41 = 1;
    }
    else
    {
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_11;
      v61[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      long long v62 = v97;
      double v63 = MidY;
      v41 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v61);
    }
  }
  if (BSFloatEqualToFloat())
  {
    if (v40 && vabdd_f64(v50, v46) > vabdd_f64(*(double *)&v97, v50))
    {
      int v40 = 1;
    }
    else
    {
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_12;
      v59[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      *(double *)&v59[4] = v46;
      long long v60 = v97;
      v40 |= ((uint64_t (**)(void, long long *, void *))v38)[2](v38, &v97, v59);
    }
  }
  if (v9 && ((v41 ^ v40) & 1) != 0)
  {
    *(double *)&long long v97 = v50;
    *((double *)&v97 + 1) = v49;
  }
  else
  {
    double v42 = *((double *)&v97 + 1);
    double v43 = *(double *)&v97;
  }
  objc_msgSend(v14, "setPosition:", v43, v42);
}

BOOL __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke(CGRect *a1, double *a2, uint64_t a3)
{
  double v5 = (*(double (**)(uint64_t))(a3 + 16))(a3);
  uint64_t v7 = v6;
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  v13.origin.CGFloat x = v8;
  v13.origin.CGFloat y = v9;
  v13.size.CGFloat width = v10;
  v13.size.CGFloat height = v11;
  BOOL result = CGRectContainsRect(a1[1], v13);
  if (result)
  {
    *a2 = v5;
    *((void *)a2 + 1) = v7;
  }
  return result;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32) + *(double *)(a1 + 40) * 0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_3(uint64_t a1)
{
  return *(double *)(a1 + 32) + *(double *)(a1 + 40) * -0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_5(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_6(double *a1)
{
  return a1[4] + a1[5] + a1[6] * 0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_7(double *a1)
{
  return a1[4] - a1[5] + a1[6] * -0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_8(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_9(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_10(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_11(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_12(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)_compactSpacingBetweenItemsInSpace:(id)a3 configuration:(id)a4
{
  id v26 = a4;
  uint64_t v6 = [(SBContinuousExposeAutoLayoutController *)self _itemsSortedByXInSpace:a3 configuration:v26];
  uint64_t v7 = [v26 chamoisLayoutAttributes];
  [v7 stageInterItemSpacing];
  double v9 = v8;

  uint64_t v10 = [v6 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    double v13 = -1.79769313e308;
    do
    {
      id v14 = [v6 objectAtIndex:v12];
      [v14 position];
      double v16 = v15;
      [v14 size];
      double v18 = v17;
      [v14 position];
      double v20 = v19;
      [v14 size];
      double v22 = v21;
      if (v12 && v16 + v18 * -0.5 > v9 + v13)
      {
        [v14 position];
        double v24 = v23;
        [v14 size];
        objc_msgSend(v14, "setPosition:", v9 + v13 + v25 * 0.5, v24);
      }
      if (v13 < v20 + v22 * 0.5) {
        double v13 = v20 + v22 * 0.5;
      }

      ++v12;
    }
    while (v11 != v12);
  }
}

- (id)_itemsSortedByXInSpace:(id)a3 configuration:(id)a4
{
  id v4 = a3;
  double v5 = [v4 items];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 items];
  double v8 = v7;
  if (v6 != 1)
  {
    double v9 = [v7 sortedArrayUsingComparator:&__block_literal_global_27];

    uint64_t v10 = [v4 items];
    uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_29_0];

    uint64_t v12 = [v4 items];
    double v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_31_2];

    id v14 = [v11 firstObject];
    double v15 = [v13 firstObject];
    double v16 = [v9 firstObject];
    char v17 = [v16 isEqual:v14];

    if ((v17 & 1) == 0)
    {
      double v18 = [v9 firstObject];
      [v18 position];
      [v18 size];
      id v19 = v14;
      [v19 position];
      [v19 size];
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        uint64_t v20 = objc_msgSend(v9, "sb_arrayByInsertingOrMovingObject:toIndex:", v19, 0);

        double v9 = (void *)v20;
      }
    }
    double v21 = [v9 lastObject];
    if (([v21 isEqual:v15] & 1) == 0)
    {
      char v22 = [v14 isEqual:v15];

      if (v22)
      {
LABEL_12:

        double v8 = v9;
        goto LABEL_13;
      }
      double v21 = [v9 lastObject];
      [v21 position];
      [v21 size];
      id v23 = v15;
      [v23 position];
      [v23 size];
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        uint64_t v24 = objc_msgSend(v9, "sb_arrayByAddingOrMovingObject:", v23);

        double v9 = (void *)v24;
      }
    }
    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 position];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 position];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = a2;
  [v6 position];
  double v8 = v7;
  [v6 size];
  double v10 = v9;

  uint64_t v11 = [v4 numberWithDouble:v8 - v10 * 0.5];
  uint64_t v12 = NSNumber;
  [v5 position];
  double v14 = v13;
  [v5 size];
  double v16 = v15;

  char v17 = [v12 numberWithDouble:v14 - v16 * 0.5];
  uint64_t v18 = [v11 compare:v17];

  return v18;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = a2;
  [v6 position];
  double v8 = v7;
  [v6 size];
  double v10 = v9;

  uint64_t v11 = [v4 numberWithDouble:v8 + v10 * 0.5];
  uint64_t v12 = NSNumber;
  [v5 position];
  double v14 = v13;
  [v5 size];
  double v16 = v15;

  char v17 = [v12 numberWithDouble:v14 + v16 * 0.5];
  uint64_t v18 = [v17 compare:v11];

  return v18;
}

- (void)_updateOcclusionStatusForItemsInSpace:(id)a3 configuration:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  double v7 = [(SBContinuousExposeAutoLayoutController *)self _fullyOccludedItemsForSpace:v19 configuration:v6];
  double v8 = [v6 chamoisLayoutAttributes];
  [v8 stageInterItemSpacing];
  double v9 = [v19 items];
  uint64_t v10 = [v9 count];
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    CFTypeRef v12 = 0;
    uint64_t v13 = 0;
    double v14 = -1.0;
    do
    {
      double v15 = objc_msgSend(v9, "objectAtIndex:", v13, v14);
      int v16 = [v7 containsObject:v15];
      [v15 position];
      [v15 size];
      if (v16)
      {
        [v15 setFullyOccluded:1];
        [v15 setOverlapped:1];
      }
      else
      {
        [v15 setFullyOccluded:0];
        SBSafeAutoreleasedRegionFromCGRect();
        CFTypeRef v17 = SBSafeAutoreleasedRegionFromCGRect();
        if (v12)
        {
          [v15 setOverlapped:CGRegionIntersectsRegion()];
          UnionWithRegiouint64_t n = (const void *)CGRegionCreateUnionWithRegion();
          CFTypeRef v12 = CFAutorelease(UnionWithRegion);
        }
        else
        {
          [v15 setOverlapped:0];
          CFTypeRef v12 = v17;
        }
      }

      ++v13;
    }
    while (v11 != v13);
  }
}

- (void)dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:(id)a3 configuration:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SBContinuousExposeAutoLayoutController *)self _fullyOccludedItemsForSpace:v6 configuration:v7];
  double v9 = [v7 chamoisLayoutAttributes];
  [v9 stageInterItemSpacing];
  double v92 = v10;
  [v9 stageOcclusionDodgingPeekLength];
  double v100 = v11;
  [v9 screenEdgePadding];
  double v13 = v12;
  long long v83 = v9;
  [v9 stageOcclusionDodgingPeekScale];
  double v91 = v14;
  [v7 containerBounds];
  double v16 = v15;
  double v90 = v15;
  int v84 = _os_feature_enabled_impl();
  if (v84)
  {
    CFTypeRef v17 = (void *)[v6 mutableCopy];
    double v89 = v13;
    UIRectInset();
    CGFloat v96 = v19;
    CGFloat v98 = v18;
    CGFloat v93 = v21;
    CGFloat v94 = v20;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v85 = v17;
    char v22 = [v17 items];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v105 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v102 != v25) {
            objc_enumerationMutation(v22);
          }
          CGFloat v27 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          [v27 position];
          double v29 = v28;
          double v31 = v30;
          [v27 size];
          double v33 = v32;
          double v35 = v34;
          v107.origin.CGFloat x = v98;
          v107.origin.CGFloat y = v96;
          v107.size.CGFloat width = v94;
          v107.size.CGFloat height = v93;
          double v36 = v33 * 0.5;
          double v37 = CGRectGetMinX(v107) + v36;
          if (v29 < v37) {
            double v29 = v37;
          }
          v108.origin.CGFloat x = v98;
          v108.origin.CGFloat y = v96;
          v108.size.CGFloat width = v94;
          v108.size.CGFloat height = v93;
          double v38 = CGRectGetMaxX(v108) - v36;
          if (v29 >= v38) {
            double v29 = v38;
          }
          v109.origin.CGFloat x = v98;
          v109.origin.CGFloat y = v96;
          v109.size.CGFloat width = v94;
          v109.size.CGFloat height = v93;
          double v39 = v35 * 0.5;
          double v40 = v39 + CGRectGetMinY(v109);
          if (v31 >= v40) {
            double v41 = v31;
          }
          else {
            double v41 = v40;
          }
          v110.origin.CGFloat x = v98;
          v110.origin.CGFloat y = v96;
          v110.size.CGFloat width = v94;
          v110.size.CGFloat height = v93;
          double v42 = CGRectGetMaxY(v110) - v39;
          if (v41 >= v42) {
            double v43 = v42;
          }
          else {
            double v43 = v41;
          }
          objc_msgSend(v27, "setPosition:", v29, v43);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v101 objects:v105 count:16];
      }
      while (v24);
    }

    double v13 = v89;
    double v16 = v90;
    int v44 = v84;
  }
  else
  {
    int v44 = 0;
    id v85 = v6;
  }
  CGRect v99 = [v6 items];
  uint64_t v97 = [v99 count];
  if (v97)
  {
    CFTypeRef v45 = 0;
    unsigned __int8 v95 = 0;
    uint64_t v46 = 0;
    double v88 = 1.0 - v91;
    double v87 = v13 * 0.5;
    double v86 = v16 - v13 * 0.5;
    do
    {
      double v47 = [v99 objectAtIndex:v46];
      int v48 = [v8 containsObject:v47];
      [v47 position];
      double v50 = v49;
      double v52 = v51;
      [v47 size];
      double v54 = v53;
      [v47 unoccludedPeekingPosition];
      if (v56 != 1.79769313e308 || v55 != 1.79769313e308)
      {
        [v47 unoccludedPeekingPosition];
        double v50 = v58;
        double v52 = v59;
      }
      if (v48)
      {
        double v60 = v54 * 0.5;
        double v61 = v50;
        while (1)
        {
          do
          {
            double v61 = v61 - v100;
            SBSafeAutoreleasedRegionFromCGRect();
            DifferenceWithRegiouint64_t n = (const void *)CGRegionCreateDifferenceWithRegion();
          }
          while (!CFAutorelease(DifferenceWithRegion));
          if ((CGRegionIsEmpty() & 1) == 0)
          {
            CGRegionGetBoundingBox();
            if (!BSFloatLessThanFloat()) {
              break;
            }
          }
        }
        CGRegionGetBoundingBox();
        double v73 = v61 + v72 - v100;
        double v74 = v50;
        while (1)
        {
          do
          {
            double v74 = v100 + v74;
            SBSafeAutoreleasedRegionFromCGRect();
            uint64_t v75 = (const void *)CGRegionCreateDifferenceWithRegion();
          }
          while (!CFAutorelease(v75));
          if ((CGRegionIsEmpty() & 1) == 0)
          {
            CGRegionGetBoundingBox();
            if (!BSFloatLessThanFloat()) {
              break;
            }
          }
        }
        CGRegionGetBoundingBox();
        double v77 = v87 + v60 * v91;
        if (v92 + v73 - v60 * v88 >= v77) {
          double v77 = v92 + v73 - v60 * v88;
        }
        double v78 = v86 + -v60 * v91;
        if (v100 + v74 - v76 - v92 + v60 * v88 < v78) {
          double v78 = v100 + v74 - v76 - v92 + v60 * v88;
        }
        if (v44 & v95) {
          double v79 = v100 + v74 - v76 - v92 + v60 * v88;
        }
        else {
          double v79 = v78;
        }
        if (v44 & v95) {
          double v80 = v92 + v73 - v60 * v88;
        }
        else {
          double v80 = v77;
        }
        char v81 = BSFloatLessThanFloat();
        char v82 = BSFloatGreaterThanFloat();
        [(SBContinuousExposeAutoLayoutController *)self boundingBoxForSpace:v6 configuration:v7];
        if (((v82 & 1) != 0 || !BSFloatGreaterThanFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
          && ((v81 & 1) == 0 && BSFloatLessThanFloat() && (BSFloatLessThanOrEqualToFloat() & 1) != 0
           || (v82 & 1) != 0
           || (BSFloatLessThanOrEqualToFloat() & 1) == 0))
        {
          double v79 = v80;
        }
        [v47 setFullyOccluded:1];
        [v47 setOverlapped:1];
        objc_msgSend(v47, "setUnoccludedPeekingPosition:", v79, v52);
      }
      else
      {
        [v47 setFullyOccluded:0];
        objc_msgSend(v47, "setUnoccludedPeekingPosition:", 1.79769313e308, 1.79769313e308);
        SBSafeAutoreleasedRegionFromCGRect();
        CFTypeRef v63 = SBSafeAutoreleasedRegionFromCGRect();
        if (v44)
        {
          double v64 = [v85 items];
          [v64 objectAtIndex:v46];
          long long v65 = v8;
          double v66 = self;
          id v67 = v7;
          v69 = id v68 = v6;

          int v44 = v84;
          [v69 position];
          v95 |= v50 != v70;

          id v6 = v68;
          id v7 = v67;
          self = v66;
          double v8 = v65;
        }
        if (v45)
        {
          [v47 setOverlapped:CGRegionIntersectsRegion()];
          UnionWithRegiouint64_t n = (const void *)CGRegionCreateUnionWithRegion();
          CFTypeRef v45 = CFAutorelease(UnionWithRegion);
        }
        else
        {
          [v47 setOverlapped:0];
          CFTypeRef v45 = v63;
        }
      }

      ++v46;
    }
    while (v46 != v97);
  }
}

- (id)_fullyOccludedItemsForSpace:(id)a3 configuration:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v23 = v6;
  double v8 = [v6 chamoisLayoutAttributes];
  [v8 stageInterItemSpacing];
  context = (void *)MEMORY[0x1D948C4D0]([v8 stageOcclusionDodgingPeekLength]);
  char v22 = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v9 = [v5 items];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    CFTypeRef v12 = 0;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v15 position];
        [v15 size];
        SBSafeAutoreleasedRegionFromCGRect();
        CFTypeRef v16 = SBSafeAutoreleasedRegionFromCGRect();
        if (v12)
        {
          DifferenceWithRegiouint64_t n = (const void *)CGRegionCreateDifferenceWithRegion();
          CFAutorelease(DifferenceWithRegion);
          if ((CGRegionIsEmpty() & 1) != 0
            || (CGRegionGetBoundingBox(), (BSFloatLessThanFloat() & 1) != 0)
            || ([v8 isAutoLayoutEnabled] & 1) == 0
            && ([v23 containerBounds],
                SBSafeAutoreleasedRegionFromCGRect(),
                IntersectionWithRegiouint64_t n = (const void *)CGRegionCreateIntersectionWithRegion(),
                CFAutorelease(IntersectionWithRegion),
                CGRegionIsEmpty()))
          {
            [v7 addObject:v15];
          }
          UnionWithRegiouint64_t n = (const void *)CGRegionCreateUnionWithRegion();
          CFTypeRef v12 = CFAutorelease(UnionWithRegion);
        }
        else
        {
          CFTypeRef v12 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  return v7;
}

- (void)updateOverlappingScaleAnchorPositionsForSpace:(id)a3 configuration:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v65 = a4;
  id v6 = [v65 chamoisLayoutAttributes];
  [v6 stageInterItemSpacing];

  id v7 = objc_opt_new();
  double v8 = objc_opt_new();
  [v7 addObject:v8];

  long long v62 = v5;
  double v9 = [v5 items];
  uint64_t v10 = [v9 count];
  CFTypeRef v63 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    CFTypeRef v12 = 0;
    for (uint64_t i = 0; i != v11; ++i)
    {
      double v14 = [v9 objectAtIndex:i];
      [v14 position];
      [v14 size];
      double v15 = [v7 lastObject];
      CFTypeRef v16 = SBSafeAutoreleasedRegionFromCGRect();
      if (v12)
      {
        CFTypeRef v17 = [v9 objectAtIndex:i - 1];
        IntersectionWithRegiouint64_t n = (const void *)CGRegionCreateIntersectionWithRegion();
        CFAutorelease(IntersectionWithRegion);
        if (![v14 isOverlapped]
          || ![v17 isOverlapped]
          || (CGRegionIsEmpty() & 1) == 0)
        {
          goto LABEL_14;
        }
        SBSafeAutoreleasedRegionFromCGRect();
        double v19 = (const void *)CGRegionCreateIntersectionWithRegion();
        CFAutorelease(v19);
        if ((CGRegionIsEmpty() & 1) == 0) {
          CGRegionGetBoundingBox();
        }
        if (BSFloatLessThanFloat() && (BSFloatGreaterThanFloat() & 1) != 0
          || BSFloatGreaterThanFloat() && BSFloatLessThanFloat())
        {
          UnionWithRegiouint64_t n = (const void *)CGRegionCreateUnionWithRegion();
          CFTypeRef v16 = CFAutorelease(UnionWithRegion);
          [v15 addObject:v14];
        }
        else
        {
LABEL_14:
          double v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v14, 0);
          [v7 addObject:v21];
        }
        double v9 = v63;
      }
      else
      {
        [v15 addObject:v14];
      }

      CFTypeRef v12 = v16;
    }
  }
  [(SBContinuousExposeAutoLayoutController *)self stageAreaForSpace:v5 configuration:v65];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [(SBContinuousExposeAutoLayoutController *)self boundingBoxForSpace:v5 configuration:v65];
  v84.origin.CGFloat x = v30;
  v84.origin.double y = v31;
  v84.size.CGFloat width = v32;
  v84.size.double height = v33;
  v82.origin.CGFloat x = v23;
  v82.origin.double y = v25;
  v82.size.CGFloat width = v27;
  v82.size.double height = v29;
  CGRect v83 = CGRectUnion(v82, v84);
  double y = v83.origin.y;
  double height = v83.size.height;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v36 = v7;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v75;
    double v40 = y + height * 0.5;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v75 != v39) {
          objc_enumerationMutation(v36);
        }
        double v42 = *(void **)(*((void *)&v74 + 1) + 8 * j);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v43 = v42;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v79 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          CFTypeRef v46 = 0;
          uint64_t v47 = *(void *)v71;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v71 != v47) {
                objc_enumerationMutation(v43);
              }
              double v49 = *(void **)(*((void *)&v70 + 1) + 8 * k);
              [v49 position];
              [v49 size];
              CFTypeRef v50 = SBSafeAutoreleasedRegionFromCGRect();
              if (v46)
              {
                double v51 = (const void *)CGRegionCreateUnionWithRegion();
                CFTypeRef v46 = CFAutorelease(v51);
              }
              else
              {
                CFTypeRef v46 = v50;
              }
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v70 objects:v79 count:16];
          }
          while (v45);
        }

        CGRegionGetBoundingBox();
        double v53 = v52;
        double v55 = v54;
        UIRectGetCenter();
        double v56 = v53 + v55 * 0.5;
        [v65 containerBounds];
        if (!BSFloatLessThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
        {
          if (BSFloatLessThanOrEqualToFloat()) {
            double v56 = v53;
          }
          else {
            double v56 = v53 + v55;
          }
        }
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v57 = v43;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v67;
          do
          {
            for (uint64_t m = 0; m != v59; ++m)
            {
              if (*(void *)v67 != v60) {
                objc_enumerationMutation(v57);
              }
              objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * m), "setAnchorPosition:", v56, v40);
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v66 objects:v78 count:16];
          }
          while (v59);
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v38);
  }
}

- (CGRect)boundingBoxForSpace:(id)a3 configuration:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CGFloat x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v11 = [v6 chamoisLayoutAttributes];
  [v11 stageOcclusionDodgingPeekScale];
  double v37 = v12;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [v5 items];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    CGFloat v38 = height;
    CGFloat v39 = width;
    CGFloat v40 = y;
    CGFloat v41 = x;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        int v19 = [v18 isFullyOccluded];
        [v18 size];
        double v21 = v20;
        double v23 = v22;
        if (v19
          && ([v6 chamoisLayoutAttributes],
              double v24 = objc_claimAutoreleasedReturnValue(),
              int v25 = [v24 isAutoLayoutEnabled],
              v24,
              v25))
        {
          [v18 unoccludedPeekingPosition];
          double v28 = v37;
        }
        else
        {
          [v18 position];
          double v28 = 1.0;
        }
        double v29 = v21 * v28;
        double v30 = v23 * v28;
        double v31 = v26 - v29 * 0.5;
        double v32 = v27 - v30 * 0.5;
        v48.origin.CGFloat x = x;
        v48.origin.CGFloat y = y;
        v48.size.CGFloat width = width;
        v48.size.CGFloat height = height;
        v52.origin.CGFloat y = v40;
        v52.origin.CGFloat x = v41;
        v52.size.CGFloat height = v38;
        v52.size.CGFloat width = v39;
        if (CGRectEqualToRect(v48, v52))
        {
          CGFloat height = v30;
          CGFloat width = v29;
          CGFloat y = v32;
          CGFloat x = v31;
        }
        else
        {
          v49.origin.CGFloat x = x;
          v49.origin.CGFloat y = y;
          v49.size.CGFloat width = width;
          v49.size.CGFloat height = height;
          v53.origin.CGFloat x = v31;
          v53.origin.CGFloat y = v32;
          v53.size.CGFloat width = v29;
          v53.size.CGFloat height = v30;
          CGRect v50 = CGRectUnion(v49, v53);
          CGFloat x = v50.origin.x;
          CGFloat y = v50.origin.y;
          CGFloat width = v50.size.width;
          CGFloat height = v50.size.height;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v15);
  }

  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (void)_updateCompactedFramesForSpace:(id)a3 configuration:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [v8 chamoisLayoutAttributes];
  [v9 switcherPileCompactingFactor];
  double v56 = v10;
  [v8 containerBounds];
  UIRectGetCenter();
  double v54 = v12;
  double v55 = v11;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v13 = [v7 items];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    SEL v53 = a2;
    uint64_t v16 = *(void *)v60;
    double v17 = 1.79769313e308;
    double v18 = -1.79769313e308;
    double v19 = -1.79769313e308;
    double v20 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(v13);
        }
        double v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        objc_msgSend(v22, "size", v53);
        double v24 = v23;
        double v26 = v25;
        int v27 = [v9 isAutoLayoutEnabled];
        if ([v22 isFullyOccluded]) {
          BOOL v28 = v27 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        double v58 = v17;
        if (v28)
        {
          double v57 = v24;
          double v29 = v26;
          [v22 position];
          double v31 = v30;
          double v33 = v32;
          [v22 anchorPosition];
          double v35 = v34;
          double v37 = v36;
          int v38 = [v22 isOverlapped];
          double v39 = 1.0;
          if ((v38 & v27) == 1) {
            objc_msgSend(v9, "partiallyOccludedStageScaleForItemWithSize:", v57, v29);
          }
          double v40 = v31 - (v31 - v35) * (1.0 - v39);
          double v41 = v33 - (v33 - v37) * (1.0 - v39);
          double v26 = v29;
          double v24 = v57;
        }
        else
        {
          [v22 unoccludedPeekingPosition];
          double v40 = v42;
          double v41 = v43;
          if (v42 == 1.79769313e308 && v43 == 1.79769313e308)
          {
            CGRect v52 = [MEMORY[0x1E4F28B00] currentHandler];
          }
          [v9 stageOcclusionDodgingPeekScale];
        }
        double v45 = v24 * v39;
        double v46 = v26 * v39;
        double v47 = v55 + v56 * (v40 - v55);
        double v48 = v54 + v56 * (v41 - v54);
        objc_msgSend(v22, "setCompactedPosition:", v47, v48);
        double v49 = v47 - v45 * 0.5;
        double v50 = v48 - v46 * 0.5;
        if (v20 >= v49) {
          double v20 = v47 - v45 * 0.5;
        }
        double v51 = v45 + v49;
        if (v19 < v51) {
          double v19 = v51;
        }
        double v17 = v58;
        if (v58 >= v50) {
          double v17 = v48 - v46 * 0.5;
        }
        if (v18 < v46 + v50) {
          double v18 = v46 + v50;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v15);
  }

  [v8 screenScale];
  UIRectRoundToScale();
  objc_msgSend(v7, "setCompactedBoundingBox:");
}

- (void)_updateItemsCoveredByFullyOccludedPeekingItemsInSpace:(id)a3 configuration:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 chamoisLayoutAttributes];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v22 = v5;
  id v8 = [v5 items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    CFTypeRef v11 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v14 size];
        double v16 = v15;
        double v18 = v17;
        int v19 = [v14 isFullyOccluded];
        if (v19)
        {
          [v14 unoccludedPeekingPosition];
          [v7 stageOcclusionDodgingPeekScale];
        }
        else
        {
          [v14 position];
          if ([v14 isOverlapped]) {
            objc_msgSend(v7, "partiallyOccludedStageScaleForItemWithSize:", v16, v18);
          }
        }
        CFTypeRef v20 = SBSafeAutoreleasedRegionFromCGRect();
        if (v11)
        {
          [v14 setPartiallyCoveredByPeekingItem:CGRegionIntersectsRegion()];
          if (v19)
          {
            UnionWithRegiouint64_t n = (const void *)CGRegionCreateUnionWithRegion();
            CFAutorelease(UnionWithRegion);
          }
        }
        else
        {
          if (v19) {
            CFTypeRef v11 = v20;
          }
          else {
            CFTypeRef v11 = 0;
          }
          [v14 setPartiallyCoveredByPeekingItem:0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

@end