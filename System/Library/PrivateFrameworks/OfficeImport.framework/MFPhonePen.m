@interface MFPhonePen
+ (id)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6 LPToDPTransform:(CGAffineTransform *)a7;
- (MFPhonePen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6;
- (void)applyDashedLinesToPath:(id)a3;
- (void)applyLineCapStyleToPath:(id)a3;
- (void)applyLineJoinStyleToPath:(id)a3 in_path:(id)a4;
- (void)strokePath:(id)a3 in_path:(id)a4;
@end

@implementation MFPhonePen

+ (id)penWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6 LPToDPTransform:(CGAffineTransform *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  v13 = (float *)objc_alloc((Class)a1);
  v14 = v13;
  if ((int)v10 > 4 || v9)
  {
    v13[8] = (float)(int)v9;
  }
  else
  {
    long long v15 = *(_OWORD *)&a7->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&a7->a;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tx = *(_OWORD *)&a7->tx;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v20, &v19);
    float v16 = v20.a + v20.c;
    v14[8] = v16;
    uint64_t v9 = 1;
  }
  v17 = (void *)[v14 initWithStyle:v10 width:v9 colour:v12 styleArray:a6];

  return v17;
}

- (MFPhonePen)initWithStyle:(int)a3 width:(int)a4 colour:(id)a5 styleArray:(double *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)MFPhonePen;
  return [(MFPen *)&v7 initWithStyle:*(void *)&a3 width:*(void *)&a4 colour:a5 styleArray:a6];
}

- (void)applyDashedLinesToPath:(id)a3
{
  v12[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = ([(MFPen *)self getStyle] & 0xF) - 1;
  if (v5 < 4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = qword_238EDE558[v5];
    int v8 = s_dashArraysSize[v7];
    float m_PixelSize = self->m_PixelSize;
    if (v8 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v8;
    }
    v11 = (char *)&s_dashArrays + 24 * v7;
    do
    {
      *(double *)&v12[v6] = (float)(*(float *)&v11[4 * v6] * m_PixelSize);
      ++v6;
    }
    while (v10 != v6);
    objc_msgSend(v4, "setLineDash:count:phase:", v12, 0.0);
  }
}

- (void)applyLineCapStyleToPath:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MFPen *)self getStyle] & 0xF00;
  uint64_t v5 = 1;
  if (v4 == 256) {
    uint64_t v5 = 2;
  }
  if (v4 == 512) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  [v7 setLineCapStyle:v6];
}

- (void)applyLineJoinStyleToPath:(id)a3 in_path:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  int v7 = [(MFPen *)self getStyle] & 0xF000;
  uint64_t v8 = 1;
  if (v7 == 4096) {
    uint64_t v8 = 2;
  }
  if (v7 == 0x2000) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  [v6 setLineJoinStyle:v9];
  if (v7 == 0x2000)
  {
    [v12 getMiterLimit];
    double v11 = v10;
    if (v10 < 0.0) {
      [v6 setMiterLimit:10.0];
    }
    [v6 setMiterLimit:v11];
  }
}

- (void)strokePath:(id)a3 in_path:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  int v7 = +[MFPhoneDeviceDriver getROP:v14];
  int v8 = v7;
  if (self->super.m_penStyle != 5 && v7 != 3)
  {
    int m_penWidth = self->super.m_penWidth;
    if (m_penWidth)
    {
      [v6 setLineWidth:(double)m_penWidth];
      if (v8 == 1)
      {
        double v11 = +[OITSUColor whiteColor];
        [v11 set];
      }
      else
      {
        if (v8) {
          [(MFPen *)self getColor];
        }
        else {
        double v11 = +[OITSUColor blackColor];
        }
        [v11 set];
      }

      [(MFPhonePen *)self applyDashedLinesToPath:v6];
      int m_penStyle = self->super.m_penStyle;
      if ((m_penStyle & 0xF0000) == 0x10000 || self->super.m_penWidth >= 2)
      {
        [(MFPhonePen *)self applyLineCapStyleToPath:v6];
        [(MFPhonePen *)self applyLineJoinStyleToPath:v14 in_path:v6];
        int m_penStyle = self->super.m_penStyle;
      }
      if ((~m_penStyle & 0x12000) == 0)
      {
        [v14 getMiterLimit];
        if (v13 > 0.0 && v13 != 4.0) {
          objc_msgSend(v6, "setMiterLimit:");
        }
      }
      [v6 stroke];
    }
  }
}

@end