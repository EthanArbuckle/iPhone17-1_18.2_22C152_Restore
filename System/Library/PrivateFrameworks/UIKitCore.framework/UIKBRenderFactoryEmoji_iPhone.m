@interface UIKBRenderFactoryEmoji_iPhone
- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3;
- (CGPoint)emojiInternationalKeyOffset;
- (CGPoint)emojiPopupTextOffset;
- (double)emojiCategoryControlIconSize;
- (double)emojiInternationalKeySize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7;
- (int64_t)assetIdiom;
@end

@implementation UIKBRenderFactoryEmoji_iPhone

- (int64_t)assetIdiom
{
  return 0;
}

- (CGPoint)emojiPopupTextOffset
{
  double v2 = 0.0;
  double v3 = -4.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)emojiInternationalKeySize
{
  return 14.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2 = 2.5;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (double)emojiCategoryControlIconSize
{
  return 28.0;
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] == 37 || objc_msgSend(v3, "displayType") == 55)
  {
    char v4 = 1;
  }
  else
  {
    v5 = [v3 name];
    char v4 = [v5 isEqual:@"EmojiPopupKey"];
  }
  return v4;
}

- (id)traitsHashStringForKey:(id)a3 withGeometry:(id)a4 withSymbolStyle:(id)a5 controlOpacities:(BOOL)a6 blurBlending:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v12 displayType] == 37
    || [v12 displayType] == 55
    || [v12 displayType] == 36)
  {
    v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIKBRenderFactoryEmoji_iPhone;
    v15 = [(UIKBRenderFactory *)&v17 traitsHashStringForKey:v12 withGeometry:v13 withSymbolStyle:v14 controlOpacities:v8 blurBlending:v7];
  }

  return v15;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v186.receiver = self;
  v186.super_class = (Class)UIKBRenderFactoryEmoji_iPhone;
  BOOL v8 = [(UIKBRenderFactory *)&v186 _traitsForKey:v6 onKeyplane:v7];
  if (([v6 state] & 0x10) != 0
    && ([v6 displayType] == 13 || objc_msgSend(v6, "displayType") == 5))
  {
    v9 = [(UIKBRenderFactory *)self renderingContext];
    v10 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    [(UIKBRenderFactory *)self _customizeTraits:v8 forPopupForKey:v6 withRenderingContext:v9 keycapsFontName:v10];
LABEL_5:

    goto LABEL_24;
  }
  v11 = [v8 geometry];
  [v11 paddedFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v8 geometry];
  objc_msgSend(v20, "setDisplayFrame:", v13, v15, v17, v19);

  [(UIKBRenderFactory *)self translucentGapWidth];
  double v22 = v21;
  if ([v6 displayType] == 13)
  {
    v23 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    [(UIKBRenderFactoryEmoji_iPhone *)self emojiInternationalKeySize];
    v24 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v23);
    [v8 setSymbolStyle:v24];

    v25 = [v8 symbolStyle];
    [v25 setUsesSymbolImage:1];

    [(UIKBRenderFactoryEmoji_iPhone *)self symbolImageControlKeyFontSize];
    double v27 = v26;
    v28 = [v8 symbolStyle];
    [v28 setFontSizeForSymbolImage:v27];

    double v29 = *(double *)off_1E52D6BE8;
    v30 = [v8 symbolStyle];
    [v30 setFontWeight:v29];

    [(UIKBRenderFactoryEmoji_iPhone *)self emojiInternationalKeyOffset];
    double v32 = v31;
    double v34 = v33;
    v35 = [v8 symbolStyle];
    objc_msgSend(v35, "setTextOffset:", v32, v34);

    v36 = [(UIKBRenderFactory *)self renderConfig];
    LODWORD(v35) = [v36 whiteText];

    char v37 = [v6 state];
    if (v35)
    {
      v38 = UIKBColorWhite;
      v39 = UIKBColorWhite_Alpha85;
    }
    else
    {
      v38 = UIKBEmojiLightControlSymbolActiveColor;
      v39 = UIKBColorBlack_Alpha90;
    }
    if ((v37 & 4) == 0) {
      v38 = v39;
    }
    v52 = *v38;
    v9 = [v8 symbolStyle];
    [v9 setTextColor:v52];
  }
  else if ([v6 displayType] == 3)
  {
    v40 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    v41 = +[UIKBTextStyle styleWithFontName:v40 withFontSize:15.0];
    [v8 setSymbolStyle:v41];

    v42 = [v8 symbolStyle];
    [v42 setUsesSymbolImage:1];

    [(UIKBRenderFactoryEmoji_iPhone *)self symbolImageControlKeyFontSize];
    double v44 = v43;
    v45 = [v8 symbolStyle];
    [v45 setFontSizeForSymbolImage:v44];

    double v46 = *(double *)off_1E52D6BE8;
    v47 = [v8 symbolStyle];
    [v47 setFontWeight:v46];

    v48 = [(UIKBRenderFactory *)self renderConfig];
    LODWORD(v40) = [v48 whiteText];

    char v49 = [v6 state];
    if (v40)
    {
      v50 = UIKBColorWhite;
      v51 = UIKBColorWhite_Alpha85;
    }
    else
    {
      v50 = UIKBEmojiLightControlSymbolActiveColor;
      v51 = UIKBColorBlack_Alpha90;
    }
    if ((v49 & 4) == 0) {
      v50 = v51;
    }
    v58 = *v50;
    v59 = [v8 symbolStyle];
    [v59 setTextColor:v58];

    v9 = [(UIKBRenderFactory_Emoji *)self _emojiBorderColor];
    v60 = +[UIKBEdgeEffect effectWithColor:v9 edges:3 inset:-v22 weight:v22];
    [v8 addRenderEffect:v60];
  }
  else
  {
    if ([v6 displayType] == 25)
    {
      v53 = [(UIKBRenderFactory *)self lightTextFontName];
      v54 = +[UIKBTextStyle styleWithFontName:v53 withFontSize:13.0];
      [v8 setSymbolStyle:v54];

      v9 = [(UIKBRenderFactory *)self renderConfig];
      int v55 = [v9 whiteText];
      v56 = UIKBColorWhite;
      if (!v55) {
        v56 = UIKBColorBlack;
      }
      v57 = *v56;
      v10 = [v8 symbolStyle];
      [v10 setTextColor:v57];
      goto LABEL_5;
    }
    if ([v6 displayType] == 37)
    {
      id v176 = v7;
      v63 = [v8 geometry];
      [v63 setPopupBias:2];

      v64 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      [(UIKBRenderFactoryEmoji_iPhone *)self emojiCategoryControlIconSize];
      v65 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v64);
      [v8 setSymbolStyle:v65];

      BOOL v66 = [(UIKBRenderFactory *)self increasedContrastEnabled];
      v67 = UIKBColorBlack_Alpha65;
      if (!v66) {
        v67 = UIKBColorBlack_Alpha50;
      }
      v68 = *v67;
      v69 = [(UIKBRenderFactory *)self renderConfig];
      if ([v69 lightKeyboard]) {
        v70 = v68;
      }
      else {
        v70 = @"UIKBColorWhite_Alpha25";
      }
      v71 = [v8 symbolStyle];
      [v71 setTextColor:v70];

      v72 = +[UIKeyboardEmojiCategory enabledCategoryIndexes];
      unint64_t v73 = [v72 count];

      v74 = [MEMORY[0x1E4F1CA48] array];
      v75 = [v8 geometry];
      [v75 paddedFrame];
      double v77 = v76;

      if (v73)
      {
        unint64_t v78 = 0;
        double v79 = v77 / (double)v73;
        do
        {
          v80 = [v8 geometry];
          [v80 paddedFrame];
          double v82 = v79 * (double)v78 + v81;
          v83 = [v8 geometry];
          [v83 paddedFrame];
          double v85 = v84;
          v86 = [v8 geometry];
          [v86 paddedFrame];
          double v88 = v87;

          v89 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v82, v85, v79, v88, v82, v85, v79, v88);
          objc_msgSend(v89, "setDisplayFrame:", v82, v85, v79, v88);
          [v89 displayFrame];
          objc_msgSend(v89, "setSymbolFrame:");
          [v74 addObject:v89];

          ++v78;
        }
        while (v73 != v78);
      }
      v90 = v74;
      if (+[UIKeyboardEmojiCategory isRTLMode])
      {
        v91 = +[UIKBRenderGeometry sortedGeometries:v74 leftToRight:0];
        [v8 setVariantGeometries:v91];
      }
      else
      {
        [v8 setVariantGeometries:v74];
      }
      v9 = v68;
      v101 = +[UIKBRenderTraits emptyTraits];
      v102 = [v8 symbolStyle];
      v103 = (void *)[v102 copy];
      [v101 setSymbolStyle:v103];

      v175 = v101;
      [v8 setVariantTraits:v101];
      v104 = +[UIKBRenderTraits emptyTraits];
      v105 = [v8 symbolStyle];
      v106 = (void *)[v105 copy];
      [v104 setSymbolStyle:v106];

      v107 = [(UIKBRenderFactory *)self renderConfig];
      if ([v107 lightKeyboard]) {
        v108 = v68;
      }
      else {
        v108 = @"UIKBColorWhite_Alpha25";
      }
      v109 = [v104 symbolStyle];
      [v109 setTextColor:v108];

      [v8 setHighlightedVariantTraits:v104];
      v110 = [(UIKBRenderFactory *)self renderConfig];
      if ([v110 lightKeyboard]) {
        uint64_t v111 = 0;
      }
      else {
        uint64_t v111 = 5;
      }
      [v8 setBlendForm:v111];

      if (_UIApplicationIsFirstPartyStickers())
      {
        v112 = [(UIKBRenderFactory_Emoji *)self _emojiBorderColor];
        v113 = +[UIKBEdgeEffect effectWithColor:v112 edges:1 inset:v22 weight:v22];
        [v8 addRenderEffect:v113];

        v114 = [v8 geometry];
        [v114 paddedFrame];
        CGRect v192 = CGRectInset(v191, -15.0, 0.0);
        double x = v192.origin.x;
        double y = v192.origin.y;
        double width = v192.size.width;
        double height = v192.size.height;

        v119 = [v8 geometry];
        objc_msgSend(v119, "setPaddedFrame:", x, y, width, height);

        v120 = [v8 geometry];
        objc_msgSend(v120, "setDisplayFrame:", x, y, width, height);
      }
      id v7 = v176;
    }
    else if ([v6 displayType] == 55)
    {
      v92 = [(UIKBRenderFactory *)self lightKeycapsFontName];
      v93 = +[UIKBTextStyle styleWithFontName:v92 withFontSize:21.0];
      [v8 setSymbolStyle:v93];

      v94 = [v8 symbolStyle];
      [v94 setUsesSymbolImage:1];

      v95 = [(UIKBRenderFactory *)self renderConfig];
      int v96 = [v95 lightKeyboard];
      v97 = UIKBColorBlack_Alpha95;
      if (!v96) {
        v97 = UIKBColorWhite_Alpha87;
      }
      v98 = *v97;
      v99 = [v8 symbolStyle];
      [v99 setTextColor:v98];

      v9 = [(UIKBRenderFactory *)self renderConfig];
      if ([v9 lightKeyboard]) {
        uint64_t v100 = 0;
      }
      else {
        uint64_t v100 = 5;
      }
      [v8 setBlendForm:v100];
    }
    else
    {
      v121 = [v6 name];
      int v122 = [v121 isEqualToString:@"EmojiPopupKey"];

      if (v122)
      {
        uint64_t v123 = [v7 visualStyling];
        BOOL v124 = [(UIKBRenderFactory *)self lightweightFactory];
        v125 = [(UIKBRenderFactory *)self renderingContext];
        unint64_t v126 = v123 & 0xFFFFFFFFFF00FFFFLL;
        if (v124) {
          +[UIKBRenderFactory lightweightFactoryForVisualStyle:v126 renderingContext:v125];
        }
        else {
        v9 = +[UIKBRenderFactory factoryForVisualStyle:v126 renderingContext:v125 skipLayoutSegments:1];
        }

        [(UIKBRenderFactory *)self scale];
        objc_msgSend(v9, "setScale:");
        [(UIKBRenderFactory *)self stretchFactor];
        objc_msgSend(v9, "setStretchFactor:");
        objc_msgSend(v9, "setAllowsPaddles:", -[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v6));
        v132 = [v9 traitsForKey:v6 onKeyplane:v7];

        id v177 = v7;
        if (_UIApplicationIsStickerPickerService())
        {
          [v132 renderEffects];
          long long v182 = 0u;
          long long v183 = 0u;
          long long v184 = 0u;
          long long v185 = 0u;
          id v133 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v134 = [v133 countByEnumeratingWithState:&v182 objects:v188 count:16];
          if (v134)
          {
            uint64_t v135 = v134;
            uint64_t v136 = *(void *)v183;
            while (2)
            {
              for (uint64_t i = 0; i != v135; ++i)
              {
                if (*(void *)v183 != v136) {
                  objc_enumerationMutation(v133);
                }
                v138 = *(void **)(*((void *)&v182 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v139 = v138;
                  [v139 insets];
                  if (v140 >= 22.0)
                  {
                    objc_msgSend(v139, "setInsets:");

                    goto LABEL_74;
                  }
                }
              }
              uint64_t v135 = [v133 countByEnumeratingWithState:&v182 objects:v188 count:16];
              if (v135) {
                continue;
              }
              break;
            }
          }
LABEL_74:

          double v141 = 38.0;
          id v7 = v177;
        }
        else
        {
          double v141 = 32.0;
        }
        v142 = +[UIKBTextStyle styleWithFontName:@"AppleColorEmoji" withFontSize:v141];
        [v142 setIgnoreTextMarginOnKey:1];
        [v142 setTextColor:@"UIKBColorBlack"];
        [v132 setSymbolStyle:v142];
        if ([v9 allowsPaddles])
        {
          [(UIKBRenderFactoryEmoji_iPhone *)self emojiPopupTextOffset];
          objc_msgSend(v142, "setTextOffset:");
          [v132 setControlOpacities:0];
        }
        else
        {
          int64_t v143 = [(UIKBRenderFactoryEmoji_iPhone *)self assetIdiom];
          double v144 = 0.0;
          if (v143 != 1)
          {
            int64_t v145 = [(UIKBRenderFactoryEmoji_iPhone *)self assetIdiom];
            double v144 = 0.0;
            if (v145 != 24)
            {
              int64_t v146 = [(UIKBRenderFactoryEmoji_iPhone *)self assetIdiom];
              double v144 = 0.0;
              if (v146 != 25)
              {
                int64_t v147 = [(UIKBRenderFactoryEmoji_iPhone *)self assetIdiom];
                double v144 = 0.0;
                if (v147 != 26)
                {
                  int64_t v148 = [(UIKBRenderFactoryEmoji_iPhone *)self assetIdiom];
                  double v144 = 1.0;
                  if (v148 == 23) {
                    double v144 = 0.0;
                  }
                }
              }
            }
          }
          objc_msgSend(v142, "setTextOffset:", 0.0, v144);
          v149 = [(UIKBRenderFactory_Emoji *)self controlKeyBackgroundColorName];
          v150 = +[UIKBGradient gradientWithFlatColor:v149];
          [v132 setLayeredBackgroundGradient:v150];

          [v132 removeAllRenderEffects];
        }
        v151 = [v132 variantTraits];

        if (v151)
        {
          v152 = (void *)[v142 copy];
          objc_msgSend(v152, "setTextOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          v153 = [v132 variantTraits];
          [v153 setSymbolStyle:v152];

          [(UIKBRenderFactory *)self scale];
          double v155 = 1.0 / v154;
          v156 = [v132 variantTraits];
          v157 = [v156 symbolStyle];
          [v157 setPathWeight:v155];

          v158 = [(UIKBRenderFactory_Emoji *)self _emojiSkinToneDividerColor];
          v159 = [v132 variantTraits];
          v160 = [v159 symbolStyle];
          [v160 setTextColor:v158];

          long long v180 = 0u;
          long long v181 = 0u;
          long long v178 = 0u;
          long long v179 = 0u;
          v161 = [v132 variantGeometries];
          uint64_t v162 = [v161 countByEnumeratingWithState:&v178 objects:v187 count:16];
          if (v162)
          {
            uint64_t v163 = v162;
            uint64_t v164 = *(void *)v179;
            do
            {
              for (uint64_t j = 0; j != v163; ++j)
              {
                if (*(void *)v179 != v164) {
                  objc_enumerationMutation(v161);
                }
                v166 = *(void **)(*((void *)&v178 + 1) + 8 * j);
                [v166 symbolFrame];
                objc_msgSend(v166, "setSymbolFrame:", v167 + -2.0, v169 + -2.0, v168 + 4.0, v170 + 2.0);
                [v166 paddedFrame];
                objc_msgSend(v166, "setPaddedFrame:", v171 + 0.0, v172 + -2.0);
                [v166 displayFrame];
                objc_msgSend(v166, "setDisplayFrame:", v173 + 0.0, v174 + -2.0);
              }
              uint64_t v163 = [v161 countByEnumeratingWithState:&v178 objects:v187 count:16];
            }
            while (v163);
          }

          id v7 = v177;
        }

        BOOL v8 = v132;
      }
      else
      {
        v127 = [v8 symbolStyle];
        [v127 setUsesSymbolImage:1];

        [(UIKBRenderFactoryEmoji_iPhone *)self symbolImageControlKeyFontSize];
        double v129 = v128;
        v130 = [v8 symbolStyle];
        [v130 setFontSizeForSymbolImage:v129];

        double v131 = *(double *)off_1E52D6BE8;
        v9 = [v8 symbolStyle];
        [v9 setFontWeight:v131];
      }
    }
  }
LABEL_24:

  id v61 = v8;
  return v61;
}

@end