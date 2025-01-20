@interface CRLBezierPathSimplifier
+ (id)cleanPathForPath:(id)a3;
+ (id)simplifiedPathWithRawPath:(id)a3 threshold:(double)a4;
- (BOOL)findApproximationForPointsWithTailElementType:(int64_t)a3;
- (CGPoint)controlPoint1;
- (CGPoint)controlPoint2;
- (CGPoint)startOfSubpath;
- (CRLBezierPath)path;
- (CRLBezierPath)simplifiedPath;
- (CRLBezierPathSimplifier)initWithPath:(id)a3 threshold:(double)a4;
- (CRLPointVector3)associatedPoints;
- (double)threshold;
- (id).cxx_construct;
- (int64_t)solutionElementType;
- (unint64_t)tailLength;
- (void)addPointsForElementOfType:(int64_t)a3;
- (void)outputCurrentSolution;
- (void)pointsToSimplify;
- (void)resetSolution;
- (void)run;
- (void)setAssociatedPoints:(CRLPointVector3 *)a3;
- (void)setControlPoint1:(CGPoint)a3;
- (void)setControlPoint2:(CGPoint)a3;
- (void)setPointsToSimplify:(void *)a3;
- (void)setSolutionElementType:(int64_t)a3;
- (void)setStartOfSubpath:(CGPoint)a3;
- (void)setTailLength:(unint64_t)a3;
@end

@implementation CRLBezierPathSimplifier

- (CRLBezierPathSimplifier)initWithPath:(id)a3 threshold:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLBezierPathSimplifier;
  v8 = [(CRLBezierPathSimplifier *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_threshold = a4;
    v10 = objc_alloc_init(CRLBezierPath);
    simplifiedPath = v9->_simplifiedPath;
    v9->_simplifiedPath = v10;
  }
  return v9;
}

- (void)addPointsForElementOfType:(int64_t)a3
{
  v5 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  uint64_t v128 = *v5;
  uint64_t v129 = v5[1];
  uint64_t v6 = *((void *)[(CRLBezierPathSimplifier *)self pointsToSimplify] + 1);
  double v7 = *(double *)(v6 - 16);
  double v8 = *(double *)(v6 - 8);
  if (a3 == 2)
  {
    uint64_t v9 = 0;
    double v10 = *(double *)(v6 - 8);
    double v11 = *(double *)(v6 - 16);
    double v12 = v10;
    double v13 = v11;
    do
    {
      v14 = (double *)((char *)[(CRLBezierPathSimplifier *)self associatedPoints] + v9);
      double v15 = v14[1];
      double v11 = fmin(v11, *v14);
      double v10 = fmin(v10, v15);
      double v13 = fmax(v13, *v14);
      double v12 = fmax(v12, v15);
      v9 += 16;
    }
    while (v9 != 48);
    if (!sub_100064084(v11, v10, v13, v12))
    {
      v16 = [(CRLBezierPathSimplifier *)self associatedPoints];
      double y = v16->v[0].y;
      double x = v16->v[0].x;
      v18 = [(CRLBezierPathSimplifier *)self associatedPoints];
      double v19 = v18->v[1].x;
      double v20 = v18->v[1].y;
      v21 = [(CRLBezierPathSimplifier *)self associatedPoints];
      double v22 = v21->v[2].x;
      double v23 = v21->v[2].y;
      [(CRLBezierPathSimplifier *)self threshold];
      double v25 = v24;
      [(CRLBezierPathSimplifier *)self threshold];
      double v130 = v26;
      v27 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
      v133 = 0;
      v134 = 0;
      uint64_t v135 = 0;
      v28 = +[CRLBezierPath bezierPath];
      v132 = v28;
      [v28 moveToPoint:v7, v8];
      [v28 curveToPoint:v22 controlPoint1:v23 x:y controlPoint2:v19 v20];
      float v29 = v25;
      v30 = [v28 bezierPathByFlatteningPathWithFlatness:(float)(v29 * 0.5)];
      id v31 = [v30 elementCount];
      if (v31)
      {
        unint64_t v33 = 0;
        v34 = v27 + 2;
        *(float *)&long long v32 = v130 * 4.0;
        float v127 = *(float *)&v32;
        double v36 = CGPointZero.x;
        double v35 = CGPointZero.y;
        double v37 = (float)(*(float *)&v32 * *(float *)&v32);
        *(void *)&long long v32 = 67109378;
        long long v126 = v32;
        do
        {
          *(_OWORD *)__p = xmmword_101175160;
          long long v145 = xmmword_101175160;
          long long v146 = xmmword_101175160;
          v38 = v30;
          unint64_t v39 = [v30 elementAtIndex:v33 associatedPoints:__p];
          if (v39 | v33)
          {
            if (v33 && v39 == 1)
            {
              double v40 = *(double *)__p;
              double v41 = *(double *)&__p[1];
              if (sub_1000643CC(v36, v35, *(double *)__p, *(double *)&__p[1]) <= v37)
              {
                v48 = (double *)v27[1];
              }
              else
              {
                float v42 = v36;
                float v43 = v35;
                float v44 = v40;
                float v45 = v41;
                sub_1001241F0((uint64_t)&v133, v42, v43, v44, v45, v127);
                v46 = v133;
                v47 = v134;
                v48 = (double *)v27[1];
                while (v46 != v47)
                {
                  double v49 = *v46;
                  double v50 = v40 * v49 + v36 * (1.0 - v49);
                  double v51 = v41 * v49 + v35 * (1.0 - v49);
                  if ((unint64_t)v48 >= *v34)
                  {
                    v52 = (double *)*v27;
                    uint64_t v53 = ((char *)v48 - (unsigned char *)*v27) >> 4;
                    unint64_t v54 = v53 + 1;
                    if ((unint64_t)(v53 + 1) >> 60) {
                      sub_100004E40();
                    }
                    uint64_t v55 = *v34 - (void)v52;
                    if (v55 >> 3 > v54) {
                      unint64_t v54 = v55 >> 3;
                    }
                    if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
                      unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v56 = v54;
                    }
                    if (v56)
                    {
                      v57 = (char *)sub_10001EAB0((uint64_t)(v27 + 2), v56);
                      v52 = (double *)*v27;
                      v48 = (double *)v27[1];
                    }
                    else
                    {
                      v57 = 0;
                    }
                    v58 = (double *)&v57[16 * v53];
                    double *v58 = v50;
                    v58[1] = v51;
                    v59 = v58;
                    if (v48 == v52)
                    {
                      v28 = v132;
                    }
                    else
                    {
                      v28 = v132;
                      do
                      {
                        *((_OWORD *)v59 - 1) = *((_OWORD *)v48 - 1);
                        v59 -= 2;
                        v48 -= 2;
                      }
                      while (v48 != v52);
                      v52 = (double *)*v27;
                    }
                    v48 = v58 + 2;
                    *v27 = v59;
                    v27[1] = v58 + 2;
                    v27[2] = &v57[16 * v56];
                    if (v52) {
                      operator delete(v52);
                    }
                  }
                  else
                  {
                    double *v48 = v50;
                    v48[1] = v51;
                    v48 += 2;
                  }
                  v27[1] = v48;
                  ++v46;
                }
              }
              if ((unint64_t)v48 >= *v34)
              {
                v66 = (double *)*v27;
                uint64_t v67 = ((char *)v48 - (unsigned char *)*v27) >> 4;
                unint64_t v68 = v67 + 1;
                if ((unint64_t)(v67 + 1) >> 60) {
                  sub_100004E40();
                }
                uint64_t v69 = *v34 - (void)v66;
                if (v69 >> 3 > v68) {
                  unint64_t v68 = v69 >> 3;
                }
                if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v70 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v70 = v68;
                }
                if (v70)
                {
                  v71 = (char *)sub_10001EAB0((uint64_t)(v27 + 2), v70);
                  v66 = (double *)*v27;
                  v48 = (double *)v27[1];
                }
                else
                {
                  v71 = 0;
                }
                v72 = (double *)&v71[16 * v67];
                double *v72 = v40;
                v72[1] = v41;
                v73 = v72;
                if (v48 != v66)
                {
                  do
                  {
                    *((_OWORD *)v73 - 1) = *((_OWORD *)v48 - 1);
                    v73 -= 2;
                    v48 -= 2;
                  }
                  while (v48 != v66);
                  v66 = (double *)*v27;
                }
                v65 = v72 + 2;
                *v27 = v73;
                v27[1] = v72 + 2;
                v27[2] = &v71[16 * v70];
                if (v66) {
                  operator delete(v66);
                }
              }
              else
              {
                double *v48 = v40;
                v48[1] = v41;
                v65 = v48 + 2;
              }
              v27[1] = v65;
            }
            else
            {
              unsigned int v60 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D7CA8);
              }
              v61 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                unsigned int v137 = v60;
                __int16 v138 = 2082;
                v139 = "void CRLGetCGPointsOnFlattenedCubicBezierSegment(CGPoint, CGPoint, CGPoint, CGPoint, float, float"
                       ", std::vector<CGPoint> &)";
                __int16 v140 = 2082;
                v141 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
                __int16 v142 = 1024;
                int v143 = 59;
                _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unexpected element/index combination in flattened path", buf, 0x22u);
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014D7CC8);
                }
              }
              v62 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
              {
                v74 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = v126;
                unsigned int v137 = v60;
                __int16 v138 = 2114;
                v139 = v74;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v62, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              v63 = +[NSString stringWithUTF8String:"void CRLGetCGPointsOnFlattenedCubicBezierSegment(CGPoint, CGPoint, CGPoint, CGPoint, float, float, std::vector<CGPoint> &)"];
              v64 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
              +[CRLAssertionHandler handleFailureInFunction:v63 file:v64 lineNumber:59 isFatal:0 description:"Unexpected element/index combination in flattened path"];

              double v40 = v36;
              double v41 = v35;
            }
          }
          else
          {
            double v40 = *(double *)__p;
            double v41 = *(double *)&__p[1];
          }
          v30 = v38;
          ++v33;
          double v35 = v41;
          double v36 = v40;
        }
        while ((id)v33 != v31);
      }

      v80 = v133;
      if (v133)
      {
        v134 = v133;
LABEL_112:
        operator delete(v80);
      }
    }
  }
  else
  {
    v75 = [(CRLBezierPathSimplifier *)self associatedPoints];
    double v76 = v75->v[0].x;
    double v77 = v75->v[0].y;
    if (a3 != 1)
    {
      if (a3 == 3)
      {
        [(CRLBezierPathSimplifier *)self startOfSubpath];
        double v76 = v78;
        double v77 = v79;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7AA8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107B930();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7AC8);
        }
        v81 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v82 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier addPointsForElementOfType:]");
        v83 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v82 file:v83 lineNumber:314 isFatal:0 description:"Unexpected Bezier element type"];
      }
    }
    v84 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
    if (!sub_100064084(*(double *)(v84[1] - 16), *(double *)(v84[1] - 8), v76, v77))
    {
      __p[0] = 0;
      __p[1] = 0;
      *(void *)&long long v145 = 0;
      [(CRLBezierPathSimplifier *)self threshold];
      float v85 = v77;
      float v86 = v76;
      float v87 = v8;
      float v88 = v7;
      float v90 = v89;
      sub_1001241F0((uint64_t)__p, v88, v87, v86, v85, v90);
      v91 = (float *)__p[0];
      for (i = (float *)__p[1]; v91 != i; ++v91)
      {
        float v93 = *v91;
        v94 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
        v95 = v94;
        double v96 = 1.0 - v93;
        double v97 = v76 * v93 + v7 * v96;
        double v98 = v77 * v93 + v8 * v96;
        uint64_t v99 = (uint64_t)(v94 + 2);
        v100 = (double *)v94[2];
        v101 = (double *)v94[1];
        if (v101 >= v100)
        {
          v103 = (double *)*v94;
          uint64_t v104 = ((char *)v101 - (unsigned char *)*v95) >> 4;
          unint64_t v105 = v104 + 1;
          if ((unint64_t)(v104 + 1) >> 60) {
            sub_100004E40();
          }
          uint64_t v106 = (char *)v100 - (char *)v103;
          if (v106 >> 3 > v105) {
            unint64_t v105 = v106 >> 3;
          }
          if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v107 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v107 = v105;
          }
          if (v107)
          {
            v108 = (char *)sub_10001EAB0(v99, v107);
            v103 = (double *)*v95;
            v101 = (double *)v95[1];
          }
          else
          {
            v108 = 0;
          }
          v109 = (double *)&v108[16 * v104];
          double *v109 = v97;
          v109[1] = v98;
          v110 = v109;
          if (v101 != v103)
          {
            do
            {
              *((_OWORD *)v110 - 1) = *((_OWORD *)v101 - 1);
              v110 -= 2;
              v101 -= 2;
            }
            while (v101 != v103);
            v103 = (double *)*v95;
          }
          v102 = v109 + 2;
          *v95 = v110;
          v95[1] = v109 + 2;
          v95[2] = &v108[16 * v107];
          if (v103) {
            operator delete(v103);
          }
        }
        else
        {
          double *v101 = v97;
          v101[1] = v98;
          v102 = v101 + 2;
        }
        v95[1] = v102;
      }
      v111 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
      v112 = (double **)v111;
      uint64_t v113 = (uint64_t)(v111 + 2);
      v114 = (double *)v111[2];
      v115 = (double *)v111[1];
      if (v115 >= v114)
      {
        v117 = (double *)*v111;
        uint64_t v118 = ((char *)v115 - (char *)*v112) >> 4;
        unint64_t v119 = v118 + 1;
        if ((unint64_t)(v118 + 1) >> 60) {
          sub_100004E40();
        }
        uint64_t v120 = (char *)v114 - (char *)v117;
        if (v120 >> 3 > v119) {
          unint64_t v119 = v120 >> 3;
        }
        if ((unint64_t)v120 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v121 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v121 = v119;
        }
        if (v121)
        {
          v122 = (char *)sub_10001EAB0(v113, v121);
          v117 = *v112;
          v115 = v112[1];
        }
        else
        {
          v122 = 0;
        }
        v123 = (double *)&v122[16 * v118];
        v124 = (double *)&v122[16 * v121];
        double *v123 = v76;
        v123[1] = v77;
        v116 = v123 + 2;
        if (v115 != v117)
        {
          do
          {
            *((_OWORD *)v123 - 1) = *((_OWORD *)v115 - 1);
            v123 -= 2;
            v115 -= 2;
          }
          while (v115 != v117);
          v117 = *v112;
        }
        *v112 = v123;
        v112[1] = v116;
        v112[2] = v124;
        if (v117) {
          operator delete(v117);
        }
      }
      else
      {
        double *v115 = v76;
        v115[1] = v77;
        v116 = v115 + 2;
      }
      v112[1] = v116;
      v80 = (float *)__p[0];
      if (__p[0])
      {
        __p[1] = __p[0];
        goto LABEL_112;
      }
    }
  }
  v125 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  [(CRLBezierPathSimplifier *)self setTailLength:((uint64_t)(v125[1] - *v125) >> 4) - ((v129 - v128) >> 4)];
}

- (BOOL)findApproximationForPointsWithTailElementType:(int64_t)a3
{
  v5 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  if (v5[1] - *v5 <= 0x10uLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7AE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107B9B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7B08);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier findApproximationForPointsWithTailElementType:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:330 isFatal:0 description:"At least 2 points expected"];
  }
  uint64_t v9 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  if ((id)((v10 - v11) >> 4) == (char *)[(CRLBezierPathSimplifier *)self tailLength] + 1)
  {
    if (a3 == 2)
    {
      [(CRLBezierPathSimplifier *)self setSolutionElementType:2];
      double v12 = [(CRLBezierPathSimplifier *)self associatedPoints];
      -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:", v12->v[0].x, v12->v[0].y);
      double v13 = [(CRLBezierPathSimplifier *)self associatedPoints];
      -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:", v13->v[1].x, v13->v[1].y);
    }
    else
    {
      [(CRLBezierPathSimplifier *)self setSolutionElementType:1];
    }
  }
  else
  {
    v14 = [[CRLPointSequenceCubicBezierApproximator alloc] initWithDataPoints:&self->_pointsToSimplify];
    [(CRLPointSequenceCubicBezierApproximator *)v14 run];
    [(CRLPointSequenceCubicBezierApproximator *)v14 approximationError];
    double v16 = v15;
    [(CRLBezierPathSimplifier *)self threshold];
    if (v16 > v17)
    {

      return 0;
    }
    [(CRLBezierPathSimplifier *)self setSolutionElementType:2];
    [(CRLPointSequenceCubicBezierApproximator *)v14 controlPoint1];
    -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:");
    [(CRLPointSequenceCubicBezierApproximator *)v14 controlPoint2];
    -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:");
  }
  [(CRLBezierPathSimplifier *)self setTailLength:0];
  return 1;
}

- (void)resetSolution
{
  [(CRLBezierPathSimplifier *)self setSolutionElementType:3];
  -[CRLBezierPathSimplifier setControlPoint2:](self, "setControlPoint2:", INFINITY, INFINITY);

  -[CRLBezierPathSimplifier setControlPoint1:](self, "setControlPoint1:", INFINITY, INFINITY);
}

- (void)outputCurrentSolution
{
  v3 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  uint64_t v4 = v3[1] - *v3;
  if ([(CRLBezierPathSimplifier *)self tailLength] + 2 > v4 >> 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7B28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107BB50();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7B48);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:366 isFatal:0 description:"At least 2 points expected before the tail"];
  }
  uint64_t v8 = *((void *)[(CRLBezierPathSimplifier *)self pointsToSimplify] + 1);
  uint64_t v9 = v8 - 16 * [(CRLBezierPathSimplifier *)self tailLength];
  double v11 = *(double *)(v9 - 16);
  double v10 = *(double *)(v9 - 8);
  if ((id)[(CRLBezierPathSimplifier *)self solutionElementType] == (id)2)
  {
    [(CRLBezierPathSimplifier *)self controlPoint1];
    if (!sub_100065BC8(v12, v13)
      || ([(CRLBezierPathSimplifier *)self controlPoint2], (sub_100065BC8(v14, v15) & 1) == 0))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D7B68);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107BA40();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D7B88);
      }
      double v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:369 isFatal:0 description:"Undefined cubic control points"];
    }
    double v19 = [(CRLBezierPathSimplifier *)self simplifiedPath];
    [(CRLBezierPathSimplifier *)self controlPoint1];
    double v21 = v20;
    double v23 = v22;
    [(CRLBezierPathSimplifier *)self controlPoint2];
    [v19 curveToPoint:v11 controlPoint1:v10 controlPoint2:v21, v23, v24, v25];
  }
  else if ((id)[(CRLBezierPathSimplifier *)self solutionElementType] == (id)1)
  {
    double v19 = [(CRLBezierPathSimplifier *)self simplifiedPath];
    [v19 lineToPoint:v11, v10];
  }
  else
  {
    int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7BA8);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
      sub_10107BAC8((int)[(CRLBezierPathSimplifier *)self solutionElementType], buf, v26, (os_log_t)v27);
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7BC8);
    }
    v28 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier outputCurrentSolution]");
    float v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v29, 374, 0, "Unexpected solution element type: %d", [(CRLBezierPathSimplifier *)self solutionElementType]);
  }
  v30 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  id v31 = *(char **)[(CRLBezierPathSimplifier *)self pointsToSimplify];
  uint64_t v32 = *((void *)[(CRLBezierPathSimplifier *)self pointsToSimplify] + 1);
  unint64_t v33 = [(CRLBezierPathSimplifier *)self tailLength];
  if (v31 != (char *)(v32 + 16 * ~v33))
  {
    v34 = (unsigned char *)(v32 + 16 * ~v33);
    double v35 = (unsigned char *)v30[1];
    int64_t v36 = v35 - v34;
    if (v35 != v34) {
      memmove(v31, v34, v35 - v34);
    }
    v30[1] = &v31[v36];
  }
  [(CRLBezierPathSimplifier *)self resetSolution];
}

- (void)run
{
  v3 = [(CRLBezierPathSimplifier *)self path];
  uint64_t v4 = (char *)[v3 elementCount];

  v5 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
  v5[1] = *v5;
  if (v4)
  {
    double v7 = 0;
    *(void *)&long long v6 = 67109378;
    long long v55 = v6;
    while (1)
    {
      uint64_t v8 = [(CRLBezierPathSimplifier *)self associatedPoints];
      v8->v[2] = (CGPoint)xmmword_101175160;
      uint64_t v9 = [(CRLBezierPathSimplifier *)self associatedPoints];
      v9->v[1] = v8->v[2];
      *(CGPoint *)[(CRLBezierPathSimplifier *)self associatedPoints] = v9->v[1];
      double v10 = [(CRLBezierPathSimplifier *)self path];
      id v11 = [v10 elementAtIndex:v7 associatedPoints:[self associatedPoints]];

      ++v7;
      BOOL v12 = 1;
      if (v7 != v4 && v11 != (id)3)
      {
        double v13 = [(CRLBezierPathSimplifier *)self path];
        id v14 = [v13 elementAtIndex:v7];

        BOOL v12 = v14 == 0;
      }
      double v15 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
      uint64_t v16 = v15[1];
      if (!v11)
      {
        if (v16 != *v15)
        {
          unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D7BE8);
          }
          v28 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v57 = v27;
            __int16 v58 = 2082;
            v59 = "-[CRLBezierPathSimplifier run]";
            __int16 v60 = 2082;
            v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
            __int16 v62 = 1024;
            int v63 = 392;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Subpath should start with zero points", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D7C08);
          }
          float v29 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v53 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v55;
            unsigned int v57 = v27;
            __int16 v58 = 2114;
            v59 = v53;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]");
          id v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:392 isFatal:0 description:"Subpath should start with zero points"];
        }
        if (v12) {
          goto LABEL_66;
        }
        [(CRLBezierPathSimplifier *)self resetSolution];
        uint64_t v32 = [(CRLBezierPathSimplifier *)self associatedPoints];
        -[CRLBezierPathSimplifier setStartOfSubpath:](self, "setStartOfSubpath:", v32->v[0].x, v32->v[0].y);
        unint64_t v33 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
        [(CRLBezierPathSimplifier *)self startOfSubpath];
        uint64_t v36 = v34;
        uint64_t v37 = v35;
        v38 = (char *)v33[2];
        unint64_t v39 = (char *)v33[1];
        if (v39 >= v38)
        {
          float v44 = (char *)*v33;
          uint64_t v45 = (v39 - (unsigned char *)*v33) >> 4;
          unint64_t v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 60) {
            sub_100004E40();
          }
          uint64_t v47 = v38 - v44;
          if (v47 >> 3 > v46) {
            unint64_t v46 = v47 >> 3;
          }
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v48 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v48 = v46;
          }
          if (v48)
          {
            double v49 = (char *)sub_10001EAB0((uint64_t)(v33 + 2), v48);
            float v44 = (char *)*v33;
            unint64_t v39 = (char *)v33[1];
          }
          else
          {
            double v49 = 0;
          }
          double v50 = &v49[16 * v45];
          *(void *)double v50 = v36;
          *((void *)v50 + 1) = v37;
          double v51 = v50;
          if (v39 != v44)
          {
            do
            {
              *((_OWORD *)v51 - 1) = *((_OWORD *)v39 - 1);
              v51 -= 16;
              v39 -= 16;
            }
            while (v39 != v44);
            float v44 = (char *)*v33;
          }
          double v40 = v50 + 16;
          *unint64_t v33 = v51;
          v33[1] = v50 + 16;
          v33[2] = &v49[16 * v48];
          if (v44) {
            operator delete(v44);
          }
        }
        else
        {
          *(void *)unint64_t v39 = v34;
          *((void *)v39 + 1) = v35;
          double v40 = v39 + 16;
        }
        v33[1] = v40;
        float v43 = [(CRLBezierPathSimplifier *)self simplifiedPath];
        [(CRLBezierPathSimplifier *)self startOfSubpath];
        [v43 moveToPoint:];
        goto LABEL_65;
      }
      if (v16 == *v15)
      {
        unsigned int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7C28);
        }
        v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          unsigned int v57 = v17;
          __int16 v58 = 2082;
          v59 = "-[CRLBezierPathSimplifier run]";
          __int16 v60 = 2082;
          v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
          __int16 v62 = 1024;
          int v63 = 400;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Subpath should have been started", buf, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7C48);
        }
        double v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          v52 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = v55;
          unsigned int v57 = v17;
          __int16 v58 = 2114;
          v59 = v52;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        double v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]");
        double v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:400 isFatal:0 description:"Subpath should have been started"];
      }
      [(CRLBezierPathSimplifier *)self addPointsForElementOfType:v11];
      if (![(CRLBezierPathSimplifier *)self tailLength]) {
        break;
      }
      if (![(CRLBezierPathSimplifier *)self findApproximationForPointsWithTailElementType:v11])
      {
        [(CRLBezierPathSimplifier *)self outputCurrentSolution];
        if (![(CRLBezierPathSimplifier *)self findApproximationForPointsWithTailElementType:v11])
        {
          unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D7C68);
          }
          double v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v57 = v22;
            __int16 v58 = 2082;
            v59 = "-[CRLBezierPathSimplifier run]";
            __int16 v60 = 2082;
            v61 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm";
            __int16 v62 = 1024;
            int v63 = 407;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d One element should always produce success", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D7C88);
          }
          double v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
          {
            unint64_t v54 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v55;
            unsigned int v57 = v22;
            __int16 v58 = 2114;
            v59 = v54;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSimplifier run]");
          int v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathSimplifier.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:407 isFatal:0 description:"One element should always produce success"];
        }
      }
      if (v12) {
        goto LABEL_46;
      }
LABEL_48:
      if (v11 == (id)3)
      {
        float v43 = [(CRLBezierPathSimplifier *)self simplifiedPath];
        [v43 closePath];
LABEL_65:
      }
LABEL_66:
      if (v7 == v4) {
        return;
      }
    }
    if (!v12) {
      goto LABEL_48;
    }
    double v41 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
    if (v41[1] - *v41 != 16) {
LABEL_46:
    }
      [(CRLBezierPathSimplifier *)self outputCurrentSolution];
    float v42 = [(CRLBezierPathSimplifier *)self pointsToSimplify];
    v42[1] = *v42;
    goto LABEL_48;
  }
}

+ (id)cleanPathForPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CRLBezierPath);
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  uint64_t v7 = (uint64_t)[v3 elementCount];
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    v19.double x = CGPointZero.x;
    v19.double y = y;
    while (1)
    {
      CGPoint v22 = CGPointZero;
      CGPoint v21 = v22;
      CGPoint v20 = v22;
      switch((unint64_t)objc_msgSend(v3, "elementAtIndex:associatedPoints:", v8, &v20, v19))
      {
        case 0uLL:
          [(CRLBezierPath *)v4 moveToPoint:v20];
          double y = v20.y;
          double x = v20.x;
          CGPoint v19 = v20;
          goto LABEL_17;
        case 1uLL:
          double v10 = v20.y;
          double v9 = v20.x;
          if (!sub_100064084(x, y, v20.x, v20.y))
          {
            if (v8 + 1 >= v7
              || (v11 = objc_msgSend(v3, "elementAtIndex:"), v10 = v20.y, double v9 = v20.x, v11 != (id)3)
              || !sub_100064084(v20.x, v20.y, v19.x, v19.y))
            {
              -[CRLBezierPath lineToPoint:](v4, "lineToPoint:", v9, v10);
              double y = v20.y;
              double x = v20.x;
            }
          }
          goto LABEL_17;
        case 2uLL:
          CGPoint v12 = v20;
          if (sub_100064084(x, y, v20.x, v20.y))
          {
            double v14 = v21.y;
            double v13 = v21.x;
            BOOL v15 = sub_100064084(x, y, v21.x, v21.y);
            double v17 = v22.y;
            double v16 = v22.x;
            if (v15 && sub_100064084(x, y, v22.x, v22.y)) {
              goto LABEL_17;
            }
          }
          else
          {
            double v17 = v22.y;
            double v16 = v22.x;
            double v14 = v21.y;
            double v13 = v21.x;
          }
          -[CRLBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v16, v17, v12, v13, v14);
          double y = v22.y;
          double x = v22.x;
LABEL_17:
          if (v7 == ++v8) {
            goto LABEL_18;
          }
          break;
        case 3uLL:
          [(CRLBezierPath *)v4 closePath];
          goto LABEL_17;
        default:
          goto LABEL_17;
      }
    }
  }
LABEL_18:

  return v4;
}

+ (id)simplifiedPathWithRawPath:(id)a3 threshold:(double)a4
{
  v5 = [a1 cleanPathForPath:a3];
  long long v6 = [[CRLBezierPathSimplifier alloc] initWithPath:v5 threshold:a4];
  [(CRLBezierPathSimplifier *)v6 run];
  uint64_t v7 = [(CRLBezierPathSimplifier *)v6 simplifiedPath];

  return v7;
}

- (void)pointsToSimplify
{
  return &self->_pointsToSimplify;
}

- (void)setPointsToSimplify:(void *)a3
{
  p_pointsToSimplifdouble y = (char *)&self->_pointsToSimplify;
  if (p_pointsToSimplify != a3) {
    sub_10001EAE8(p_pointsToSimplify, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  }
}

- (CRLPointVector3)associatedPoints
{
  return &self->_associatedPoints;
}

- (void)setAssociatedPoints:(CRLPointVector3 *)a3
{
  CGPoint v3 = a3->v[0];
  CGPoint v4 = a3->v[1];
  self->_associatedPoints.v[2] = a3->v[2];
  self->_associatedPoints.v[1] = v4;
  self->_associatedPoints.v[0] = v3;
}

- (CGPoint)startOfSubpath
{
  double x = self->_startOfSubpath.x;
  double y = self->_startOfSubpath.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartOfSubpath:(CGPoint)a3
{
  self->_startOfSubpath = a3;
}

- (unint64_t)tailLength
{
  return self->_tailLength;
}

- (void)setTailLength:(unint64_t)a3
{
  self->_tailLength = a3;
}

- (int64_t)solutionElementType
{
  return self->_solutionElementType;
}

- (void)setSolutionElementType:(int64_t)a3
{
  self->_solutionElementType = a3;
}

- (CGPoint)controlPoint1
{
  double x = self->_controlPoint1.x;
  double y = self->_controlPoint1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlPoint1:(CGPoint)a3
{
  self->_controlPoint1 = a3;
}

- (CGPoint)controlPoint2
{
  double x = self->_controlPoint2.x;
  double y = self->_controlPoint2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setControlPoint2:(CGPoint)a3
{
  self->_controlPoint2 = a3;
}

- (CRLBezierPath)simplifiedPath
{
  return self->_simplifiedPath;
}

- (CRLBezierPath)path
{
  return self->_path;
}

- (double)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  begin = self->_pointsToSimplify.__begin_;
  if (begin)
  {
    self->_pointsToSimplify.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_simplifiedPath, 0);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  CGPoint v2 = CGPointZero;
  *(CGPoint *)((char *)self + 152) = CGPointZero;
  *(CGPoint *)((char *)self + 136) = v2;
  *(CGPoint *)((char *)self + 120) = v2;
  return self;
}

@end