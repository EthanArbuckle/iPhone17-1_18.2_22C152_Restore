@interface UIKBRenderFactoryiPadFudge
- (BOOL)iPadFudgeLayout;
- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4;
- (CGPoint)deleteKeyOffset:(unint64_t)a3;
- (CGPoint)dictationKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4;
- (CGPoint)dualStringKeyBottomTextOffset:(unint64_t)a3;
- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4;
- (CGPoint)dualStringKeyTopTextOffset:(unint64_t)a3;
- (CGPoint)iPadFudgeControlKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)moreKeyOffset;
- (CGPoint)stringKeyOffset:(unint64_t)a3;
- (CGPoint)symbolImageControlKeyOffset;
- (CGSize)defaultVariantGeometrySize;
- (double)_row4ControlSegmentWidthLeft;
- (double)_row4ControlSegmentWidthRight;
- (double)controlKeyFontSize;
- (double)deleteKeyFontSize;
- (double)dualStringKeyBottomFontSize:(unint64_t)a3;
- (double)dualStringKeyTopFontSize:(unint64_t)a3;
- (double)moreKeyFontSize;
- (double)spaceKeyFontSize;
- (double)stringKeyFontSize:(unint64_t)a3;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)displayContentsForKey:(id)a3;
- (id)lightKeycapsFontName;
- (id)messagesWriteboardKeyImageName;
- (unint64_t)_isFullHeightKeyFor:(id)a3 onKeyplane:(id)a4;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5;
@end

@implementation UIKBRenderFactoryiPadFudge

- (double)stringKeyFontSize:(unint64_t)a3
{
  double result = 18.5;
  if (a3 != 1) {
    double result = 19.0;
  }
  if (a3 == 4) {
    return 22.0;
  }
  return result;
}

- (CGPoint)stringKeyOffset:(unint64_t)a3
{
  double v3 = 2.0;
  if (a3 != 1) {
    double v3 = 1.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)moreKeyFontSize
{
  return 14.0;
}

- (double)deleteKeyFontSize
{
  return 17.0;
}

- (double)controlKeyFontSize
{
  return 17.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2 = 17.0;
  double v3 = 16.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)iPadFudgeControlKeyOffset
{
  BOOL v2 = [(UIKBRenderFactory *)self preferStringKeycapOverImage];
  double v3 = 17.0;
  if (v2) {
    double v3 = 16.0;
  }
  double v4 = 13.5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset:(unint64_t)a3
{
  double v3 = 13.5;
  if (a3 != 1) {
    double v3 = 14.5;
  }
  double v4 = 16.5;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2 = 17.0;
  double v3 = 14.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreKeyOffset
{
  double v2 = 16.0;
  double v3 = 13.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2 = 17.0;
  double v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 17.0;
  double v3 = 11.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dualStringKeyBottomFontSize:(unint64_t)a3
{
  double result = 18.0;
  if (a3 == 1) {
    double result = 15.0;
  }
  if (a3 == 4) {
    return 20.0;
  }
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(unint64_t)a3
{
  double v3 = 12.0;
  if (a3 == 1) {
    double v3 = 9.0;
  }
  if (a3 == 4) {
    double v3 = 13.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)dualStringKeyTopFontSize:(unint64_t)a3
{
  double result = 17.0;
  if (a3 == 1) {
    double result = 16.0;
  }
  if (a3 == 4) {
    return 20.0;
  }
  return result;
}

- (CGPoint)dualStringKeyTopTextOffset:(unint64_t)a3
{
  double v3 = -9.0;
  if (a3 != 1) {
    double v3 = -13.0;
  }
  double v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGSize)defaultVariantGeometrySize
{
  double v2 = 63.0;
  double v3 = 61.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)iPadFudgeLayout
{
  return 1;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_fudge_portrait.png";
}

- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4
{
  unint64_t v5 = [(UIKBRenderFactoryiPadFudge *)self _isFullHeightKeyFor:a3 onKeyplane:a4];
  [(UIKBRenderFactoryiPadFudge *)self dualStringKeyTopTextOffset:v5];
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4
{
  unint64_t v5 = [(UIKBRenderFactoryiPadFudge *)self _isFullHeightKeyFor:a3 onKeyplane:a4];
  [(UIKBRenderFactoryiPadFudge *)self dualStringKeyBottomTextOffset:v5];
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  if ([a3 keyboardType] == 12) {
    return 0;
  }
  unint64_t v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v6 = [v5 preferencesActions];
  char v7 = [v6 BOOLForPreferenceKey:@"GesturesEnabled"];

  return v7 ^ 1;
}

- (id)lightKeycapsFontName
{
  if ([(UIKBRenderFactory *)self boldTextEnabled]) {
    double v2 = @".PhoneKeyCaps";
  }
  else {
    double v2 = @".KeycapsPadA-Keys";
  }
  return v2;
}

- (unint64_t)_isFullHeightKeyFor:(id)a3 onKeyplane:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 dynamicLayout])
  {
    char v7 = [v6 subtreeWithType:3];

    v8 = [v7 rowSet];
    v9 = [v8 subtrees];
    unint64_t v10 = [v9 count];
    int v11 = [v5 displayRowHint];

    if (v10 <= v11)
    {
      unint64_t v19 = 4;
    }
    else
    {
      v12 = [v7 rowSet];
      v13 = [v12 subtrees];
      v14 = objc_msgSend(v13, "objectAtIndex:", (int)objc_msgSend(v5, "displayRowHint"));

      v15 = [v14 properties];
      v16 = [v15 objectForKey:@"Height"];

      if (v16 && ([v16 doubleValue], v17 > 0.0) && (objc_msgSend(v16, "doubleValue"), v18 < 1.0)) {
        unint64_t v19 = 1;
      }
      else {
        unint64_t v19 = 4;
      }
    }
  }
  else
  {
    [v6 frame];
    double v21 = v20;

    double v22 = v21 / 5.0;
    [v5 frame];
    uint64_t v24 = 2;
    if (v23 > v22) {
      uint64_t v24 = 4;
    }
    if (v23 < v22 * 0.8) {
      unint64_t v19 = 1;
    }
    else {
      unint64_t v19 = v24;
    }
  }

  return v19;
}

- (id)displayContentsForKey:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIKBRenderFactoryiPadFudge;
  id v5 = [(UIKBRenderFactoryiPad *)&v16 displayContentsForKey:v4];
  if ([v4 displayType] == 23 || objc_msgSend(v4, "interactionType") == 14)
  {
    id v6 = [v4 overrideDisplayString];
    if (v6)
    {
      [v5 setDisplayString:v6];
    }
    else
    {
      char v7 = [v4 displayString];
      [v5 setDisplayString:v7];
    }
    if ([(UIKBRenderFactory *)self preferStringKeycapOverImage]
      && [v4 state] == 8)
    {
      [v5 setDisplayString:@"caps lock"];
    }
  }
  else if ([v4 displayType] == 7)
  {
    v8 = [(UIKBRenderFactory *)self renderingContext];
    if ([v8 shiftState] == 1)
    {
      v9 = [v4 secondaryRepresentedStrings];
      unint64_t v10 = [v9 firstObject];
      int v11 = [v4 representedString];
      char v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        v13 = [v5 secondaryDisplayStrings];
        v14 = [v13 objectAtIndex:0];
        [v5 setDisplayString:v14];

        [v5 setSecondaryDisplayStrings:0];
      }
    }
    else
    {
    }
  }
  [(UIKBRenderFactory *)self applyBoldTextForContent:v5 withKey:v4];
  if ([(UIKBRenderFactory *)self preferStringKeycapOverImage]) {
    objc_msgSend(v5, "setStringKeycapOverImage:", objc_msgSend(v5, "forceImageKeycap") ^ 1);
  }

  return v5;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryiPadFudge;
  [(UIKBRenderFactoryiPad *)&v10 _customizeGeometry:v8 forKey:v9 contents:a5];
  if ([v9 displayType] == 23
    || [v9 displayType] == 3
    || [v9 displayType] == 21
    || [v9 displayType] == 18
    || [v9 displayType] == 5)
  {
    [v9 paddedFrame];
    objc_msgSend(v8, "setSymbolFrame:");
  }
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.35;
}

- (double)_row4ControlSegmentWidthRight
{
  double v2 = [(UIKBRenderFactory *)self renderingContext];
  double v3 = dbl_186B99B00[[v2 keyboardType] == 126];

  return v3;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v117.receiver = self;
  v117.super_class = (Class)UIKBRenderFactoryiPadFudge;
  id v8 = [(UIKBRenderFactoryiPad *)&v117 _traitsForKey:v6 onKeyplane:v7];
  unint64_t v9 = [(UIKBRenderFactoryiPadFudge *)self _isFullHeightKeyFor:v6 onKeyplane:v7];
  int v10 = [v6 interactionType];
  if ((![v6 displayType] || objc_msgSend(v6, "displayType") == 8)
    && v10 != 9)
  {
    [(UIKBRenderFactoryiPadFudge *)self stringKeyFontSize:v9];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v12 = v11;
    v13 = [v8 symbolStyle];
    [v13 setFontSize:v12];

    [(UIKBRenderFactory *)self scale];
    if (v14 == 2.0) {
      double v15 = 0.0;
    }
    else {
      double v15 = *MEMORY[0x1E4F1DAD8];
    }
    if (v14 == 2.0) {
      double v16 = 0.5;
    }
    else {
      double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    goto LABEL_46;
  }
  if ([v6 displayType] == 7)
  {
    double v17 = [v8 symbolStyle];
    double v18 = (void *)[v17 copy];

    [(UIKBRenderFactoryiPadFudge *)self dualStringKeyBottomFontSize:v9];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v20 = v19;
    double v21 = [v8 symbolStyle];
    [v21 setFontSize:v20];

    [(UIKBRenderFactoryiPadFudge *)self dualStringKeyBottomTextOffset:v9];
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    double v23 = v22;
    double v25 = v24;
    v26 = [v8 symbolStyle];
    objc_msgSend(v26, "setTextOffset:", v23, v25);

    [(UIKBRenderFactoryiPadFudge *)self dualStringKeyTopFontSize:v9];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    objc_msgSend(v18, "setFontSize:");
    [(UIKBRenderFactoryiPadFudge *)self dualStringKeyTopTextOffset:v9];
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    objc_msgSend(v18, "setTextOffset:");
    if (v18)
    {
      v118[0] = v18;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:1];
      [v8 setSecondarySymbolStyles:v27];
    }
    else
    {
      [v8 setSecondarySymbolStyles:0];
    }
    if ([v6 displayTypeHint] == 10 && objc_msgSend(v6, "state") == 4)
    {
      v56 = [v8 symbolStyle];
      [v56 textOffset];
      double v58 = v57;
      v59 = [v8 symbolStyle];
      objc_msgSend(v59, "setTextOffset:", v58, 0.0);

      [v18 textOffset];
      objc_msgSend(v18, "setTextOffset:");
    }
    v60 = [(UIKBRenderFactory *)self renderingContext];
    uint64_t v61 = [v60 shiftState];

    if (v61 != 4)
    {
      v62 = [(UIKBRenderFactory *)self renderingContext];
      uint64_t v63 = [v62 shiftState];

      if (v63 == 1)
      {
        if ([v6 displayRowHint] == 1) {
          uint64_t v64 = 1;
        }
        else {
          uint64_t v64 = 4;
        }
        [(UIKBRenderFactoryiPadFudge *)self stringKeyFontSize:v64];
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        double v66 = v65;
        [(UIKBRenderFactoryiPadFudge *)self stringKeyOffset:v64];
        -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
        double v68 = v67;
        double v70 = v69;
        v71 = [v8 symbolStyle];
        [v71 setFontSize:v66];

        v72 = [v8 symbolStyle];
        objc_msgSend(v72, "setTextOffset:", v68, v70);

        [v8 setSecondarySymbolStyles:0];
      }
    }
    goto LABEL_47;
  }
  if ([v6 displayType] == 3)
  {
    v28 = [v8 symbolStyle];
    [v28 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v30 = v29;
    v31 = [v8 symbolStyle];
    [v31 setFontSizeForSymbolImage:v30];

    [(UIKBRenderFactoryiPadFudge *)self deleteKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v33 = v32;
    v34 = [v8 symbolStyle];
    [v34 setFontSize:v33];

    v35 = [v8 symbolStyle];
    [v35 setAnchorCorner:8];

    [(UIKBRenderFactoryiPadFudge *)self deleteKeyOffset:v9];
LABEL_44:
    v55 = self;
LABEL_45:
    -[UIKBRenderFactory RivenPointFactor:](v55, "RivenPointFactor:", v36, v37);
    double v15 = v94;
    double v16 = v95;
LABEL_46:
    double v18 = [v8 symbolStyle];
    objc_msgSend(v18, "setTextOffset:", v15, v16);
LABEL_47:

    goto LABEL_48;
  }
  if ([v6 displayType] == 21)
  {
    [(UIKBRenderFactoryiPadFudge *)self controlKeyFontSize];
    double v39 = v38;
    v40 = [v8 symbolStyle];
    [v40 setAnchorCorner:8];

    [(UIKBRenderFactoryiPadFudge *)self iPadFudgeControlKeyOffset];
    double v42 = v41;
    double v44 = v43;
    v45 = [v8 symbolStyle];
    int v46 = [v45 usesSymbolImage];

    if (v46)
    {
      [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
      double v48 = v47;
      v49 = [v8 symbolStyle];
      [v49 setFontSizeForSymbolImage:v48];

      [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyOffset];
      double v42 = v50;
      double v44 = v51;
    }
    [(UIKBRenderFactory *)self RivenFactor:v39];
    double v53 = v52;
    v54 = [v8 symbolStyle];
    [v54 setFontSize:v53];

    v55 = self;
    double v36 = v42;
    double v37 = v44;
    goto LABEL_45;
  }
  if ([v6 displayType] == 23)
  {
    v73 = [v8 symbolStyle];
    [v73 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v75 = v74;
    v76 = [v8 symbolStyle];
    [v76 setFontSizeForSymbolImage:v75];

    if ([(UIKBRenderFactoryiPad *)self _onLeftSide:v6 onKeyplane:v7]) {
      uint64_t v77 = 4;
    }
    else {
      uint64_t v77 = 8;
    }
    v78 = [v8 symbolStyle];
    [v78 setAnchorCorner:v77];

    goto LABEL_34;
  }
  if (v10 == 9)
  {
    v79 = [v8 symbolStyle];
    [v79 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v81 = v80;
    v82 = [v8 symbolStyle];
    [v82 setFontSizeForSymbolImage:v81];

    v83 = [v8 symbolStyle];
    [v83 setAnchorCorner:4];

    [(UIKBRenderFactoryiPadFudge *)self internationalKeyOffset];
    goto LABEL_44;
  }
  if ([v6 displayType] == 4)
  {
    v84 = [v8 symbolStyle];
    [v84 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v86 = v85;
    v87 = [v8 symbolStyle];
    [v87 setFontSizeForSymbolImage:v86];

    v88 = [v8 symbolStyle];
    [v88 setAnchorCorner:4];

    [(UIKBRenderFactoryiPadFudge *)self dictationKeyOffset];
    goto LABEL_44;
  }
  if ([v6 displayType] == 18)
  {
    [(UIKBRenderFactoryiPadFudge *)self controlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v90 = v89;
    v91 = [v8 symbolStyle];
    [v91 setFontSize:v90];

    if ([(UIKBRenderFactoryiPad *)self _onLeftSide:v6 onKeyplane:v7]) {
      uint64_t v92 = 4;
    }
    else {
      uint64_t v92 = 8;
    }
    v93 = [v8 symbolStyle];
    [v93 setAnchorCorner:v92];

    [(UIKBRenderFactoryiPadFudge *)self moreKeyOffset];
    goto LABEL_44;
  }
  if ([v6 displayType] == 26
    || [v6 displayType] == 51
    || [v6 interactionType] == 17
    || [v6 interactionType] == 12)
  {
    v101 = [v8 symbolStyle];
    [v101 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v103 = v102;
    v104 = [v8 symbolStyle];
    [v104 setFontSizeForSymbolImage:v103];

    [(UIKBRenderFactoryiPadFudge *)self controlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v106 = v105;
    v107 = [v8 symbolStyle];
    [v107 setFontSize:v106];

    v108 = [v8 symbolStyle];
    [v108 setAnchorCorner:4];

LABEL_34:
    [(UIKBRenderFactoryiPadFudge *)self iPadFudgeControlKeyOffset];
    goto LABEL_44;
  }
  if ([v6 displayType] == 5 || objc_msgSend(v6, "displayType") == 53)
  {
    BOOL v109 = [v6 displayType] == 5;
    v110 = [v8 symbolStyle];
    [v110 setUsesSymbolImage:v109];

    [(UIKBRenderFactoryiPadFudge *)self symbolImageControlKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v112 = v111;
    v113 = [v8 symbolStyle];
    [v113 setFontSizeForSymbolImage:v112];

    v114 = [v8 symbolStyle];
    [v114 setAnchorCorner:8];

    [(UIKBRenderFactoryiPadFudge *)self dismissKeyOffset];
    goto LABEL_44;
  }
  if ([v6 displayType] == 27)
  {
    [(UIKBRenderFactoryiPadFudge *)self deleteKeyFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v116 = v115;
    double v18 = [v8 symbolStyle];
    [v18 setFontSize:v116];
    goto LABEL_47;
  }
LABEL_48:
  v96 = [v8 symbolStyle];
  double v97 = 1.0;
  if (([v96 usesSymbolImage] & 1) == 0)
  {
    [(UIKBRenderFactory *)self RivenFactor:100.0];
    double v97 = v98 / 100.0;
  }
  v99 = [v8 symbolStyle];
  [v99 setImageScale:v97];

  return v8;
}

@end