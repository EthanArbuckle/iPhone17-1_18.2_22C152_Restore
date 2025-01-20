@interface UIFont(SecureTextEntry)
- (__CFString)_ui_bulletStringWithFont:()SecureTextEntry;
- (uint64_t)_bulletGlyph;
- (uint64_t)_bulletGlyphWithOriginalFont:()SecureTextEntry fontForBulletRendering:;
@end

@implementation UIFont(SecureTextEntry)

- (__CFString)_ui_bulletStringWithFont:()SecureTextEntry
{
  BOOL GlyphsForCharacters = CTFontGetGlyphsForCharacters(a1, kBullets, &glyphs, 2);
  if (glyphs) {
    int v6 = 1;
  }
  else {
    int v6 = GlyphsForCharacters;
  }
  int v7 = v16;
  if (v16) {
    v8 = @"⦁";
  }
  else {
    v8 = 0;
  }
  if (v6) {
    v8 = @"";
  }
  v9 = v8;
  if (a3)
  {
    if (v7) {
      char v10 = 1;
    }
    else {
      char v10 = v6;
    }
    if (v10)
    {
      v11 = a1;
    }
    else
    {
      [(__CTFont *)a1 pointSize];
      objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
      v11 = (const __CTFont *)(id)objc_claimAutoreleasedReturnValue();
    }
    *a3 = v11;
  }
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"⦁";
  }
  v13 = v12;

  return v13;
}

- (uint64_t)_bulletGlyph
{
  return [a1 _bulletGlyphWithOriginalFont:0 fontForBulletRendering:0];
}

- (uint64_t)_bulletGlyphWithOriginalFont:()SecureTextEntry fontForBulletRendering:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  BOOL GlyphsForCharacters = CTFontGetGlyphsForCharacters(a1, kBullets, &glyphs, 5);
  if (glyphs) {
    int v8 = 1;
  }
  else {
    int v8 = GlyphsForCharacters;
  }
  int v9 = v23;
  char v10 = @"⦁";
  if (!v23) {
    char v10 = 0;
  }
  if (v8) {
    char v10 = @"";
  }
  v11 = v10;
  if (v6 && (!v8 ? (BOOL v12 = v9 == 0) : (BOOL v12 = 0), v12))
  {
    if (([(__CTFont *)a1 isEqual:v6] & 1) == 0 && ([(__CTFont *)a1 isEqual:v6] & 1) == 0)
    {
      BOOL v13 = CTFontGetGlyphsForCharacters(v6, kBullets, &glyphs, 5);
      if (glyphs) {
        char v14 = 1;
      }
      else {
        char v14 = v13;
      }
      if ((v14 & 1) != 0 || v23)
      {
        v17 = v6;
      }
      else
      {
        id v21 = 0;
        id v15 = (id)[(__CTFont *)a1 _ui_bulletStringWithFont:&v21];
        id v16 = v21;
        if (v16 && ([(__CTFont *)a1 isEqual:v16] & 1) == 0) {
          v17 = (const __CTFont *)v16;
        }
        else {
          v17 = 0;
        }
      }
      goto LABEL_26;
    }
  }
  else
  {
  }
  v17 = 0;
LABEL_26:
  if (a4) {
    *a4 = v17;
  }
  if (v17)
  {
    uint64_t v18 = glyphs;
  }
  else
  {
    uint64_t v20 = 0;
    while (1)
    {
      uint64_t v18 = *(CGGlyph *)((char *)&glyphs + v20);
      if (*(CGGlyph *)((char *)&glyphs + v20)) {
        break;
      }
      v20 += 2;
      if (v20 == 10)
      {
        uint64_t v18 = glyphs;
        if (!glyphs) {
          uint64_t v18 = 3;
        }
        break;
      }
    }
  }

  return v18;
}

@end