@interface NSString(UIStringDrawingLegacy)
- (double)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:truncationRect:;
- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy;
- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:letterSpacing:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:includeEmoji:;
- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy withFont:;
- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:;
- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:;
- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:;
- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:;
- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:;
- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:;
- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:;
- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:lineSpacing:;
- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:;
- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy minFontSize:actualFontSize:forWidth:lineBreakMode:;
@end

@implementation NSString(UIStringDrawingLegacy)

- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy
{
  v6[1] = *MEMORY[0x1E4F143B8];
  double result = *MEMORY[0x1E4F1DB30];
  if (*MEMORY[0x1E4F1DB30] >= 0.0)
  {
    if (a3)
    {
      uint64_t v5 = *(void *)off_1E52D2040;
      v6[0] = a3;
      objc_msgSend(a1, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1, result));
      return ceil(v4);
    }
  }
  return result;
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:lineSpacing:", a3, a4, 0);
}

- (double)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:letterSpacing:
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a6)
  {
    id v13 = objc_alloc_init((Class)off_1E52D2D48);
    [v13 setLineBreakMode:UILineBreakToNSLineBreakStyleSingleLineVariant[a6]];
    [v11 setObject:v13 forKey:*(void *)off_1E52D21B8];
  }
  if (a5) {
    [v11 setObject:a5 forKey:*(void *)off_1E52D2040];
  }
  if (a3 != 0.0)
  {
    *(float *)&double v12 = a3;
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v12), *(void *)off_1E52D20C8);
  }
  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, a2, 3.40282347e38);
  double v15 = v14;

  if (v15 - a2 >= 0.0001) {
    double v16 = a2;
  }
  else {
    double v16 = v15;
  }
  return ceil(v16);
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy forWidth:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:forWidth:lineBreakMode:letterSpacing:", a3, 0.0);
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:lineBreakMode:lineSpacing:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (a2 >= 0.0 && a5)
  {
    double v12 = (__CFString *)result;
    id v13 = objc_alloc_init((Class)off_1E52D2E48);
    [v13 setWrapsForTruncationMode:1];
    [v13 setMaximumNumberOfLines:0];
    id v14 = objc_alloc_init((Class)off_1E52D2D48);
    [v14 setLineBreakMode:a6];
    if (a7)
    {
      [v14 setMinimumLineHeight:(double)a7];
      [v14 setMaximumLineHeight:(double)a7];
    }
    [a5 lineHeight];
    *(float *)&double v16 = v16;
    float v15 = a3;
    double v17 = fmaxf(v15, *(float *)&v16);
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (!v12) {
      double v12 = &stru_1ED0E84C0;
    }
    uint64_t v19 = *(void *)off_1E52D2040;
    v20[0] = *(void *)off_1E52D21B8;
    v20[1] = v19;
    v21[0] = v14;
    v21[1] = a5;
    return objc_msgSend((id)objc_msgSend(v18, "initWithString:attributes:", v12, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2)), "boundingRectWithSize:options:context:", 65, v13, a2, v17);
  }
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy withFont:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, 0, 1, a4, a5, 3.40282347e38, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, a4, 1, a5, a6, a7, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", a3, a4, 1);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:
{
  if (a4 >= 0.0 && a7)
  {
    id v14 = (__CFString *)result;
    float v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    id v16 = objc_alloc_init((Class)off_1E52D2E48);
    [v16 setMaximumNumberOfLines:1];
    id v17 = objc_alloc_init((Class)off_1E52D2D48);
    [v17 setLineBreakMode:UILineBreakToNSLineBreakStyleSingleLineVariant[a8]];
    [v17 setAlignment:0];
    [v15 setObject:v17 forKey:*(void *)off_1E52D21B8];

    [v15 setObject:a7 forKey:*(void *)off_1E52D2040];
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack >= 1)
    {
      if (ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1])
      {
        v20 = +[UIColor colorWithCGColor:CGContextGetFillColorAsColor()];
        if (v20) {
          [v15 setObject:v20 forKey:*(void *)off_1E52D2048];
        }
      }
    }
    if (a5 != 0.0)
    {
      *(float *)&double v19 = a5;
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v19), *(void *)off_1E52D20C8);
    }
    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v14) {
      v22 = v14;
    }
    else {
      v22 = &stru_1ED0E84C0;
    }
    id v23 = (id)[v21 initWithString:v22 attributes:v15];
    [a7 ascender];
    objc_msgSend(v23, "drawWithRect:options:context:", 64, v16, a2, a3 + v24, a4, 0.0);
    return [v16 totalBounds];
  }
  return result;
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy constrainedToSize:
{
  return objc_msgSend(a1, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:lineSpacing:", a3, 4, 0);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, 0, 0, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, 0, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, a5, 0, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:", a3, a4, a5, a6, 1);
}

- (uint64_t)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:
{
  return objc_msgSend(a1, "_legacy_drawInRect:withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:truncationRect:", a3, a4, a5, a6, a7, 0);
}

- (double)_legacy_drawInRect:()UIStringDrawingLegacy withFont:lineBreakMode:alignment:lineSpacing:includeEmoji:truncationRect:
{
  id v19 = objc_alloc_init((Class)off_1E52D2E48);
  [v19 setWrapsForTruncationMode:1];
  [v19 setMaximumNumberOfLines:0];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v21 = objc_alloc_init((Class)off_1E52D2D48);
  [v21 setLineBreakMode:UILineBreakToNSLineBreakStyleSingleLineVariant[a8]];
  if (a10)
  {
    if (!v21) {
      id v21 = objc_alloc_init((Class)off_1E52D2D48);
    }
    [v21 setMinimumLineHeight:(double)a10];
    [v21 setMaximumLineHeight:(double)a10];
  }
  BOOL v22 = +[UIView _enableRTL];
  uint64_t v23 = 4;
  if (!v22) {
    uint64_t v23 = 0;
  }
  if (v23 != a9)
  {
    if (!v21) {
      id v21 = objc_alloc_init((Class)off_1E52D2D48);
    }
    [v21 setAlignment:UITextAlignmentToNSTextAlignment[a9]];
  }
  [v20 setObject:v21 forKey:*(void *)off_1E52D21B8];
  if (a7) {
    [v20 setObject:a7 forKey:*(void *)off_1E52D2040];
  }
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack >= 1)
  {
    if (ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1])
    {
      v25 = +[UIColor colorWithCGColor:CGContextGetFillColorAsColor()];
      if (v25) {
        [v20 setObject:v25 forKey:*(void *)off_1E52D2048];
      }
    }
  }
  [a7 lineHeight];
  *(float *)&double v27 = v27;
  float v26 = a5;
  double v28 = fmaxf(v26, *(float *)&v27);
  id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (a1) {
    v30 = a1;
  }
  else {
    v30 = &stru_1ED0E84C0;
  }
  objc_msgSend((id)objc_msgSend(v29, "initWithString:attributes:", v30, v20), "drawWithRect:options:context:", 65, v19, a2, a3, a4, v28);
  [v19 totalBounds];
  return v31;
}

- (uint64_t)_legacy_sizeWithFont:()UIStringDrawingLegacy minFontSize:actualFontSize:forWidth:lineBreakMode:
{
  if (a5)
  {
    double v12 = (void *)result;
    [a5 pointSize];
    double v14 = v13;
    uint64_t v15 = *(void *)off_1E52D2040;
    double result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a5, *(void *)off_1E52D2040));
    if (v16 <= 0.0)
    {
      if (a6) {
        *a6 = 0.0;
      }
    }
    else
    {
      double v17 = round(v14 * (a3 / v16) + v14 * (a3 / v16)) * 0.5;
      double v18 = a2;
      if (v17 >= a2)
      {
        double v18 = v17;
        if (v17 > v14) {
          double v18 = v14;
        }
      }
      id v19 = a5;
      for (double i = v18; ; double i = v23)
      {
        id v21 = (void *)[v19 fontWithSize:i];
        double result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v21, v15));
        double v23 = round(v18 + 0.5 + v18 + 0.5) * 0.5;
        if (v22 >= a3 || v23 > v14) {
          break;
        }
        double v18 = v23;
        id v19 = v21;
      }
      BOOL v25 = v22 <= a3;
      for (double j = round(v18 + -0.5 + v18 + -0.5); ; double j = round(v18 + -0.5 + v18 + -0.5))
      {
        double v27 = j * 0.5;
        if (v25 || v27 < a2) {
          break;
        }
        double v18 = v27;
        id v21 = (void *)[v21 fontWithSize:v27];
        double result = objc_msgSend(v12, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v21, v15));
        BOOL v25 = v22 <= a3;
      }
      if (a6) {
        *a6 = v18;
      }
      if (v22 > a3)
      {
        id v29 = objc_alloc_init((Class)off_1E52D2D48);
        [v29 setLineBreakMode:UILineBreakToNSLineBreakStyleSingleLineVariant[a7]];
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v29, *(void *)off_1E52D21B8, v21, v15, 0);

        return objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 0, v30, 0, a3, 3.40282347e38);
      }
    }
  }
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:
{
  [a7 pointSize];
  id v19 = a7;
  if (v20 != a5) {
    id v19 = (void *)[a7 fontWithSize:a5];
  }
  if (a9 == 1)
  {
    [a7 ascender];
    double v26 = v25;
    [v19 ascender];
    double v28 = v27;
    [a7 capHeight];
    double v30 = v29;
    [v19 capHeight];
    double v24 = round(v26 - v30 * 0.5 - (v28 - v31 * 0.5));
  }
  else
  {
    if (a9) {
      goto LABEL_8;
    }
    [a7 ascender];
    double v22 = v21;
    [v19 ascender];
    double v24 = v22 - v23;
  }
  a3 = a3 + v24;
LABEL_8:
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:includeEmoji:", v19, a8, a10, a2, a3, a4, 0.0);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a3, a4, a5, 1);
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:includeEmoji:
{
  double v21 = 0.0;
  objc_msgSend(a1, "_legacy_sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:", a7, &v21, a5, a4);
  uint64_t result = objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:fontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a7, a9, a10, a11, a2, a3, a4, v21);
  if (a8) {
    *a8 = v21;
  }
  return result;
}

- (uint64_t)_legacy_drawAtPoint:()UIStringDrawingLegacy forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:
{
  return objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:minFontSize:actualFontSize:lineBreakMode:baselineAdjustment:includeEmoji:", a3, a4, a5, a6, 1);
}

@end