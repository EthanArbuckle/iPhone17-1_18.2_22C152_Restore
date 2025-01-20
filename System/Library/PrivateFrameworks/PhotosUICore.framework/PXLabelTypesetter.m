@interface PXLabelTypesetter
- (BOOL)_allowTextOverlapForFont:(id)a3;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)allowTruncation;
- (CGContext)context;
- (CGRect)bounds;
- (NSArray)lines;
- (NSAttributedString)attributedString;
- (PXLabelTypesetter)init;
- (PXLabelTypesetter)initWithContext:(CGContext *)a3;
- (double)minimumScaleFactor;
- (double)minimumTruncatedScaleFactor;
- (int64_t)typesettingMode;
- (unint64_t)_adjustCutoffLocation:(unint64_t)a3 forLineStartingAtIndex:(unint64_t)a4;
- (unint64_t)maximumNumberOfLines;
- (void)_setLines:(id)a3;
- (void)_updateLines;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAllowTruncation:(BOOL)a3;
- (void)setAttributedString:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setMinimumTruncatedScaleFactor:(double)a3;
- (void)setTypesettingMode:(int64_t)a3;
- (void)shiftLinesVerticallyToAvoidOverlap:(id)a3 referenceFont:(id)a4;
@end

@implementation PXLabelTypesetter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setMinimumTruncatedScaleFactor:(double)a3
{
  self->_minimumTruncatedScaleFactor = a3;
}

- (double)minimumTruncatedScaleFactor
{
  return self->_minimumTruncatedScaleFactor;
}

- (void)setAllowTruncation:(BOOL)a3
{
  self->_allowTruncation = a3;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  self->_adjustsFontSizeToFitWidth = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setTypesettingMode:(int64_t)a3
{
  self->_typesettingMode = a3;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
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

- (void)setAttributedString:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGContext)context
{
  return self->_context;
}

- (void)_setLines:(id)a3
{
  v7 = (NSArray *)a3;
  v5 = self->_lines;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSArray *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lines, a3);
      [(PXLabelTypesetter *)self signalChange:1];
    }
  }
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXLabelTypesetter;
  [(PXLabelTypesetter *)&v3 didPerformChanges];
  [(PXLabelTypesetter *)self _updateLines];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXLabelTypesetter;
  [(PXLabelTypesetter *)&v3 performChanges:a3];
}

- (BOOL)_allowTextOverlapForFont:(id)a3
{
  uint64_t v3 = _allowTextOverlapForFont__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_allowTextOverlapForFont__onceToken, &__block_literal_global_281784);
  }
  v5 = (void *)_allowTextOverlapForFont__handwritingFontFamilyNames;
  char v6 = [v4 familyName];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __46__PXLabelTypesetter__allowTextOverlapForFont___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Dear Joe Four", 0);
  v1 = (void *)_allowTextOverlapForFont__handwritingFontFamilyNames;
  _allowTextOverlapForFont__handwritingFontFamilyNames = v0;
}

- (unint64_t)_adjustCutoffLocation:(unint64_t)a3 forLineStartingAtIndex:(unint64_t)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  unint64_t v20 = a3;
  char v6 = [(PXLabelTypesetter *)self attributedString];
  char v7 = [v6 string];

  if (a3 && [v7 length] > a3)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3010000000;
    v15[3] = &unk_1AB5D584F;
    long long v16 = xmmword_1AB359BD0;
    unint64_t v8 = [v7 length] - a4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__PXLabelTypesetter__adjustCutoffLocation_forLineStartingAtIndex___block_invoke;
    v11[3] = &unk_1E5DD03C8;
    v13 = v15;
    id v12 = v7;
    v14 = &v17;
    objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", a4, v8, 3, v11);

    _Block_object_dispose(v15, 8);
  }
  unint64_t v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __66__PXLabelTypesetter__adjustCutoffLocation_forLineStartingAtIndex___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v13 = *(void *)(a1[5] + 8);
  *(void *)(v13 + 32) = a5;
  *(void *)(v13 + 40) = a6;
  v14 = (void *)a1[4];
  v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v16 = objc_msgSend(v14, "rangeOfCharacterFromSet:options:range:", v15, 4, a3 + a4, a5 + a6 - (a3 + a4));

  if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(a1[5] + 8) + 40) = v16 - *(void *)(*(void *)(a1[5] + 8) + 32);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[5] + 8) + 40)
                                               + *(void *)(*(void *)(a1[5] + 8) + 32);
  *a7 = 1;
}

- (void)_updateLines
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXLabelTypesetter *)self attributedString];
  [(PXLabelTypesetter *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([v4 length])
  {
    v137.origin.double x = v6;
    v137.origin.double y = v8;
    v137.size.double width = v10;
    v137.size.double height = v12;
    if (!CGRectIsEmpty(v137))
    {
      v14 = [(PXLabelTypesetter *)self context];
      unint64_t v15 = [(PXLabelTypesetter *)self maximumNumberOfLines];
      v79 = [[PXCTFramesetter alloc] initWithAttributedString:v4 context:v14];
      int64_t v16 = [(PXLabelTypesetter *)self typesettingMode];
      if (v16 != 1)
      {
        if (v16 == 2)
        {
          uint64_t v19 = -[PXCTFramesetter frameWithRect:maximumLineCount:allowTruncation:](v79, "frameWithRect:maximumLineCount:allowTruncation:", v15, 0, v6, v8, v10, v12);
          id v13 = [v19 lines];
        }
        else
        {
          if (!v16)
          {
            v75 = [MEMORY[0x1E4F28B00] currentHandler];
            [v75 handleFailureInMethod:a2 object:self file:@"PXLabelTypesetter.m" lineNumber:73 description:@"Code which should be unreachable has been reached"];

            abort();
          }
          id v13 = 0;
        }
LABEL_74:
        v74 = [v4 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
        [(PXLabelTypesetter *)self shiftLinesVerticallyToAvoidOverlap:v13 referenceFont:v74];

        goto LABEL_75;
      }
      uint64_t v119 = 0;
      v120 = (CGRect *)&v119;
      uint64_t v121 = 0x4010000000;
      v122 = &unk_1AB5D584F;
      double v123 = v6;
      double v124 = v8;
      double v125 = v10;
      double v126 = v12;
      uint64_t v115 = 0;
      v116 = &v115;
      uint64_t v117 = 0x2020000000;
      unint64_t v118 = v15;
      if (v15 && -[PXLabelTypesetter allowTruncation](self, "allowTruncation") && [v4 length])
      {
        [(PXLabelTypesetter *)self minimumTruncatedScaleFactor];
        if (v17 <= 0.0)
        {
          uint64_t v55 = [v4 length];
          v56 = [v4 attribute:*MEMORY[0x1E4FB06F8] atIndex:v55 - 1 effectiveRange:0];
          [v56 lineHeight];
          v120[1].size.double height = v120[1].size.height + v57 * 2.0;
          ++v116[3];

          int v18 = 2;
        }
        else
        {
          int v18 = 1;
        }
        int v76 = v18;
      }
      else
      {
        int v76 = 0;
      }
      v113[0] = 0;
      v113[1] = v113;
      v113[2] = 0x2020000000;
      char v114 = 0;
      uint64_t v107 = 0;
      v108 = (double *)&v107;
      uint64_t v109 = 0x3032000000;
      v110 = __Block_byref_object_copy__281798;
      v111 = __Block_byref_object_dispose__281799;
      id v112 = 0;
      uint64_t v103 = 0;
      v104 = (double *)&v103;
      uint64_t v105 = 0x2020000000;
      uint64_t v106 = 0;
      uint64_t v97 = 0;
      v98 = &v97;
      uint64_t v99 = 0x3032000000;
      v100 = __Block_byref_object_copy__281798;
      v101 = __Block_byref_object_dispose__281799;
      id v102 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __33__PXLabelTypesetter__updateLines__block_invoke;
      aBlock[3] = &unk_1E5DD0350;
      v91 = &v107;
      v90 = v79;
      v92 = &v119;
      v93 = &v115;
      v94 = v113;
      v95 = &v103;
      v96 = &v97;
      unint64_t v20 = (void (**)(void))_Block_copy(aBlock);
      v21 = (void (**)(id))(v20 + 2);
      v20[2]();
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __33__PXLabelTypesetter__updateLines__block_invoke_2;
      v85[3] = &unk_1E5DD0378;
      v87 = &v103;
      v88 = &v119;
      v78 = v20;
      v86 = v78;
      v22 = (void (**)(void))_Block_copy(v85);
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __33__PXLabelTypesetter__updateLines__block_invoke_3;
      v84[3] = &unk_1E5DD03A0;
      v84[4] = self;
      v84[5] = v113;
      *(double *)&v84[7] = v6;
      *(double *)&v84[8] = v8;
      *(double *)&v84[9] = v10;
      *(double *)&v84[10] = v12;
      v84[6] = &v119;
      v77 = (void (**)(void))_Block_copy(v84);
      [(PXLabelTypesetter *)self minimumScaleFactor];
      double v24 = v23;
      BOOL v25 = [(PXLabelTypesetter *)self adjustsFontSizeToFitWidth];
      if (v24 > 0.0 && v25)
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v28 = v27;
        v138.origin.double x = v6;
        v138.origin.double y = v8;
        v138.size.double width = v10;
        v138.size.double height = v12;
        unint64_t v29 = 0;
        double v30 = CGRectGetWidth(v138) / v24;
        while (v29 < [(id)v98[5] count] - 1)
        {
          v31 = [(id)v98[5] objectAtIndexedSubscript:v29];
          uint64_t v32 = [v31 stringRange];
          uint64_t v34 = v32 + v33;
          unint64_t v35 = [(PXLabelTypesetter *)self _adjustCutoffLocation:v32 + v33 forLineStartingAtIndex:v32];
          if (v35 != v34)
          {
            objc_msgSend(v4, "attributedSubstringFromRange:", v32, v35 - v32);
            CFAttributedStringRef v36 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
            v37 = CTLineCreateWithAttributedString(v36);
            v38 = v37;
            if (v37)
            {
              double TypographicBounds = CTLineGetTypographicBounds(v37, 0, 0, 0);
              CFRelease(v38);
              double v40 = ceil(TypographicBounds);
              if (v40 > v104[3] && v40 <= v30) {
                v22[2](v22);
              }
            }
          }
          ++v29;
        }
        v42 = PLUIGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 138412546;
          v129 = self;
          __int16 v130 = 2048;
          double v131 = (v43 - v28) * 1000.0;
          _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_DEBUG, "[%@] adjusted line cutoffs in %0.3fms", buf, 0x16u);
        }

        if ([*((id *)v108 + 5) isTruncated])
        {
          double v44 = v104[3];
          ((void (*)(void (**)(void), double))v22[2])(v22, v30);
          if (([*((id *)v108 + 5) isTruncated] & 1) == 0)
          {
            double v45 = v104[3];
            v46 = +[PXKitSettings sharedInstance];
            [v46 textAutoscalingPrecision];
            double v48 = v47;

            if (v45 - v44 <= v48)
            {
              double v52 = 0.0;
            }
            else
            {
              unint64_t v49 = -1;
              do
              {
                unint64_t v50 = v49;
                ((void (*)(void (**)(void), double))v22[2])(v22, (v44 + v45) * 0.5);
                if ([*((id *)v108 + 5) isTruncated]) {
                  double v44 = v104[3];
                }
                else {
                  double v45 = v104[3];
                }
                unint64_t v49 = v50 + 1;
              }
              while (v45 - v44 > v48 && v50 + 1 < 0x1D);
              *(void *)&double v52 = v50 + 2;
              if (v49 >= 0x1D)
              {
                v53 = PLUIGetLog();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                {
                  double v54 = v108[5];
                  *(_DWORD *)buf = 138412546;
                  v129 = self;
                  __int16 v130 = 2112;
                  double v131 = v54;
                  _os_log_impl(&dword_1A9AE7000, v53, OS_LOG_TYPE_DEFAULT, "[%@] maximum number of iterations reached for autoscaling, failing gracefully (currentFrame = %@)", buf, 0x16u);
                }
              }
            }
            v58 = PLUIGetLog();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v129 = self;
              __int16 v130 = 2048;
              double v131 = v52;
              __int16 v132 = 2048;
              double v133 = v44;
              __int16 v134 = 2048;
              double v135 = v45;
              _os_log_impl(&dword_1A9AE7000, v58, OS_LOG_TYPE_DEBUG, "[%@] autoscaled text in %li iterations (low: %f, high: %f)", buf, 0x2Au);
            }

            ((void (*)(void (**)(void), double))v22[2])(v22, v45);
          }
        }
        v59 = PLUIGetLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          *(_DWORD *)buf = 138412546;
          v129 = self;
          __int16 v130 = 2048;
          double v131 = (v60 - v28) * 1000.0;
          _os_log_impl(&dword_1A9AE7000, v59, OS_LOG_TYPE_DEBUG, "[%@] autoscaled text in %0.3fms", buf, 0x16u);
        }
      }
      if (v76 == 2)
      {
        v120[1].size.double height = v12;
        v116[3] = v15;
        v61 = [*((id *)v108 + 5) lines];
        BOOL v62 = [v61 count] > v15;

        if (!v62)
        {
LABEL_63:
          (*v21)(v78);
LABEL_64:
          double Width = CGRectGetWidth(v120[1]);
          v139.origin.double x = v6;
          v139.origin.double y = v8;
          v139.size.double width = v10;
          v139.size.double height = v12;
          if (Width != CGRectGetWidth(v139))
          {
            v140.origin.double x = v6;
            v140.origin.double y = v8;
            v140.size.double width = v10;
            v140.size.double height = v12;
            double v64 = CGRectGetWidth(v140);
            double v65 = CGRectGetWidth(v120[1]);
            v141.origin.double x = v6;
            v141.origin.double y = v8;
            v141.size.double width = v10;
            v141.size.double height = v12;
            double MidX = CGRectGetMidX(v141);
            double v67 = CGRectGetMidX(v120[1]);
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v68 = (id)v98[5];
            uint64_t v69 = [v68 countByEnumeratingWithState:&v80 objects:v127 count:16];
            if (v69)
            {
              double v70 = MidX - v64 / v65 * v67;
              uint64_t v71 = *(void *)v81;
              do
              {
                for (uint64_t i = 0; i != v69; ++i)
                {
                  if (*(void *)v81 != v71) {
                    objc_enumerationMutation(v68);
                  }
                  v73 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                  [v73 scaleBy:v64 / v65];
                  [v73 translateHorizontallyBy:v70];
                }
                uint64_t v69 = [v68 countByEnumeratingWithState:&v80 objects:v127 count:16];
              }
              while (v69);
            }
          }
          id v13 = (id)v98[5];

          _Block_object_dispose(&v97, 8);
          _Block_object_dispose(&v103, 8);
          _Block_object_dispose(&v107, 8);

          _Block_object_dispose(v113, 8);
          _Block_object_dispose(&v115, 8);
          _Block_object_dispose(&v119, 8);
          goto LABEL_74;
        }
      }
      else if (v76 != 1 || ([*((id *)v108 + 5) isTruncated] & 1) == 0)
      {
        goto LABEL_64;
      }
      v77[2]();
      goto LABEL_63;
    }
  }
  id v13 = 0;
LABEL_75:
  [(PXLabelTypesetter *)self _setLines:v13];
}

void __33__PXLabelTypesetter__updateLines__block_invoke(uint64_t a1)
{
  v2 = *(double **)(*(void *)(a1 + 48) + 8);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "frameWithRect:maximumLineCount:allowTruncation:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v2[4], v2[5], v2[6], v2[7]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(CGFloat *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CGRectGetWidth(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                          + 32));
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) lines];
  uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void *__33__PXLabelTypesetter__updateLines__block_invoke_2(void *result, double a2)
{
  double v2 = *(double *)(*(void *)(result[5] + 8) + 24);
  if (v2 != a2)
  {
    *(double *)(*(void *)(result[6] + 8) + 48) = a2;
    *(double *)(*(void *)(result[6] + 8) + 56) = a2 / v2 * *(double *)(*(void *)(result[6] + 8) + 56);
    return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void __33__PXLabelTypesetter__updateLines__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  [*(id *)(a1 + 32) minimumTruncatedScaleFactor];
  if (v2 > 0.0)
  {
    double v3 = CGRectGetWidth(*(CGRect *)(a1 + 56)) / v2;
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(double *)(v4 + 48) < v3) {
      double v3 = *(double *)(v4 + 48);
    }
    *(double *)(v4 + 48) = v3;
  }
}

- (void)shiftLinesVerticallyToAvoidOverlap:(id)a3 referenceFont:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ![(PXLabelTypesetter *)self _allowTextOverlapForFont:v7]
    && (unint64_t)[v6 count] >= 2)
  {
    [v7 ascender];
    double v9 = v8;
    [v7 descender];
    double v11 = v10;
    [v7 leading];
    double v13 = v12;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      double v17 = (v9 - v11 + v13) * 0.0500000007;
      uint64_t v18 = *(void *)v24;
      double MinY = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v21, "imageBounds", (void)v23);
          double v22 = MinY - CGRectGetMaxY(v29);
          if (v22 < v17) {
            [v21 translateVerticallyBy:v22 - v17];
          }
          [v21 imageBounds];
          double MinY = CGRectGetMinY(v30);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (PXLabelTypesetter)initWithContext:(CGContext *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXLabelTypesetter;
  CGRect result = [(PXLabelTypesetter *)&v5 init];
  if (result)
  {
    result->_context = a3;
    result->_allowTruncation = 1;
  }
  return result;
}

- (PXLabelTypesetter)init
{
  return [(PXLabelTypesetter *)self initWithContext:0];
}

@end