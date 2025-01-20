@interface UIKBRenderFactoryiPadSansHomeButton
- (BOOL)_displaysAsControlKeyStyle:(id)a3;
- (BOOL)iPadSansHomeButtonLayout;
- (CGPoint)dualStringKeyBottomTextOffset;
- (CGPoint)dualStringKeyTopTextOffset;
- (CGPoint)iPadFudgeControlKeyOffset;
- (CGPoint)symbolImageControlKeyOffset;
- (double)controlKeyFontSize;
- (double)dualStringKeyBottomFontSize;
- (double)dualStringKeyTopFontSize;
- (double)keyCornerRadius;
- (double)stringKeyFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)displayContentsForKey:(id)a3;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5;
@end

@implementation UIKBRenderFactoryiPadSansHomeButton

- (BOOL)iPadSansHomeButtonLayout
{
  return 1;
}

- (CGPoint)iPadFudgeControlKeyOffset
{
  double v2 = 10.0;
  double v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2 = 10.0;
  double v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)controlKeyFontSize
{
  return 15.0;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)stringKeyFontSize
{
  [(UIKBRenderFactory *)self RivenFactor:22.0];
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 23.0;
}

- (double)dualStringKeyBottomFontSize
{
  return 20.0;
}

- (CGPoint)dualStringKeyBottomTextOffset
{
  double v2 = 0.0;
  double v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dualStringKeyTopFontSize
{
  return 20.0;
}

- (CGPoint)dualStringKeyTopTextOffset
{
  double v2 = 0.0;
  double v3 = -9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_displaysAsControlKeyStyle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 displayType];
  unsigned int v5 = (v4 < 0x34) & (0x8000004A42038uLL >> v4);
  int v6 = [v3 interactionType];

  unsigned int v7 = (0x80000109 >> (v6 - 9)) | v5;
  if ((v6 - 9) > 0x1F) {
    LOBYTE(v7) = v5;
  }
  return v7 & 1;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  v8 = [(UIKBRenderFactoryiPad *)&v49 _traitsForKey:v6 onKeyplane:v7];
  if ([(UIKBRenderFactoryiPadSansHomeButton *)self _displaysAsControlKeyStyle:v6])
  {
    [(UIKBRenderFactoryiPadSansHomeButton *)self iPadFudgeControlKeyOffset];
    double v10 = v9;
    double v12 = v11;
    [(UIKBRenderFactoryiPadSansHomeButton *)self controlKeyFontSize];
    double v14 = v13;
    v15 = [v8 symbolStyle];
    int v16 = [v15 usesSymbolImage];

    if (v16)
    {
      [(UIKBRenderFactoryiPadSansHomeButton *)self symbolImageControlKeyOffset];
      double v10 = v17;
      double v12 = v18;
      [(UIKBRenderFactoryiPadSansHomeButton *)self symbolImageControlKeyFontSize];
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      double v20 = v19;
      v21 = [v8 symbolStyle];
      [v21 setFontSizeForSymbolImage:v20];

      double v22 = *(double *)off_1E52D6BE8;
      v23 = [v8 symbolStyle];
      [v23 setFontWeightForSymbolImage:v22];
    }
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:", v10, v12);
    double v25 = v24;
    double v27 = v26;
    v28 = [v8 symbolStyle];
    objc_msgSend(v28, "setTextOffset:", v25, v27);

    [(UIKBRenderFactory *)self RivenFactor:v14];
    double v30 = v29;
    v31 = [v8 symbolStyle];
    [v31 setFontSize:v30];

    if ([(UIKBRenderFactoryiPad *)self _onLeftSide:v6 onKeyplane:v7]) {
      uint64_t v32 = 4;
    }
    else {
      uint64_t v32 = 8;
    }
    v33 = [v8 symbolStyle];
    [v33 setAnchorCorner:v32];
  }
  else
  {
    if ([v6 displayType] != 7) {
      goto LABEL_15;
    }
    v34 = [v8 symbolStyle];
    v33 = (void *)[v34 copy];

    [(UIKBRenderFactoryiPadSansHomeButton *)self dualStringKeyBottomFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    double v36 = v35;
    v37 = [v8 symbolStyle];
    [v37 setFontSize:v36];

    [(UIKBRenderFactoryiPadSansHomeButton *)self dualStringKeyBottomTextOffset];
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    double v39 = v38;
    double v41 = v40;
    v42 = [v8 symbolStyle];
    objc_msgSend(v42, "setTextOffset:", v39, v41);

    [v33 setFontWeight:*(double *)off_1E52D6BD8];
    [(UIKBRenderFactoryiPadSansHomeButton *)self dualStringKeyTopFontSize];
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    objc_msgSend(v33, "setFontSize:");
    [(UIKBRenderFactoryiPadSansHomeButton *)self dualStringKeyTopTextOffset];
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    objc_msgSend(v33, "setTextOffset:");
    if ([v6 displayTypeHint] == 10 && objc_msgSend(v6, "state") == 4)
    {
      v43 = [v8 symbolStyle];
      [v43 textOffset];
      double v45 = v44;
      v46 = [v8 symbolStyle];
      objc_msgSend(v46, "setTextOffset:", v45, 3.0);

      [v33 textOffset];
      objc_msgSend(v33, "setTextOffset:");
    }
    if (v33)
    {
      v50[0] = v33;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
      [v8 setSecondarySymbolStyles:v47];
    }
  }

LABEL_15:
  return v8;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  [(UIKBRenderFactoryiPad *)&v10 _customizeGeometry:v8 forKey:v9 contents:a5];
  if ([(UIKBRenderFactoryiPadSansHomeButton *)self _displaysAsControlKeyStyle:v9])
  {
    [v9 paddedFrame];
    objc_msgSend(v8, "setSymbolFrame:");
  }
}

- (id)displayContentsForKey:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  unsigned int v5 = [(UIKBRenderFactoryiPad *)&v9 displayContentsForKey:v4];
  if ([(UIKBRenderFactory *)self preferStringKeycapOverImage]) {
    objc_msgSend(v5, "setStringKeycapOverImage:", objc_msgSend(v5, "forceImageKeycap") ^ 1);
  }
  if ([v4 displayType] == 23 || objc_msgSend(v4, "interactionType") == 14)
  {
    id v6 = [v4 overrideDisplayString];
    if (v6)
    {
      [v5 setDisplayString:v6];
    }
    else
    {
      id v7 = [v4 displayString];
      [v5 setDisplayString:v7];
    }
    if ([(UIKBRenderFactory *)self preferStringKeycapOverImage])
    {
      if ([v4 state] == 8) {
        [v5 setDisplayString:@"caps lock"];
      }
    }
  }

  return v5;
}

@end