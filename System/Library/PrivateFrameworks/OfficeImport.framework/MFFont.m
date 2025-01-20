@interface MFFont
+ (MFFont)fontWithExtendedFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24;
+ (MFFont)fontWithFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17;
+ (MFFont)fontWithStockFont:(int)a3;
- (BOOL)strikeout;
- (BOOL)underline;
- (CGRect)textExtent:(id)a3 options:(int)a4 in_spacingValues:(int *)a5 in_count:(int)a6;
- (MFFont)initWithAllFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24;
- (MFFont)initWithFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17;
- (MFFont)initWithStockFont:(int)a3;
- (double)escapement;
- (double)fontHeight;
- (id)faceName;
- (id)stringWithBytes:(const void *)a3 length:(unint64_t)a4;
- (int)getCharset;
- (int)selectInto:(id)a3;
@end

@implementation MFFont

+ (MFFont)fontWithStockFont:(int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithStockFont:*(void *)&a3];
  return (MFFont *)v3;
}

- (MFFont)initWithStockFont:(int)a3
{
  switch(a3)
  {
    case 10:
      v11 = @"Terminal";
      LODWORD(v10) = 48;
      uint64_t v9 = 0x100000002;
      BYTE12(v8) = 2;
      *(void *)((char *)&v8 + 4) = 0x1000000FFLL;
      LOWORD(v8) = 0;
      uint64_t v3 = 12;
      goto LABEL_11;
    case 11:
      v11 = @"Courier";
      LODWORD(v10) = 0;
      uint64_t v9 = 2;
      BYTE12(v8) = 2;
      goto LABEL_5;
    case 12:
      v11 = @"MS Sans Serif";
      LODWORD(v10) = 0;
      uint64_t v9 = 0x200000002;
      BYTE12(v8) = 2;
LABEL_5:
      *(void *)((char *)&v8 + 4) = 0;
      LOWORD(v8) = 0;
      uint64_t v3 = 12;
      uint64_t v4 = 9;
      goto LABEL_12;
    case 13:
      v11 = @"System";
      LODWORD(v10) = 32;
      uint64_t v9 = 0x200000002;
      BYTE12(v8) = 2;
      *(void *)((char *)&v8 + 4) = 0x100000000;
      goto LABEL_8;
    case 14:
      v11 = @"Helvetica";
      LODWORD(v10) = 0;
      uint64_t v9 = 0x200000002;
      BYTE12(v8) = 0;
      *(void *)((char *)&v8 + 4) = 0;
LABEL_8:
      LOWORD(v8) = 0;
      uint64_t v3 = 16;
      uint64_t v4 = 7;
      uint64_t v5 = 700;
      goto LABEL_13;
    case 16:
      v11 = @"Fixedsys";
      LODWORD(v10) = 48;
      uint64_t v9 = 0x100000002;
      BYTE12(v8) = 2;
      *(void *)((char *)&v8 + 4) = 0x100000000;
      LOWORD(v8) = 0;
      uint64_t v3 = 15;
LABEL_11:
      uint64_t v4 = 8;
      goto LABEL_12;
    default:
      v11 = @"MS Sans Serif";
      LODWORD(v10) = 0;
      uint64_t v9 = 0;
      BYTE12(v8) = 0;
      *(void *)((char *)&v8 + 4) = 0;
      LOWORD(v8) = 0;
      uint64_t v3 = 4294967285;
      uint64_t v4 = 0;
LABEL_12:
      uint64_t v5 = 400;
LABEL_13:
      v6 = -[MFFont initWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](self, "initWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", v3, v4, 0, 0, v5, 0, v8, v9, v10, v11);

      return v6;
  }
}

- (int)selectInto:(id)a3
{
  return 0;
}

- (id)stringWithBytes:(const void *)a3 length:(unint64_t)a4
{
  int v6 = [(MFFont *)self getCharset];
  if (v6 == 2) {
    operator new[]();
  }
  v7 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:OCNsStringEncodingForWindowsCharSet(v6)];
  return v7;
}

- (id)faceName
{
  return self->m_lfFaceName;
}

- (int)getCharset
{
  return self->m_lfCharSet;
}

- (double)escapement
{
  return (double)(self->m_lfEscapement % 3600) / 10.0;
}

- (BOOL)strikeout
{
  return self->m_lfStrikeOut;
}

- (BOOL)underline
{
  return self->m_lfUnderline;
}

- (double)fontHeight
{
  return (double)self->m_lfHeight;
}

- (MFFont)initWithAllFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24
{
  id v31 = a17;
  id v32 = a18;
  id v39 = a19;
  v40.receiver = self;
  v40.super_class = (Class)MFFont;
  v33 = [(MFFont *)&v40 init];
  v34 = v33;
  if (v33)
  {
    v33->m_lfHeight = a3;
    v33->m_lfWidth = a4;
    v33->m_lfEscapement = a5;
    v33->m_lfOrientation = a6;
    v33->m_lfWeight = a7;
    v33->m_lfItalic = a8;
    v33->m_lfUnderline = a9;
    v33->m_lfStrikeOut = a10;
    v33->m_lfCharSet = a11;
    v33->m_lfOutPrecision = a12;
    v33->m_lfClipPrecision = a13;
    v33->m_lfQuality = a14;
    v33->m_pitch = a15;
    v33->m_family = a16;
    v35 = [MEMORY[0x263F08708] controlCharacterSet];
    v36 = [v31 componentsSeparatedByCharactersInSet:v35];
    v37 = [v36 objectAtIndex:0];

    objc_storeStrong((id *)&v34->m_lfFaceName, v37);
    objc_storeStrong((id *)&v34->m_elfFullName, a18);
    objc_storeStrong((id *)&v34->m_elfStyle, a19);
    v34->m_elfVersion = a20;
    v34->m_elfStyleSize = a21;
    v34->m_elfMatch = a22;
    v34->m_elfVendorId = a23;
    id v31 = v37;
    v34->m_elfCulture = a24;
  }

  return v34;
}

- (MFFont)initWithFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  LODWORD(v21) = 0;
  LODWORD(v20) = a16;
  BYTE4(v19) = a13;
  HIDWORD(v18) = a11;
  LODWORD(v19) = a12;
  LOWORD(v18) = __PAIR16__(a10, a9);
  return -[MFFont initWithAllFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:](self, "initWithAllFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, a8, v18, v19, *(void *)&a14, v20, a17, 0, 0, 0, 0,
           v21);
}

+ (MFFont)fontWithFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  BOOL v30 = a8;
  id v18 = a17;
  LODWORD(v24) = 0;
  LODWORD(v23) = a16;
  BYTE4(v22) = a13;
  HIDWORD(v21) = a11;
  LODWORD(v22) = a12;
  LOWORD(v21) = __PAIR16__(a10, a9);
  uint64_t v19 = objc_msgSend(objc_alloc((Class)a1), "initWithAllFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", a3, a4, a5, a6, a7, v30, v21, v22, __PAIR64__(a15, a14), v23, v18, 0, 0, 0, 0,
                  v24);

  return (MFFont *)v19;
}

+ (MFFont)fontWithExtendedFeatures:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24
{
  BOOL v39 = a8;
  id v25 = a17;
  id v26 = a18;
  id v27 = a19;
  LODWORD(v33) = a24;
  LODWORD(v32) = a16;
  BYTE4(v31) = a13;
  HIDWORD(v30) = a11;
  LODWORD(v31) = a12;
  LOWORD(v30) = __PAIR16__(a10, a9);
  v28 = objc_msgSend(objc_alloc((Class)a1), "initWithAllFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", a3, a4, a5, a6, a7, v39, v30, v31, __PAIR64__(a15, a14), v32, v25, v26, v27, __PAIR64__(a21, a20), __PAIR64__(a23, a22),
                  v33);

  return (MFFont *)v28;
}

- (CGRect)textExtent:(id)a3 options:(int)a4 in_spacingValues:(int *)a5 in_count:(int)a6
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_elfStyle, 0);
  objc_storeStrong((id *)&self->m_elfFullName, 0);
  objc_storeStrong((id *)&self->m_lfFaceName, 0);
}

@end