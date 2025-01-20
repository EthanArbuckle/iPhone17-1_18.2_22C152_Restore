@interface _UIFieldEditorLayoutManager
- (CGRect)_boundingBoxForBulletAtCharIndex:(int64_t)a3 inUnobscuredRange:(_NSRange)a4;
- (int64_t)_generateBulletGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7 unobscuredRange:(_NSRange)a8;
- (void)_completeBulletRenderingForTextContainer:(id)a3;
- (void)resetFontForExtraBulletRendering;
- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)c;
- (void)useFontForExtraBulletRendering:(id)a3;
@end

@implementation _UIFieldEditorLayoutManager

- (void)useFontForExtraBulletRendering:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_fontForExtraBulletRendering, a3);
    id v5 = v6;
  }
}

- (void)resetFontForExtraBulletRendering
{
  fontForExtraBulletRendering = self->_fontForExtraBulletRendering;
  self->_fontForExtraBulletRendering = 0;
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)c
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a6;
  id v15 = a8;
  v16 = self->_fontForExtraBulletRendering;
  if (a5 >= 1)
  {
    unint64_t v17 = 0;
    uint64_t v35 = 0;
    v18 = &a3[a5];
    memset(__b, 0, sizeof(__b));
    v19 = &classRef__UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
    v20 = a3;
    v28 = v18;
    do
    {
      if (a3 == v18 && v20 < a3 || v16 && a3 < v18 && !*a3)
      {
        if (v20 < a3)
        {
          int64_t v21 = (char *)a3 - (char *)v20;
          v22 = (objc_class *)v19[208];
          v33.receiver = self;
          v33.super_class = v22;
          long long v23 = *(_OWORD *)&a7->c;
          long long __pattern4 = *(_OWORD *)&a7->a;
          long long v31 = v23;
          long long v32 = *(_OWORD *)&a7->tx;
          -[_UIFieldEditorLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v33, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, c);
          v19 = &classRef__UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
          v18 = v28;
          a4 = (const CGPoint *)((char *)a4 + 8 * v21);
        }
        ++v17;
        v20 = ++a3;
      }
      else
      {
        if (v17)
        {
          v27 = v20;
          if (!LOWORD(__b[0]))
          {
            LOWORD(__pattern4) = [(UIFont *)v16 _bulletGlyph];
            WORD1(__pattern4) = __pattern4;
            memset_pattern4(__b, &__pattern4, 0xC8uLL);
          }
          CGContextSaveGState(c);
          [(UIFont *)v16 setInContext:c];
          do
          {
            if (v17 >= 0x64) {
              uint64_t v24 = 100;
            }
            else {
              uint64_t v24 = v17;
            }
            v29.receiver = self;
            v29.super_class = (Class)_UIFieldEditorLayoutManager;
            long long v25 = *(_OWORD *)&a7->c;
            long long __pattern4 = *(_OWORD *)&a7->a;
            long long v31 = v25;
            long long v32 = *(_OWORD *)&a7->tx;
            [(_UIFieldEditorLayoutManager *)&v29 showCGGlyphs:__b positions:a4 count:v24 font:v16 textMatrix:&__pattern4 attributes:v15 inContext:c];
            a4 += v24;
            v17 -= v24;
          }
          while (v17);
          CGContextRestoreGState(c);
          v19 = &classRef__UICollectionTableIndexOverlaySelectionViewCollectionViewCell;
          v18 = v28;
          v20 = v27;
        }
        unint64_t v17 = 0;
        ++a3;
      }
    }
    while (a3 <= v18);
  }
}

- (int64_t)_generateBulletGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7 unobscuredRange:(_NSRange)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  if (a8.location == *a5 && a8.length == a5[length - 1] - *a5 + 1)
  {
    int64_t v31 = 0;
  }
  else
  {
    uint64_t v35 = self;
    v16 = [(_UIFieldEditorLayoutManager *)self textStorage];
    uint64_t v17 = [v16 attribute:*(void *)off_1E52D21A0 atIndex:*a5 effectiveRange:0];

    id v36 = v14;
    id v37 = 0;
    objc_super v33 = (void *)v17;
    __int16 v18 = [v14 _bulletGlyphWithOriginalFont:v17 fontForBulletRendering:&v37];
    id v19 = v37;
    NSUInteger v34 = length;
    NSUInteger v20 = location + length;
    while (location < v20)
    {
      if (v20 - location >= 0x64) {
        uint64_t v21 = 100;
      }
      else {
        uint64_t v21 = v20 - location;
      }
      __memcpy_chk();
      if (v21)
      {
        v22 = (__int16 *)v39;
        long long v23 = (uint64_t *)v38;
        uint64_t v24 = a3;
        long long v25 = a5;
        for (uint64_t i = v21; i; --i)
        {
          __int16 v28 = *v24++;
          __int16 v27 = v28;
          uint64_t v29 = *v23;
          if ((*v23 & 1) == 0)
          {
            if ((v29 & 8) != 0)
            {
              __int16 v27 = 0;
              uint64_t v30 = 1;
            }
            else
            {
              if (*v25 >= a8.location && *v25 - a8.location < a8.length) {
                goto LABEL_19;
              }
              __int16 v27 = v18;
              if (!v19) {
                goto LABEL_19;
              }
              __int16 v27 = -1;
              uint64_t v30 = 2;
            }
            *long long v23 = v30 | v29;
          }
LABEL_19:
          *v22++ = v27;
          ++v25;
          ++v23;
        }
      }
      -[_UIFieldEditorLayoutManager setGlyphs:properties:characterIndexes:font:forGlyphRange:](v35, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v39, v38, a5, v36, location, v21);
      a3 += v21;
      a4 += v21;
      location += v21;
      a5 += v21;
    }
    [(_UIFieldEditorLayoutManager *)v35 useFontForExtraBulletRendering:v19];

    int64_t v31 = v34;
    id v14 = v36;
  }

  return v31;
}

- (CGRect)_boundingBoxForBulletAtCharIndex:(int64_t)a3 inUnobscuredRange:(_NSRange)a4
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  long long v12 = *MEMORY[0x1E4F1DB28];
  CGSize v13 = v4;
  if (a3 < a4.location || a3 - a4.location >= a4.length)
  {
    fontForExtraBulletRendering = self->_fontForExtraBulletRendering;
    if (fontForExtraBulletRendering)
    {
      id v6 = fontForExtraBulletRendering;
      CGGlyph glyphs = [(UIFont *)v6 _bulletGlyph];
      CTFontGetAdvancesForGlyphs((CTFontRef)v6, kCTFontOrientationDefault, &glyphs, &v13, 1);
    }
  }
  double v8 = *((double *)&v12 + 1);
  double v7 = *(double *)&v12;
  double height = v13.height;
  double width = v13.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_completeBulletRenderingForTextContainer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_fontForExtraBulletRendering)
  {
    unint64_t v4 = [(_UIFieldEditorLayoutManager *)self glyphRangeForTextContainer:a3];
    unint64_t v16 = v4 + v5;
    if (v4 < v4 + v5)
    {
      unint64_t v6 = v4;
      if (v5 >= 0x64) {
        uint64_t v7 = 100;
      }
      else {
        uint64_t v7 = v5;
      }
      do
      {
        -[_UIFieldEditorLayoutManager getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:](self, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v6, v7, 0, v19, v18, 0, v16);
        uint64_t v17 = v7;
        if (v7)
        {
          double v8 = v18;
          v9 = v19;
          unint64_t v10 = v6;
          do
          {
            char v11 = *v9;
            v9 += 8;
            if ((v11 & 2) != 0)
            {
              long long v12 = [MEMORY[0x1E4F28B88] controlCharacterSet];
              CGSize v13 = [(_UIFieldEditorLayoutManager *)self textStorage];
              id v14 = [v13 string];
              char v15 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", *v8));

              if ((v15 & 1) == 0) {
                [(_UIFieldEditorLayoutManager *)self setNotShownAttribute:0 forGlyphAtIndex:v10];
              }
            }
            ++v10;
            ++v8;
            --v7;
          }
          while (v7);
        }
        v6 += v17;
        if (v16 - v6 >= 0x64) {
          uint64_t v7 = 100;
        }
        else {
          uint64_t v7 = v16 - v6;
        }
      }
      while (v16 > v6);
    }
  }
}

- (void).cxx_destruct
{
}

@end