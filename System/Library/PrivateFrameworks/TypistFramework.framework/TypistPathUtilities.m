@interface TypistPathUtilities
+ (BOOL)_validatePoints:(CGPoint)a3 To:(CGPoint)a4;
+ (BOOL)isKoreanConsonantVariant:(unsigned __int16)a3;
+ (CGAffineTransform)_determineShiftBasedOnDirection:(SEL)a3;
+ (CGAffineTransform)_makeTranslationWithOffset:(SEL)a3;
+ (CGPoint)_addPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
+ (CGPoint)_reflectPoint:(CGPoint)a3 origin:(CGPoint)a4;
+ (CGPoint)_scalarMultiplyPoint:(CGPoint)a3 by:(double)a4;
+ (CGPoint)_subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4;
+ (CGPoint)pointOnCurve:(id)a3 atTime:(double)a4;
+ (CGPoint)pointOnSineCurve:(double)a3 withHeight:(double)a4 withStartPoint:(CGPoint)a5 withEndPoint:(CGPoint)a6 atTime:(double)a7;
+ (CGSize)_getWidthAndHeight:(id)a3 forCharacters:(id)a4;
+ (double)_dotProduct:(CGPoint)a3 and:(CGPoint)a4;
+ (double)getWidthOfFirstCharacterInString:(id)a3;
+ (id)_connectPath:(id)a3 forCharacters:(id)a4 withRegion:(id)a5;
+ (id)_decomposeCharactersWhereNeeded:(id)a3;
+ (id)_decomposeGraphemeIntoSeparateCharactersIfNeeded:(id)a3;
+ (id)_determineWritingStyle:(id)a3 forCharacters:(id)a4;
+ (id)_jamoShiftsForStructure:(int)a3;
+ (id)_processArabicCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5;
+ (id)_processCharacters:(id)a3 withPathMap:(id)a4 forLocale:(int)a5;
+ (id)_processHangulCharacter:(unsigned __int16)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5;
+ (id)_processThaiCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5;
+ (id)_queryHandwritingSourceForCharactersInString:(id)a3 withRegion:(id)a4;
+ (id)_separateFinalFormCharacters:(id)a3;
+ (id)_separateIsolatedCharacters:(id)a3;
+ (id)_separateUniqueCharacters:(id)a3;
+ (id)_shiftPath:(id)a3 forCharacters:(id)a4 withRule:(int)a5;
+ (id)_shiftThaiStrokes:(id)a3 withRatio:(double)a4 ofHeight:(int64_t)a5;
+ (id)convertCurveDeleteTouchPoints:(CGPoint)a3 endPoint:(CGPoint)a4 curveHeight:(double)a5 curveDensity:(int64_t)a6 tilt:(double)a7;
+ (id)convertSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4;
+ (id)convertSVGStringPathToUIBezierPath:(id)a3;
+ (id)convertSingleSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4;
+ (id)convertUIBezierPathToTouchPoints:(id)a3;
+ (id)generatePathArgumentStringWithParameters:(id)a3 fromPoints:(id)a4;
+ (id)generatePathWithParameters:(id)a3 fromPoints:(id)a4;
+ (id)getPathDataForCharacters:(id)a3 withRegion:(id)a4 isCursive:(BOOL)a5;
+ (id)getStrokesForJamo:(id)a3 forVariant:(BOOL)a4 ofType:(int)a5 fromPath:(id)a6 forLocale:(unint64_t)a7;
+ (id)getTextClustersFrom:(id)a3 forCharacters:(id)a4;
+ (id)getTextClustersFrom:(id)a3 withRegion:(id)a4;
+ (id)shiftJamosInSyllable:(id)a3 withPath:(id)a4 forLocale:(unint64_t)a5;
+ (id)shiftStrokesForJamo:(id)a3 withDirection:(int)a4;
+ (int)_getScribbleRuleFromRegion:(id)a3;
+ (int)_mappingRegionToVariantID:(id)a3;
+ (sqlite3)_openDatabaseFromFile:(id)a3;
+ (unint64_t)_queryDatabase:(sqlite3 *)a3 withSql:(id)a4 forRegion:(id)a5;
+ (unint64_t)getTotalWidthForText:(id)a3 isCursive:(BOOL)a4 withRegion:(id)a5 fromPathMap:(id)a6;
@end

@implementation TypistPathUtilities

+ (double)_dotProduct:(CGPoint)a3 and:(CGPoint)a4
{
  return a3.y * a4.y + a3.x * a4.x;
}

+ (CGPoint)_subtractPoint:(CGPoint)a3 byPoint:(CGPoint)a4
{
  double v4 = a3.x - a4.x;
  double v5 = a3.y - a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_addPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a3.y + a4.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_scalarMultiplyPoint:(CGPoint)a3 by:(double)a4
{
  double v4 = a3.x * a4;
  double v5 = a3.y * a4;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)_reflectPoint:(CGPoint)a3 origin:(CGPoint)a4
{
  double v4 = a4.x + a4.x - a3.x;
  double v5 = a4.y + a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)pointOnCurve:(id)a3 atTime:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6 == 3)
  {
    v12 = [v5 objectAtIndexedSubscript:0];
    [v12 CGPointValue];
    double v14 = v13;

    v15 = [v5 objectAtIndexedSubscript:1];
    [v15 CGPointValue];
    double v17 = v16;

    v18 = [v5 objectAtIndexedSubscript:2];
    [v18 CGPointValue];
    double v20 = v19;

    v21 = [v5 objectAtIndexedSubscript:0];
    [v21 CGPointValue];
    double v23 = v22;

    v24 = [v5 objectAtIndexedSubscript:1];
    [v24 CGPointValue];
    double v26 = v25;

    v27 = [v5 objectAtIndexedSubscript:2];
    [v27 CGPointValue];
    double v29 = v28;

    float v30 = 1.0 - a4;
    double v31 = (float)(v30 * v30);
    double v32 = (1.0 - a4 + 1.0 - a4) * a4;
    double v9 = v32 * v17 + v31 * v14 + a4 * a4 * v20;
    double v11 = v32 * v26 + v31 * v23 + a4 * a4 * v29;
    goto LABEL_9;
  }
  if (v6 == 2)
  {
    v33 = [v5 objectAtIndexedSubscript:0];
    [v33 CGPointValue];
    double v35 = v34;
    double v37 = v36;

    v38 = [v5 objectAtIndexedSubscript:1];
    [v38 CGPointValue];
    double v40 = v39;
    double v42 = v41;

    double v43 = 1.0 - a4;
    double v9 = v40 * a4 + (1.0 - a4) * v35;
    double v44 = v42 * a4;
LABEL_8:
    double v11 = v44 + v43 * v37;
    goto LABEL_9;
  }
  if (v6 != 1)
  {
    v45 = [v5 objectAtIndexedSubscript:0];
    [v45 CGPointValue];
    double v74 = v46;

    v47 = [v5 objectAtIndexedSubscript:1];
    [v47 CGPointValue];
    double v73 = v48;

    v49 = [v5 objectAtIndexedSubscript:2];
    [v49 CGPointValue];
    double v72 = v50;

    v51 = [v5 objectAtIndexedSubscript:3];
    [v51 CGPointValue];
    double v71 = v52;

    v53 = [v5 objectAtIndexedSubscript:0];
    [v53 CGPointValue];
    double v70 = v54;

    v55 = [v5 objectAtIndexedSubscript:1];
    [v55 CGPointValue];
    double v69 = v56;

    v57 = [v5 objectAtIndexedSubscript:2];
    [v57 CGPointValue];
    double v59 = v58;

    v60 = [v5 objectAtIndexedSubscript:3];
    [v60 CGPointValue];
    double v37 = v61;

    float v62 = 1.0 - a4;
    double v63 = powf(v62, 3.0);
    double v64 = a4 * 3.0 * (float)(v62 * v62);
    float v65 = a4;
    double v66 = (1.0 - a4) * (float)((float)(v65 * v65) * 3.0);
    double v43 = powf(v65, 3.0);
    double v9 = v64 * v73 + v63 * v74 + v66 * v72 + v43 * v71;
    double v44 = v64 * v69 + v63 * v70 + v66 * v59;
    goto LABEL_8;
  }
  v7 = [v5 objectAtIndexedSubscript:0];
  [v7 CGPointValue];
  double v9 = v8;
  double v11 = v10;

LABEL_9:
  double v67 = v9;
  double v68 = v11;
  result.y = v68;
  result.x = v67;
  return result;
}

+ (CGPoint)pointOnSineCurve:(double)a3 withHeight:(double)a4 withStartPoint:(CGPoint)a5 withEndPoint:(CGPoint)a6 atTime:(double)a7
{
  CGFloat v7 = a5.x + a7 * (a6.x - a5.x);
  float v8 = 6.28318531 / a3 * v7 - 6.28318531 / a3 * a5.x;
  double v9 = a5.y + a4 * 0.5 * sinf(v8);
  double v10 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

+ (id)convertCurveDeleteTouchPoints:(CGPoint)a3 endPoint:(CGPoint)a4 curveHeight:(double)a5 curveDensity:(int64_t)a6 tilt:(double)a7
{
  double x = a4.x;
  double y = a3.y;
  double v23 = a3.x;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__TypistPathUtilities_convertCurveDeleteTouchPoints_endPoint_curveHeight_curveDensity_tilt___block_invoke;
  v24[3] = &__block_descriptor_40_e8_d16__0d8l;
  v24[4] = 0x3FC5555555555555;
  v12 = (double (**)(void, double))MEMORY[0x261210570](v24, a2);
  double v13 = objc_opt_new();
  if (a6 >= 1)
  {
    double v14 = (x - v23) / (double)a6;
    double v22 = (double)(2 * a6);
    double v15 = -a7;
    double v16 = 0.166666667;
    do
    {
      +[TypistPathUtilities pointOnSineCurve:withHeight:withStartPoint:withEndPoint:atTime:](TypistPathUtilities, "pointOnSineCurve:withHeight:withStartPoint:withEndPoint:atTime:", v14, a5, v23, y, v23 + v14 * 0.5, y, v16);
      double v18 = v17;
      *(float *)&double v17 = 6.28318531 / v14 * v17 - 6.28318531 / v14 * v23;
      double v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v18 + v15 * sinf(*(float *)&v17), v19);
      [v13 addObject:v20];

      double v16 = v12[2](v12, v16);
    }
    while (v16 <= v22);
  }

  return v13;
}

double __92__TypistPathUtilities_convertCurveDeleteTouchPoints_endPoint_curveHeight_curveDensity_tilt___block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

+ (id)generatePathArgumentStringWithParameters:(id)a3 fromPoints:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v31 = (id)objc_opt_new();
  id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v7 setPositiveFormat:@"0.##"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"CPPATHGEN_TIME_INTERVAL"];
  double v9 = (void *)v8;
  double v10 = @"0.0";
  if (v8) {
    double v10 = (__CFString *)v8;
  }
  float v30 = v10;

  double v29 = v5;
  v27 = (void *)[objc_alloc(MEMORY[0x263F7EC18]) initWithParams:v5];
  double v28 = v6;
  double v26 = [v27 generatePathFromInflectionPoints:v6 segmentTiming:0 keys:0 string:0 layout:0];
  double v11 = [v26 samples];
  if ([v11 count])
  {
    unint64_t v12 = 0;
    do
    {
      double v13 = [v11 objectAtIndexedSubscript:v12];
      [v13 point];
      double v15 = v14;
      double v17 = v16;

      double v18 = NSString;
      double v19 = [NSNumber numberWithDouble:v15];
      double v20 = [v7 stringFromNumber:v19];
      v21 = [NSNumber numberWithDouble:v17];
      double v22 = [v7 stringFromNumber:v21];
      double v23 = [&unk_270C6EA70 stringValue];
      v24 = [v18 stringWithFormat:@"[%@ %@ %@ %@] %@ ", v20, v22, &unk_270C6EA60, v23, v30];
      [v31 appendString:v24];

      ++v12;
    }
    while (v12 < [v11 count]);
  }

  return v31;
}

+ (id)generatePathWithParameters:(id)a3 fromPoints:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F7EC18];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithParams:v7];

  double v9 = [v8 generatePathFromInflectionPoints:v6 segmentTiming:0 keys:0 string:0 layout:0];

  return v9;
}

+ (id)convertUIBezierPathToTouchPoints:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_new();
  id v5 = v3;
  id v6 = (const CGPath *)[v5 CGPath];

  CGPathApply(v6, v4, (CGPathApplierFunction)getTouchPoints);
  return v4;
}

+ (id)convertSVGStringPathToUIBezierPath:(id)a3
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v150 = (id)objc_opt_new();
  double v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"MmLlHhVvCcSsQqTtAaZ"];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id obj = v3;
  uint64_t v151 = [obj countByEnumeratingWithState:&v162 objects:v166 count:16];
  if (v151)
  {
    uint64_t v149 = *(void *)v163;
    double v145 = *(double *)(MEMORY[0x263F00148] + 8);
    double v146 = *MEMORY[0x263F00148];
    unint64_t v5 = 0x263F08000uLL;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v163 != v149) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v162 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x263F08B08] scannerWithString:v7];
        id v9 = objc_alloc_init(MEMORY[0x263F1C478]);
        double v10 = objc_msgSend(*(id *)(v5 + 2880), "stringWithFormat:", @"%C", 83);
        if ([v7 containsString:v10])
        {
          int v159 = 1;
        }
        else
        {
          double v11 = objc_msgSend(*(id *)(v5 + 2880), "stringWithFormat:", @"%C", 115);
          int v159 = [v7 containsString:v11];
        }
        unint64_t v12 = objc_opt_new();
        if (([v8 isAtEnd] & 1) == 0)
        {
          double v13 = v146;
          double v14 = v145;
          double v15 = v146;
          double v16 = v145;
          double v152 = v145;
          double v153 = v146;
          double v154 = v145;
          double v155 = v146;
          do
          {
            id v161 = 0;
            [v8 scanCharactersFromSet:v4 intoString:&v161];
            id v17 = v161;
            if (v17)
            {
              double v18 = v17;
              [v12 addObject:v17];
            }
            else
            {
              double v18 = [v12 lastObject];
              TYLogl(OS_LOG_TYPE_DEBUG, @"Command letter misssing, use the preceded one \"%@\"", v19, v20, v21, v22, v23, v24, (char)v18);
            }
            int v25 = [v18 characterAtIndex:0];
            int v26 = v25;
            if (v25 <= 89)
            {
              if (v25 == 76)
              {
LABEL_26:
                [v8 scanPoint];
                double v36 = v35;
                double v38 = v37;
                if (v26 == 108)
                {
                  [v9 currentPoint];
                  +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v36, v38, v39, v40);
                  double v36 = v41;
                  double v38 = v42;
                }
                double v43 = v9;
                double v44 = v36;
                double v45 = v38;
                goto LABEL_29;
              }
              if (v25 == 77)
              {
LABEL_23:
                [v8 scanPoint];
                double v28 = v27;
                double v30 = v29;
                if (v26 == 109)
                {
                  [v9 currentPoint];
                  +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v28, v30, v31, v32);
                  double v28 = v33;
                  double v30 = v34;
                }
                objc_msgSend(v9, "moveToPoint:", v28, v30);
                goto LABEL_30;
              }
            }
            else
            {
              switch(v25)
              {
                case 'l':
                  goto LABEL_26;
                case 'm':
                  goto LABEL_23;
                case 'Z':

                  goto LABEL_10;
              }
            }
            if (v25 > 98)
            {
              if (v25 > 112)
              {
                if (v25 == 113)
                {
LABEL_57:
                  double v98 = v14;
                  [v8 scanPoint];
                  double v100 = v99;
                  double v102 = v101;
                  [v8 scanPoint];
                  double v104 = v103;
                  double v106 = v105;
                  if (v26 == 113)
                  {
                    [v9 currentPoint];
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v100, v102, v107, v108);
                    double v100 = v109;
                    double v102 = v110;
                    [v9 currentPoint];
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v104, v106, v111, v112);
                    double v104 = v113;
                    double v106 = v114;
                  }
                  objc_msgSend(v9, "addQuadCurveToPoint:controlPoint:", v104, v106, v100, v102);
                  double v14 = v98;
                  goto LABEL_30;
                }
                if (v25 == 118)
                {
LABEL_49:
                  double v160 = 0.0;
                  [v8 scanDouble:&v160];
                  if (v26 == 118)
                  {
                    [v9 currentPoint];
                    double v45 = v160 + v51;
                    double v160 = v45;
                  }
                  else
                  {
                    double v45 = v160;
                  }
                  double v44 = 0.0;
LABEL_66:
                  double v43 = v9;
LABEL_29:
                  objc_msgSend(v43, "addLineToPoint:", v44, v45);
                  goto LABEL_30;
                }
              }
              else
              {
                if (v25 == 99)
                {
LABEL_51:
                  double v52 = v13;
                  double v157 = v16;
                  double v158 = v15;
                  [v8 scanPoint];
                  double v156 = v53;
                  double v55 = v54;
                  [v8 scanPoint];
                  double v57 = v56;
                  double v59 = v58;
                  [v8 scanPoint];
                  double v62 = v60;
                  double v63 = v61;
                  if (v159)
                  {
                    double v148 = v55;
                    double v64 = v57;
                    double v65 = v59;
                    double v66 = v61;
                    double v67 = v60;
                    if (v26 != 67)
                    {
                      [v9 currentPoint];
                      +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v57, v59, v68, v69);
                      double v64 = v70;
                      double v65 = v71;
                      [v9 currentPoint];
                      +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v62, v63, v72, v73);
                      double v67 = v74;
                      double v66 = v75;
                    }
                    [v9 currentPoint];
                    double v157 = v65;
                    double v158 = v64;
                    +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v64, v65, v76, v77);
                    double v154 = v79;
                    double v155 = v78;
                    [v9 currentPoint];
                    double v52 = v67;
                    +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v67, v66, v80, v81);
                    double v152 = v83;
                    double v153 = v82;
                    double v14 = v66;
                    double v55 = v148;
                  }
                  double v84 = v14;
                  if (v26 == 99)
                  {
                    [v9 currentPoint];
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v156, v55, v85, v86);
                    double v88 = v87;
                    double v55 = v89;
                    [v9 currentPoint];
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v57, v59, v90, v91);
                    double v57 = v92;
                    double v59 = v93;
                    [v9 currentPoint];
                    +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v62, v63, v94, v95);
                    double v62 = v96;
                    double v63 = v97;
                  }
                  else
                  {
                    double v88 = v156;
                  }
                  objc_msgSend(v9, "addCurveToPoint:controlPoint1:controlPoint2:", v62, v63, v88, v55, v57, v59);
                  double v16 = v157;
                  double v15 = v158;
                  double v13 = v52;
                  double v14 = v84;
                  goto LABEL_30;
                }
                if (v25 == 104)
                {
LABEL_40:
                  double v160 = 0.0;
                  [v8 scanDouble:&v160];
                  if (v26 == 104)
                  {
                    [v9 currentPoint];
                    double v44 = v160 + v46;
                    double v160 = v44;
                  }
                  else
                  {
                    double v44 = v160;
                  }
                  double v45 = 0.0;
                  goto LABEL_66;
                }
              }
            }
            else if (v25 > 80)
            {
              if (v25 == 81) {
                goto LABEL_57;
              }
              if (v25 == 86) {
                goto LABEL_49;
              }
            }
            else
            {
              if (v25 == 67) {
                goto LABEL_51;
              }
              if (v25 == 72) {
                goto LABEL_40;
              }
            }
            if (v25 == 83)
            {
              double v47 = v15;
              double v48 = v16;
              double v49 = v13;
              double v50 = v14;
              goto LABEL_68;
            }
            if (v25 == 115)
            {
              double v48 = v154;
              double v47 = v155;
              double v50 = v152;
              double v49 = v153;
LABEL_68:
              +[TypistPathUtilities _reflectPoint:origin:](TypistPathUtilities, "_reflectPoint:origin:", v47, v48, v49, v50);
              double v116 = v115;
              double v118 = v117;
              [v8 scanPoint];
              double v15 = v119;
              double v16 = v120;
              [v8 scanPoint];
              double v13 = v121;
              double v14 = v122;
              if (v26 == 115)
              {
                [v9 currentPoint];
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v116, v118, v123, v124);
                double v116 = v125;
                double v118 = v126;
                [v9 currentPoint];
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v15, v16, v127, v128);
                double v15 = v129;
                double v16 = v130;
                [v9 currentPoint];
                +[TypistPathUtilities _addPoint:andPoint:](TypistPathUtilities, "_addPoint:andPoint:", v13, v14, v131, v132);
                double v13 = v133;
                double v14 = v134;
              }
              objc_msgSend(v9, "addCurveToPoint:controlPoint1:controlPoint2:", v13, v14, v116, v118, v15, v16);
              [v9 currentPoint];
              +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v15, v16, v135, v136);
              double v154 = v138;
              double v155 = v137;
              [v9 currentPoint];
              +[TypistPathUtilities _subtractPoint:byPoint:](TypistPathUtilities, "_subtractPoint:byPoint:", v13, v14, v139, v140);
              double v152 = v142;
              double v153 = v141;
            }
LABEL_30:
          }
          while (![v8 isAtEnd]);
        }
LABEL_10:
        [v150 addObject:v9];

        ++v6;
        unint64_t v5 = 0x263F08000;
      }
      while (v6 != v151);
      uint64_t v143 = [obj countByEnumeratingWithState:&v162 objects:v166 count:16];
      uint64_t v151 = v143;
    }
    while (v143);
  }

  return v150;
}

+ (id)convertSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = *(_OWORD *)&a4->c;
        v17[0] = *(_OWORD *)&a4->a;
        v17[1] = v14;
        v17[2] = *(_OWORD *)&a4->tx;
        double v15 = [a1 convertSingleSVGPaths:v13 withTransformation:v17];
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)convertSingleSVGPaths:(id)a3 withTransformation:(CGAffineTransform *)a4
{
  id v6 = (void *)[a3 copy];
  long long v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  [v6 applyTransform:v10];
  id v8 = [a1 convertUIBezierPathToTouchPoints:v6];

  return v8;
}

+ (BOOL)_validatePoints:(CGPoint)a3 To:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  GSMainScreenPointSize();
  BOOL v10 = x >= 0.0;
  if (y < 0.0) {
    BOOL v10 = 0;
  }
  if (v7 < 0.0) {
    BOOL v10 = 0;
  }
  if (v6 < 0.0) {
    BOOL v10 = 0;
  }
  if (x > v8) {
    BOOL v10 = 0;
  }
  if (v7 > v8) {
    BOOL v10 = 0;
  }
  if (y > v9) {
    BOOL v10 = 0;
  }
  return v6 <= v9 && v10;
}

+ (id)_decomposeCharactersWhereNeeded:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_new();
  uint64_t v12 = [v3 graphemeCount];
  if (!v12) {
    goto LABEL_17;
  }
  for (uint64_t i = 0; i != v12; ++i)
  {
    double v6 = [v3 graphemeAtIndex:i];
    if (![v6 length]) {
      goto LABEL_15;
    }
    unint64_t v7 = 0;
    char v8 = 0;
    do
    {
      uint64_t v9 = [v6 characterAtIndex:v7];
      if (+[TypistKoreanHangulSyllable isKoreanSyllable:v9])
      {
        BOOL v10 = +[TypistKoreanHangulSyllable decomposeSyllableForScribble:v9];
        if (!v10) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      if (!+[TypistThaiSyllable isThaiCharacter:v9]
        && !+[TypistArabicSyllable isArabicCharacter:v9]
        && !+[TypistArabicSyllable isArabicPresentationFormBCharacter:v9])
      {
        break;
      }
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v9);
LABEL_12:
      [v4 appendString:v10];
      char v8 = 1;
LABEL_13:

      ++v7;
    }
    while (v7 < [v6 length]);
    if ((v8 & 1) == 0) {
LABEL_15:
    }
      [v4 appendString:v6];
  }
LABEL_17:

  return v4;
}

+ (id)_decomposeGraphemeIntoSeparateCharactersIfNeeded:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 characterAtIndex:0];
    if (+[TypistThaiSyllable isThaiCharacter:v5]
      || +[TypistArabicSyllable isArabicPresentationFormBCharacter:v5])
    {
      uint64_t v6 = [v4 splitGraphemeIntoCharacterArray];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
    }
    unint64_t v7 = (void *)v6;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)_processHangulCharacter:(unsigned __int16)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  uint64_t v6 = a3;
  id v7 = a4;
  char v8 = [[TypistKoreanHangulSyllable alloc] initWithSyllable:v6];
  uint64_t v9 = +[TypistPathUtilities shiftJamosInSyllable:v8 withPath:v7 forLocale:a5];

  BOOL v10 = [[TYPathData alloc] initWithArray:v9 width:76 height:109 isCursive:0];
  return v10;
}

+ (id)_processArabicCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  if ([v7 length])
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0x263F08000uLL;
    do
    {
      uint64_t v12 = [v7 characterAtIndex:v10];
      uint64_t v13 = objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", @"%C", v12);
      long long v14 = objc_msgSend(v13, "stringByAppendingFormat:", @"_%lu", a5);

      double v15 = [v8 objectForKeyedSubscript:v14];
      double v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        long long v18 = objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", @"%C", v12);
        id v17 = [v8 objectForKeyedSubscript:v18];
      }
      if (!v10)
      {
        uint64_t v26 = [v17 width];
        uint64_t v25 = [v17 height];
      }
      uint64_t v19 = [v17 isCursive];
      long long v20 = [v17 strokeArray];
      [v9 addObjectsFromArray:v20];

      ++v10;
      unint64_t v11 = 0x263F08000;
    }
    while (v10 < [v7 length]);
    uint64_t v22 = v25;
    uint64_t v21 = v26;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v22 = 0;
    uint64_t v21 = 0;
  }
  if ([v9 count]) {
    uint64_t v23 = [[TYPathData alloc] initWithArray:v9 width:v21 height:v22 isCursive:v19];
  }
  else {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)_processThaiCharacter:(id)a3 withPathMap:(id)a4 forLocale:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  if ([v6 length])
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v9 = 0;
    double v10 = 0.0;
    unint64_t v11 = 0x263F08000uLL;
    unint64_t v12 = 0x265559000;
    double v35 = v6;
    double v36 = v8;
    while (1)
    {
      uint64_t v13 = [v6 characterAtIndex:v9];
      long long v14 = objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", @"%C", v13);
      double v15 = objc_msgSend(v14, "stringByAppendingFormat:", @"_%lu", a5);

      double v16 = [v7 objectForKeyedSubscript:v15];
      id v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        uint64_t v19 = objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", @"%C", v13);
        id v18 = [v7 objectForKeyedSubscript:v19];

        unint64_t v12 = 0x265559000uLL;
      }
      id v20 = v7;
      unint64_t v21 = v11;

      if (!v9)
      {
        uint64_t v33 = [v18 width];
        uint64_t v34 = [v18 height];
      }
      uint64_t v22 = [v18 strokeArray];
      [*(id *)(v12 + 1064) smallCharacers];
      v24 = unint64_t v23 = v12;
      int v25 = [v24 characterIsMember:v13];

      if (v25)
      {
        double v10 = v10 + 0.485;
      }
      else
      {
        uint64_t v26 = [*(id *)(v23 + 1064) tallCharacters];
        int v27 = [v26 characterIsMember:v13];

        if (!v27)
        {
          double v28 = [*(id *)(v23 + 1064) upperCombiningCharacters];
          int v29 = [v28 characterIsMember:v13];

          if (v29)
          {
            uint64_t v30 = +[TypistPathUtilities _shiftThaiStrokes:v22 withRatio:v34 ofHeight:v10];

            double v10 = v10 + 0.141;
            uint64_t v22 = (void *)v30;
          }
          unint64_t v11 = v21;
          id v8 = v36;
          unint64_t v12 = 0x265559000;
          goto LABEL_16;
        }
        double v10 = v10 + 0.716;
      }
      unint64_t v11 = v21;
      id v8 = v36;
      unint64_t v12 = v23;
LABEL_16:
      id v7 = v20;
      id v6 = v35;
      [v8 addObjectsFromArray:v22];

      if (++v9 >= (unint64_t)[v35 length]) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v33 = 0;
  uint64_t v34 = 0;
LABEL_19:
  if ([v8 count]) {
    double v31 = [[TYPathData alloc] initWithArray:v8 width:v33 height:v34 isCursive:0];
  }
  else {
    double v31 = 0;
  }

  return v31;
}

+ (id)_shiftThaiStrokes:(id)a3 withRatio:(double)a4 ofHeight:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7 copyItems:1];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    double v12 = (double)a5 * a4;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v17 = 0u;
        +[TypistPathUtilities _makeTranslationWithOffset:v12];
        v16[0] = v17;
        v16[1] = v18;
        v16[2] = v19;
        [v14 applyTransform:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (CGAffineTransform)_makeTranslationWithOffset:(SEL)a3
{
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeTranslation(&v9, 0.0, -a4);
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, 1.0, 1.0);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v8;
  CGAffineTransform v6 = v9;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

+ (int)_mappingRegionToVariantID:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"hans"])
  {
    if ([v3 caseInsensitiveCompare:@"hant"])
    {
      if ([v3 caseInsensitiveCompare:@"kr"])
      {
        if ([v3 caseInsensitiveCompare:@"jp"]) {
          int v4 = 1;
        }
        else {
          int v4 = 9;
        }
      }
      else
      {
        int v4 = 2;
      }
    }
    else
    {
      int v4 = 8;
    }
  }
  else
  {
    int v4 = 7;
  }

  return v4;
}

+ (id)_processCharacters:(id)a3 withPathMap:(id)a4 forLocale:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 graphemeCount];
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  if (v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v5;
    uint64_t v23 = v5;
    uint64_t v24 = v5;
    do
    {
      long long v14 = [v8 graphemeAtIndex:v12];
      uint64_t v15 = [v14 characterAtIndex:0];
      if (+[TypistKoreanHangulSyllable isKoreanSyllable:v15])
      {
        uint64_t v16 = [a1 _processHangulCharacter:v15 withPathMap:v9 forLocale:v13];
      }
      else if ([a1 isKoreanConsonantVariant:v15])
      {
        uint64_t v16 = [v9 objectForKeyedSubscript:v14];
      }
      else if (+[TypistThaiSyllable isThaiCharacter:v15])
      {
        uint64_t v16 = [a1 _processThaiCharacter:v14 withPathMap:v9 forLocale:v13];
      }
      else
      {
        if (!+[TypistArabicSyllable isArabicPresentationFormBCharacter:v15])
        {
          long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"_%u", v5);
          long long v19 = [v14 stringByAppendingString:v18];

          long long v20 = [v9 objectForKeyedSubscript:v19];
          if (v20) {
            long long v21 = v19;
          }
          else {
            long long v21 = v14;
          }
          long long v17 = [v9 objectForKeyedSubscript:v21];

          uint64_t v13 = v23;
          uint64_t v5 = v24;
          goto LABEL_12;
        }
        uint64_t v16 = [a1 _processArabicCharacter:v14 withPathMap:v9 forLocale:v13];
      }
      long long v17 = (void *)v16;
LABEL_12:
      [v11 setObject:v17 forKeyedSubscript:v14];

      ++v12;
    }
    while (v10 != v12);
  }

  return v11;
}

+ (double)getWidthOfFirstCharacterInString:(id)a3
{
  int v4 = [a1 _decomposeCharactersWhereNeeded:a3];
  if ([v4 length])
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", objc_msgSend(v4, "characterAtIndex:", 0));
    CGAffineTransform v6 = [a1 _queryHandwritingSourceForCharactersInString:v5 withRegion:0];
    id v7 = [v6 objectForKeyedSubscript:v5];
    double v8 = (double)[v7 width];
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

+ (id)getPathDataForCharacters:(id)a3 withRegion:(id)a4 isCursive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 _decomposeCharactersWhereNeeded:v8];
  uint64_t v11 = [a1 _mappingRegionToVariantID:v9];
  uint64_t v12 = [a1 _queryHandwritingSourceForCharactersInString:v10 withRegion:v9];
  if (v12)
  {
    uint64_t v13 = [NSDictionary dictionary];
    long long v14 = [a1 _processCharacters:v8 withPathMap:v12 forLocale:v11];

    if (v5)
    {
      id v15 = [a1 _connectPath:v14 forCharacters:v8 withRegion:v9];
    }
    else
    {
      id v15 = v14;
    }
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (unint64_t)getTotalWidthForText:(id)a3 isCursive:(BOOL)a4 withRegion:(id)a5 fromPathMap:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4) {
    +[TypistPathUtilities getTextClustersFrom:v9 withRegion:v10];
  }
  else {
    [v9 graphemeArray];
  }
  double v31 = v10;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v19 = [v11 objectForKeyedSubscript:v18];
        uint64_t v26 = v19;
        if (v19)
        {
          if ([v19 width] >= 1)
          {
            [v26 perCharacterScale];
            if (v27 > 0.0)
            {
              double v28 = (double)[v26 width];
              [v26 perCharacterScale];
              v15 += llround(v29 * v28);
            }
          }
        }
        else
        {
          TYLogl(OS_LOG_TYPE_ERROR, @"No path data found for character: [%@]", v20, v21, v22, v23, v24, v25, v18);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

+ (id)getTextClustersFrom:(id)a3 withRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _decomposeCharactersWhereNeeded:v7];
  id v9 = [a1 _queryHandwritingSourceForCharactersInString:v8 withRegion:v6];

  id v10 = [a1 getTextClustersFrom:v9 forCharacters:v7];

  return v10;
}

+ (id)getTextClustersFrom:(id)a3 forCharacters:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = [MEMORY[0x263F08708] arabicGenericCharacters];
    uint64_t v11 = [v8 rangeOfCharacterFromSet:v10];

    id v12 = [MEMORY[0x263F08708] arabicPresentationFormCharacters];
    uint64_t v13 = [v8 rangeOfCharacterFromSet:v12];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [a1 _processCharacters:v8 withPathMap:v6 forLocale:3];

      id v6 = (id)v15;
    }
    uint64_t v16 = [a1 _determineWritingStyle:v6 forCharacters:v8];
    id v9 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "characterCluster", (void)v24);
          [v9 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }
  return v9;
}

+ (id)_determineWritingStyle:(id)a3 forCharacters:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 graphemeCount];
  id v23 = (id)objc_opt_new();
  if (v6)
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v20 = v6 - 1;
    uint64_t v21 = 0;
    uint64_t v19 = v6;
    do
    {
      id v10 = [v5 graphemeAtIndex:v9];
      uint64_t v11 = [v22 objectForKeyedSubscript:v10];
      char v12 = [v11 isCursive];
      v8 += [v10 length];
      if (v12)
      {
        uint64_t v13 = ++v21;
        if (v20 != v9 || v9 < v7) {
          goto LABEL_14;
        }
        if (v13 == v6)
        {
          uint64_t v14 = [[TYCharacterCluster alloc] initWithCharacters:v5 isCursive:1];
        }
        else
        {
          id v17 = objc_msgSend(v5, "substringWithRange:", v7, v8 - v7);
          uint64_t v14 = [[TYCharacterCluster alloc] initWithCharacters:v17 isCursive:1];

          uint64_t v6 = v19;
        }
        [v23 addObject:v14];
      }
      else
      {
        objc_msgSend(v5, "substringWithRange:", v7, v8 + ~v7);
        uint64_t v14 = (TYCharacterCluster *)objc_claimAutoreleasedReturnValue();
        if ([(TYCharacterCluster *)v14 length])
        {
          uint64_t v15 = [[TYCharacterCluster alloc] initWithCharacters:v14 isCursive:1];
          [v23 addObject:v15];
        }
        uint64_t v16 = [[TYCharacterCluster alloc] initWithCharacters:v10 isCursive:0];
        [v23 addObject:v16];

        unint64_t v7 = v8;
      }

LABEL_14:
      ++v9;
    }
    while (v6 != v9);
  }

  return v23;
}

+ (int)_getScribbleRuleFromRegion:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"RU"]
    && [v3 caseInsensitiveCompare:@"UA"])
  {
    if ([v3 caseInsensitiveCompare:@"ar"]) {
      int v4 = 1;
    }
    else {
      int v4 = 2;
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)_separateFinalFormCharacters:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v15 = v3;
  uint64_t v6 = [v3 graphemeCount];
  unint64_t v7 = [NSString arabicFinalFormsCharacterSet];
  uint64_t v14 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      unint64_t v9 = [v15 graphemeAtIndex:v8];
      if ([v9 length])
      {
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = [v9 characterAtIndex:v10];
          if ([v7 characterIsMember:v11])
          {
            if ((unint64_t)[v9 length] < 2)
            {
              if ([v5 length])
              {
                objc_msgSend(v5, "appendFormat:", @"%C", v11);
                char v12 = (void *)[[NSString alloc] initWithString:v5];
                [v4 addObject:v12];
                [v5 setString:&stru_270C5A038];
              }
            }
            else
            {
              objc_msgSend(v5, "appendFormat:", @"%C", v11);
            }
          }
          else
          {
            objc_msgSend(v5, "appendFormat:", @"%C", v11);
            if (v8 == v14 - 1 && v10 == [v9 length] - 1) {
              [v4 addObject:v5];
            }
          }
          ++v10;
        }
        while (v10 < [v9 length]);
      }

      ++v8;
    }
    while (v8 != v14);
  }

  return v4;
}

+ (id)_separateIsolatedCharacters:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v3 graphemeCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      unint64_t v10 = [v3 graphemeAtIndex:i];
      [v4 addObject:v10];
    }
  }
  if ([v4 count])
  {
    unint64_t v11 = 0;
    do
    {
      char v12 = [MEMORY[0x263F08708] arabicIsolatedCharacters];
      uint64_t v13 = [v4 objectAtIndexedSubscript:v11];
      char v14 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0));

      if (v14)
      {
        if ([v6 length])
        {
          uint64_t v15 = (void *)[[NSString alloc] initWithString:v6];
          [v5 addObject:v15];
          [v6 setString:&stru_270C5A038];
        }
        uint64_t v16 = [v4 objectAtIndexedSubscript:v11];
        [v5 addObject:v16];
      }
      else
      {
        id v17 = [v4 objectAtIndexedSubscript:v11];
        [v6 appendString:v17];

        if (v11 == [v4 count] - 1) {
          [v5 addObject:v6];
        }
      }
      ++v11;
    }
    while (v11 < [v4 count]);
  }

  return v5;
}

+ (id)_separateUniqueCharacters:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  uint64_t v5 = [v3 graphemeCount];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = v5 - 1;
    do
    {
      unint64_t v11 = [v3 graphemeAtIndex:v9];
      char v12 = [MEMORY[0x263F08708] cyrillicCharactersWithUniqueWritingRule];
      char v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", 0));

      if (v13)
      {
        ++v8;
        char v14 = objc_opt_new();
        uint64_t v15 = objc_msgSend(v3, "substringWithRange:", v7, v9 + 1 - v7);

        [v4 addObject:v15];
        unint64_t v7 = v9 + 1;
      }
      else if (v10 == v9 && v9 >= v7)
      {
        if (v8 == v6)
        {
          [v4 addObject:v3];
          uint64_t v8 = v6;
        }
        else
        {
          uint64_t v16 = objc_msgSend(v3, "substringWithRange:", v7, v6 - v7);
          if ([v16 length]) {
            [v4 addObject:v16];
          }
        }
      }

      ++v9;
    }
    while (v6 != v9);
  }

  return v4;
}

+ (id)_shiftPath:(id)a3 forCharacters:(id)a4 withRule:(int)a5
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [MEMORY[0x263EFF8C0] array];
  int v82 = a5;
  if (a5 == 2)
  {
    uint64_t v10 = [a1 _separateIsolatedCharacters:v8];
  }
  else
  {
    if (a5) {
      [MEMORY[0x263EFF8C0] arrayWithObject:v8];
    }
    else {
    uint64_t v10 = [a1 _separateUniqueCharacters:v8];
    }
  }
  unint64_t v11 = (void *)v10;

  double v73 = v8;
  double v72 = [v8 textDirectionAnnotations];
  char v12 = [v72 objectAtIndexedSubscript:0];
  uint64_t v81 = [v12 textDirection];

  char v13 = objc_opt_new();
  char v14 = objc_opt_new();
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v11;
  uint64_t v15 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v111 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = [a1 _separateFinalFormCharacters:*(void *)(*((void *)&v110 + 1) + 8 * i)];
        [v14 addObjectsFromArray:v19];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
    }
    while (v16);
  }

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v79 = v14;
  uint64_t v77 = [v79 countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v107;
    double v20 = 0.0;
    unint64_t v21 = 0x263F08000uLL;
    double v22 = 0.0;
    double v80 = v7;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v107 != v75) {
          objc_enumerationMutation(v79);
        }
        uint64_t v78 = v23;
        long long v24 = *(void **)(*((void *)&v106 + 1) + 8 * v23);
        long long v25 = objc_opt_new();
        long long v26 = objc_opt_new();
        double v84 = v24;
        uint64_t v83 = [v24 graphemeCount];
        if (v83)
        {
          uint64_t v27 = 0;
          double v28 = 0.0;
          do
          {
            uint64_t v29 = [v84 graphemeAtIndex:v27];
            uint64_t v30 = [v7 objectForKeyedSubscript:v29];
            double v31 = [v30 strokeArray];

            if (v27
              || ([v79 firstObject],
                  long long v32 = objc_claimAutoreleasedReturnValue(),
                  char v33 = [v84 isEqual:v32],
                  v32,
                  double v34 = 0.0,
                  (v33 & 1) == 0))
            {
              long long v35 = [v7 objectForKeyedSubscript:v29];
              double v34 = v28 - (double)[v35 width];
            }
            double v28 = v34;
            memset(&v105, 0, sizeof(v105));
            double v36 = v20 + v34;
            if (v81 != 2) {
              double v36 = v22;
            }
            CGAffineTransformMakeTranslation(&v105, v36, 0.0);
            uint64_t v37 = [*(id *)(v21 + 1800) cyrillicCharactersWithUniqueWritingRule];
            if (objc_msgSend(v37, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0)))
            {
              char v38 = 1;
            }
            else
            {
              double v39 = [*(id *)(v21 + 1800) arabicCharactersWithUniqueWritingRule];
              char v38 = objc_msgSend(v39, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0));
            }
            double v40 = [*(id *)(v21 + 1800) arabicIsolatedCharacters];
            int v41 = objc_msgSend(v40, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", 0));

            double v86 = v29;
            uint64_t v87 = v27;
            double v85 = v31;
            if (v82 == 1 || (v38 & 1) != 0 || (unint64_t)[v29 length] >= 2)
            {
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v42 = v31;
              uint64_t v43 = [v42 countByEnumeratingWithState:&v101 objects:v117 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v45 = *(void *)v102;
                do
                {
                  for (uint64_t j = 0; j != v44; ++j)
                  {
                    if (*(void *)v102 != v45) {
                      objc_enumerationMutation(v42);
                    }
                    double v47 = *(void **)(*((void *)&v101 + 1) + 8 * j);
                    double v48 = (void *)[v47 copy];
                    CGAffineTransform v100 = v105;
                    [v48 applyTransform:&v100];
                    double v49 = [v42 firstObject];
                    LODWORD(v47) = [v47 isEqual:v49];

                    if (v47) {
                      [v25 appendPath:v48];
                    }
                    else {
                      [v26 addObject:v48];
                    }
                  }
                  uint64_t v44 = [v42 countByEnumeratingWithState:&v101 objects:v117 count:16];
                }
                while (v44);
              }
            }
            else if (v41)
            {
              long long v98 = 0uLL;
              long long v99 = 0uLL;
              long long v96 = 0uLL;
              long long v97 = 0uLL;
              id v51 = v31;
              uint64_t v52 = [v51 countByEnumeratingWithState:&v96 objects:v116 count:16];
              if (v52)
              {
                uint64_t v53 = v52;
                uint64_t v54 = *(void *)v97;
                do
                {
                  for (uint64_t k = 0; k != v53; ++k)
                  {
                    if (*(void *)v97 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    double v56 = (void *)[*(id *)(*((void *)&v96 + 1) + 8 * k) copy];
                    CGAffineTransform v100 = v105;
                    [v56 applyTransform:&v100];
                    [v26 addObject:v56];
                  }
                  uint64_t v53 = [v51 countByEnumeratingWithState:&v96 objects:v116 count:16];
                }
                while (v53);
              }
            }
            else
            {
              long long v94 = 0uLL;
              long long v95 = 0uLL;
              long long v92 = 0uLL;
              long long v93 = 0uLL;
              id v57 = v31;
              uint64_t v58 = [v57 countByEnumeratingWithState:&v92 objects:v115 count:16];
              if (v58)
              {
                uint64_t v59 = v58;
                uint64_t v60 = *(void *)v93;
                do
                {
                  for (uint64_t m = 0; m != v59; ++m)
                  {
                    if (*(void *)v93 != v60) {
                      objc_enumerationMutation(v57);
                    }
                    double v62 = (void *)[*(id *)(*((void *)&v92 + 1) + 8 * m) copy];
                    CGAffineTransform v100 = v105;
                    [v62 applyTransform:&v100];
                    [v25 appendPath:v62];
                  }
                  uint64_t v59 = [v57 countByEnumeratingWithState:&v92 objects:v115 count:16];
                }
                while (v59);
              }
            }

            id v7 = v80;
            double v50 = [v80 objectForKeyedSubscript:v86];
            double v22 = v22 + (double)[v50 width];

            uint64_t v27 = v87 + 1;
            unint64_t v21 = 0x263F08000;
          }
          while (v87 + 1 != v83);
        }
        else
        {
          double v28 = 0.0;
        }
        if (([v25 isEmpty] & 1) == 0) {
          [v13 addObject:v25];
        }
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v63 = v26;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v88 objects:v114 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v89;
          do
          {
            for (uint64_t n = 0; n != v65; ++n)
            {
              if (*(void *)v89 != v66) {
                objc_enumerationMutation(v63);
              }
              [v13 addObject:*(void *)(*((void *)&v88 + 1) + 8 * n)];
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v88 objects:v114 count:16];
          }
          while (v65);
        }
        double v20 = v20 + v28;

        uint64_t v23 = v78 + 1;
      }
      while (v78 + 1 != v77);
      uint64_t v77 = [v79 countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v77);
  }

  [a1 _getWidthAndHeight:v7 forCharacters:v73];
  double v70 = [[TYPathData alloc] initWithArray:v13 width:(uint64_t)v68 height:(uint64_t)v69 isCursive:0];

  return v70;
}

+ (CGSize)_getWidthAndHeight:(id)a3 forCharacters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 graphemeCount];
  if (v7)
  {
    uint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      unint64_t v11 = [v6 graphemeAtIndex:v8];
      char v12 = [v5 objectForKeyedSubscript:v11];
      double v10 = v10 + (double)[v12 width];

      char v13 = [v5 objectForKeyedSubscript:v11];
      double v9 = v9 + (double)[v13 height];

      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
  }

  double v14 = v10;
  double v15 = v9 / (double)v7;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)_connectPath:(id)a3 forCharacters:(id)a4 withRegion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = [a1 _determineWritingStyle:v8 forCharacters:a4];
  unint64_t v11 = objc_opt_new();
  unsigned int v31 = [a1 _mappingRegionToVariantID:v9];
  long long v26 = v9;
  unsigned int v30 = [a1 _getScribbleRuleFromRegion:v9];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    id v28 = a1;
    do
    {
      uint64_t v15 = 0;
      uint64_t v29 = v13;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        uint64_t v17 = [v16 characterCluster];
        if ([v16 isCursive])
        {
          uint64_t v18 = [a1 _shiftPath:v8 forCharacters:v17 withRule:v30];
          [v11 setObject:v18 forKeyedSubscript:v17];
        }
        else
        {
          uint64_t v18 = [a1 _processCharacters:v17 withPathMap:v8 forLocale:v31];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v34 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                long long v24 = [v18 objectForKeyedSubscript:v23];
                [v11 setValue:v24 forKey:v23];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v20);
            uint64_t v14 = v27;
            a1 = v28;
            uint64_t v13 = v29;
          }
        }

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }

  return v11;
}

+ (sqlite3)_openDatabaseFromFile:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x263F08850] defaultManager];
  ppDb = 0;
  id v5 = 0;
  if ([v4 fileExistsAtPath:v3])
  {
    sqlite3_open((const char *)[v3 UTF8String], &ppDb);
    id v5 = ppDb;
  }

  return v5;
}

+ (unint64_t)_queryDatabase:(sqlite3 *)a3 withSql:(id)a4 forRegion:(id)a5
{
  ppStmt = 0;
  id v7 = a4;
  id v8 = a5;
  sqlite3_prepare_v2(a3, (const char *)[v7 UTF8String], -1, &ppStmt, 0);
  id v9 = ppStmt;
  id v10 = v8;
  unint64_t v11 = (const char *)[v10 UTF8String];

  sqlite3_bind_text(v9, 1, v11, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  unint64_t v12 = 0;
  if (sqlite3_step(ppStmt) == 100) {
    unint64_t v12 = sqlite3_column_int(ppStmt, 0);
  }
  sqlite3_finalize(ppStmt);
  return v12;
}

+ (id)_queryHandwritingSourceForCharactersInString:(id)a3 withRegion:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 pathForResource:@"Handwriting/strokes" ofType:@"db"];

  uint64_t v8 = [a1 _openDatabaseFromFile:v7];
  if (v8)
  {
    id v9 = (sqlite3 *)v8;
    uint64_t v60 = v7;
  }
  else
  {

    id v10 = @"/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db";
    id v9 = (sqlite3 *)[a1 _openDatabaseFromFile:@"/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db"];
    if (!v9) {
      goto LABEL_41;
    }
    uint64_t v60 = @"/AppleInternal/Library/Frameworks/TypistFramework.framework/Handwriting/strokes.db";
  }
  uint64_t v11 = [v5 graphemeCount];
  unint64_t v12 = objc_opt_new();
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v14 = [v5 graphemeAtIndex:i];
      uint64_t v15 = [a1 _decomposeGraphemeIntoSeparateCharactersIfNeeded:v14];
      [v12 addObjectsFromArray:v15];
    }
  }
  uint64_t v16 = objc_msgSend(&stru_270C5A038, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v12, "count"), @"?", 0);
  uint64_t v17 = (void *)[v16 mutableCopy];

  uint64_t v58 = v17;
  id v57 = objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", @"?", @"?,", 0, 0, objc_msgSend(v12, "count") - 1);
  uint64_t v18 = [@"SELECT pathData.pathData pathData.width:pathData.height, characters.character, pathData.variant_id, pathData.isCursive FROM pathData INNER JOIN characters ON characters.characterid = pathData.character_id", "stringByAppendingFormat:", @" WHERE characters.character IN (%@)", v57];
  id v19 = v12;
  ppStmt = 0;
  id v20 = v18;
  uint64_t v59 = v9;
  sqlite3_prepare_v2(v9, (const char *)[v20 UTF8String], -1, &ppStmt, 0);
  double v56 = v20;
  uint64_t v21 = [v20 componentsSeparatedByString:@"?"];
  int v22 = [v21 count];

  double v61 = v19;
  if (v22 - 1 == [v19 count])
  {
    long long v64 = 0uLL;
    long long v65 = 0uLL;
    long long v62 = 0uLL;
    long long v63 = 0uLL;
    id v23 = v19;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      int v26 = 0;
      uint64_t v27 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v63 != v27) {
            objc_enumerationMutation(v23);
          }
          sqlite3_bind_text(ppStmt, v26 + j + 1, (const char *)[*(id *)(*((void *)&v62 + 1) + 8 * j) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v62 objects:v67 count:16];
        v26 += j;
      }
      while (v25);
    }
  }
  else
  {
    long long v64 = 0uLL;
    long long v65 = 0uLL;
    long long v62 = 0uLL;
    long long v63 = 0uLL;
    id v29 = v19;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      int v32 = 0;
      uint64_t v33 = *(void *)v63;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v63 != v33) {
            objc_enumerationMutation(v29);
          }
          long long v35 = ppStmt;
          id v36 = *(id *)(*((void *)&v62 + 1) + 8 * k);
          sqlite3_bind_text(v35, v32 + k + 1, (const char *)[v36 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          sqlite3_bind_text(ppStmt, v32 + k + 1 + [v29 count], (const char *)objc_msgSend(v36, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v67 count:16];
        v32 += k;
      }
      while (v31);
    }
  }

  id v9 = (sqlite3 *)objc_opt_new();
  while (sqlite3_step(ppStmt) == 100)
  {
    long long v37 = sqlite3_column_text(ppStmt, 0);
    int v38 = sqlite3_column_int(ppStmt, 1);
    int v39 = sqlite3_column_int(ppStmt, 2);
    long long v40 = sqlite3_column_text(ppStmt, 3);
    uint64_t v41 = sqlite3_column_int(ppStmt, 4);
    int v42 = sqlite3_column_int(ppStmt, 5);
    if (v37) {
      BOOL v43 = v39 == 0;
    }
    else {
      BOOL v43 = 1;
    }
    if (!v43 && v38 != 0)
    {
      BOOL v45 = v42 != 0;
      double v46 = [NSString stringWithUTF8String:v40];
      double v47 = [NSString stringWithUTF8String:v37];
      double v48 = [v47 componentsSeparatedByString:@"Z"];

      double v49 = +[TypistPathUtilities convertSVGStringPathToUIBezierPath:v48];
      double v50 = [[TYPathData alloc] initWithArray:v49 width:v38 height:v39 isCursive:v45];
      if (v41)
      {
        id v51 = objc_msgSend(NSString, "stringWithFormat:", @"_%d", v41);
        uint64_t v52 = [v46 stringByAppendingString:v51];

        uint64_t v53 = [(sqlite3 *)v9 objectForKey:v52];

        if (!v53) {
          [(sqlite3 *)v9 setObject:v50 forKeyedSubscript:v52];
        }
      }
      else
      {
        uint64_t v54 = [(sqlite3 *)v9 objectForKey:v46];

        if (!v54) {
          [(sqlite3 *)v9 setObject:v50 forKeyedSubscript:v46];
        }
      }
    }
  }
  sqlite3_finalize(ppStmt);

  sqlite3_close(v59);
  id v10 = v60;
LABEL_41:

  return v9;
}

+ (id)_jamoShiftsForStructure:(int)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:2];
      v16[0] = v3;
      int v4 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:3 direction:3];
      v16[1] = v4;
      id v5 = (void *)MEMORY[0x263EFF8C0];
      id v6 = v16;
      goto LABEL_8;
    case 1:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:0];
      v17[0] = v3;
      int v4 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:2 direction:1];
      v17[1] = v4;
      id v5 = (void *)MEMORY[0x263EFF8C0];
      id v6 = v17;
      goto LABEL_8;
    case 2:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:4];
      v15[0] = v3;
      int v4 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:2 direction:5];
      v15[1] = v4;
      uint64_t v8 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:1 direction:6];
      v15[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      id v10 = v15;
      goto LABEL_10;
    case 3:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:7];
      v14[0] = v3;
      int v4 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:3 direction:8];
      v14[1] = v4;
      uint64_t v8 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:1 direction:9];
      v14[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      id v10 = v14;
      goto LABEL_10;
    case 4:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:10];
      v13[0] = v3;
      int v4 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:4 direction:14];
      v13[1] = v4;
      id v5 = (void *)MEMORY[0x263EFF8C0];
      id v6 = v13;
LABEL_8:
      id v7 = [v5 arrayWithObjects:v6 count:2];
      goto LABEL_11;
    case 5:
      id v3 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:0 direction:11];
      int v4 = objc_msgSend(MEMORY[0x263F08D40], "hangulJamoTransformationDataValueWithJamoType:direction:", 4, 12, v3);
      v12[1] = v4;
      uint64_t v8 = [MEMORY[0x263F08D40] hangulJamoTransformationDataValueWithJamoType:1 direction:13];
      v12[2] = v8;
      id v9 = (void *)MEMORY[0x263EFF8C0];
      id v10 = v12;
LABEL_10:
      id v7 = [v9 arrayWithObjects:v10 count:3];

LABEL_11:
      break;
    default:
      id v7 = 0;
      break;
  }
  return v7;
}

+ (id)getStrokesForJamo:(id)a3 forVariant:(BOOL)a4 ofType:(int)a5 fromPath:(id)a6 forLocale:(unint64_t)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = 0;
  if ([v11 count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = [v11 objectAtIndexedSubscript:v14];
      int v16 = [v15 hangulJamoPosition];

      if (v16 == a5) {
        break;
      }
LABEL_10:
      if (++v14 >= (unint64_t)[v11 count]) {
        goto LABEL_11;
      }
    }
    if (v10
      && ([v11 objectAtIndexedSubscript:v14],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 isConsonantVariant]))
    {
      uint64_t v17 = [v11 objectAtIndexedSubscript:v14];
      uint64_t v18 = [v17 description];
      id v19 = objc_msgSend(v18, "stringByAppendingFormat:", @"_%lu", a7);
    }
    else
    {
      id v20 = [v11 objectAtIndexedSubscript:v14];
      id v19 = [v20 description];

      if (!v10)
      {
LABEL_9:
        uint64_t v21 = [v12 valueForKey:v19];

        uint64_t v13 = (void *)v21;
        goto LABEL_10;
      }
    }

    goto LABEL_9;
  }
LABEL_11:
  int v22 = [v13 strokeArray];

  return v22;
}

+ (id)shiftJamosInSyllable:(id)a3 withPath:(id)a4 forLocale:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 syllableStructure];
  [v7 jamos];
  v26 = uint64_t v25 = v7;
  uint64_t v10 = [v7 hasConsonantVariants];
  id v11 = +[TypistPathUtilities _jamoShiftsForStructure:v9];
  id v12 = objc_opt_new();
  if ([v11 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v11 objectAtIndexedSubscript:v13];
      id v15 = v8;
      unint64_t v16 = [v14 hangulJamoTransformationDataValue];
      unint64_t v17 = HIDWORD(v16);

      unint64_t v18 = v16;
      id v8 = v15;
      id v19 = +[TypistPathUtilities getStrokesForJamo:v26 forVariant:v10 ofType:v18 fromPath:v15 forLocale:a5];
      id v20 = +[TypistPathUtilities shiftStrokesForJamo:v19 withDirection:v17];
      [v12 addObject:v20];

      ++v13;
    }
    while (v13 < [v11 count]);
  }
  uint64_t v21 = objc_opt_new();
  if ([v12 count])
  {
    unint64_t v22 = 0;
    do
    {
      id v23 = [v12 objectAtIndexedSubscript:v22];
      [v21 addObjectsFromArray:v23];

      ++v22;
    }
    while (v22 < [v12 count]);
  }

  return v21;
}

+ (BOOL)isKoreanConsonantVariant:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v4 = [MEMORY[0x263F08708] hangulConsonantVariants];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

+ (id)shiftStrokesForJamo:(id)a3 withDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v6 copyItems:1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  [a1 _determineShiftBasedOnDirection:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v15[0] = v20;
        v15[1] = v21;
        v15[2] = v22;
        [v13 applyTransform:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (CGAffineTransform)_determineShiftBasedOnDirection:(SEL)a3
{
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v14.c = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v14.tdouble x = v6;
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v5;
  *(_OWORD *)&v13.tdouble x = v6;
  switch(a4)
  {
    case 0:
      CGAffineTransformMakeTranslation(&v14, -3.815, -10.9);
      CGFloat v7 = 1.1;
      CGFloat v8 = 0.8;
      goto LABEL_25;
    case 1:
      CGFloat v9 = 30.52;
      goto LABEL_21;
    case 2:
      CGAffineTransformMakeTranslation(&v14, -4.23888889, -13.8727273);
      CGFloat v7 = 0.7;
      CGFloat v8 = 1.2;
      goto LABEL_25;
    case 3:
      CGAffineTransformMakeTranslation(&v14, 25.4333333, -6.93636364);
      CGFloat v7 = 0.9;
      goto LABEL_24;
    case 4:
      CGFloat v10 = -7.63;
      goto LABEL_10;
    case 5:
      CGAffineTransformMakeTranslation(&v14, -0.0, 21.8);
      CGFloat v7 = 1.0;
      goto LABEL_16;
    case 6:
      CGFloat v10 = 38.15;
LABEL_10:
      CGAffineTransformMakeTranslation(&v14, -3.052, v10);
      CGFloat v7 = 1.1;
      CGFloat v8 = 0.7;
      goto LABEL_25;
    case 7:
      CGAffineTransformMakeTranslation(&v14, -4.23888889, -15.26);
      CGFloat v7 = 0.7;
      CGFloat v8 = 0.9;
      goto LABEL_25;
    case 8:
      CGAffineTransformMakeTranslation(&v14, 30.52, -0.0);
      CGFloat v7 = 0.7;
      goto LABEL_18;
    case 9:
      CGAffineTransformMakeTranslation(&v14, 0.0, 36.3333333);
      CGFloat v8 = 0.66;
      goto LABEL_22;
    case 10:
      CGAffineTransformMakeTranslation(&v14, 8.47777778, -7.63);
      CGFloat v7 = 0.6;
      CGFloat v8 = 0.6;
      goto LABEL_25;
    case 11:
      CGAffineTransformMakeTranslation(&v14, 4.23888889, 0.0);
      CGFloat v7 = 0.6;
LABEL_16:
      CGFloat v8 = 0.5;
      goto LABEL_25;
    case 12:
      CGAffineTransformMakeTranslation(&v14, 5.08666667, 12.7166667);
      CGFloat v7 = 0.9;
LABEL_18:
      CGFloat v8 = 0.6;
      goto LABEL_25;
    case 13:
      CGFloat v9 = 42.3888889;
LABEL_21:
      CGAffineTransformMakeTranslation(&v14, 0.0, v9);
      CGFloat v8 = 0.6;
LABEL_22:
      CGFloat v7 = 1.0;
      goto LABEL_25;
    case 14:
      CGAffineTransformMakeTranslation(&v14, 0.0, 7.63);
      CGFloat v7 = 1.0;
LABEL_24:
      CGFloat v8 = 1.0;
LABEL_25:
      CGAffineTransformMakeScale(&v13, v7, v8);
      CGAffineTransform t1 = v13;
      CGAffineTransform v11 = v14;
      CGSize result = CGAffineTransformConcat(retstr, &t1, &v11);
      break;
    default:
      *(_OWORD *)&retstr->a = *(_OWORD *)&v14.a;
      *(_OWORD *)&retstr->c = v5;
      *(_OWORD *)&retstr->tdouble x = v6;
      break;
  }
  return result;
}

@end