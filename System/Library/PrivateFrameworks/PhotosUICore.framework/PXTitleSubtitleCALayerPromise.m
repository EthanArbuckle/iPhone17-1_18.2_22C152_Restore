@interface PXTitleSubtitleCALayerPromise
- (BOOL)diagnosticsEnabled;
- (CGRect)layerContentBounds;
- (NSArray)diagnosticsRenderedLines;
- (NSString)subtitleText;
- (NSString)titleText;
- (PXTitleSubtitleCALayerPromise)init;
- (PXTitleSubtitleLabelSpec)spec;
- (double)_textScaleFactor;
- (double)layerLastBaseline;
- (id)_attributedStringForLabelWithText:(id)a3 spec:(id)a4;
- (id)_linesToRenderWithContext:(CGContext *)a3;
- (id)_stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:(id)a3 maxWidth:(double)a4;
- (id)createCustomLayer;
- (int64_t)typesettingMode;
- (void)drawLayerContentInContext:(CGContext *)a3;
- (void)performChanges:(id)a3;
- (void)setDiagnosticsEnabled:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTypesettingMode:(int64_t)a3;
@end

@implementation PXTitleSubtitleCALayerPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsRenderedLines, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

- (NSArray)diagnosticsRenderedLines
{
  return self->_diagnosticsRenderedLines;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (BOOL)diagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (double)_textScaleFactor
{
  return self->__textScaleFactor;
}

- (double)layerLastBaseline
{
  return self->_layerLastBaseline;
}

- (CGRect)layerContentBounds
{
  double x = self->_layerContentBounds.origin.x;
  double y = self->_layerContentBounds.origin.y;
  double width = self->_layerContentBounds.size.width;
  double height = self->_layerContentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTypesettingMode:(int64_t)a3
{
  if (self->_typesettingMode != a3)
  {
    self->_typesettingMode = a3;
    [(PXCALayerPromise *)self invalidateLayer];
  }
}

- (void)setSpec:(id)a3
{
  v5 = (PXTitleSubtitleLabelSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXCALayerPromise *)self invalidateLayer];
    v5 = v6;
  }
}

- (void)setSubtitleText:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_subtitleText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      subtitleText = self->_subtitleText;
      self->_subtitleText = v6;

      [(PXCALayerPromise *)self invalidateLayer];
    }
  }
}

- (void)setTitleText:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_titleText;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      titleText = self->_titleText;
      self->_titleText = v6;

      [(PXCALayerPromise *)self invalidateLayer];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleCALayerPromise;
  [(PXCALayerPromise *)&v3 performChanges:a3];
}

- (id)_stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:(id)a3 maxWidth:(double)a4
{
  id v5 = a3;
  v6 = (void *)[v5 mutableCopy];
  v7 = objc_msgSend(MEMORY[0x1E4F28B88], "px_breakableWhitespaceCharacterSet");
  id v8 = objc_alloc(MEMORY[0x1E4F28FE8]);
  v9 = [v5 string];
  v10 = (void *)[v8 initWithString:v9];

  [v10 setCharactersToBeSkipped:0];
  uint64_t v11 = [v10 scanLocation];
  id v23 = 0;
  int v12 = [v10 scanUpToCharactersFromSet:v7 intoString:&v23];
  id v13 = v23;
  v14 = v13;
  if (v12)
  {
    do
    {
      uint64_t v15 = [v14 length];
      v16 = objc_msgSend(v5, "attributedSubstringFromRange:", v11, v15);
      [v16 size];
      if (v17 > a4)
      {
        uint64_t v18 = objc_msgSend(v16, "px_stringByReplacingOccurrencesOfString:withString:", @" ", @" ");

        objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v11, v15, v18);
        v16 = (void *)v18;
      }
      uint64_t v19 = [v7 invertedSet];
      [v10 scanUpToCharactersFromSet:v19 intoString:0];

      uint64_t v11 = [v10 scanLocation];
      id v23 = v14;
      LOBYTE(v19) = [v10 scanUpToCharactersFromSet:v7 intoString:&v23];
      id v20 = v23;

      v14 = v20;
    }
    while ((v19 & 1) != 0);
  }
  else
  {
    id v20 = v13;
  }
  v21 = (void *)[v6 copy];

  return v21;
}

- (id)_attributedStringForLabelWithText:(id)a3 spec:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && (objc_msgSend(v7, "isHidden") & 1) == 0)
  {
    v9 = [v7 textAttributes];
    uint64_t v10 = [v7 capitalization];
    uint64_t v11 = +[PXKitSettings sharedInstance];
    if ([v11 allowFontFallback])
    {
      [v7 fallbackTextAttributes];
      if (objc_claimAutoreleasedReturnValue())
      {
        [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
        objc_claimAutoreleasedReturnValue();
        PXFontCanEncodeString();
      }
    }

    int v12 = objc_msgSend(v6, "px_stringByApplyingCapitalization:", v10);
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v14 = v13;
    if (v9)
    {
      [v13 addEntriesFromDictionary:v9];
    }
    else
    {
      uint64_t v15 = [v7 font];
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    }
    v16 = [v7 textColor];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    uint64_t v17 = *MEMORY[0x1E4FB0738];
    uint64_t v18 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
    uint64_t v19 = (void *)[v18 mutableCopy];
    id v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    }
    v22 = v21;

    objc_msgSend(v22, "setAlignment:", objc_msgSend(v7, "textAlignment"));
    [v14 setObject:v22 forKeyedSubscript:v17];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12 attributes:v14];
  }
  else
  {
    id v8 = 0;
  }
  [v8 size];
  double v24 = v23;
  [(PXCALayerPromise *)self bounds];
  if (v24 > v25)
  {
    [(PXCALayerPromise *)self bounds];
    uint64_t v27 = [(PXTitleSubtitleCALayerPromise *)self _stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:v8 maxWidth:v26];

    id v8 = (void *)v27;
  }

  return v8;
}

- (id)_linesToRenderWithContext:(CGContext *)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  [(PXCALayerPromise *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  v14 = [(PXTitleSubtitleCALayerPromise *)self spec];
  v114 = self;
  int64_t v15 = [(PXTitleSubtitleCALayerPromise *)self typesettingMode];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [[PXLabelTypesetter alloc] initWithContext:a3];
  if (v15 == 2) {
    PXSizeScale();
  }
  if (!v15)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:v114 file:@"PXTitleSubtitleCALayerPromise.m" lineNumber:163 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke;
  aBlock[3] = &unk_1E5DCE938;
  aBlock[4] = v114;
  uint64_t v19 = v17;
  v143 = v19;
  CGFloat v145 = v7;
  CGFloat v146 = v9;
  CGFloat v147 = v11;
  double v148 = v13;
  int64_t v149 = v15;
  id v20 = v16;
  id v144 = v20;
  id v21 = (void (**)(void *, void *, void *, double))_Block_copy(aBlock);
  v22 = [(PXTitleSubtitleCALayerPromise *)v114 titleText];
  double v23 = [v14 titleLabelSpec];
  double v24 = v21[2](v21, v22, v23, 0.0);

  double v25 = [(PXTitleSubtitleCALayerPromise *)v114 subtitleText];
  double v26 = [v14 subtitleLabelSpec];
  [v14 distanceBetweenTitleBaselineAndSubtitleBaseline];
  uint64_t v27 = ((void (*)(void (**)(void *, void *, void *, double), void *, void *))v21[2])(v21, v25, v26);

  v28 = v20;
  v155.origin.CGFloat x = v7;
  v155.origin.CGFloat y = v9;
  v155.size.CGFloat width = v11;
  v155.size.CGFloat height = v13;
  CGFloat MidY = CGRectGetMidY(v155);
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v111 = *MEMORY[0x1E4F1DB20];
  double v112 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v31 = 1.0;
  if (![v20 count])
  {
    v32 = 0;
    v33 = v114;
    goto LABEL_9;
  }
  if ([(PXCALayerPromise *)v114 shouldCancel])
  {
    v32 = 0;
    v33 = v114;
LABEL_9:
    CGFloat x = v111;
    CGFloat width = v112;
    goto LABEL_60;
  }
  v106 = v21;
  v107 = v19;
  v108 = v27;
  v109 = v20;
  double v110 = y;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_5;
  v138[3] = &unk_1E5DCE9A8;
  id v39 = v36;
  id v139 = v39;
  id v40 = v37;
  id v140 = v40;
  id v41 = v38;
  id v141 = v41;
  v42 = (void (**)(void *, uint64_t))_Block_copy(v138);
  v43 = [v14 titleLabelSpec];
  v44 = v42[2](v42, [v43 verticalAlignment]);
  [v44 addObjectsFromArray:v24];

  v45 = [v14 subtitleLabelSpec];
  v105 = v42;
  v46 = v42[2](v42, [v45 verticalAlignment]);
  [v46 addObjectsFromArray:v108];

  v47 = [v40 firstObject];
  [v47 ascentPosition];
  double v49 = v48;

  v50 = [v40 lastObject];
  [v50 descentPosition];
  double v52 = v51;

  v156.origin.CGFloat x = v7;
  v156.origin.CGFloat y = v9;
  v156.size.CGFloat width = v11;
  v156.size.CGFloat height = v13;
  double v53 = CGRectGetMidY(v156);
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v54 = v40;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v134 objects:v153 count:16];
  v33 = v114;
  if (v55)
  {
    uint64_t v56 = v55;
    double v57 = v53 + (v49 + v52) * -0.5;
    uint64_t v58 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v135 != v58) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*((void *)&v134 + 1) + 8 * i) translateVerticallyBy:v57];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v134 objects:v153 count:16];
    }
    while (v56);
  }

  v60 = [v39 firstObject];
  [v60 ascentPosition];
  double v62 = v61;

  v157.origin.CGFloat x = v7;
  v157.origin.CGFloat y = v9;
  v157.size.CGFloat width = v11;
  v157.size.CGFloat height = v13;
  double MaxY = CGRectGetMaxY(v157);
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v64 = v39;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v130 objects:v152 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    double v67 = MaxY - v62;
    uint64_t v68 = *(void *)v131;
    do
    {
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v131 != v68) {
          objc_enumerationMutation(v64);
        }
        [*(id *)(*((void *)&v130 + 1) + 8 * j) translateVerticallyBy:v67];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v130 objects:v152 count:16];
    }
    while (v66);
  }

  v70 = [v41 lastObject];
  [v70 descentPosition];
  double v72 = v71;

  v158.origin.CGFloat x = v7;
  v158.origin.CGFloat y = v9;
  v158.size.CGFloat width = v11;
  v158.size.CGFloat height = v13;
  double MinY = CGRectGetMinY(v158);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v74 = v41;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v126 objects:v151 count:16];
  CGFloat x = v111;
  CGFloat width = v112;
  if (v75)
  {
    uint64_t v76 = v75;
    double v77 = MinY - v72;
    uint64_t v78 = *(void *)v127;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v127 != v78) {
          objc_enumerationMutation(v74);
        }
        v80 = *(void **)(*((void *)&v126 + 1) + 8 * k);
        if (v80)
        {
          [*(id *)(*((void *)&v126 + 1) + 8 * k) transform];
          double v81 = *(double *)&v123;
        }
        else
        {
          long long v124 = 0u;
          long long v125 = 0u;
          double v81 = 0.0;
          long long v123 = 0u;
        }
        double v82 = v77 * v81;
        if ([v24 containsObject:v80]) {
          BOOL v83 = v81 < 1.0;
        }
        else {
          BOOL v83 = 0;
        }
        if (v83)
        {
          [v14 distanceBetweenTitleBaselineAndSubtitleBaseline];
          double v82 = v82 + (1.0 - v81) * v84;
        }
        [v80 translateVerticallyBy:v82];
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v126 objects:v151 count:16];
    }
    while (v76);
  }

  BOOL v117 = [(PXTitleSubtitleCALayerPromise *)v114 diagnosticsEnabled];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  obuint64_t j = v109;
  uint64_t v85 = [obj countByEnumeratingWithState:&v119 objects:v150 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    v32 = 0;
    uint64_t v116 = *(void *)v120;
    double v87 = 0.0;
    CGFloat y = v110;
LABEL_42:
    uint64_t v88 = 0;
    while (1)
    {
      if (*(void *)v120 != v116) {
        objc_enumerationMutation(obj);
      }
      v89 = *(void **)(*((void *)&v119 + 1) + 8 * v88);
      if (v89)
      {
        [*(id *)(*((void *)&v119 + 1) + 8 * v88) transform];
        double v90 = v118;
      }
      else
      {
        double v90 = 0.0;
        double v118 = 0.0;
      }
      [v89 scaleVerticallyBy:-1.0];
      [v89 translateVerticallyBy:v13];
      [v89 contentBounds];
      v161.origin.CGFloat x = v91;
      v161.origin.CGFloat y = v92;
      v161.size.CGFloat width = v93;
      v161.size.CGFloat height = v94;
      v159.origin.CGFloat x = x;
      v159.origin.CGFloat y = y;
      v159.size.CGFloat width = width;
      v159.size.CGFloat height = height;
      CGRect v160 = CGRectUnion(v159, v161);
      CGFloat x = v160.origin.x;
      CGFloat y = v160.origin.y;
      CGFloat width = v160.size.width;
      CGFloat height = v160.size.height;
      if (v117)
      {
        if (!v32)
        {
          v32 = [MEMORY[0x1E4F1CA48] array];
        }
        v95 = [v89 string];
        [(NSArray *)v32 addObject:v95];

        v33 = v114;
      }
      double v87 = v87 + v90;
      [v89 baselinePosition];
      double v97 = v96;
      if ([(PXCALayerPromise *)v33 shouldCancel]) {
        break;
      }
      if (v86 == ++v88)
      {
        uint64_t v86 = [obj countByEnumeratingWithState:&v119 objects:v150 count:16];
        if (v86) {
          goto LABEL_42;
        }
        break;
      }
    }
  }
  else
  {
    v32 = 0;
    double v87 = 0.0;
    CGFloat y = v110;
    double v97 = MidY;
  }
  CGFloat MidY = v97;

  double v98 = (double)(unint64_t)[obj count];
  v99 = +[PXKitSettings sharedInstance];
  int v100 = [v99 simulateSlowTextTypesetting];

  if (v100) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
  }
  double v31 = v87 / v98;

  id v21 = v106;
  uint64_t v19 = v107;
  uint64_t v27 = v108;
  v28 = v109;
LABEL_60:
  diagnosticsRenderedLines = v33->_diagnosticsRenderedLines;
  v33->_diagnosticsRenderedLines = v32;
  v102 = v32;

  v33->_layerContentBounds.origin.CGFloat x = x;
  v33->_layerContentBounds.origin.CGFloat y = y;
  v33->_layerContentBounds.size.CGFloat width = width;
  v33->_layerContentBounds.size.CGFloat height = height;
  v33->_layerLastBaseline = MidY;
  v33->__textScaleFactor = v31;
  id v103 = v28;

  return v103;
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) shouldCancel])
  {
    CGFloat v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 length];
    CGFloat v9 = 0;
    if (v8 && v10)
    {
      CGFloat v11 = [*(id *)(a1 + 32) _attributedStringForLabelWithText:v7 spec:v8];
      double v12 = *(void **)(a1 + 40);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_2;
      v37[3] = &unk_1E5DCE910;
      id v13 = v11;
      id v38 = v13;
      long long v14 = *(_OWORD *)(a1 + 72);
      long long v40 = *(_OWORD *)(a1 + 56);
      long long v41 = v14;
      uint64_t v42 = *(void *)(a1 + 88);
      id v39 = v8;
      [v12 performChanges:v37];
      CGFloat v9 = [*(id *)(a1 + 40) lines];
      if ([*(id *)(a1 + 48) count])
      {
        int64_t v15 = [*(id *)(a1 + 48) lastObject];
        id v16 = [v9 firstObject];
        [v15 baselinePosition];
        double v18 = v17;
        v32 = v16;
        [v16 baselinePosition];
        double v20 = v19;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v21 = v9;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          double v24 = v18 - a4 - v20;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v21);
              }
              [*(id *)(*((void *)&v33 + 1) + 8 * i) translateVerticallyBy:v24];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v23);
        }

        uint64_t v27 = [v13 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
        v28 = *(void **)(a1 + 40);
        v43 = v15;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        v30 = [v29 arrayByAddingObjectsFromArray:v21];
        [v28 shiftLinesVerticallyToAvoidOverlap:v30 referenceFont:v27];
      }
      [*(id *)(a1 + 48) addObjectsFromArray:v9];
    }
  }

  return v9;
}

void __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_3(CGRect *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v11) imageBounds];
        v37.origin.CGFloat x = v12;
        v37.origin.CGFloat y = v13;
        v37.size.CGFloat width = v14;
        v37.size.CGFloat height = v15;
        v34.origin.CGFloat x = x;
        v34.origin.CGFloat y = y;
        v34.size.CGFloat width = width;
        v34.size.CGFloat height = height;
        CGRect v35 = CGRectUnion(v34, v37);
        CGFloat x = v35.origin.x;
        CGFloat y = v35.origin.y;
        CGFloat width = v35.size.width;
        CGFloat height = v35.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }
  CGFloat v16 = CGRectGetWidth(a1[1]) + -2.0;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double v17 = v16 / CGRectGetWidth(v36);
  if (v17 < 1.0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v3;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "scaleBy:", v17, (void)v23);
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      v2 = (id *)(a1 + 32);
      goto LABEL_6;
    case 1:
      v2 = (id *)(a1 + 40);
      goto LABEL_6;
    case 2:
      v2 = (id *)(a1 + 48);
LABEL_6:
      id v3 = *v2;
      break;
    case 3:
    case 4:
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 56) file:@"PXTitleSubtitleCALayerPromise.m" lineNumber:264 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_5(id *a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      id v3 = a1 + 5;
      goto LABEL_7;
    case 1:
      id v3 = a1 + 6;
LABEL_7:
      id v4 = *v3;
      return v4;
    case 2:
      id v3 = a1 + 4;
      goto LABEL_7;
  }
  id v4 = 0;
  return v4;
}

void __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAttributedString:v3];
  objc_msgSend(v4, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [v4 setTypesettingMode:*(void *)(a1 + 80)];
  objc_msgSend(v4, "setMaximumNumberOfLines:", objc_msgSend(*(id *)(a1 + 40), "numberOfLines"));
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", objc_msgSend(*(id *)(a1 + 40), "adjustsFontSizeToFitWidth"));
  [*(id *)(a1 + 40) minimumScaleFactor];
  objc_msgSend(v4, "setMinimumScaleFactor:");
  objc_msgSend(v4, "setAllowTruncation:", objc_msgSend(*(id *)(a1 + 40), "allowTruncation"));
  [*(id *)(a1 + 40) minimumTruncatedScaleFactor];
  objc_msgSend(v4, "setMinimumTruncatedScaleFactor:");
}

- (void)drawLayerContentInContext:(CGContext *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = -[PXTitleSubtitleCALayerPromise _linesToRenderWithContext:](self, "_linesToRenderWithContext:");
  double v6 = +[PXKitSettings sharedInstance];
  int v7 = [v6 drawTypographicGuidelines];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    long long v24 = &v28;
    long long v25 = &v29;
    uint64_t v26 = *(void *)v31;
    long long v23 = self;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(obj);
      }
      CGFloat v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      if ([(PXCALayerPromise *)self shouldCancel]) {
        break;
      }
      [v12 draw];
      if (v7)
      {
        [v12 imageBounds];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        id v21 = [MEMORY[0x1E4FB1618] redColor];
        CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v21 CGColor]);

        v36.origin.CGFloat x = v14;
        v36.origin.CGFloat y = v16;
        v36.size.CGFloat width = v18;
        v36.size.CGFloat height = v20;
        CGContextStrokeRect(a3, v36);
        id v22 = [MEMORY[0x1E4FB1618] redColor];
        CGContextSetFillColorWithColor(a3, (CGColorRef)[v22 CGColor]);

        [v12 textPosition];
        PXRectWithCenterAndSize();
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke(uint64_t a1, id a2, CGFloat a3)
{
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 32), (CGColorRef)[a2 CGColor]);
  CGContextBeginPath(*(CGContextRef *)(a1 + 32));
  id v5 = *(CGContext **)(a1 + 32);
  CGFloat MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  CGContextMoveToPoint(v5, MinX, a3);
  int v7 = *(CGContext **)(a1 + 32);
  CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
  CGContextAddLineToPoint(v7, MaxX, a3);
  uint64_t v9 = *(CGContext **)(a1 + 32);
  CGContextStrokePath(v9);
}

void __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke_2(uint64_t a1, id a2, CGFloat a3)
{
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 40), (CGColorRef)[a2 CGColor]);
  CGContextBeginPath(*(CGContextRef *)(a1 + 40));
  id v5 = *(CGContext **)(a1 + 40);
  [*(id *)(a1 + 32) ascentPosition];
  CGContextMoveToPoint(v5, a3, v6 + 10.0);
  int v7 = *(CGContext **)(a1 + 40);
  [*(id *)(a1 + 32) descentPosition];
  CGContextAddLineToPoint(v7, a3, v8 + -10.0);
  uint64_t v9 = *(CGContext **)(a1 + 40);
  CGContextStrokePath(v9);
}

- (id)createCustomLayer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PXKitSettings sharedInstance];
  int v4 = [v3 defaultUseShapeLayerForText];

  if (v4)
  {
    Mutable = CGPathCreateMutable();
    [(PXTitleSubtitleCALayerPromise *)self _linesToRenderWithContext:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        if ([(PXCALayerPromise *)self shouldCancel]) {
          break;
        }
        CGFloat v12 = (const CGPath *)[v11 createPath];
        CGPathAddPath(Mutable, 0, v12);
        CGPathRelease(v12);
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    double v13 = [(PXTitleSubtitleCALayerPromise *)self spec];
    CGFloat v14 = [v13 titleLabelSpec];

    double v15 = [v14 textColor];
    CGFloat v16 = [v14 textAttributes];
    double v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB0758]];

    if ([(PXCALayerPromise *)self shouldCancel])
    {
      CGFloat v18 = 0;
    }
    else
    {
      [MEMORY[0x1E4F39CF8] begin];
      if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
        [MEMORY[0x1E4F39CF8] activateBackground:1];
      }
      CGFloat v18 = objc_msgSend(MEMORY[0x1E4F39C88], "layer", (void)v22);
      [v18 setDelegate:self];
      [v18 setPath:Mutable];
      objc_msgSend(v18, "setFillColor:", objc_msgSend(v15, "CGColor"));
      [(PXCALayerPromise *)self bounds];
      objc_msgSend(v18, "setBounds:");
      if (v17)
      {
        [(PXTitleSubtitleCALayerPromise *)self _textScaleFactor];
        [(PXCALayerPromise *)self contentsScale];
        id v19 = [v17 shadowColor];
        objc_msgSend(v18, "setShadowColor:", objc_msgSend(v19, "CGColor"));

        LODWORD(v20) = 1.0;
        [v18 setShadowOpacity:v20];
        [v17 shadowOffset];
        PXSizeScale();
      }
      [MEMORY[0x1E4F39CF8] commit];
      [MEMORY[0x1E4F39CF8] flush];
    }
    CGPathRelease(Mutable);
  }
  else
  {
    CGFloat v18 = 0;
  }
  return v18;
}

- (PXTitleSubtitleCALayerPromise)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXTitleSubtitleCALayerPromise;
  CGRect result = [(PXCALayerPromise *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_layerContentBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_layerContentBounds.size = v3;
  }
  return result;
}

@end