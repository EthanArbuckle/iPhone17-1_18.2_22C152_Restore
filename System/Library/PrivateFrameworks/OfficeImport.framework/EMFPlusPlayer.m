@interface EMFPlusPlayer
+ (float)firstTabPosPastPos:(float)a3 stringFormat:(id)a4 isExplicit:(BOOL *)a5;
+ (int)serializableObjectTypeForGUID:(id)a3;
- (EMFPlusPlayer)initWithOwner:(id)a3 canvas:(CGRect)a4;
- (id)canvasInWorldCoordinates;
- (id)effect;
- (int)play:(const char *)a3 in_size:(unsigned int)a4;
- (int)playBeginContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playBeginContainerNoParams:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playBlurEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playBrightnessContrastEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playBrush:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playClear:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playColorBalanceEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playColorCurveEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playColorLUTEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playColorMatrixEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playCustomLineCap:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playDrawArc:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawBeziers:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawDriverString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawImage:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawImagePoints:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawLines:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playDrawString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playEndContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillPath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6;
- (int)playFillPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillPolygon:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFillRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playFont:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playGetDC:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playGraphics:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playHeader:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playHueSaturationLightnessEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playImage:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playImageAttributes:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playLevelsEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playMultiplyWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playOffsetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playPath:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playPen:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playRecord:(int)a3 pData:(const char *)a4 dataSize:(unsigned int)a5 flags:(unsigned __int16)a6;
- (int)playRedEyeCorrectionEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playRegion:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playResetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playResetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playRestore:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playRotateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSave:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playScaleWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSerializableObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetAntiAliasMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetClipPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetClipRect:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetClipRegion:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetCompositingMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetCompositingQuality:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetInterpolationMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetPageTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetPixelOffsetMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetRenderingOrigin:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetTextContrast:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetTextRenderingHint:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playSharpenEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playStringFormat:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5;
- (int)playStrokePath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6;
- (int)playTintEffectWithData:(const char *)a3 size:(unsigned int)a4;
- (int)playTranslateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5;
- (int)playUnknown:(const char *)a3 in_size:(unsigned int)a4 in_type:(int)a5 in_flags:(unsigned __int16)a6;
- (int)readBrush:(const char *)a3 in_size:(unsigned int)a4 returnBrush:(id *)a5;
- (int)readGradientBrush:(id)a3 from:(const char *)a4 brushFlags:(unsigned int)a5 in_size:(unsigned int)a6;
- (int)readImage:(const char *)a3 in_size:(unsigned int)a4 pImage:(id *)a5;
- (int)readPath:(const char *)a3 in_size:(unsigned int)a4 returnPath:(id *)a5;
- (int)setClipPath:(id)a3 flags:(unsigned __int16)a4;
- (void)resetLargeRecord;
- (void)setEffect:(id)a3;
@end

@implementation EMFPlusPlayer

- (EMFPlusPlayer)initWithOwner:(id)a3 canvas:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMFPlusPlayer;
  v11 = [(EMFPlusPlayer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mOwner, a3);
    v13 = -[MFPGraphics initWithCanvas:]([MFPGraphics alloc], "initWithCanvas:", x, y, width, height);
    mGraphics = v12->mGraphics;
    v12->mGraphics = v13;

    v12->mLargeType = 0x4000;
    v15 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    mLargeData = v12->mLargeData;
    v12->mLargeData = v15;
  }
  return v12;
}

+ (int)serializableObjectTypeForGUID:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
  if (!+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap)
  {
    id v5 = objc_alloc(NSDictionary);
    v25 = [NSNumber numberWithInt:1];
    v6 = +[MFPBlurEffect GUID];
    v24 = [NSNumber numberWithInt:2];
    v23 = +[MFPSharpenEffect GUID];
    v33 = [NSNumber numberWithInt:3];
    v32 = +[MFPColorMatrixEffect GUID];
    v22 = [NSNumber numberWithInt:4];
    v21 = +[MFPColorLUTEffect GUID];
    v7 = [NSNumber numberWithInt:5];
    v31 = +[MFPBrightnessContrastEffect GUID];
    v30 = [NSNumber numberWithInt:6];
    v29 = +[MFPHueSaturationLightnessEffect GUID];
    v20 = [NSNumber numberWithInt:7];
    v19 = +[MFPLevelsEffect GUID];
    objc_super v18 = [NSNumber numberWithInt:8];
    v17 = +[MFPTintEffect GUID];
    v16 = [NSNumber numberWithInt:9];
    v28 = +[MFPColorBalanceEffect GUID];
    v27 = [NSNumber numberWithInt:10];
    v26 = +[MFPRedEyeCorrectionEffect GUID];
    v15 = [NSNumber numberWithInt:11];
    v8 = +[MFPColorCurveEffect GUID];
    uint64_t v9 = objc_msgSend(v5, "initWithObjectsAndKeys:", v25, v6, v24, v23, v33, v32, v22, v21, v7, v31, v30, v29, v20, v19, v18, v17, v16,
           v28,
           v27,
           v26,
           v15,
           v8,
           0);
    id v10 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
    +[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap = v9;

    v4 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
  }
  v11 = [v4 objectForKey:v3];
  v12 = v11;
  if (v11) {
    int v13 = [v11 intValue];
  }
  else {
    int v13 = 0;
  }

  return v13;
}

- (id)effect
{
  return self->mEffect;
}

- (void)setEffect:(id)a3
{
}

- (int)playUnknown:(const char *)a3 in_size:(unsigned int)a4 in_type:(int)a5 in_flags:(unsigned __int16)a6
{
  return 0;
}

- (int)playHeader:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  BOOL v7 = (a5 & 1) == 0;
  -[EMFPlayer setIgnoreEMFPlusRecords:](self->mOwner, "setIgnoreEMFPlusRecords:", a5 & 1, *(void *)&a4);
  [(EMFPlayer *)self->mOwner setIgnoreEMFRecords:v7];
  [(MFPGraphics *)self->mGraphics setHorizontalDpi:*((unsigned int *)a3 + 2) verticalDpi:*((unsigned int *)a3 + 3)];
  return 0;
}

- (int)readImage:(const char *)a3 in_size:(unsigned int)a4 pImage:(id *)a5
{
  *a5 = 0;
  unsigned int v5 = a4 - 8;
  if (a4 < 8) {
    return -7;
  }
  int v7 = *((_DWORD *)a3 + 1);
  if (v7 == 2)
  {
    if (v5 >= 8)
    {
      uint64_t v10 = a4 - 16;
      if (*((_DWORD *)a3 + 3) == v10)
      {
        v11 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 16 length:v10];
        *a5 = [[MFPMetafileImage alloc] initWithMetafileData:v11];

        return 0;
      }
    }
    return -7;
  }
  if (v7 != 1 || v5 < 0x14) {
    return -7;
  }
  int v8 = *((_DWORD *)a3 + 6);
  if (!v8) {
    return v8;
  }
  if (v8 != 1) {
    return -7;
  }
  if (*((_DWORD *)a3 + 2) | *((_DWORD *)a3 + 3) | *((_DWORD *)a3 + 4) | *((_DWORD *)a3 + 5)) {
    int v8 = -7;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 28 length:a4 - 28];
  *a5 = [[MFPBitmapImage alloc] initWithBitmapData:v9];

  return v8;
}

- (int)readPath:(const char *)a3 in_size:(unsigned int)a4 returnPath:(id *)a5
{
  if (a4 < 0xC) {
    return -7;
  }
  uint64_t v42 = v20;
  uint64_t v43 = v19;
  uint64_t v44 = v18;
  uint64_t v45 = v17;
  uint64_t v46 = v14;
  uint64_t v47 = v13;
  uint64_t v48 = v12;
  uint64_t v49 = v11;
  uint64_t v50 = v10;
  uint64_t v51 = v9;
  uint64_t v52 = v8;
  uint64_t v53 = v7;
  uint64_t v54 = v6;
  uint64_t v55 = v5;
  uint64_t v56 = v15;
  uint64_t v57 = v16;
  unsigned int v23 = *((_DWORD *)a3 + 1);
  __int16 v24 = *((unsigned __int8 *)a3 + 9);
  if ((v24 & 0x40) != 0) {
    char v25 = 2;
  }
  else {
    char v25 = 3;
  }
  if (v23 > a4) {
    return -7;
  }
  unsigned int v26 = v23 << v25;
  if (v23 + (v23 << v25) + 12 > a4) {
    return -7;
  }
  __int16 v28 = *((unsigned __int8 *)a3 + 8);
  *a5 = objc_alloc_init(OITSUBezierPath);
  if (v23)
  {
    unsigned int v29 = 0;
    __int16 v30 = v28 | (v24 << 8);
    v31 = (const unsigned __int8 *)(a3 + 12);
    if ((v24 & 0x40) != 0) {
      uint64_t v32 = 4;
    }
    else {
      uint64_t v32 = 8;
    }
    v33 = &v31[v26];
    do
    {
      signed __int8 v34 = v33[v29];
      int v35 = v34;
      double Point = readPoint(v31, v30);
      v31 += v32;
      switch(v34 & 7)
      {
        case 3:
          if (v34 < 0) {
            return -7;
          }
          if (v29 + 2 >= v23) {
            return -7;
          }
          readPoint(v31, v30);
          if ((v33[v29 + 1] & 0x87) != 3) {
            return -7;
          }
          v39 = &v31[v32];
          double v40 = readPoint(v39, v30);
          unsigned __int8 v41 = v33[v29 + 2];
          if ((v41 & 7) != 3) {
            return -7;
          }
          v31 = &v39[v32];
          objc_msgSend(*a5, "curveToPoint:controlPoint1:controlPoint2:", v40);
          int v38 = 3;
          if ((v41 & 0x80) != 0) {
            goto LABEL_27;
          }
          break;
        case 1:
          objc_msgSend(*a5, "lineToPoint:", Point, v37);
          break;
        case 0:
          if (v34 < 0) {
            return -7;
          }
          objc_msgSend(*a5, "moveToPoint:", Point, v37);
          int v38 = 1;
          break;
        default:
          int v38 = 1;
          if (v35 < 0) {
LABEL_27:
          }
            objc_msgSend(*a5, "closePath", v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57);
          break;
      }
      v29 += v38;
    }
    while (v29 < v23);
  }
  return 0;
}

- (int)readGradientBrush:(id)a3 from:(const char *)a4 brushFlags:(unsigned int)a5 in_size:(unsigned int)a6
{
  char v7 = a5;
  id v9 = a3;
  if ((v7 & 2) != 0)
  {
    BOOL v10 = a6 >= 0x18;
    a6 -= 24;
    if (!v10)
    {
LABEL_16:
      int v11 = -7;
      goto LABEL_17;
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
    readAffineTransform((const unsigned __int8 *)*a4, (double *)&v53);
    v52[0] = v53;
    v52[1] = v54;
    v52[2] = v55;
    [v9 setTransform:v52];
    *a4 += 24;
  }
  if ((v7 & 8) != 0)
  {
    unsigned int v12 = a6 - 4;
    if (a6 < 4) {
      goto LABEL_16;
    }
    int v13 = *(unsigned __int8 *)*a4;
    int v14 = *((unsigned __int8 *)*a4 + 1);
    int v15 = *((unsigned __int8 *)*a4 + 2);
    int v16 = *((unsigned __int8 *)*a4 + 3);
    int v17 = v13 | (v14 << 8) | (v15 << 16) | (v16 << 24);
    *a4 += 4;
    if (v12 < 8 * v17) {
      goto LABEL_16;
    }
    LODWORD(v48) = v12;
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v13 | (v14 << 8) | (v15 << 16) | (v16 << 24)];
    if (v17)
    {
      uint64_t v19 = 0;
      int v20 = (v15 << 18) | (v16 << 26) | (v14 << 10) | (4 * v13);
      int v21 = v17;
      do
      {
        +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", *a4, v19, v48);
        int v23 = v22;
        +[MFByteUtils readFloat32FromByteArray:*a4 in_offset:(v20 + v19)];
        int v25 = v24;
        unsigned int v26 = [MFPBlendStop alloc];
        LODWORD(v27) = v25;
        LODWORD(v28) = v23;
        unsigned int v29 = [(MFPBlendStop *)v26 initWithFactor:v27 position:v28];
        [v18 addObject:v29];

        uint64_t v19 = (v19 + 4);
        --v21;
      }
      while (v21);
    }
    objc_msgSend(v9, "setBlend:", v18, v48);
    unsigned int v30 = 8 * v17;
    a6 = v49 - 8 * v17;
    *a4 += v30;

    if ((v7 & 4) == 0) {
      goto LABEL_7;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_7;
  }
  unsigned int v31 = a6 - 4;
  if (a6 < 4) {
    goto LABEL_16;
  }
  int v32 = *(unsigned __int8 *)*a4;
  int v33 = *((unsigned __int8 *)*a4 + 1);
  int v34 = *((unsigned __int8 *)*a4 + 2);
  int v35 = *((unsigned __int8 *)*a4 + 3);
  int v36 = v32 | (v33 << 8) | (v34 << 16) | (v35 << 24);
  *a4 += 4;
  if (v31 < 8 * v36) {
    goto LABEL_16;
  }
  int v38 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v32 | (v33 << 8) | (v34 << 16) | (v35 << 24)];
  uint64_t v50 = v32 | (v33 << 8) | (v34 << 16) | (v35 << 24);
  if (v36)
  {
    uint64_t v39 = 0;
    int v40 = (v34 << 18) | (v35 << 26) | (v33 << 10) | (4 * v32);
    uint64_t v41 = 4 * v50;
    do
    {
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", *a4, v39, v50);
      int v43 = v42;
      uint64_t v44 = +[OITSUColor colorWithBinaryRed:(*a4)[(v40 + v39) + 2] green:(*a4)[(v40 + v39) + 1] blue:(*a4)[(v40 + v39)] alpha:(*a4)[(v40 + v39) + 3]];
      uint64_t v45 = [MFPGradientStop alloc];
      LODWORD(v46) = v43;
      uint64_t v47 = [(MFPGradientStop *)v45 initWithColor:v44 position:v46];
      [v38 addObject:v47];

      v39 += 4;
    }
    while (v41 != v39);
  }
  objc_msgSend(v9, "setColorBlend:", v38, v50);
  *a4 += (8 * v51);

LABEL_7:
  int v11 = 0;
LABEL_17:

  return v11;
}

- (int)readBrush:(const char *)a3 in_size:(unsigned int)a4 returnBrush:(id *)a5
{
  v63 = a3;
  unsigned int v5 = a4 - 8;
  if (a4 < 8) {
    return -7;
  }
  switch(*((_DWORD *)a3 + 1))
  {
    case 0:
      if (v5 < 4) {
        return -7;
      }
      unsigned int v12 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 10) green:*((unsigned __int8 *)a3 + 9) blue:*((unsigned __int8 *)a3 + 8) alpha:*((unsigned __int8 *)a3 + 11)];
      *a5 = [[MFPSolidBrush alloc] initWithColor:v12];
      goto LABEL_9;
    case 1:
      if (v5 < 0xC) {
        return -7;
      }
      uint64_t v13 = *((unsigned int *)a3 + 2);
      unsigned int v12 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 14) green:*((unsigned __int8 *)a3 + 13) blue:*((unsigned __int8 *)a3 + 12) alpha:*((unsigned __int8 *)a3 + 15)];
      int v14 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 18) green:*((unsigned __int8 *)a3 + 17) blue:*((unsigned __int8 *)a3 + 16) alpha:*((unsigned __int8 *)a3 + 19)];
      *a5 = [[MFPHatchBrush alloc] initWithHatchStyle:v13 foreColor:v12 backColor:v14];

LABEL_9:
      return 0;
    case 2:
      if (v5 < 8) {
        return -7;
      }
      uint64_t v15 = a4 - 16;
      char v16 = a3[8];
      uint64_t v17 = *((unsigned int *)a3 + 3);
      long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long v60 = *MEMORY[0x263F000D0];
      long long v61 = v18;
      long long v62 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      if ((v16 & 2) != 0)
      {
        if (v15 < 0x18) {
          return -7;
        }
        uint64_t v15 = a4 - 40;
        readAffineTransform((const unsigned __int8 *)a3 + 16, (double *)&v60);
        uint64_t v19 = 40;
      }
      else
      {
        uint64_t v19 = 16;
      }
      id v59 = 0;
      int v6 = [(EMFPlusPlayer *)self readImage:&a3[v19] in_size:v15 pImage:&v59];
      id v42 = v59;
      if (v42)
      {
        int v43 = [MFPTextureBrush alloc];
        v58[0] = v60;
        v58[1] = v61;
        v58[2] = v62;
        *a5 = [(MFPTextureBrush *)v43 initWithImage:v42 wrapMode:v17 transform:v58];
      }

      return v6;
    case 3:
      if (v5 < 0x18) {
        return -7;
      }
      int v20 = objc_alloc_init(MFPPathGradientBrush);
      unsigned int v21 = *((unsigned __int8 *)a3 + 8);
      int v22 = *((unsigned __int8 *)a3 + 9);
      int v23 = *((unsigned __int8 *)a3 + 10);
      int v24 = *((unsigned __int8 *)a3 + 11);
      [(MFPGradientBrush *)v20 setWrapMode:*((unsigned int *)a3 + 3)];
      +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 18) green:*((unsigned __int8 *)a3 + 17) blue:*((unsigned __int8 *)a3 + 16) alpha:*((unsigned __int8 *)a3 + 19)];
      int v53 = v24;
      v56 = int v54 = v22;
      -[MFPPathGradientBrush setCenterColor:](v20, "setCenterColor:");
      unsigned int v55 = v21;
      +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:0];
      float v26 = v25;
      +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:4];
      -[MFPPathGradientBrush setCenterPoint:](v20, "setCenterPoint:", v26, v27);
      unsigned int v28 = a4 - 32;
      uint64_t v29 = *((unsigned int *)a3 + 7);
      unsigned int v30 = (unsigned __int8 *)(a3 + 32);
      v63 = (const char *)v30;
      if (!v29) {
        goto LABEL_20;
      }
      if (v28 < 4 * (int)v29) {
        goto LABEL_22;
      }
      unsigned int v31 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v29];
      v28 -= 4 * v29;
      do
      {
        int v32 = +[OITSUColor colorWithBinaryRed:v30[2] green:v30[1] blue:*v30 alpha:v30[3]];
        [v31 addObject:v32];
        v30 += 4;
        v63 = (const char *)v30;

        LODWORD(v29) = v29 - 1;
      }
      while (v29);
      [(MFPPathGradientBrush *)v20 setSurroundColors:v31];

LABEL_20:
      uint64_t v33 = v28 - 4;
      if (v28 < 4) {
        goto LABEL_22;
      }
      unsigned int v36 = *(_DWORD *)v30;
      int v34 = (const char *)(v30 + 4);
      uint64_t v35 = v36;
      v63 = v34;
      if (v33 < v36) {
        goto LABEL_22;
      }
      unsigned int v44 = v55;
      if (v55)
      {
        id v57 = 0;
        [(EMFPlusPlayer *)self readPath:v34 in_size:v35 returnPath:&v57];
        uint64_t v45 = (OITSUBezierPath *)v57;
        int v34 = v63;
      }
      else
      {
        if (v33 < 8 * (int)v35)
        {
LABEL_22:

          return -7;
        }
        uint64_t v45 = objc_alloc_init(OITSUBezierPath);
        if (v35)
        {
          uint64_t v46 = 0;
          do
          {
            +[MFByteUtils readFloat32FromByteArray:&v34[v46 & 0xFFFFFFF8] in_offset:0];
            float v48 = v47;
            +[MFByteUtils readFloat32FromByteArray:&v34[v46 & 0xFFFFFFF8] in_offset:4];
            float v50 = v49;
            double v51 = v48;
            double v52 = v50;
            if (v46) {
              -[OITSUBezierPath lineToPoint:](v45, "lineToPoint:", v51, v52);
            }
            else {
              -[OITSUBezierPath moveToPoint:](v45, "moveToPoint:", v51, v52);
            }
            v46 += 8;
          }
          while (8 * v35 != v46);
        }
        [(OITSUBezierPath *)v45 closePath];
        unsigned int v44 = v55;
        LODWORD(v35) = 8 * v35;
        uint64_t v33 = (v33 - v35);
      }
      v63 = &v34[v35];
      [(MFPPathGradientBrush *)v20 setPath:v45];
      int v6 = [(EMFPlusPlayer *)self readGradientBrush:v20 from:&v63 brushFlags:(v23 << 16) | (v54 << 8) | (v53 << 24) | v44 in_size:v33];
      [(MFPGradientBrush *)v20 createPhoneBrush];
      uint64_t v41 = v20;
      *a5 = v41;

LABEL_25:
      break;
    case 4:
      if (v5 < 0x28) {
        return -7;
      }
      double v37 = objc_alloc_init(MFPLinearGradientBrush);
      uint64_t v38 = *((unsigned int *)a3 + 2);
      [(MFPGradientBrush *)v37 setWrapMode:*((unsigned int *)a3 + 3)];
      [(MFPLinearGradientBrush *)v37 setBounds:readFloat32Rect((const unsigned __int8 *)a3 + 16)];
      uint64_t v39 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 34) green:*((unsigned __int8 *)a3 + 33) blue:*((unsigned __int8 *)a3 + 32) alpha:*((unsigned __int8 *)a3 + 35)];
      [(MFPLinearGradientBrush *)v37 setStartColor:v39];
      int v40 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 38) green:*((unsigned __int8 *)a3 + 37) blue:*((unsigned __int8 *)a3 + 36) alpha:*((unsigned __int8 *)a3 + 39)];
      [(MFPLinearGradientBrush *)v37 setEndColor:v40];
      *(void *)&long long v60 = a3 + 48;
      int v6 = [(EMFPlusPlayer *)self readGradientBrush:v37 from:&v60 brushFlags:v38 in_size:a4 - 48];
      [(MFPGradientBrush *)v37 createPhoneBrush];
      uint64_t v41 = v37;
      *a5 = v41;

      goto LABEL_25;
    default:
      return 0;
  }
  return v6;
}

- (int)playBrush:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v11 = 0;
  int v7 = [(EMFPlusPlayer *)self readBrush:a3 in_size:*(void *)&a4 returnBrush:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = [(MFPGraphics *)self->mGraphics objectTable];
    [v9 setObject:v8 atIndex:v5];
  }
  return v7;
}

- (int)playPen:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v9 = objc_alloc_init(MFPPen);
  uint64_t v10 = a4 - 20;
  if (a4 < 0x14) {
    goto LABEL_2;
  }
  char v13 = a3[8];
  char v14 = a3[9];
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:16];
  -[MFPPen setWidth:](v9, "setWidth:");
  uint64_t v15 = (unsigned int *)(a3 + 20);
  if ((v13 & 1) == 0)
  {
LABEL_7:
    if ((v13 & 2) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setStartCap:*v15++];
    }
    if ((v13 & 4) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setEndCap:*v15++];
    }
    if ((v13 & 8) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setLineJoin:*v15++];
    }
    if ((v13 & 0x10) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      +[MFByteUtils readFloat32FromByteArray:v15 in_offset:0];
      -[MFPPen setMiterLimit:](v9, "setMiterLimit:");
      ++v15;
    }
    if ((v13 & 0x20) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setDashStyle:*v15++];
    }
    if ((v13 & 0x40) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setDashCap:*v15++];
    }
    if (v13 < 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      +[MFByteUtils readFloat32FromByteArray:v15 in_offset:0];
      -[MFPPen setDashOffset:](v9, "setDashOffset:");
      ++v15;
    }
    if (v14)
    {
      if (v10 >= 4)
      {
        [(MFPPen *)v9 setDashStyle:5];
        operator new[]();
      }
      goto LABEL_2;
    }
    if ((v14 & 2) != 0)
    {
      BOOL v27 = v10 >= 4;
      uint64_t v10 = (v10 - 4);
      if (!v27) {
        goto LABEL_2;
      }
      [(MFPPen *)v9 setAlignment:*v15++];
    }
    if ((v14 & 4) != 0)
    {
      if (v10 >= 4) {
        operator new[]();
      }
      goto LABEL_2;
    }
    if ((v14 & 8) != 0)
    {
      if (v10 < 4) {
        goto LABEL_2;
      }
      uint64_t v28 = *v15;
      BOOL v27 = v10 >= v28;
      uint64_t v10 = (v10 - v28);
      if (!v27) {
        goto LABEL_2;
      }
      uint64_t v15 = (unsigned int *)((char *)v15 + v28);
    }
    if ((v14 & 0x10) != 0)
    {
      if (v10 < 4) {
        goto LABEL_2;
      }
      uint64_t v31 = *v15;
      BOOL v27 = v10 >= v31;
      uint64_t v10 = (v10 - v31);
      if (!v27) {
        goto LABEL_2;
      }
      uint64_t v15 = (unsigned int *)((char *)v15 + v31);
    }
    id v32 = 0;
    int v11 = [(EMFPlusPlayer *)self readBrush:v15 in_size:v10 returnBrush:&v32];
    id v29 = v32;
    [(MFPPen *)v9 setBrush:v29];
    unsigned int v30 = [(MFPGraphics *)self->mGraphics objectTable];
    [v30 setObject:v9 atIndex:v5];

    goto LABEL_3;
  }
  if (v10 >= 0x18)
  {
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:0];
    float v17 = v16;
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:4];
    float v19 = v18;
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:8];
    float v21 = v20;
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:12];
    float v23 = v22;
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:16];
    float v25 = v24;
    +[MFByteUtils readFloat32FromByteArray:a3 + 20 in_offset:20];
    v33[0] = v17;
    v33[1] = v19;
    v33[2] = v21;
    v33[3] = v23;
    v33[4] = v25;
    v33[5] = v26;
    [(MFPPen *)v9 setTransform:v33];
    uint64_t v10 = a4 - 44;
    uint64_t v15 = (unsigned int *)(a3 + 44);
    goto LABEL_7;
  }
LABEL_2:
  int v11 = -7;
LABEL_3:

  return v11;
}

- (int)playPath:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v12 = 0;
  int v7 = [(EMFPlusPlayer *)self readPath:a3 in_size:*(void *)&a4 returnPath:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = [[MFPPath alloc] initWithPath:v8];
    uint64_t v10 = [(MFPGraphics *)self->mGraphics objectTable];
    [v10 setObject:v9 atIndex:v5];
  }
  return v7;
}

- (int)playRegion:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playImage:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v11 = 0;
  int v7 = [(EMFPlusPlayer *)self readImage:a3 in_size:*(void *)&a4 pImage:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = [(MFPGraphics *)self->mGraphics objectTable];
    [v9 setObject:v8 atIndex:v5];
  }
  return v7;
}

- (int)playFont:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  unsigned int v5 = a4 - 24;
  if (a4 < 0x18) {
    return -7;
  }
  uint64_t v7 = a5;
  uint64_t v10 = objc_alloc_init(MFPFont);
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  int v12 = v11;
  v13.i32[0] = *((_DWORD *)a3 + 5);
  int8x16_t v14 = (int8x16_t)vshlq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v13)), (uint32x4_t)xmmword_238EDE170);
  int8x8_t v15 = vorr_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
  uint64_t v16 = (v15.i32[0] | v15.i32[1]);
  if (v5 >= v16)
  {
    uint64_t v18 = *((unsigned int *)a3 + 2);
    uint64_t v17 = *((unsigned int *)a3 + 3);
    float v19 = (void *)[[NSString alloc] initWithBytes:a3 + 24 length:v16 encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    LODWORD(v20) = v12;
    [(MFPFont *)v10 setSize:v20];
    [(MFPFont *)v10 setUnit:v18];
    [(MFPFont *)v10 setFlags:v17];
    [(MFPFont *)v10 setName:v19];
    float v21 = [(MFPGraphics *)self->mGraphics objectTable];
    [v21 setObject:v10 atIndex:v7];

    int v6 = 0;
  }
  else
  {
    int v6 = -7;
  }

  return v6;
}

- (int)playStringFormat:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  if (a4 < 0x38) {
    return -7;
  }
  uint64_t v6 = *(void *)&a4;
  unsigned int v26 = a5;
  id v8 = objc_alloc_init(MFPStringFormat);
  int v9 = *((unsigned __int8 *)a3 + 4);
  int v10 = *((unsigned __int8 *)a3 + 5);
  int v11 = *((unsigned __int8 *)a3 + 6);
  int v12 = *((unsigned __int8 *)a3 + 7);
  uint64_t v14 = *((unsigned int *)a3 + 3);
  uint64_t v13 = *((unsigned int *)a3 + 4);
  unsigned int v28 = *((unsigned __int8 *)a3 + 24);
  unsigned __int16 v29 = *((_WORD *)a3 + 10);
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:28];
  int v16 = v15;
  uint64_t v17 = v9 | (v10 << 8) | (v11 << 16) | (v12 << 24);
  uint64_t v18 = *((unsigned int *)a3 + 8);
  uint64_t v19 = *((unsigned int *)a3 + 12);
  [(MFPStringFormat *)v8 setFormatFlags:v17];
  [(MFPStringFormat *)v8 setAlignment:v14];
  [(MFPStringFormat *)v8 setLineAlignment:v13];
  [(MFPStringFormat *)v8 setDigitSubstitutionLanguage:v29];
  [(MFPStringFormat *)v8 setDigitSubstitutionMethod:v28];
  LODWORD(v20) = v16;
  [(MFPStringFormat *)v8 setFirstTabOffset:v20];
  [(MFPStringFormat *)v8 setHotkeyPrefix:v18];
  [(MFPStringFormat *)v8 setTrimming:v19];
  int v21 = *((_DWORD *)a3 + 13);
  if (v21 < 1)
  {
    float v24 = [(MFPGraphics *)self->mGraphics objectTable];
    [v24 setObject:v8 atIndex:v26];

    int v5 = 0;
  }
  else
  {
    float v22 = [NSNumber numberWithUnsignedInt:v6];
    uint64_t v23 = [v22 integerValue];

    if (v23 >= (4 * v21) + 60) {
      operator new[]();
    }
    int v5 = -7;
  }

  return v5;
}

- (int)playImageAttributes:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playCustomLineCap:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playGraphics:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  switch(HIBYTE(a5) & 0x3F)
  {
    case 1:
      int result = [(EMFPlusPlayer *)self playBrush:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 2:
      int result = [(EMFPlusPlayer *)self playPen:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 3:
      int result = [(EMFPlusPlayer *)self playPath:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 4:
      int result = [(EMFPlusPlayer *)self playRegion:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 5:
      int result = [(EMFPlusPlayer *)self playImage:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 6:
      int result = [(EMFPlusPlayer *)self playFont:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 7:
      int result = [(EMFPlusPlayer *)self playStringFormat:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 8:
      int result = [(EMFPlusPlayer *)self playImageAttributes:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 9:
      int result = [(EMFPlusPlayer *)self playCustomLineCap:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    case 0xA:
      int result = [(EMFPlusPlayer *)self playGraphics:a3 in_size:*(void *)&a4 objectIndex:a5];
      break;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (id)canvasInWorldCoordinates
{
  [(MFPGraphics *)self->mGraphics canvas];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  int v10 = TCCurrentGraphicsContext();
  memset(&v16, 0, sizeof(v16));
  CGContextGetCTM(&v16, v10);
  CGAffineTransform v14 = v16;
  CGAffineTransformInvert(&v15, &v14);
  CGAffineTransform v16 = v15;
  int v11 = +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:", v3, v5, v7, v9);
  CGAffineTransform v13 = v16;
  [v11 transformUsingAffineTransform:&v13];
  return v11;
}

- (int)playFillPath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6
{
  id v9 = a3;
  uint64_t v10 = *(unsigned __int8 *)a4;
  if ((a6 & 0x8000) != 0)
  {
    int v12 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a4 + 2) green:*((unsigned __int8 *)a4 + 1) blue:*(unsigned __int8 *)a4 alpha:*((unsigned __int8 *)a4 + 3)];
    CGAffineTransform v14 = [[MFPSolidBrush alloc] initWithColor:v12];
  }
  else
  {
    int v11 = [(MFPGraphics *)self->mGraphics objectTable];
    int v12 = [v11 objectAtIndex:v10];

    uint64_t v13 = objc_opt_class();
    TSUDynamicCast(v13, (uint64_t)v12);
    CGAffineTransform v14 = (MFPSolidBrush *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      uint64_t v15 = objc_opt_class();
      CGAffineTransform v16 = TSUDynamicCast(v15, (uint64_t)v12);
      CGAffineTransform v14 = [v16 brush];
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MFPGraphics *)self->mGraphics fillPath:v9 brush:v14];
    int v17 = 0;
  }
  else
  {
    int v17 = -1;
  }

  return v17;
}

- (int)playStrokePath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6
{
  unsigned __int8 v6 = a6;
  id v8 = a3;
  id v9 = [(MFPGraphics *)self->mGraphics objectTable];
  uint64_t v10 = [v9 objectAtIndex:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MFPGraphics *)self->mGraphics strokePath:v8 pen:v10];
    int v11 = 0;
  }
  else
  {
    int v11 = -7;
  }

  return v11;
}

- (int)playClear:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  double v7 = [(EMFPlusPlayer *)self canvasInWorldCoordinates];
  id v8 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 2) green:*((unsigned __int8 *)a3 + 1) blue:*(unsigned __int8 *)a3 alpha:*((unsigned __int8 *)a3 + 3)];
  id v9 = [[MFPSolidBrush alloc] initWithColor:v8];
  [(MFPGraphics *)self->mGraphics fillPath:v7 brush:v9];

  return 0;
}

- (int)playFillEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = +[OITSUBezierPath bezierPathWithOvalInRect:readRect((const unsigned __int8 *)a3 + 4, a5)];
  LODWORD(v5) = [(EMFPlusPlayer *)self playFillPath:v9 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playDrawEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = +[OITSUBezierPath bezierPathWithOvalInRect:readRect((const unsigned __int8 *)a3, a5)];
  LODWORD(v5) = [(EMFPlusPlayer *)self playStrokePath:v9 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playFillRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v9 = objc_alloc_init(OITSUBezierPath);
  if (v6 >= 8)
  {
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if ((v5 & 0x4000) != 0) {
      uint64_t v12 = 8;
    }
    else {
      uint64_t v12 = 16;
    }
    unint64_t v13 = v11 * (unint64_t)v12;
    int v10 = -7;
    if ((v13 & 0xFFFFFFFF00000000) == 0 && v13 <= v6)
    {
      if (v11)
      {
        CGAffineTransform v14 = (const unsigned __int8 *)(a3 + 8);
        do
        {
          [(OITSUBezierPath *)v9 appendBezierPathWithRect:readRect(v14, v5)];
          v14 += v12;
          --v11;
        }
        while (v11);
      }
      int v10 = [(EMFPlusPlayer *)self playFillPath:v9 in_pData:a3 in_size:v6 in_flags:v5];
    }
  }
  else
  {
    int v10 = -7;
  }

  return v10;
}

- (int)playDrawRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 < 4) {
    return -7;
  }
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  int v9 = *(_DWORD *)a3;
  int v10 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  uint64_t v11 = [v10 integerValue];
  char v12 = (v5 & 0x4000) != 0 ? 3 : 4;
  uint64_t v13 = ((v9 << v12) + 4);

  if (v11 < v13) {
    return -7;
  }
  uint64_t v15 = objc_alloc_init(OITSUBezierPath);
  if (v9)
  {
    CGAffineTransform v16 = (const unsigned __int8 *)(a3 + 4);
    if ((v5 & 0x4000) != 0) {
      uint64_t v17 = 8;
    }
    else {
      uint64_t v17 = 16;
    }
    do
    {
      [(OITSUBezierPath *)v15 appendBezierPathWithRect:readRect(v16, v5)];
      v16 += v17;
      --v9;
    }
    while (v9);
  }
  int v14 = [(EMFPlusPlayer *)self playStrokePath:v15 in_pData:a3 in_size:v6 in_flags:v5];

  return v14;
}

- (int)playFillPolygon:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a4 - 8;
  if (a4 < 8) {
    return -7;
  }
  uint64_t v7 = a5;
  int v9 = objc_alloc_init(OITSUBezierPath);
  unsigned int v10 = *((_DWORD *)a3 + 1);
  if ((v7 & 0x4000) != 0) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 8;
  }
  if (v10) {
    BOOL v12 = v5 >= v11;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    int v14 = (const unsigned __int8 *)(a3 + 8);
    unsigned int v15 = 1;
    do
    {
      double Point = readPoint(v14, v7);
      if (v15 == 1) {
        [(OITSUBezierPath *)v9 moveToPoint:Point];
      }
      else {
        [(OITSUBezierPath *)v9 lineToPoint:Point];
      }
      uint64_t v13 = (v5 - v11);
      if (v15 >= v10) {
        break;
      }
      v14 += v11;
      ++v15;
      LODWORD(v5) = v5 - v11;
    }
    while (v5 >= v11);
  }
  else
  {
    uint64_t v13 = v5;
  }
  [(OITSUBezierPath *)v9 closePath];
  int v6 = [(EMFPlusPlayer *)self playFillPath:v9 in_pData:a3 in_size:v13 in_flags:v7];

  return v6;
}

- (int)playDrawLines:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  int v9 = objc_alloc_init(OITSUBezierPath);
  BOOL v10 = a4 >= 4;
  uint64_t v11 = a4 - 4;
  if (v10)
  {
    int v13 = *(_DWORD *)a3;
    if ((v5 & 0x4000) != 0) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 8;
    }
    if (!v13)
    {
LABEL_14:
      int v12 = [(EMFPlusPlayer *)self playStrokePath:v9 in_pData:a3 in_size:v11 in_flags:v5];
      goto LABEL_15;
    }
    int v15 = 0;
    CGAffineTransform v16 = (const unsigned __int8 *)(a3 + 4);
    while (1)
    {
      BOOL v10 = v11 >= v14;
      uint64_t v11 = (v11 - v14);
      if (!v10) {
        break;
      }
      double Point = readPoint(v16, v5);
      if (v15) {
        [(OITSUBezierPath *)v9 lineToPoint:Point];
      }
      else {
        [(OITSUBezierPath *)v9 moveToPoint:Point];
      }
      v16 += v14;
      if (v13 == ++v15) {
        goto LABEL_14;
      }
    }
  }
  int v12 = -7;
LABEL_15:

  return v12;
}

- (int)playDrawArc:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  float v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  float v12 = v11;
  double Rect = readRect((const unsigned __int8 *)a3 + 8, v5);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 1, Rect, v15, v17, v19, v10, v12);
  LODWORD(v5) = [(EMFPlusPlayer *)self playStrokePath:v20 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playFillPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  float v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:8];
  float v12 = v11;
  double Rect = readRect((const unsigned __int8 *)a3 + 12, v5);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v20 = objc_alloc_init(OITSUBezierPath);
  [(OITSUBezierPath *)v20 moveToPoint:TSUCenterOfRect(Rect, v15, v17, v19)];
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 0, Rect, v15, v17, v19, v10, v12);
  [(OITSUBezierPath *)v20 closePath];
  LODWORD(v5) = [(EMFPlusPlayer *)self playFillPath:v20 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playDrawPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  float v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  float v12 = v11;
  double Rect = readRect((const unsigned __int8 *)a3 + 8, v5);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v20 = objc_alloc_init(OITSUBezierPath);
  [(OITSUBezierPath *)v20 moveToPoint:TSUCenterOfRect(Rect, v15, v17, v19)];
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 0, Rect, v15, v17, v19, v10, v12);
  [(OITSUBezierPath *)v20 closePath];
  LODWORD(v5) = [(EMFPlusPlayer *)self playStrokePath:v20 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playDrawBeziers:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v5 = a4 - 4;
  if (a4 >= 4)
  {
    uint64_t v7 = a5;
    float v24 = objc_alloc_init(OITSUBezierPath);
    if ((v7 & 0x4000) != 0) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 8;
    }
    uint64_t v11 = v5 - v10;
    if (v5 >= v10)
    {
      int v12 = *(unsigned __int16 *)a3;
      [(OITSUBezierPath *)v24 moveToPoint:readPoint((const unsigned __int8 *)a3 + 4, v7)];
      uint64_t v23 = self;
      if ((v12 - 1) < 3)
      {
LABEL_20:
        int v6 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](v23, "playStrokePath:in_pData:in_size:in_flags:", v24, a3, v11, v7, v23, a3);
        goto LABEL_21;
      }
      int v13 = 0;
      double v14 = (const unsigned __int8 *)&a3[v10 + 4];
      if ((v7 & 0x4000) != 0) {
        unsigned int v15 = 12;
      }
      else {
        unsigned int v15 = 24;
      }
      if ((v12 - 1) / 3u <= 1) {
        unsigned int v16 = 1;
      }
      else {
        unsigned int v16 = (v12 - 1) / 3u;
      }
      while (1)
      {
        BOOL v17 = v11 >= v15;
        uint64_t v11 = v11 - v15;
        if (!v17) {
          break;
        }
        uint64_t v18 = 0;
        long long v25 = *MEMORY[0x263F00148];
        long long v26 = v25;
        long long v27 = v25;
        do
        {
          double Point = readPoint(v14, v7);
          double v20 = (char *)&v25 + v18;
          *(double *)double v20 = Point;
          *((void *)v20 + 1) = v21;
          v14 += v10;
          v18 += 16;
        }
        while (v18 != 48);
        [(OITSUBezierPath *)v24 curveToPoint:v27 controlPoint1:v25 controlPoint2:v26];
        if (++v13 == v16) {
          goto LABEL_20;
        }
      }
    }
    int v6 = -7;
LABEL_21:

    return v6;
  }
  return -7;
}

- (int)playFillClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  id v8 = objc_alloc_init(OITSUBezierPath);
  BOOL v9 = a4 >= 0xC;
  unsigned int v10 = a4 - 12;
  if (v9)
  {
    +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
    if ((a5 & 0x4000) != 0) {
      char v11 = 2;
    }
    else {
      char v11 = 3;
    }
    if (v10 >= (*((unsigned __int8 *)a3 + 8) | (unsigned __int16)(*((unsigned __int8 *)a3 + 9) << 8) | (*((unsigned __int8 *)a3 + 10) << 16) & 0xFFFFFF | (*((unsigned __int8 *)a3 + 11) << 24)) << v11) {
      operator new[]();
    }
  }

  return -7;
}

- (int)playDrawClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 >= 8)
  {
    uint64_t v6 = *(void *)&a4;
    +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
    unsigned __int8 v8 = a3[4];
    unsigned __int8 v9 = a3[5];
    unsigned __int8 v10 = a3[6];
    unsigned __int8 v11 = a3[7];
    if ((a5 & 0x4000) != 0) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 8;
    }
    int v13 = [NSNumber numberWithUnsignedInt:v6];
    unint64_t v20 = [v13 unsignedIntegerValue];
    double v14 = [NSNumber numberWithUnsignedInt:v8 | (unsigned __int16)(v9 << 8) | (v10 << 16) & 0xFFFFFF | (v11 << 24)];
    uint64_t v15 = [v14 unsignedIntegerValue];
    unsigned int v16 = [NSNumber numberWithInt:v12];
    unint64_t v17 = [v16 unsignedIntegerValue] * v15 + 8;

    if (v20 >= v17)
    {
      uint64_t v18 = objc_alloc_init(OITSUBezierPath);
      operator new[]();
    }
  }
  return -7;
}

- (int)playDrawCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 >= 0x10)
  {
    char v6 = (a5 & 0x4000) != 0 ? 2 : 3;
    unsigned int v7 = (a4 - 16) >> v6;
    +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
    unsigned int v8 = *((_DWORD *)a3 + 3);
    if (v8 <= v7)
    {
      int v10 = *((unsigned __int8 *)a3 + 4) | (unsigned __int16)(*((unsigned __int8 *)a3 + 5) << 8) | (*((unsigned __int8 *)a3 + 6) << 16) & 0xFFFFFF | (*((unsigned __int8 *)a3 + 7) << 24);
      unsigned int v11 = *((_DWORD *)a3 + 2);
      unsigned int v12 = v11 + v10;
      if (!__CFADD__(v11, v10) && v12 >= v11 && v12 <= v8)
      {
        double v14 = objc_alloc_init(OITSUBezierPath);
        operator new[]();
      }
    }
  }
  return -7;
}

- (int)playDrawPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned __int8 v5 = a5;
  unsigned int v8 = [(MFPGraphics *)self->mGraphics objectTable];
  unsigned __int8 v9 = [v8 objectAtIndex:v5];

  uint64_t v10 = *(unsigned __int8 *)a3;
  unsigned int v11 = [(MFPGraphics *)self->mGraphics objectTable];
  unsigned int v12 = [v11 objectAtIndex:v10];

  mGraphics = self->mGraphics;
  double v14 = [v9 path];
  [(MFPGraphics *)mGraphics strokePath:v14 pen:v12];

  return 0;
}

- (int)playFillPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  unsigned __int8 v9 = [(MFPGraphics *)self->mGraphics objectTable];
  uint64_t v10 = [v9 objectAtIndex:v5];

  unsigned int v11 = [v10 path];
  LODWORD(v5) = [(EMFPlusPlayer *)self playFillPath:v11 in_pData:a3 in_size:v6 in_flags:v5];

  return v5;
}

- (int)playDrawImage:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v8 = [(MFPGraphics *)self->mGraphics objectTable];
  unsigned __int8 v9 = [v8 objectAtIndex:a5];

  uint64_t v10 = *((unsigned __int16 *)a3 + 2);
  readFloat32Rect((const unsigned __int8 *)a3 + 8);
  [v9 drawInRect:v10 fromRect:self->mEffect unit:readRect((const unsigned __int8 *)a3 + 24 effect:a5)];

  return 0;
}

- (int)playDrawImagePoints:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unsigned int v8 = [(MFPGraphics *)self->mGraphics objectTable];
  unsigned __int8 v9 = [v8 objectAtIndex:a5];

  uint64_t v10 = *((unsigned __int16 *)a3 + 2);
  Float32double Rect = readFloat32Rect((const unsigned __int8 *)a3 + 8);
  if (*((_WORD *)a3 + 12) == 3)
  {
    double v15 = Float32Rect;
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    uint64_t v19 = 0;
    unint64_t v20 = a3 + 28;
    if ((a5 & 0x4000) != 0) {
      char v21 = 2;
    }
    else {
      char v21 = 3;
    }
    float v22 = &v36[0].f64[1];
    do
    {
      *(v22 - 1) = readPoint((const unsigned __int8 *)&v20[v19 << v21], a5);
      *(void *)float v22 = v23;
      ++v19;
      v22 += 2;
    }
    while (v19 != 3);
    float v24 = TCCurrentGraphicsContext();
    CGContextSaveGState(v24);
    memset(&v35, 0, sizeof(v35));
    CGContextGetCTM(&v35, v24);
    CGAffineTransform v33 = v35;
    CGAffineTransformInvert(&transform, &v33);
    CGContextConcatCTM(v24, &transform);
    uint64_t v25 = 0;
    float64x2_t v26 = *(float64x2_t *)&v35.a;
    float64x2_t v27 = *(float64x2_t *)&v35.c;
    float64x2_t v28 = *(float64x2_t *)&v35.tx;
    do
    {
      v36[v25] = vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v36[v25].f64[1]), v26, v36[v25].f64[0]));
      ++v25;
    }
    while (v25 != 3);
    float64x2_t v29 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    *(float64x2_t *)&v32.a = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v36[1], v36[0]), v29)));
    *(float64x2_t *)&v32.c = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v36[2], v36[0]), v29)));
    *(float64x2_t *)&v32.tdouble x = vcvtq_f64_f32(vcvt_f32_f64(v36[0]));
    CGContextConcatCTM(v24, &v32);
    objc_msgSend(v9, "drawInRect:fromRect:unit:effect:", v10, self->mEffect, 0.0, 0.0, 100.0, 100.0, v15, v16, v17, v18);
    CGContextRestoreGState(v24);
    int v30 = 0;
  }
  else
  {
    int v30 = -7;
  }

  return v30;
}

+ (float)firstTabPosPastPos:(float)a3 stringFormat:(id)a4 isExplicit:(BOOL *)a5
{
  id v7 = a4;
  unsigned int v8 = v7;
  if (a5) {
    *a5 = 0;
  }
  if (!v7) {
    goto LABEL_16;
  }
  int v9 = [v7 tabStopCount];
  [v8 firstTabOffset];
  if (v9 < 1 || (float v11 = v10, v10 < 0.0))
  {
    if (a5) {
      *a5 = 0;
    }
LABEL_16:
    float v11 = a3;
    goto LABEL_17;
  }
  int v12 = 0;
  do
  {
    if (a5) {
      *a5 = v12 < v9;
    }
    uint64_t v13 = [v8 tabStops];
    if (v12 >= v9 - 1) {
      int v14 = v9 - 1;
    }
    else {
      int v14 = v12;
    }
    float v11 = v11 + *(float *)(v13 + 4 * v14);
    ++v12;
  }
  while (v11 <= a3);
LABEL_17:

  return v11;
}

- (int)playDrawString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 >= 0x1C)
  {
    int v131 = *((unsigned __int16 *)a3 + 4);
    uint64_t v6 = (2 * v131);
    if ((int)v6 + 28 <= a4)
    {
      float v10 = [(MFPGraphics *)self->mGraphics objectTable];
      float v11 = [v10 objectAtIndex:a5];

      char v122 = [v11 flags];
      int v12 = (const __CTFont *)[v11 createCTFontWithGraphics:self->mGraphics];
      CGFloat Size = CTFontGetSize(v12);
      CGFloat Ascent = CTFontGetAscent(v12);
      uint64_t v15 = *(unsigned __int8 *)a3;
      if ((a5 & 0x8000) != 0)
      {
        double v18 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 2) green:*((unsigned __int8 *)a3 + 1) blue:*(unsigned __int8 *)a3 alpha:*((unsigned __int8 *)a3 + 3)];
        if (v18) {
          goto LABEL_6;
        }
      }
      else
      {
        double v16 = [(MFPGraphics *)self->mGraphics objectTable];
        double v17 = [v16 objectAtIndex:v15];

        double v18 = [v17 color];

        if (v18)
        {
LABEL_6:
          uint64_t v19 = TCCurrentGraphicsContext();
          CGContextSaveGState(v19);
          [v18 set];
          v119 = v18;
          v120 = v11;
          int v20 = *((unsigned __int8 *)a3 + 4);
          int v21 = *((unsigned __int8 *)a3 + 5);
          float v22 = [(MFPGraphics *)self->mGraphics objectTable];
          uint64_t v23 = [v22 objectAtIndex:v20 | (v21 << 8)];

          __int16 v24 = [v23 formatFlags];
          double v111 = Ascent;
          double v112 = Size;
          Float32double Rect = readFloat32Rect((const unsigned __int8 *)a3 + 12);
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          v133 = (void *)[[NSString alloc] initWithBytes:a3 + 28 length:v6 encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
          v128 = v23;
          if (v23)
          {
            int v117 = [v23 alignment];
            int v32 = v131;
            int v33 = [v23 lineAlignment];
            int v34 = [v23 trimming];
          }
          else
          {
            int v33 = 0;
            int v117 = 0;
            int v34 = 1;
            int v32 = v131;
          }
          double v35 = CTFontGetAscent(v12);
          double Descent = CTFontGetDescent(v12);
          CGFloat Leading = CTFontGetLeading(v12);
          if ((v24 & 0x1000) == 0)
          {
            v144.origin.double x = Float32Rect;
            v144.origin.double y = v27;
            v144.size.double width = v29;
            v144.size.double height = v31;
            if (CGRectGetWidth(v144) > 0.0)
            {
              v145.origin.double x = Float32Rect;
              v145.origin.double y = v27;
              v145.size.double width = v29;
              v145.size.double height = v31;
              CGRectGetWidth(v145);
            }
          }
          UniChar characters = 32;
          font = CTFontCopyGraphicsFont(v12, 0);
          CTFontGetGlyphsForCharacters(v12, &characters, glyphs, 1);
          double v115 = Leading;
          int v113 = v33;
          CTFontGetAdvancesForGlyphs(v12, kCTFontOrientationDefault, glyphs, 0, 1);
          v139 = 0;
          v140 = 0;
          uint64_t v141 = 0;
          v124 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" \t\n"];
          if (v32) {
            operator new();
          }
          uint64_t v39 = v139;
          uint64_t v38 = v140;
          v146.origin.double x = Float32Rect;
          v146.origin.double y = v27;
          v146.size.double width = v29;
          v146.size.double height = v31;
          double MinY = CGRectGetMinY(v146);
          v147.origin.double x = Float32Rect;
          v147.origin.double y = v27;
          v147.size.double width = v29;
          v147.size.double height = v31;
          double Height = CGRectGetHeight(v147);
          v148.origin.double x = Float32Rect;
          v148.origin.double y = v27;
          v148.size.double width = v29;
          v148.size.double height = v31;
          CGFloat v42 = CGRectGetHeight(v148);
          unint64_t v43 = v38 - v39;
          float v44 = v35 + Descent + v115;
          float v129 = v44;
          unsigned int v45 = (float)(v44 * (float)(v43 >> 3));
          float v46 = MinY + Height * (double)v113 * 0.5 - (double)(v113 * v45) * 0.5;
          float v132 = v46;
          unsigned int v47 = (v43 >> 3) - 1;
          if (v42 <= 0.0
            || (v149.origin.double x = Float32Rect,
                v149.origin.double y = v27,
                v149.size.double width = v29,
                v149.size.double height = v31,
                CGRectGetHeight(v149) >= (double)v45))
          {
            unsigned int v56 = 0;
          }
          else
          {
            v150.origin.double x = Float32Rect;
            v150.origin.double y = v27;
            v150.size.double width = v29;
            v150.size.double height = v31;
            double v48 = CGRectGetMinY(v150);
            v151.origin.double x = Float32Rect;
            v151.origin.double y = v27;
            v151.size.double width = v29;
            v151.size.double height = v31;
            double MaxY = CGRectGetMaxY(v151);
            float v50 = (v48 - v132) / v129;
            float v51 = floorf(v50);
            float v52 = ceilf(v50);
            if ((v24 & 0x2000) == 0) {
              float v52 = v51;
            }
            float v53 = (MaxY - v132) / v129;
            float v54 = ceilf(v53);
            float v55 = floorf(v53);
            if ((v24 & 0x2000) == 0) {
              float v55 = v54;
            }
            if (v47 >= v52) {
              unsigned int v56 = v52;
            }
            else {
              unsigned int v56 = (v43 >> 3) - 1;
            }
            if (v47 >= v55) {
              unsigned int v47 = v55;
            }
          }
          v152.origin.double x = Float32Rect;
          v152.origin.double y = v27;
          v152.size.double width = v29;
          v152.size.double height = v31;
          if (CGRectGetWidth(v152) != 0.0
            || (v153.origin.double x = Float32Rect,
                v153.origin.double y = v27,
                v153.size.double width = v29,
                v153.size.double height = v31,
                CGRectGetHeight(v153) != 0.0))
          {
            v154.origin.double x = Float32Rect;
            v154.origin.double y = v27;
            v154.size.double width = v29;
            v154.size.double height = v31;
            double v57 = CGRectGetMinY(v154);
            v155.origin.double x = Float32Rect;
            v155.origin.double y = v27;
            v155.size.double width = v29;
            v155.size.double height = v31;
            double v58 = CGRectGetMaxY(v155);
            v156.origin.double x = Float32Rect;
            v156.origin.double y = v27;
            v156.size.double width = v29;
            v156.size.double height = v31;
            CGFloat v59 = CGRectGetHeight(v156);
            BOOL v62 = v59 == 0.0;
            if (v59 == 0.0)
            {
              float v63 = v132;
            }
            else
            {
              float v60 = v57;
              float v63 = v60;
            }
            float v134 = v63;
            if (v62)
            {
              float v64 = (float)v45 + v132;
            }
            else
            {
              float v61 = v58;
              float v64 = v61;
            }
            v157.origin.double x = Float32Rect;
            v157.origin.double y = v27;
            v157.size.double width = v29;
            v157.size.double height = v31;
            double MinX = CGRectGetMinX(v157);
            v158.origin.double x = Float32Rect;
            v158.origin.double y = v27;
            v158.size.double width = v29;
            v158.size.double height = v31;
            double MaxX = CGRectGetMaxX(v158);
            v159.origin.double x = Float32Rect;
            v159.origin.double y = v27;
            v159.size.double width = v29;
            v159.size.double height = v31;
            if (CGRectGetWidth(v159) == 0.0)
            {
              if ((v43 >> 3))
              {
                v67 = (uint64_t *)v139;
                uint64_t v68 = (v43 >> 3);
                float v69 = 0.0;
                do
                {
                  uint64_t v70 = *v67++;
                  float v71 = *(float *)(v70 + 24) + *(float *)(v70 + 28);
                  if (v71 > v69) {
                    float v69 = v71;
                  }
                  --v68;
                }
                while (v68);
              }
              else
              {
                float v69 = 0.0;
              }
              v160.origin.double x = Float32Rect;
              v160.origin.double y = v27;
              v160.size.double width = v29;
              v160.size.double height = v31;
              float v72 = CGRectGetMinX(v160) + (float)(v69 * (float)v117) * -0.5;
              float v73 = v69 + v72;
            }
            else
            {
              float v72 = MinX;
              float v73 = MaxX;
            }
            float v74 = v73 - v72;
            if ((float)(v73 - v72) > 0.0 && (float)(v64 - v134) > 0.0)
            {
              v75 = TCCurrentGraphicsContext();
              v161.origin.double x = v72;
              v161.origin.double y = v134;
              v161.size.double width = v74;
              v161.size.double height = (float)(v64 - v134);
              CGContextClipToRect(v75, v161);
            }
          }
          v76 = TCCurrentGraphicsContext();
          CGContextSetFont(v76, font);
          v77 = TCCurrentGraphicsContext();
          CGFloat v78 = CTFontGetSize(v12);
          CGContextSetFontSize(v77, v78);
          if (v56 > v47)
          {
LABEL_50:
            int v7 = 0;
LABEL_78:
            CFRelease(font);
            CFRelease(v12);
            v109 = TCCurrentGraphicsContext();
            CGContextRestoreGState(v109);
            destroyPointerVectorElements<EMFPlusDrawStringLine>((uint64_t *)&v139);

            if (v139)
            {
              v140 = v139;
              operator delete(v139);
            }

            double v18 = v119;
            float v11 = v120;
            goto LABEL_81;
          }
          float v79 = v112;
          float v80 = v111;
          double v127 = (double)v117;
          float v125 = v80;
          float v126 = (float)v117;
          double rect = (float)(v79 / 12.0);
          float v118 = v79 / 10.0;
          double v114 = v79 * 0.05;
          double v116 = v79;
          while (1)
          {
            v81 = *(float **)&v139[8 * v56];
            float v82 = v81[6];
            float v83 = v81[7];
            v162.origin.double x = Float32Rect;
            v162.origin.double y = v27;
            v162.size.double width = v29;
            v162.size.double height = v31;
            double v84 = CGRectGetMinX(v162);
            v163.origin.double x = Float32Rect;
            v163.origin.double y = v27;
            v163.size.double width = v29;
            v163.size.double height = v31;
            float v85 = v84 + CGRectGetWidth(v163) * v127 * 0.5 - ((float)((float)(v82 + v83) * v126) * 0.5 + 0.0);
            float v135 = v85;
            float v130 = v132 + (float)((float)v56 * v129);
            uint64_t v86 = *(void *)v81;
            if (*((void *)v81 + 1) != *(void *)v81) {
              break;
            }
LABEL_71:
            float v104 = v130 + v125;
            if ((v122 & 4) != 0)
            {
              float v105 = v81[6];
              v106 = TCCurrentGraphicsContext();
              v166.size.double width = v105;
              v166.origin.double y = (float)(v118 + v104);
              v166.origin.double x = v135;
              v166.size.double height = rect;
              CGContextFillRect(v106, v166);
            }
            if ((v122 & 8) != 0)
            {
              float v107 = v81[6];
              v108 = TCCurrentGraphicsContext();
              v167.size.double width = v107;
              v167.origin.double x = v135;
              v167.origin.double y = v104 + v116 * -0.28;
              v167.size.double height = v114;
              CGContextFillRect(v108, v167);
            }
            if (++v56 > v47) {
              goto LABEL_50;
            }
          }
          unint64_t v87 = 0;
          while (1)
          {
            uint64_t v88 = *(void *)(v86 + 8 * v87);
            float v89 = *(float *)v88;
            v90 = malloc_type_malloc(*(void *)(v88 + 16) - *(void *)(v88 + 8), 0x1000040BDFB0063uLL);
            if (!v90)
            {
              int v7 = -4;
              goto LABEL_78;
            }
            uint64_t v91 = *(void *)(v88 + 8);
            if (*(void *)(v88 + 16) != v91) {
              break;
            }
LABEL_70:
            free(v90);
            ++v87;
            uint64_t v86 = *(void *)v81;
            if (v87 >= (uint64_t)(*((void *)v81 + 1) - *(void *)v81) >> 3) {
              goto LABEL_71;
            }
          }
          unint64_t v92 = 0;
          float v93 = v89 + v135;
          while (1)
          {
            UniChar v137 = 0;
            UniChar v137 = *(_WORD *)(v91 + 2 * v92);
            CTFontGetGlyphsForCharacters(v12, &v137, &v138, 1);
            double AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(v12, kCTFontOrientationDefault, &v138, 0, 1);
            v164.origin.double x = Float32Rect;
            v164.origin.double y = v27;
            v164.size.double width = v29;
            v164.size.double height = v31;
            float v95 = AdvancesForGlyphs;
            if (CGRectGetWidth(v164) <= 0.0 || (v24 & 0x1000) == 0 || v34 == 0)
            {
              double v98 = v93;
            }
            else
            {
              double v100 = Float32Rect;
              CGFloat v101 = v27;
              CGFloat v102 = v29;
              CGFloat v103 = v31;
              double v98 = v93;
              if (CGRectGetMinX(*(CGRect *)&v100) > v93) {
                goto LABEL_69;
              }
              v165.origin.double x = Float32Rect;
              v165.origin.double y = v27;
              v165.size.double width = v29;
              v165.size.double height = v31;
              if (CGRectGetMaxX(v165) < (float)(v93 + v95)) {
                goto LABEL_69;
              }
            }
            Lpositions.double x = v98;
            Lpositions.double y = v130;
            v99 = TCCurrentGraphicsContext();
            CGContextShowGlyphsAtPositions(v99, &v138, &Lpositions, 1uLL);
LABEL_69:
            float v93 = v93 + v95;
            ++v92;
            uint64_t v91 = *(void *)(v88 + 8);
            if (v92 >= (*(void *)(v88 + 16) - v91) >> 1) {
              goto LABEL_70;
            }
          }
        }
      }
      int v7 = 0;
LABEL_81:

      return v7;
    }
  }
  return -7;
}

- (int)playDrawDriverString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 < 4) {
    return 0;
  }
  unsigned __int8 v5 = a5;
  uint64_t v9 = *(unsigned __int8 *)a3;
  if ((a5 & 0x8000) != 0)
  {
    uint64_t v17 = +[OITSUColor colorWithBinaryRed:*((unsigned __int8 *)a3 + 2) green:*((unsigned __int8 *)a3 + 1) blue:v9 alpha:*((unsigned __int8 *)a3 + 3)];
    if (v17) {
      goto LABEL_7;
    }
    return 0;
  }
  float v10 = [(MFPGraphics *)self->mGraphics objectTable];
  float v11 = [v10 objectAtIndex:v9];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = TSUDynamicCast(v12, (uint64_t)v11);
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = TSUDynamicCast(v14, (uint64_t)v11);
  double v16 = v15;
  if (!v13 && v15)
  {
    uint64_t v13 = [v15 brush];
  }
  uint64_t v17 = [v13 color];

  if (!v17) {
    return 0;
  }
LABEL_7:
  CGFloat a = *MEMORY[0x263F000D0];
  double v19 = *(double *)(MEMORY[0x263F000D0] + 8);
  double c = *(double *)(MEMORY[0x263F000D0] + 16);
  double v21 = *(double *)(MEMORY[0x263F000D0] + 24);
  tdouble x = *(double *)(MEMORY[0x263F000D0] + 32);
  tdouble y = *(double *)(MEMORY[0x263F000D0] + 40);
  v67 = (void *)v17;
  if (a4 < 0xA)
  {
    unsigned int v25 = 0;
    char v24 = 0;
LABEL_15:
    CGFloat v27 = 0;
    int v28 = 0;
    unsigned int v26 = 16;
    goto LABEL_16;
  }
  char v24 = a3[8];
  if (a4 < 0xE)
  {
    unsigned int v25 = 0;
    goto LABEL_15;
  }
  unsigned int v25 = *((unsigned __int16 *)a3 + 6);
  unsigned int v26 = 2 * v25 + 16;
  if (v26 <= a4)
  {
    CGFloat v27 = (void *)[[NSString alloc] initWithBytes:a3 + 16 length:2 * v25 encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    int v28 = 1;
  }
  else
  {
    CGFloat v27 = 0;
    int v28 = 0;
  }
LABEL_16:
  std::vector<CGPoint>::vector(v73, v25);
  char v30 = v28 ^ 1;
  if (!v25) {
    char v30 = 1;
  }
  if (v30)
  {
    if (v28) {
      goto LABEL_25;
    }
  }
  else if (v26 + 16 * v25 <= a4)
  {
    uint64_t v31 = 0;
    int v32 = &a3[v26];
    int v33 = v32;
    do
    {
      +[MFByteUtils readFloat32FromByteArray:v33 in_offset:0];
      *(double *)((char *)v73[0] + v31) = v34;
      +[MFByteUtils readFloat32FromByteArray:v33 + 4 in_offset:0];
      *(double *)((char *)v73[0] + v31 + 8) = v35;
      v31 += 16;
      v33 += 8;
    }
    while (16 * v25 != v31);
    if (v24)
    {
      unsigned int v36 = v67;
      readAffineTransform((const unsigned __int8 *)&v32[8 * v25], &v72.a);
      CGFloat a = v72.a;
      double c = v72.c;
      v71.CGFloat a = v72.a;
      v71.CGFloat b = v72.b;
      CGFloat d = v72.d;
      CGFloat b = v72.b;
      v71.double c = v72.c;
      v71.CGFloat d = v72.d;
      v71.tdouble x = 0.0;
      v71.tdouble y = 0.0;
      CGAffineTransformInvert(&v72, &v71);
      double v37 = v72.a;
      double v19 = v72.b;
      double v38 = v72.c;
      double v21 = v72.d;
      CGFloat v62 = 0.0;
      int v39 = 1;
      double v65 = 0.0;
      tdouble x = v72.tx;
      tdouble y = v72.ty;
      goto LABEL_26;
    }
LABEL_25:
    int v39 = 0;
    CGFloat v62 = ty;
    CGFloat d = v21;
    CGFloat b = v19;
    double v65 = tx;
    double v38 = c;
    double v37 = a;
    unsigned int v36 = v67;
LABEL_26:
    if (self->mGraphics)
    {
      int v40 = TCCurrentGraphicsContext();
      CGContextSaveGState(v40);
      [v36 set];
      uint64_t v41 = [(MFPGraphics *)self->mGraphics objectTable];
      CGFloat v42 = [v41 objectAtIndex:v5];

      unint64_t v43 = (const __CTFont *)[v42 createCTFontWithGraphics:self->mGraphics];
      float v44 = CTFontCopyGraphicsFont(v43, 0);
      double v61 = a;
      double Ascent = CTFontGetAscent(v43);
      float v46 = TCCurrentGraphicsContext();
      CGContextSetFont(v46, v44);
      unsigned int v47 = TCCurrentGraphicsContext();
      CGFloat Size = CTFontGetSize(v43);
      CGContextSetFontSize(v47, Size);
      float v49 = Ascent;
      float v66 = v49;
      double v50 = 0.0;
      if (v39)
      {
        double v60 = v21;
        float v51 = TCCurrentGraphicsContext();
        transform.CGFloat a = v61;
        transform.CGFloat b = b;
        transform.double c = c;
        transform.CGFloat d = d;
        transform.tdouble x = v65;
        transform.tdouble y = v62;
        CGContextConcatCTM(v51, &transform);
        float v52 = v65 + c * v66 + v61 * 0.0;
        double v50 = (float)-v52;
      }
      if (v25)
      {
        uint64_t v53 = 0;
        double v54 = v66;
        do
        {
          UniChar characters = 0;
          UniChar characters = objc_msgSend(v27, "characterAtIndex:", v53, *(void *)&v60);
          CGGlyph glyphs = 0;
          CTFontGetGlyphsForCharacters(v43, &characters, &glyphs, 1);
          *(_OWORD *)&v72.CGFloat a = *((_OWORD *)v73[0] + v53);
          double v55 = v72.b - v54;
          double v56 = v50 + v72.a;
          v72.CGFloat a = v50 + v72.a;
          v72.CGFloat b = v72.b - v54;
          if (v39)
          {
            v72.CGFloat a = tx + v38 * v55 + v37 * v56;
            v72.CGFloat b = ty + v21 * v55 + v19 * v56;
          }
          double v57 = TCCurrentGraphicsContext();
          CGContextShowGlyphsAtPositions(v57, &glyphs, (const CGPoint *)&v72, 1uLL);
          ++v53;
        }
        while (v53 != v25);
      }
      double v58 = TCCurrentGraphicsContext();
      CGContextRestoreGState(v58);
      CFRelease(v44);
      CFRelease(v43);

      int v29 = 0;
    }
    else
    {
      int v29 = -1;
    }
    goto LABEL_37;
  }
  int v29 = -1;
  unsigned int v36 = v67;
LABEL_37:
  if (v73[0])
  {
    v73[1] = v73[0];
    operator delete(v73[0]);
  }

  return v29;
}

- (int)playGetDC:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSave:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playRestore:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playBeginContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  Float32double Rect = readFloat32Rect((const unsigned __int8 *)a3);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = readFloat32Rect((const unsigned __int8 *)a3 + 16);
  -[MFPGraphics beginContainerWithId:boundsInParent:bounds:boundsUnit:](self->mGraphics, "beginContainerWithId:boundsInParent:bounds:boundsUnit:", *((unsigned int *)a3 + 8), v5, Float32Rect, v10, v12, v14, v15, v16, v17, v18);
  return 0;
}

- (int)playBeginContainerNoParams:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playEndContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  uint64_t v5 = [(MFPGraphics *)self->mGraphics currentState];
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  [v5 setWorldTransform:v7];

  return 0;
}

- (int)playResetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = [(MFPGraphics *)self->mGraphics currentState];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setWorldTransform:v8];

  return 0;
}

- (int)playMultiplyWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  uint64_t v5 = (a5 >> 13) & 1;
  long long v6 = [(MFPGraphics *)self->mGraphics currentState];
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  [v6 multiplyWorldTransformBy:v8 order:v5];

  return 0;
}

- (int)playTranslateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  float v9 = v8;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, v9, v10);
  uint64_t v11 = (v5 >> 13) & 1;
  double v12 = [(MFPGraphics *)self->mGraphics currentState];
  CGAffineTransform v14 = v15;
  [v12 multiplyWorldTransformBy:&v14 order:v11];

  return 0;
}

- (int)playScaleWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  float v9 = v8;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v9, v10);
  uint64_t v11 = (v5 >> 13) & 1;
  double v12 = [(MFPGraphics *)self->mGraphics currentState];
  CGAffineTransform v14 = v15;
  [v12 multiplyWorldTransformBy:&v14 order:v11];

  return 0;
}

- (int)playRotateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, v7 * 3.14159265 / 180.0);
  uint64_t v8 = (v5 >> 13) & 1;
  float v9 = [(MFPGraphics *)self->mGraphics currentState];
  CGAffineTransform v11 = v12;
  [v9 multiplyWorldTransformBy:&v11 order:v8];

  return 0;
}

- (int)playSetPageTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  mGraphics = self->mGraphics;
  if (mGraphics)
  {
    -[MFPGraphics pageTransformWithScale:unit:](mGraphics, "pageTransformWithScale:unit:", v5);
    mGraphics = self->mGraphics;
  }
  uint64_t v8 = [(MFPGraphics *)mGraphics currentState];
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  [v8 setPageTransform:v10];

  return 0;
}

- (int)playResetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)setClipPath:(id)a3 flags:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  if (v4 <= 0xFF)
  {
    [(MFPGraphics *)self->mGraphics areThereOpenContainers];
LABEL_4:
    [v6 addClip];
    goto LABEL_5;
  }
  if ((v4 & 0xFF00) == 0x100) {
    goto LABEL_4;
  }
LABEL_5:

  return 0;
}

- (int)playSetClipRect:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  float v7 = +[OITSUBezierPath bezierPathWithRect:readRect((const unsigned __int8 *)a3, a5)];
  [(EMFPlusPlayer *)self setClipPath:v7 flags:v5];

  return 0;
}

- (int)playSetClipPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  float v7 = [(MFPGraphics *)self->mGraphics objectTable];
  uint64_t v8 = [v7 objectAtIndex:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v9 = [v8 path];
    [(EMFPlusPlayer *)self setClipPath:v9 flags:v5];
  }
  return 0;
}

- (int)playSetClipRegion:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playOffsetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetRenderingOrigin:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int v5 = *(_DWORD *)a3;
  int v6 = *((_DWORD *)a3 + 1);
  float v7 = TCCurrentGraphicsContext();
  v9.double width = (double)v5;
  v9.double height = (double)v6;
  CGContextSetPatternPhase(v7, v9);
  return 0;
}

- (int)playSetAntiAliasMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int v5 = a5;
  int v6 = TCCurrentGraphicsContext();
  CGContextSetShouldAntialias(v6, v5 != 0);
  return 0;
}

- (int)playSetTextRenderingHint:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetTextContrast:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetInterpolationMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if ((a5 - 1) > 6) {
    CGInterpolationQuality v5 = kCGInterpolationDefault;
  }
  else {
    CGInterpolationQuality v5 = dword_238EDE188[(__int16)(a5 - 1)];
  }
  int v6 = TCCurrentGraphicsContext();
  CGContextSetInterpolationQuality(v6, v5);
  return 0;
}

- (int)playSetPixelOffsetMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetCompositingMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetCompositingQuality:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playBlurEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  int v7 = v6;
  BOOL v8 = *((_DWORD *)a3 + 1) != 0;
  CGSize v9 = [MFPBlurEffect alloc];
  LODWORD(v10) = v7;
  long long v11 = [(MFPBlurEffect *)v9 initWithRadius:v8 expandEdge:v10];
  mEffect = self->mEffect;
  self->mEffect = v11;

  return 0;
}

- (int)playSharpenEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:0];
  int v7 = v6;
  +[MFByteUtils readFloat32FromByteArray:a3 in_offset:4];
  int v9 = v8;
  double v10 = [MFPSharpenEffect alloc];
  LODWORD(v11) = v9;
  LODWORD(v12) = v7;
  long long v13 = [(MFPSharpenEffect *)v10 initWithAmount:v11 radius:v12];
  mEffect = self->mEffect;
  self->mEffect = v13;

  return 0;
}

- (int)playColorMatrixEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  do
  {
    for (uint64_t i = 0; i != 20; i += 4)
    {
      +[MFByteUtils readFloat32FromByteArray:a3 in_offset:(v6 + i)];
      *(_DWORD *)&v13[v6 + i] = v9;
    }
    ++v7;
    v6 += 20;
  }
  while (v7 != 5);
  double v10 = [[MFPColorMatrixEffect alloc] initWithColorMatrix:v13];
  mEffect = self->mEffect;
  self->mEffect = &v10->super;

  return 0;
}

- (int)playColorLUTEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPColorLUTEffect alloc] initWithLUTA:a3 LUTR:a3 + 256 LUTG:a3 + 512 LUTB:a3 + 768];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playBrightnessContrastEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPBrightnessContrastEffect alloc] initWithBrightness:*(unsigned int *)a3 contrast:*((unsigned int *)a3 + 1)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playHueSaturationLightnessEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPHueSaturationLightnessEffect alloc] initWithHueChange:*(unsigned int *)a3 saturationChange:*((unsigned int *)a3 + 1) lightnessChange:*((unsigned int *)a3 + 2)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playLevelsEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPLevelsEffect alloc] initWithHighlight:*(unsigned int *)a3 midtone:*((unsigned int *)a3 + 1) shadow:*((unsigned int *)a3 + 2)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playTintEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPTintEffect alloc] initWithHue:*(unsigned int *)a3 amount:*((unsigned int *)a3 + 1)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playColorBalanceEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPColorBalanceEffect alloc] initWithCyanRed:*(unsigned int *)a3 magentaGreen:*((unsigned int *)a3 + 1) yellowBlue:*((unsigned int *)a3 + 2)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playRedEyeCorrectionEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  unint64_t v6 = *(unsigned int *)a3;
  std::vector<CGRect>::vector(__p, v6);
  if (v6)
  {
    uint64_t v7 = 0;
    int v8 = (double *)((char *)__p[0] + 16);
    do
    {
      int v9 = (unsigned __int16 *)&a3[(v7 & 0xFFFFFFF0) + 8];
      int v10 = *v9;
      int v11 = v9[2];
      double v12 = (double)(v9[4] - v10);
      double v13 = (double)(v9[6] - v11);
      *(v8 - 2) = (double)v10;
      *(v8 - 1) = (double)v11;
      double *v8 = v12;
      v8[1] = v13;
      v8 += 4;
      v7 += 16;
    }
    while (16 * v6 != v7);
  }
  uint64_t v14 = [[MFPRedEyeCorrectionEffect alloc] initWithAreas:__p];
  mEffect = self->mEffect;
  self->mEffect = &v14->super;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return 0;
}

- (int)playColorCurveEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  CGInterpolationQuality v5 = [[MFPColorCurveEffect alloc] initWithAdjustment:*(unsigned int *)a3 channel:*((unsigned int *)a3 + 1) adjustValue:*((unsigned int *)a3 + 2)];
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playSerializableObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  if (a4 < 0x14) {
    return -7;
  }
  uint16x8_t v8 = vmovl_u8(*(uint8x8_t *)(a3 + 8));
  int v9 = +[EMFPlusPlayer serializableObjectTypeForGUID:](EMFPlusPlayer, "serializableObjectTypeForGUID:", objc_msgSend(NSString, "stringWithFormat:", @"%08X-%04hX-%04hX-%02hX%02hX-%02hX%02hX%02hX%02hX%02hX%02hX", *(unsigned int *)a3, *((unsigned __int16 *)a3 + 2), *((unsigned __int16 *)a3 + 3), v8.u16[0], v8.u16[1], v8.u16[2], v8.u16[3], v8.u16[4], v8.u16[5], v8.u16[6], v8.u16[7]))- 1;
  uint64_t v10 = *((unsigned __int16 *)a3 + 8);
  int v11 = a3 + 20;
  switch(v9)
  {
    case 0:
      int result = [(EMFPlusPlayer *)self playBlurEffectWithData:v11 size:v10];
      break;
    case 1:
      int result = [(EMFPlusPlayer *)self playSharpenEffectWithData:v11 size:v10];
      break;
    case 2:
      int result = [(EMFPlusPlayer *)self playColorMatrixEffectWithData:v11 size:v10];
      break;
    case 3:
      int result = [(EMFPlusPlayer *)self playColorLUTEffectWithData:v11 size:v10];
      break;
    case 4:
      int result = [(EMFPlusPlayer *)self playBrightnessContrastEffectWithData:v11 size:v10];
      break;
    case 5:
      int result = [(EMFPlusPlayer *)self playHueSaturationLightnessEffectWithData:v11 size:v10];
      break;
    case 6:
      int result = [(EMFPlusPlayer *)self playLevelsEffectWithData:v11 size:v10];
      break;
    case 7:
      int result = [(EMFPlusPlayer *)self playTintEffectWithData:v11 size:v10];
      break;
    case 8:
      int result = [(EMFPlusPlayer *)self playColorBalanceEffectWithData:v11 size:v10];
      break;
    case 9:
      int result = [(EMFPlusPlayer *)self playRedEyeCorrectionEffectWithData:v11 size:v10];
      break;
    case 10:
      int result = [(EMFPlusPlayer *)self playColorCurveEffectWithData:v11 size:v10];
      break;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (int)playRecord:(int)a3 pData:(const char *)a4 dataSize:(unsigned int)a5 flags:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  int v11 = self->mEffect;
  switch((int)v9)
  {
    case 16385:
      int v12 = [(EMFPlusPlayer *)self playHeader:a4 in_size:v7 in_flags:v6];
      break;
    case 16388:
      int v12 = [(EMFPlusPlayer *)self playGetDC:a4 in_size:v7 in_flags:v6];
      break;
    case 16392:
      int v12 = [(EMFPlusPlayer *)self playObject:a4 in_size:v7 in_flags:v6];
      break;
    case 16393:
      int v12 = [(EMFPlusPlayer *)self playClear:a4 in_size:v7 in_flags:v6];
      break;
    case 16394:
      int v12 = [(EMFPlusPlayer *)self playFillRects:a4 in_size:v7 in_flags:v6];
      break;
    case 16395:
      int v12 = [(EMFPlusPlayer *)self playDrawRects:a4 in_size:v7 in_flags:v6];
      break;
    case 16396:
      int v12 = [(EMFPlusPlayer *)self playFillPolygon:a4 in_size:v7 in_flags:v6];
      break;
    case 16397:
      int v12 = [(EMFPlusPlayer *)self playDrawLines:a4 in_size:v7 in_flags:v6];
      break;
    case 16398:
      int v12 = [(EMFPlusPlayer *)self playFillEllipse:a4 in_size:v7 in_flags:v6];
      break;
    case 16399:
      int v12 = [(EMFPlusPlayer *)self playDrawEllipse:a4 in_size:v7 in_flags:v6];
      break;
    case 16400:
      int v12 = [(EMFPlusPlayer *)self playFillPie:a4 in_size:v7 in_flags:v6];
      break;
    case 16401:
      int v12 = [(EMFPlusPlayer *)self playDrawPie:a4 in_size:v7 in_flags:v6];
      break;
    case 16402:
      int v12 = [(EMFPlusPlayer *)self playDrawArc:a4 in_size:v7 in_flags:v6];
      break;
    case 16404:
      int v12 = [(EMFPlusPlayer *)self playFillPath:a4 in_size:v7 in_flags:v6];
      break;
    case 16405:
      int v12 = [(EMFPlusPlayer *)self playDrawPath:a4 in_size:v7 in_flags:v6];
      break;
    case 16406:
      int v12 = [(EMFPlusPlayer *)self playFillClosedCurve:a4 in_size:v7 in_flags:v6];
      break;
    case 16407:
      int v12 = [(EMFPlusPlayer *)self playDrawClosedCurve:a4 in_size:v7 in_flags:v6];
      break;
    case 16408:
      int v12 = [(EMFPlusPlayer *)self playDrawCurve:a4 in_size:v7 in_flags:v6];
      break;
    case 16409:
      int v12 = [(EMFPlusPlayer *)self playDrawBeziers:a4 in_size:v7 in_flags:v6];
      break;
    case 16410:
      int v12 = [(EMFPlusPlayer *)self playDrawImage:a4 in_size:v7 in_flags:v6];
      break;
    case 16411:
      int v12 = [(EMFPlusPlayer *)self playDrawImagePoints:a4 in_size:v7 in_flags:v6];
      break;
    case 16412:
      int v12 = [(EMFPlusPlayer *)self playDrawString:a4 in_size:v7 in_flags:v6];
      break;
    case 16413:
      int v12 = [(EMFPlusPlayer *)self playSetRenderingOrigin:a4 in_size:v7 in_flags:v6];
      break;
    case 16414:
      int v12 = [(EMFPlusPlayer *)self playSetAntiAliasMode:a4 in_size:v7 in_flags:v6];
      break;
    case 16415:
      int v12 = [(EMFPlusPlayer *)self playSetTextRenderingHint:a4 in_size:v7 in_flags:v6];
      break;
    case 16416:
      int v12 = [(EMFPlusPlayer *)self playSetTextContrast:a4 in_size:v7 in_flags:v6];
      break;
    case 16417:
      int v12 = [(EMFPlusPlayer *)self playSetInterpolationMode:a4 in_size:v7 in_flags:v6];
      break;
    case 16418:
      int v12 = [(EMFPlusPlayer *)self playSetPixelOffsetMode:a4 in_size:v7 in_flags:v6];
      break;
    case 16419:
      int v12 = [(EMFPlusPlayer *)self playSetCompositingMode:a4 in_size:v7 in_flags:v6];
      break;
    case 16420:
      int v12 = [(EMFPlusPlayer *)self playSetCompositingQuality:a4 in_size:v7 in_flags:v6];
      break;
    case 16421:
      int v12 = [(EMFPlusPlayer *)self playSave:a4 in_size:v7 in_flags:v6];
      break;
    case 16422:
      int v12 = [(EMFPlusPlayer *)self playRestore:a4 in_size:v7 in_flags:v6];
      break;
    case 16423:
      int v12 = [(EMFPlusPlayer *)self playBeginContainer:a4 in_size:v7 in_flags:v6];
      break;
    case 16424:
      int v12 = [(EMFPlusPlayer *)self playBeginContainerNoParams:a4 in_size:v7 in_flags:v6];
      break;
    case 16425:
      int v12 = [(EMFPlusPlayer *)self playEndContainer:a4 in_size:v7 in_flags:v6];
      break;
    case 16426:
      int v12 = [(EMFPlusPlayer *)self playSetWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16427:
      int v12 = [(EMFPlusPlayer *)self playResetWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16428:
      int v12 = [(EMFPlusPlayer *)self playMultiplyWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16429:
      int v12 = [(EMFPlusPlayer *)self playTranslateWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16430:
      int v12 = [(EMFPlusPlayer *)self playScaleWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16431:
      int v12 = [(EMFPlusPlayer *)self playRotateWorldTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16432:
      int v12 = [(EMFPlusPlayer *)self playSetPageTransform:a4 in_size:v7 in_flags:v6];
      break;
    case 16433:
      int v12 = [(EMFPlusPlayer *)self playResetClip:a4 in_size:v7 in_flags:v6];
      break;
    case 16434:
      int v12 = [(EMFPlusPlayer *)self playSetClipRect:a4 in_size:v7 in_flags:v6];
      break;
    case 16435:
      int v12 = [(EMFPlusPlayer *)self playSetClipPath:a4 in_size:v7 in_flags:v6];
      break;
    case 16436:
      int v12 = [(EMFPlusPlayer *)self playSetClipRegion:a4 in_size:v7 in_flags:v6];
      break;
    case 16437:
      int v12 = [(EMFPlusPlayer *)self playOffsetClip:a4 in_size:v7 in_flags:v6];
      break;
    case 16438:
      int v12 = [(EMFPlusPlayer *)self playDrawDriverString:a4 in_size:v7 in_flags:v6];
      break;
    case 16440:
      int v12 = [(EMFPlusPlayer *)self playSerializableObject:a4 in_size:v7 in_flags:v6];
      break;
    default:
      int v12 = [(EMFPlusPlayer *)self playUnknown:a4 in_size:v7 in_type:v9 in_flags:v6];
      break;
  }
  int v13 = v12;
  mEffect = self->mEffect;
  if (mEffect) {
    BOOL v15 = mEffect == v11;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    [(EMFPlusPlayer *)self setEffect:0];
  }

  return v13;
}

- (void)resetLargeRecord
{
  self->mLargeType = 0x4000;
  self->mLargeFlags = 0;
  self->mLargeCGFloat Size = 0;
  [(NSMutableData *)self->mLargeData setLength:0];
}

- (int)play:(const char *)a3 in_size:(unsigned int)a4
{
  unsigned int v4 = a4;
  if (a4 >= 0xC)
  {
    char v7 = 0;
    while (1)
    {
      unsigned int v8 = *((_DWORD *)a3 + 1);
      if (v8 < 0xC) {
        return -7;
      }
      int v9 = *((_DWORD *)a3 + 2);
      if (v8 != v9 + 12) {
        return -7;
      }
      if (v8 >= v4) {
        unsigned int v10 = v4;
      }
      else {
        unsigned int v10 = *((_DWORD *)a3 + 1);
      }
      if (v8 >= v4) {
        unsigned int v11 = v8 - v4;
      }
      else {
        unsigned int v11 = 0;
      }
      uint64_t v12 = v9 - v11;
      if (v9 == v11)
      {
        int v13 = 0;
        goto LABEL_20;
      }
      uint64_t v14 = *(unsigned __int16 *)a3;
      int v15 = *((__int16 *)a3 + 1);
      if ((v14 - 16394) < 0xD || v14 == 16412 || v14 == 16438 || (v15 & 0x80000000) == 0)
      {
        if (self->mLargeType != 0x4000)
        {
          [(EMFPlusPlayer *)self resetLargeRecord];
          char v7 = 1;
        }
        int v16 = [(EMFPlusPlayer *)self playRecord:v14 pData:a3 + 12 dataSize:v12 flags:(unsigned __int16)v15];
        goto LABEL_17;
      }
      unsigned int v18 = *((_DWORD *)a3 + 3);
      uint64_t v19 = (v12 - 4);
      int mLargeType = self->mLargeType;
      if (mLargeType == 0x4000)
      {
        if (v18 <= v19) {
          goto LABEL_43;
        }
        self->int mLargeType = v14;
        self->mLargeFlags = v15;
        self->mLargeCGFloat Size = v18;
        [(NSMutableData *)self->mLargeData setLength:0];
        [(NSMutableData *)self->mLargeData appendBytes:a3 + 16 length:v19];
      }
      else
      {
        if (__PAIR64__(self->mLargeFlags, mLargeType) != __PAIR64__((unsigned __int16)v15, v14)
          || v18 != self->mLargeSize)
        {
LABEL_43:
          [(EMFPlusPlayer *)self resetLargeRecord];
          return -7;
        }
        [(NSMutableData *)self->mLargeData appendBytes:a3 + 16 length:v19];
        unsigned int v21 = [(NSMutableData *)self->mLargeData length];
        mLargeCGFloat Size = self->mLargeSize;
        if (mLargeSize == v21)
        {
          int v16 = [(EMFPlusPlayer *)self playRecord:self->mLargeType pData:[(NSMutableData *)self->mLargeData bytes] dataSize:self->mLargeSize flags:self->mLargeFlags];
          [(EMFPlusPlayer *)self resetLargeRecord];
          goto LABEL_17;
        }
        if (mLargeSize < v21) {
          goto LABEL_43;
        }
      }
      int v16 = 0;
LABEL_17:
      v7 |= v16 == -7;
      if (v16 == -7) {
        int v13 = 0;
      }
      else {
        int v13 = v16;
      }
LABEL_20:
      a3 += v10;
      v4 -= v10;
      if (v4 < 0xC || v13 != 0) {
        goto LABEL_38;
      }
    }
  }
  char v7 = 0;
  int v13 = 0;
LABEL_38:
  if (((v13 == 0) & v7) != 0) {
    int v13 = -7;
  }
  if (v4) {
    return -7;
  }
  else {
    return v13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffect, 0);
  objc_storeStrong((id *)&self->mLargeData, 0);
  objc_storeStrong((id *)&self->mOwner, 0);
  objc_storeStrong((id *)&self->mGraphics, 0);
}

@end