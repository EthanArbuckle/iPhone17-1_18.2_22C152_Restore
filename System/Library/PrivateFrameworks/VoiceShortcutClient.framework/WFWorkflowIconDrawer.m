@interface WFWorkflowIconDrawer
+ (id)glyphImageWithIcon:(id)a3 size:(CGSize)a4;
+ (id)imageWithIcon:(id)a3 size:(CGSize)a4;
+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 background:(BOOL)a5;
+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 scale:(double)a5 padding:(CGSize)a6 glyphColor:(id)a7 background:(BOOL)a8;
+ (id)pngDataForImageWithIcon:(id)a3 size:(CGSize)a4;
- (BOOL)dark;
- (BOOL)drawBackground;
- (BOOL)drawGradient;
- (BOOL)drawShadowBehindGlyph;
- (BOOL)highContrast;
- (BOOL)outline;
- (BOOL)rounded;
- (BOOL)useCustomImage;
- (CGSize)calculatedSizeForSize:(CGSize)a3 scale:(double)a4;
- (CGSize)glyphSize;
- (NSData)customImageData;
- (NSString)symbolName;
- (WFColor)backgroundColor;
- (WFColor)glyphColor;
- (WFWorkflowIconDrawer)init;
- (WFWorkflowIconDrawer)initWithDrawerContext:(id)a3;
- (WFWorkflowIconDrawer)initWithIcon:(id)a3;
- (WFWorkflowIconDrawer)initWithIcon:(id)a3 drawerContext:(id)a4;
- (WFWorkflowIconDrawerContext)drawerContext;
- (double)cornerRadius;
- (id)imageWithSize:(CGSize)a3;
- (id)imageWithSize:(CGSize)a3 scale:(double)a4;
- (id)imageWithSize:(CGSize)a3 scale:(double)a4 padding:(CGSize)a5;
- (unsigned)glyphCharacter;
- (void)drawInContext:(id)a3 inRect:(CGRect)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCustomImageData:(id)a3;
- (void)setDark:(BOOL)a3;
- (void)setDrawBackground:(BOOL)a3;
- (void)setDrawGradient:(BOOL)a3;
- (void)setDrawShadowBehindGlyph:(BOOL)a3;
- (void)setGlyphCharacter:(unsigned __int16)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphSize:(CGSize)a3;
- (void)setHighContrast:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setOutline:(BOOL)a3;
- (void)setRounded:(BOOL)a3;
- (void)setSymbolName:(id)a3;
- (void)setUseCustomImage:(BOOL)a3;
@end

@implementation WFWorkflowIconDrawer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_drawerContext, 0);
}

- (void)setDrawShadowBehindGlyph:(BOOL)a3
{
  self->_drawShadowBehindGlyph = a3;
}

- (BOOL)drawShadowBehindGlyph
{
  return self->_drawShadowBehindGlyph;
}

- (void)setOutline:(BOOL)a3
{
  self->_outline = a3;
}

- (BOOL)outline
{
  return self->_outline;
}

- (void)setHighContrast:(BOOL)a3
{
  self->_highContrast = a3;
}

- (BOOL)highContrast
{
  return self->_highContrast;
}

- (void)setDark:(BOOL)a3
{
  self->_dark = a3;
}

- (BOOL)dark
{
  return self->_dark;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setUseCustomImage:(BOOL)a3
{
  self->_useCustomImage = a3;
}

- (BOOL)useCustomImage
{
  return self->_useCustomImage;
}

- (void)setDrawBackground:(BOOL)a3
{
  self->_drawBackground = a3;
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (void)setGlyphSize:(CGSize)a3
{
  self->_glyphSize = a3;
}

- (CGSize)glyphSize
{
  double width = self->_glyphSize.width;
  double height = self->_glyphSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setGlyphColor:(id)a3
{
}

- (void)setCustomImageData:(id)a3
{
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (void)setDrawGradient:(BOOL)a3
{
  self->_drawGradient = a3;
}

- (BOOL)drawGradient
{
  return self->_drawGradient;
}

- (void)setBackgroundColor:(id)a3
{
}

- (WFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  self->_glyphCharacter = a3;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (WFWorkflowIconDrawerContext)drawerContext
{
  return self->_drawerContext;
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4 padding:(CGSize)a5
{
  double width = a5.width;
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v16 = 0;
  }
  else
  {
    double height = a5.height;
    -[WFWorkflowIconDrawer calculatedSizeForSize:scale:](self, "calculatedSizeForSize:scale:");
    double v10 = v9;
    double v12 = v11;
    v13 = +[WFBitmapContext contextWithSize:scale:](WFBitmapContext, "contextWithSize:scale:");
    if (v13)
    {
      double v14 = ceil(width);
      double v15 = ceil(height);
      -[WFWorkflowIconDrawer drawInContext:inRect:](self, "drawInContext:inRect:", v13, v14, v15, v10 - v14 * 2.0, v12 - v15 * 2.0);
      v16 = [v13 image];
    }
    else
    {
      v16 = 0;
    }
  }
  return v16;
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4
{
  return -[WFWorkflowIconDrawer imageWithSize:scale:padding:](self, "imageWithSize:scale:padding:", a3.width, a3.height, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (id)imageWithSize:(CGSize)a3
{
  return -[WFWorkflowIconDrawer imageWithSize:scale:](self, "imageWithSize:scale:", a3.width, a3.height, 0.0);
}

- (CGSize)calculatedSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    double v10 = [(WFWorkflowIconDrawer *)self customImageData];
    if (-[WFWorkflowIconDrawer useCustomImage](self, "useCustomImage") && [v10 length])
    {
      double v11 = +[WFImage imageWithData:v10 scale:0 allowAnimated:a4];
      [v11 sizeInPoints];
      double v13 = v12;
      double v15 = v14;

      double v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v13, v15, a4);
      double v9 = v16;
    }
    else
    {
      v17 = [(WFWorkflowIconDrawer *)self drawerContext];
      uint64_t v18 = [(WFWorkflowIconDrawer *)self glyphCharacter];
      BOOL v19 = [(WFWorkflowIconDrawer *)self outline];
      id v20 = v17;
      UniChar theChar = v18;
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (width == *MEMORY[0x1E4F1DB30] && height == v9)
      {
        double v8 = width;
        double v9 = height;
      }
      else
      {
        v22 = +[WFDevice currentDevice];
        [v22 screenScale];
        double v24 = v23;

        if (v19) {
          WFSystemImageNameForOutlineGlyphCharacter(v18);
        }
        else {
        v25 = WFSystemImageNameForGlyphCharacter(v18);
        }
        v26 = v25;
        if (v25)
        {
          v27 = v25;
          v28 = [v20 coreGlyphsCatalogs];
          v29 = +[WFImage glyphNamed:v27 pointSize:6 symbolWeight:v28 scaleFactor:height inCatalogs:v24];

          if (v29)
          {
            [v29 sizeInPoints];
            double v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v30, v31, v24);
            double v9 = v32;
          }
          else
          {
            v48 = getWFVoiceShortcutClientLogObject();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)aBlock = 136315394;
              *(void *)&aBlock[4] = "WFWorkflowIconDrawerScaledSizeForVectorIdentifier";
              *(_WORD *)&aBlock[12] = 2114;
              *(void *)&aBlock[14] = v27;
              _os_log_impl(&dword_1B3C5C000, v48, OS_LOG_TYPE_FAULT, "%s vector glyph was unexpectedly nil with identifier: %{public}@", aBlock, 0x16u);
            }
          }
        }
        else
        {
          UniChar theChar = WFReplacementGlyphCharacterForCharacter(v18);
          uint64_t v33 = [v20 glyphTestFont];
          WFCTFontCopyCharacterSet(v33);
          CFCharacterSetRef v35 = v34;
          *(void *)aBlock = MEMORY[0x1E4F143A8];
          *(void *)&aBlock[8] = 3221225472;
          *(void *)&aBlock[16] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke;
          v79 = &__block_descriptor_40_e5_v8__0l;
          CFCharacterSetRef v80 = v34;
          v27 = (void (**)(void))_Block_copy(aBlock);
          if (CFCharacterSetIsCharacterMember(v35, theChar))
          {
            v36 = [NSString stringWithCharacters:&theChar length:1];
            uint64_t v69 = [v36 length];
            id v37 = objc_alloc(MEMORY[0x1E4F28B18]);
            getkCTFontAttributeName();
            uint64_t v76 = v38;
            uint64_t v77 = v33;
            v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
            v40 = (void *)[v37 initWithString:v36 attributes:v39];

            WFCTFramesetterCreateWithAttributedString((uint64_t)v40);
            uint64_t v42 = v41;
            if (v41)
            {
              v72[0] = MEMORY[0x1E4F143A8];
              v72[1] = 3221225472;
              v72[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_2;
              v72[3] = &__block_descriptor_40_e5_v8__0l;
              v72[4] = v41;
              v43 = (void (**)(void))_Block_copy(v72);
              WFCTFramesetterSuggestFrameSizeWithConstraints(v42, 0, v69);
              if (v44 != v8 || v45 != v9)
              {
                double v46 = height - 1.0 / v24;
                if (width == 0.0)
                {
                  double v47 = v46 / v45;
                }
                else
                {
                  double v49 = (width - 1.0 / v24) / v44;
                  double v50 = v46 / v45;
                  if (v49 < v50) {
                    double v50 = v49;
                  }
                  if (height == 0.0) {
                    double v47 = v49;
                  }
                  else {
                    double v47 = v50;
                  }
                }
                +[WFWorkflowIconDrawerContext glyphTestFontSize];
                uint64_t v52 = [v20 newGlyphFontForSize:v47 * v51];
                uint64_t v53 = v52;
                if (v52)
                {
                  v71[0] = MEMORY[0x1E4F143A8];
                  v71[1] = 3221225472;
                  v71[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_3;
                  v71[3] = &__block_descriptor_40_e5_v8__0l;
                  v71[4] = v52;
                  v67 = (void (**)(void))_Block_copy(v71);
                  id v54 = objc_alloc(MEMORY[0x1E4F28B18]);
                  getkCTFontAttributeName();
                  uint64_t v74 = v55;
                  uint64_t v75 = v53;
                  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
                  v68 = (void *)[v54 initWithString:v36 attributes:v56];

                  WFCTFramesetterCreateWithAttributedString((uint64_t)v68);
                  uint64_t v58 = v57;
                  if (v57)
                  {
                    v70[0] = MEMORY[0x1E4F143A8];
                    v70[1] = 3221225472;
                    v70[2] = __WFWorkflowIconDrawerScaledSizeForIconCharacter_block_invoke_4;
                    v70[3] = &__block_descriptor_40_e5_v8__0l;
                    v70[4] = v57;
                    v59 = (void (**)(void))_Block_copy(v70);
                    WFCTFramesetterSuggestFrameSizeWithConstraints(v58, 0, v69);
                    double v61 = v60;
                    double v63 = v62;
                    v59[2](v59);
                    double v8 = WFWorkflowIconDrawerScaledSizeWithTargetSize(width, height, v61, v63, v24);
                    double v9 = v64;
                  }
                  v67[2](v67);
                }
              }
              v43[2](v43);
            }
          }
          v27[2](v27);
        }
      }
    }
  }
  else
  {
    double v8 = a3.width;
    double v9 = a3.height;
  }
  double v65 = v8;
  double v66 = v9;
  result.double height = v66;
  result.double width = v65;
  return result;
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v201[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = (CGContext *)[v9 CGContext];
  CGContextSaveGState(v10);
  BOOL v11 = [(WFWorkflowIconDrawer *)self drawBackground];
  if ([(WFWorkflowIconDrawer *)self rounded] && v11)
  {
    [(WFWorkflowIconDrawer *)self cornerRadius];
    double v13 = v12;
    if (v12 == 0.0)
    {
      v209.origin.double x = x;
      v209.origin.double y = y;
      v209.size.double width = width;
      v209.size.double height = height;
      double v13 = CGRectGetWidth(v209) * 0.224999994;
    }
    Class v14 = NSClassFromString((NSString *)@"UIBezierPath");
    if (!v14
      || (-[objc_class bezierPathWithRoundedRect:cornerRadius:](v14, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v13), id v15 = objc_claimAutoreleasedReturnValue(), Mutable = CGPathRetain((CGPathRef)[v15 CGPath]), v15, !Mutable))
    {
      if (v13 >= 0.0) {
        double v17 = v13;
      }
      else {
        double v17 = 0.0;
      }
      if (v17 == 0.0
        || (v210.origin.x = x, v210.origin.double y = y,
                               v210.size.double width = width,
                               v210.size.double height = height,
                               CGRectIsEmpty(v210)))
      {
        v211.origin.double x = x;
        v211.origin.double y = y;
        v211.size.double width = width;
        v211.size.double height = height;
        Mutable = CGPathCreateWithRect(v211, 0);
      }
      else
      {
        double v52 = x + width;
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, x, y + v17 * 1.528665);
        CGPathAddCurveToPoint(Mutable, 0, x, y + v17 * 1.08849, x, y + v17 * 0.868407, x + v17 * 0.0749114, y + v17 * 0.631494);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.16906, y + v17 * 0.372824, x + v17 * 0.372824, y + v17 * 0.16906, x + v17 * 0.631494, y + v17 * 0.0749114);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.868407, y, x + v17 * 1.08849, y, x + v17 * 1.52866, y);
        CGPathAddLineToPoint(Mutable, 0, x + width - v17 * 1.528665, y);
        double cp2xa = x + width - v17 * 1.08849;
        CGPathAddCurveToPoint(Mutable, 0, cp2xa, y, v52 - v17 * 0.868407, y, v52 - v17 * 0.631494, y + v17 * 0.0749114);
        CGPathAddCurveToPoint(Mutable, 0, v52 - v17 * 0.372824, y + v17 * 0.16906, v52 - v17 * 0.16906, y + v17 * 0.372824, v52 - v17 * 0.0749114, y + v17 * 0.631494);
        CGPathAddCurveToPoint(Mutable, 0, x + width, y + v17 * 0.868407, x + width, y + v17 * 1.08849, x + width, y + v17 * 1.52866);
        CGPathAddLineToPoint(Mutable, 0, x + width, y + height - v17 * 1.528665);
        CGFloat v166 = y + height - v17 * 1.08849;
        CGFloat v169 = y + height - v17 * 0.868407;
        double v171 = y + height - v17 * 0.631494;
        CGPathAddCurveToPoint(Mutable, 0, x + width, v166, x + width, v169, x + width - v17 * 0.0749114, v171);
        CGFloat v173 = y + height - v17 * 0.16906;
        CGFloat v175 = y + height - v17 * 0.372824;
        CGFloat v53 = y + height - v17 * 0.0749114;
        CGPathAddCurveToPoint(Mutable, 0, x + width - v17 * 0.16906, v175, x + width - v17 * 0.372824, v173, x + width - v17 * 0.631494, v53);
        CGPathAddCurveToPoint(Mutable, 0, x + width - v17 * 0.868407, y + height, cp2xa, y + height, x + width - v17 * 1.52866, y + height);
        CGPathAddLineToPoint(Mutable, 0, x + v17 * 1.528665, y + height);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 1.08849, y + height, x + v17 * 0.868407, y + height, x + v17 * 0.631494, v53);
        CGPathAddCurveToPoint(Mutable, 0, x + v17 * 0.372824, v173, x + v17 * 0.16906, v175, x + v17 * 0.0749114, v171);
        CGPathAddCurveToPoint(Mutable, 0, x, v169, x, v166, x, y + height - v17 * 1.52866);
        CGPathCloseSubpath(Mutable);
      }
    }
    CGContextAddPath(v10, Mutable);
    CGContextClip(v10);
    CGPathRelease(Mutable);
  }
  if (v11)
  {
    BOOL v18 = [(WFWorkflowIconDrawer *)self drawGradient];
    BOOL v19 = [(WFWorkflowIconDrawer *)self backgroundColor];
    id v20 = v19;
    if (v18)
    {
      v21 = [v19 gradient];

      objc_msgSend(v21, "baseColorForDarkMode:highContrast:", -[WFWorkflowIconDrawer dark](self, "dark"), -[WFWorkflowIconDrawer highContrast](self, "highContrast"));
      id v22 = objc_claimAutoreleasedReturnValue();
      CGContextSetFillColorWithColor(v10, (CGColorRef)[v22 CGColor]);
      v212.origin.double x = x;
      v212.origin.double y = y;
      v212.size.double width = width;
      v212.size.double height = height;
      CGContextFillRect(v10, v212);
      id v23 = v21;
      double v24 = (CGGradient *)[v23 CGGradient];
      v213.origin.double x = x;
      v213.origin.double y = y;
      v213.size.double width = width;
      v213.size.double height = height;
      CGFloat MidX = CGRectGetMidX(v213);
      v214.origin.double x = x;
      v214.origin.double y = y;
      v214.size.double width = width;
      v214.size.double height = height;
      CGFloat MinY = CGRectGetMinY(v214);
      v215.origin.double x = x;
      v215.origin.double y = y;
      v215.size.double width = width;
      v215.size.double height = height;
      CGFloat v27 = CGRectGetMidX(v215);
      v216.origin.double x = x;
      v216.origin.double y = y;
      v216.size.double width = width;
      v216.size.double height = height;
      v208.double y = CGRectGetMaxY(v216);
      v206.double x = MidX;
      v206.double y = MinY;
      v208.double x = v27;
      CGContextDrawLinearGradient(v10, v24, v206, v208, 2u);
    }
    else
    {
      id v28 = v19;
      CGContextSetFillColorWithColor(v10, (CGColorRef)[v28 CGColor]);

      v217.origin.double x = x;
      v217.origin.double y = y;
      v217.size.double width = width;
      v217.size.double height = height;
      CGContextFillRect(v10, v217);
    }
  }
  if ([(WFWorkflowIconDrawer *)self drawShadowBehindGlyph])
  {
    CGContextSaveGState(v10);
    v29 = +[WFColor blackColor];
    double v30 = [v29 colorWithAlphaComponent:0.3];

    id v31 = v30;
    double v32 = (CGColor *)[v31 CGColor];
    v207.double width = 0.0;
    v207.double height = 2.0;
    CGContextSetShadowWithColor(v10, v207, 2.0, v32);
  }
  uint64_t v33 = [(WFWorkflowIconDrawer *)self customImageData];
  if (-[WFWorkflowIconDrawer useCustomImage](self, "useCustomImage") && [v33 length])
  {
    CFCharacterSetRef v34 = +[WFImage imageWithData:v33 scale:0 allowAnimated:1.0];
    objc_msgSend(v34, "drawInContext:inRect:", v9, x, y, width, height);
  }
  else
  {
    [(WFWorkflowIconDrawer *)self glyphSize];
    double v38 = *MEMORY[0x1E4F1DB30];
    double v37 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v35 == *MEMORY[0x1E4F1DB30] && v36 == v37)
    {
      double v44 = 0.0;
      if (v11)
      {
        v218.origin.double x = x;
        v218.origin.double y = y;
        v218.size.double width = width;
        v218.size.double height = height;
        double v44 = CGRectGetWidth(v218) / 6.0;
      }
      v219.origin.double x = x;
      v219.origin.double y = y;
      v219.size.double width = width;
      v219.size.double height = height;
      CGRect v220 = CGRectInset(v219, v44, v44);
      double v42 = v220.origin.x;
      double v43 = v220.origin.y;
      double v40 = v220.size.width;
      double v41 = v220.size.height;
    }
    else
    {
      double v40 = v35;
      double v41 = v36;
      double v42 = (width - v35) * 0.5;
      double v43 = (height - v36) * 0.5;
    }
    v178 = [(WFWorkflowIconDrawer *)self symbolName];
    double v45 = [(WFWorkflowIconDrawer *)self drawerContext];
    if (v178)
    {
      double v46 = [(WFWorkflowIconDrawer *)self glyphColor];
      double v47 = v178;
      WFDrawGlyphForVectorIdentifier(v45, v9, v178, v46, v42, v43, v40, v41);
    }
    else
    {
      uint64_t v48 = [(WFWorkflowIconDrawer *)self glyphCharacter];
      double v49 = [(WFWorkflowIconDrawer *)self glyphColor];
      BOOL v50 = [(WFWorkflowIconDrawer *)self outline];
      id v177 = v45;
      id v174 = v9;
      UniChar theChar = v48;
      id v176 = v49;
      v221.origin.double x = v42;
      v221.origin.double y = v43;
      v221.size.double width = v40;
      v221.size.double height = v41;
      if (!CGRectIsEmpty(v221))
      {
        if (v50) {
          WFSystemImageNameForOutlineGlyphCharacter(v48);
        }
        else {
        double v51 = WFSystemImageNameForGlyphCharacter(v48);
        }
        if (v51)
        {
          WFDrawGlyphForVectorIdentifier(v177, v174, v51, v176, v42, v43, v40, v41);
        }
        else
        {
          UniChar theChar = WFReplacementGlyphCharacterForCharacter(v48);
          uint64_t v54 = [v177 glyphTestFont];
          WFCTFontCopyCharacterSet(v54);
          CFCharacterSetRef v56 = v55;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __WFDrawGlyphForIconCharacter_block_invoke;
          aBlock[3] = &__block_descriptor_40_e5_v8__0l;
          aBlock[4] = v55;
          uint64_t v57 = (void (**)(void))_Block_copy(aBlock);
          if (CFCharacterSetIsCharacterMember(v56, theChar))
          {
            v172 = [NSString stringWithCharacters:&theChar length:1];
            uint64_t v167 = [v172 length];
            id v58 = objc_alloc(MEMORY[0x1E4F28B18]);
            getkCTFontAttributeName();
            uint64_t v200 = v59;
            v201[0] = v54;
            double v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:&v200 count:1];
            v170 = (void *)[v58 initWithString:v172 attributes:v60];

            WFCTFramesetterCreateWithAttributedString((uint64_t)v170);
            uint64_t v62 = v61;
            if (v61)
            {
              v186[0] = MEMORY[0x1E4F143A8];
              v186[1] = 3221225472;
              v186[2] = __WFDrawGlyphForIconCharacter_block_invoke_2;
              v186[3] = &__block_descriptor_40_e5_v8__0l;
              v186[4] = v61;
              v161 = (void (**)(void))_Block_copy(v186);
              WFCTFramesetterSuggestFrameSizeWithConstraints(v62, 0, v167);
              double v65 = v64;
              if (v64 != v38 || v63 != v37)
              {
                double v162 = v63;
                memset(&v185, 0, sizeof(v185));
                id v158 = v174;
                CGContextGetCTM(&v185, (CGContextRef)[v158 CGContext]);
                double v66 = sqrt(v185.c * v185.c + v185.a * v185.a);
                double v144 = floor(v66);
                BOOL v67 = v144 != v66;
                if (v66 != sqrt(v185.d * v185.d + v185.b * v185.b)) {
                  BOOL v67 = 1;
                }
                double v68 = 1.0 / v66;
                BOOL v147 = v67;
                if (v67) {
                  double v69 = 0.0;
                }
                else {
                  double v69 = v68;
                }
                v222.origin.double x = v42;
                v222.origin.double y = v43;
                v222.size.double width = v40;
                v222.size.double height = v41;
                double v70 = CGRectGetWidth(v222);
                v223.origin.double x = v42;
                v223.origin.double y = v43;
                v223.size.double width = v40;
                v223.size.double height = v41;
                double v71 = CGRectGetHeight(v223);
                +[WFWorkflowIconDrawerContext glyphTestFontSize];
                double v73 = (v70 - v69) / v65;
                if (v73 >= (v71 - v69) / v162) {
                  double v73 = (v71 - v69) / v162;
                }
                uint64_t v74 = [v177 newGlyphFontForSize:v73 * v72];
                uint64_t v75 = v74;
                if (v74)
                {
                  v184[0] = MEMORY[0x1E4F143A8];
                  v184[1] = 3221225472;
                  v184[2] = __WFDrawGlyphForIconCharacter_block_invoke_3;
                  v184[3] = &__block_descriptor_40_e5_v8__0l;
                  v184[4] = v74;
                  cp1double x = (void (**)(void))_Block_copy(v184);
                  cp2double x = v57;
                  id v76 = objc_alloc(MEMORY[0x1E4F28B18]);
                  getkCTFontAttributeName();
                  v152 = v33;
                  v198[0] = v77;
                  v199[0] = v75;
                  *(void *)&long long buf = 0;
                  *((void *)&buf + 1) = &buf;
                  uint64_t v195 = 0x2020000000;
                  v78 = (void *)getkCTForegroundColorAttributeNameSymbolLoc_ptr;
                  v196 = (void *)getkCTForegroundColorAttributeNameSymbolLoc_ptr;
                  if (!getkCTForegroundColorAttributeNameSymbolLoc_ptr)
                  {
                    uint64_t v189 = MEMORY[0x1E4F143A8];
                    uint64_t v190 = 3221225472;
                    v191 = __getkCTForegroundColorAttributeNameSymbolLoc_block_invoke;
                    v192 = &unk_1E6079C28;
                    p_long long buf = &buf;
                    v79 = CoreTextLibrary();
                    CFCharacterSetRef v80 = dlsym(v79, "kCTForegroundColorAttributeName");
                    *(void *)(*((void *)p_buf + 1) + 24) = v80;
                    getkCTForegroundColorAttributeNameSymbolLoc_ptr = *(void *)(*((void *)p_buf + 1) + 24);
                    v78 = *(void **)(*((void *)&buf + 1) + 24);
                  }
                  _Block_object_dispose(&buf, 8);
                  if (!v78)
                  {
                    v140 = [MEMORY[0x1E4F28B00] currentHandler];
                    v141 = [NSString stringWithUTF8String:"CFStringRef getkCTForegroundColorAttributeName(void)"];
                    objc_msgSend(v140, "handleFailureInFunction:file:lineNumber:description:", v141, @"WFWorkflowIconDrawer.m", 36, @"%s", dlerror());

                    __break(1u);
                  }
                  v198[1] = *v78;
                  uint64_t v57 = cp2x;
                  v199[1] = [v176 CGColor];
                  uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:2];
                  v157 = (void *)[v76 initWithString:v172 attributes:v81];

                  WFCTFramesetterCreateWithAttributedString((uint64_t)v157);
                  uint64_t v83 = (uint64_t)v82;
                  if (v82)
                  {
                    uint64_t v189 = MEMORY[0x1E4F143A8];
                    uint64_t v190 = 3221225472;
                    v191 = __WFDrawGlyphForIconCharacter_block_invoke_4;
                    v192 = &__block_descriptor_40_e5_v8__0l;
                    p_long long buf = v82;
                    v143 = (void (**)(void))_Block_copy(&v189);
                    WFCTFramesetterSuggestFrameSizeWithConstraints(v83, 0, v167);
                    CGFloat v153 = v84;
                    CGFloat v155 = v85;
                    if (v147)
                    {
                      v86 = getWFVoiceShortcutClientLogObject();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(buf) = 136315138;
                        *(void *)((char *)&buf + 4) = "WFDrawGlyphForIconCharacter";
                        _os_log_impl(&dword_1B3C5C000, v86, OS_LOG_TYPE_ERROR, "%s Warning: Drawing at a non-integral scale or stretching the glyph will not result in a perfectly positioned result", (uint8_t *)&buf, 0xCu);
                      }

                      v224.origin.double x = v42;
                      v224.origin.double y = v43;
                      v224.size.double width = v40;
                      v224.size.double height = v41;
                      double v163 = CGRectGetWidth(v224);
                      v225.origin.double x = 0.0;
                      v225.origin.double y = 0.0;
                      v225.size.double width = v153;
                      v225.size.double height = v155;
                      double v87 = CGRectGetWidth(v225);
                      v226.origin.double x = v42;
                      v226.origin.double y = v43;
                      v226.size.double width = v40;
                      v226.size.double height = v41;
                      double MinX = CGRectGetMinX(v226);
                      v227.origin.double x = 0.0;
                      v227.origin.double y = 0.0;
                      v227.size.double width = v153;
                      v227.size.double height = v155;
                      double v89 = CGRectGetMinX(v227);
                      v228.origin.double x = v42;
                      v228.origin.double y = v43;
                      v228.size.double width = v40;
                      v228.size.double height = v41;
                      double v90 = CGRectGetHeight(v228);
                      CGFloat v91 = (v163 - v87) * 0.5 + MinX - v89;
                      v229.origin.double y = 0.0;
                      v229.origin.double x = v91;
                      v229.size.double width = v153;
                      v229.size.double height = v155;
                      double v92 = CGRectGetHeight(v229);
                      v230.origin.double x = v42;
                      v230.origin.double y = v43;
                      v230.size.double width = v40;
                      v230.size.double height = v41;
                      double v93 = CGRectGetMinY(v230);
                      v231.origin.double y = 0.0;
                      v231.origin.double x = v91;
                      v231.size.double width = v153;
                      v231.size.double height = v155;
                      v232.origin.double y = (v90 - v92) * 0.5 + v93 - CGRectGetMinY(v231);
                      v232.origin.double x = v91;
                      v232.size.double width = v153;
                      v232.size.double height = v155;
                      CGPathRef v94 = CGPathCreateWithRect(v232, 0);
                      *(void *)&long long buf = MEMORY[0x1E4F143A8];
                      *((void *)&buf + 1) = 3221225472;
                      uint64_t v195 = (uint64_t)__WFDrawGlyphForIconCharacter_block_invoke_129;
                      v196 = &__block_descriptor_40_e5_v8__0l;
                      CGPathRef v197 = v94;
                      v95 = (void (**)(void))_Block_copy(&buf);
                      WFCTFramesetterCreateFrame(v83, 0, v167, (uint64_t)v94);
                      uint64_t v97 = v96;
                      uint64_t v179 = MEMORY[0x1E4F143A8];
                      uint64_t v180 = 3221225472;
                      v181 = __WFDrawGlyphForIconCharacter_block_invoke_2_130;
                      v182 = &__block_descriptor_40_e5_v8__0l;
                      uint64_t v183 = v96;
                      v98 = (void (**)(void))_Block_copy(&v179);
                      WFCTFrameDraw(v97, [v158 CGContext]);
                      v98[2](v98);

                      v95[2](v95);
                    }
                    else
                    {
                      unint64_t v99 = vcvtpd_u64_f64(v41 * 0.5);
                      double v100 = (double)(2 * v99);
                      unint64_t v101 = (unint64_t)v144 * (unint64_t)(ceil(v40) + v100);
                      unint64_t v102 = (unint64_t)v144 * (unint64_t)(ceil(v41) + v100);
                      size_t v164 = 4 * v101;
                      uint64_t size = 4 * v101 * v102;
                      v103 = (unsigned __int8 *)malloc_type_calloc(size, 1uLL, 0x33012F5AuLL);
                      DeviceRGB = CGColorSpaceCreateDeviceRGB();
                      v148 = v103;
                      v105 = CGBitmapContextCreate(v103, v101, v102, 8uLL, 4 * v101, DeviceRGB, 1u);
                      double v145 = (double)(unint64_t)v144;
                      CGContextScaleCTM(v105, v145, v145);
                      v233.origin.double x = (double)v99;
                      v233.origin.double y = (double)v99;
                      v233.size.double width = v40;
                      v233.size.double height = v41;
                      double v106 = CGRectGetWidth(v233);
                      v234.origin.double x = 0.0;
                      v234.origin.double y = 0.0;
                      v234.size.double width = v153;
                      v234.size.double height = v155;
                      double v107 = CGRectGetWidth(v234);
                      v235.origin.double x = (double)v99;
                      v235.origin.double y = (double)v99;
                      v235.size.double width = v40;
                      v235.size.double height = v41;
                      CGFloat v108 = (v106 - v107) * 0.5 + CGRectGetMinX(v235);
                      v236.origin.double x = v108;
                      v236.origin.double y = (double)v99;
                      v236.size.double width = v40;
                      v236.size.double height = v41;
                      double v109 = CGRectGetWidth(v236);
                      v237.origin.double x = 0.0;
                      v237.origin.double y = 0.0;
                      v237.size.double width = v153;
                      v237.size.double height = v155;
                      double v110 = CGRectGetHeight(v237);
                      v238.origin.double x = v108;
                      v238.origin.double y = (double)v99;
                      v238.size.double width = v40;
                      v238.size.double height = v41;
                      v239.origin.double y = (v109 - v110) * 0.5 + CGRectGetMinY(v238);
                      v239.origin.double x = v108;
                      v239.size.double width = v40;
                      v239.size.double height = v41;
                      CGPathRef v111 = CGPathCreateWithRect(v239, 0);
                      *(void *)&long long buf = MEMORY[0x1E4F143A8];
                      *((void *)&buf + 1) = 3221225472;
                      uint64_t v195 = (uint64_t)__WFDrawGlyphForIconCharacter_block_invoke_3_131;
                      v196 = &__block_descriptor_40_e5_v8__0l;
                      CGPathRef v197 = v111;
                      v154 = (void (**)(void))_Block_copy(&buf);
                      WFCTFramesetterCreateFrame(v83, 0, v167, (uint64_t)v111);
                      uint64_t v113 = v112;
                      uint64_t v179 = MEMORY[0x1E4F143A8];
                      uint64_t v180 = 3221225472;
                      v181 = __WFDrawGlyphForIconCharacter_block_invoke_4_132;
                      v182 = &__block_descriptor_40_e5_v8__0l;
                      uint64_t v183 = v112;
                      v156 = (void (**)(void))_Block_copy(&v179);
                      WFCTFrameDraw(v113, (uint64_t)v105);
                      CGContextRelease(v105);
                      CFAllocatorRef v114 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
                      v115 = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v102);
                      CFBitVectorSetCount(v115, v102);
                      CFBitVectorSetAllBits(v115, 0);
                      space = DeviceRGB;
                      v116 = CFBitVectorCreateMutable(v114, v101);
                      CFBitVectorSetCount(v116, v101);
                      CFBitVectorSetAllBits(v116, 0);
                      unint64_t v168 = v102;
                      if (v102)
                      {
                        CFIndex v117 = 0;
                        v118 = v148;
                        do
                        {
                          if (v101)
                          {
                            CFIndex v119 = 0;
                            v120 = v118;
                            do
                            {
                              int v121 = *v120;
                              v120 += 4;
                              if (v121)
                              {
                                CFBitVectorSetBitAtIndex(v115, v117, 1u);
                                CFBitVectorSetBitAtIndex(v116, v119, 1u);
                              }
                              ++v119;
                            }
                            while (v101 != v119);
                          }
                          ++v117;
                          v118 += v164;
                        }
                        while (v117 != v168);
                      }
                      v122 = CGDataProviderCreateWithData(0, v148, size, (CGDataProviderReleaseDataCallback)WFDrawGlyphFreeCallback);
                      v165 = CGImageCreate(v101, v168, 8uLL, 0x20uLL, v164, space, 1u, v122, 0, 0, kCGRenderingIntentDefault);
                      uint64_t v33 = v152;
                      CGDataProviderRelease(v122);
                      CGColorSpaceRelease(space);
                      v202.location = 0;
                      v202.length = v168;
                      CFIndex FirstIndexOfBit = CFBitVectorGetFirstIndexOfBit(v115, v202, 1u);
                      v203.location = 0;
                      v203.length = v168;
                      uint64_t v57 = cp2x;
                      CGColorSpaceRef spacea = (CGColorSpaceRef)CFBitVectorGetLastIndexOfBit(v115, v203, 1u);
                      v204.location = 0;
                      v204.length = v101;
                      CFIndex v149 = CFBitVectorGetFirstIndexOfBit(v116, v204, 1u);
                      v205.location = 0;
                      v205.length = v101;
                      CFIndex LastIndexOfBit = CFBitVectorGetLastIndexOfBit(v116, v205, 1u);
                      CFRelease(v115);
                      CFRelease(v116);
                      double v125 = (double)v101;
                      double v126 = (double)v168;
                      if (FirstIndexOfBit == -1) {
                        uint64_t v127 = 0;
                      }
                      else {
                        uint64_t v127 = FirstIndexOfBit;
                      }
                      double v128 = (double)v127;
                      uint64_t v129 = v149;
                      if (v149 == -1) {
                        uint64_t v129 = 0;
                      }
                      double v130 = (double)v129;
                      double v131 = v126 - (double)(uint64_t)spacea + -1.0;
                      if (spacea == (CGColorSpaceRef)-1) {
                        double v131 = 0.0;
                      }
                      double v132 = v125 - (double)LastIndexOfBit + -1.0;
                      if (LastIndexOfBit == -1) {
                        double v132 = 0.0;
                      }
                      v240.origin.double x = *MEMORY[0x1E4F1DAD8] + v130;
                      v240.origin.double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8) + v128;
                      v240.size.double width = v125 - (v132 + v130);
                      v240.size.double height = v126 - (v131 + v128);
                      v133 = CGImageCreateWithImageInRect(v165, v240);
                      CGImageRelease(v165);
                      v95 = v154;
                      v134 = [[WFImage alloc] initWithCGImage:v133 scale:1 orientation:v145];
                      [(WFImage *)v134 sizeInPoints];
                      double v136 = v135;
                      double v138 = v137;
                      CGImageRelease(v133);
                      v241.origin.double x = v42;
                      v241.origin.double y = v43;
                      v241.size.double width = v40;
                      v241.size.double height = v41;
                      double v139 = CGRectGetMinX(v241);
                      v242.origin.double x = v42;
                      v242.origin.double y = v43;
                      v242.size.double width = v40;
                      v242.size.double height = v41;
                      -[WFImage drawInContext:inRect:](v134, "drawInContext:inRect:", v158, round(((v40 - v136) * 0.5 + v139) * v145) / v145, round(((v41 - v138) * 0.5 + CGRectGetMinY(v242)) * v145) / v145, round(v136 * v145) / v145, round(v138 * v145) / v145);

                      v156[2](v156);
                      v95[2](v95);
                    }

                    v143[2](v143);
                  }

                  cp1x[2](cp1x);
                }
              }
              v161[2](v161);
            }
          }
          v57[2](v57);

          double v51 = 0;
        }
      }
      double v47 = 0;
    }
  }
  if ([(WFWorkflowIconDrawer *)self drawShadowBehindGlyph]) {
    CGContextRestoreGState(v10);
  }
  CGContextRestoreGState(v10);
}

- (WFColor)glyphColor
{
  glyphColor = self->_glyphColor;
  if (!glyphColor)
  {
    v4 = +[WFColor whiteColor];
    v5 = self->_glyphColor;
    self->_glyphColor = v4;

    glyphColor = self->_glyphColor;
  }
  return glyphColor;
}

- (WFWorkflowIconDrawer)initWithDrawerContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowIconDrawer;
  v5 = [(WFWorkflowIconDrawer *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (WFWorkflowIconDrawerContext *)v4;
    }
    else
    {
      v6 = +[WFWorkflowIconDrawerContext cachedContextOrNewContext];
    }
    drawerContext = v5->_drawerContext;
    v5->_drawerContext = v6;

    *(_WORD *)&v5->_drawGradient = 257;
    v5->_rounded = 1;
    double v8 = v5;
  }

  return v5;
}

- (WFWorkflowIconDrawer)init
{
  return [(WFWorkflowIconDrawer *)self initWithDrawerContext:0];
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  -[WFWorkflowIconDrawer setGlyphCharacter:](self, "setGlyphCharacter:", [v4 glyphCharacter]);
  id v5 = [v4 backgroundColor];

  [(WFWorkflowIconDrawer *)self setBackgroundColor:v5];
}

- (WFWorkflowIconDrawer)initWithIcon:(id)a3 drawerContext:(id)a4
{
  id v6 = a3;
  v7 = [(WFWorkflowIconDrawer *)self initWithDrawerContext:a4];
  double v8 = v7;
  if (v7)
  {
    [(WFWorkflowIconDrawer *)v7 setIcon:v6];
    id v9 = v8;
  }

  return v8;
}

- (WFWorkflowIconDrawer)initWithIcon:(id)a3
{
  return [(WFWorkflowIconDrawer *)self initWithIcon:a3 drawerContext:0];
}

+ (id)pngDataForImageWithIcon:(id)a3 size:(CGSize)a4
{
  id v4 = objc_msgSend(a1, "imageWithIcon:size:", a3, a4.width, a4.height);
  id v5 = [v4 PNGRepresentation];

  return v5;
}

+ (id)glyphImageWithIcon:(id)a3 size:(CGSize)a4
{
  id v4 = objc_msgSend(a1, "imageWithIcon:size:background:", a3, 0, a4.width, a4.height);
  id v5 = [v4 platformImage];

  return v5;
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 scale:(double)a5 padding:(CGSize)a6 glyphColor:(id)a7 background:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.height;
  double width = a6.width;
  double v12 = a4.height;
  double v13 = a4.width;
  id v16 = a7;
  id v17 = a3;
  BOOL v18 = (void *)[objc_alloc((Class)a1) initWithIcon:v17];

  [v18 setGlyphColor:v16];
  [v18 setDrawBackground:v8];
  BOOL v19 = objc_msgSend(v18, "imageWithSize:scale:padding:", v13, v12, a5, width, height);

  return v19;
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4 background:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  objc_super v10 = +[WFColor whiteColor];
  BOOL v11 = objc_msgSend(a1, "imageWithIcon:size:scale:padding:glyphColor:background:", v9, v10, v5, width, height, 0.0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v11;
}

+ (id)imageWithIcon:(id)a3 size:(CGSize)a4
{
  return (id)objc_msgSend(a1, "imageWithIcon:size:background:", a3, 1, a4.width, a4.height);
}

@end