@interface UIPrintPaper
+ (UIPrintPaper)bestPaperForPageSize:(CGSize)contentSize withPapersFromArray:(NSArray *)paperList;
+ (id)_defaultPKPaperForOuptutType:(int64_t)a3;
+ (id)_defaultPaperForOutputType:(int64_t)a3;
+ (id)_defaultPaperListForOutputType:(int64_t)a3;
+ (id)_genericPaperListForOutputType:(int64_t)a3;
+ (id)_readyDocumentPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 contentSize:(CGSize)a5 scaleUpForRoll:(BOOL)a6;
+ (id)_readyPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 forContentType:(int64_t)a5 contentSize:(CGSize)a6;
+ (id)bestPaperForPageSize:(CGSize)a3 andContentType:(int64_t)a4 withPapersFromArray:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CGRect)_printableRectForDuplex:(BOOL)a3;
- (CGRect)printRect;
- (CGRect)printableRect;
- (CGRect)unAdjustedPrintableRect;
- (CGSize)paperSize;
- (CGSize)unAdjustedPaperSize;
- (double)scalingFactor;
- (id)_initWithPrintKitPaper:(id)a3;
- (id)_keywordForPDFMetadata;
- (id)_localizedMediaTypeName;
- (id)_localizedName;
- (id)_pkPaper;
- (id)description;
- (id)mediaType;
- (int)_paperOrientation;
- (void)_setPaperOrientation:(int)a3;
- (void)_updatePKPaper:(id)a3;
- (void)setScalingFactor:(double)a3;
@end

@implementation UIPrintPaper

+ (UIPrintPaper)bestPaperForPageSize:(CGSize)contentSize withPapersFromArray:(NSArray *)paperList
{
  double height = contentSize.height;
  double width = contentSize.width;
  v7 = paperList;
  v8 = objc_opt_class();
  v9 = [v8 generic4x6Paper];
  [v9 paperSize];
  if (vabdd_f64(width, v10) + vabdd_f64(height, v11) < 1.0)
  {
    BOOL v15 = 1;
  }
  else
  {
    v12 = objc_msgSend(v8, "generic3_5x5Paper");
    [v12 paperSize];
    if (vabdd_f64(width, v13) + vabdd_f64(height, v14) >= 1.0)
    {
      v16 = [v8 genericA6Paper];
      [v16 paperSize];
      if (vabdd_f64(width, v17) + vabdd_f64(height, v18) >= 1.0)
      {
        v19 = [v8 genericPRC32KPaper];
        [v19 paperSize];
        BOOL v15 = vabdd_f64(width, v20) + vabdd_f64(height, v21) < 1.0;
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  v22 = objc_msgSend(a1, "bestPaperForPageSize:andContentType:withPapersFromArray:", v15, v7, width, height);

  return (UIPrintPaper *)v22;
}

+ (id)bestPaperForPageSize:(CGSize)a3 andContentType:(int64_t)a4 withPapersFromArray:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unint64_t v9 = a4 & 0xFFFFFFFFFFFFFFFDLL;
  v115 = [MEMORY[0x1E4F1CA48] array];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v132 objects:v143 count:16];
  id v116 = v10;
  if (!v11)
  {

    id v13 = 0;
    v117 = 0;
    v118 = 0;
    double v17 = 3.40282347e38;
    goto LABEL_50;
  }
  uint64_t v12 = v11;
  v117 = 0;
  v118 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v133;
  double v15 = 3.40282347e38;
  double v16 = 3.40282347e38;
  double v17 = 3.40282347e38;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v133 != v14) {
        objc_enumerationMutation(v10);
      }
      v19 = *(void **)(*((void *)&v132 + 1) + 8 * i);
      double v20 = [v19 _pkPaper];
      [v19 paperSize];
      double v22 = v21;
      double v24 = v23;
      if ([v20 isRoll])
      {
        if (width > 0.0)
        {
          [v20 paperSize];
          if ([v20 maxCutLength] == (unint64_t)v25)
          {
            double v38 = height / width;
            if (v9 == 1)
            {
              [v19 printableRect];
              double v42 = v38 * v41;
              uint64_t v43 = [v20 topMarginInPoints];
              double v40 = v42 + (double)(unint64_t)([v20 bottomMarginInPoints] + v43);
            }
            else
            {
              [v19 paperSize];
              double v40 = v38 * v39;
            }
            v44 = [v19 _pkPaper];
            v45 = [v44 cutToLength:v40];
            [v19 _updatePKPaper:v45];

            goto LABEL_47;
          }
        }
      }
      double v26 = vabdd_f64(v22, width) + vabdd_f64(v24, height);
      if (v26 == 0.0)
      {
        id v27 = v19;

        [v27 printableRect];
        BOOL v29 = v22 == v28;
        if (v24 != v30) {
          BOOL v29 = 0;
        }
        double v17 = 0.0;
        if (v9 != 1)
        {
          if (!v29) {
            goto LABEL_40;
          }
          goto LABEL_29;
        }
        if (!v29)
        {
LABEL_29:
          id v13 = v27;
          goto LABEL_36;
        }
LABEL_40:
        [v115 addObject:v27];
        id v13 = v27;
LABEL_47:

        goto LABEL_48;
      }
      if (v26 < 1.0)
      {
        id v46 = v19;

        [v46 printableRect];
        goto LABEL_46;
      }
      BOOL v31 = v22 < width || v24 < height;
      if (v31)
      {
        if (v22 > width || v24 > height)
        {
          v34 = v117;
          v33 = v118;
          double v35 = v15;
          v36 = v19;
          if (v26 >= v16) {
            goto LABEL_35;
          }
        }
        else
        {
          v33 = v117;
          v36 = v118;
          BOOL v31 = v26 < v15;
          double v35 = v26;
          double v26 = v16;
          v34 = v19;
          if (!v31) {
            goto LABEL_35;
          }
        }
        id v37 = v19;

        double v15 = v35;
        double v16 = v26;
        v117 = v34;
        v118 = v36;
LABEL_35:
        id v10 = v116;
        goto LABEL_36;
      }
      if (v26 < v17)
      {
        id v46 = v19;

LABEL_46:
        double v17 = v26;
        id v13 = v46;
        goto LABEL_47;
      }
LABEL_36:
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v132 objects:v143 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_48:

  if (!v13 || v17 > 1.0)
  {
LABEL_50:
    id v119 = v10;
    unint64_t v47 = 0;
    do
    {
      if (vabdd_f64(width, SubstitutionPaperForPageSize_subs[4 * v47])
         + vabdd_f64(height, SubstitutionPaperForPageSize_subs[4 * v47 + 1]) >= 1.0)
      {
        id v49 = 0;
      }
      else
      {
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v48 = v119;
        id v49 = (id)[v48 countByEnumeratingWithState:&v136 objects:v144 count:16];
        if (v49)
        {
          id v50 = v13;
          unint64_t v51 = v9;
          uint64_t v52 = *(void *)v137;
          while (2)
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v137 != v52) {
                objc_enumerationMutation(v48);
              }
              v54 = *(void **)(*((void *)&v136 + 1) + 8 * (void)j);
              [v54 paperSize];
              if (vabdd_f64(v55, SubstitutionPaperForPageSize_subs[4 * v47 + 2])
                 + vabdd_f64(v56, SubstitutionPaperForPageSize_subs[4 * v47 + 3]) < 1.0)
              {
                id v49 = v54;
                goto LABEL_63;
              }
            }
            id v49 = (id)[v48 countByEnumeratingWithState:&v136 objects:v144 count:16];
            if (v49) {
              continue;
            }
            break;
          }
LABEL_63:
          unint64_t v9 = v51;
          id v13 = v50;
        }
      }
      if (v47 > 4) {
        break;
      }
      ++v47;
    }
    while (!v49);

    if (v49)
    {
      id v57 = v49;

      double v17 = 0.0;
      id v13 = v57;
    }
    id v10 = v116;
  }
  if (!v13 || v17 > 1.0)
  {
    v58 = +[UIPrintPaper _defaultPaperForOutputType:0];
    [v58 paperSize];
    double v60 = v59;
    double v62 = v61;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v63 = v10;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v128 objects:v142 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v129;
      while (2)
      {
        for (uint64_t k = 0; k != v65; ++k)
        {
          if (*(void *)v129 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = *(void **)(*((void *)&v128 + 1) + 8 * k);
          [v68 paperSize];
          double v70 = v69;
          double v72 = v71;
          double v73 = vabdd_f64(v69, v60) + vabdd_f64(v71, v62);
          if (v73 == 0.0)
          {
            [v68 printableRect];
            BOOL v75 = v70 == v74;
            if (v72 != v76) {
              BOOL v75 = 0;
            }
            if (((v9 != 1) ^ v75)) {
              goto LABEL_85;
            }
          }
          if (v73 < 1.0)
          {
LABEL_85:
            id v77 = v68;

            id v13 = v77;
            goto LABEL_86;
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v128 objects:v142 count:16];
        if (v65) {
          continue;
        }
        break;
      }
LABEL_86:
      id v10 = v116;
    }

    if (!v13)
    {
      v78 = v118;
      if (!v118) {
        v78 = v117;
      }
      id v13 = v78;
      if (!v13) {
        id v13 = v58;
      }
    }
  }
  v79 = [v13 mediaType];
  id v80 = v79;
  if (v9 == 1)
  {
    if ([v79 containsString:@"glossy"]) {
      goto LABEL_130;
    }
    v96 = [v13 mediaType];
    char v97 = [v96 containsString:@"matte"];

    if ((v97 & 1) == 0)
    {
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v80 = v10;
      uint64_t v98 = [v80 countByEnumeratingWithState:&v120 objects:v140 count:16];
      if (v98)
      {
        uint64_t v99 = v98;
        uint64_t v100 = *(void *)v121;
        while (2)
        {
          for (uint64_t m = 0; m != v99; ++m)
          {
            if (*(void *)v121 != v100) {
              objc_enumerationMutation(v80);
            }
            id v86 = *(id *)(*((void *)&v120 + 1) + 8 * m);
            if (v86 != v13)
            {
              [*(id *)(*((void *)&v120 + 1) + 8 * m) paperSize];
              double v103 = v102;
              double v105 = v104;
              [v13 paperSize];
              if (v103 == v107 && v105 == v106)
              {
                v109 = [v86 mediaType];
                if ([v109 containsString:@"glossy"])
                {

                  goto LABEL_129;
                }
                v110 = [v86 mediaType];
                char v111 = [v110 containsString:@"matte"];

                if (v111) {
                  goto LABEL_129;
                }
              }
            }
          }
          uint64_t v99 = [v80 countByEnumeratingWithState:&v120 objects:v140 count:16];
          if (v99) {
            continue;
          }
          break;
        }
LABEL_127:
        id v10 = v116;
      }
LABEL_130:
    }
  }
  else
  {
    char v81 = [v79 isEqualToString:@"stationery"];

    if ((v81 & 1) == 0)
    {
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v80 = v10;
      uint64_t v82 = [v80 countByEnumeratingWithState:&v124 objects:v141 count:16];
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = *(void *)v125;
LABEL_97:
        uint64_t v85 = 0;
        while (1)
        {
          if (*(void *)v125 != v84) {
            objc_enumerationMutation(v80);
          }
          id v86 = *(id *)(*((void *)&v124 + 1) + 8 * v85);
          if (v86 != v13)
          {
            [*(id *)(*((void *)&v124 + 1) + 8 * v85) paperSize];
            double v88 = v87;
            double v90 = v89;
            [v13 paperSize];
            if (v88 == v92 && v90 == v91)
            {
              v94 = [v86 mediaType];
              char v95 = [v94 isEqualToString:@"stationery"];

              if (v95) {
                break;
              }
            }
          }
          if (v83 == ++v85)
          {
            uint64_t v83 = [v80 countByEnumeratingWithState:&v124 objects:v141 count:16];
            if (v83) {
              goto LABEL_97;
            }
            goto LABEL_127;
          }
        }
LABEL_129:
        id v112 = v86;

        id v10 = v116;
        id v80 = v116;
        id v13 = v112;
      }
      goto LABEL_130;
    }
  }
  id v113 = v13;

  return v113;
}

+ (id)_readyPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 forContentType:(int64_t)a5 contentSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    objc_msgSend(v10, "papersForPhotoWithSize:", width, height);
  }
  else {
  uint64_t v12 = objc_msgSend(v10, "papersForDocumentWithSize:andDuplex:", a4 != 0, width, height);
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v20 = [UIPrintPaper alloc];
        id v21 = -[UIPrintPaper _initWithPrintKitPaper:](v20, "_initWithPrintKitPaper:", v19, (void)v23);
        [v13 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)_readyDocumentPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 contentSize:(CGSize)a5 scaleUpForRoll:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", v6, a4 != 0, width, height);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        double v20 = [UIPrintPaper alloc];
        id v21 = -[UIPrintPaper _initWithPrintKitPaper:](v20, "_initWithPrintKitPaper:", v19, (void)v23);
        [v13 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  return v13;
}

+ (id)_defaultPKPaperForOuptutType:(int64_t)a3
{
  if (!_defaultPKPaperForOuptutType____letterCountries)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"US", @"CA", @"MX", @"CR", @"PH", @"CL", @"CO", 0);
    v5 = (void *)_defaultPKPaperForOuptutType____letterCountries;
    _defaultPKPaperForOuptutType____letterCountries = v4;
  }
  BOOL v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = [v6 objectForKey:*MEMORY[0x1E4F1C400]];

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if ([v7 isEqualToString:@"JP"]) {
      objc_msgSend(MEMORY[0x1E4F932E8], "generic3_5x5Paper");
    }
    else {
    uint64_t v8 = [MEMORY[0x1E4F932E8] generic4x6Paper];
    }
  }
  else if (([(id)_defaultPKPaperForOuptutType____letterCountries containsObject:v7] & 1) != 0 || !v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F932E8] genericLetterPaper];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F932E8] genericA4Paper];
  }
  unint64_t v9 = (void *)v8;

  return v9;
}

+ (id)_genericPaperListForOutputType:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  v5 = v4;
  BOOL v6 = (void *)MEMORY[0x1E4F1C978];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v7 = [v4 genericA6Paper];
    uint64_t v8 = [v5 generic4x6Paper];
    unint64_t v9 = objc_msgSend(v5, "generic3_5x5Paper");
    id v10 = [v5 genericPRC32KPaper];
    uint64_t v11 = [v5 genericHagakiPaper];
    uint64_t v12 = [v5 genericBorderlessWithName:@"na_5x7_5x7in"];
    id v13 = [v5 genericBorderlessWithName:@"na_govt-letter_8x10in"];
    id v14 = [v5 genericBorderlessWithName:@"om_small-photo_100x150mm"];
    uint64_t v15 = [v5 genericBorderlessWithName:@"om_large-photo_200x300"];
    uint64_t v16 = objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, v15, 0);
  }
  else
  {
    v7 = [v4 genericA4Paper];
    uint64_t v8 = [v5 genericLetterPaper];
    unint64_t v9 = [v5 genericLegalPaper];
    id v10 = [v5 genericWithName:@"na_ledger_11x17in"];
    uint64_t v11 = [v5 genericWithName:@"iso_a3_297x420mm"];
    uint64_t v12 = [v5 genericWithName:@"iso_b5_176x250mm"];
    id v13 = [v5 genericWithName:@"jis_b5_182x257mm"];
    uint64_t v16 = objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v13, 0);
  }

  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [[UIPrintPaper alloc] _initWithPrintKitPaper:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v17;
}

+ (id)_defaultPaperListForOutputType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    [MEMORY[0x1E4F932E8] photoPapers];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F932E8] documentPapers];
  }
  v5 = +[UIPrintPaper _defaultPKPaperForOuptutType:a3];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [UIPrintPaper alloc];
        id v14 = -[UIPrintPaper _initWithPrintKitPaper:](v13, "_initWithPrintKitPaper:", v12, (void)v16);
        if ([v5 isEqual:v12]) {
          [v6 insertObject:v14 atIndex:0];
        }
        else {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)_defaultPaperForOutputType:(int64_t)a3
{
  v3 = +[UIPrintPaper _defaultPKPaperForOuptutType:a3];
  id v4 = [[UIPrintPaper alloc] _initWithPrintKitPaper:v3];

  return v4;
}

- (id)_initWithPrintKitPaper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPaper;
  BOOL v6 = [(UIPrintPaper *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_internal, a3);
    v7->_scalingFactor = 1.0;
  }

  return v7;
}

- (void)_updatePKPaper:(id)a3
{
  id v5 = a3;
  id internal = self->_internal;
  p_id internal = &self->_internal;
  if (internal != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_internal, a3);
    id v5 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id internal = self->_internal;
  id v4 = [a3 _pkPaper];
  LOBYTE(internal) = [internal isEqual:v4];

  return (char)internal;
}

- (CGSize)paperSize
{
  [self->_internal paperSize];
  double v4 = v3;
  double v6 = v5;
  [(UIPrintPaper *)self scalingFactor];
  double v8 = v4 / v7;
  [(UIPrintPaper *)self scalingFactor];
  double v10 = v6 / v9;
  int paperOrientation = self->_paperOrientation;
  if (paperOrientation) {
    double v12 = v6 / v9;
  }
  else {
    double v12 = v8;
  }
  if (paperOrientation) {
    double v10 = v8;
  }
  result.double height = v10;
  result.double width = v12;
  return result;
}

- (CGSize)unAdjustedPaperSize
{
  [self->_internal paperSize];
  double v4 = v3;
  double v6 = v5;
  [(UIPrintPaper *)self scalingFactor];
  double v8 = v4 / v7;
  [(UIPrintPaper *)self scalingFactor];
  double v10 = v6 / v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (CGRect)unAdjustedPrintableRect
{
  [self->_internal imageableAreaRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)printableRect
{
  [self->_internal paperSize];
  double v4 = v3;
  [(UIPrintPaper *)self scalingFactor];
  double v6 = v5;
  [self->_internal paperSize];
  double v8 = v7;
  [(UIPrintPaper *)self scalingFactor];
  double v10 = v9;
  [self->_internal imageableAreaRect];
  double v12 = v11;
  [(UIPrintPaper *)self scalingFactor];
  double v14 = v12 / v13;
  [self->_internal imageableAreaRect];
  double v16 = v15;
  [(UIPrintPaper *)self scalingFactor];
  double v18 = v16 / v17;
  [self->_internal imageableAreaRect];
  double v20 = v19;
  [(UIPrintPaper *)self scalingFactor];
  double v22 = v20 / v21;
  [self->_internal imageableAreaRect];
  double v24 = v23;
  [(UIPrintPaper *)self scalingFactor];
  int paperOrientation = self->_paperOrientation;
  double v27 = v24 / v25;
  if (paperOrientation == 2)
  {
    double v29 = v4 / v6 - v14 - v22;
    double v28 = v22;
  }
  else if (paperOrientation == 1)
  {
    double v18 = v8 / v10 - v18 - v27;
    double v28 = v22;
    double v29 = v14;
  }
  else
  {
    double v28 = v24 / v25;
    double v27 = v22;
    double v29 = v18;
    double v18 = v14;
  }
  double v30 = v18;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (CGRect)_printableRectForDuplex:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIPrintPaper *)self printableRect];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v3)
  {
    [(UIPrintPaper *)self paperSize];
    double v14 = v13;
    double v16 = v15;
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.double width = v10;
    v26.size.double height = v12;
    double MinX = CGRectGetMinX(v26);
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.double width = v10;
    v27.size.double height = v12;
    double v18 = v14 - CGRectGetMaxX(v27);
    if (MinX >= v18) {
      double v19 = MinX;
    }
    else {
      double v19 = v18;
    }
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.double width = v10;
    v28.size.double height = v12;
    double MinY = CGRectGetMinY(v28);
    v29.origin.x = v6;
    v29.origin.y = v8;
    v29.size.double width = v10;
    v29.size.double height = v12;
    double v21 = v16 - CGRectGetMaxY(v29);
    if (MinY >= v21) {
      double v8 = MinY;
    }
    else {
      double v8 = v21;
    }
    double v10 = v14 + v19 * -2.0;
    double v12 = v16 + v8 * -2.0;
    CGFloat v6 = v19;
  }
  double v22 = v6;
  double v23 = v8;
  double v24 = v10;
  double v25 = v12;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)_pkPaper
{
  return self->_internal;
}

- (id)description
{
  BOOL v3 = NSString;
  double v4 = [(UIPrintPaper *)self _pkPaper];
  double v5 = [v3 stringWithFormat:@"<UIPrintPaper:%p %@>", self, v4];

  return v5;
}

- (id)_localizedName
{
  return (id)[self->_internal localizedName];
}

- (id)_localizedMediaTypeName
{
  return (id)[self->_internal mediaTypeName];
}

- (id)_keywordForPDFMetadata
{
  return 0;
}

- (void)_setPaperOrientation:(int)a3
{
  self->_int paperOrientation = a3;
}

- (int)_paperOrientation
{
  return self->_paperOrientation;
}

- (id)mediaType
{
  double v2 = [(UIPrintPaper *)self _pkPaper];
  BOOL v3 = [v2 mediaInfo];
  double v4 = [v3 objectForKeyedSubscript:@"media-type"];

  return v4;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (void).cxx_destruct
{
}

- (CGRect)printRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end