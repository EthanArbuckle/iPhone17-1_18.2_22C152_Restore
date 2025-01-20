@interface UIKBRenderFactoryEmoji_iPad
- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3;
- (CGPoint)emojiInternationalKeyOffset;
- (CGPoint)emojiPopupTextOffset;
- (double)emojiInternationalKeySize;
- (double)keyCornerRadius;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)messagesWriteboardKeyImageName;
- (int64_t)assetIdiom;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
@end

@implementation UIKBRenderFactoryEmoji_iPad

- (int64_t)assetIdiom
{
  return 1;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (CGPoint)emojiPopupTextOffset
{
  double v2 = -0.5;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 24.0;
}

- (double)emojiInternationalKeySize
{
  return 18.0;
}

- (CGPoint)emojiInternationalKeyOffset
{
  double v2 = -1.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return [a3 displayType] == 37;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[UIKBTextStyle styleWithFontName:a6 withFontSize:22.0];
  [v24 setSymbolStyle:v12];

  v13 = [v11 renderConfig];

  int v14 = [v13 lightKeyboard];
  v15 = UIKBColorBlack;
  if (!v14) {
    v15 = UIKBColorWhite;
  }
  v16 = *v15;
  v17 = [v24 symbolStyle];
  [v17 setTextColor:v16];

  if ([v10 interactionType] == 9)
  {
    v18 = [v24 symbolStyle];
    objc_msgSend(v18, "setTextOffset:", -1.0, 0.0);

    [(UIKBRenderFactoryEmoji_iPad *)self emojiInternationalKeySize];
    double v20 = v19;
    v21 = [v24 symbolStyle];
    [v21 setFontSize:v20];
  }
  else
  {
    if ([v10 displayType] != 5) {
      goto LABEL_8;
    }
    v21 = [v24 symbolStyle];
    objc_msgSend(v21, "setTextOffset:", 0.0, 2.0);
  }

LABEL_8:
  v22 = [(UIKBRenderFactory_Emoji *)self defaultKeyBackgroundColorName];
  v23 = +[UIKBGradient gradientWithFlatColor:v22];
  [v24 setBackgroundGradient:v23];

  [(UIKBRenderFactory *)self modifyTraitsForDetachedInputSwitcher:v24 withKey:v10];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v120.receiver = self;
  v120.super_class = (Class)UIKBRenderFactoryEmoji_iPad;
  v8 = [(UIKBRenderFactoryEmoji_iPhone *)&v120 _traitsForKey:v6 onKeyplane:v7];
  if (([v6 state] & 0x10) == 0 && objc_msgSend(v6, "displayType") == 5)
  {
    v9 = [v8 geometry];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [v8 geometry];
    objc_msgSend(v18, "setPaddedFrame:", v11, v13, v15, v17);

    double v19 = [v8 geometry];
    [v19 paddedFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [v8 geometry];
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    v29 = [(UIKBRenderFactoryEmoji_iPad *)self lightKeycapsFontName];
    v30 = +[UIKBTextStyle styleWithFontName:v29 withFontSize:40.0];
    [v8 setSymbolStyle:v30];

    v31 = [v8 symbolStyle];
    [v31 setUsesSymbolImage:1];

    [(UIKBRenderFactoryEmoji_iPad *)self symbolImageControlKeyFontSize];
    double v33 = v32;
    v34 = [v8 symbolStyle];
    [v34 setFontSizeForSymbolImage:v33];

    double v35 = *(double *)off_1E52D6BE8;
    v36 = [v8 symbolStyle];
    [v36 setFontWeightForSymbolImage:v35];

    v37 = [v8 symbolStyle];
    [v37 setFontWeight:v35];

    v38 = [v8 symbolStyle];
    [v38 textOffset];
    double v40 = v39;
    v41 = [v8 symbolStyle];
    [v41 textOffset];
    double v43 = v42 + 2.0;
    v44 = [v8 symbolStyle];
    objc_msgSend(v44, "setTextOffset:", v40, v43);

LABEL_8:
    v74 = [(UIKBRenderFactory *)self renderConfig];
    int v75 = [v74 whiteText];

    if (v75)
    {
      v76 = UIKBColorWhite;
    }
    else
    {
      char v77 = [v6 state];
      v76 = UIKBEmojiLightControlSymbolActiveColor;
      if ((v77 & 4) == 0) {
        v76 = UIKBEmojiLightControlSymbolColor;
      }
    }
    v78 = *v76;
    v51 = [v8 symbolStyle];
    [v51 setTextColor:v78];
    goto LABEL_13;
  }
  if ([v6 displayType] == 5)
  {
    v45 = [v8 symbolStyle];
    [v45 setUsesSymbolImage:1];

    [(UIKBRenderFactoryEmoji_iPad *)self symbolImageControlKeyFontSize];
    double v47 = v46;
    v48 = [v8 symbolStyle];
    [v48 setFontSizeForSymbolImage:v47];

    double v49 = *(double *)off_1E52D6BE8;
    v50 = [v8 symbolStyle];
    [v50 setFontWeightForSymbolImage:v49];

    v51 = [v8 symbolStyle];
    [v51 setFontWeight:v49];
LABEL_13:
    v79 = v8;
LABEL_14:

    v8 = v79;
    goto LABEL_15;
  }
  if ([v6 displayType] == 25)
  {
    v52 = [v8 geometry];
    [v52 paddedFrame];
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    v61 = [v8 geometry];
    objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);

    v62 = [v8 geometry];
    [v62 displayFrame];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    v71 = [v8 geometry];
    objc_msgSend(v71, "setSymbolFrame:", v64, v66, v68, v70);

    v72 = [(UIKBRenderFactory *)self lightTextFontName];
    v73 = +[UIKBTextStyle styleWithFontName:v72 withFontSize:18.0];
    [v8 setSymbolStyle:v73];

    goto LABEL_8;
  }
  v81 = [v6 name];
  int v82 = [v81 isEqualToString:@"EmojiPopupKey"];

  if (v82)
  {
    uint64_t v83 = [v7 visualStyling];
    BOOL v84 = [(UIKBRenderFactory *)self lightweightFactory];
    v85 = [(UIKBRenderFactory *)self renderingContext];
    unint64_t v86 = v83 & 0xFFFFFFFFFF00FFFFLL;
    if (v84) {
      +[UIKBRenderFactory lightweightFactoryForVisualStyle:v86 renderingContext:v85];
    }
    else {
    v51 = +[UIKBRenderFactory factoryForVisualStyle:v86 renderingContext:v85];
    }

    [(UIKBRenderFactory *)self scale];
    objc_msgSend(v51, "setScale:");
    [(UIKBRenderFactory *)self stretchFactor];
    objc_msgSend(v51, "setStretchFactor:");
    objc_msgSend(v51, "setAllowsPaddles:", -[UIKBRenderFactory allowsPaddleForKey:](self, "allowsPaddleForKey:", v6));
    v79 = [v51 traitsForKey:v6 onKeyplane:v7];

    v87 = +[UIKBTextStyle styleWithFontName:@"AppleColorEmoji" withFontSize:48.0];
    [v87 setTextColor:@"UIKBColorBlack"];
    [(UIKBRenderFactoryEmoji_iPad *)self emojiPopupTextOffset];
    objc_msgSend(v87, "setTextOffset:");
    [v79 setSymbolStyle:v87];
    v88 = [(UIKBRenderFactory_Emoji *)self controlKeyBackgroundColorName];
    v89 = +[UIKBGradient gradientWithFlatColor:v88];
    [v79 setLayeredBackgroundGradient:v89];

    [v79 removeAllRenderEffects];
    v90 = [v79 variantTraits];

    if (v90)
    {
      v91 = (void *)[v87 copy];
      objc_msgSend(v91, "setTextOffset:", 0.0, 2.0);
      v92 = [v79 variantTraits];
      v115 = v91;
      [v92 setSymbolStyle:v91];

      [(UIKBRenderFactory *)self scale];
      double v94 = 1.0 / v93;
      v95 = [v79 variantTraits];
      v96 = [v95 symbolStyle];
      [v96 setPathWeight:v94];

      v97 = [(UIKBRenderFactory_Emoji *)self _emojiSkinToneDividerColor];
      v98 = [v79 variantTraits];
      v99 = [v98 symbolStyle];
      [v99 setTextColor:v97];

      v100 = [(UIKBRenderFactory_Emoji *)self controlKeyBackgroundColorName];
      v101 = +[UIKBGradient gradientWithFlatColor:v100];
      [v79 setLayeredBackgroundGradient:v101];

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      v102 = [v79 variantGeometries];
      uint64_t v103 = [v102 countByEnumeratingWithState:&v116 objects:v121 count:16];
      if (v103)
      {
        uint64_t v104 = v103;
        uint64_t v105 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v104; ++i)
          {
            if (*(void *)v117 != v105) {
              objc_enumerationMutation(v102);
            }
            v107 = *(void **)(*((void *)&v116 + 1) + 8 * i);
            [v107 symbolFrame];
            objc_msgSend(v107, "setSymbolFrame:", v108 + 0.0, v109 + 0.0);
            [v107 paddedFrame];
            objc_msgSend(v107, "setPaddedFrame:", v110 + 1.0, v112 + 1.0, v111 + -2.0, v113 + -3.0);
          }
          uint64_t v104 = [v102 countByEnumeratingWithState:&v116 objects:v121 count:16];
        }
        while (v104);
      }
    }
    v114 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.0, 18.0, 6.0, 28.0, 6.0, 4.5 offset insets weight];
    [v79 addRenderEffect:v114];

    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

@end