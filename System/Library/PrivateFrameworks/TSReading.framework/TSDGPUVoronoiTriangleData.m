@interface TSDGPUVoronoiTriangleData
- (CGRect)bounds;
- (NSArray)cells;
- (TSDGPUVoronoiTriangleData)initWithPoints:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6;
- (id)cellFromTriangleIndex:(unint64_t)a3;
- (unint64_t)cellCount;
- (unint64_t)cellIndexFromTriangleIndex:(unint64_t)a3;
- (unint64_t)triangleCount;
- (unint64_t)triangleIndexInCellFromGlobalTriangleIndex:(unint64_t)a3;
- (void)dealloc;
- (void)p_setupDataWithPointCount:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6;
@end

@implementation TSDGPUVoronoiTriangleData

- (void)p_setupDataWithPointCount:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  v178[1] = *MEMORY[0x263EF8340];
  if (!a6)
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 507, @"invalid nil value for '%s'", "randGen");
  }
  v13 = 0;
  __p = 0;
  v175 = 0;
  v176 = 0;
  v173[0] = 0;
  v173[1] = 0;
  v172 = (uint64_t *)v173;
  CGFloat v134 = height;
  CGFloat rect = width;
  if (width <= height) {
    double v14 = height;
  }
  else {
    double v14 = width;
  }
  double v133 = v14;
  double v15 = -1.0;
  double v16 = 0.25;
  do
  {
    double v17 = fabs(v15);
    if (v17 <= 0.5) {
      double v18 = rect;
    }
    else {
      double v18 = v133;
    }
    double v19 = -1.0;
    do
    {
      double v20 = fabs(v19);
      if (v17 > 0.5 || v20 > 0.5)
      {
        CGFloat v22 = v134;
        if (v20 <= 0.5) {
          double v23 = v134;
        }
        else {
          double v23 = v133;
        }
        CGFloat v24 = x;
        CGFloat v25 = y;
        CGFloat v26 = rect;
        double MidX = CGRectGetMidX(*(CGRect *)(&v22 - 3));
        v179.origin.CGFloat x = x;
        v179.origin.CGFloat y = y;
        v179.size.double height = v134;
        v179.size.double width = rect;
        CGFloat MidY = CGRectGetMidY(v179);
        v167[0] = COERCE_VOID_(round(MidX + v15 * v18));
        v167[1] = COERCE_VOID_(round(MidY + v19 * v23));
        std::__tree<boost::polygon::point_data<double>>::__emplace_unique_key_args<boost::polygon::point_data<double>,boost::polygon::point_data<double> const&>(&v172, (double *)v167, v167);
        v29 = v175;
        if (v175 >= (void **)v176)
        {
          v30 = (void **)__p;
          uint64_t v31 = ((char *)v175 - (unsigned char *)__p) >> 4;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v33 = v176 - (unsigned char *)__p;
          if ((v176 - (unsigned char *)__p) >> 3 > v32) {
            unint64_t v32 = v33 >> 3;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v34 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v176, v34);
            v30 = (void **)__p;
            v29 = v175;
          }
          else
          {
            v35 = 0;
          }
          v36 = (void **)&v35[16 * v31];
          *v36 = v167[0];
          v36[1] = v167[1];
          v37 = v36;
          while (v29 != v30)
          {
            v38 = *(v29 - 2);
            v29 -= 2;
            *(v37 - 2) = v38;
            v37 -= 2;
            v37[1] = v29[1];
          }
          v13 = (double *)(v36 + 2);
          __p = v37;
          v175 = v36 + 2;
          v176 = &v35[16 * v34];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          *v175 = v167[0];
          v29[1] = v167[1];
          v13 = (double *)(v29 + 2);
        }
        double v16 = 0.25;
        v175 = (void **)v13;
      }
      double v19 = v19 + v16;
    }
    while (v19 <= 1.0);
    double v15 = v15 + v16;
  }
  while (v15 <= 1.0);
  if (a3)
  {
    uint64_t v39 = 0;
    do
    {
      v180.origin.CGFloat x = x;
      v180.origin.CGFloat y = y;
      v180.size.double width = rect;
      v180.size.double height = v134;
      double MinX = CGRectGetMinX(v180);
      v181.origin.CGFloat x = x;
      v181.origin.CGFloat y = y;
      v181.size.double width = rect;
      v181.size.double height = v134;
      [a6 doubleBetween:MinX :CGRectGetMaxX(v181)];
      double v42 = v41;
      v182.origin.CGFloat x = x;
      v182.origin.CGFloat y = y;
      v182.size.double width = rect;
      v182.size.double height = v134;
      double MinY = CGRectGetMinY(v182);
      v183.origin.CGFloat x = x;
      v183.origin.CGFloat y = y;
      v183.size.double width = rect;
      v183.size.double height = v134;
      [a6 doubleBetween:MinY :CGRectGetMaxY(v183)];
      v167[0] = COERCE_VOID_(round(v42));
      v167[1] = COERCE_VOID_(round(v44));
      if (v173 == (void **)std::__tree<boost::polygon::point_data<double>>::find<boost::polygon::point_data<double>>((uint64_t)&v172, (double *)v167))
      {
        std::__tree<boost::polygon::point_data<double>>::__emplace_unique_key_args<boost::polygon::point_data<double>,boost::polygon::point_data<double> const&>(&v172, (double *)v167, v167);
        v45 = v175;
        if (v175 >= (void **)v176)
        {
          v47 = (void **)__p;
          uint64_t v48 = ((char *)v175 - (unsigned char *)__p) >> 4;
          unint64_t v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 60) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v50 = v176 - (unsigned char *)__p;
          if ((v176 - (unsigned char *)__p) >> 3 > v49) {
            unint64_t v49 = v50 >> 3;
          }
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v51 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v49;
          }
          if (v51)
          {
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v176, v51);
            v47 = (void **)__p;
            v45 = v175;
          }
          else
          {
            v52 = 0;
          }
          v53 = (void **)&v52[16 * v48];
          *v53 = v167[0];
          v53[1] = v167[1];
          v54 = v53;
          while (v45 != v47)
          {
            v55 = *(v45 - 2);
            v45 -= 2;
            *(v54 - 2) = v55;
            v54 -= 2;
            v54[1] = v45[1];
          }
          v46 = v53 + 2;
          __p = v54;
          v175 = v53 + 2;
          v176 = &v52[16 * v51];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *v175 = v167[0];
          v45[1] = v167[1];
          v46 = v45 + 2;
        }
        v175 = v46;
      }
      ++v39;
    }
    while (v39 != a3);
    v13 = (double *)v175;
  }
  uint64_t v171 = 0;
  long long v169 = 0u;
  *(_OWORD *)v170 = 0u;
  *(_OWORD *)v167 = 0u;
  *(_OWORD *)v168 = 0u;
  boost::polygon::construct_voronoi<std::__wrap_iter<boost::polygon::point_data<double> *>,std::__wrap_iter<boost::polygon::segment_data<double> *>,boost::polygon::voronoi_diagram<double,boost::polygon::voronoi_diagram_traits<double>>>((uint64_t)__p, v13, 0, 0, v167);
  CGFloat v56 = *MEMORY[0x263F001A0];
  CGFloat v57 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v59 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v58 = *(double *)(MEMORY[0x263F001A0] + 24);
  id v60 = objc_alloc(MEMORY[0x263EFF980]);
  v132 = (NSArray *)[v60 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((char *)v167[1] - (char *)v167[0]) >> 3)];
  v164 = 0;
  v165 = 0;
  v166 = 0;
  v62 = v167[0];
  v61 = v167[1];
  if (v167[0] == v167[1])
  {
    v161 = 0;
    v162 = 0;
    unint64_t v163 = 0;
LABEL_151:
    unint64_t v104 = 0;
    v155 = 0;
    v156 = 0;
    unint64_t v157 = 0;
    goto LABEL_153;
  }
  v63 = 0;
  do
  {
    v64 = (void *)v62[1];
    while (v64[1] && *(void *)(v64[2] + 8))
    {
      v64 = (void *)v64[3];
      if (v64 == (void *)v62[1])
      {
        if (v63 >= v166)
        {
          unint64_t v66 = 0xAAAAAAAAAAAAAAABLL * ((v63 - (unsigned char *)v164) >> 3);
          unint64_t v67 = v66 + 1;
          if (v66 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((v166 - (unsigned char *)v164) >> 3) > v67) {
            unint64_t v67 = 0x5555555555555556 * ((v166 - (unsigned char *)v164) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v166 - (unsigned char *)v164) >> 3) >= 0x555555555555555) {
            unint64_t v68 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v68 = v67;
          }
          if (v68) {
            v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::polygon::voronoi_cell<double>>>((uint64_t)&v166, v68);
          }
          else {
            v69 = 0;
          }
          v70 = &v69[8 * ((v63 - (unsigned char *)v164) >> 3)];
          long long v71 = *(_OWORD *)v62;
          *((void *)v70 + 2) = v62[2];
          *(_OWORD *)v70 = v71;
          v73 = (char *)v164;
          v72 = v165;
          v74 = &v69[24 * v66];
          if (v165 != v164)
          {
            do
            {
              long long v75 = *(_OWORD *)(v72 - 24);
              *((void *)v74 - 1) = *((void *)v72 - 1);
              *(_OWORD *)(v74 - 24) = v75;
              v74 -= 24;
              v72 -= 24;
            }
            while (v72 != v73);
            v72 = (char *)v164;
          }
          v63 = v70 + 24;
          v164 = v74;
          v165 = v70 + 24;
          v166 = &v69[24 * v68];
          if (v72) {
            operator delete(v72);
          }
        }
        else
        {
          long long v65 = *(_OWORD *)v62;
          *((void *)v63 + 2) = v62[2];
          *(_OWORD *)v63 = v65;
          v63 += 24;
        }
        v165 = v63;
        v61 = v167[1];
        break;
      }
    }
    v62 += 3;
  }
  while (v62 != v61);
  v76 = (char *)v164;
  v161 = 0;
  v162 = 0;
  unint64_t v163 = 0;
  if (v164 == v63) {
    goto LABEL_151;
  }
  do
  {
    v149 = 0;
    unint64_t v150 = 0;
    v148 = 0;
    uint64_t v77 = *((void *)v76 + 1);
    uint64_t v78 = v77;
    do
    {
      if (TSDLineIntersectsRect(**(CGFloat **)(v78 + 8), *(CGFloat *)(*(void *)(v78 + 8) + 8), **(double **)(*(void *)(v78 + 16) + 8), *(double *)(*(void *)(*(void *)(v78 + 16) + 8) + 8), x, y, rect, v134))
      {
        segment_from_edge_clipped_to_rect(v78, &v158, x, y, rect, v134);
        v79 = v149;
        if ((unint64_t)v149 >= v150)
        {
          v80 = (char *)std::vector<boost::polygon::segment_data<double>>::__push_back_slow_path<boost::polygon::segment_data<double> const&>((uint64_t *)&v148, &v158);
        }
        else
        {
          *(_OWORD *)v149 = 0u;
          *((_OWORD *)v79 + 1) = 0u;
          *(CGPoint *)v79 = v158;
          *((double *)v79 + 2) = v159;
          *((double *)v79 + 3) = v160;
          v80 = v79 + 32;
        }
        v149 = v80;
        uint64_t v77 = *((void *)v76 + 1);
      }
      uint64_t v78 = *(void *)(v78 + 24);
    }
    while (v78 != v77);
    v81 = v162;
    if ((unint64_t)v162 >= v163)
    {
      uint64_t v82 = std::vector<std::vector<boost::polygon::segment_data<double>>>::__push_back_slow_path<std::vector<boost::polygon::segment_data<double>> const&>((uint64_t *)&v161, (void **)&v148);
    }
    else
    {
      *(void *)v162 = 0;
      *((void *)v81 + 1) = 0;
      *((void *)v81 + 2) = 0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>(v81, v148, v149, (v149 - (unsigned char *)v148) >> 5);
      uint64_t v82 = (uint64_t)(v81 + 24);
    }
    v162 = (char *)v82;
    if (v148)
    {
      v149 = (char *)v148;
      operator delete(v148);
    }
    v76 += 24;
  }
  while (v76 != v165);
  v83 = v161;
  v155 = 0;
  v156 = 0;
  unint64_t v157 = 0;
  if (v161 == v162) {
    goto LABEL_152;
  }
  do
  {
    v152 = 0;
    v153 = 0;
    uint64_t v154 = 0;
    std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v152, *(void **)v83, *((void **)v83 + 1), (uint64_t)(*((void *)v83 + 1) - *(void *)v83) >> 5);
    v84 = (char *)v152;
    if (v153 != v152)
    {
      uint64_t v85 = 0;
      unint64_t v86 = 0;
      unint64_t v87 = (v153 - (unsigned char *)v152) >> 5;
      do
      {
        unint64_t v88 = v86;
        double v90 = *(double *)&v84[v85 + 16];
        double v89 = *(double *)&v84[v85 + 24];
        if (++v86 == v87) {
          unint64_t v91 = 0;
        }
        else {
          unint64_t v91 = v88 + 1;
        }
        uint64_t v92 = (uint64_t)&v84[32 * v91];
        double v94 = *(double *)v92;
        double v93 = *(double *)(v92 + 8);
        if (v90 != *(double *)v92 || v89 != v93)
        {
          if (vabdd_f64(v90, v94) >= 0.00999999978 && vabdd_f64(v89, v93) >= 0.00999999978)
          {
            v184.origin.CGFloat x = x;
            v184.origin.CGFloat y = y;
            v184.size.double height = v134;
            v184.size.double width = rect;
            BOOL v96 = vabdd_f64(v90, CGRectGetMinX(v184)) < 0.00999999978;
            double v97 = v93;
            double v98 = v90;
            if (!v96)
            {
              v185.origin.CGFloat x = x;
              v185.origin.CGFloat y = y;
              v185.size.double height = v134;
              v185.size.double width = rect;
              BOOL v96 = vabdd_f64(v90, CGRectGetMaxX(v185)) < 0.00999999978;
              double v97 = v93;
              double v98 = v90;
              if (!v96)
              {
                v186.origin.CGFloat x = x;
                v186.origin.CGFloat y = y;
                v186.size.double height = v134;
                v186.size.double width = rect;
                BOOL v96 = vabdd_f64(v94, CGRectGetMinX(v186)) < 0.00999999978;
                double v97 = v89;
                double v98 = v94;
                if (!v96)
                {
                  v187.origin.CGFloat x = x;
                  v187.origin.CGFloat y = y;
                  v187.size.double height = v134;
                  v187.size.double width = rect;
                  BOOL v96 = vabdd_f64(v94, CGRectGetMaxX(v187)) < 0.00999999978;
                  double v97 = v89;
                  double v98 = v94;
                  if (!v96)
                  {
                    v99 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v89, v94);
                    uint64_t v100 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]"];
                    objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 710, @"Couldn't find corner!");
                    double v97 = v89;
                    double v98 = v94;
                  }
                }
              }
            }
            v158.CGFloat x = v90;
            v158.CGFloat y = v89;
            double v159 = v98;
            double v160 = v97;
            v148 = *(void **)&v98;
            v149 = *(char **)&v97;
            unint64_t v150 = *(void *)&v94;
            double v151 = v93;
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, (uint64_t)v152 + 32 * v91, &v158);
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, (uint64_t)v152 + 32 * v91 + 32, &v148);
          }
          else
          {
            v158.CGFloat x = *(CGFloat *)&v84[v85 + 16];
            v158.CGFloat y = v89;
            double v159 = v94;
            double v160 = v93;
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, v92, &v158);
          }
        }
        v84 = (char *)v152;
        unint64_t v87 = (v153 - (unsigned char *)v152) >> 5;
        v85 += 32;
      }
      while (v86 < v87);
    }
    v101 = v156;
    if ((unint64_t)v156 >= v157)
    {
      uint64_t v102 = std::vector<std::vector<boost::polygon::segment_data<double>>>::__push_back_slow_path<std::vector<boost::polygon::segment_data<double>> const&>((uint64_t *)&v155, (void **)&v152);
    }
    else
    {
      *(void *)v156 = 0;
      *((void *)v101 + 1) = 0;
      *((void *)v101 + 2) = 0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>(v101, v152, v153, (v153 - (unsigned char *)v152) >> 5);
      uint64_t v102 = (uint64_t)(v101 + 24);
    }
    v156 = (char *)v102;
    if (v152)
    {
      v153 = (char *)v152;
      operator delete(v152);
    }
    v83 += 24;
  }
  while (v83 != v162);
  v103 = v155;
  if (v155 == v156)
  {
LABEL_152:
    unint64_t v104 = 0;
  }
  else
  {
    unint64_t v104 = 0;
    do
    {
      v158.CGFloat x = 0.0;
      v158.CGFloat y = 0.0;
      double v159 = 0.0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v158, *(void **)v103, *((void **)v103 + 1), (uint64_t)(*((void *)v103 + 1) - *(void *)v103) >> 5);
      CGFloat v105 = v158.x;
      if (*(void *)&v158.y - *(void *)&v158.x >= 0x41uLL)
      {
        v145 = 0;
        v146 = 0;
        uint64_t v147 = 0;
        std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v145, *(void **)&v158.x, *(void **)&v158.y, (uint64_t)(*(void *)&v158.y - *(void *)&v158.x) >> 5);
        double v106 = 0.0;
        if (v145 != v146)
        {
          v107 = v145;
          do
          {
            double v106 = v106 + (v107[2] - *v107) * ((v107[1] + v107[3]) * 0.5);
            v107 += 4;
          }
          while (v107 != v146);
        }
        if (v145)
        {
          v146 = v145;
          operator delete(v145);
        }
        if (fabs(v106) > 1.0)
        {
          v108 = [TSDGPUVoronoiTriangleDataCell alloc];
          v142 = 0;
          v143 = 0;
          uint64_t v144 = 0;
          std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v142, *(void **)&v158.x, *(void **)&v158.y, (uint64_t)(*(void *)&v158.y - *(void *)&v158.x) >> 5);
          v109 = [(TSDGPUVoronoiTriangleDataCell *)v108 initWithEdges:&v142];
          if (v142)
          {
            v143 = v142;
            operator delete(v142);
          }
          double v110 = a5;
          if (a5 <= 0.0 || (objc_msgSend(a6, "randomDouble", a5), v110 >= a5))
          {
            v178[0] = v109;
            uint64_t v111 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v178, 1, v110);
          }
          else
          {
            uint64_t v111 = [(TSDGPUVoronoiTriangleDataCell *)v109 cellsBySplittingCellIntoTriangles];
          }
          v112 = (void *)v111;

          [(NSArray *)v132 addObjectsFromArray:v112];
          long long v140 = 0u;
          long long v141 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          uint64_t v113 = [v112 countByEnumeratingWithState:&v138 objects:v177 count:16];
          if (v113)
          {
            uint64_t v114 = *(void *)v139;
            do
            {
              for (uint64_t i = 0; i != v113; ++i)
              {
                if (*(void *)v139 != v114) {
                  objc_enumerationMutation(v112);
                }
                v116 = *(void **)(*((void *)&v138 + 1) + 8 * i);
                uint64_t v117 = [v116 triangleCount];
                [v116 bounds];
                v190.origin.CGFloat x = v118;
                v190.origin.CGFloat y = v119;
                v190.size.double width = v120;
                v190.size.double height = v121;
                v188.origin.CGFloat x = v56;
                v188.origin.CGFloat y = v57;
                v188.size.double width = v59;
                v188.size.double height = v58;
                CGRect v189 = CGRectUnion(v188, v190);
                CGFloat v56 = v189.origin.x;
                CGFloat v57 = v189.origin.y;
                CGFloat v59 = v189.size.width;
                CGFloat v58 = v189.size.height;
                v104 += v117;
              }
              uint64_t v113 = [v112 countByEnumeratingWithState:&v138 objects:v177 count:16];
            }
            while (v113);
          }
        }
        CGFloat v105 = v158.x;
      }
      if (v105 != 0.0)
      {
        v158.CGFloat y = v105;
        operator delete(*(void **)&v105);
      }
      v103 += 24;
    }
    while (v103 != v156);
  }
LABEL_153:
  self->_triangleCount = v104;
  self->_bounds.origin.CGFloat x = v56;
  self->_bounds.origin.CGFloat y = v57;
  self->_bounds.size.double width = v59;
  self->_bounds.size.double height = v58;

  self->_cells = v132;
  v122 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  free(self->_triangleIndexToCellIndexMappingTable);
  free(self->_triangleIndexToCellTriangleIndexMappingTable);
  self->_triangleIndexToCellMappingTableCount = v104;
  if (v104)
  {
    self->_triangleIndexToCellIndexMappingTable = (unint64_t *)malloc_type_calloc(8uLL, v104, 0xE3D11462uLL);
    uint64_t v123 = 0;
    unint64_t v124 = 0;
    self->_triangleIndexToCellTriangleIndexMappingTable = (unint64_t *)malloc_type_calloc(8uLL, self->_triangleIndexToCellMappingTableCount, 0x5B0BA89BuLL);
    while (v124 < [(NSArray *)self->_cells count])
    {
      id v125 = [(NSArray *)self->_cells objectAtIndex:v124];
      v126 = objc_msgSend(v122, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v125, "triangleCount")));
      if (v126) {
        v127 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v126, "integerValue") + 1);
      }
      else {
        v127 = &unk_26D739D80;
      }
      objc_msgSend(v122, "setObject:forKeyedSubscript:", v127, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v125, "triangleCount")));
      for (unint64_t j = 0; j < [v125 triangleCount]; ++j)
      {
        self->_triangleIndexToCellIndexMappingTable[v123] = v124;
        self->_triangleIndexToCellTriangleIndexMappingTable[v123++] = j;
      }
      ++v124;
    }
  }
  else
  {
    v129 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v130 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]"];
    objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 807, @"No triangles created!");
  }
  *(void *)&v158.CGFloat x = &v155;
  std::vector<std::vector<boost::polygon::segment_data<double>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v158);
  *(void *)&v158.CGFloat x = &v161;
  std::vector<std::vector<boost::polygon::segment_data<double>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v158);
  if (v164)
  {
    v165 = (char *)v164;
    operator delete(v164);
  }
  if (v170[0])
  {
    v170[1] = v170[0];
    operator delete(v170[0]);
  }
  if (v168[1])
  {
    *(void **)&long long v169 = v168[1];
    operator delete(v168[1]);
  }
  if (v167[0])
  {
    v167[1] = v167[0];
    operator delete(v167[0]);
  }
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v172, v173[0]);
  if (__p)
  {
    v175 = (void **)__p;
    operator delete(__p);
  }
}

- (TSDGPUVoronoiTriangleData)initWithPoints:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDGPUVoronoiTriangleData;
  v13 = [(TSDGPUVoronoiTriangleData *)&v17 init];
  if (v13)
  {
    if (!a6)
    {
      double v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData initWithPoints:clippedToRect:percentOfCellsToSplit:randomGenerator:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 855, @"invalid nil value for '%s'", "randomGenerator");
    }
    -[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:](v13, "p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:", a3, a6, x, y, width, height, a5);
  }
  return v13;
}

- (void)dealloc
{
  triangleIndexToCellIndexMappingTable = self->_triangleIndexToCellIndexMappingTable;
  if (triangleIndexToCellIndexMappingTable)
  {
    free(triangleIndexToCellIndexMappingTable);
    self->_triangleIndexToCellIndexMappingTable = 0;
  }
  triangleIndexToCellTriangleIndexMappingTable = self->_triangleIndexToCellTriangleIndexMappingTable;
  if (triangleIndexToCellTriangleIndexMappingTable)
  {
    free(triangleIndexToCellTriangleIndexMappingTable);
    self->_triangleIndexToCellTriangleIndexMappingTable = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)TSDGPUVoronoiTriangleData;
  [(TSDGPUVoronoiTriangleData *)&v5 dealloc];
}

- (unint64_t)cellCount
{
  return [(NSArray *)self->_cells count];
}

- (id)cellFromTriangleIndex:(unint64_t)a3
{
  cells = self->_cells;
  unint64_t v4 = [(TSDGPUVoronoiTriangleData *)self cellIndexFromTriangleIndex:a3];

  return [(NSArray *)cells objectAtIndexedSubscript:v4];
}

- (unint64_t)cellIndexFromTriangleIndex:(unint64_t)a3
{
  if (self->_triangleIndexToCellMappingTableCount <= a3)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 883, @"%d is out of bounds(%d)!", a3, self->_triangleIndexToCellMappingTableCount);
  }
  return self->_triangleIndexToCellIndexMappingTable[a3];
}

- (unint64_t)triangleIndexInCellFromGlobalTriangleIndex:(unint64_t)a3
{
  if (self->_triangleIndexToCellMappingTableCount <= a3)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleData triangleIndexInCellFromGlobalTriangleIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 891, @"%d is out of bounds(%d)!", a3, self->_triangleIndexToCellMappingTableCount);
  }
  return self->_triangleIndexToCellTriangleIndexMappingTable[a3];
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (NSArray)cells
{
  return self->_cells;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end