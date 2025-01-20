@interface EMFPlayer
+ (CGRect)boundsInLogicalUnits:(id)a3;
+ (CGRect)boundsInPoints:(id)a3;
- (EMFPlayer)initWithGraphicsDevice:(id)a3;
- (id)getGdi;
- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playAbortPath:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playAlphaBlend:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playAngleArc:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playArcTo:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playBeginPath:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCloseFigure:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateDibPatternBrushPT:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateMonoBrush:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playEndPath:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExtCreateFontIndirectW:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExtCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4 wideChars:(BOOL)a5;
- (int)playExtTextOutA:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExtTextOutW:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playFillRgn:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playInvertRgn:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playMaskBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playModifyWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playMoveToEx:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPaintRgn:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPlgBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPolyBezier:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyBezierTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyDraw:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyLineTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5;
- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectClipPath:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetArcDirection:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetBrushOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetDIBitsToDevice:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetMetaRgn:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetMiterLimit:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetRop2:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playStretchDIBits:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playStrokeAndFillPath:(unsigned int)a3 in_pRecord:(const char *)a4 in_stroke:(BOOL)a5 in_fill:(BOOL)a6;
- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5;
- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5;
- (int)playWidenPath:(unsigned int)a3 in_pRecord:(const char *)a4;
- (void)done;
- (void)setIgnoreEMFPlusRecords:(BOOL)a3;
- (void)setIgnoreEMFRecords:(BOOL)a3;
@end

@implementation EMFPlayer

- (EMFPlayer)initWithGraphicsDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMFPlayer;
  v6 = [(EMFPlayer *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_gdi, a3);
    v7->m_headerDone = 0;
    v8 = [EMFPlusPlayer alloc];
    [v5 getCanvas];
    uint64_t v9 = -[EMFPlusPlayer initWithOwner:canvas:](v8, "initWithOwner:canvas:", v7);
    m_emfPlusPlayer = v7->m_emfPlusPlayer;
    v7->m_emfPlusPlayer = (EMFPlusPlayer *)v9;
  }
  return v7;
}

- (void)setIgnoreEMFPlusRecords:(BOOL)a3
{
  self->m_ignoreEMFPlusRecords = a3;
}

- (void)setIgnoreEMFRecords:(BOOL)a3
{
  self->m_ignoreEMFRecords = a3;
}

- (void)done
{
  [(MFGraphicsDevice *)self->m_gdi done];
  m_emfPlusPlayer = self->m_emfPlusPlayer;
  self->m_emfPlusPlayer = 0;
}

+ (CGRect)boundsInPoints:(id)a3
{
  id v3 = a3;
  v4 = (int *)[v3 bytes];
  if ((unint64_t)[v3 length] > 0x4F)
  {
    double v5 = (double)v4[6] * 0.0283464569;
    double v6 = (double)v4[7] * 0.0283464569;
    double v7 = (double)v4[8] * 0.0283464569 - v5;
    double v8 = (double)v4[9] * 0.0283464569 - v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)getGdi
{
  return self->m_gdi;
}

- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 4) {
    return -7;
  }
  int v7 = *(_DWORD *)a4;
  if (self->m_headerDone)
  {
    if (!self->m_ignoreEMFPlusRecords && v7 == 70)
    {
      if (a3 < 0x10) {
        return -7;
      }
      if (*((_DWORD *)a4 + 3) == 726027589)
      {
        int v8 = *((_DWORD *)a4 + 2);
        self->m_ignoreEMFRecords = 1;
        if (v8 - 4 <= a3 - 16) {
          return -[EMFPlusPlayer play:in_size:](self->m_emfPlusPlayer, "play:in_size:", a4 + 16);
        }
        return -7;
      }
    }
    if (self->m_ignoreEMFRecords) {
      return 0;
    }
    int v4 = -2;
    switch(v7)
    {
      case 1:
      case 15:
      case 16:
      case 23:
      case 53:
      case 65:
      case 70:
      case 72:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
        int result = -[EMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:");
        break;
      case 2:
      case 85:
        int result = -[EMFPlayer playPolyBezier:in_pRecord:in_is16bit:](self, "playPolyBezier:in_pRecord:in_is16bit:");
        break;
      case 3:
      case 86:
        int result = -[EMFPlayer playPolygon:in_pRecord:in_is16bit:](self, "playPolygon:in_pRecord:in_is16bit:");
        break;
      case 4:
      case 87:
        int result = -[EMFPlayer playPolyLine:in_pRecord:in_is16bit:](self, "playPolyLine:in_pRecord:in_is16bit:");
        break;
      case 5:
      case 88:
        int result = -[EMFPlayer playPolyBezierTo:in_pRecord:in_is16bit:](self, "playPolyBezierTo:in_pRecord:in_is16bit:");
        break;
      case 6:
      case 89:
        int result = -[EMFPlayer playPolyLineTo:in_pRecord:in_is16bit:](self, "playPolyLineTo:in_pRecord:in_is16bit:");
        break;
      case 7:
      case 90:
        int result = -[EMFPlayer playPolyPolyLine:in_pRecord:in_is16bit:](self, "playPolyPolyLine:in_pRecord:in_is16bit:");
        break;
      case 8:
      case 91:
        int result = -[EMFPlayer playPolyPolygon:in_pRecord:in_is16bit:](self, "playPolyPolygon:in_pRecord:in_is16bit:");
        break;
      case 9:
        int result = -[EMFPlayer playSetWindowExt:in_pRecord:](self, "playSetWindowExt:in_pRecord:");
        break;
      case 10:
        int result = -[EMFPlayer playSetWindowOrg:in_pRecord:](self, "playSetWindowOrg:in_pRecord:");
        break;
      case 11:
        int result = -[EMFPlayer playSetViewportExt:in_pRecord:](self, "playSetViewportExt:in_pRecord:");
        break;
      case 12:
        int result = -[EMFPlayer playSetViewportOrg:in_pRecord:](self, "playSetViewportOrg:in_pRecord:");
        break;
      case 13:
        int result = -[EMFPlayer playSetBrushOrg:in_pRecord:](self, "playSetBrushOrg:in_pRecord:");
        break;
      case 14:
        return v4;
      case 17:
        int result = -[EMFPlayer playSetMapMode:in_pRecord:](self, "playSetMapMode:in_pRecord:");
        break;
      case 18:
        int result = -[EMFPlayer playSetBkMode:in_pRecord:](self, "playSetBkMode:in_pRecord:");
        break;
      case 19:
        int result = -[EMFPlayer playSetPolyFillMode:in_pRecord:](self, "playSetPolyFillMode:in_pRecord:");
        break;
      case 20:
        int result = -[EMFPlayer playSetRop2:in_pRecord:](self, "playSetRop2:in_pRecord:");
        break;
      case 21:
        int result = -[EMFPlayer playSetStretchBltMode:in_pRecord:](self, "playSetStretchBltMode:in_pRecord:");
        break;
      case 22:
        int result = -[EMFPlayer playSetTextAlign:in_pRecord:](self, "playSetTextAlign:in_pRecord:");
        break;
      case 24:
        int result = -[EMFPlayer playSetTextColour:in_pRecord:](self, "playSetTextColour:in_pRecord:");
        break;
      case 25:
        int result = -[EMFPlayer playSetBkColour:in_pRecord:](self, "playSetBkColour:in_pRecord:");
        break;
      case 26:
        int result = -[EMFPlayer playOffsetClipRegion:in_pRecord:](self, "playOffsetClipRegion:in_pRecord:");
        break;
      case 27:
        int result = -[EMFPlayer playMoveToEx:in_pRecord:](self, "playMoveToEx:in_pRecord:");
        break;
      case 28:
        int result = -[EMFPlayer playSetMetaRgn:in_pRecord:](self, "playSetMetaRgn:in_pRecord:");
        break;
      case 29:
        int result = -[EMFPlayer playExcludeClipRect:in_pRecord:](self, "playExcludeClipRect:in_pRecord:");
        break;
      case 30:
        int result = -[EMFPlayer playIntersectClipRect:in_pRecord:](self, "playIntersectClipRect:in_pRecord:");
        break;
      case 31:
        int result = -[EMFPlayer playScaleViewportExt:in_pRecord:](self, "playScaleViewportExt:in_pRecord:");
        break;
      case 32:
        int result = -[EMFPlayer playScaleWindowExt:in_pRecord:](self, "playScaleWindowExt:in_pRecord:");
        break;
      case 33:
        int result = -[EMFPlayer playSaveDC:in_pRecord:](self, "playSaveDC:in_pRecord:");
        break;
      case 34:
        int result = -[EMFPlayer playRestoreDC:in_pRecord:](self, "playRestoreDC:in_pRecord:");
        break;
      case 35:
        int result = -[EMFPlayer playSetWorldTransform:in_pRecord:](self, "playSetWorldTransform:in_pRecord:");
        break;
      case 36:
        int result = -[EMFPlayer playModifyWorldTransform:in_pRecord:](self, "playModifyWorldTransform:in_pRecord:");
        break;
      case 37:
        int result = -[EMFPlayer playSelectObject:in_pRecord:](self, "playSelectObject:in_pRecord:");
        break;
      case 38:
        int result = -[EMFPlayer playCreatePen:in_pRecord:](self, "playCreatePen:in_pRecord:");
        break;
      case 39:
        int result = -[EMFPlayer playCreateBrushIndirect:in_pRecord:](self, "playCreateBrushIndirect:in_pRecord:");
        break;
      case 40:
        int result = -[EMFPlayer playDeleteObject:in_pRecord:](self, "playDeleteObject:in_pRecord:");
        break;
      case 41:
        int result = -[EMFPlayer playAngleArc:in_pRecord:in_is16bit:](self, "playAngleArc:in_pRecord:in_is16bit:");
        break;
      case 42:
        int result = -[EMFPlayer playEllipse:in_pRecord:](self, "playEllipse:in_pRecord:");
        break;
      case 43:
        int result = -[EMFPlayer playRectangle:in_pRecord:](self, "playRectangle:in_pRecord:");
        break;
      case 44:
        int result = -[EMFPlayer playRoundRect:in_pRecord:](self, "playRoundRect:in_pRecord:");
        break;
      case 45:
        int result = -[EMFPlayer playArc:in_pRecord:](self, "playArc:in_pRecord:");
        break;
      case 46:
        int result = -[EMFPlayer playChord:in_pRecord:](self, "playChord:in_pRecord:");
        break;
      case 47:
        int result = -[EMFPlayer playPie:in_pRecord:](self, "playPie:in_pRecord:");
        break;
      case 48:
        int result = -[EMFPlayer playSelectPalette:in_pRecord:](self, "playSelectPalette:in_pRecord:");
        break;
      case 49:
        int result = -[EMFPlayer playCreatePalette:in_pRecord:](self, "playCreatePalette:in_pRecord:");
        break;
      case 50:
        int result = -[EMFPlayer playSetPaletteEntries:in_pRecord:](self, "playSetPaletteEntries:in_pRecord:");
        break;
      case 51:
        int result = -[EMFPlayer playResizePalette:in_pRecord:](self, "playResizePalette:in_pRecord:");
        break;
      case 52:
        int result = -[EMFPlayer playRealizePalette:in_pRecord:](self, "playRealizePalette:in_pRecord:");
        break;
      case 54:
        int result = -[EMFPlayer playLineTo:in_pRecord:](self, "playLineTo:in_pRecord:");
        break;
      case 55:
        int result = -[EMFPlayer playArcTo:in_pRecord:](self, "playArcTo:in_pRecord:");
        break;
      case 56:
      case 92:
        int result = -[EMFPlayer playPolyDraw:in_pRecord:in_is16bit:](self, "playPolyDraw:in_pRecord:in_is16bit:");
        break;
      case 57:
        int result = -[EMFPlayer playSetArcDirection:in_pRecord:](self, "playSetArcDirection:in_pRecord:");
        break;
      case 58:
        int result = -[EMFPlayer playSetMiterLimit:in_pRecord:](self, "playSetMiterLimit:in_pRecord:");
        break;
      case 59:
        int result = -[EMFPlayer playBeginPath:in_pRecord:](self, "playBeginPath:in_pRecord:");
        break;
      case 60:
        int result = -[EMFPlayer playEndPath:in_pRecord:](self, "playEndPath:in_pRecord:");
        break;
      case 61:
        int result = -[EMFPlayer playCloseFigure:in_pRecord:](self, "playCloseFigure:in_pRecord:");
        break;
      case 62:
      case 63:
      case 64:
        int result = -[EMFPlayer playStrokeAndFillPath:in_pRecord:in_stroke:in_fill:](self, "playStrokeAndFillPath:in_pRecord:in_stroke:in_fill:");
        break;
      case 66:
        int result = -[EMFPlayer playWidenPath:in_pRecord:](self, "playWidenPath:in_pRecord:");
        break;
      case 67:
        int result = -[EMFPlayer playSelectClipPath:in_pRecord:](self, "playSelectClipPath:in_pRecord:");
        break;
      case 68:
        int result = -[EMFPlayer playAbortPath:in_pRecord:](self, "playAbortPath:in_pRecord:");
        break;
      case 71:
        int result = -[EMFPlayer playFillRgn:in_pRecord:](self, "playFillRgn:in_pRecord:");
        break;
      case 73:
        int result = -[EMFPlayer playInvertRgn:in_pRecord:](self, "playInvertRgn:in_pRecord:");
        break;
      case 74:
        int result = -[EMFPlayer playPaintRgn:in_pRecord:](self, "playPaintRgn:in_pRecord:");
        break;
      case 75:
        int result = -[EMFPlayer playSelectClipRegion:in_pRecord:](self, "playSelectClipRegion:in_pRecord:");
        break;
      case 76:
        int result = -[EMFPlayer playBitBlt:in_pRecord:](self, "playBitBlt:in_pRecord:");
        break;
      case 77:
        int result = -[EMFPlayer playStretchBlt:in_pRecord:](self, "playStretchBlt:in_pRecord:");
        break;
      case 78:
        int result = -[EMFPlayer playMaskBlt:in_pRecord:](self, "playMaskBlt:in_pRecord:");
        break;
      case 79:
        int result = -[EMFPlayer playPlgBlt:in_pRecord:](self, "playPlgBlt:in_pRecord:");
        break;
      case 80:
        int result = -[EMFPlayer playSetDIBitsToDevice:in_pRecord:](self, "playSetDIBitsToDevice:in_pRecord:");
        break;
      case 81:
        int result = -[EMFPlayer playStretchDIBits:in_pRecord:](self, "playStretchDIBits:in_pRecord:");
        break;
      case 82:
        int result = -[EMFPlayer playExtCreateFontIndirectW:in_pRecord:](self, "playExtCreateFontIndirectW:in_pRecord:");
        break;
      case 83:
        int result = -[EMFPlayer playExtTextOutA:in_pRecord:](self, "playExtTextOutA:in_pRecord:");
        break;
      case 84:
        int result = -[EMFPlayer playExtTextOutW:in_pRecord:](self, "playExtTextOutW:in_pRecord:");
        break;
      case 93:
        int result = -[EMFPlayer playCreateMonoBrush:in_pRecord:](self, "playCreateMonoBrush:in_pRecord:");
        break;
      case 94:
        int result = -[EMFPlayer playCreateDibPatternBrushPT:in_pRecord:](self, "playCreateDibPatternBrushPT:in_pRecord:");
        break;
      case 95:
        int result = -[EMFPlayer playExtCreatePen:in_pRecord:](self, "playExtCreatePen:in_pRecord:");
        break;
      case 114:
        int result = -[EMFPlayer playAlphaBlend:in_pRecord:](self, "playAlphaBlend:in_pRecord:");
        break;
      case 120:
        int result = -[EMFPlayer playSetTextJustification:in_pRecord:](self, "playSetTextJustification:in_pRecord:");
        break;
      default:
        int result = -[EMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:");
        break;
    }
  }
  else
  {
    if (v7 != 1) {
      return -7;
    }
    return -[EMFPlayer playHeader:in_pRecord:](self, "playHeader:in_pRecord:");
  }
  return result;
}

- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x58) {
    return -7;
  }
  int v6 = *((_DWORD *)a4 + 20);
  int v5 = *((_DWORD *)a4 + 21);
  if (!v6 || v5 == 0) {
    return -7;
  }
  uint64_t v11 = *((unsigned int *)a4 + 15);
  uint64_t v12 = *((unsigned int *)a4 + 16);
  int v13 = *((unsigned __int16 *)a4 + 28);
  double v14 = (double)*((int *)a4 + 18) / ((double)v6 * 100.0);
  double v15 = (double)*((int *)a4 + 19) / ((double)v5 * 100.0);
  [(MFGraphicsDevice *)self->m_gdi setViewBox:v14 * (double)*((int *)a4 + 6) top:v15 * (double)*((int *)a4 + 7) width:v14 * (double)(*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)) height:v15 * (double)(*((_DWORD *)a4 + 9) - *((_DWORD *)a4 + 7))];
  if (v13) {
    uint64_t v16 = (v13 + 1);
  }
  else {
    uint64_t v16 = 0xFFFFLL;
  }
  [(MFGraphicsDevice *)self->m_gdi setMaximumObjectTableSize:v16];
  int v8 = 0;
  if (v11)
  {
    if (v12)
    {
      unint64_t v17 = v12 + v11;
      int v8 = -7;
      if (!HIDWORD(v17) && v17 <= a3)
      {
        v18 = (void *)[[NSString alloc] initWithBytes:&a4[v12] length:v11 encoding:10];
        int v8 = [(MFGraphicsDevice *)self->m_gdi description:v18];
      }
    }
  }
  self->m_headerDone = 1;
  return v8;
}

- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setWindowExt:*((unsigned int *)a4 + 2) in_y:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setWindowOrg:*((unsigned int *)a4 + 2) in_y:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return [(MFGraphicsDevice *)self->m_gdi scaleWindowExt:*((unsigned int *)a4 + 2) in_xDenom:*((unsigned int *)a4 + 3) in_yNum:*((unsigned int *)a4 + 4) in_yDenom:*((unsigned int *)a4 + 5)];
  }
  else {
    return -7;
  }
}

- (int)playSetWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x20) {
    return -7;
  }
  v15[10] = v4;
  v15[11] = v5;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:8];
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 12, v9);
  *(double *)&v15[1] = v10;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:16];
  *(double *)&v15[2] = v11;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:20];
  *(double *)&v15[3] = v12;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:24];
  *(double *)&v15[4] = v13;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:28];
  *(double *)&v15[5] = v14;
  return [(MFGraphicsDevice *)self->m_gdi setWorldTransform:v15];
}

- (int)playModifyWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x24) {
    return -7;
  }
  v15[10] = v4;
  v15[11] = v5;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:8];
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 12, v9);
  *(double *)&v15[1] = v10;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:16];
  *(double *)&v15[2] = v11;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:20];
  *(double *)&v15[3] = v12;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:24];
  *(double *)&v15[4] = v13;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:28];
  *(double *)&v15[5] = v14;
  return [(MFGraphicsDevice *)self->m_gdi modifyWorldTransform:v15 in_command:*((unsigned int *)a4 + 8)];
}

- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setViewportExt:*((unsigned int *)a4 + 2) in_y:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setViewportOrg:*((unsigned int *)a4 + 2) in_y:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return [(MFGraphicsDevice *)self->m_gdi scaleViewportExt:*((unsigned int *)a4 + 2) in_xDenom:*((unsigned int *)a4 + 3) in_yNum:*((unsigned int *)a4 + 4) in_yDenom:*((unsigned int *)a4 + 5)];
  }
  else {
    return -7;
  }
}

- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  int v5 = *((_DWORD *)a4 + 2);
  m_gdi = self->m_gdi;
  if (v5 < 0) {
    return [(MFGraphicsDevice *)m_gdi getStockObject:v5 ^ 0x80000000];
  }
  else {
    return -[MFGraphicsDevice selectObject:](m_gdi, "selectObject:");
  }
}

- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  int v5 = *((_DWORD *)a4 + 2);
  m_gdi = self->m_gdi;
  if (v5 < 0) {
    return [(MFGraphicsDevice *)m_gdi getStockObject:v5 ^ 0x80000000];
  }
  else {
    return -[MFGraphicsDevice selectObject:](m_gdi, "selectObject:");
  }
}

- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi deleteObject:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x1C) {
    return -7;
  }
  uint64_t v7 = *((unsigned int *)a4 + 3);
  uint64_t v6 = *((unsigned int *)a4 + 4);
  uint64_t v8 = *((unsigned int *)a4 + 2);
  float v9 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 24) green:*((unsigned __int8 *)a4 + 25) blue:*((unsigned __int8 *)a4 + 26)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi createPen:v7 width:v6 in_colour:v9 in_userStyleArray:0 index:v8];

  return v4;
}

- (int)playExtCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x34) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 12);
  if (4 * v5 > 0xFFFFFFCB) {
    return -7;
  }
  if (v5 >> 30 || 4 * v5 + 52 > a3) {
    return -7;
  }
  uint64_t v10 = *((unsigned int *)a4 + 2);
  uint64_t v12 = *((unsigned int *)a4 + 7);
  uint64_t v11 = *((unsigned int *)a4 + 8);
  if (v5)
  {
    float v13 = (double *)malloc_type_malloc(8 * *((unsigned int *)a4 + 12), 0xD809582AuLL);
    if (!v13) {
      return -4;
    }
  }
  else
  {
    float v13 = 0;
  }
  float v14 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 40) green:*((unsigned __int8 *)a4 + 41) blue:*((unsigned __int8 *)a4 + 42)];
  if (v5)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v13;
    do
    {
      *v16++ = (double)(a4[(v15 + 52)] | ((unint64_t)a4[(v15 + 53)] << 8) | ((unint64_t)a4[(v15 + 54)] << 16) | ((unint64_t)a4[(v15 + 55)] << 24));
      v15 += 4;
    }
    while (4 * v5 != v15);
  }
  int v7 = [(MFGraphicsDevice *)self->m_gdi createPen:v12 width:v11 in_colour:v14 in_userStyleArray:v13 index:v10];
  if (v13) {
    free(v13);
  }

  return v7;
}

- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  int v5 = *((unsigned __int16 *)a4 + 7);
  if (4 * v5 + 16 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 2);
  float v9 = [MEMORY[0x263EFF980] arrayWithCapacity:*((unsigned __int16 *)a4 + 7)];
  if (v5)
  {
    uint64_t v10 = (unsigned __int8 *)(a4 + 18);
    do
    {
      uint64_t v11 = +[OITSUColor colorWithRGBBytes:*(v10 - 2) green:*(v10 - 1) blue:*v10];
      [v9 addObject:v11];
      v10 += 4;

      --v5;
    }
    while (v5);
  }
  int v6 = [(MFGraphicsDevice *)self->m_gdi createPalette:v9 in_index:v8];

  return v6;
}

- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x14) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 4);
  if (4 * v5 > 0xFFFFFFEB) {
    return -7;
  }
  if (v5 >> 30 || 4 * v5 + 20 > a3) {
    return -7;
  }
  uint64_t v10 = *((unsigned int *)a4 + 2);
  uint64_t v11 = *((unsigned int *)a4 + 3);
  uint64_t v12 = [MEMORY[0x263EFF980] arrayWithCapacity:*((unsigned int *)a4 + 4)];
  if (v5)
  {
    int v13 = 20;
    do
    {
      float v14 = +[OITSUColor colorWithRGBBytes:a4[v13] green:a4[v13 + 1] blue:a4[v13 + 2]];
      [v12 addObject:v14];

      v13 += 4;
      --v5;
    }
    while (v5);
  }
  int v7 = [(MFGraphicsDevice *)self->m_gdi setPaletteEntries:v11 in_colours:v12 in_index:v10];

  return v7;
}

- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi resizePalette:*((unsigned int *)a4 + 3) in_index:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi realizePalette];
  }
  else {
    return -7;
  }
}

- (int)playExtCreateFontIndirectW:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (a3 < 0x149) {
    return -7;
  }
  uint64_t v6 = 0;
  unsigned int v44 = *((_DWORD *)a4 + 4);
  unsigned int v45 = *((_DWORD *)a4 + 3);
  unsigned int v42 = *((_DWORD *)a4 + 6);
  unsigned int v43 = *((_DWORD *)a4 + 5);
  unsigned int v40 = *((_DWORD *)a4 + 2);
  unsigned int v41 = *((_DWORD *)a4 + 7);
  int v35 = *((unsigned __int8 *)a4 + 32);
  int v36 = *((unsigned __int8 *)a4 + 33);
  int v37 = *((unsigned __int8 *)a4 + 34);
  char v38 = a4[37];
  unsigned int v34 = *((unsigned __int8 *)a4 + 38);
  int v7 = a4 + 41;
  unsigned int v8 = *((unsigned __int8 *)a4 + 39);
  unsigned int v46 = *((unsigned __int8 *)a4 + 36);
  int v47 = *((unsigned __int8 *)a4 + 35);
  do
  {
    int v9 = *(unsigned __int16 *)(v7 - 1);
    v48[v6] = v9;
    if (!v9) {
      break;
    }
    v7 += 2;
    ++v6;
  }
  while (v6 != 32);
  uint64_t v10 = objc_msgSend(NSString, "stringWithCharacters:length:", v48);
  uint64_t v11 = 0;
  uint64_t v12 = (void *)v10;
  int v13 = a4 + 105;
  do
  {
    int v14 = *(unsigned __int16 *)(v13 - 1);
    v48[v11] = v14;
    if (!v14) {
      break;
    }
    v13 += 2;
    ++v11;
  }
  while (v11 != 64);
  uint64_t v15 = objc_msgSend(NSString, "stringWithCharacters:length:", v48);
  uint64_t v16 = 0;
  unint64_t v17 = (void *)v15;
  v18 = a4 + 233;
  do
  {
    int v19 = *(unsigned __int16 *)(v18 - 1);
    v48[v16] = v19;
    if (!v19) {
      break;
    }
    v18 += 2;
    ++v16;
  }
  while (v16 != 32);
  v20 = objc_msgSend(NSString, "stringWithCharacters:length:", v48);
  unsigned int v21 = *((_DWORD *)a4 + 74);
  unsigned int v22 = *((_DWORD *)a4 + 75);
  unsigned int v23 = *((_DWORD *)a4 + 76);
  unsigned int v24 = *((_DWORD *)a4 + 78);
  unsigned int v25 = *((_DWORD *)a4 + 79);
  char IsValidCharSet = ChValueIsValidCharSet(v47);
  if (v8 >= 0x60 || v46 >= 0xB) {
    char v28 = 0;
  }
  else {
    char v28 = IsValidCharSet;
  }
  if (v28)
  {
    unsigned int v29 = v34;
    if (v34 >= 5) {
      unsigned int v29 = 0;
    }
    LODWORD(v33) = v8 & 0xF0;
    BYTE4(v32) = v38;
    HIDWORD(v31) = v47;
    LODWORD(v32) = v46;
    BYTE1(v31) = v37 != 0;
    LOBYTE(v31) = v36 != 0;
    int v4 = -[MFGraphicsDevice createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:index:](self->m_gdi, "createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:index:", v45, v44, v43, v42, v41, v35 != 0, v31, v32, __PAIR64__(v8 & 3, v29), v33, v12, v17, v20, __PAIR64__(v22, v21), __PAIR64__(v24, v23),
           __PAIR64__(v40, v25));
  }
  else
  {
    int v4 = -7;
  }

  return v4;
}

- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x18) {
    return -7;
  }
  int v7 = *((unsigned __int8 *)a4 + 8);
  int v8 = *((unsigned __int8 *)a4 + 9);
  int v9 = *((unsigned __int8 *)a4 + 10);
  int v10 = *((unsigned __int8 *)a4 + 11);
  unsigned int v11 = *((_DWORD *)a4 + 3);
  uint64_t v12 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 16) green:*((unsigned __int8 *)a4 + 17) blue:*((unsigned __int8 *)a4 + 18)];
  if (v11 > 9)
  {
    int v4 = -7;
  }
  else
  {
    unsigned int v13 = *((_DWORD *)a4 + 5);
    if (v13 >= 6) {
      uint64_t v14 = 0xFFFFFFLL;
    }
    else {
      uint64_t v14 = v13;
    }
    int v4 = [(MFGraphicsDevice *)self->m_gdi createBrush:dword_238EDE148[v11] in_colour:v12 hatchstyle:v14 index:v7 | (v8 << 8) | (v9 << 16) | (v10 << 24)];
  }

  return v4;
}

- (int)playCreateMonoBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x20) {
    return -7;
  }
  uint64_t v5 = *((unsigned int *)a4 + 4);
  uint64_t v4 = *((unsigned int *)a4 + 5);
  if ((int)v5 + (int)v4 > a3) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 6);
  uint64_t v7 = v6 + *((unsigned int *)a4 + 7);
  if ((v7 | (unint64_t)(v5 + v4)) >> 32 || v7 > a3) {
    return -7;
  }
  uint64_t v12 = *((unsigned int *)a4 + 2);
  uint64_t v13 = -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v5], *((unsigned int *)a4 + 5), &a4[v6]);
  uint64_t v14 = (void *)v13;
  if (v13) {
    int v9 = [(MFGraphicsDevice *)self->m_gdi createPatternBrush:v13 index:v12 usePaletteForBilevel:0];
  }
  else {
    int v9 = -7;
  }

  return v9;
}

- (int)playCreateDibPatternBrushPT:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x20) {
    return -7;
  }
  uint64_t v5 = *((unsigned int *)a4 + 4);
  uint64_t v4 = *((unsigned int *)a4 + 5);
  if ((int)v5 + (int)v4 > a3) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 6);
  uint64_t v7 = v6 + *((unsigned int *)a4 + 7);
  if ((v7 | (unint64_t)(v5 + v4)) >> 32 || v7 > a3) {
    return -7;
  }
  uint64_t v12 = *((unsigned int *)a4 + 2);
  uint64_t v13 = -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v5], *((unsigned int *)a4 + 5), &a4[v6]);
  uint64_t v14 = (void *)v13;
  if (v13) {
    int v9 = [(MFGraphicsDevice *)self->m_gdi createPatternBrush:v13 index:v12 usePaletteForBilevel:1];
  }
  else {
    int v9 = -7;
  }

  return v9;
}

- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4 wideChars:(BOOL)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a3 < 0x38) {
    return -7;
  }
  if (a5) {
    unsigned int v9 = 2;
  }
  else {
    unsigned int v9 = 1;
  }
  uint64_t v10 = *((unsigned int *)a4 + 11);
  uint64_t v11 = *((unsigned int *)a4 + 12);
  unsigned int v12 = *((unsigned __int8 *)a4 + 52);
  if ((v12 & 6) != 0)
  {
    uint64_t v14 = *((unsigned int *)a4 + 14);
    unsigned int v13 = *((_DWORD *)a4 + 15);
    unsigned int v15 = *((_DWORD *)a4 + 16);
    unsigned int v16 = *((_DWORD *)a4 + 17);
  }
  else
  {
    uint64_t v14 = 0;
    unsigned int v13 = 0;
    unsigned int v15 = 0;
    unsigned int v16 = 0;
  }
  unint64_t v17 = v10 * (unint64_t)v9;
  BOOL v18 = (v17 & 0xFFFFFFFF00000000) != 0;
  unint64_t v19 = v11 + v17;
  int v5 = -7;
  if (HIDWORD(v19)) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v19 > a3;
  }
  if (!v20 && !v18)
  {
    int v21 = *((unsigned __int8 *)a4 + 53);
    int v38 = *((unsigned __int8 *)a4 + 54);
    int v39 = v21;
    int v37 = *((unsigned __int8 *)a4 + 55);
    unsigned int v22 = *((_DWORD *)a4 + 9);
    unsigned int v40 = *((_DWORD *)a4 + 10);
    unsigned int v41 = v22;
    unsigned int v23 = *((_DWORD *)a4 + 18);
    unsigned int v43 = v15;
    unsigned int v44 = v13;
    unsigned int v42 = v16;
    if (a5)
    {
      MEMORY[0x270FA5388](self);
      unsigned int v25 = (char *)&v36 - v24;
      if (v10)
      {
        uint64_t v26 = v10;
        v27 = v25;
        do
        {
          *v27++ = a4[v11] | (a4[(v11 + 1)] << 8);
          LODWORD(v11) = v11 + 2;
          --v26;
        }
        while (v26);
      }
      if ((v12 & 0x10) != 0) {
        objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
      }
      else {
      unsigned int v29 = objc_msgSend(NSString, "stringWithCharacters:length:");
      }
    }
    else
    {
      char v28 = [(MFGraphicsDevice *)self->m_gdi getCurrentFont];
      unsigned int v29 = [v28 stringWithBytes:&a4[v11] length:v10];
    }
    v30 = 0;
    unsigned int v31 = 0;
    if (v23 && a3 > v23)
    {
      if ((a3 - v23) >> 2 >= v10) {
        unsigned int v31 = v10;
      }
      else {
        unsigned int v31 = (a3 - v23) >> 2;
      }
      if (!v31 || (uint64_t v32 = (char *)malloc_type_malloc(4 * v31, 0xD809582AuLL), (v30 = v32) == 0))
      {
        int v5 = -4;
        goto LABEL_34;
      }
      uint64_t v33 = 0;
      do
      {
        *(_DWORD *)&v32[v33] = a4[v23 + v33] | (a4[v23
                                                                                                 + 1
                                                                                                 + v33] << 8) | (a4[v23 + 2 + v33] << 16) | (a4[v23 + 3 + v33] << 24);
        v33 += 4;
      }
      while (4 * v31 != v33);
    }
    LODWORD(v35) = v31;
    int v5 = -[MFGraphicsDevice extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:](self->m_gdi, "extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:", v41, v40, v29, (v38 << 16) | (v39 << 8) | (v37 << 24) | v12, v14, v44, __PAIR64__(v42, v43), v30, v35);
    free(v30);
LABEL_34:
  }
  return v5;
}

- (int)playExtTextOutA:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(EMFPlayer *)self playExtTextOut:*(void *)&a3 in_pRecord:a4 wideChars:0];
}

- (int)playExtTextOutW:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(EMFPlayer *)self playExtTextOut:*(void *)&a3 in_pRecord:a4 wideChars:1];
}

- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi setTextAlign:a4[8] & 1 textHorizontalAlign:a4[8] & 6 textVerticalAlign:a4[8] & 0x18 textDirection:(a4[9] & 1) << 8];
  }
  else {
    return -7;
  }
}

- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  uint64_t v6 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 8) green:*((unsigned __int8 *)a4 + 9) blue:*((unsigned __int8 *)a4 + 10)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi setTextColour:v6];

  return v4;
}

- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setTextJustification:*((unsigned int *)a4 + 3) in_breakCount:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  uint64_t v6 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 8) green:*((unsigned __int8 *)a4 + 9) blue:*((unsigned __int8 *)a4 + 10)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi setBkColour:v6];

  return v4;
}

- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi offsetClipRegionByX:*((unsigned int *)a4 + 2) y:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 1) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setBkMode:](self->m_gdi, "setBkMode:");
  }
}

- (int)playSetBrushOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi setBrushOrg:(double)*((int *)a4 + 2) y:(double)*((int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 7) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:");
  }
}

- (int)playPolyDraw:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x1C) {
    return -7;
  }
  uint64_t v23 = v5;
  uint64_t v24 = v6;
  BOOL v8 = a5;
  unsigned int v10 = *((_DWORD *)a4 + 6);
  if (a5) {
    unsigned int v11 = 5;
  }
  else {
    unsigned int v11 = 9;
  }
  unint64_t v12 = v10 * (unint64_t)v11;
  if (v12 > 0xFFFFFFE3) {
    return -7;
  }
  int result = -7;
  if ((int)v12 + 28 <= a3 && (v12 & 0xFFFFFFFF00000000) == 0)
  {
    if (a5) {
      char v14 = 2;
    }
    else {
      char v14 = 3;
    }
    if (v10)
    {
      unsigned int v15 = 0;
      int v16 = (v10 << v14) + 28;
      do
      {
        *(void *)unsigned int v22 = 0;
        unsigned int v17 = v15 + v16;
        char v18 = a4[v15 + v16];
        parsePoint((uint64_t)(a4 + 28), v15, &v22[1], v22, v8);
        int v19 = v18 & 0xFE;
        switch(v19)
        {
          case 6:
            int result = [(MFGraphicsDevice *)self->m_gdi moveTo:(double)v22[1] y:(double)v22[0]];
            break;
          case 4:
            *(void *)BOOL v20 = 0;
            *(void *)int v21 = 0;
            if (v10 - v15 <= 2 && (a4[v17 + 1] & 0xFE) == 6 && (a4[v17 + 2] & 0xFE) == 6)
            {
              parsePoint((uint64_t)(a4 + 28), v15 + 1, &v21[1], v21, v8);
              v15 += 2;
              parsePoint((uint64_t)(a4 + 28), v15, &v20[1], v20, v8);
              int result = [(MFGraphicsDevice *)self->m_gdi bezierTo:v22[1] y:v22[0] x2:v21[1] y2:v21[0] x3:v20[1] y3:v20[0]];
              char v18 = a4[v15 + v16];
            }
            else
            {
              int result = -7;
            }
            break;
          case 2:
            int result = [(MFGraphicsDevice *)self->m_gdi lineTo:(double)v22[1] y:(double)v22[0]];
            break;
          default:
            return -7;
        }
        if (result) {
          break;
        }
        if (v18)
        {
          int result = [(MFGraphicsDevice *)self->m_gdi closeCurrentPath:1];
          if (result) {
            break;
          }
        }
        int result = 0;
        ++v15;
      }
      while (v15 < v10);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)playPolyBezier:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x1C) {
    return -7;
  }
  uint64_t v24 = v5;
  uint64_t v25 = v6;
  BOOL v8 = a5;
  if (a5) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = 8;
  }
  unsigned int v10 = *((_DWORD *)a4 + 6);
  unint64_t v11 = v10 * (unint64_t)v9;
  if (v11 > 0xFFFFFFE3) {
    return -7;
  }
  int result = -7;
  if (v10)
  {
    if ((int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0 && -1431655765 * v10 + 1431655765 <= 0x55555555)
    {
      *(void *)unsigned int v22 = 0;
      *(void *)uint64_t v23 = 0;
      *(void *)BOOL v20 = 0;
      *(void *)int v21 = 0;
      unsigned int v13 = a4 + 28;
      parsePoint((uint64_t)(a4 + 28), 0, &v23[1], v23, a5);
      int result = 0;
      if (v10 >= 2)
      {
        uint64_t v14 = v23[0];
        uint64_t v15 = v23[1];
        unsigned int v16 = 1;
        while (1)
        {
          parsePoint((uint64_t)v13, v16, &v22[1], v22, v8);
          parsePoint((uint64_t)v13, v16 + 1, &v21[1], v21, v8);
          int v17 = v16 + 2;
          parsePoint((uint64_t)v13, v17, &v20[1], v20, v8);
          uint64_t v19 = v20[0];
          uint64_t v18 = v20[1];
          int result = -[MFGraphicsDevice bezier:y:x2:y2:x3:y3:x4:y4:](self->m_gdi, "bezier:y:x2:y2:x3:y3:x4:y4:", v15, v14, v22[1], v22[0], v21[1], v21[0], __PAIR64__(v20[0], v20[1]));
          if (result) {
            break;
          }
          unsigned int v16 = v17 + 1;
          uint64_t v15 = v18;
          uint64_t v14 = v19;
          if (v16 >= v10) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (int)playPolyBezierTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x1C) {
    return -7;
  }
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  BOOL v8 = a5;
  if (a5) {
    unsigned int v10 = 4;
  }
  else {
    unsigned int v10 = 8;
  }
  unsigned int v11 = *((_DWORD *)a4 + 6);
  unint64_t v12 = v11 * (unint64_t)v10;
  int result = -7;
  BOOL v14 = -1431655765 * v11 > 0x55555555 || v11 == 0 || (int)v12 + 28 > a3;
  if (!v14 && (v12 & 0xFFFFFFFF00000000) == 0 && v12 <= 0xFFFFFFE3)
  {
    unsigned int v15 = 0;
    *(void *)uint64_t v18 = 0;
    *(void *)uint64_t v19 = 0;
    *(void *)int v17 = 0;
    unsigned int v16 = a4 + 28;
    while (v15 < v11)
    {
      parsePoint((uint64_t)v16, v15, &v19[1], v19, v8);
      parsePoint((uint64_t)v16, v15 + 1, &v18[1], v18, v8);
      parsePoint((uint64_t)v16, v15 + 2, &v17[1], v17, v8);
      int result = [(MFGraphicsDevice *)self->m_gdi bezierTo:v19[1] y:v19[0] x2:v18[1] y2:v18[0] x3:v17[1] y3:v17[0]];
      v15 += 3;
      if (result) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  int result = -7;
  if (a3 >= 0x1C && a4)
  {
    BOOL v8 = a5;
    if (a5) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = 8;
    }
    uint64_t v10 = *((unsigned int *)a4 + 6);
    unint64_t v11 = v10 * (unint64_t)v9;
    if (v11 <= 0xFFFFFFE3 && (int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0)
    {
      if (v10 < 2)
      {
        return 0;
      }
      else
      {
        unint64_t v12 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 6), 0xD809582AuLL);
        if (v12)
        {
          unsigned int v13 = v12;
          uint64_t v14 = 0;
          *(void *)uint64_t v19 = 0;
          unsigned int v15 = a4 + 28;
          unsigned int v16 = v12 + 1;
          do
          {
            parsePoint((uint64_t)v15, v14, &v19[1], v19, v8);
            double v17 = (double)v19[0];
            *(v16 - 1) = (double)v19[1];
            *unsigned int v16 = v17;
            ++v14;
            v16 += 2;
          }
          while (v10 != v14);
          int v18 = [(MFGraphicsDevice *)self->m_gdi polygon:v13 in_count:v10];
          free(v13);
          return v18;
        }
        else
        {
          return -4;
        }
      }
    }
  }
  return result;
}

- (int)playPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a5) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = 8;
  }
  int result = -7;
  if (a3 >= 0x1C)
  {
    if (a4)
    {
      uint64_t v9 = *((unsigned int *)a4 + 6);
      if (v9 >= 2)
      {
        unint64_t v10 = v9 * (unint64_t)v6;
        if (v10 <= 0xFFFFFFE3 && (v10 & 0xFFFFFFFF00000000) == 0 && (int)v10 + 28 <= a3)
        {
          BOOL v11 = a5;
          unint64_t v12 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 6), 0xD809582AuLL);
          if (v12)
          {
            unsigned int v13 = v12;
            uint64_t v14 = 0;
            *(void *)uint64_t v19 = 0;
            unsigned int v15 = a4 + 28;
            unsigned int v16 = v12 + 1;
            do
            {
              parsePoint((uint64_t)v15, v14, &v19[1], v19, v11);
              double v17 = (double)v19[0];
              *(v16 - 1) = (double)v19[1];
              *unsigned int v16 = v17;
              ++v14;
              v16 += 2;
            }
            while (v9 != v14);
            int v18 = [(MFGraphicsDevice *)self->m_gdi polyline:v13 in_count:v9];
            free(v13);
            return v18;
          }
          else
          {
            return -4;
          }
        }
      }
    }
  }
  return result;
}

- (int)playPolyLineTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 2) {
    return -7;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  BOOL v8 = a5;
  if (a5) {
    unsigned int v9 = 4;
  }
  else {
    unsigned int v9 = 8;
  }
  unsigned int v10 = *((_DWORD *)a4 + 6);
  unint64_t v11 = v10 * (unint64_t)v9;
  if (v11 > 0xFFFFFFE3) {
    return -7;
  }
  int result = -7;
  if ((int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0)
  {
    if (v10)
    {
      int v13 = 0;
      uint64_t v14 = a4 + 28;
      *(void *)unsigned int v15 = 0;
      while (1)
      {
        parsePoint((uint64_t)v14, v13, &v15[1], v15, v8);
        int result = [(MFGraphicsDevice *)self->m_gdi lineTo:(double)v15[1] y:(double)v15[0]];
        if (result) {
          break;
        }
        if (v10 == ++v13) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x20) {
    return [(MFGraphicsDevice *)self->m_gdi roundRect:*((unsigned int *)a4 + 2) top:*((unsigned int *)a4 + 3) right:*((unsigned int *)a4 + 4) bottom:*((unsigned int *)a4 + 5) rx:(double)*((int *)a4 + 6) * 0.5 ry:(double)*((int *)a4 + 7) * 0.5];
  }
  else {
    return -7;
  }
}

- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 3) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setStretchBltMode:](self->m_gdi, "setStretchBltMode:");
  }
}

- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi saveDC];
  }
  else {
    return -7;
  }
}

- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi restoreDC:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi lineTo:(double)*((int *)a4 + 2) y:(double)*((int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playMoveToEx:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10) {
    return [(MFGraphicsDevice *)self->m_gdi moveTo:(double)*((int *)a4 + 2) y:(double)*((int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetArcDirection:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi setArcDirection:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28) {
    return -[MFGraphicsDevice arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((void *)a4 + 4));
  }
  else {
    return -7;
  }
}

- (int)playArcTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28) {
    return -[MFGraphicsDevice arcTo:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arcTo:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((void *)a4 + 4));
  }
  else {
    return -7;
  }
}

- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28) {
    return -[MFGraphicsDevice chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((void *)a4 + 4));
  }
  else {
    return -7;
  }
}

- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28) {
    return -[MFGraphicsDevice pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((void *)a4 + 4));
  }
  else {
    return -7;
  }
}

- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return [(MFGraphicsDevice *)self->m_gdi ellipse:*((unsigned int *)a4 + 4) y1:*((unsigned int *)a4 + 5) x2:*((unsigned int *)a4 + 2) y2:*((unsigned int *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return [(MFGraphicsDevice *)self->m_gdi rectangle:*((unsigned int *)a4 + 2) y1:*((unsigned int *)a4 + 3) x2:*((unsigned int *)a4 + 4) y2:*((unsigned int *)a4 + 5)];
  }
  else {
    return -7;
  }
}

- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x20) {
    return -7;
  }
  BOOL v5 = a5;
  unsigned int v7 = a5 ? 4 : 8;
  uint64_t v8 = *((unsigned int *)a4 + 6);
  unsigned int v9 = *((_DWORD *)a4 + 7);
  unsigned int v10 = 4 * v8;
  unint64_t v11 = v9 * (unint64_t)v7;
  BOOL v12 = (v11 & 0xFFFFFFFF00000000) != 0;
  unint64_t v13 = (v11 & 0xFFFFFFFC) + (unint64_t)(4 * v8 + 32);
  if (HIDWORD(v13)) {
    return -7;
  }
  int v14 = -7;
  if (!(v8 >> 30) && v10 <= 0xFFFFFFDF && !v12 && v13 <= a3)
  {
    if (v9)
    {
      uint64_t v16 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 7), 0xD809582AuLL);
      if (v8)
      {
LABEL_12:
        uint64_t v17 = (char *)malloc_type_malloc(4 * v8, 0xD809582AuLL);
        int v18 = v17;
        if (v16 && v17)
        {
          uint64_t v19 = 0;
          unsigned int v20 = 0;
          while (1)
          {
            int v21 = a4[(v19 + 32)] | (a4[(v19 + 33)] << 8) | (a4[(v19 + 34)] << 16) | (a4[(v19 + 35)] << 24);
            *(_DWORD *)&v17[v19] = v21;
            v20 += v21;
            if (v21 <= 1) {
              break;
            }
            v19 += 4;
            if (4 * v8 == v19)
            {
              int v22 = 0;
              goto LABEL_28;
            }
          }
          int v22 = -7;
LABEL_28:
          if (v20 <= v9) {
            int v14 = v22;
          }
          else {
            int v14 = -7;
          }
          if (!v14)
          {
            if (v9)
            {
              uint64_t v24 = 0;
              uint64_t v25 = &a4[v10 + 32];
              uint64_t v26 = v16 + 1;
              do
              {
                *(void *)char v28 = 0;
                parsePoint((uint64_t)v25, v24, &v28[1], v28, v5);
                double v27 = (double)v28[0];
                *(v26 - 1) = (double)v28[1];
                *uint64_t v26 = v27;
                ++v24;
                v26 += 2;
              }
              while (v9 != v24);
            }
            int v14 = [(MFGraphicsDevice *)self->m_gdi polyPolygon:v16 in_polyCounts:v18 in_count:v8];
          }
          free(v16);
          free(v18);
          return v14;
        }
LABEL_22:
        if (v16) {
          free(v16);
        }
        if (v18) {
          free(v18);
        }
        return -4;
      }
    }
    else
    {
      uint64_t v16 = 0;
      if (v8) {
        goto LABEL_12;
      }
    }
    int v18 = 0;
    goto LABEL_22;
  }
  return v14;
}

- (int)playPolyPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x20) {
    return -7;
  }
  BOOL v5 = a5;
  unsigned int v7 = a5 ? 4 : 8;
  uint64_t v8 = *((unsigned int *)a4 + 6);
  unsigned int v9 = *((_DWORD *)a4 + 7);
  unsigned int v10 = 4 * v8;
  unint64_t v11 = v9 * (unint64_t)v7;
  BOOL v12 = (v11 & 0xFFFFFFFF00000000) != 0;
  unint64_t v13 = (v11 & 0xFFFFFFFC) + (unint64_t)(4 * v8 + 32);
  if (HIDWORD(v13)) {
    return -7;
  }
  int v14 = -7;
  if (!(v8 >> 30) && v10 <= 0xFFFFFFDF && !v12 && v13 <= a3)
  {
    uint64_t v16 = v9;
    if (v9)
    {
      uint64_t v17 = (double *)malloc_type_malloc(16 * v9, 0xD809582AuLL);
      if (v8)
      {
LABEL_12:
        int v18 = (char *)malloc_type_malloc(4 * v8, 0xD809582AuLL);
        uint64_t v19 = v18;
        if (v17 && v18)
        {
          uint64_t v20 = 0;
          unint64_t v21 = 0;
          while (1)
          {
            int v22 = a4[(v20 + 32)] | (a4[(v20 + 33)] << 8) | (a4[(v20 + 34)] << 16) | (a4[(v20 + 35)] << 24);
            *(_DWORD *)&v18[v20] = v22;
            v21 += v22;
            if (v22 <= 1) {
              break;
            }
            v20 += 4;
            if (4 * v8 == v20)
            {
              int v23 = 0;
              goto LABEL_28;
            }
          }
          int v23 = -7;
LABEL_28:
          if (v21 <= v9) {
            int v14 = v23;
          }
          else {
            int v14 = -7;
          }
          if (!v14)
          {
            if (v9)
            {
              uint64_t v25 = 0;
              uint64_t v26 = &a4[v10 + 32];
              double v27 = v17 + 1;
              do
              {
                *(void *)unsigned int v29 = 0;
                parsePoint((uint64_t)v26, v25, &v29[1], v29, v5);
                double v28 = (double)v29[0];
                *(v27 - 1) = (double)v29[1];
                double *v27 = v28;
                ++v25;
                v27 += 2;
              }
              while (v16 != v25);
            }
            int v14 = [(MFGraphicsDevice *)self->m_gdi polyPolyline:v17 in_polyCounts:v19 in_count:v8];
          }
          free(v17);
          free(v19);
          return v14;
        }
LABEL_22:
        if (v17) {
          free(v17);
        }
        if (v19) {
          free(v19);
        }
        return -4;
      }
    }
    else
    {
      uint64_t v17 = 0;
      if (v8) {
        goto LABEL_12;
      }
    }
    uint64_t v19 = 0;
    goto LABEL_22;
  }
  return v14;
}

- (int)playAngleArc:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  if (a3 < 0x1C) {
    return -7;
  }
  uint64_t v9 = *((unsigned int *)a4 + 2);
  uint64_t v10 = *((unsigned int *)a4 + 3);
  uint64_t v11 = *((unsigned int *)a4 + 4);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 20, a5);
  double v13 = v12;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:24];
  m_gdi = self->m_gdi;
  return [(MFGraphicsDevice *)m_gdi angleArc:v9 y:v10 radius:v11 startAngle:v13 sweepAngle:v14];
}

- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x64) {
    return -7;
  }
  uint64_t v5 = *((unsigned int *)a4 + 21);
  uint64_t v6 = *((unsigned int *)a4 + 22);
  if ((int)v5 + (int)v6 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 23);
  uint64_t v7 = *((unsigned int *)a4 + 24);
  uint64_t v9 = v8 + v7;
  if ((v9 | (unint64_t)(v5 + v6)) >> 32 || v9 > a3) {
    return -7;
  }
  unsigned int v32 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:52];
  v33[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:56];
  v33[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:60];
  v33[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:64];
  v33[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:68];
  v33[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:72];
  v33[5] = v19;
  unsigned int v30 = *((_DWORD *)a4 + 7);
  unsigned int v31 = *((_DWORD *)a4 + 6);
  unsigned int v20 = *((_DWORD *)a4 + 10);
  unsigned int v28 = *((_DWORD *)a4 + 9);
  unsigned int v29 = *((_DWORD *)a4 + 8);
  uint64_t v22 = *((unsigned int *)a4 + 11);
  unsigned int v21 = *((_DWORD *)a4 + 12);
  int v23 = &a4[v5];
  int v24 = *((_DWORD *)a4 + 19);
  uint64_t v25 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:v23 in_headerSize:v6 in_bitmap:&a4[v8] in_bitmapSize:v7 in_usage:v32];
  uint64_t v26 = (void *)v25;
  if (v25)
  {
    LODWORD(v27) = v24;
    int v11 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v31, v30, v29, v28, v25, v22, __PAIR64__(v20, v21), v33, v27);
  }
  else
  {
    int v11 = -7;
  }

  return v11;
}

- (int)playStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x6C) {
    return -7;
  }
  uint64_t v5 = *((unsigned int *)a4 + 21);
  uint64_t v6 = *((unsigned int *)a4 + 22);
  if ((int)v5 + (int)v6 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 23);
  uint64_t v7 = *((unsigned int *)a4 + 24);
  uint64_t v9 = v8 + v7;
  if ((v9 | (unint64_t)(v5 + v6)) >> 32 || v9 > a3) {
    return -7;
  }
  unsigned int v34 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:52];
  v35[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:56];
  v35[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:60];
  v35[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:64];
  v35[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:68];
  v35[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:72];
  v35[5] = v19;
  unsigned int v32 = *((_DWORD *)a4 + 7);
  unsigned int v33 = *((_DWORD *)a4 + 6);
  unsigned int v20 = *((_DWORD *)a4 + 10);
  unsigned int v30 = *((_DWORD *)a4 + 9);
  unsigned int v31 = *((_DWORD *)a4 + 8);
  unsigned int v21 = *((_DWORD *)a4 + 25);
  unsigned int v22 = *((_DWORD *)a4 + 26);
  unsigned int v28 = *((_DWORD *)a4 + 12);
  unsigned int v29 = *((_DWORD *)a4 + 11);
  int v23 = &a4[v5];
  int v24 = *((_DWORD *)a4 + 19);
  uint64_t v25 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:v23 in_headerSize:v6 in_bitmap:&a4[v8] in_bitmapSize:v7 in_usage:v34];
  uint64_t v26 = (void *)v25;
  if (v25)
  {
    LODWORD(v27) = v24;
    int v11 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", v33, v32, v31, v30, v25, v29, __PAIR64__(v21, v28), __PAIR64__(v20, v22), v35, v27);
  }
  else
  {
    int v11 = -7;
  }

  return v11;
}

- (int)playAlphaBlend:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x6C) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 21);
  uint64_t v5 = *((unsigned int *)a4 + 22);
  if ((int)v6 + (int)v5 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 23);
  uint64_t v7 = *((unsigned int *)a4 + 24);
  uint64_t v9 = v8 + v7;
  if ((v9 | (unint64_t)(v6 + v5)) >> 32 || v9 > a3) {
    return -7;
  }
  unsigned int v37 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:52];
  v38[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:56];
  v38[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:60];
  v38[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:64];
  v38[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:68];
  v38[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:72];
  v38[5] = v19;
  unsigned int v35 = *((_DWORD *)a4 + 7);
  unsigned int v36 = *((_DWORD *)a4 + 6);
  unsigned int v33 = *((_DWORD *)a4 + 9);
  unsigned int v34 = *((_DWORD *)a4 + 8);
  unsigned int v31 = *((_DWORD *)a4 + 12);
  unsigned int v32 = *((_DWORD *)a4 + 11);
  unsigned int v20 = *((_DWORD *)a4 + 25);
  int v21 = *((_DWORD *)a4 + 26);
  char v22 = a4[42];
  int v23 = *((unsigned __int8 *)a4 + 43);
  int v24 = &a4[v6];
  uint64_t v25 = &a4[v8];
  int v26 = *((_DWORD *)a4 + 19);
  uint64_t v27 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:v24 in_headerSize:v5 in_bitmap:v25 in_bitmapSize:v7 in_usage:v37];
  unsigned int v28 = (void *)v27;
  if (v27)
  {
    LODWORD(v30) = v26;
    BYTE5(v29) = v23 == 1;
    BYTE4(v29) = v22;
    LODWORD(v29) = v21;
    int v11 = -[MFGraphicsDevice alphaBlend:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:](self->m_gdi, "alphaBlend:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:", v36, v35, v34, v33, v27, v32, __PAIR64__(v20, v31), v29, v38, v30);
  }
  else
  {
    int v11 = -7;
  }

  return v11;
}

- (int)playMaskBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x80) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 21);
  uint64_t v5 = *((unsigned int *)a4 + 22);
  if ((int)v6 + (int)v5 > a3) {
    return -7;
  }
  uint64_t v7 = *((unsigned int *)a4 + 23);
  uint64_t v8 = *((unsigned int *)a4 + 24);
  uint64_t v9 = v7 + v8;
  if (v9 > a3) {
    return -7;
  }
  uint64_t v10 = *((unsigned int *)a4 + 28);
  uint64_t v11 = v10 + *((unsigned int *)a4 + 29);
  if (v11 > a3) {
    return -7;
  }
  unint64_t v14 = *((unsigned int *)a4 + 30) + (unint64_t)*((unsigned int *)a4 + 31);
  int v12 = -7;
  if (v14 <= a3 && !((v14 | v11 | (v6 + v5) | v9) >> 32))
  {
    uint64_t v40 = *((unsigned int *)a4 + 30);
    unsigned int v41 = *((_DWORD *)a4 + 31);
    unsigned int v42 = *((_DWORD *)a4 + 29);
    unsigned int v39 = *((_DWORD *)a4 + 20);
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:52];
    v43[0] = v16;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:56];
    v43[1] = v17;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:60];
    v43[2] = v18;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:64];
    v43[3] = v19;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:68];
    v43[4] = v20;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:72];
    v43[5] = v21;
    unsigned int v37 = *((_DWORD *)a4 + 7);
    unsigned int v38 = *((_DWORD *)a4 + 6);
    unsigned int v35 = *((_DWORD *)a4 + 9);
    unsigned int v36 = *((_DWORD *)a4 + 8);
    unsigned int v32 = *((_DWORD *)a4 + 25);
    int v33 = *((_DWORD *)a4 + 12);
    unsigned int v34 = *((_DWORD *)a4 + 11);
    int v30 = *((_DWORD *)a4 + 10);
    unsigned int v31 = *((_DWORD *)a4 + 26);
    char v22 = &a4[v7];
    int v23 = *((_DWORD *)a4 + 19);
    int v24 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:&a4[v6] in_headerSize:v5 in_bitmap:v22 in_bitmapSize:v8 in_usage:v39];
    uint64_t v25 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:&a4[v10] in_headerSize:v42 in_bitmap:&a4[v40] in_bitmapSize:v41 in_usage:0];
    int v26 = (void *)v25;
    int v12 = -7;
    if (v24 && v25)
    {
      LODWORD(v29) = v23;
      LODWORD(v28) = v30;
      LODWORD(v27) = v33;
      int v12 = -[MFGraphicsDevice maskBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:](self->m_gdi, "maskBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:", v38, v37, v36, v35, v24, v34, v27, v25, __PAIR64__(v31, v32), v28, v43, v29);
    }
  }
  return v12;
}

- (int)playPlgBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  v44[5] = *MEMORY[0x263EF8340];
  if (a3 < 0x8C) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 24);
  uint64_t v5 = *((unsigned int *)a4 + 25);
  if ((int)v6 + (int)v5 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 26);
  uint64_t v7 = *((unsigned int *)a4 + 27);
  uint64_t v9 = v8 + v7;
  if (v9 > a3) {
    return -7;
  }
  uint64_t v10 = *((unsigned int *)a4 + 31);
  uint64_t v11 = v10 + *((unsigned int *)a4 + 32);
  if (v11 > a3) {
    return -7;
  }
  unint64_t v14 = *((unsigned int *)a4 + 33) + (unint64_t)*((unsigned int *)a4 + 34);
  int v12 = -7;
  if (v14 <= a3 && !((v14 | v11 | (v6 + v5) | v9) >> 32))
  {
    uint64_t v37 = *((unsigned int *)a4 + 33);
    unsigned int v38 = *((_DWORD *)a4 + 34);
    unsigned int v39 = *((_DWORD *)a4 + 32);
    unsigned int v40 = *((_DWORD *)a4 + 23);
    *(void *)unsigned int v42 = 0;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:64];
    v41[0] = v16;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:68];
    v41[1] = v17;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:72];
    v41[2] = v18;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:76];
    v41[3] = v19;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:80];
    v41[4] = v20;
    +[MFByteUtils readFloat32FromByteArray:a4 in_offset:82];
    uint64_t v21 = 0;
    v41[5] = v22;
    int v23 = (double *)v44;
    do
    {
      parsePoint32((uint64_t)(a4 + 24), v21, &v42[1], v42);
      double v24 = (double)v42[0];
      *(v23 - 1) = (double)v42[1];
      *int v23 = v24;
      ++v21;
      v23 += 2;
    }
    while (v21 != 3);
    HIDWORD(v32) = *((_DWORD *)a4 + 29);
    unsigned int v33 = *((_DWORD *)a4 + 28);
    uint64_t v25 = &a4[v6];
    int v26 = &a4[v8];
    int v27 = *((_DWORD *)a4 + 22);
    unsigned int v35 = *((_DWORD *)a4 + 13);
    unsigned int v36 = *((_DWORD *)a4 + 12);
    uint64_t v28 = *((unsigned int *)a4 + 15);
    unsigned int v34 = *((_DWORD *)a4 + 14);
    uint64_t v29 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:v25 in_headerSize:v5 in_bitmap:v26 in_bitmapSize:v7 in_usage:v40];
    uint64_t v30 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:&a4[v10] in_headerSize:v39 in_bitmap:&a4[v37] in_bitmapSize:v38 in_usage:0];
    unsigned int v31 = (void *)v30;
    int v12 = -7;
    if (v29 && v30)
    {
      LODWORD(v32) = v27;
      int v12 = -[MFGraphicsDevice plgBlt:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:](self->m_gdi, "plgBlt:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:", v43, v29, v36, v35, v34, v28, v30, __PAIR64__(HIDWORD(v32), v33), v41, v32);
    }
  }
  return v12;
}

- (int)playSetDIBitsToDevice:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x4C) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 12);
  uint64_t v5 = *((unsigned int *)a4 + 13);
  if ((int)v6 + (int)v5 > a3) {
    return -1;
  }
  uint64_t v7 = *((unsigned int *)a4 + 14);
  uint64_t v8 = v7 + *((unsigned int *)a4 + 15);
  if ((v8 | (unint64_t)(v6 + v5)) >> 32 || v8 > a3) {
    return -1;
  }
  int v11 = *((_DWORD *)a4 + 9);
  int v12 = *((_DWORD *)a4 + 11);
  int v13 = *((_DWORD *)a4 + 17);
  if (v11 >= v13) {
    int v14 = 0;
  }
  else {
    int v14 = v11 - v13;
  }
  int v15 = v12 - v14;
  int v16 = *((_DWORD *)a4 + 18) + v13;
  int v17 = v12 + v11;
  BOOL v18 = __OFSUB__(v16, v17);
  int v19 = v16 - v17;
  if (v19 < 0 == v18) {
    int v19 = 0;
  }
  uint64_t v20 = (v19 + v15);
  if ((int)v20 < 1) {
    return 0;
  }
  uint64_t v22 = *((unsigned int *)a4 + 6);
  int v23 = *((_DWORD *)a4 + 7);
  uint64_t v24 = *((unsigned int *)a4 + 8);
  uint64_t v25 = *((unsigned int *)a4 + 10);
  int v26 = -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v6], *((unsigned int *)a4 + 13), &a4[v7]);
  if (v26)
  {
    LODWORD(v28) = 0;
    LODWORD(v27) = v14 + v11;
    HIDWORD(v27) = 13369344;
    int v4 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v22, (v14 + v23), v25, v20, v26, v24, v27, 0, v28);
  }
  else
  {
    int v4 = -7;
  }

  return v4;
}

- (int)playStretchDIBits:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x50) {
    return -7;
  }
  uint64_t v6 = *((unsigned int *)a4 + 12);
  uint64_t v5 = *((unsigned int *)a4 + 13);
  if ((int)v6 + (int)v5 > a3) {
    return -7;
  }
  unint64_t v7 = *((unsigned int *)a4 + 14) + (unint64_t)*((unsigned int *)a4 + 15);
  if ((v7 | (v6 + v5)) >> 32 || v7 > a3) {
    return -7;
  }
  unsigned int v23 = *((_DWORD *)a4 + 6);
  uint64_t v12 = *((unsigned int *)a4 + 8);
  unsigned int v22 = *((_DWORD *)a4 + 7);
  uint64_t v13 = *((unsigned int *)a4 + 18);
  uint64_t v14 = *((unsigned int *)a4 + 19);
  unsigned int v15 = *((_DWORD *)a4 + 9);
  unsigned int v16 = *((_DWORD *)a4 + 10);
  unsigned int v17 = *((_DWORD *)a4 + 11);
  unsigned int v18 = *((_DWORD *)a4 + 17);
  uint64_t v19 = -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v6]);
  uint64_t v20 = (void *)v19;
  if (v19)
  {
    BYTE4(v21) = 1;
    LODWORD(v21) = 0;
    int v9 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:usePaletteForBilevel:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:usePaletteForBilevel:", v23, v22, v13, v14, v19, v12, __PAIR64__(v16, v15), __PAIR64__(v18, v17), 0, v21);
  }
  else
  {
    int v9 = -7;
  }

  return v9;
}

- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  m_gdi = self->m_gdi;
  if (*((_DWORD *)a4 + 2) == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  return [(MFGraphicsDevice *)m_gdi setPolyFillMode:v6];
}

- (int)playSetMiterLimit:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  +[MFByteUtils readFloat32FromByteArray:a4 in_offset:8];
  double v8 = v7;
  m_gdi = self->m_gdi;
  return [(MFGraphicsDevice *)m_gdi setMiterLimit:v8];
}

- (int)playSetRop2:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi setRop2:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playBeginPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(MFGraphicsDevice *)self->m_gdi beginPath];
}

- (int)playAbortPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(MFGraphicsDevice *)self->m_gdi abortPath];
}

- (int)playEndPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(MFGraphicsDevice *)self->m_gdi endPath];
}

- (int)playWidenPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(MFGraphicsDevice *)self->m_gdi widenPath];
}

- (int)playCloseFigure:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice closeCurrentPath:](self->m_gdi, "closeCurrentPath:", 0, a4);
}

- (int)playStrokeAndFillPath:(unsigned int)a3 in_pRecord:(const char *)a4 in_stroke:(BOOL)a5 in_fill:(BOOL)a6
{
  return [(MFGraphicsDevice *)self->m_gdi strokeAndFillPath:a5 in_fill:a6];
}

- (int)playSelectClipPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC) {
    return [(MFGraphicsDevice *)self->m_gdi selectClipPath:*((unsigned int *)a4 + 2)];
  }
  else {
    return -7;
  }
}

- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x10) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 2);
  if (v5 > 0xFFFFFFEF || v5 + 16 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 3);
  uint64_t v9 = parseRegion(v5, (const unsigned __int8 *)a4 + 16);
  uint64_t v10 = (void *)v9;
  if (v9) {
    int v7 = [(MFGraphicsDevice *)self->m_gdi selectClipRegionWithRects:v9 in_mode:v8];
  }
  else {
    int v7 = -7;
  }

  return v7;
}

- (int)playFillRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x20) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFDF || v5 + 32 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned int *)a4 + 7);
  uint64_t v9 = parseRegion(v5, (const unsigned __int8 *)a4 + 32);
  uint64_t v10 = (void *)v9;
  if (v9) {
    int v7 = [(MFGraphicsDevice *)self->m_gdi fillRgnWithRects:v9 in_brushID:v8];
  }
  else {
    int v7 = -7;
  }

  return v7;
}

- (int)playPaintRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x1C) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFE3 || v5 + 28 > a3) {
    return -7;
  }
  uint64_t v8 = parseRegion(v5, (const unsigned __int8 *)a4 + 28);
  uint64_t v9 = (void *)v8;
  if (v8) {
    int v7 = [(MFGraphicsDevice *)self->m_gdi paintRgnWithRects:v8];
  }
  else {
    int v7 = -7;
  }

  return v7;
}

- (int)playInvertRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x1C) {
    return -7;
  }
  unsigned int v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFE3 || v5 + 28 > a3) {
    return -7;
  }
  uint64_t v8 = parseRegion(v5, (const unsigned __int8 *)a4 + 28);
  uint64_t v9 = (void *)v8;
  if (v8) {
    int v7 = [(MFGraphicsDevice *)self->m_gdi invertRgnWithRects:v8];
  }
  else {
    int v7 = -7;
  }

  return v7;
}

- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return -[MFGraphicsDevice excludeClipRect:](self->m_gdi, "excludeClipRect:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3), (double)*((int *)a4 + 4), (double)*((int *)a4 + 5));
  }
  else {
    return -7;
  }
}

- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18) {
    return -[MFGraphicsDevice intersectClipRect:](self->m_gdi, "intersectClipRect:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3), (double)(*((_DWORD *)a4 + 4) - *((_DWORD *)a4 + 2)), (double)(*((_DWORD *)a4 + 5) - *((_DWORD *)a4 + 3)));
  }
  else {
    return -7;
  }
}

- (int)playSetMetaRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return [(MFGraphicsDevice *)self->m_gdi setMetaRgn];
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (int *)[v3 bytes];
  if ((unint64_t)[v3 length] > 0x4F)
  {
    double v9 = (double)v4[18] / ((double)v4[20] * 100.0);
    double v10 = (double)v4[19] / ((double)v4[21] * 100.0);
    double v5 = v9 * (double)v4[6];
    double v6 = v10 * (double)v4[7];
    double v7 = v9 * (double)v4[8] - v5;
    double v8 = v10 * (double)v4[9] - v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v11 = v5;
  double v12 = v6;
  double v13 = v7;
  double v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_emfPlusPlayer, 0);
  objc_storeStrong((id *)&self->m_gdi, 0);
}

@end