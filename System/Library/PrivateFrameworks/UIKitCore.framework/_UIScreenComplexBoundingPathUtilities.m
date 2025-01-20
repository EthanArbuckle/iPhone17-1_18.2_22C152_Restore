@interface _UIScreenComplexBoundingPathUtilities
+ (BOOL)isScreenSupported:(id)a3;
- (_UIScreenComplexBoundingPathUtilities)initWithScreen:(id)a3;
- (id)boundingPathForWindow:(id)a3;
- (void)_loadBitmapForScreen:(id)a3 type:(int64_t)a4;
@end

@implementation _UIScreenComplexBoundingPathUtilities

- (id)boundingPathForWindow:(id)a3
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(_UIScreenBoundingPathUtilities *)self _screen];
  v7 = [v5 screen];

  if (v7 != v6)
  {
    v162 = [MEMORY[0x1E4F28B00] currentHandler];
    [v162 handleFailureInMethod:a2 object:self file:@"_UIScreenComplexBoundingPathUtilities.m" lineNumber:238 description:@"Cannot provide the bounding path for a window associated with a different screen."];
  }
  uint64_t v8 = [v6 coordinateSpace];
  [v6 scale];
  CGFloat v10 = v9;
  if (v9 == 0.0)
  {
    v163 = [MEMORY[0x1E4F28B00] currentHandler];
    v164 = NSStringFromSelector(a2);
    [v163 handleFailureInMethod:a2, self, @"_UIScreenComplexBoundingPathUtilities.m", 242, @"Scale cannot be zero in %@", v164 object file lineNumber description];
  }
  v194 = (void *)v8;
  v192 = self;
  if ([v6 _interfaceOrientation]) {
    uint64_t v195 = [v6 _interfaceOrientation];
  }
  else {
    uint64_t v195 = 1;
  }
  id v11 = v5;
  v12 = [v11 windowScene];
  v13 = [v12 _effectiveSettings];

  double v193 = v10;
  if (([v13 isUISubclass] & 1) == 0)
  {

    goto LABEL_34;
  }
  [v13 frame];
  CGFloat v15 = v14;
  CGFloat v184 = v17;
  CGFloat v185 = v16;
  CGFloat v19 = v18;
  v20 = [v11 screen];
  [v20 _referenceBounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  [v11 _currentScreenScale];
  double v30 = v29;
  v31 = [v11 screen];
  [v31 _displayCornerRadius];
  unint64_t v33 = llround(v30 * v32);

  v34 = [v13 cornerRadiusConfiguration];
  [v34 topLeft];
  int64_t v36 = llround(v30 * v35);
  CGFloat v187 = v26;
  CGFloat v189 = v24;
  CGFloat rect = v28;
  if (v36 != v33) {
    goto LABEL_14;
  }
  v216.origin.double x = v15;
  v216.size.double width = v184;
  v216.origin.double y = v185;
  v216.size.double height = v19;
  CGFloat v183 = v15;
  double MinX = CGRectGetMinX(v216);
  v217.origin.double x = v22;
  v217.origin.double y = v24;
  v217.size.double width = v26;
  v217.size.double height = v28;
  double v38 = vabdd_f64(MinX, CGRectGetMinX(v217));
  CGFloat v15 = v183;
  if (v38 >= 0.01) {
    goto LABEL_14;
  }
  v218.origin.double x = v183;
  v218.size.double width = v184;
  v218.origin.double y = v185;
  v218.size.double height = v19;
  double MinY = CGRectGetMinY(v218);
  v219.origin.double x = v22;
  v219.origin.double y = v24;
  v219.size.double width = v26;
  v219.size.double height = v28;
  double v40 = vabdd_f64(MinY, CGRectGetMinY(v219));
  CGFloat v15 = v183;
  if (v40 < 0.01)
  {
    CGFloat v42 = v184;
    CGFloat v41 = v185;
    CGFloat v43 = v183;
    int64_t v36 = 0;
  }
  else
  {
LABEL_14:
    CGFloat v42 = v184;
    CGFloat v41 = v185;
    CGFloat v43 = v15;
  }
  [v34 bottomLeft];
  int64_t v45 = llround(v30 * v44);
  SEL v182 = a2;
  if (v45 == v33)
  {
    v220.origin.double x = v43;
    v220.origin.double y = v41;
    v220.size.double width = v42;
    v220.size.double height = v19;
    double v46 = CGRectGetMinX(v220);
    v221.origin.double x = v22;
    v221.size.double width = v187;
    v221.origin.double y = v189;
    v221.size.double height = rect;
    if (vabdd_f64(v46, CGRectGetMinX(v221)) < 0.01)
    {
      v222.origin.double x = v43;
      v222.origin.double y = v41;
      v222.size.double width = v42;
      v222.size.double height = v19;
      double MaxY = CGRectGetMaxY(v222);
      v223.origin.double x = v22;
      v223.size.double width = v187;
      v223.origin.double y = v189;
      v223.size.double height = rect;
      if (vabdd_f64(MaxY, CGRectGetMaxY(v223)) < 0.01) {
        int64_t v45 = 0;
      }
    }
  }
  [v34 bottomRight];
  int64_t v49 = llround(v30 * v48);
  if (v49 == v33)
  {
    v224.origin.double x = v43;
    v224.origin.double y = v41;
    v224.size.double width = v42;
    v224.size.double height = v19;
    double MaxX = CGRectGetMaxX(v224);
    v225.origin.double x = v22;
    v225.size.double width = v187;
    v225.origin.double y = v189;
    v225.size.double height = rect;
    if (vabdd_f64(MaxX, CGRectGetMaxX(v225)) < 0.01)
    {
      v226.origin.double x = v43;
      v226.origin.double y = v41;
      v226.size.double width = v42;
      v226.size.double height = v19;
      double v51 = CGRectGetMaxY(v226);
      v227.origin.double x = v22;
      v227.size.double width = v187;
      v227.origin.double y = v189;
      v227.size.double height = rect;
      if (vabdd_f64(v51, CGRectGetMaxY(v227)) < 0.01) {
        int64_t v49 = 0;
      }
    }
  }
  [v34 topRight];
  int64_t v53 = llround(v30 * v52);
  if (v53 == v33)
  {
    v228.origin.double x = v43;
    v228.origin.double y = v41;
    v228.size.double width = v42;
    v228.size.double height = v19;
    double v54 = CGRectGetMaxX(v228);
    v229.origin.double x = v22;
    v229.origin.double y = v189;
    v229.size.double height = rect;
    v229.size.double width = v187;
    if (vabdd_f64(v54, CGRectGetMaxX(v229)) < 0.01)
    {
      v230.origin.double x = v43;
      v230.origin.double y = v41;
      v230.size.double width = v42;
      v230.size.double height = v19;
      double v55 = CGRectGetMinY(v230);
      v231.origin.double x = v22;
      v231.origin.double y = v189;
      v231.size.double height = rect;
      v231.size.double width = v187;
      if (vabdd_f64(v55, CGRectGetMinY(v231)) < 0.01) {
        int64_t v53 = 0;
      }
    }
  }

  CGFloat v10 = v193;
  if (!(v45 | v36 | v49 | v53))
  {
LABEL_34:
    [v11 bounds];
    v70 = v194;
    objc_msgSend(v194, "convertRect:fromCoordinateSpace:", v11);
    CGFloat v72 = v71;
    CGFloat v74 = v73;
    CGFloat v76 = v75;
    CGFloat v78 = v77;
    CGAffineTransformMakeScale(&v198, v10, v10);
    v235.origin.double x = v72;
    v235.origin.double y = v74;
    v235.size.double width = v76;
    CGFloat v191 = v78;
    v235.size.double height = v78;
    CGRect v236 = CGRectApplyAffineTransform(v235, &v198);
    double x = v236.origin.x;
    double y = v236.origin.y;
    double width = v236.size.width;
    double height = v236.size.height;
    bitmap = v192->_bitmap;
    if (bitmap)
    {
      [(_UIBoundingPathBitmap *)bitmap bitmapData];
      v84 = v192->_bitmap;
      double v85 = (double)v197;
      uint64_t v86 = v195;
      if (v84)
      {
        [(_UIBoundingPathBitmap *)v84 bitmapData];
        double v87 = (double)v196;
        goto LABEL_39;
      }
    }
    else
    {
      double v85 = 0.0;
      uint64_t v86 = v195;
    }
    double v87 = 0.0;
LABEL_39:
    v237.origin.double x = _UIWindowConvertRectFromOrientationToOrientation(v86, 1, x, y, width, height, v85, v87);
    CGRect v238 = CGRectIntegral(v237);
    uint64_t v88 = (uint64_t)v238.origin.x;
    uint64_t v89 = (uint64_t)v238.origin.y;
    if ((int)(uint64_t)v238.origin.x >= 0) {
      unsigned int v90 = (uint64_t)v238.origin.x;
    }
    else {
      unsigned int v90 = -(int)v88;
    }
    if ((int)v89 >= 0) {
      unsigned int v91 = (uint64_t)v238.origin.y;
    }
    else {
      unsigned int v91 = -(int)v89;
    }
    if (!(v90 >> 15)
      && !(v91 >> 15)
      && (uint64_t)v238.size.width + v88 < 0x8000
      && (uint64_t)v238.size.height + v89 < 0x8000)
    {
      v92 = v192->_bitmap;
      *(void *)buf = (uint64_t)v238.origin.x;
      *(void *)&buf[8] = (uint64_t)v238.origin.y;
      *(void *)&buf[16] = (uint64_t)v238.size.width;
      uint64_t v211 = (uint64_t)v238.size.height;
      v93 = [(_UIBoundingPathBitmap *)v92 boundingPathBitmapWithRect:buf];
LABEL_50:
      v94 = [[_UIComplexBoundingPath alloc] initWithCoordinateSpace:v11 orientation:v86 scale:v93 boundingPathBitmap:v193];

      goto LABEL_113;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v96 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v96, OS_LOG_TYPE_FAULT)) {
        goto LABEL_55;
      }
      v247.origin.double x = v72;
      v247.origin.double y = v74;
      v247.size.double width = v76;
      v247.size.double height = v191;
      v97 = NSStringFromCGRect(v247);
      v98 = [v11 windowScene];
      v99 = -[UIWindow _fbsScene]((id *)v11);
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v211 = (uint64_t)v98;
      __int16 v212 = 2112;
      v213 = v99;
      _os_log_fault_impl(&dword_1853B0000, v96, OS_LOG_TYPE_FAULT, "Window bounds in screen %@ exceeds limits for bitmap data: %@ %@ %@", buf, 0x2Au);
    }
    else
    {
      v95 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260E40) + 8);
      if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
LABEL_56:
        v94 = +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:v11 inScreenCoordinateSpace:v194];
        goto LABEL_113;
      }
      v96 = v95;
      v239.origin.double x = v72;
      v239.origin.double y = v74;
      v239.size.double width = v76;
      v239.size.double height = v191;
      v97 = NSStringFromCGRect(v239);
      v98 = [v11 windowScene];
      v99 = -[UIWindow _fbsScene]((id *)v11);
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v97;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v211 = (uint64_t)v98;
      __int16 v212 = 2112;
      v213 = v99;
      _os_log_impl(&dword_1853B0000, v96, OS_LOG_TYPE_ERROR, "Window bounds in screen %@ exceeds limits for bitmap data: %@ %@ %@", buf, 0x2Au);
    }

LABEL_55:
    goto LABEL_56;
  }
  v56 = [v11 windowScene];
  v57 = [v56 _effectiveSettings];

  if (([v57 isUISubclass] & 1) == 0)
  {
    v165 = [MEMORY[0x1E4F28B00] currentHandler];
    [v165 handleFailureInMethod:v182, v192, @"_UIScreenComplexBoundingPathUtilities.m", 255, @"Expected UIApplicationSceneSettings subclass but got %@", v57 object file lineNumber description];
  }
  v190 = v57;
  [v57 frame];
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  CGAffineTransformMakeScale(&v209, v193, v193);
  v232.origin.double x = v59;
  v232.origin.double y = v61;
  v232.size.double width = v63;
  v232.size.double height = v65;
  CGRect v233 = CGRectApplyAffineTransform(v232, &v209);
  CGRect v234 = CGRectIntegral(v233);
  uint64_t v66 = (uint64_t)v234.origin.x;
  uint64_t v67 = (uint64_t)v234.origin.y;
  if (v195 == 2)
  {
    int64_t v68 = v36;
    int64_t v69 = v53;
    int64_t v53 = v49;
    int64_t v49 = v45;
  }
  else if (v195 == 3)
  {
    int64_t v68 = v53;
    int64_t v69 = v49;
    int64_t v53 = v45;
    int64_t v49 = v36;
  }
  else
  {
    int64_t v68 = v45;
    int64_t v69 = v36;
    if (v195 != 4) {
      goto LABEL_60;
    }
  }
  int64_t v36 = v53;
  int64_t v53 = v49;
  int64_t v49 = v68;
  int64_t v45 = v69;
LABEL_60:
  if ((int)v66 >= 0) {
    unsigned int v100 = (uint64_t)v234.origin.x;
  }
  else {
    unsigned int v100 = -(int)v66;
  }
  if ((int)v67 >= 0) {
    unsigned int v101 = (uint64_t)v234.origin.y;
  }
  else {
    unsigned int v101 = -(int)v67;
  }
  if (v100 >> 15
    || v101 >> 15
    || (uint64_t v102 = (uint64_t)v234.size.width, (uint64_t)v234.size.width + v66 >= 0x8000)
    || (uint64_t)v234.size.height + v67 >= 0x8000)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v166 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_FAULT))
      {
        v249.origin.double x = v59;
        v249.origin.double y = v61;
        v249.size.double width = v63;
        v249.size.double height = v65;
        v174 = NSStringFromCGRect(v249);
        v175 = [v11 windowScene];
        v176 = -[UIWindow _fbsScene]((id *)v11);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v174;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v175;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v211 = (uint64_t)v176;
        _os_log_fault_impl(&dword_1853B0000, v166, OS_LOG_TYPE_FAULT, "Scene frame %@ exceeds limits for bitmap data: %@ %@", buf, 0x20u);
      }
      v70 = v194;
      v116 = v190;
    }
    else
    {
      v115 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1092) + 8);
      v70 = v194;
      v116 = v190;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v117 = v115;
        v241.origin.double x = v59;
        v241.origin.double y = v61;
        v241.size.double width = v63;
        v241.size.double height = v65;
        v118 = NSStringFromCGRect(v241);
        v119 = [v11 windowScene];
        v120 = -[UIWindow _fbsScene]((id *)v11);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v118;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v119;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v211 = (uint64_t)v120;
        _os_log_impl(&dword_1853B0000, v117, OS_LOG_TYPE_ERROR, "Scene frame %@ exceeds limits for bitmap data: %@ %@", buf, 0x20u);
      }
    }
    v94 = +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:v11 inScreenCoordinateSpace:v70];
  }
  else
  {
    if (v36 <= v45) {
      int64_t v103 = v45;
    }
    else {
      int64_t v103 = v36;
    }
    if (v53 <= v49) {
      int64_t v104 = v49;
    }
    else {
      int64_t v104 = v53;
    }
    if (v103 + v104 <= v102
      && (v36 <= v53 ? (int64_t v105 = v53) : (int64_t v105 = v36),
          v45 <= v49 ? (int64_t v106 = v49) : (int64_t v106 = v45),
          v105 + v106 <= (uint64_t)v234.size.height))
    {
      v121 = v192->_bitmap;
      *(void *)buf = (uint64_t)v234.origin.x;
      *(void *)&buf[8] = (uint64_t)v234.origin.y;
      *(void *)&buf[16] = (uint64_t)v234.size.width;
      uint64_t v211 = (uint64_t)v234.size.height;
      v208[0] = v36;
      v208[1] = v45;
      v208[2] = v49;
      v208[3] = v53;
      uint64_t v114 = [(_UIBoundingPathBitmap *)v121 boundingPathBitmapWithRect:buf cornerRadii:v208];
    }
    else
    {
      uint64_t v188 = (uint64_t)v234.size.height;
      if (os_variant_has_internal_diagnostics())
      {
        [MEMORY[0x1E4F28B00] currentHandler];
        v168 = uint64_t v167 = v102;
        [v190 frame];
        v169 = NSStringFromCGRect(v248);
        v170 = [v190 cornerRadiusConfiguration];
        v107 = v192;
        [v168 handleFailureInMethod:v182, v192, @"_UIScreenComplexBoundingPathUtilities.m", 285, @"Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@. Scene settings: %@", v169, v170, v190 object file lineNumber description];

        uint64_t v102 = v167;
      }
      else
      {
        v107 = v192;
        if (os_variant_has_internal_diagnostics())
        {
          uint64_t v171 = v102;
          v172 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v172, OS_LOG_TYPE_FAULT))
          {
            [v190 frame];
            v177 = NSStringFromCGRect(v250);
            v178 = [v190 cornerRadiusConfiguration];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v177;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v178;
            _os_log_fault_impl(&dword_1853B0000, v172, OS_LOG_TYPE_FAULT, "Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@", buf, 0x16u);
          }
          CGFloat v10 = v193;
          uint64_t v102 = v171;
          v107 = v192;
        }
        else
        {
          v108 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260E30) + 8);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = v108;
            [v190 frame];
            NSStringFromCGRect(v240);
            v111 = uint64_t v110 = v102;
            v112 = [v190 cornerRadiusConfiguration];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v111;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v112;
            _os_log_impl(&dword_1853B0000, v109, OS_LOG_TYPE_ERROR, "Invalid scene settings detected: the scene frame (%@) is too small to fit the scene's rounded corners: %@", buf, 0x16u);

            uint64_t v102 = v110;
          }
        }
      }
      v113 = v107->_bitmap;
      *(void *)buf = v66;
      *(void *)&buf[8] = v67;
      *(void *)&buf[16] = v102;
      uint64_t v211 = v188;
      uint64_t v114 = [(_UIBoundingPathBitmap *)v113 boundingPathBitmapWithRect:buf];
    }
    v122 = (void *)v114;
    id v123 = v11;
    v124 = [v123 layer];
    [v123 bounds];
    objc_msgSend(v124, "convertRect:toLayer:", 0);
    double v126 = v125;
    double v128 = v127;
    double v130 = v129;
    double v132 = v131;

    [v123 _sceneReferenceBounds];
    double v134 = v133;
    double v136 = v135;
    uint64_t v137 = [v123 _sceneOrientation];
    uint64_t v138 = [v123 interfaceOrientation];

    double v139 = _UIWindowConvertRectFromOrientationToOrientation(v137, v138, v126, v128, v130, v132, v134, v136);
    CGFloat v141 = v140;
    CGFloat v143 = v142;
    CGFloat v145 = v144;
    CGAffineTransformMakeScale(&v207, v10, v10);
    v242.origin.double x = v139;
    v242.origin.double y = v141;
    v242.size.double width = v143;
    v242.size.double height = v145;
    CGRect v243 = CGRectApplyAffineTransform(v242, &v207);
    double v146 = v243.origin.x;
    double v147 = v243.origin.y;
    double v148 = v243.size.width;
    double v149 = v243.size.height;
    v116 = v190;
    if (v122)
    {
      [v122 bitmapData];
      [v122 bitmapData];
      double v150 = (double)(unint64_t)v203;
      double v151 = (double)*((unint64_t *)&v199 + 1);
    }
    else
    {
      uint64_t v206 = 0;
      long long v204 = 0u;
      long long v205 = 0u;
      long long v203 = 0u;
      long long v199 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      double v151 = 0.0;
      double v150 = 0.0;
      uint64_t v202 = 0;
    }
    v70 = v194;
    uint64_t v86 = v195;
    v244.origin.double x = _UIWindowConvertRectFromOrientationToOrientation(v195, 1, v146, v147, v148, v149, v150, v151);
    CGRect v245 = CGRectIntegral(v244);
    uint64_t v152 = (uint64_t)v245.origin.x;
    uint64_t v153 = (uint64_t)v245.origin.y;
    if ((int)(uint64_t)v245.origin.x >= 0) {
      unsigned int v154 = (uint64_t)v245.origin.x;
    }
    else {
      unsigned int v154 = -(int)v152;
    }
    if ((int)v153 >= 0) {
      unsigned int v155 = (uint64_t)v245.origin.y;
    }
    else {
      unsigned int v155 = -(int)v153;
    }
    if (!(v154 >> 15)
      && !(v155 >> 15)
      && (uint64_t)v245.size.width + v152 < 0x8000
      && (uint64_t)v245.size.height + v153 < 0x8000)
    {
      *(void *)buf = (uint64_t)v245.origin.x;
      *(void *)&buf[8] = (uint64_t)v245.origin.y;
      *(void *)&buf[16] = (uint64_t)v245.size.width;
      uint64_t v211 = (uint64_t)v245.size.height;
      v93 = [v122 boundingPathBitmapWithRect:buf];

      goto LABEL_50;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v173 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v173, OS_LOG_TYPE_FAULT))
      {
        v251.origin.double x = v139;
        v251.origin.double y = v141;
        v251.size.double width = v143;
        v251.size.double height = v145;
        v179 = NSStringFromCGRect(v251);
        v180 = [v123 windowScene];
        v181 = -[UIWindow _fbsScene]((id *)v123);
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v179;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v123;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v211 = (uint64_t)v180;
        __int16 v212 = 2112;
        v213 = v181;
        _os_log_fault_impl(&dword_1853B0000, v173, OS_LOG_TYPE_FAULT, "Window bounds in scene %@ exceeds limits for bitmap data: %@ %@ %@", buf, 0x2Au);
      }
      v70 = v194;
      v116 = v190;
    }
    else
    {
      v156 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260E38) + 8);
      if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
      {
        v157 = v156;
        v246.origin.double x = v139;
        v246.origin.double y = v141;
        v246.size.double width = v143;
        v246.size.double height = v145;
        v158 = NSStringFromCGRect(v246);
        v159 = [v123 windowScene];
        v160 = -[UIWindow _fbsScene]((id *)v123);
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v158;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v123;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v211 = (uint64_t)v159;
        __int16 v212 = 2112;
        v213 = v160;
        _os_log_impl(&dword_1853B0000, v157, OS_LOG_TYPE_ERROR, "Window bounds in scene %@ exceeds limits for bitmap data: %@ %@ %@", buf, 0x2Au);

        v70 = v194;
      }
    }
    v94 = +[_UIScreenRectangularBoundingPathUtilities boundingPathForWindow:v123 inScreenCoordinateSpace:v70];
  }
LABEL_113:

  return v94;
}

- (_UIScreenComplexBoundingPathUtilities)initWithScreen:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIScreenComplexBoundingPathUtilities;
  v6 = [(_UIScreenBoundingPathUtilities *)&v12 initWithScreen:v5];
  if (v6)
  {
    uint64_t v7 = [v5 _screenType];
    if (v7 == -1)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, v6, @"_UIScreenComplexBoundingPathUtilities.m", 130, @"Attempted to initialize %@ with an unsupported screen: %@", v11, v5 object file lineNumber description];
    }
    v6->_type = v7;
    [(_UIScreenComplexBoundingPathUtilities *)v6 _loadBitmapForScreen:v5 type:v7];
  }

  return v6;
}

+ (BOOL)isScreenSupported:(id)a3
{
  id v3 = a3;
  BOOL v5 = [v3 _isEmbeddedScreen]
    && (unint64_t v4 = [v3 _screenType], v4 != -1)
    && _UIScreenCornerRadiusForType(v4) != 0.0;

  return v5;
}

- (void)_loadBitmapForScreen:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  [v7 _referenceBounds];
  double v9 = v8;
  double v11 = v10;
  [v7 scale];
  double v13 = v12;

  unint64_t v14 = (unint64_t)round(v13);
  uint64_t v15 = _UIScreenNativeDisplayBoundsSizeForType(a4);
  uint64_t v17 = v16;
  double v18 = _UIScreenReferenceBoundsSizeForType(a4);
  id v20 = [NSString stringWithFormat:@"BoundingPathBitmap-%ldx%ld-%ldx%ld-%.2fx", v15, v17, (uint64_t)v18, (uint64_t)v19, _UIScreenScaleForType(a4)];
  double v21 = v20;
  if ((unint64_t)(a4 - 17) < 6 || a4 == 40)
  {
    id v22 = [NSString stringWithFormat:@"%@-%@", v20, @"A"];
  }
  else
  {
    id v22 = v20;
  }
  double v23 = v22;
  double v24 = (double)v14;

  double v25 = __UIKitSharedBoundingPathDataManager();
  if (!v25)
  {
    double v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"_UIScreenComplexBoundingPathUtilities.m" lineNumber:358 description:@"The bounding path data manager should never be nil. This likely means that the BoundingPathData.bundle inside UIKitCore.framework is missing."];
  }
  double v26 = v9 * v24;
  double v27 = [v25 dataNamed:v23];
  CGFloat v28 = [v27 data];

  if (v28)
  {
    id v43 = 0;
    double v29 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v28 error:&v43];
    id v30 = v43;
    bitmap = self->_bitmap;
    self->_bitmap = v29;

    if (!self->_bitmap || v30)
    {
      double v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, self, @"_UIScreenComplexBoundingPathUtilities.m", 364, @"Failed to deserialize bounding path bitmap data. Error: %@", v30 object file lineNumber description];
    }
  }
  else
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"_UIScreenComplexBoundingPathUtilities.m", 360, @"Failed to load bounding path bitmap data from the asset manager for asset name: %@", v23 object file lineNumber description];
  }
  double v32 = v11 * v24;
  unint64_t v33 = self->_bitmap;
  if (v33)
  {
    [(_UIBoundingPathBitmap *)v33 bitmapData];
    uint64_t v34 = v42;
  }
  else
  {
    uint64_t v34 = 0;
  }
  if (v34 != (unint64_t)v26
    || ((double v35 = self->_bitmap) == 0 ? (v36 = 0) : ([(_UIBoundingPathBitmap *)v35 bitmapData], v36 = v41),
        v36 != (unint64_t)v32))
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UIScreenComplexBoundingPathUtilities.m", 388, @"The loaded bitmap does not match the expected size. Expected size: {width=%ld, height=%ld} Bitmap: %@", (unint64_t)v26, (unint64_t)v32, self->_bitmap object file lineNumber description];
  }
}

- (void).cxx_destruct
{
}

@end