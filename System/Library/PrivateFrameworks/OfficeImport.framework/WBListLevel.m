@interface WBListLevel
+ (int)numberFormatEnumFor:(int)a3;
+ (void)readFrom:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5 document:(id)a6;
+ (void)write:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5;
@end

@implementation WBListLevel

+ (void)readFrom:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5 document:(id)a6
{
  id v23 = a3;
  id v9 = a4;
  id v10 = a6;
  var1 = a5->var1;
  v24 = v9;
  v12 = v9;
  id v13 = v10;
  v14 = [v12 paragraphProperties];
  +[WBParagraphProperties readFrom:v23 wrdProperties:var1 tracked:0 document:v10 properties:v14];

  v15 = [v24 characterProperties];
  +[WBCharacterProperties readFrom:v23 wrdProperties:a5->var2 tracked:0 document:v10 properties:v15];
  if ([v15 isListCharacterPictureBulletOverridden]
    && [v15 isListCharacterPictureBullet]
    && [v15 isCharPositionOfPictureBulletInBookmarkOverridden])
  {
    v16 = objc_msgSend(v10, "imageBulletWithCharacterOffset:", objc_msgSend(v15, "charPositionOfPictureBulletInBookmark"));
    [v24 setImage:v16];
  }
  [v24 setStartNumber:a5->var3];
  [v24 setNumberFormat:a5->var5];
  [v24 setRestartNumbering:(*((unsigned char *)a5 + 80) & 2) == 0];
  [v24 setLegal:*((unsigned char *)a5 + 80) & 1];
  v17 = (void *)MEMORY[0x23EC9A170]([v24 setSuffix:a5->var7]);
  CFStringRef v18 = CFStringCreateWithBytes(0, (const UInt8 *)a5->var12, 2 * a5->var11, 0x100u, 0);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v18);
  CFRelease(v18);
  for (unsigned int i = 0; [(__CFString *)MutableCopy length] > (unint64_t)i; ++i)
  {
    unsigned int v21 = [(__CFString *)MutableCopy characterAtIndex:i];
    if (v21 <= 8)
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%%%d", v21 + 1);
      -[__CFString replaceCharactersInRange:withString:](MutableCopy, "replaceCharactersInRange:withString:", i++, 1, v22);

      id v10 = v13;
    }
  }
  [v24 setText:MutableCopy];
  [v24 setLegacy:(*((unsigned __int8 *)a5 + 80) >> 4) & 1];
  [v24 setLegacySpace:a5->var9];
  [v24 setLegacyIndent:a5->var10];
  [v24 setJustification:a5->var6];
}

+ (void)write:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5
{
  id v8 = a3;
  id v9 = a4;
  a5->var3 = [v9 startNumber];
  a5->var5 = objc_msgSend(a1, "numberFormatEnumFor:", objc_msgSend(v9, "numberFormat"));
  if ([v9 restartNumbering]) {
    char v10 = 0;
  }
  else {
    char v10 = 2;
  }
  *((unsigned char *)a5 + 80) = *((unsigned char *)a5 + 80) & 0xFD | v10;
  *((unsigned char *)a5 + 80) = *((unsigned char *)a5 + 80) & 0xFE | [v9 legal];
  a5->var7 = [v9 suffix];
  v11 = (void *)MEMORY[0x23EC9A170]();
  *(void *)a5->var8 = 0;
  a5->var8[8] = 0;
  v12 = (void *)MEMORY[0x263F089D8];
  id v13 = [v9 text];
  v14 = [v12 stringWithString:v13];

  unsigned int v15 = 0;
  int v16 = 0;
  while ([v14 length] > (unint64_t)(v15 + 1))
  {
    __int16 v31 = 0;
    int v17 = [v14 characterAtIndex:v15];
    __int16 v31 = v17;
    if (v17 == 37)
    {
      int v18 = [v14 characterAtIndex:v15 + 1];
      __int16 v31 = v18 - 49;
      if ((v18 - 49) <= 8)
      {
        v19 = [NSString stringWithCharacters:&v31 length:1];
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v15, 2, v19);
        a5->var8[v16++] = v15 + 1;
      }
    }
    ++v15;
  }
  id v20 = [v14 dataUsingWordEncoding:1];
  uint64_t v21 = [v20 bytes];
  unint64_t v22 = [v20 length];
  WrdListLevelFormat::setNumberTextLength(a5, (unsigned __int16)(v22 >> 1));
  if (v22 >= 2)
  {
    uint64_t v23 = 0;
    uint64_t v24 = v22 >> 1;
    var12 = a5->var12;
    if (v22 >> 1 <= 1) {
      uint64_t v24 = 1;
    }
    do
    {
      var12[(unsigned __int16)v23] = *(_WORD *)(v21 + 2 * v23);
      ++v23;
    }
    while (v24 != v23);
  }

  a5->var6 = [v9 justification];
  v26 = [v9 characterProperties];
  +[WBCharacterProperties prepareForWriting:v8 properties:v26 wrdProperties:a5->var2 tracked:0];

  WrdCharacterProperties::setCharacterTypeIDHint(a5->var2, 0);
  v27 = [v9 paragraphProperties];
  var1 = a5->var1;
  v29 = [v9 paragraphProperties];
  v30 = [v29 document];
  +[WBParagraphProperties write:v8 properties:v27 wrdProperties:var1 tracked:0 document:v30];
}

+ (int)numberFormatEnumFor:(int)a3
{
  if (a3 == 60) {
    int v3 = 54;
  }
  else {
    int v3 = a3;
  }
  if (v3 == 61) {
    int v3 = 0;
  }
  if (v3 == 62) {
    int v3 = 0;
  }
  if (v3 == 63) {
    int v3 = 0;
  }
  if (v3 == 64) {
    int v3 = 0;
  }
  if (v3 == 65) {
    int v3 = 0;
  }
  if (v3 == 66) {
    int v3 = 0;
  }
  if (v3 == 67) {
    int v3 = 0;
  }
  if (v3 == 68) {
    int v3 = 0;
  }
  if (v3 == 69) {
    int v3 = 0;
  }
  if (v3 == 70) {
    int v3 = 0;
  }
  if (v3 == 71) {
    return 0;
  }
  else {
    return v3;
  }
}

@end