@interface UIKBRenderFactoryEmoji_iPad_Split
- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3;
- (CGPoint)emojiInternationalKeyOffset;
- (CGPoint)emojiPopupTextOffset;
- (double)emojiInternationalKeySize;
- (double)keyCornerRadius;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)messagesWriteboardKeyImageName;
- (int64_t)assetIdiom;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
@end

@implementation UIKBRenderFactoryEmoji_iPad_Split

- (int64_t)assetIdiom
{
  return 1;
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return [a3 displayType] == 37;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (CGPoint)emojiPopupTextOffset
{
  double v2 = -0.5;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (double)emojiInternationalKeySize
{
  return 15.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2 = -0.5;
  double v3 = 5.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v100 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[UIKBTextStyle styleWithFontName:a6 withFontSize:22.0];
  [v100 setSymbolStyle:v12];

  v13 = [v11 renderConfig];

  int v14 = [v13 lightKeyboard];
  v15 = UIKBColorBlack;
  if (!v14) {
    v15 = UIKBColorWhite;
  }
  v16 = *v15;
  v17 = [v100 symbolStyle];
  [v17 setTextColor:v16];

  [(UIKBRenderFactory *)self translucentGapWidth];
  double v19 = v18;
  if ([v10 displayType] == 13)
  {
    v20 = [(UIKBRenderFactoryEmoji_iPad_Split *)self lightKeycapsFontName];
    [(UIKBRenderFactoryEmoji_iPad_Split *)self emojiInternationalKeySize];
    v21 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v20);
    [v100 setSymbolStyle:v21];

    v22 = [(UIKBRenderFactory *)self renderConfig];
    int v23 = [v22 whiteText];
    v24 = UIKBColorWhite_Alpha85;
    if (!v23) {
      v24 = UIKBEmojiLightControlSymbolColor;
    }
    v25 = *v24;
    v26 = [v100 symbolStyle];
    [v26 setTextColor:v25];

    [(UIKBRenderFactory *)self RivenFactor:1.0];
    double v28 = v27;
    [(UIKBRenderFactory *)self scale];
    if (v29 == 2.0) {
      double v30 = 0.5;
    }
    else {
      double v30 = 0.0;
    }
    v31 = [v100 geometry];
    [v31 paddedFrame];
    double v36 = 5.0 - v19;
    double v37 = -5.0;
    if (v28 > 1.0) {
      double v37 = -6.0;
    }
    double v38 = v32 - v19;
    double v39 = v34 - (v30 - v19);
    double v40 = v36 + v33;
    double v41 = v35 - (v36 + v37);
    v42 = [v100 geometry];
    objc_msgSend(v42, "setPaddedFrame:", v38, v40, v39, v41);

    v43 = [v100 geometry];
    [v43 paddedFrame];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [v100 geometry];
    objc_msgSend(v52, "setDisplayFrame:", v45, v47, v49, v51);

    [(UIKBRenderFactory *)self scale];
    if (v53 == 2.0) {
      double v54 = -0.5;
    }
    else {
      double v54 = -1.0;
    }
    if (v53 == 2.0) {
      double v55 = 5.5;
    }
    else {
      double v55 = 6.0;
    }
    v56 = [v100 symbolStyle];
    objc_msgSend(v56, "setTextOffset:", v54, v55);
    uint64_t v57 = 1;
    goto LABEL_23;
  }
  if ([v10 displayType] == 5)
  {
    [(UIKBRenderFactory *)self RivenFactor:1.0];
    if (v58 <= 1.0) {
      double v59 = -5.0;
    }
    else {
      double v59 = -6.0;
    }
    v60 = [v100 geometry];
    [v60 paddedFrame];
    double v62 = v61;
    double v64 = v63 + 0.0;
    double v66 = v65 + 0.0;
    double v68 = v67 - v59;
    v69 = [v100 geometry];
    objc_msgSend(v69, "setPaddedFrame:", v64, v66, v62, v68);

    v70 = [v100 geometry];
    [v70 paddedFrame];
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    v79 = [v100 geometry];
    objc_msgSend(v79, "setDisplayFrame:", v72, v74, v76, v78);

    v80 = [v100 symbolStyle];
    [v80 setUsesSymbolImage:1];

    [(UIKBRenderFactoryEmoji_iPad_Split *)self symbolImageControlKeyFontSize];
    double v82 = v81;
    v83 = [v100 symbolStyle];
    [v83 setFontSizeForSymbolImage:v82];

    double v84 = *(double *)off_1E52D6BE8;
    v85 = [v100 symbolStyle];
    [v85 setFontWeightForSymbolImage:v84];

    v56 = [v100 symbolStyle];
    objc_msgSend(v56, "setTextOffset:", 0.0, 5.0);
    uint64_t v57 = 3;
LABEL_23:

    goto LABEL_25;
  }
  uint64_t v57 = 0;
LABEL_25:
  v86 = [(UIKBRenderFactory_Emoji *)self defaultKeyBackgroundColorName];
  v87 = +[UIKBGradient gradientWithFlatColor:v86];
  [v100 setBackgroundGradient:v87];

  v88 = [v100 geometry];
  [v88 paddedFrame];
  double v90 = v19 + v89;
  double v92 = v91 - (v19 + 0.0);
  double v94 = v19 + v93;
  double v96 = v95 - (v19 + 0.0);
  v97 = [v100 geometry];
  objc_msgSend(v97, "setPaddedFrame:", v90, v94, v92, v96);

  v98 = [(UIKBRenderFactory_Emoji *)self _emojiBorderColor];
  v99 = +[UIKBEdgeEffect effectWithColor:v98 edges:v57 inset:-v19 weight:v19];
  [v100 addRenderEffect:v99];

  [(UIKBRenderFactory *)self modifyTraitsForDetachedInputSwitcher:v100 withKey:v10];
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)UIKBRenderFactoryEmoji_iPad_Split;
  id v3 = a3;
  v4 = [(UIKBRenderFactory_Emoji *)&v21 backgroundTraitsForKeyplane:v3];
  v5 = objc_msgSend(v4, "geometry", v21.receiver, v21.super_class);
  [v5 setRoundRectCorners:-1];

  v6 = (void *)MEMORY[0x1E4F29238];
  [v3 frameForKeylayoutName:@"split-left"];
  v7 = objc_msgSend(v6, "valueWithCGRect:");
  v8 = [v4 geometry];
  [v8 setSplitLeftRect:v7];

  v9 = (void *)MEMORY[0x1E4F29238];
  [v3 frameForKeylayoutName:@"split-right"];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = objc_msgSend(v9, "valueWithCGRect:", v11, v13, v15, v17);
  double v19 = [v4 geometry];
  [v19 setSplitRightRect:v18];

  return v4;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v285 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v283.receiver = self;
  v283.super_class = (Class)UIKBRenderFactoryEmoji_iPad_Split;
  v8 = [(UIKBRenderFactory *)&v283 _traitsForKey:v6 onKeyplane:v7];
  if (([v6 state] & 0x10) != 0
    && ([v6 displayType] == 13 || objc_msgSend(v6, "displayType") == 5))
  {
    v9 = [(UIKBRenderFactory *)self renderingContext];
    double v10 = [(UIKBRenderFactoryEmoji_iPad_Split *)self lightKeycapsFontName];
    [(UIKBRenderFactoryEmoji_iPad_Split *)self _customizeTraits:v8 forPopupForKey:v6 withRenderingContext:v9 keycapsFontName:v10];

    goto LABEL_25;
  }
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v12 = v11;
  double v13 = [v8 geometry];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [v8 geometry];
  objc_msgSend(v22, "setDisplayFrame:", v15, v17, v19, v21);

  int v23 = [v8 geometry];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v32 = [v8 geometry];
  objc_msgSend(v32, "setPaddedFrame:", v25, v27, v29, v31);

  [(UIKBRenderFactoryEmoji_iPad_Split *)self symbolImageControlKeyFontSize];
  double v34 = v33;
  if ([v6 displayType] != 37 && objc_msgSend(v6, "displayType") != 36)
  {
    v104 = [v6 name];
    int v105 = [v104 isEqualToString:@"EmojiPopupKey"];

    if (v105)
    {
      uint64_t v106 = [v7 visualStyling];
      BOOL v107 = [(UIKBRenderFactory *)self lightweightFactory];
      v108 = [(UIKBRenderFactory *)self renderingContext];
      unint64_t v109 = v106 & 0xFFFFFFFFFF00FFFFLL;
      if (v107) {
        +[UIKBRenderFactory lightweightFactoryForVisualStyle:v109 renderingContext:v108];
      }
      else {
      v97 = +[UIKBRenderFactory factoryForVisualStyle:v109 renderingContext:v108];
      }

      [(UIKBRenderFactory *)self scale];
      objc_msgSend(v97, "setScale:");
      v167 = [v97 traitsForKey:v6 onKeyplane:v7];

      v168 = [v167 geometry];
      [v168 frame];
      double v170 = v169 + 0.0;
      double v172 = v171 + -1.0;
      double v174 = v173 + 0.0;
      double v176 = v175 + -2.0;
      v177 = [v167 geometry];
      objc_msgSend(v177, "setPaddedFrame:", v170, v174, v172, v176);

      v178 = [v167 geometry];
      [v178 frame];
      double v180 = v179 + -2.0;
      double v182 = v181 + 4.0;
      double v184 = v183 + -2.0;
      double v186 = v185 + 4.0;
      v187 = [v167 geometry];
      objc_msgSend(v187, "setSymbolFrame:", v180, v184, v182, v186);

      int IsStickerPickerService = _UIApplicationIsStickerPickerService();
      double v189 = 32.0;
      if (IsStickerPickerService) {
        double v189 = 38.0;
      }
      v190 = +[UIKBTextStyle styleWithFontName:@"AppleColorEmoji" withFontSize:v189];
      [v190 setTextColor:@"UIKBColorBlack"];
      [(UIKBRenderFactoryEmoji_iPad_Split *)self emojiPopupTextOffset];
      objc_msgSend(v190, "setTextOffset:");
      [v167 setSymbolStyle:v190];
      v191 = [(UIKBRenderFactory_Emoji *)self controlKeyBackgroundColorName];
      v192 = +[UIKBGradient gradientWithFlatColor:v191];
      [v167 setLayeredBackgroundGradient:v192];

      [v167 removeAllRenderEffects];
      v193 = [v167 variantTraits];

      if (v193)
      {
        v194 = (void *)[v190 copy];
        objc_msgSend(v194, "setTextOffset:", 0.5, 2.0);
        v195 = [v167 variantTraits];
        v278 = v194;
        [v195 setSymbolStyle:v194];

        [(UIKBRenderFactory *)self scale];
        double v197 = 1.0 / v196;
        v198 = [v167 variantTraits];
        v199 = [v198 symbolStyle];
        [v199 setPathWeight:v197];

        v200 = [(UIKBRenderFactory_Emoji *)self _emojiSkinToneDividerColor];
        v201 = [v167 variantTraits];
        v202 = [v201 symbolStyle];
        [v202 setTextColor:v200];

        long long v281 = 0u;
        long long v282 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        v203 = [v167 variantGeometries];
        uint64_t v204 = [v203 countByEnumeratingWithState:&v279 objects:v284 count:16];
        if (v204)
        {
          uint64_t v205 = v204;
          uint64_t v206 = *(void *)v280;
          do
          {
            for (uint64_t i = 0; i != v205; ++i)
            {
              if (*(void *)v280 != v206) {
                objc_enumerationMutation(v203);
              }
              v208 = *(void **)(*((void *)&v279 + 1) + 8 * i);
              [v208 symbolFrame];
              objc_msgSend(v208, "setSymbolFrame:", v209 + 0.0, v210 + 0.0);
              [v208 paddedFrame];
              objc_msgSend(v208, "setPaddedFrame:", v211 + 2.0, v213 + 2.0, v212 + -4.0, v214 + -4.0);
            }
            uint64_t v205 = [v203 countByEnumeratingWithState:&v279 objects:v284 count:16];
          }
          while (v205);
        }
      }
      v8 = v167;
      goto LABEL_23;
    }
    v110 = [(UIKBRenderFactory *)self renderConfig];
    int v111 = [v110 whiteText];
    v112 = UIKBColorWhite;
    if (!v111) {
      v112 = UIKBColorBlack;
    }
    v113 = +[UIKBTextStyle styleWithTextColor:*v112];
    [v8 setSymbolStyle:v113];

    v114 = [v8 symbolStyle];
    [v114 setUsesSymbolImage:1];

    if (([v6 state] & 0x10) == 0 && objc_msgSend(v6, "displayType") == 13)
    {
      v115 = [v8 geometry];
      [v115 paddedFrame];
      double v117 = v116 + 0.0;
      double v119 = v118 - (1.0 - v12);
      double v121 = v120 + 5.0;
      double v123 = v122 + -5.0;
      v124 = [v8 geometry];
      objc_msgSend(v124, "setPaddedFrame:", v117, v121, v119, v123);

      v125 = [v8 geometry];
      [v125 paddedFrame];
      double v127 = v126;
      double v129 = v128 + 0.0;
      double v131 = v130 - v12;
      double v133 = v132 - (0.0 - v12);
      v134 = [v8 geometry];
      objc_msgSend(v134, "setDisplayFrame:", v129, v131, v127, v133);

      v135 = [(UIKBRenderFactoryEmoji_iPad_Split *)self lightKeycapsFontName];
      [(UIKBRenderFactoryEmoji_iPad_Split *)self emojiInternationalKeySize];
      v136 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v135);
      [v8 setSymbolStyle:v136];

      v137 = [(UIKBRenderFactory *)self renderConfig];
      int v138 = [v137 whiteText];
      v139 = UIKBColorWhite_Alpha85;
      if (!v138) {
        v139 = UIKBEmojiLightControlSymbolColor;
      }
      v140 = *v139;
      v141 = [v8 symbolStyle];
      [v141 setTextColor:v140];

      [(UIKBRenderFactoryEmoji_iPad_Split *)self emojiInternationalKeyOffset];
      double v143 = v142;
      double v145 = v144;
      v146 = [v8 symbolStyle];
      objc_msgSend(v146, "setTextOffset:", v143, v145);
      uint64_t v147 = 1;
      goto LABEL_77;
    }
    if ([v6 displayType] == 3)
    {
      v148 = [(UIKBRenderFactoryEmoji_iPad_Split *)self lightKeycapsFontName];
      v149 = [v8 symbolStyle];
      [v149 setFontName:v148];

      v150 = [v8 symbolStyle];
      [v150 setFontSize:14.0];

      v151 = [v8 symbolStyle];
      [v151 textOffset];
      double v153 = v152;
      v154 = [v8 symbolStyle];
      [v154 textOffset];
      double v156 = v155 - (2.0 - v12);
      v157 = [v8 symbolStyle];
      objc_msgSend(v157, "setTextOffset:", v153, v156);

      v146 = [v8 geometry];
      [v146 paddedFrame];
      double v159 = v158;
      double v161 = v12 + v160;
      double v163 = v162 - (v12 + 0.0);
      double v165 = v164 + 0.0;
      v166 = [v8 geometry];
      objc_msgSend(v166, "setPaddedFrame:", v161, v165, v163, v159);

      uint64_t v147 = 2;
      goto LABEL_77;
    }
    if ((([v6 state] & 0x10) != 0 || objc_msgSend(v6, "displayType") != 5)
      && [v6 displayType] != 25
      && [v6 displayType] != 21)
    {
      v146 = [v6 displayString];
      if (![v146 length])
      {
        int v254 = [v6 interactionType];

        if (v254)
        {
          uint64_t v147 = 0;
          goto LABEL_78;
        }
        [(UIKBRenderFactory *)self scale];
        if (v255 == 2.0) {
          double v256 = -4.5;
        }
        else {
          double v256 = -4.0;
        }
        [(UIKBRenderFactory *)self scale];
        if (v257 == 2.0) {
          double v258 = 0.5;
        }
        else {
          double v258 = 0.0;
        }
        v259 = [v8 geometry];
        [v259 paddedFrame];
        double v261 = v260 + 0.0;
        double v263 = v262 - v258;
        double v265 = v264 + 0.0;
        double v267 = v266 - v256;
        v268 = [v8 geometry];
        objc_msgSend(v268, "setPaddedFrame:", v261, v265, v263, v267);

        v146 = [v8 geometry];
        [v146 paddedFrame];
        double v270 = v269;
        double v272 = v271;
        double v274 = v273;
        double v276 = v275;
        v277 = [v8 geometry];
        objc_msgSend(v277, "setDisplayFrame:", v270, v272, v274, v276);
      }
      uint64_t v147 = 0;
LABEL_77:

LABEL_78:
      if (([v6 state] & 4) != 0) {
        [(UIKBRenderFactory_Emoji *)self _emojiDefaultControlKeyActiveBackgroundColorGradient];
      }
      else {
      v249 = [(UIKBRenderFactory_Emoji *)self _emojiDefaultControlKeyBackgroundColorGradient];
      }
      [v8 setBackgroundGradient:v249];

      v250 = [(UIKBRenderFactory *)self renderConfig];
      int v251 = [v250 whiteText];

      if (v251)
      {
        v252 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha5"];
        [v8 setLayeredBackgroundGradient:v252];
      }
      v97 = [(UIKBRenderFactory_Emoji *)self _emojiBorderColor];
      v253 = +[UIKBEdgeEffect effectWithColor:v97 edges:v147 inset:-v12 weight:v12];
      [v8 addRenderEffect:v253];

      goto LABEL_23;
    }
    if (([v6 state] & 0x10) != 0 || objc_msgSend(v6, "displayType") != 5)
    {
      v222 = [(UIKBRenderFactory *)self lightTextFontName];
      v223 = [v8 symbolStyle];
      [v223 setFontName:v222];

      v224 = [v8 symbolStyle];
      [v224 setFontSize:14.0];

      if ([v6 displayType] == 21)
      {
        [(UIKBRenderFactory *)self scale];
        if (v225 == 2.0) {
          double v226 = 0.5;
        }
        else {
          double v226 = *MEMORY[0x1E4F1DAD8];
        }
        if (v225 == 2.0) {
          double v227 = 0.0;
        }
        else {
          double v227 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        }
        v228 = [v8 symbolStyle];
        objc_msgSend(v228, "setTextOffset:", v226, v227);
      }
      if ([v6 displayType] != 21) {
        goto LABEL_76;
      }
      [(UIKBRenderFactory *)self RivenFactor:1.0];
      if (v229 <= 1.0) {
        goto LABEL_76;
      }
      [(UIKBRenderFactory *)self stretchFactor];
      if (v230 == 1.0) {
        double v231 = 1.0;
      }
      else {
        double v231 = -v12;
      }
      v215 = [v8 geometry];
      [v215 paddedFrame];
      double v233 = v232;
      double v235 = v234 + 0.0;
      double v237 = v231 + v236;
      double v239 = v238 - (v231 + 0.0);
      v218 = [v8 geometry];
      objc_msgSend(v218, "setPaddedFrame:", v235, v237, v233, v239);
    }
    else
    {
      v215 = [v8 symbolStyle];
      [v215 textOffset];
      double v217 = v216;
      v218 = [v8 symbolStyle];
      [v218 textOffset];
      double v220 = v219 + 5.0;
      v221 = [v8 symbolStyle];
      objc_msgSend(v221, "setTextOffset:", v217, v220);
    }
LABEL_76:
    v146 = [v8 geometry];
    [v146 paddedFrame];
    double v241 = v12 + v240;
    double v243 = v242 - (v12 + 0.0);
    double v245 = v12 + v244;
    double v247 = v246 - (v12 + 0.0);
    v248 = [v8 geometry];
    objc_msgSend(v248, "setPaddedFrame:", v241, v245, v243, v247);

    uint64_t v147 = 3;
    goto LABEL_77;
  }
  if ([v6 displayType] == 37)
  {
    [(UIKBRenderFactory *)self RivenFactor:1.0];
    double v36 = v35;
    double v37 = [v8 geometry];
    [v37 paddedFrame];
    double v42 = 8.0;
    if (v36 > 1.0) {
      double v42 = 9.0;
    }
    double v43 = -5.0;
    if (v36 > 1.0) {
      double v43 = -6.0;
    }
    double v44 = 10.0;
    if (v36 > 1.0) {
      double v44 = 12.0;
    }
    double v45 = v40 + v42;
    double v46 = v39 + v43;
    double v47 = v41 + v44;
    double v48 = v38 + -3.0;
    double v49 = [v8 geometry];
    objc_msgSend(v49, "setPaddedFrame:", v48, v46, v45, v47);

    double v50 = [v8 geometry];
    [v50 paddedFrame];
    double v52 = v51;
    double v54 = v53 + -1.0;
    double v56 = v55 + 1.0;
    double v58 = v57 + 0.0;
    double v59 = [v8 geometry];
    objc_msgSend(v59, "setDisplayFrame:", v54, v58, v56, v52);

    v60 = [(UIKBRenderFactory_Emoji *)self _emojiBorderColor];
    double v61 = +[UIKBEdgeEffect effectWithColor:v60 edges:2 inset:v12 + -1.0 weight:v12];
    [v8 addRenderEffect:v61];
LABEL_21:

    goto LABEL_22;
  }
  if ([v6 displayType] == 36)
  {
    [(UIKBRenderFactory *)self RivenFactor:1.0];
    double v63 = v62;
    double v64 = [v8 geometry];
    [v64 paddedFrame];
    double v69 = -5.0;
    if (v63 > 1.0) {
      double v69 = -6.0;
    }
    double v70 = 8.0;
    double v71 = 10.0;
    if (v63 > 1.0)
    {
      double v70 = 10.0;
      double v71 = 12.0;
    }
    double v72 = v65 + v69;
    double v73 = v67 + v70;
    double v74 = v66 + v69;
    double v75 = v68 + v71;
    double v76 = [v8 geometry];
    objc_msgSend(v76, "setPaddedFrame:", v72, v74, v73, v75);

    v60 = [v8 geometry];
    [v60 paddedFrame];
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;
    double v61 = [v8 geometry];
    objc_msgSend(v61, "setDisplayFrame:", v78, v80, v82, v84);
    goto LABEL_21;
  }
LABEL_22:
  v85 = [v8 geometry];
  [v85 paddedFrame];
  double v87 = v86;
  double v89 = v88;
  double v91 = v90;
  double v93 = v92;
  double v94 = [v8 geometry];
  objc_msgSend(v94, "setFrame:", v87, v89, v91, v93);

  uint64_t v95 = [v6 clipCorners];
  double v96 = [v8 geometry];
  [v96 setRoundRectCorners:v95];

  v97 = [v8 geometry];
  [v97 setRoundRectRadius:10.0];
LABEL_23:

  v98 = [v8 symbolStyle];
  int v99 = [v98 usesSymbolImage];

  if (!v99) {
    goto LABEL_26;
  }
  double v100 = *(double *)off_1E52D6BE8;
  v101 = [v8 symbolStyle];
  [v101 setFontSizeForSymbolImage:v34];

  v9 = [v8 symbolStyle];
  [v9 setFontWeightForSymbolImage:v100];
LABEL_25:

LABEL_26:
  id v102 = v8;

  return v102;
}

@end