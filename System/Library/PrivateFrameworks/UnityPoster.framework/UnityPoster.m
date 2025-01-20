double UPSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

id UPQuiltCornerBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  v13 = (void *)MEMORY[0x263F824C0];
  id v14 = a1;
  v15 = [v13 bezierPath];
  objc_msgSend(v15, "moveToPoint:", a6, a7);
  UPBezierPathAddValues(v15, v14, a6, a7, a4, a5, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  objc_msgSend(v15, "addLineToPoint:", a2, a3);
  objc_msgSend(v15, "addLineToPoint:", a6, a7);
  [v15 closePath];
  return v15;
}

double UPBezierPathAddValues(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15 = a1;
  id v16 = a2;
  v17 = UPOrderedKeysForValues(v16);
  v18 = v17;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x3010000000;
  double v49 = 0.0;
  double v50 = 0.0;
  v48 = &unk_2352C37DE;
  if (a7 == *MEMORY[0x263F00148] && a8 == *(double *)(MEMORY[0x263F00148] + 8))
  {
    uint64_t v28 = 0;
    double v49 = a3;
    double v50 = a4;
  }
  else
  {
    v20 = [v17 firstObject];
    v21 = [v16 objectForKey:v20];
    [v20 floatValue];
    float v23 = v22;
    [v21 floatValue];
    double v25 = UPTangentialPointFromLine(a3, a4, a5, a6, v23, v24);
    v26 = v46;
    v46[4] = v25;
    *((void *)v26 + 5) = v27;
    objc_msgSend(v15, "addQuadCurveToPoint:controlPoint:");

    uint64_t v28 = 1;
  }
  if ([v18 count])
  {
    uint64_t v29 = [v18 count];
    v30 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v28, v29 - v28);
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __UPBezierPathAddValues_block_invoke;
    v33[3] = &unk_264C4C6B8;
    double v39 = a3;
    double v40 = a4;
    double v41 = a5;
    double v42 = a6;
    id v34 = v16;
    v36 = v44;
    v37 = v43;
    id v35 = v15;
    v38 = &v45;
    [v18 enumerateObjectsAtIndexes:v30 options:0 usingBlock:v33];

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);
  }
  double v31 = v46[4];
  _Block_object_dispose(&v45, 8);

  return v31;
}

void sub_2352BE9EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id UPQuiltPieceTopBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  v17 = (void *)MEMORY[0x263F824C0];
  id v18 = a1;
  v19 = [v17 bezierPath];
  objc_msgSend(v19, "moveToPoint:", a2, a3);
  objc_msgSend(v19, "addLineToPoint:", a4, a5);
  objc_msgSend(v19, "addLineToPoint:", a8, a9);
  UPBezierPathAddValues(v19, v18, a8, a9, a6, a7, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  objc_msgSend(v19, "addLineToPoint:", a2, a3);
  [v19 closePath];
  return v19;
}

id UPQuiltPieceBottomBezierPath(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  v17 = (void *)MEMORY[0x263F824C0];
  id v18 = a1;
  v19 = [v17 bezierPath];
  objc_msgSend(v19, "moveToPoint:", a2, a3);
  objc_msgSend(v19, "addLineToPoint:", a4, a5);
  UPBezierPathAddValues(v19, v18, a4, a5, a8, a9, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  objc_msgSend(v19, "addLineToPoint:", a6, a7);
  objc_msgSend(v19, "addLineToPoint:", a2, a3);
  [v19 closePath];
  return v19;
}

id UPOrderedKeysForValues(void *a1)
{
  uint64_t v1 = [a1 allKeys];
  v2 = [v1 sortedArrayUsingComparator:&__block_literal_global];

  return v2;
}

BOOL __UPOrderedKeysForValues_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:") == 1;
}

double UPTangentialPointFromLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = a3 - a1;
  double v10 = -1.0 / ((a4 - a2) / (a3 - a1));
  float v11 = v10;
  float v12 = atanf(v11);
  if (v10 <= 0.0) {
    float v12 = -v12;
  }
  return a1 + v9 * fmin(fmax(a5, 0.0), 1.0) + a6 * -50.0 * __sincosf_stret(v12).__cosval;
}

double UPFloatForNumber(void *a1)
{
  [a1 floatValue];
  return v1;
}

void __UPBezierPathAddValues_block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v30 = [v3 objectForKey:v4];
  [v4 floatValue];
  float v6 = v5;

  [v30 floatValue];
  double v8 = v7;
  double v9 = *(double *)(a1 + 72);
  double v10 = *(double *)(a1 + 80);
  double v11 = *(double *)(a1 + 88);
  double v12 = *(double *)(a1 + 96);
  double v29 = v6;
  double v13 = UPTangentialPointFromLine(v9, v10, v11, v12, v6, v7);
  double v15 = v14;
  double v16 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v28 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  [*(id *)(a1 + 40) currentPoint];
  if (v18 != v13 || v17 != v15)
  {
    double v20 = (v16 + v29) * 0.5;
    double v21 = UPTangentialPointFromLine(v9, v10, v11, v12, v20, v8);
    double v26 = v22;
    double v27 = v21;
    double v23 = UPTangentialPointFromLine(v9, v10, v11, v12, v20, v28);
    objc_msgSend(*(id *)(a1 + 40), "addCurveToPoint:controlPoint1:controlPoint2:", v13, v15, v23, v24, v27, v26);
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v29;
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
  *(double *)(v25 + 32) = v13;
  *(double *)(v25 + 40) = v15;
}

double UPBeierGetPointOnLine(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * (1.0 - a5) + a5 * a1;
}

double UPBezierExtrapolatePointOnLine()
{
  return -50.0;
}

double UPInterpolateBetweenPointsUnclipped(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * a5;
}

double UPInterpolateBetweenPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + (a3 - a1) * fmin(fmax(a5, 0.0), 1.0);
}

double UPTangentialInterceptingFractionOnLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return ((a6 - -1.0 / ((a4 - a2) / (a3 - a1)) * a5 - (a2 - (a4 - a2) / (a3 - a1) * a1))
        / ((a4 - a2) / (a3 - a1) - -1.0 / ((a4 - a2) / (a3 - a1)))
        - a1)
       / (a3 - a1);
}

double UPHorizontalFractionOnLine(double a1, double a2, double a3, double a4, double a5)
{
  return a5 / (a3 - a1);
}

double UPLengthBetweenPoints(double a1, double a2, double a3, double a4)
{
  float v4 = a1 - a3;
  float v5 = a2 - a4;
  return sqrtf((float)(v4 * v4) + (float)(v5 * v5));
}

CGFloat UPHorizontallyCenteredFrameWithEdgeInsets(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double v11 = (a5 + a7) * (CGRectGetWidth(*(CGRect *)&a1) * 0.5);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  return a1 + v11 / CGRectGetHeight(v13);
}

void UPBuildPathElement(void *a1, uint64_t a2)
{
  id v9 = a1;
  if ([v9 count])
  {
    v3 = [v9 lastObject];
    [v3 endPoint];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v8 = -[UPBezierPathElement initWithStartPoint:pathElement:]([UPBezierPathElement alloc], "initWithStartPoint:pathElement:", a2, v5, v7);
  [v9 addObject:v8];
}

id UPInterpolateBetweenBezierPaths(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  double v7 = v6;
  if (!v5)
  {
    id v60 = v6;
LABEL_24:
    id v61 = v60;
    goto LABEL_45;
  }
  if (!v6)
  {
    id v60 = v5;
    goto LABEL_24;
  }
  double v8 = [MEMORY[0x263F824C0] bezierPath];
  id v9 = [MEMORY[0x263EFF980] array];
  id v10 = v5;
  CGPathApply((CGPathRef)[v10 CGPath], v9, (CGPathApplierFunction)UPBuildPathElement);
  double v11 = [MEMORY[0x263EFF980] array];
  id v12 = v7;
  CGPathApply((CGPathRef)[v12 CGPath], v11, (CGPathApplierFunction)UPBuildPathElement);
  if ([v9 count])
  {
    if ([v11 count])
    {
      double v13 = fmin(fmax(a3, 0.0), 1.0);
      unint64_t v14 = [v9 count];
      unint64_t v15 = [v11 count];
      if (v14 >= v15) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16)
      {
        unint64_t v17 = 0;
        do
        {
          double v18 = [v9 objectAtIndexedSubscript:v17];
          v19 = [v11 objectAtIndexedSubscript:v17];
          int v20 = [v18 type];
          if (v20 == [v19 type])
          {
            switch([v18 type])
            {
              case 0u:
                [v18 endPoint];
                double v22 = v21;
                double v24 = v23;
                [v19 endPoint];
                objc_msgSend(v8, "moveToPoint:", v22 + (v25 - v22) * v13, v24 + (v26 - v24) * v13);
                break;
              case 1u:
                goto LABEL_13;
              case 2u:
                [v18 endPoint];
                double v37 = v36;
                double v39 = v38;
                [v19 endPoint];
                double v41 = v37 + (v40 - v37) * v13;
                double v43 = v39 + (v42 - v39) * v13;
                uint64_t v44 = [v18 points];
                uint64_t v45 = [v19 points];
                objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v41, v43, *(double *)(v44 + 16) + (*(double *)(v45 + 16) - *(double *)(v44 + 16)) * v13, *(double *)(v44 + 24) + (*(double *)(v45 + 24) - *(double *)(v44 + 24)) * v13);
                break;
              case 3u:
                [v18 endPoint];
                double v47 = v46;
                double v49 = v48;
                [v19 endPoint];
                double v51 = v47 + (v50 - v47) * v13;
                double v53 = v49 + (v52 - v49) * v13;
                uint64_t v54 = [v18 points];
                uint64_t v55 = [v19 points];
                double v56 = *(double *)(v54 + 16) + (*(double *)(v55 + 16) - *(double *)(v54 + 16)) * v13;
                double v57 = *(double *)(v54 + 24) + (*(double *)(v55 + 24) - *(double *)(v54 + 24)) * v13;
                uint64_t v58 = [v18 points];
                uint64_t v59 = [v19 points];
                objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v51, v53, v56, v57, *(double *)(v58 + 32) + (*(double *)(v59 + 32) - *(double *)(v58 + 32)) * v13, *(double *)(v58 + 40) + (*(double *)(v59 + 40) - *(double *)(v58 + 40)) * v13);
                break;
              case 4u:
                [v8 closePath];
                break;
              default:
                break;
            }
          }
          else
          {
LABEL_13:
            [v18 endPoint];
            double v28 = v27;
            double v30 = v29;
            [v19 endPoint];
            objc_msgSend(v8, "addLineToPoint:", v28 + (v31 - v28) * v13, v30 + (v32 - v30) * v13);
          }

          ++v17;
          unint64_t v33 = [v9 count];
          unint64_t v34 = [v11 count];
          if (v33 >= v34) {
            unint64_t v35 = v34;
          }
          else {
            unint64_t v35 = v33;
          }
        }
        while (v17 < v35);
      }
      for (unint64_t i = [v9 count]; i < objc_msgSend(v11, "count"); ++i)
      {
        v63 = [v9 lastObject];
        v64 = [v11 objectAtIndexedSubscript:i];
        switch([v64 type])
        {
          case 0u:
            [v63 endPoint];
            double v66 = v65;
            double v68 = v67;
            [v64 endPoint];
            objc_msgSend(v8, "moveToPoint:", v66 + (v69 - v66) * v13, v68 + (v70 - v68) * v13);
            break;
          case 1u:
            [v63 endPoint];
            double v72 = v71;
            double v74 = v73;
            [v64 endPoint];
            objc_msgSend(v8, "addLineToPoint:", v72 + (v75 - v72) * v13, v74 + (v76 - v74) * v13);
            break;
          case 2u:
            [v63 endPoint];
            double v78 = v77;
            double v80 = v79;
            [v64 endPoint];
            double v82 = v78 + (v81 - v78) * v13;
            double v84 = v80 + (v83 - v80) * v13;
            [v63 endPoint];
            double v86 = v85;
            double v88 = v87;
            uint64_t v89 = [v64 points];
            objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v82, v84, v86 + (*(double *)(v89 + 16) - v86) * v13, v88 + (*(double *)(v89 + 24) - v88) * v13);
            break;
          case 3u:
            [v63 endPoint];
            double v91 = v90;
            double v93 = v92;
            [v64 endPoint];
            double v95 = v91 + (v94 - v91) * v13;
            double v97 = v93 + (v96 - v93) * v13;
            [v63 endPoint];
            double v99 = v98;
            double v101 = v100;
            uint64_t v102 = [v64 points];
            double v103 = v99 + (*(double *)(v102 + 16) - v99) * v13;
            double v104 = v101 + (*(double *)(v102 + 24) - v101) * v13;
            [v63 endPoint];
            double v106 = v105;
            double v108 = v107;
            uint64_t v109 = [v64 points];
            objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v95, v97, v103, v104, v106 + (*(double *)(v109 + 32) - v106) * v13, v108 + (*(double *)(v109 + 40) - v108) * v13);
            break;
          case 4u:
            [v8 closePath];
            break;
          default:
            break;
        }
      }
      unint64_t v110 = [v11 count];
      id v12 = v8;
      if (v110 < [v9 count])
      {
        do
        {
          v111 = [v9 objectAtIndexedSubscript:v110];
          v112 = [v11 lastObject];
          switch([v112 type])
          {
            case 0u:
              [v111 endPoint];
              double v114 = v113;
              double v116 = v115;
              [v112 endPoint];
              objc_msgSend(v8, "moveToPoint:", v114 + (v117 - v114) * v13, v116 + (v118 - v116) * v13);
              break;
            case 1u:
              [v111 endPoint];
              double v120 = v119;
              double v122 = v121;
              [v112 endPoint];
              objc_msgSend(v8, "addLineToPoint:", v120 + (v123 - v120) * v13, v122 + (v124 - v122) * v13);
              break;
            case 2u:
              [v111 endPoint];
              double v126 = v125;
              double v128 = v127;
              [v112 endPoint];
              double v130 = v126 + (v129 - v126) * v13;
              double v132 = v128 + (v131 - v128) * v13;
              uint64_t v133 = [v111 points];
              [v112 endPoint];
              objc_msgSend(v8, "addQuadCurveToPoint:controlPoint:", v130, v132, *(double *)(v133 + 16) + (v134 - *(double *)(v133 + 16)) * v13, *(double *)(v133 + 24) + (v135 - *(double *)(v133 + 24)) * v13);
              break;
            case 3u:
              [v111 endPoint];
              double v137 = v136;
              double v139 = v138;
              [v112 endPoint];
              double v141 = v137 + (v140 - v137) * v13;
              double v143 = v139 + (v142 - v139) * v13;
              uint64_t v144 = [v111 points];
              [v112 endPoint];
              double v146 = *(double *)(v144 + 16) + (v145 - *(double *)(v144 + 16)) * v13;
              double v148 = *(double *)(v144 + 24) + (v147 - *(double *)(v144 + 24)) * v13;
              uint64_t v149 = [v111 points];
              [v112 endPoint];
              objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", v141, v143, v146, v148, *(double *)(v149 + 32) + (v150 - *(double *)(v149 + 32)) * v13, *(double *)(v149 + 40) + (v151 - *(double *)(v149 + 40)) * v13);
              break;
            case 4u:
              [v8 closePath];
              break;
            default:
              break;
          }

          ++v110;
        }
        while (v110 < [v9 count]);
        id v12 = v8;
      }
    }
    else
    {
      id v12 = v10;
    }
  }
  id v61 = v12;

LABEL_45:
  return v61;
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

CGPathRef CGPathCreateCopyByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE6FE0](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x270EE6FF8](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}