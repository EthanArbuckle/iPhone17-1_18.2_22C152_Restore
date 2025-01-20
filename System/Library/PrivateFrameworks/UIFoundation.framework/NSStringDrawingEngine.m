@interface NSStringDrawingEngine
@end

@implementation NSStringDrawingEngine

Class ____NSStringDrawingEngine_block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSStringDrawingDefaultRenderers");
  if (v0)
  {
    v1 = (void *)v0;
    if (objc_opt_respondsToSelector()) {
      __NSStringDrawingDefaultRendererConfiguration = [v1 integerValue];
    }
  }
  Class result = NSClassFromString((NSString *)@"NSProFont");
  if (result) {
    __NSStringDrawingDefaultRendererConfiguration &= 0xFFFFFFFFFFFFFFFCLL;
  }
  return result;
}

uint64_t ____NSStringDrawingEngine_block_invoke_2()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSDefaultTighteningFactor");
  if (result)
  {
    v1 = (void *)result;
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = [v1 doubleValue];
      __NSStringDrawingEngine__factor = v2;
    }
  }
  return result;
}

uint64_t ____NSStringDrawingEngine_block_invoke_374(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == *(void *)(a1 + 80))
  {
    v5 = [_NSCachedAttributedString alloc];
    if (*(unsigned char *)(a1 + 192) && *(void *)(a1 + 88) != *(void *)(a1 + 96)) {
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "substringToIndex:");
    }
    else {
      uint64_t v6 = *(void *)(a1 + 32);
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [(_NSCachedAttributedString *)v5 initWithString:v6 attributes:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else if (*(unsigned char *)(a1 + 192) && *(void *)(a1 + 88) != *(void *)(a1 + 96))
  {
    uint64_t v4 = [*(id *)(a1 + 32) attributedSubstringFromRange:0];
  }
  v7 = objc_msgSend(a2, "textContainerForAttributedString:containerSize:lineFragmentPadding:", v4, *(double *)(a1 + 104), *(double *)(a1 + 112), 0.0);
  objc_msgSend(v7, "setMaximumNumberOfLines:", objc_msgSend(*(id *)(a1 + 48), "maximumNumberOfLines"));
  [v7 setLineBreakMode:4 * *(unsigned __int8 *)(a1 + 193)];
  [a2 _setBaselineMode:*(unsigned __int8 *)(a1 + 192)];
  if (*(unsigned char *)(a1 + 193)) {
    uint64_t v8 = [*(id *)(a1 + 48) wrapsForTruncationMode];
  }
  else {
    uint64_t v8 = 0;
  }
  [a2 _setForceWordWrapping:v8];
  [a2 _setBaselineDelta:0.0];
  [a2 _setWrappedByCluster:0];
  [a2 setDefaultTighteningFactor:*(double *)(a1 + 120)];
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setDrawsUnderlinesLikeWebKit:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setDrawsDebugBaselines:", *(unsigned __int8 *)(a1 + 194));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setSynchronizesAlignmentToDirection:", *(unsigned __int8 *)(a1 + 195));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setMirrorsTextAlignment:", *(unsigned __int8 *)(a1 + 196));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setForcesTrackingFloor:", *(unsigned __int8 *)(a1 + 197));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setUsesFontLeading:", *(unsigned __int8 *)(a1 + 198));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setDelegate:", *(void *)(a1 + 48));
  objc_msgSend(a2, "_setUsesSimpleTextEffects:", objc_msgSend(*(id *)(a1 + 48), "usesSimpleTextEffects"));
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setStyleEffectConfiguration:", objc_msgSend(*(id *)(a1 + 48), "cuiStyleEffects"));
  objc_msgSend(a2, "setCuiCatalog:", objc_msgSend(*(id *)(a1 + 48), "cuiCatalog"));
  [a2 _setApplicationFrameworkContext:*(void *)(a1 + 128)];
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setApplicationFrameworkContext:", *(void *)(a1 + 128));
  v9 = (CGContext *)[*(id *)(a1 + 56) CGContext];
  if (v9)
  {
    if (*(unsigned char *)(a1 + 199))
    {
LABEL_15:
      int v10 = 0;
      goto LABEL_27;
    }
    uint64_t v11 = [a2 length];
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      v13 = (void *)[v12 objectForKey:@"NSShadow"];
      if (!v13
        || (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", @"NSUnderline"), "intValue") <= 0)
      {
        goto LABEL_15;
      }
    }
    else
    {
      long long v48 = xmmword_18E5F72A0;
      v13 = objc_msgSend(a2, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSShadow", 0, &v48, 0, v11);
      int v14 = 0;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      if (v48 == __PAIR128__(v11, 0))
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = ____NSStringDrawingEngine_block_invoke_2_375;
        v43[3] = &unk_1E55C6630;
        v43[4] = &v44;
        objc_msgSend(a2, "enumerateAttribute:inRange:options:usingBlock:", @"NSUnderline", 0, v11, 0, v43);
        int v14 = *((unsigned __int8 *)v45 + 24);
      }
      _Block_object_dispose(&v44, 8);
      if (!v14) {
        goto LABEL_15;
      }
    }
    objc_msgSend(a2, "removeAttribute:range:", @"NSShadow", 0, v11);
    [v13 applyToGraphicsContext:*(void *)(a1 + 56)];
    CGContextBeginTransparencyLayer(v9, 0);
    int v10 = 1;
LABEL_27:
    objc_msgSend(a2, "drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:", v7, *(void *)(a1 + 136), *(void *)(a1 + 96) - *(void *)(a1 + 136), v9, *(unsigned __int8 *)(a1 + 192), *(unsigned __int8 *)(a1 + 200), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176));
    if (!*(void *)(a1 + 48)) {
      goto LABEL_47;
    }
    goto LABEL_28;
  }
  int v10 = 0;
LABEL_28:
  if (*(unsigned char *)(a1 + 192))
  {
    [a2 _baselineDelta];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    double v17 = v16 - *(double *)(v15 + 56);
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    double v17 = 0.0;
  }
  *(void *)(v15 + 32) = 0;
  *(double *)(v15 + 40) = v17;
  [a2 usedRectForTextContainer:v7];
  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  *(void *)(v18 + 48) = v19;
  *(void *)(v18 + 56) = v20;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "extraLineFragmentRect");
    double height = v49.size.height;
    if (!CGRectIsEmpty(v49)) {
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
    }
                                                                              + 56)
                                                                  - height;
  }
  v22 = *(void **)(a1 + 48);
  if (v22)
  {
    if ([v22 wantsNumberOfLineFragments])
    {
      v23 = (void *)[a2 layoutManager];
      uint64_t v24 = [v23 glyphRangeForTextContainer:v7];
      uint64_t v25 = 0;
      unint64_t v27 = v24 + v26;
      if (v24 + v26)
      {
        v28 = 0;
        do
        {
          uint64_t v44 = 0;
          v45 = 0;
          [v23 lineFragmentRectForGlyphAtIndex:v28 effectiveRange:&v44];
          ++v25;
          v28 = (char *)v45 + v44;
        }
        while ((unint64_t)v45 + v44 < v27);
      }
      [*(id *)(a1 + 48) setNumberOfLineFragments:v25];
    }
    if ([*(id *)(a1 + 48) wantsBaselineOffset])
    {
      v29 = (void *)[a2 layoutManager];
      uint64_t v30 = [v29 glyphRangeForTextContainer:v7];
      unint64_t v32 = v30 + v31;
      uint64_t v33 = v30 + v31 - 1;
      [v29 lineFragmentRectForGlyphAtIndex:v33 effectiveRange:0];
      double v35 = v34;
      [v29 baselineOffsetForGlyphAtIndex:v33];
      *(double *)&long long v48 = v36;
      [*(id *)(a1 + 48) setBaselineOffset:v35 + v36];
      uint64_t v44 = 0;
      v45 = 0;
      [v29 lineFragmentRectForGlyphAtIndex:v30 effectiveRange:&v44];
      double v38 = v37;
      if (v32 <= (unint64_t)v45 + v44 || *(void *)(a1 + 88))
      {
        [v29 baselineOffsetForGlyphAtIndex:v30];
        *(double *)&long long v48 = v39;
      }
      else
      {
        v41 = (void *)[a2 attributesAtIndex:0 effectiveRange:0];
        uint64_t v42 = [v41 objectForKeyedSubscript:@"NSParagraphStyle"];
        +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", v41, [NSString typesetterBehavior], *(unsigned __int8 *)(a1 + 198), v42 != 0, 0, 0, objc_msgSend(v7, "layoutOrientation"), 0, &v48, 0);
        double v39 = *(double *)&v48;
      }
      [*(id *)(a1 + 48) setFirstBaselineOffset:v38 + v39];
    }
    objc_msgSend(*(id *)(a1 + 48), "setTotalBounds:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56));
    if (*(void *)(a1 + 184)) {
      **(unsigned char **)(a1 + 184) = [a2 _wrappedByCluster];
    }
  }
LABEL_47:
  [v7 setLineBreakMode:0];
  [a2 setDefaultTighteningFactor:0.0];
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setSynchronizesAlignmentToDirection:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "_setMirrorsTextAlignment:", 0);
  objc_msgSend((id)objc_msgSend(a2, "layoutManager"), "setDelegate:", 0);
  if (v10) {
    CGContextEndTransparencyLayer(v9);
  }
  return 0;
}

uint64_t ____NSStringDrawingEngine_block_invoke_2_375(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 intValue];
  if ((int)result >= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

@end