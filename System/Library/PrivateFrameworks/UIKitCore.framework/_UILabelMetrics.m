@interface _UILabelMetrics
+ (BOOL)supportsSecureCoding;
+ (id)intrinsicMetricsWithConfiguration:(id)a3;
+ (id)metricsWithConfiguration:(id)a3;
- ($00731F7035C2E13BA23DAA730FFC2B6B)_intrinsicSizeBaselineInfo;
- (BOOL)_hyphenationPossiblyDisabledIfURLsDetected;
- (BOOL)isEqual:(id)a3;
- (CGRect)_sourceRect;
- (CGRect)bounds;
- (CGRect)drawingBounds;
- (CGRect)intrinsicBounds;
- (CGSize)_intrinsicBaselineSize;
- (NSStringDrawingContext)_stringDrawingContext;
- (_UILabelConfiguration)configuration;
- (_UILabelMetrics)initWithCoder:(id)a3;
- (_UILabelSynthesizedContent)_synthesizedContent;
- (double)_lastLineBaselineOffsetFromTop;
- (double)_lineSpacing;
- (double)firstLineBaselineOffsetFromTop;
- (double)lastLineBaselineOffsetFromBottom;
- (double)scaleFactor;
- (id)_initWithConfiguration:(id)a3 sourceRect:(CGRect)a4 synthesizedContent:(id)a5 associatedScaledMetrics:(id)a6;
- (id)_synthesizedAttributedText;
- (id)_synthesizedAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)numberOfLines;
- (unint64_t)hash;
- (void)_calculateIfNeeded;
- (void)_calculateScaledMetricsUsingSize:(CGSize)a3;
- (void)_calculatedSynthesizedContentIfNeeded;
- (void)_ensureSynthesizedContent;
- (void)draw;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UILabelMetrics

+ (id)metricsWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", v4, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v6;
}

+ (id)intrinsicMetricsWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (v4[170] & 0x80) != 0 && [v4 numberOfLines] != 1)
  {
    [v5 preferredMaxLayoutWidth];
    double v6 = v7;
  }
  else
  {
    double v6 = 3.40282347e38;
  }
  v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", v5, 0, 0, 0.0, 0.0, v6, 3.40282347e38);

  return v8;
}

- (id)_initWithConfiguration:(id)a3 sourceRect:(CGRect)a4 synthesizedContent:(id)a5 associatedScaledMetrics:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UILabelMetrics;
  v16 = [(_UILabelMetrics *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v13 copy];
    configuration = v16->_configuration;
    v16->_configuration = (_UILabelConfiguration *)v17;

    objc_storeStrong((id *)&v16->_synthesizedContent, a5);
    objc_storeStrong((id *)&v16->_associatedScaledMetrics, a6);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    IsEmptCGFloat y = CGRectIsEmpty(v25);
    v20 = (CGRect *)MEMORY[0x1E4F1DB20];
    if (IsEmpty)
    {
      [v13 bounds];
      CGFloat x = v26.origin.x;
      CGFloat y = v26.origin.y;
      CGFloat width = v26.size.width;
      CGFloat height = v26.size.height;
      if (CGRectEqualToRect(v26, *v20))
      {
        CGFloat x = *MEMORY[0x1E4F1DB28];
        CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
    }
    v16->_sourceRect.origin.CGFloat x = x;
    v16->_sourceRect.origin.CGFloat y = y;
    v16->_sourceRect.size.CGFloat width = width;
    v16->_sourceRect.size.CGFloat height = height;
    CGPoint origin = v20->origin;
    CGSize size = v20->size;
    v16->_bounds.CGPoint origin = v20->origin;
    v16->_bounds.CGSize size = size;
    v16->_drawingRect.CGPoint origin = origin;
    v16->_drawingRect.CGSize size = size;
    v16->_firstBaselineOffset = 0.0;
    v16->_lastBaselineOffset = 0.0;
    v16->_numberOfLines = -1;
    v16->_scaleFactor = 1.0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UILabelMetrics *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[_UILabelMetrics _calculateIfNeeded]((uint64_t)self),
          -[_UILabelMetrics _calculateIfNeeded]((uint64_t)v4),
          CGRectEqualToRect(self->_sourceRect, v4->_sourceRect))
      && CGRectEqualToRect(self->_bounds, v4->_bounds)
      && CGRectEqualToRect(self->_idealBounds, v4->_idealBounds)
      && CGRectEqualToRect(self->_drawingRect, v4->_drawingRect)
      && self->_numberOfLines == v4->_numberOfLines
      && self->_firstBaselineOffset == v4->_firstBaselineOffset
      && self->_lastBaselineOffset == v4->_lastBaselineOffset
      && self->_scaleFactor == v4->_scaleFactor
      && ((*(unsigned char *)&v4->_metricsFlags ^ *(unsigned char *)&self->_metricsFlags) & 0xC) == 0
      && UIEqual(self->_textToUse, v4->_textToUse))
    {
      char v5 = UIEqual(self->_attributesToUse, v4->_attributesToUse);
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (void)_calculateIfNeeded
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 232) & 1) == 0)
    {
      *(unsigned char *)(a1 + 232) |= 1u;
      v160 = -[UIBarButtonItemGroup _items](*(id **)(a1 + 8));
      if (![v160 length] && (*(unsigned char *)(a1 + 232) & 8) != 0)
      {
LABEL_168:

        return;
      }
      double v2 = 3.40282347e38;
      double v159 = *(double *)(a1 + 40);
      if (v159 >= 3.40282347e38)
      {
        *(unsigned char *)(a1 + 232) |= 0x10u;
        v3 = (double *)(a1 + 48);
      }
      else
      {
        v3 = (double *)(a1 + 48);
        double v4 = *(double *)(a1 + 48);
        char v5 = *(unsigned char *)(a1 + 232);
        double v2 = 3.40282347e38;
        if (v4 < 3.40282347e38)
        {
          int v6 = 0;
          *(unsigned char *)(a1 + 232) = v5 & 0xEF;
          double v2 = v4;
          goto LABEL_14;
        }
        *(unsigned char *)(a1 + 232) = v5 | 0x10;
      }
      int v6 = 1;
LABEL_14:
      double v7 = *(double *)(a1 + 32);
      double v154 = *(double *)(a1 + 24);
      uint64_t v186 = 0;
      v187 = (double *)&v186;
      uint64_t v188 = 0x3010000000;
      uint64_t v190 = 0;
      uint64_t v191 = 0;
      v189 = &unk_186D7DBA7;
      -[_UILabelConfiguration _internal](*(id **)(a1 + 8));
      v158 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v8 = [(id)a1 _stringDrawingContext];
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        uint64_t v10 = 1048577;
        uint64_t v11 = v9[20];
        if (v11)
        {
          int v12 = *(_DWORD *)(v11 + 24);
          uint64_t v13 = 1048705;
          if ((v12 & 2) == 0) {
            uint64_t v13 = 1048577;
          }
          uint64_t v10 = v13 | ((_WORD)v12 << 7) & 0x200 | ((_WORD)v12 << 7) & 0x400;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t v182 = 0;
      v183 = (double *)&v182;
      uint64_t v184 = 0x2020000000;
      uint64_t v185 = 0;
      uint64_t v178 = 0;
      v179 = (double *)&v178;
      uint64_t v180 = 0x2020000000;
      uint64_t v181 = 0;
      uint64_t v174 = 0;
      v175 = (double *)&v174;
      uint64_t v176 = 0x2020000000;
      uint64_t v177 = 0;
      if (v158) {
        int v161 = v158[24] >> 7;
      }
      else {
        int v161 = 0;
      }
      CGFloat v149 = *(double *)(a1 + 24);
      CGFloat v152 = *(double *)(a1 + 40);
      CGFloat v153 = *(double *)(a1 + 32);
      CGFloat v151 = *(double *)(a1 + 48);
      uint64_t v170 = 0;
      v171 = &v170;
      uint64_t v172 = 0x2020000000;
      v173 = 0;
      if (v9) {
        v9 = (void *)[v9 numberOfLines];
      }
      v150 = v3;
      v173 = v9;
      [(id)a1 _calculatedSynthesizedContentIfNeeded];
      id v162 = *(id *)(a1 + 200);
      id v156 = *(id *)(a1 + 208);
      unsigned int v14 = *(unsigned __int8 *)(a1 + 232);
      [v8 setWantsNumberOfLineFragments:1];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __37___UILabelMetrics__calculateIfNeeded__block_invoke;
      aBlock[3] = &unk_1E52DD608;
      char v169 = v161;
      aBlock[4] = a1;
      aBlock[5] = &v182;
      aBlock[6] = &v178;
      aBlock[7] = &v174;
      id v15 = _Block_copy(aBlock);
      v163[0] = MEMORY[0x1E4F143A8];
      v163[1] = 3221225472;
      v163[2] = __37___UILabelMetrics__calculateIfNeeded__block_invoke_2;
      v163[3] = &unk_1E52DD630;
      char v167 = v161;
      v155 = v15;
      v163[4] = a1;
      v164 = v155;
      v165 = &v186;
      v166 = &v170;
      v157 = (void (**)(void))_Block_copy(v163);
      if (*(void *)(a1 + 64))
      {
        v16 = v157;
        if ((v6 ^ 1 | v161)) {
          goto LABEL_25;
        }
      }
      if (v171[3] != 1)
      {
        [v8 setWantsBaselineOffset:1];
        if ((v14 & 4) != 0) {
          objc_msgSend(v162, "boundingRectWithSize:options:context:", v10, v8, v159, v2);
        }
        else {
          objc_msgSend(v162, "boundingRectWithSize:options:attributes:context:", v10, v156, v8, v159, v2);
        }
        CGRect v25 = v187;
        *((void *)v187 + 4) = v20;
        *((void *)v25 + 5) = v21;
        if (!v6 || (v16 = v155, !*(void *)(a1 + 64)))
        {
          [v8 baselineOffset];
          *((void *)v183 + 3) = v26;
          [v8 firstBaselineOffset];
          *((void *)v175 + 3) = v27;
          goto LABEL_43;
        }
LABEL_25:
        v16[2]();
LABEL_43:
        if ((v6 & ((v14 & 4) >> 2)) == 1 && dyld_program_sdk_at_least())
        {
          v31 = [v160 paragraphStyle];
          [v31 firstLineHeadIndent];
          if (v32 > 0.0)
          {
            if ([v8 numberOfLineFragments] == 1) {
              goto LABEL_54;
            }
            v33 = [v162 string];
            v34 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            v35 = [v33 componentsSeparatedByCharactersInSet:v34];
            v148 = v33;

            unint64_t v36 = [v35 count];
            if ([v35 count])
            {
              v37 = [v35 lastObject];
              BOOL v38 = [v37 length] == 0;

              v36 -= v38;
            }
            unint64_t v39 = v171[3];
            uint64_t v40 = [v8 numberOfLineFragments];
            unint64_t v41 = 0x7FFFFFFFLL;
            if (v39) {
              unint64_t v41 = v39;
            }
            if (v41 >= v36) {
              unint64_t v41 = v36;
            }
            BOOL v42 = v41 == v40;

            if (v42)
            {
LABEL_54:
              double v43 = v187[4];
              [v31 firstLineHeadIndent];
              double v45 = v43 + v44;
              if (v45 >= *(double *)(a1 + 40)) {
                double v45 = *(double *)(a1 + 40);
              }
              v187[4] = v45;
            }
          }
        }
        int v46 = (v14 >> 2) & 1;
        double v48 = v187[4];
        double v47 = v187[5];
        if (v6)
        {
          if (*(double *)(a1 + 40) >= 3.40282347e38)
          {
            objc_msgSend((id)a1, "_calculateScaledMetricsUsingSize:", v187[4], v187[5]);
            uint64_t v49 = *(void *)(a1 + 64);
            if (v49)
            {
              [*(id *)(a1 + 64) _calculateIfNecessary];
              id v50 = *(id *)(v49 + 80);

              v157[2]();
              int v46 = 1;
              id v162 = v50;
            }
          }
        }
        if ((*(unsigned char *)(a1 + 232) & 8) != 0)
        {
          BOOL v51 = 0;
          if (!v6) {
            goto LABEL_70;
          }
        }
        else
        {
          BOOL v51 = [v160 length] == 0;
          if (!v6) {
            goto LABEL_70;
          }
        }
        v52 = *(void **)(a1 + 8);
        if (v52)
        {
          if ([v52 numberOfLines] == 1)
          {
            v53 = *(void **)(a1 + 8);
            if (!v53 || ([v53 adjustsFontSizeToFitWidth] & 1) == 0)
            {
              int v54 = [*(id *)(a1 + 56) hasExplicitBaselineOffset];
              goto LABEL_71;
            }
          }
        }
LABEL_70:
        int v54 = 1;
LABEL_71:
        double v55 = 0.0;
        double v56 = 0.0;
        if (((v46 ^ 1 | v51) & 1) == 0 && v54)
        {
          v196[0] = xmmword_186B93450;
          int v57 = dyld_program_sdk_at_least();
          uint64_t v58 = *(void *)off_1E52D1F60;
          if (v57) {
            objc_msgSend(v162, "attribute:atIndex:longestEffectiveRange:inRange:", v58, 0, v196, 0, objc_msgSend(v162, "length"));
          }
          else {
          v59 = [v162 attribute:*(void *)off_1E52D1F60 atIndex:0 effectiveRange:v196];
          }
          uint64_t v60 = *((void *)&v196[0] + 1);
          if (v60 == [v162 length] || !v59)
          {
            if ((dyld_program_sdk_at_least() & 1) == 0 && v59)
            {
              [v59 floatValue];
              double v56 = v70;
            }
          }
          else
          {
            v61 = (void *)[v162 mutableCopy];
            objc_msgSend(v61, "removeAttribute:range:", v58, 0, objc_msgSend(v162, "length"));
            [v8 setWantsBaselineOffset:1];
            uint64_t v62 = [v8 cachesLayout];
            [v8 setCachesLayout:0];
            objc_msgSend(v61, "boundingRectWithSize:options:context:", v10, v8, v159, 3.40282347e38);
            uint64_t v64 = v63;
            uint64_t v66 = v65;
            [v8 baselineOffset];
            *((void *)v183 + 3) = v67;
            [v8 firstBaselineOffset];
            *((void *)v175 + 3) = v68;
            v69 = v187;
            *((void *)v187 + 4) = v64;
            *((void *)v69 + 5) = v66;
            [v8 setCachesLayout:v62];

            double v56 = 0.0;
          }
        }
        v71 = *(double **)(a1 + 8);
        if (v71) {
          double v55 = v71[19];
        }
        if (v6)
        {
          v72 = [v71 shadow];
          v73 = v72;
          if (v48 > 0.0 && v47 > 0.0)
          {
            v74 = [v72 shadowColor];
            BOOL v75 = v74 == 0;

            if (!v75)
            {
              [v73 shadowOffset];
              if (v76 < 0.0) {
                double v76 = -v76;
              }
              double v48 = v48 + v76;
              double v78 = -v77;
              if (v77 >= 0.0) {
                double v78 = v77;
              }
              double v47 = v47 + v78;
            }
          }
          UIRoundToScale(v7 + (v47 - v187[5]) * 0.5, v55);
          double v80 = v79;
          double v159 = v187[4];
          UICeilToScale(v48, v55);
          CGFloat v152 = v81;
          UICeilToScale(v47, v55);
          CGFloat v151 = v82;
        }
        else
        {
          UIRoundToScale(v7 + (v2 - v187[5]) * 0.5, v55);
          double v80 = v83;
        }
        double v84 = v80 - v56;
        double v85 = v187[5];
        double v86 = v84 + v183[3];
        UIRoundToScale(v86, v55);
        *(double *)(a1 + 80) = v87;
        UIRoundToScale(v87 - v86 + v84 + v175[3], v55);
        *(void *)(a1 + 72) = v88;
        if (*(void *)(a1 + 184) == -1) {
          *(void *)(a1 + 184) = [v8 numberOfLineFragments];
        }
        double v89 = *(double *)(a1 + 80);
        double v90 = v183[3];
        [(id)a1 _lineSpacing];
        double v92 = v91;
        double v93 = v89 - v90;
        if (v91 != 0.0)
        {
          v94 = [v156 objectForKeyedSubscript:*(void *)off_1E52D2040];
          v95 = v94;
          if (v46)
          {
            id v96 = v162;
            id v97 = v95;
            uint64_t v98 = [v96 length];
            if (v97)
            {
              v99 = [(NSAttributedString *)v96 _ui_fontsInRange:v98 usingDefaultFont:v97];
            }
            else
            {
              v102 = +[UILabel defaultFont];
              v99 = [(NSAttributedString *)v96 _ui_fontsInRange:v98 usingDefaultFont:v102];
            }
            long long v194 = 0u;
            long long v195 = 0u;
            long long v192 = 0u;
            long long v193 = 0u;
            id v103 = v99;
            uint64_t v104 = [v103 countByEnumeratingWithState:&v192 objects:v196 count:16];
            if (v104)
            {
              uint64_t v105 = *(void *)v193;
              double v101 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v104; ++i)
                {
                  if (*(void *)v193 != v105) {
                    objc_enumerationMutation(v103);
                  }
                  [*(id *)(*((void *)&v192 + 1) + 8 * i) lineHeight];
                  if (v107 > v101) {
                    double v101 = v107;
                  }
                }
                uint64_t v104 = [v103 countByEnumeratingWithState:&v192 objects:v196 count:16];
              }
              while (v104);
            }
            else
            {
              double v101 = 0.0;
            }
          }
          else
          {
            [v94 lineHeight];
            double v101 = v100;
          }
          UICeilToScale(v101, v55);
          double v109 = v108;

          double v93 = v93 - (v109 - v92);
        }
        v110 = *(double **)(a1 + 64);
        if (v110) {
          char v111 = v6;
        }
        else {
          char v111 = 1;
        }
        if ((v111 & 1) == 0)
        {
          if (v171[3] != 1)
          {
LABEL_126:
            if (v161)
            {
              v199.origin.CGFloat x = v149;
              v199.origin.CGFloat y = v153;
              v199.size.CGFloat width = v152;
              v199.size.CGFloat height = v151;
              double MinY = CGRectGetMinY(v199);
              v200.origin.CGFloat x = v149;
              v200.origin.CGFloat y = v153;
              v200.size.CGFloat width = v152;
              v200.size.CGFloat height = v151;
              CGFloat Height = CGRectGetHeight(v200);
              UICeilToScale(MinY + (Height - v187[5]) * 0.5, v55);
              double v93 = v115;
              UICeilToScale(v187[5], v55);
            }
            else
            {
              [v110 _calculateIfNecessary];
              double v117 = v110[4];
              uint64_t v118 = *(void *)(a1 + 64);
              if (v118)
              {
                [*(id *)(a1 + 64) _calculateIfNecessary];
                double v116 = *(double *)(v118 + 32);
              }
              else
              {
                double v116 = 0.0;
              }
              double v93 = v93 + (v85 - v117) * 0.5;
            }
            double v85 = v116;
            goto LABEL_133;
          }
          if (v158 && (unint64_t v112 = ((unint64_t)*((unsigned int *)v158 + 6) >> 8) & 3) != 0)
          {
            if (v112 == 1) {
              goto LABEL_126;
            }
          }
          else
          {
            double v93 = v93 + v183[3] - v179[3];
          }
        }
LABEL_133:
        *(double *)(a1 + 120) = v154;
        v119 = (double *)(a1 + 120);
        *(double *)(a1 + 88) = v154;
        *(double *)(a1 + 96) = v93;
        *(double *)(a1 + 104) = v159;
        *(double *)(a1 + 112) = v85;
        *(double *)(a1 + 128) = v93;
        *(double *)(a1 + 136) = v159;
        *(double *)(a1 + 144) = v85;
        UIRoundToScale(v154, v55);
        *(void *)(a1 + 120) = v120;
        UIRoundToScale(*(double *)(a1 + 128) + (*(double *)(a1 + 144) - *(double *)(a1 + 112)) * 0.5, v55);
        *(void *)(a1 + 128) = v121;
        if (!v6) {
          goto LABEL_145;
        }
        if (![v160 length])
        {
          double v47 = 0.0;
          double v48 = 0.0;
        }
        if (*(double *)(a1 + 40) >= 3.40282347e38) {
          goto LABEL_145;
        }
        +[UIView _enableRTL];
        if ([v160 isAttributed])
        {
          v122 = [(id)a1 _synthesizedAttributedText];
          uint64_t v123 = objc_msgSend(v122, "_ui_resolvedTextAlignment");
        }
        else
        {
          v122 = [(id)a1 _synthesizedAttributes];
          v124 = [v122 objectForKeyedSubscript:*(void *)off_1E52D21B8];
          uint64_t v123 = objc_msgSend(v124, "_ui_resolvedTextAlignment");
        }
        if (v123 == 1)
        {
          CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 24));
          UIRoundToScale((MaxX - *(double *)(a1 + 136)) * 0.5, v55);
          double v125 = *v119;
        }
        else
        {
          if (v123 != 2)
          {
LABEL_145:
            int v128 = dyld_program_sdk_at_least();
            double v129 = *(double *)(a1 + 136);
            double v130 = *(double *)(a1 + 40);
            if (v129 >= v130) {
              double v129 = *(double *)(a1 + 40);
            }
            if (v128)
            {
              UICeilToScale(v129, v55);
              *(void *)(a1 + 136) = v131;
              double v132 = *(double *)(a1 + 144);
              if (v132 >= *(double *)(a1 + 48)) {
                double v132 = *(double *)(a1 + 48);
              }
              UICeilToScale(v132, v55);
              *(void *)(a1 + 144) = v133;
              double v134 = *(double *)(a1 + 40);
              if (v48 < v134) {
                double v134 = v48;
              }
              UICeilToScale(v134, v55);
              double v136 = v135;
              double v137 = *v150;
              if (v47 < *v150) {
                double v137 = v47;
              }
              UICeilToScale(v137, v55);
            }
            else
            {
              double v139 = ceil(v129);
              double v140 = *(double *)(a1 + 144);
              double v141 = *(double *)(a1 + 48);
              if (v140 >= v141) {
                double v140 = *(double *)(a1 + 48);
              }
              *(double *)(a1 + 136) = v139;
              *(double *)(a1 + 144) = ceil(v140);
              if (v48 >= v130) {
                double v142 = v130;
              }
              else {
                double v142 = v48;
              }
              double v136 = ceil(v142);
              if (v47 >= v141) {
                double v143 = v141;
              }
              else {
                double v143 = v47;
              }
              double v138 = ceil(v143);
            }
            *(_OWORD *)(a1 + 152) = *(_OWORD *)v119;
            *(double *)(a1 + 168) = v136;
            *(double *)(a1 + 176) = v138;
            uint64_t v144 = *(void *)(a1 + 64);
            if (v144)
            {
              [*(id *)(a1 + 64) _calculateIfNecessary];
              double v145 = *(double *)(v144 + 40);
            }
            else
            {
              double v145 = 1.0;
            }
            *(double *)(a1 + 192) = v145;
            uint64_t v146 = [v8 layout];
            v147 = *(void **)(a1 + 216);
            *(void *)(a1 + 216) = v146;

            _Block_object_dispose(&v170, 8);
            _Block_object_dispose(&v174, 8);
            _Block_object_dispose(&v178, 8);
            _Block_object_dispose(&v182, 8);

            _Block_object_dispose(&v186, 8);
            goto LABEL_168;
          }
          double v125 = CGRectGetMaxX(*(CGRect *)(a1 + 24)) - *(double *)(a1 + 136);
          double v126 = *(double *)(a1 + 120);
        }
        double *v119 = v125 + v126;
        goto LABEL_145;
      }
      [v8 setWantsBaselineOffset:1];
      if ((v14 & 4) != 0)
      {
        objc_msgSend(v162, "boundingRectWithSize:options:context:", v10, v8, v159, 3.40282347e38);
        uint64_t v17 = v187;
        *((void *)v187 + 4) = v18;
        *((void *)v17 + 5) = v19;
        if (!v6) {
          goto LABEL_41;
        }
      }
      else
      {
        if (!v6)
        {
          objc_msgSend(&stru_1ED0E84C0, "boundingRectWithSize:options:attributes:context:", v10, v156, v8, 3.40282347e38, 3.40282347e38);
          v28 = v187;
          v187[4] = v159;
          *((void *)v28 + 5) = v29;
          goto LABEL_41;
        }
        objc_msgSend(v162, "boundingRectWithSize:options:attributes:context:", v10, v156, v8, v159, 3.40282347e38);
        v22 = v187;
        *((void *)v187 + 4) = v23;
        *((void *)v22 + 5) = v24;
      }
      if (*(void *)(a1 + 64))
      {
        v155[2]();
LABEL_42:
        *(void *)(a1 + 184) = 1;
        goto LABEL_43;
      }
LABEL_41:
      [v8 baselineOffset];
      *((void *)v183 + 3) = v30;
      *((void *)v175 + 3) = v30;
      goto LABEL_42;
    }
    [(id)a1 _calculatedSynthesizedContentIfNeeded];
  }
}

- (unint64_t)hash
{
  int64_t v2 = self->_numberOfLines ^ ((uint64_t)(self->_scaleFactor * 100.0) << 8) ^ ((uint64_t)(self->_firstBaselineOffset
                                                                                      * 100.0) << 16);
  uint64_t v3 = (uint64_t)(self->_lastBaselineOffset * 100.0);
  return v2 ^ [(_UILabelConfiguration *)self->_configuration hash] ^ (v3 << 24);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = -[_UILabelMetrics _initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:]([_UILabelMetrics alloc], "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", self->_configuration, self->_synthesizedContent, self->_associatedScaledMetrics, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  CGPoint origin = self->_bounds.origin;
  *(CGSize *)(v4 + 136) = self->_bounds.size;
  *(CGPoint *)(v4 + 120) = origin;
  CGPoint v6 = self->_idealBounds.origin;
  *(CGSize *)(v4 + 168) = self->_idealBounds.size;
  *(CGPoint *)(v4 + 152) = v6;
  *((void *)v4 + 23) = self->_numberOfLines;
  *((void *)v4 + 9) = *(void *)&self->_firstBaselineOffset;
  *((void *)v4 + 10) = *(void *)&self->_lastBaselineOffset;
  CGPoint v7 = self->_drawingRect.origin;
  *(CGSize *)(v4 + 104) = self->_drawingRect.size;
  *(CGPoint *)(v4 + 88) = v7;
  *((void *)v4 + 24) = *(void *)&self->_scaleFactor;
  objc_storeStrong((id *)v4 + 26, self->_attributesToUse);
  objc_storeStrong((id *)v4 + 25, self->_textToUse);
  v4[232] = (char)self->_metricsFlags;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UILabelMetrics)initWithCoder:(id)a3
{
  v38[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_UILabelMetrics;
  char v5 = [(_UILabelMetrics *)&v37 init];
  if (v5)
  {
    [v4 decodeRectForKey:@"UILabelMetrics_sourceRect"];
    v5->_sourceRect.origin.CGFloat x = v6;
    v5->_sourceRect.origin.CGFloat y = v7;
    v5->_sourceRect.size.CGFloat width = v8;
    v5->_sourceRect.size.CGFloat height = v9;
    [v4 decodeRectForKey:@"UILabelMetrics_bounds"];
    v5->_bounds.origin.CGFloat x = v10;
    v5->_bounds.origin.CGFloat y = v11;
    v5->_bounds.size.CGFloat width = v12;
    v5->_bounds.size.CGFloat height = v13;
    [v4 decodeRectForKey:@"UILabelMetrics_idealBounds"];
    v5->_idealBounds.origin.CGFloat x = v14;
    v5->_idealBounds.origin.CGFloat y = v15;
    v5->_idealBounds.size.CGFloat width = v16;
    v5->_idealBounds.size.CGFloat height = v17;
    v5->_numberOfLines = [v4 decodeIntegerForKey:@"UILabelMetrics_numberOfLines"];
    [v4 decodeFloatForKey:@"UILabelMetrics_firstBaselineOffset"];
    v5->_firstBaselineOffset = v18;
    [v4 decodeFloatForKey:@"UILabelMetrics_lastBaselineOffset"];
    v5->_lastBaselineOffset = v19;
    [v4 decodeRectForKey:@"UILabelMetrics_drawingRect"];
    v5->_drawingRect.origin.CGFloat x = v20;
    v5->_drawingRect.origin.CGFloat y = v21;
    v5->_drawingRect.size.CGFloat width = v22;
    v5->_drawingRect.size.CGFloat height = v23;
    [v4 decodeFloatForKey:@"UILabelMetrics_scaleFactor"];
    v5->_scaleFactor = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelMetrics_configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (_UILabelConfiguration *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UILabelMetrics_attributesToUse"];
    attributesToUse = v5->_attributesToUse;
    v5->_attributesToUse = (NSDictionary *)v27;

    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
    v31 = [v29 setWithArray:v30];
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"UILabelMetrics_textToUse"];
    id textToUse = v5->_textToUse;
    v5->_id textToUse = (id)v32;

    *(unsigned char *)&v5->_metricsFlags = *(unsigned char *)&v5->_metricsFlags & 0xFE | [v4 decodeBoolForKey:@"UILabelMetrics_calculated"];
    if ([v4 decodeBoolForKey:@"UILabelMetrics_textToUseIsAttributed"]) {
      char v34 = 4;
    }
    else {
      char v34 = 0;
    }
    *(unsigned char *)&v5->_metricsFlags = *(unsigned char *)&v5->_metricsFlags & 0xFB | v34;
    if ([v4 decodeBoolForKey:@"UILabelMetrics_forDrawing"]) {
      char v35 = 8;
    }
    else {
      char v35 = 0;
    }
    *(unsigned char *)&v5->_metricsFlags = *(unsigned char *)&v5->_metricsFlags & 0xF7 | v35;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  id v11 = a3;
  objc_msgSend(v11, "encodeRect:forKey:", @"UILabelMetrics_sourceRect", x, y, width, height);
  objc_msgSend(v11, "encodeRect:forKey:", @"UILabelMetrics_bounds", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  objc_msgSend(v11, "encodeRect:forKey:", @"UILabelMetrics_idealBounds", self->_idealBounds.origin.x, self->_idealBounds.origin.y, self->_idealBounds.size.width, self->_idealBounds.size.height);
  [v11 encodeInteger:self->_numberOfLines forKey:@"UILabelMetrics_numberOfLines"];
  double firstBaselineOffset = self->_firstBaselineOffset;
  *(float *)&double firstBaselineOffset = firstBaselineOffset;
  [v11 encodeFloat:@"UILabelMetrics_firstBaselineOffset" forKey:firstBaselineOffset];
  double lastBaselineOffset = self->_lastBaselineOffset;
  *(float *)&double lastBaselineOffset = lastBaselineOffset;
  [v11 encodeFloat:@"UILabelMetrics_lastBaselineOffset" forKey:lastBaselineOffset];
  objc_msgSend(v11, "encodeRect:forKey:", @"UILabelMetrics_drawingRect", self->_drawingRect.origin.x, self->_drawingRect.origin.y, self->_drawingRect.size.width, self->_drawingRect.size.height);
  double scaleFactor = self->_scaleFactor;
  *(float *)&double scaleFactor = scaleFactor;
  [v11 encodeFloat:@"UILabelMetrics_scaleFactor" forKey:scaleFactor];
  [v11 encodeObject:self->_configuration forKey:@"UILabelMetrics_configuration"];
  [v11 encodeObject:self->_attributesToUse forKey:@"UILabelMetrics_attributesToUse"];
  [v11 encodeObject:self->_textToUse forKey:@"UILabelMetrics_textToUse"];
  [v11 encodeBool:*(unsigned char *)&self->_metricsFlags & 1 forKey:@"UILabelMetrics_calculated"];
  [v11 encodeBool:(*(unsigned char *)&self->_metricsFlags >> 2) & 1 forKey:@"UILabelMetrics_textToUseIsAttributed"];
  [v11 encodeBool:(*(unsigned char *)&self->_metricsFlags >> 3) & 1 forKey:@"UILabelMetrics_forDrawing"];
}

- (int64_t)numberOfLines
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  int64_t result = self->_numberOfLines;
  if (result == -1)
  {
    stringDrawingContext = self->_stringDrawingContext;
    return [(NSStringDrawingContext *)stringDrawingContext numberOfLineFragments];
  }
  return result;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (double)firstLineBaselineOffsetFromTop
{
  return self->_firstBaselineOffset;
}

- (double)lastLineBaselineOffsetFromBottom
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  [(_UILabelMetrics *)self _intrinsicBaselineSize];
  return v3 - self->_lastBaselineOffset;
}

- (double)_lastLineBaselineOffsetFromTop
{
  return self->_lastBaselineOffset;
}

- (CGRect)_sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)drawingBounds
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  double x = self->_drawingRect.origin.x;
  double y = self->_drawingRect.origin.y;
  double width = self->_drawingRect.size.width;
  double height = self->_drawingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bounds
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
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

- (CGRect)intrinsicBounds
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  double x = self->_idealBounds.origin.x;
  double y = self->_idealBounds.origin.y;
  double width = self->_idealBounds.size.width;
  double height = self->_idealBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)_intrinsicBaselineSize
{
  if ((*(unsigned char *)&self->_metricsFlags & 0x10) != 0)
  {
    p_double height = &self->_idealBounds.size.height;
    p_CGSize size = &self->_idealBounds.size;
    if (self->_idealBounds.size.height == 0.0)
    {
      p_CGSize size = &self->_bounds.size;
      p_double height = &self->_bounds.size.height;
    }
  }
  else
  {
    p_CGSize size = &self->_sourceRect.size;
    p_double height = &self->_sourceRect.size.height;
  }
  double v4 = *p_height;
  double width = p_size->width;
  result.double height = v4;
  result.double width = width;
  return result;
}

- ($00731F7035C2E13BA23DAA730FFC2B6B)_intrinsicSizeBaselineInfo
{
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  CGPoint origin = self->_sourceRect.origin;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_firstBaselineOffset;
  retstr->var2.CGPoint origin = origin;
  retstr->var2.CGSize size = self->_sourceRect.size;
  uint64_t v7 = 152;
  if (self->_idealBounds.size.height == 0.0) {
    uint64_t v7 = 120;
  }
  CGFloat v8 = (char *)self + v7;
  CGSize v9 = (CGSize)*((_OWORD *)v8 + 1);
  retstr->var4.CGPoint origin = *(CGPoint *)v8;
  retstr->var3 = self->_numberOfLines;
  retstr->var4.CGSize size = v9;
  return result;
}

- (NSStringDrawingContext)_stringDrawingContext
{
  stringDrawingContext = self->_stringDrawingContext;
  if (!stringDrawingContext)
  {
    double v4 = (NSStringDrawingContext *)objc_opt_new();
    int64_t v5 = [(_UILabelConfiguration *)self->_configuration numberOfLines];
    [(NSStringDrawingContext *)v4 setWrapsForTruncationMode:v5 != 1];
    [(NSStringDrawingContext *)v4 setMaximumNumberOfLines:v5];
    [(NSStringDrawingContext *)v4 setCachesLayout:1];
    [(NSStringDrawingContext *)v4 setLayout:self->_layout];
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    CGFloat v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      int v7 = v6[6];

      if ((v7 & 0x10) != 0) {
        [(NSStringDrawingContext *)v4 setUsesSimpleTextEffects:1];
      }
    }
    CGFloat v8 = -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    CGSize v9 = -[_UILabelConfigurationInternal _cuiCatalog](v8);

    if (v9) {
      [(NSStringDrawingContext *)v4 setCuiCatalog:v9];
    }
    CGFloat v10 = -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    id v11 = -[_UILabelConfigurationInternal _cuiStyleEffectConfiguration](v10);

    if (v11)
    {
      [(NSStringDrawingContext *)v4 setCuiStyleEffects:v11];
      if ([v11 useSimplifiedEffect]) {
        [(NSStringDrawingContext *)v4 setUsesSimpleTextEffects:1];
      }
    }
    CGFloat v12 = self->_stringDrawingContext;
    self->_stringDrawingContext = v4;

    stringDrawingContext = self->_stringDrawingContext;
  }
  return stringDrawingContext;
}

- (BOOL)_hyphenationPossiblyDisabledIfURLsDetected
{
  double v3 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  double v4 = [v3 paragraphStyle];

  [v4 hyphenationFactor];
  if (v5 <= 0.0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    CGFloat v6 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      BOOL v7 = (v6[24] >> 6) & 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)_ensureSynthesizedContent
{
  if (!self->_synthesizedContent)
  {
    double v3 = [_UILabelMutableSynthesizedContent alloc];
    double v4 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
    float v5 = [(_UILabelMutableSynthesizedContent *)v3 initWithContent:v4];

    uint64_t v6 = -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    BOOL v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (*(unsigned __int8 *)(v6 + 24) >> 6) & 1;
    }
    else {
      uint64_t v8 = 0;
    }
    [(_UILabelSynthesizedContent *)v5 setDisableLinkHypenation:v8];

    configuration = self->_configuration;
    if (configuration) {
      uint64_t v10 = [(_UILabelConfiguration *)configuration semanticContentAttribute];
    }
    else {
      uint64_t v10 = 0;
    }
    [(_UILabelSynthesizedContent *)v5 setSemanticContentAttribute:v10];
    uint64_t v11 = -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
    CGFloat v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (*(unsigned __int8 *)(v11 + 24) >> 5) & 1;
    }
    else {
      uint64_t v13 = 0;
    }
    [(_UILabelSynthesizedContent *)v5 setOverallWritingDirectionFollowsLayoutDirection:v13];

    CGFloat v14 = -[_UILabelConfiguration _resolvedTextColor](&self->_configuration->super.isa);
    [(_UILabelSynthesizedContent *)v5 setOverrideTextColor:v14];

    CGFloat v15 = self->_configuration;
    if (v15) {
      uint64_t v16 = [(_UILabelConfiguration *)v15 isEnabled] ^ 1;
    }
    else {
      uint64_t v16 = 1;
    }
    [(_UILabelSynthesizedContent *)v5 setEliminateShadows:v16];
    synthesizedContent = self->_synthesizedContent;
    self->_synthesizedContent = v5;
  }
}

- (id)_synthesizedAttributedText
{
  [(_UILabelMetrics *)self _ensureSynthesizedContent];
  synthesizedContent = self->_synthesizedContent;
  return [(_UILabelSynthesizedContent *)synthesizedContent synthesizedAttributedString];
}

- (id)_synthesizedAttributes
{
  [(_UILabelMetrics *)self _ensureSynthesizedContent];
  synthesizedContent = self->_synthesizedContent;
  return [(_UILabelSynthesizedContent *)synthesizedContent synthesizedAttributes];
}

- (double)_lineSpacing
{
  -[_UILabelConfiguration _internal]((id *)&self->_configuration->super.isa);
  int64_t v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    double v3 = v2[1];
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (_UILabelSynthesizedContent)_synthesizedContent
{
  [(_UILabelMetrics *)self _ensureSynthesizedContent];
  synthesizedContent = self->_synthesizedContent;
  return synthesizedContent;
}

- (void)_calculateScaledMetricsUsingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  scaledMetrics = self->_scaledMetrics;
  configuration = self->_configuration;
  if (configuration && [(_UILabelConfiguration *)configuration adjustsFontSizeToFitWidth]
    || self->_associatedScaledMetrics)
  {
    uint64_t v8 = (_UILabelScaledMetrics *)[(_UILabelConfiguration *)self->_configuration copy];
    CGSize v9 = [(_UILabelMetrics *)self _synthesizedAttributedText];
    [(_UILabelScaledMetrics *)v8 setAttributedText:v9];

    uint64_t v10 = [(double *)[_UILabelScaledMetrics alloc] initWithConfiguration:self->_associatedScaledMetrics size:width associatedScaledMetrics:height];
    uint64_t v11 = self->_scaledMetrics;
    self->_scaledMetrics = (_UILabelScaledMetrics *)v10;

    CGFloat v12 = self->_scaledMetrics;
    if (!v12)
    {
      CGFloat v15 = 0;
      goto LABEL_10;
    }
    [(_UILabelScaledMetrics *)self->_scaledMetrics _calculateIfNecessary];
    double actualScaleFactor = v12->_actualScaleFactor;
    if (actualScaleFactor <= 0.0 || actualScaleFactor >= 1.0)
    {
      CGFloat v15 = self->_scaledMetrics;
LABEL_10:
      self->_scaledMetrics = 0;

      goto LABEL_14;
    }
    if ((*(unsigned char *)&self->_metricsFlags & 0x10) == 0)
    {
      uint64_t v16 = -[_UILabelScaledMetrics scaledAttributedText]((id *)&self->_scaledMetrics->super.isa);
      id textToUse = self->_textToUse;
      self->_id textToUse = v16;

      *(unsigned char *)&self->_metricsFlags |= 4u;
    }
  }
  else
  {
    uint64_t v8 = self->_scaledMetrics;
    self->_scaledMetrics = 0;
  }
LABEL_14:

  if ((scaledMetrics == 0) == (self->_scaledMetrics != 0))
  {
    stringDrawingContext = self->_stringDrawingContext;
    [(NSStringDrawingContext *)stringDrawingContext setLayout:0];
  }
}

- (void)_calculatedSynthesizedContentIfNeeded
{
  if ((*(unsigned char *)&self->_metricsFlags & 2) != 0) {
    return;
  }
  *(unsigned char *)&self->_metricsFlags |= 2u;
  -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [(_UILabelMetrics *)self _synthesizedAttributes];
  if ((*(unsigned char *)&self->_metricsFlags & 8) == 0 && ![v16 length])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    BOOL v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = [(_UILabelConfiguration *)self->_configuration font];
    CGSize v9 = v8;
    if (!v8)
    {
      CGSize v9 = +[UILabel defaultFont];
    }
    uint64_t v10 = [v7 dictionaryWithObject:v9 forKey:*(void *)off_1E52D2040];
    float v5 = (__CFString *)[v6 initWithString:0x1ED183200 attributes:v10];

    if (!v8) {
    if (v5)
    }
    {
LABEL_15:
      char v4 = 4;
      goto LABEL_16;
    }
  }
  if (([v16 isNil] & 1) == 0)
  {
    if (([v16 isAttributed] & 1) == 0
      && ![(_UILabelMetrics *)self _hyphenationPossiblyDisabledIfURLsDetected])
    {
      float v5 = [v16 string];
      char v4 = 0;
      goto LABEL_16;
    }
    float v5 = [(_UILabelMetrics *)self _synthesizedAttributedText];
    goto LABEL_15;
  }
  char v4 = 0;
  float v5 = &stru_1ED0E84C0;
LABEL_16:
  id textToUse = self->_textToUse;
  self->_id textToUse = v5;
  CGFloat v12 = v5;

  *(unsigned char *)&self->_metricsFlags = *(unsigned char *)&self->_metricsFlags & 0xFB | v4;
  attributesToUse = self->_attributesToUse;
  self->_attributesToUse = v3;
  CGFloat v14 = v3;

  id layout = self->_layout;
  self->_id layout = 0;

  -[_UILabelMetrics _calculateScaledMetricsUsingSize:](self, "_calculateScaledMetricsUsingSize:", self->_sourceRect.size.width, self->_sourceRect.size.height);
}

- (void)draw
{
  if (self)
  {
    int64_t v2 = self;
    char metricsFlags = (char)self->_metricsFlags;
    if ((metricsFlags & 8) != 0)
    {
LABEL_5:
      *(unsigned char *)&v2->_char metricsFlags = metricsFlags | 8;
      id v6 = self;
      BOOL v7 = self;
      goto LABEL_6;
    }
    char v4 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
    uint64_t v5 = [v4 length];

    if (v5 >= 1)
    {
      int64_t v2 = self;
      char metricsFlags = (char)self->_metricsFlags;
      goto LABEL_5;
    }
    CGFloat v20 = -[_UILabelMetrics _initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:]([_UILabelMetrics alloc], "_initWithConfiguration:sourceRect:synthesizedContent:associatedScaledMetrics:", self->_configuration, 0, self->_associatedScaledMetrics, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
    *(unsigned char *)&v20->_metricsFlags |= 8u;
  }
  else
  {
    CGFloat v20 = 0;
  }
  BOOL v7 = self;
  if (v20 != self)
  {
    [(_UILabelMetrics *)v20 draw];
    uint64_t v8 = v20;
    goto LABEL_18;
  }
LABEL_6:
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)v7);
  uint64_t v8 = self;
  if (self->_textToUse)
  {
    double x = self->_drawingRect.origin.x;
    double y = self->_drawingRect.origin.y;
    double width = self->_drawingRect.size.width;
    double height = self->_drawingRect.size.height;
    uint64_t v13 = [(_UILabelMetrics *)self _stringDrawingContext];
    configuration = self->_configuration;
    if (configuration)
    {
      uint64_t v15 = 1048577;
      internal = configuration->_internal;
      if (internal)
      {
        $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = internal->_configurationFlags;
        uint64_t v18 = 1048705;
        if ((*(unsigned char *)&configurationFlags & 2) == 0) {
          uint64_t v18 = 1048577;
        }
        uint64_t v15 = v18 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    if ([(_UILabelConfiguration *)configuration numberOfLines] == 1) {
      [v13 setMinimumScaleFactor:0.0];
    }
    id textToUse = self->_textToUse;
    if ((*(unsigned char *)&self->_metricsFlags & 4) != 0) {
      objc_msgSend(textToUse, "drawWithRect:options:context:", v15, v13, x, y, width, height);
    }
    else {
      objc_msgSend(textToUse, "drawWithRect:options:attributes:context:", v15, self->_attributesToUse, v13, x, y, width, height);
    }

    uint64_t v8 = self;
  }
LABEL_18:
}

- (id)description
{
  if (*(unsigned char *)&self->_metricsFlags) {
    double v3 = &stru_1ED0E84C0;
  }
  else {
    double v3 = @"{Calculated} ";
  }
  if ((*(unsigned char *)&self->_metricsFlags & 2) != 0) {
    char v4 = &stru_1ED0E84C0;
  }
  else {
    char v4 = @"{ContentSynthesized} ";
  }
  uint64_t v5 = v4;
  id v6 = v3;
  -[_UILabelMetrics _calculateIfNeeded]((uint64_t)self);
  BOOL v7 = NSString;
  uint64_t v8 = objc_opt_class();
  CGSize v9 = NSStringFromCGRect(self->_sourceRect);
  uint64_t v10 = NSStringFromCGRect(self->_bounds);
  uint64_t v11 = NSStringFromCGRect(self->_drawingRect);
  CGFloat v12 = NSStringFromCGRect(self->_idealBounds);
  [(_UILabelMetrics *)self firstLineBaselineOffsetFromTop];
  uint64_t v14 = v13;
  [(_UILabelMetrics *)self lastLineBaselineOffsetFromBottom];
  id v16 = [v7 stringWithFormat:@"<%@:%p %@%@sourceBounds=%@ bounds=%@ drawingBounds=%@ idealBounds=%@ firstLineBaseline=%f lastLineBaseline=%f numberOfLines=%ld scaleFactor=%f>", v8, self, v6, v5, v9, v10, v11, v12, v14, v15, self->_numberOfLines, *(void *)&self->_scaleFactor];

  return v16;
}

- (_UILabelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedScaledMetrics, 0);
  objc_storeStrong(&self->_layout, 0);
  objc_storeStrong((id *)&self->_attributesToUse, 0);
  objc_storeStrong(&self->_textToUse, 0);
  objc_storeStrong((id *)&self->_scaledMetrics, 0);
  objc_storeStrong((id *)&self->_synthesizedContent, 0);
  objc_storeStrong((id *)&self->_stringDrawingContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end