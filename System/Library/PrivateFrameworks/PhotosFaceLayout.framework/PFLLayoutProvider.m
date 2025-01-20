@interface PFLLayoutProvider
- (BOOL)resultsAreValid;
- (PFLCLayout)watchLayout;
- (PFLLayoutProvider)initWithTimePosition:(unint64_t)a3;
- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8;
- (unint64_t)timePosition;
- (void)invalidateResults;
@end

@implementation PFLLayoutProvider

- (PFLLayoutProvider)initWithTimePosition:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)PFLLayoutProvider;
  v4 = [(PFLLayoutProvider *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_unint64_t timePosition = a3;
    v4->_resultsAreValid = 0;
    watchLayout = v4->_watchLayout;
    v4->_watchLayout = 0;
  }
  v7 = pfl_layout_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t timePosition = v5->_timePosition;
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    __int16 v13 = 2048;
    unint64_t v14 = timePosition;
    _os_log_impl(&dword_259336000, v7, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): CREATED for time position %ld.", buf, 0x16u);
  }

  return v5;
}

- (void)invalidateResults
{
  self->_resultsAreValid = 0;
  self->_watchLayout = 0;
  MEMORY[0x270F9A758]();
}

- (id)generateOrientedLayoutsForFullExtent:(CGRect)a3 layoutConfiguration:(id)a4 layoutRegions:(id)a5 segmentationMatteImage:(id)a6 segmentationClassification:(unint64_t)a7 error:(id *)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = pfl_layout_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v181 = self;
    _os_log_impl(&dword_259336000, v16, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): generateOrientedLayout CALLED.", buf, 0xCu);
  }
  double v162 = height;
  CGFloat v163 = width;

  v17 = (void *)MEMORY[0x263F00628];
  id v18 = v15;
  v19 = [v17 context];
  [v18 extent];
  v20 = (CGImage *)objc_msgSend(v19, "createCGImage:fromRect:", v18);

  v21 = [v14 faceRegions];
  v22 = flipYNormalizedRects(v21);

  v23 = [v14 petRegions];
  v24 = flipYNormalizedRects(v23);

  v25 = pfl_layout_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = v13;
    uint64_t v27 = [v22 count];
    uint64_t v28 = [v24 count];
    *(_DWORD *)buf = 134218496;
    v181 = (PFLLayoutProvider *)v27;
    id v13 = v26;
    __int16 v182 = 2048;
    uint64_t v183 = v28;
    __int16 v184 = 2048;
    v185 = v20;
    _os_log_impl(&dword_259336000, v25, OS_LOG_TYPE_DEFAULT, "PFL:   %ld face rects, %ld pet rects, mask == %p", buf, 0x20u);
  }

  [v13 timeRect];
  double v33 = flipYNormalizedRect(v29, v30, v31, v32);
  CGFloat v164 = v34;
  CGFloat v165 = v33;
  double v36 = v35;
  double v38 = v37;
  [v14 preferredCropRect];
  flipYNormalizedRect(v39, v40, v41, v42);
  [v14 acceptableCropRect];
  double v47 = flipYNormalizedRect(v43, v44, v45, v46);
  CGFloat v49 = v48;
  double v51 = v50;
  CGFloat v53 = v52;
  [v13 screenSize];
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  [(PFLLayoutProvider *)self timePosition];
  CGFloat v155 = v38;
  CGFloat v156 = v36;
  uint64_t v147 = v57;
  double v58 = v163;
  v59 = PFLCCalculateLayout();
  CGImageRelease(v20);
  objc_msgSend(v59, "visibleRect", *(void *)&v47, *(void *)&v49, *(void *)&v51, *(void *)&v53, v55, v147, *(void *)&v165, *(void *)&v164, *(void *)&v36, *(void *)&v38);
  if (CGRectIsEmpty(v188))
  {
    v60 = pfl_layout_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259336000, v60, OS_LOG_TYPE_DEFAULT, "PFL: Using backup", buf, 2u);
    }

    [v13 screenSize];
    double v159 = v62;
    double v160 = v61;
    double v63 = *MEMORY[0x263F5DE98] * 0.5;
    unint64_t v161 = [v22 count];
    CGFloat v151 = v49;
    CGFloat v152 = v47;
    CGFloat v149 = v53;
    CGFloat v150 = v51;
    if (v161)
    {
      id v64 = v22;
      double v65 = *MEMORY[0x263F00148];
      double v66 = *(double *)(MEMORY[0x263F00148] + 8);
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      uint64_t v67 = [v64 countByEnumeratingWithState:&v171 objects:buf count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        double v148 = v63;
        v153 = v24;
        id v157 = v13;
        unint64_t v69 = 0;
        uint64_t v70 = *(void *)v172;
        double v71 = v66;
        double v72 = v65;
        do
        {
          for (uint64_t i = 0; i != v68; ++i)
          {
            if (*(void *)v172 != v70) {
              objc_enumerationMutation(v64);
            }
            [*(id *)(*((void *)&v171 + 1) + 8 * i) rectValue];
            double v72 = v72 + v75 + v74 * 0.5;
            double v71 = v71 + v77 + v76 * 0.5;
          }
          v69 += v68;
          uint64_t v68 = [v64 countByEnumeratingWithState:&v171 objects:buf count:16];
        }
        while (v68);
        if (v69)
        {
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          id v78 = v64;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v167 objects:&v176 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            double v81 = (double)v69;
            double v82 = v72 / (double)v69;
            uint64_t v83 = *(void *)v168;
            double v84 = 1.79769313e308;
            double v85 = v71 / v81;
            do
            {
              for (uint64_t j = 0; j != v80; ++j)
              {
                if (*(void *)v168 != v83) {
                  objc_enumerationMutation(v78);
                }
                [*(id *)(*((void *)&v167 + 1) + 8 * j) rectValue];
                double v89 = v88 + v87 * 0.5;
                double v92 = (v91 + v90 * 0.5 - v85) * (v91 + v90 * 0.5 - v85);
                if (v92 + (v89 - v82) * (v89 - v82) < v84)
                {
                  double v84 = v92 + (v89 - v82) * (v89 - v82);
                  double v65 = v89;
                }
              }
              uint64_t v80 = [v78 countByEnumeratingWithState:&v167 objects:&v176 count:16];
            }
            while (v80);
          }

          id v13 = v157;
          v24 = v153;
          double v58 = v163;
        }
        else
        {
          id v13 = v157;
          v24 = v153;
        }
        double v63 = v148;
      }
    }
    else
    {
      v189.origin.double x = v47;
      v189.origin.double y = v49;
      v189.size.CGFloat width = v51;
      v189.size.CGFloat height = v53;
      if (CGRectIsEmpty(v189)) {
        double v65 = 0.5;
      }
      else {
        double v65 = v47 + v51 * 0.5;
      }
    }
    double v93 = reduceRectToAspectRatioWithCushion(0.0, 0.0, v58, v162, v160 / v159, v63, v58 * v65);
    CGFloat v95 = v94;
    CGFloat v97 = v96;
    CGFloat v99 = v98;
    CGAffineTransformMakeScale(&v166, 1.0 / v58, 1.0 / v162);
    v190.origin.double x = v93;
    v190.origin.double y = v95;
    v190.size.CGFloat width = v97;
    v190.size.CGFloat height = v99;
    CGRect v191 = CGRectApplyAffineTransform(v190, &v166);
    double x = v191.origin.x;
    double y = v191.origin.y;
    double v102 = v191.size.width;
    double v103 = v191.size.height;
    v104 = pfl_layout_log();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      _rectAsString(x, y, v102, v103);
      v105 = (PFLLayoutProvider *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v181 = v105;
      _os_log_impl(&dword_259336000, v104, OS_LOG_TYPE_DEFAULT, "PFL: Backup crop == %@", buf, 0xCu);
    }
    double v106 = renormalizeRect(v165, v164, v156, v155, x, y, v102, v103);
    CGFloat v108 = v107;
    CGFloat v110 = v109;
    CGFloat v112 = v111;
    if (v161)
    {
      id v113 = v22;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      uint64_t v114 = [v113 countByEnumeratingWithState:&v176 objects:buf count:16];
      if (v114)
      {
        uint64_t v115 = v114;
        v154 = v24;
        id v158 = v13;
        unint64_t v116 = 0;
        uint64_t v117 = *(void *)v177;
        do
        {
          for (uint64_t k = 0; k != v115; ++k)
          {
            if (*(void *)v177 != v117) {
              objc_enumerationMutation(v113);
            }
            [*(id *)(*((void *)&v176 + 1) + 8 * k) rectValue];
            v195.origin.double x = v119;
            v195.origin.double y = v120;
            v195.size.CGFloat width = v121;
            v195.size.CGFloat height = v122;
            v192.origin.double x = v106;
            v192.origin.double y = v108;
            v192.size.CGFloat width = v110;
            v192.size.CGFloat height = v112;
            v116 += CGRectIntersectsRect(v192, v195);
          }
          uint64_t v115 = [v113 countByEnumeratingWithState:&v176 objects:buf count:16];
        }
        while (v115);
        double v123 = (double)v116 * 0.1;
        id v13 = v158;
        v24 = v154;
      }
      else
      {
        double v123 = 0.0;
      }

      double v124 = 0.1 - v123 / (double)v161;
    }
    else
    {
      v193.origin.double x = v152;
      v193.origin.double y = v151;
      v193.size.CGFloat width = v150;
      v193.size.CGFloat height = v149;
      if (CGRectIsEmpty(v193))
      {
        double v124 = 0.1;
      }
      else
      {
        v194.origin.double x = v106;
        v194.origin.double y = v108;
        v194.size.CGFloat width = v110;
        v194.size.CGFloat height = v112;
        v196.origin.double x = v152;
        v196.origin.double y = v151;
        v196.size.CGFloat width = v150;
        v196.size.CGFloat height = v149;
        if (CGRectIntersectsRect(v194, v196)) {
          double v124 = 0.0;
        }
        else {
          double v124 = 0.1;
        }
      }
    }
    uint64_t v125 = objc_msgSend(objc_alloc(MEMORY[0x263F5DEB8]), "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", 0, v124, 0.0, 0.0, x, y, v102, v103);

    v59 = (void *)v125;
  }
  [v59 visibleRect];
  double v130 = flipYNormalizedRect(v126, v127, v128, v129);
  double v132 = v131;
  double v134 = v133;
  double v136 = v135;
  id v137 = objc_alloc(MEMORY[0x263F5DF30]);
  [v59 cropScore];
  double v139 = v138;
  [v59 layoutScore];
  v141 = objc_msgSend(v137, "initWithVisibleRect:cropScore:layoutScore:", v130, v132, v134, v136, v139, v140);
  self->_resultsAreValid = 1;
  watchLayout = self->_watchLayout;
  self->_watchLayout = (PFLCLayout *)v59;
  id v143 = v59;

  v144 = pfl_layout_log();
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v181 = self;
    _os_log_impl(&dword_259336000, v144, OS_LOG_TYPE_DEFAULT, "PFL: PFLLayoutProvider(%@): generateOrientedLayout DONE", buf, 0xCu);
  }

  v175 = v141;
  v145 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v175 count:1];

  return v145;
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (BOOL)resultsAreValid
{
  return self->_resultsAreValid;
}

- (PFLCLayout)watchLayout
{
  return self->_watchLayout;
}

- (void).cxx_destruct
{
}

@end