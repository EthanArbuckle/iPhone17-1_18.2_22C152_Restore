@interface _UIToolbarVisualProviderLegacyIOS
- (BOOL)toolbarIsSmall;
- (CGRect)backgroundFrame;
- (CGSize)defaultSizeForOrientation:(int64_t)a3;
- (double)_edgeMarginForBorderedItem:(BOOL)a3 isText:(BOOL)a4;
- (id)_currentCustomBackground;
- (id)_positionToolbarButtons:(id)a3 ignoringItem:(id)a4 resetFontScaleAdjustment:(BOOL)a5 actuallyRepositionButtons:(BOOL)a6;
- (id)_repositionedItemsFromItems:(id)a3 withBarButtonFrames:(id *)a4 withHitRects:(id *)a5 buttonIndexes:(id *)a6 textButtonIndexes:(id *)a7;
- (id)currentBackgroundView;
- (void)_createViewsForItems:(id)a3;
- (void)customViewChangedForButtonItem:(id)a3;
- (void)drawBackgroundViewInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3;
- (void)setCustomBackgroundView:(id)a3;
- (void)updateBackgroundGroupName;
- (void)updateBarBackground;
- (void)updateBarBackgroundSize;
- (void)updateBarForStyle:(int64_t)a3;
- (void)updateItemsForNewFrame:(id)a3;
- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5;
@end

@implementation _UIToolbarVisualProviderLegacyIOS

- (void)_createViewsForItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 view];
        if (v10)
        {
LABEL_7:

          goto LABEL_12;
        }
        if (![v9 isSystemItem]) {
          goto LABEL_11;
        }
        if ([v9 systemItem] == 5) {
          goto LABEL_7;
        }
        if ([v9 systemItem] != 6)
        {
LABEL_11:
          v11 = [v9 createViewForToolbar:self->super._toolbar];
          [v9 setView:v11];

          objc_msgSend(v9, "setIsMinibarView:", -[UIToolbar isMinibar](self->super._toolbar, "isMinibar"));
        }
LABEL_12:
        v12 = [v9 view];

        if (v12)
        {
          toolbar = self->super._toolbar;
          v14 = [v9 view];
          [(UIView *)toolbar addSubview:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)updateItemsForNewFrame:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIToolbar *)self->super._toolbar isMinibar];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "view", (void)v25);
        if (v12 && ([v11 isCustomViewItem] & 1) == 0)
        {
          int v19 = [v11 isMinibarView];

          if (v5 != v19)
          {
            uint64_t v20 = [v11 view];
            long long v18 = [v20 superview];

            if (v18)
            {
              v21 = [v11 view];
              [v21 removeFromSuperview];

              v22 = [v11 createViewForToolbar:self->super._toolbar];
              [v11 setView:v22];

              [v11 setIsMinibarView:v5];
              v23 = [v11 view];
              [v18 addSubview:v23];
            }
            else
            {
              v24 = [v11 createViewForToolbar:self->super._toolbar];
              [v11 setView:v24];

              [v11 setIsMinibarView:v5];
              long long v18 = 0;
            }
            goto LABEL_17;
          }
        }
        else
        {
        }
        uint64_t v13 = [v11 view];
        if (v13)
        {
          v14 = (void *)v13;
          int v15 = [v11 isCustomViewItem];

          if (v15)
          {
            long long v16 = [v11 view];
            char v17 = objc_opt_respondsToSelector();

            if (v17)
            {
              long long v18 = [v11 view];
              [v18 updateForMiniBarState:v5];
LABEL_17:

              continue;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
}

- (id)_repositionedItemsFromItems:(id)a3 withBarButtonFrames:(id *)a4 withHitRects:(id *)a5 buttonIndexes:(id *)a6 textButtonIndexes:(id *)a7
{
  uint64_t v253 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = [MEMORY[0x1E4F1CA48] array];
  id v217 = [MEMORY[0x1E4F1CA48] array];
  v208 = [MEMORY[0x1E4F1CA48] array];
  v225 = self;
  [(UIView *)self->super._toolbar bounds];
  double v213 = v13;
  double v226 = v14;
  uint64_t v15 = [v11 count];
  if (!v15)
  {
    v199 = [MEMORY[0x1E4F28B00] currentHandler];
    [v199 handleFailureInMethod:a2 object:v225 file:@"_UIToolbarVisualProviderLegacyIOS.m" lineNumber:141 description:@"Can't get button frames when there are no items"];
  }
  uint64_t v215 = v15;
  objc_msgSend(MEMORY[0x1E4F28E60], "indexSet", a4, a7);
  id v206 = (id)objc_claimAutoreleasedReturnValue();
  id v211 = [MEMORY[0x1E4F28E60] indexSet];
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  obuint64_t j = v11;
  uint64_t v16 = [obj countByEnumeratingWithState:&v239 objects:v252 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v218 = 0;
    uint64_t v221 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v240;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v240 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v239 + 1) + 8 * i);
        if ([v22 isSystemItem] && objc_msgSend(v22, "systemItem") == 5)
        {
          ++v221;
        }
        else if ([v22 _flexible])
        {
          v23 = (void *)MEMORY[0x1E4F29238];
          v24 = [v22 view];
          [v24 frame];
          long long v25 = objc_msgSend(v23, "valueWithCGRect:");
          [v12 addObject:v25];

          [v211 addIndex:v18 + i];
          ++v19;
        }
        else if ([v22 isSystemItem] && objc_msgSend(v22, "systemItem") == 6)
        {
          ++v218;
        }
        else
        {
          long long v26 = [v22 view];
          [v26 frame];
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          [v22 width];
          if (v35 <= 0.0
            && ([v22 _minimumWidth], v36 <= 0.0)
            && ([v22 _maximumWidth], v37 <= 0.0))
          {
            if (([v22 isCustomViewItem] & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              double v43 = v32;
            }
            else
            {
              [v206 addIndex:v18 + i];
              objc_msgSend(v26, "sizeThatFits:", v32, v34);
              UICeilToViewScale(v225->super._toolbar);
              double v43 = v46;
            }
          }
          else
          {
            [v22 _minimumWidth];
            double v39 = v38;
            [v22 _maximumWidth];
            double v41 = v40;
            [v22 width];
            double v43 = v42;
            if (v42 <= 0.0)
            {
              BOOL v44 = v39 > 0.0 && v32 < v39;
              double v43 = v39;
              if (!v44)
              {
                if (v32 <= v41 || v41 <= 0.0) {
                  double v43 = v32;
                }
                else {
                  double v43 = v41;
                }
              }
            }
          }
          [v211 addIndex:v18 + i];
          v47 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v28, v30, v43, v34);
          [v12 addObject:v47];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v239 objects:v252 count:16];
      v18 += i;
    }
    while (v17);
  }
  else
  {
    uint64_t v218 = 0;
    uint64_t v221 = 0;
    uint64_t v19 = 0;
  }

  v48 = [obj firstObject];
  v205 = [v48 view];

  v49 = [obj lastObject];
  v204 = [v49 view];

  id v50 = [obj firstObject];
  v51 = [v50 view];
  BOOL v52 = (objc_opt_respondsToSelector() & 1) != 0 && ([v51 _isBordered] & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || [v50 style] == 1;
  uint64_t v53 = v215;

  id v54 = [obj lastObject];
  v55 = [v54 view];
  BOOL v56 = (objc_opt_respondsToSelector() & 1) != 0 && ([v55 _isBordered] & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || [v54 style] == 1;

  uint64_t v57 = [v206 containsIndex:0];
  uint64_t v58 = [v206 containsIndex:v215 - 1];
  [(_UIToolbarVisualProviderLegacyIOS *)v225 _edgeMarginForBorderedItem:v52 isText:v57];
  double v60 = v59;
  [(_UIToolbarVisualProviderLegacyIOS *)v225 _edgeMarginForBorderedItem:v56 isText:v58];
  double v62 = v61;
  double v63 = 0.0;
  double v64 = 0.0;
  if (v205)
  {
    [v205 alignmentRectInsets];
    double v64 = v65;
  }
  if (v204)
  {
    [v204 alignmentRectInsets];
    double v63 = v66;
  }
  BOOL v216 = 0;
  if (v221 == 2 && !v19) {
    BOOL v216 = v218 + [v206 count] + 2 != v53;
  }
  double v67 = v60 - v64;
  double v251 = 0.0;
  double v250 = 0.0;
  uint64_t v249 = 0;
  uint64_t v248 = 0;
  double v247 = 0.0;
  double v246 = 0.0;
  if (!(v221 + v19))
  {
    double v91 = 0.0;
LABEL_101:
    double v212 = v91;
    goto LABEL_102;
  }
  unint64_t v210 = v221 + v19;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  id v68 = obj;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v235 objects:v245 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = 0;
    uint64_t v219 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = *(void *)v236;
    double v74 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v70; ++j)
      {
        if (*(void *)v236 != v73) {
          objc_enumerationMutation(v68);
        }
        v76 = *(void **)(*((void *)&v235 + 1) + 8 * j);
        if (v216
          && [*(id *)(*((void *)&v235 + 1) + 8 * j) isSystemItem]
          && [v76 systemItem] == 5)
        {
          *(&v250 + v219) = v74;
          *(&v248 + v219++) = v72;
          double v74 = 0.0;
          uint64_t v72 = 0;
        }
        else if (![v76 isSystemItem] || objc_msgSend(v76, "systemItem") != 5)
        {
          if ([v76 isSystemItem]
            && (([v76 width], v77 > 0.0) || objc_msgSend(v76, "systemItem") == 6))
          {
            [v76 width];
            double v74 = v74 + v78;
            if ([v76 systemItem] != 6)
            {
              ++v71;
              ++v72;
            }
          }
          else
          {
            v79 = [v76 view];
            double v80 = 0.0;
            if (objc_opt_respondsToSelector())
            {
              double v81 = 0.0;
              if ([v79 _canGetPadding])
              {
                [v79 _paddingForLeft:1];
                double v81 = v82;
                [v79 _paddingForLeft:0];
                double v80 = v83;
              }
            }
            else
            {
              double v81 = 0.0;
            }
            v84 = [v12 objectAtIndexedSubscript:v71];
            [v84 CGRectValue];
            double v86 = v85;
            double v88 = v87;

            if ([v76 _flexible])
            {
              char v89 = [v79 isMemberOfClass:objc_opt_class()];
              double v90 = 0.0;
              if ((v89 & 1) == 0) {
                objc_msgSend(v79, "sizeThatFits:", v86, v88);
              }
            }
            else
            {
              double v90 = v86;
            }
            double v74 = v74 + v90 - v81 - v80;
            ++v72;
            ++v71;
          }
        }
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v235 objects:v245 count:16];
    }
    while (v70);
  }
  else
  {
    uint64_t v72 = 0;
    double v74 = 0.0;
  }
  double v92 = v62 - v63;

  if (v72 <= 1) {
    uint64_t v93 = 1;
  }
  else {
    uint64_t v93 = v72;
  }
  uint64_t v94 = v93 - 1;
  if (!v216)
  {
LABEL_100:
    BOOL v216 = 0;
    double v91 = (v213 - v74 - (v67 + v92) + (double)v94 * -10.0) / (double)v210;
    goto LABEL_101;
  }
  double v95 = v251;
  uint64_t v96 = v249;
  double v97 = (v213 - v251 + (double)v249 * -10.0) * 0.5;
  double v98 = floor(v97);
  double v99 = ceil(v97);
  double v100 = 0.0;
  double v212 = 0.0;
  if (v249 >= 1) {
    UICeilToViewScale(v225->super._toolbar);
  }
  double v101 = v98 - (v67 + v250 + (double)v248 * 10.0 - v100);
  double v102 = v99 - (v92 + v74 + (double)v94 * 10.0 + v100);
  double v246 = v101;
  double v247 = v102;
  if (v101 < 0.0 || v102 < 0.0)
  {
    double v103 = fmax((double)(v248 + v96) + -1.0, 0.0);
    if (v74 > 0.0) {
      v94 += v248 + v96;
    }
    else {
      uint64_t v94 = (uint64_t)v103;
    }
    double v74 = v74 + v95 + v250;
    goto LABEL_100;
  }
  BOOL v216 = 1;
LABEL_102:
  _UIControlMostlyInsideEdgeInsets();
  double v105 = v104;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  id v209 = obj;
  uint64_t v106 = [v209 countByEnumeratingWithState:&v231 objects:v244 count:16];
  if (!v106)
  {
    v109 = 0;
    goto LABEL_161;
  }
  uint64_t v107 = v106;
  uint64_t v108 = 0;
  uint64_t v207 = 0;
  v109 = 0;
  double v110 = *MEMORY[0x1E4F1DB28];
  double v111 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v214 = -v105;
  uint64_t v112 = *(void *)v232;
  do
  {
    uint64_t v113 = 0;
    do
    {
      if (*(void *)v232 != v112) {
        objc_enumerationMutation(v209);
      }
      v114 = *(void **)(*((void *)&v231 + 1) + 8 * v113);
      if ([v114 isSystemItem] && objc_msgSend(v114, "systemItem") == 5)
      {
        if (v216) {
          double v67 = v67 + *(&v246 + v207++);
        }
        else {
          double v67 = v212 + v67;
        }
        goto LABEL_155;
      }
      if ([v114 isSystemItem] && objc_msgSend(v114, "systemItem") == 6)
      {
        [v114 width];
        double v67 = v67 + v115;
        goto LABEL_155;
      }
      v116 = [v114 view];
      v117 = [v12 objectAtIndexedSubscript:v108];
      [v117 CGRectValue];
      double v119 = v118;
      double v121 = v120;

      if ([v114 _flexible])
      {
        double v122 = 0.0;
        if (([v116 isMemberOfClass:objc_opt_class()] & 1) == 0)
        {
          objc_msgSend(v116, "sizeThatFits:", v119, v121);
          double v122 = v123;
        }
      }
      else
      {
        double v122 = v119;
      }
      double v124 = 0.0;
      if (objc_opt_respondsToSelector())
      {
        double v125 = 0.0;
        if ([v116 _canGetPadding])
        {
          [v116 _paddingForLeft:1];
          double v124 = v126;
          [v116 _paddingForLeft:0];
          double v125 = v127;
        }
      }
      else
      {
        double v125 = 0.0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v116 _useBarHeight]) {
        double v121 = v226;
      }
      UIRoundToViewScale(v225->super._toolbar);
      double v129 = v128;
      uint64_t v130 = [(UIToolbar *)v225->super._toolbar barPosition];
      BOOL v132 = v130 != 1 && v130 != 4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v116, "_backgroundVerticalPositionAdjustmentForBarMetrics:", -[UIToolbar isMinibar](v225->super._toolbar, "isMinibar"));
        double v129 = v129 + v133;
      }
      if (objc_opt_respondsToSelector()) {
        [v116 _setInTopBar:v132];
      }
      [v114 width];
      double v222 = v125;
      if (v134 <= 0.0)
      {
        [v114 _minimumWidth];
        if (v136 <= 0.0 || ([v114 _minimumWidth], v122 >= v137))
        {
          [v114 _maximumWidth];
          if (v138 <= 0.0) {
            goto LABEL_144;
          }
          [v114 _maximumWidth];
          if (v122 <= v139) {
            goto LABEL_144;
          }
          [v114 _maximumWidth];
        }
        else
        {
          [v114 _minimumWidth];
        }
      }
      else
      {
        [v114 width];
      }
      double v122 = v135;
LABEL_144:
      double v140 = v67 - v124;
      double v141 = round(v67 - v124);
      int v142 = [v114 _flexible];
      double v143 = -0.0;
      if (v142) {
        double v143 = v212;
      }
      double v144 = v122 + v143;
      [v116 frame];
      v258.origin.x = v145;
      v258.origin.y = v146;
      v258.size.width = v147;
      v258.size.height = v148;
      v255.origin.x = v141;
      v255.origin.y = v129;
      v255.size.width = v144;
      v255.size.height = v121;
      if (!CGRectEqualToRect(v255, v258)) {
        [v208 addObject:v114];
      }
      double obja = v121;
      CGFloat v220 = v141;
      if (v109)
      {
        double v149 = fmin((v141 - (v110 + v111)) * 0.5, v214);
        v150 = [v217 lastObject];
        [v150 CGRectValue];
        double v152 = v151;
        double v154 = v153;
        double v156 = v155;
        double v157 = v140;
        double v158 = v129;
        double v160 = v159;

        [v217 removeLastObject];
        double v161 = v160;
        double v129 = v158;
        double v140 = v157;
        v162 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v152, v154, v149 + v156, v161);
        [v217 addObject:v162];
      }
      else
      {
        double v149 = fmin(v141, v214);
      }
      double v163 = v144 + v149;
      if (v108 == [v12 count] - 1)
      {
        [(UIView *)v225->super._toolbar bounds];
        double MaxX = CGRectGetMaxX(v256);
        double v165 = v220;
        v257.origin.x = v220;
        v257.origin.y = v129;
        v257.size.width = v144;
        double v166 = v129;
        double v167 = obja;
        v257.size.height = obja;
        double v163 = v163 + fmin(MaxX - CGRectGetMaxX(v257), v214);
      }
      else
      {
        double v166 = v129;
        double v167 = obja;
        double v165 = v220;
      }
      double v67 = v140 + v144 - v222 + 10.0;
      v168 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", -v149, -v166, v163, v226);
      [v217 addObject:v168];

      v169 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v165, v166, v144, v167);
      [v12 replaceObjectAtIndex:v108 withObject:v169];

      id v170 = v116;
      ++v108;

      v109 = v170;
      double v110 = v165;
      double v111 = v144;
LABEL_155:
      ++v113;
    }
    while (v107 != v113);
    uint64_t v171 = [v209 countByEnumeratingWithState:&v231 objects:v244 count:16];
    uint64_t v107 = v171;
  }
  while (v171);
LABEL_161:

  v172 = v217;
  v173 = a5;
  if (v200)
  {
    if ((*((_DWORD *)&v225->super._toolbar->super._viewFlags + 4) & 0x80000) != 0 && v12 && [v12 count])
    {
      [(UIView *)v225->super._toolbar bounds];
      _UIRTLConvertAllLTRFramesToRTL(v12, v174, v175, v176, v177);
    }
    void *v200 = v12;
  }
  if (v201) {
    void *v201 = v206;
  }
  if (a6) {
    *a6 = v211;
  }
  if (a5)
  {
    if ((*((_DWORD *)&v225->super._toolbar->super._viewFlags + 4) & 0x80000) != 0
      && v217
      && [v217 count])
    {
      long long v227 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      long long v230 = 0u;
      id v178 = (id)[v217 copy];
      uint64_t v179 = [v178 countByEnumeratingWithState:&v227 objects:v243 count:16];
      if (v179)
      {
        uint64_t v180 = v179;
        uint64_t v181 = 0;
        uint64_t v182 = *(void *)v228;
        do
        {
          for (uint64_t k = 0; k != v180; ++k)
          {
            if (*(void *)v228 != v182) {
              objc_enumerationMutation(v178);
            }
            [*(id *)(*((void *)&v227 + 1) + 8 * k) CGRectValue];
            double v185 = v184;
            double v187 = v186;
            double v189 = v188;
            double v191 = v190;
            v192 = [v12 objectAtIndexedSubscript:v181 + k];
            [v192 CGRectValue];
            double v194 = v185 + v189 - v193;

            double v195 = -v194;
            if (v194 < -0.0) {
              double v195 = 0.0;
            }
            v196 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v195, v187, v189, v191);
            [v217 replaceObjectAtIndex:v181 + k withObject:v196];
          }
          uint64_t v180 = [v178 countByEnumeratingWithState:&v227 objects:v243 count:16];
          v181 += k;
        }
        while (v180);
      }

      v172 = v217;
      v173 = a5;
    }
    id *v173 = v172;
  }
  id v197 = v208;

  return v197;
}

- (void)layoutSubviews
{
  [(_UIToolbarVisualProviderLegacyIOS *)self updateBarBackground];
  v3 = [(UIView *)self->super._toolbar subviews];
  id v4 = +[UIDevice currentDevice];
  _UINavigationButtonUpdateAccessibilityBackgrounds(v3, [v4 _graphicsQuality] == 100, 0);

  [(_UIToolbarVisualProviderLegacyIOS *)self positionToolbarButtonsAndResetFontScaleAdjustment:0];
}

- (void)positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3
{
  id v3 = [(_UIToolbarVisualProviderLegacyIOS *)self _positionToolbarButtons:0 ignoringItem:0 resetFontScaleAdjustment:a3 actuallyRepositionButtons:1];
}

- (id)_positionToolbarButtons:(id)a3 ignoringItem:(id)a4 resetFontScaleAdjustment:(BOOL)a5 actuallyRepositionButtons:(BOOL)a6
{
  BOOL v129 = a6;
  BOOL v6 = a5;
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v130 = a4;
  if (!v9)
  {
    id v9 = [(UIToolbar *)self->super._toolbar items];
  }
  if (![v9 count])
  {
    uint64_t v18 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_117;
  }
  double v136 = self;
  if (v6)
  {
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v172 objects:v185 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v173;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v173 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v172 + 1) + 8 * i) view];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = [v15 _info];
            [v16 _setFontScaleAdjustment:1.0];

            if ([v15 _wantsAccessibilityButtonShapes])
            {
              uint64_t v17 = [v15 _info];
              [v17 sizeToFit];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v172 objects:v185 count:16];
      }
      while (v12);
    }

    self = v136;
  }
  id v171 = 0;
  id v170 = 0;
  id v169 = 0;
  id v168 = 0;
  uint64_t v18 = [(_UIToolbarVisualProviderLegacyIOS *)self _repositionedItemsFromItems:v9 withBarButtonFrames:&v171 withHitRects:&v170 buttonIndexes:&v169 textButtonIndexes:&v168];
  id v19 = v171;
  id v132 = v170;
  id v126 = v169;
  id v137 = v168;
  uint64_t v20 = [v137 count];
  BOOL v124 = v20 != 0;
  if (v20)
  {
    int v21 = *((_DWORD *)&self->super._toolbar->super._viewFlags + 4);
    id v22 = v19;
    v23 = v22;
    if ((v21 & 0x80000) != 0) {
      [v22 reverseObjectEnumerator];
    }
    else {
    v24 = [v22 objectEnumerator];
    }
    long long v25 = [v24 nextObject];
    [v25 CGRectValue];
    double MinX = CGRectGetMinX(v189);

    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    id v27 = v24;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v176 objects:v186 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double x = MinX + -10.0;
      uint64_t v34 = *(void *)v177;
      while (2)
      {
        uint64_t v35 = 0;
        double v36 = height;
        CGFloat v37 = width;
        CGFloat v38 = y;
        CGFloat v39 = x;
        do
        {
          CGFloat rect = v36;
          if (*(void *)v177 != v34) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v176 + 1) + 8 * v35) CGRectValue];
          double x = v190.origin.x;
          CGFloat y = v190.origin.y;
          CGFloat width = v190.size.width;
          double height = v190.size.height;
          CGFloat v40 = CGRectGetMinX(v190) + -10.0;
          v191.origin.double x = v39;
          v191.origin.CGFloat y = v38;
          v191.size.CGFloat width = v37;
          v191.size.double height = rect;
          if (v40 < CGRectGetMaxX(v191))
          {

            [(UIView *)self->super._toolbar bounds];
            BOOL v41 = !CGRectIsEmpty(v192);
            goto LABEL_32;
          }
          ++v35;
          double v36 = height;
          CGFloat v37 = width;
          CGFloat v38 = y;
          CGFloat v39 = x;
        }
        while (v29 != v35);
        uint64_t v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v176, v186, 16, height);
        if (v29) {
          continue;
        }
        break;
      }
    }
  }
  LOBYTE(v41) = 0;
LABEL_32:
  [(UIView *)self->super._toolbar bounds];
  double v43 = v42;
  v131 = v9;
  if (v42 > 0.0)
  {
    BOOL v44 = v18;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id v45 = v19;
    id v46 = v19;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v164 objects:v184 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = 0;
      uint64_t v50 = *(void *)v165;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v165 != v50) {
            objc_enumerationMutation(v46);
          }
          [*(id *)(*((void *)&v164 + 1) + 8 * j) CGRectValue];
          double MaxX = CGRectGetMaxX(v193);
          [(UIView *)v136->super._toolbar bounds];
          if (MaxX > v53 && [v137 containsIndex:v49 + j]) {
            LOBYTE(v41) = 1;
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v164 objects:v184 count:16];
        v49 += j;
      }
      while (v48);
    }

    id v19 = v45;
    uint64_t v18 = v44;
    self = v136;
  }
  if (v41)
  {
    [v9 objectsAtIndexes:v137];
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = [v54 countByEnumeratingWithState:&v160 objects:v183 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v161;
      uint64_t v58 = *(void *)off_1E52D2040;
      double v127 = v18;
      while (2)
      {
        id v59 = v19;
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v161 != v57) {
            objc_enumerationMutation(v54);
          }
          double v61 = *(void **)(*((void *)&v160 + 1) + 8 * k);
          double v62 = [v61 _appearanceStorage];
          double v63 = [v61 view];
          double v64 = [v63 _info];
          double v65 = [v64 _appearanceStorage];

          double v66 = [v62 textAttributeForKey:v58 state:0];
          if (v66)
          {

LABEL_60:
            int v68 = 0;
            id v19 = v59;
            self = v136;
            uint64_t v18 = v127;
            goto LABEL_61;
          }
          double v67 = [v65 textAttributeForKey:v58 state:0];

          if (v67) {
            goto LABEL_60;
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v160 objects:v183 count:16];
        int v68 = 1;
        id v19 = v59;
        self = v136;
        uint64_t v18 = v127;
        if (v56) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v68 = 1;
    }
LABEL_61:

    goto LABEL_62;
  }
  int v68 = 0;
  id v54 = 0;
  if (!v20)
  {
LABEL_62:
    BOOL v69 = v129;
    goto LABEL_63;
  }
  BOOL v69 = v129;
  if (v129)
  {
    id v54 = [v131 objectsAtIndexes:v137];
    int v68 = 0;
  }
LABEL_63:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke;
  aBlock[3] = &unk_1E52DF220;
  BOOL v158 = v69;
  BOOL v159 = v124;
  id v125 = v54;
  id v157 = v125;
  uint64_t v70 = (void (**)(void))_Block_copy(aBlock);
  double v123 = v70;
  if (v68)
  {
    if ((*((_DWORD *)&self->super._toolbar->super._viewFlags + 4) & 0x80000) != 0)
    {
      uint64_t v71 = [v19 lastObject];
      [v19 firstObject];
    }
    else
    {
      uint64_t v71 = [v19 firstObject];
      [v19 lastObject];
    }
    double v122 = v128 = v18;
    [v122 CGRectValue];
    double v73 = CGRectGetMaxX(v194);
    if (v73 <= v43) {
      double v74 = v73;
    }
    else {
      double v74 = v43;
    }
    recta = v71;
    [v71 CGRectValue];
    double v75 = CGRectGetMinX(v195);
    v76 = v19;
    uint64_t v121 = [v19 count];
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v77 = v131;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v152 objects:v182 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = 0;
      uint64_t v81 = 0;
      uint64_t v82 = *(void *)v153;
      double v83 = 0.0;
      double v84 = 0.0;
      do
      {
        for (uint64_t m = 0; m != v79; ++m)
        {
          if (*(void *)v153 != v82) {
            objc_enumerationMutation(v77);
          }
          double v86 = *(void **)(*((void *)&v152 + 1) + 8 * m);
          if (!objc_msgSend(v86, "isSystemItem", v121)
            || [v86 systemItem] != 5 && objc_msgSend(v86, "systemItem") != 6)
          {
            double v87 = [v76 objectAtIndexedSubscript:v81];
            [v87 CGRectValue];
            double v89 = v88;

            if ([v137 containsIndex:v80 + m])
            {
              double v90 = [v86 view];
              int v91 = [v90 _isBorderedOtherThanAccessibility];

              double v92 = -0.0;
              if (!v91) {
                double v92 = v89;
              }
              double v84 = v84 + v92;
            }
            double v83 = v83 + v89;
            ++v81;
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v152 objects:v182 count:16];
        v80 += m;
      }
      while (v79);
    }
    else
    {
      double v83 = 0.0;
      double v84 = 0.0;
    }

    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v93 = v125;
    uint64_t v94 = [v93 countByEnumeratingWithState:&v148 objects:v181 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      double v96 = (v74 - v75 + (double)(unint64_t)(v121 - 1) * -10.0 - (v83 - v84)) / v84;
      uint64_t v97 = *(void *)v149;
      do
      {
        for (uint64_t n = 0; n != v95; ++n)
        {
          if (*(void *)v149 != v97) {
            objc_enumerationMutation(v93);
          }
          double v99 = *(void **)(*((void *)&v148 + 1) + 8 * n);
          double v100 = objc_msgSend(v99, "view", v121);
          if (([v100 _isBorderedOtherThanAccessibility] & 1) == 0)
          {
            double v101 = [v99 view];
            double v102 = [v101 _info];
            [v102 _fontScaleAdjustment];
            double v104 = v103;

            double v105 = v104 == 0.0 ? 1.0 : v104;
            double v106 = fmin(fmax(v96 * v105, 0.5), 1.0);
            uint64_t v107 = [v100 _info];
            [v107 _setFontScaleAdjustment:v106];

            if ([v100 _wantsAccessibilityButtonShapes])
            {
              uint64_t v108 = [v100 _info];
              [v108 sizeToFit];
            }
          }
        }
        uint64_t v95 = [v93 countByEnumeratingWithState:&v148 objects:v181 count:16];
      }
      while (v95);
    }

    uint64_t v72 = v123;
    v123[2](v123);
    id v146 = v132;
    id v147 = v76;
    uint64_t v18 = [(_UIToolbarVisualProviderLegacyIOS *)v136 _repositionedItemsFromItems:v77 withBarButtonFrames:&v147 withHitRects:&v146 buttonIndexes:0 textButtonIndexes:0];
    id v19 = v147;

    id v109 = v146;
    id v132 = v109;
    id v9 = v131;
    if (!v129) {
      goto LABEL_116;
    }
    goto LABEL_103;
  }
  uint64_t v72 = v70;
  id v9 = v131;
  if (v69)
  {
LABEL_103:
    double v110 = v19;
    v72[2](v72);
    [v9 objectsAtIndexes:v126];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    rectb = long long v145 = 0u;
    uint64_t v111 = [rectb countByEnumeratingWithState:&v142 objects:v180 count:16];
    if (v111)
    {
      uint64_t v112 = v111;
      uint64_t v113 = 0;
      uint64_t v114 = *(void *)v143;
      do
      {
        for (iuint64_t i = 0; ii != v112; ++ii)
        {
          if (*(void *)v143 != v114) {
            objc_enumerationMutation(rectb);
          }
          v116 = objc_msgSend(*(id *)(*((void *)&v142 + 1) + 8 * ii), "view", v121);
          [v116 alpha];
          if (v117 == 0.0)
          {
            v138[0] = MEMORY[0x1E4F143A8];
            v138[1] = 3221225472;
            v138[2] = __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke_2;
            v138[3] = &unk_1E52DA070;
            id v139 = v116;
            id v140 = v110;
            uint64_t v141 = v113 + ii;
            +[UIView performWithoutAnimation:v138];

            double v118 = v139;
          }
          else
          {
            double v118 = [v110 objectAtIndexedSubscript:v113 + ii];
            [v118 CGRectValue];
            objc_msgSend(v116, "setFrame:");
          }

          if (objc_opt_respondsToSelector())
          {
            double v119 = [v132 objectAtIndexedSubscript:v113 + ii];
            [v119 CGRectValue];
            objc_msgSend(v116, "_setButtonBarHitRect:");
          }
        }
        uint64_t v112 = [rectb countByEnumeratingWithState:&v142 objects:v180 count:16];
        v113 += ii;
      }
      while (v112);
    }

    id v9 = v131;
    id v19 = v110;
    uint64_t v72 = v123;
  }
LABEL_116:

LABEL_117:
  return v18;
}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  BOOL v37 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(_UIToolbarVisualProviderLegacyIOS *)self _createViewsForItems:v7];
  id v9 = (void *)[v8 mutableCopy];
  double v42 = self;
  CGFloat v38 = [(_UIToolbarVisualProviderLegacyIOS *)self _positionToolbarButtons:0 ignoringItem:0 resetFontScaleAdjustment:0 actuallyRepositionButtons:0];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
        uint64_t v15 = [v14 view];
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          if (!v9 || [v9 indexOfObjectIdenticalTo:v14] == 0x7FFFFFFFFFFFFFFFLL)
          {

LABEL_10:
            uint64_t v17 = [v14 view];
            [v17 setAlpha:0.0];

            goto LABEL_11;
          }
          uint64_t v18 = [v38 indexOfObjectIdenticalTo:v14];

          if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_10;
          }
        }
LABEL_11:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      uint64_t v11 = v19;
    }
    while (v19);
  }

  [v9 removeObjectsInArray:obj];
  CGFloat v39 = [MEMORY[0x1E4F1CA48] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v40 = v8;
  uint64_t v20 = [v40 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v51 != v22) {
          objc_enumerationMutation(v40);
        }
        v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        long long v25 = [v24 view];
        uint64_t v26 = [v25 superview];
        if (v26)
        {
          id v27 = (void *)v26;
          uint64_t v28 = [v24 view];
          uint64_t v29 = [v28 superview];
          toolbar = v42->super._toolbar;

          if (v29 != toolbar) {
            [v39 addObject:v24];
          }
        }
        else
        {
        }
      }
      uint64_t v21 = [v40 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v21);
  }

  [v9 removeObjectsInArray:v39];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke;
  aBlock[3] = &unk_1E52DCB30;
  id v31 = v9;
  id v47 = v31;
  uint64_t v48 = v42;
  id v32 = obj;
  id v49 = v32;
  double v33 = (void (**)(void))_Block_copy(aBlock);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke_2;
  v43[3] = &unk_1E52DA660;
  id v34 = v31;
  id v44 = v34;
  id v35 = v32;
  id v45 = v35;
  double v36 = (void (**)(void *, uint64_t))_Block_copy(v43);
  if (v37)
  {
    +[UIView animateWithDuration:v33 animations:v36 completion:0.2];
  }
  else
  {
    v33[2](v33);
    v36[2](v36, 1);
  }
}

- (void)customViewChangedForButtonItem:(id)a3
{
  id v12 = a3;
  id v4 = [v12 customView];
  if (v4)
  {
    BOOL v5 = [(UIToolbar *)self->super._toolbar items];
    unint64_t v6 = [v5 indexOfObject:v12];

    id v7 = [(UIView *)self->super._toolbar subviews];
    unint64_t v8 = [v7 count];

    if (v6 >= v8)
    {
      [(UIView *)self->super._toolbar addSubview:v4];
    }
    else
    {
      id v9 = [(UIView *)self->_backgroundView superview];
      toolbar = self->super._toolbar;

      if (v9 == toolbar) {
        unint64_t v11 = v6 + 1;
      }
      else {
        unint64_t v11 = v6;
      }
      [(UIView *)self->super._toolbar insertSubview:v4 atIndex:v11];
    }
  }
}

- (void)setCustomBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundView, a3);
  id v5 = a3;
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:v5];
}

- (id)currentBackgroundView
{
  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView) {
    customBackgroundView = self->_backgroundView;
  }
  return customBackgroundView;
}

- (CGRect)backgroundFrame
{
  [(UIView *)self->_backgroundView frame];
  result.size.double height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)updateBarBackgroundSize
{
  [(UIView *)self->super._toolbar bounds];
  backgroundView = self->_backgroundView;
  -[UIView setBounds:](backgroundView, "setBounds:");
}

- (void)updateBarForStyle:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v5 = [(UIToolbar *)self->super._toolbar barTintColor];
  if (!v5)
  {
    unint64_t v6 = +[UIDevice currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v8 = [(UIToolbar *)self->super._toolbar items];
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
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (v7 == 1
            || ([*(id *)(*((void *)&v18 + 1) + 8 * i) image],
                (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
            && (uint64_t v15 = (void *)v14, v16 = [v13 _imageHasEffects], v15, (v16 & 1) == 0))
          {
            [v13 _updateView];
          }
          uint64_t v17 = [v13 view];
          if (objc_opt_respondsToSelector()) {
            [v17 setBarStyle:a3];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    double v5 = 0;
  }
}

- (void)updateBarBackground
{
  BOOL v3 = [(UIView *)self->super._toolbar _canDrawContent];
  backgroundView = self->_backgroundView;
  if (v3)
  {
    double v5 = self->_backgroundView;
    [(UIView *)v5 removeFromSuperview];
    return;
  }
  if (!backgroundView)
  {
    unint64_t v6 = [_UIBarBackground alloc];
    [(UIView *)self->super._toolbar bounds];
    uint64_t v7 = -[_UIBarBackground initWithFrame:](v6, "initWithFrame:");
    unint64_t v8 = self->_backgroundView;
    self->_backgroundView = v7;

    uint64_t v9 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v9;

    [(_UIBarBackground *)self->_backgroundView setLayout:self->_backgroundViewLayout];
    backgroundView = self->_backgroundView;
  }
  [(UIView *)self->super._toolbar insertSubview:backgroundView atIndex:0];
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:self->_customBackgroundView];
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setDisableTinting:[(UIToolbar *)self->super._toolbar _disableBlurTinting]];
  [(UIView *)self->super._toolbar bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int64_t v19 = [(UIToolbar *)self->super._toolbar barPosition];
  BOOL v20 = v19 == 3;
  unint64_t v21 = v19 & 0xFFFFFFFFFFFFFFFELL;
  [(_UIBarBackground *)self->_backgroundView setTopAligned:(v19 & 0xFFFFFFFFFFFFFFFELL) == 2];
  if (!self->_customBackgroundView)
  {
    uint64_t v26 = [(UIView *)self->super._toolbar traitCollection];
    -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", [v26 userInterfaceIdiom]);

    id v27 = [(UIView *)self->super._toolbar traitCollection];
    -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", [v27 userInterfaceStyle]);

    BOOL v28 = [(UIToolbar *)self->super._toolbar isTranslucent];
    uint64_t v29 = [(UIToolbar *)self->super._toolbar barTintColor];
    UIBarStyle v30 = [(UIToolbar *)self->super._toolbar barStyle];
    if (v30 == 4)
    {
      BOOL v31 = [(UIToolbar *)self->super._toolbar _hidesShadow];
LABEL_20:
      BOOL v41 = [(UIView *)self->super._toolbar _screen];
      uint64_t v42 = [v41 _userInterfaceIdiom];

      if (v42 == 3)
      {
        [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureAsTransparent];
        BOOL v20 = 0;
      }
      else
      {
        if ([(UIToolbar *)self->super._toolbar _linkedBeforeWhitetailAndInitializedFromCoder]&& !v29&& ([(UIView *)self->super._toolbar backgroundColor], double v43 = objc_claimAutoreleasedReturnValue(), v43, v43))
        {
          [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureAsTransparent];
        }
        else
        {
          [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureEffectForStyle:v30 backgroundTintColor:v29 forceOpaque:!v28];
        }
        [(_UIToolbarVisualProviderLegacyIOS *)self updateBackgroundGroupName];
      }
      id v44 = self->_backgroundViewLayout;
      if (v31) {
        [(_UIBarBackgroundLayoutLegacy *)v44 configureWithoutShadow];
      }
      else {
        [(_UIBarBackgroundLayoutLegacy *)v44 configureShadowForBarStyle:v30];
      }
      id v32 = 0;
      id v45 = 0;
      double v46 = 0.0;
LABEL_47:
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout setTopInset:v46];

      if (v20) {
        goto LABEL_9;
      }
LABEL_48:
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout topInset];
      double v25 = v54;
      goto LABEL_49;
    }
    id v32 = [(_UIToolbarVisualProviderLegacyIOS *)self _currentCustomBackground];
    BOOL v61 = [(UIToolbar *)self->super._toolbar _hidesShadow];
    if (!v32)
    {
      BOOL v31 = v61;
      goto LABEL_20;
    }
    uint64_t v60 = v29;
    [v32 size];
    double v34 = v33;
    [v32 capInsets];
    int v37 = 0;
    if (v19 == 3 && v35 == 0.0 && v36 == 0.0)
    {
      CGFloat v38 = [(UIView *)self->super._toolbar window];
      __UIStatusBarManagerForWindow(v38);
      v40 = BOOL v39 = v20;
      int v59 = [v40 isStatusBarHidden];

      BOOL v20 = v39;
      int v37 = (v34 == v18) & ~v59;
    }
    char v62 = 0;
    [v32 _isInvisibleAndGetIsTranslucent:&v62];
    if (v28)
    {
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureImage:v32 forceTranslucent:v62 == 0];
    }
    else
    {
      id v47 = self->_backgroundViewLayout;
      if (v60) {
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](v47, "configureImage:forceOpaque:backgroundTintColor:", v32, v62 != 0);
      }
      else {
        [(_UIBarBackgroundLayoutLegacy *)v47 configureImage:v32 forceOpaque:v62 != 0 barStyle:v30];
      }
    }
    if (v61)
    {
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
      id v45 = 0;
    }
    else
    {
      uint64_t v48 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
      id v49 = v48;
      if (v21 == 2) {
        [v48 topShadowImage];
      }
      else {
      id v45 = [v48 shadowImage];
      }

      long long v50 = self->_backgroundViewLayout;
      if (v45)
      {
        [(_UIBarBackgroundLayoutLegacy *)v50 configureShadowImage:v45];
        double v46 = 0.0;
        if (!v37) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      [(_UIBarBackgroundLayoutLegacy *)v50 configureShadowForBarStyle:v30];
    }
    double v46 = 0.0;
    if ((v37 & 1) == 0)
    {
LABEL_46:
      uint64_t v29 = v60;
      goto LABEL_47;
    }
LABEL_45:
    long long v51 = [(UIView *)self->super._toolbar window];
    long long v52 = __UIStatusBarManagerForWindow(v51);
    [v52 defaultStatusBarHeightInOrientation:1];
    double v46 = v53;

    goto LABEL_46;
  }
  [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
  [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout setTopInset:0.0];
  if (v19 != 3) {
    goto LABEL_48;
  }
LABEL_9:
  uint64_t v22 = [(UIView *)self->super._toolbar window];
  uint64_t v23 = __UIStatusBarManagerForWindow(v22);
  [v23 statusBarHeight];
  double v25 = v24;

LABEL_49:
  [(UIView *)self->_backgroundView frame];
  v65.origin.double x = v55;
  v65.origin.CGFloat y = v56;
  v65.size.CGFloat width = v57;
  v65.size.double height = v58;
  v64.origin.double x = v12;
  v64.origin.CGFloat y = v14 - v25;
  v64.size.CGFloat width = v16;
  v64.size.double height = v18 + v25;
  if (!CGRectEqualToRect(v64, v65)) {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v12, v14 - v25, v16, v18 + v25);
  }
  [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
}

- (void)updateBackgroundGroupName
{
  id v5 = [(UIView *)self->super._toolbar traitCollection];
  BOOL v3 = self;
  double v4 = [v5 objectForTrait:v3];
  [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
}

- (id)_currentCustomBackground
{
  int64_t v3 = [(UIToolbar *)self->super._toolbar _barPosition];
  double v4 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
  id v5 = [v4 backgroundImageForBarPosition:v3 barMetrics:0];

  if (v3 == 3 && v5 == 0) {
    int64_t v3 = 2;
  }
  if (!v5)
  {
    if (v3 == [(UIToolbar *)self->super._toolbar _barPosition])
    {
      id v5 = 0;
    }
    else
    {
      uint64_t v7 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
      id v5 = [v7 backgroundImageForBarPosition:v3 barMetrics:0];
    }
  }
  BOOL v8 = [(UIToolbar *)self->super._toolbar isMinibar];
  if (v5) {
    BOOL v9 = !v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
    double v11 = objc_msgSend(v10, "backgroundImageForBarPosition:barMetrics:", -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"), 1);

    if (v11)
    {
      double v12 = v5;
      id v5 = v11;
    }
    else
    {
      if (v3 == [(UIToolbar *)self->super._toolbar _barPosition])
      {
LABEL_19:

        goto LABEL_20;
      }
      double v12 = [(UIToolbar *)self->super._toolbar __appearanceStorage];
      id v13 = (id)[v12 backgroundImageForBarPosition:v3 barMetrics:1];
    }

    goto LABEL_19;
  }
LABEL_20:
  return v5;
}

- (void)drawBackgroundViewInRect:(CGRect)a3
{
  [(UIView *)self->super._toolbar bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v12 = [(UIView *)self->super._toolbar superview];
  [v12 safeAreaInsets];
  double v14 = v11 + v13;

  int64_t v15 = [(UIToolbar *)self->super._toolbar _barPosition];
  if ([(UIToolbar *)self->super._toolbar barStyle] == (UIBarStyleBlackTranslucent|UIBarStyleBlackOpaque))
  {
    double v16 = +[UIColor clearColor];
    [v16 set];

    UIRectFillUsingOperation(1, v5, v7, v9, v14);
    return;
  }
  UIBarStyle v17 = [(UIToolbar *)self->super._toolbar barStyle];
  id v41 = [(UIToolbar *)self->super._toolbar barTintColor];
  int64_t v18 = [(UIToolbar *)self->super._toolbar _barTranslucence];
  int64_t v19 = v18;
  if (!v41)
  {
    double v40 = v7;
    if (v17 != UIBarStyleBlackTranslucent)
    {
      if (v17 == UIBarStyleBlack)
      {
        if (v18 == 1) {
          goto LABEL_13;
        }
        double v23 = v5;
        double v24 = v9;
        if (v15 == 1 || v15 == 4)
        {
          double v25 = @"UIButtonBarMiniBlackOpaqueBackground.png";
          uint64_t v26 = @"UIButtonBarBlackOpaqueBackground.png";
        }
        else
        {
          double v25 = @"UIButtonBarMiniBlackOpaqueBackgroundTop.png";
          uint64_t v26 = @"UIButtonBarBlackOpaqueBackgroundTop.png";
        }
      }
      else
      {
        if (v15 == 1 || v15 == 4)
        {
          double v23 = v5;
          double v24 = v9;
          double v25 = @"UIButtonBarMiniDefaultBackground.png";
        }
        else
        {
          double v23 = v5;
          double v24 = v9;
          double v25 = @"UIButtonBarMiniDefaultBackgroundTop.png";
        }
        uint64_t v26 = @"UIButtonBarDefaultBackground.png";
      }
LABEL_25:
      if (v14 <= 32.0) {
        id v27 = v25;
      }
      else {
        id v27 = v26;
      }
      unint64_t v21 = _UIImageWithName(v27);
      [v21 size];
      double v29 = v28;
      if (v14 <= v28) {
        double v30 = v14;
      }
      else {
        double v30 = v28;
      }
      double v38 = v30;
      double v31 = *MEMORY[0x1E4F1DAD8];
      double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v21 size];
      double v35 = v34;
      if (v19 == 1) {
        double v36 = 0.909803922;
      }
      else {
        double v36 = 1.0;
      }
      double v37 = v38;
      double v39 = v33;
      objc_msgSend(v21, "compositeToRect:fromRect:operation:fraction:", 1, v23, v40, v24, v37, v31, v32, *(void *)&v36);
      if (v14 > v29) {
        objc_msgSend(v21, "compositeToRect:fromRect:operation:fraction:", 1, v23, v40 + v29, v24, v14 - v29, v31, v32 + v35 + -1.0, v39, 1.0, *(void *)&v36);
      }
      goto LABEL_36;
    }
LABEL_13:
    if (v15 == 1 || v15 == 4)
    {
      double v23 = v5;
      double v24 = v9;
      double v25 = @"UIButtonBarMiniBlackTranslucentBackground.png";
      uint64_t v26 = @"UIButtonBarBlackTranslucentBackground.png";
    }
    else
    {
      double v23 = v5;
      double v24 = v9;
      double v25 = @"UIButtonBarMiniBlackTranslucentBackgroundTop.png";
      uint64_t v26 = @"UIButtonBarBlackTranslucentBackgroundTop.png";
    }
    goto LABEL_25;
  }
  BOOL v20 = GetTintedToolbarBackgroundImage((int)v14, v41);
  unint64_t v21 = v20;
  if (v19 == 1) {
    double v22 = 0.909803922;
  }
  else {
    double v22 = 1.0;
  }
  objc_msgSend(v20, "drawInRect:blendMode:alpha:", 0, v5, v7, v9, v14, v22);
LABEL_36:
}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  unint64_t v4 = a3 - 3;
  int v5 = _UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2);
  double v6 = [(UIView *)self->super._toolbar _screen];
  [v6 bounds];
  if (v4 >= 2) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  if (v5) {
    double v10 = 32.0;
  }
  else {
    double v10 = 44.0;
  }

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.CGFloat width = v11;
  return result;
}

- (double)_edgeMarginForBorderedItem:(BOOL)a3 isText:(BOOL)a4
{
  toolbar = self->super._toolbar;
  if (a4) {
    [(UIView *)toolbar _textButtonMargin];
  }
  else {
    [(UIView *)toolbar _imageButtonMargin];
  }
  return result;
}

- (BOOL)toolbarIsSmall
{
  int v3 = _UIUseMiniHeightInLandscape(1u);
  if (v3)
  {
    [(UIView *)self->super._toolbar bounds];
    LOBYTE(v3) = v4 < 44.0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end