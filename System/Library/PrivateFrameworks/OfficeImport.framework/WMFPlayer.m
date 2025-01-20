@interface WMFPlayer
+ (CGRect)boundsInLogicalUnits:(id)a3;
+ (CGRect)boundsInPoints:(id)a3;
+ (CGRect)placeableBounds:(const char *)a3;
+ (CGRect)windowBounds:(id)a3;
- (WMFPlayer)initWithGraphicsDevice:(id)a3;
- (id)parseRegion:(unsigned int)a3 in_pData:(const char *)a4;
- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateDIBPatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateFontIndirect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreatePatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreatePenIndirect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playCreateRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playDibBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playDibStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playFillRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playFrameRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playInvertRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playMoveTo:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playOffsetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playOffsetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPaintRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPatBlt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playPolyline:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetROP2:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextCharExtra:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playStretchDib:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playTextOut:(unsigned int)a3 in_pRecord:(const char *)a4;
- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5;
- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5;
- (int)records;
- (void)done;
@end

@implementation WMFPlayer

- (WMFPlayer)initWithGraphicsDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WMFPlayer;
  v6 = [(WMFPlayer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_gdi, a3);
    *(void *)&v7->m_records = 0xFFFFFFFFLL;
  }

  return v7;
}

- (void)done
{
}

+ (CGRect)placeableBounds:(const char *)a3
{
  int v3 = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  int v4 = (__int16)(*((unsigned __int8 *)a3 + 9) << 8) | *((unsigned __int8 *)a3 + 8);
  int v5 = (__int16)(*((unsigned __int8 *)a3 + 11) << 8) | *((unsigned __int8 *)a3 + 10);
  int v6 = (__int16)(*((unsigned __int8 *)a3 + 13) << 8) | *((unsigned __int8 *)a3 + 12);
  if (v3 >= v5) {
    int v7 = (__int16)(*((unsigned __int8 *)a3 + 11) << 8) | *((unsigned __int8 *)a3 + 10);
  }
  else {
    int v7 = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  }
  double v8 = (double)v7;
  if (v4 >= v6) {
    int v9 = (__int16)(*((unsigned __int8 *)a3 + 13) << 8) | *((unsigned __int8 *)a3 + 12);
  }
  else {
    int v9 = (__int16)(*((unsigned __int8 *)a3 + 9) << 8) | *((unsigned __int8 *)a3 + 8);
  }
  double v10 = (double)v9;
  int v11 = v5 - v3;
  if (v11 < 0) {
    int v11 = -v11;
  }
  double v12 = (double)v11;
  int v13 = v6 - v4;
  if (v6 - v4 < 0) {
    int v13 = v4 - v6;
  }
  double v14 = (double)v13;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

+ (CGRect)boundsInPoints:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 length];
  id v6 = v4;
  int v7 = (_DWORD *)[v6 bytes];
  if (v5 <= 0x11) {
    goto LABEL_2;
  }
  double v12 = v7;
  if (*v7 != -1698247209) {
    goto LABEL_8;
  }
  if (v5 > 0x27)
  {
    +[WMFPlayer placeableBounds:v7];
    if (v15 != 0.0 && v16 != 0.0)
    {
      LOWORD(v17) = *((_WORD *)v12 + 7);
      double v18 = (double)v17;
      double v8 = v13 / v18 * 72.0;
      double v9 = v14 / v18 * 72.0;
      double v10 = v15 / v18 * 72.0;
      double v19 = v16 / v18;
LABEL_9:
      double v11 = v19 * 72.0;
      goto LABEL_10;
    }
LABEL_8:
    [a1 windowBounds:v6];
    double v8 = v20 / 101.599998 * 72.0;
    double v9 = v21 / 108.373337 * 72.0;
    double v10 = v22 / 101.599998 * 72.0;
    double v19 = v23 / 108.373337;
    goto LABEL_9;
  }
LABEL_2:
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_10:

  double v24 = v8;
  double v25 = v9;
  double v26 = v10;
  double v27 = v11;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (CGRect)windowBounds:(id)a3
{
  id v3 = a3;
  int v4 = [v3 length];
  id v5 = v3;
  id v6 = (_DWORD *)[v5 bytes];
  if (*v6 == -1698247209) {
    unsigned int v7 = 40;
  }
  else {
    unsigned int v7 = 18;
  }
  if (v4 - v7 < 6)
  {
    double v13 = 0.0;
    double v12 = 1024.0;
    double v11 = 1280.0;
    double v10 = 0.0;
  }
  else
  {
    unsigned int v8 = (v4 - v7) >> 1;
    double v9 = (char *)v6 + v7;
    double v10 = 0.0;
    double v11 = 1280.0;
    double v12 = 1024.0;
    double v13 = 0.0;
    do
    {
      unsigned int v14 = *(_DWORD *)v9;
      int v15 = *((unsigned __int16 *)v9 + 2);
      if (*((_WORD *)v9 + 2)) {
        BOOL v16 = v14 >= 3;
      }
      else {
        BOOL v16 = 0;
      }
      if (!v16 || v8 < v14) {
        break;
      }
      if (v15 == 524)
      {
        double v12 = (double)*((__int16 *)v9 + 3);
        double v11 = (double)*((__int16 *)v9 + 4);
      }
      else if (v15 == 523)
      {
        double v10 = (double)*((__int16 *)v9 + 3);
        double v13 = (double)*((__int16 *)v9 + 4);
      }
      v9 += 2 * v14;
      v8 -= v14;
    }
    while (v8 > 2);
  }
  v22.origin.x = v13;
  v22.origin.y = v10;
  v22.size.width = v11;
  v22.size.height = v12;
  if (CGRectGetWidth(v22) == 0.0
    || (v23.origin.x = v13, v23.origin.y = v10, v23.size.width = v11, v23.size.height = v12, CGRectGetHeight(v23) == 0.0))
  {
    double v13 = 0.0;
    double v12 = 1024.0;
    double v11 = 1280.0;
    double v10 = 0.0;
  }

  double v18 = v13;
  double v19 = v10;
  double v20 = v11;
  double v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (int)records
{
  return self->m_records;
}

- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5 = *((unsigned __int16 *)a4 + 2);
  if (v5 > 551)
  {
    if (v5 > 1312)
    {
      if (v5 <= 2073)
      {
        if (v5 > 1564)
        {
          if (v5 > 1790)
          {
            if (v5 == 1791) {
              return [(WMFPlayer *)self playCreateRegion:*(void *)&a3 in_pRecord:a4];
            }
            if (v5 == 2071) {
              return [(WMFPlayer *)self playArc:*(void *)&a3 in_pRecord:a4];
            }
          }
          else
          {
            if (v5 == 1565) {
              return [(WMFPlayer *)self playPatBlt:*(void *)&a3 in_pRecord:a4];
            }
            if (v5 == 1574)
            {
              unsigned int v7 = "META_ESCAPE";
              return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
            }
          }
        }
        else if (v5 > 1351)
        {
          if (v5 == 1352)
          {
            unsigned int v7 = "META_EXTFLOODFILL";
            return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
          }
          if (v5 == 1564) {
            return [(WMFPlayer *)self playRoundRect:*(void *)&a3 in_pRecord:a4];
          }
        }
        else
        {
          if (v5 == 1313) {
            return [(WMFPlayer *)self playTextOut:*(void *)&a3 in_pRecord:a4];
          }
          if (v5 == 1336) {
            return [(WMFPlayer *)self playPolyPolygon:*(void *)&a3 in_pRecord:a4];
          }
        }
      }
      else if (v5 <= 2609)
      {
        if (v5 > 2337)
        {
          if (v5 == 2338) {
            return [(WMFPlayer *)self playBitBlt:*(void *)&a3 in_pRecord:a4];
          }
          if (v5 == 2368) {
            return [(WMFPlayer *)self playDibBitBlt:*(void *)&a3 in_pRecord:a4];
          }
        }
        else
        {
          if (v5 == 2074) {
            return [(WMFPlayer *)self playPie:*(void *)&a3 in_pRecord:a4];
          }
          if (v5 == 2096) {
            return [(WMFPlayer *)self playChord:*(void *)&a3 in_pRecord:a4];
          }
        }
      }
      else if (v5 <= 2880)
      {
        if (v5 == 2610) {
          return [(WMFPlayer *)self playExtTextOut:*(void *)&a3 in_pRecord:a4];
        }
        if (v5 == 2851)
        {
          unsigned int v7 = "META_STRETCHBLT";
          return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
        }
      }
      else
      {
        switch(v5)
        {
          case 2881:
            return [(WMFPlayer *)self playDibStretchBlt:*(void *)&a3 in_pRecord:a4];
          case 3379:
            unsigned int v7 = "META_SETDIBTODEV";
            return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
          case 3907:
            return [(WMFPlayer *)self playStretchDib:*(void *)&a3 in_pRecord:a4];
        }
      }
    }
    else
    {
      if (v5 > 1039)
      {
        switch(v5)
        {
          case 1040:
            return [(WMFPlayer *)self playScaleWindowExt:*(void *)&a3 in_pRecord:a4];
          case 1041:
          case 1043:
          case 1044:
          case 1047:
          case 1050:
          case 1052:
          case 1053:
          case 1054:
            return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
          case 1042:
            return [(WMFPlayer *)self playScaleViewportExt:*(void *)&a3 in_pRecord:a4];
          case 1045:
            return [(WMFPlayer *)self playExcludeClipRect:*(void *)&a3 in_pRecord:a4];
          case 1046:
            return [(WMFPlayer *)self playIntersectClipRect:*(void *)&a3 in_pRecord:a4];
          case 1048:
            return [(WMFPlayer *)self playEllipse:*(void *)&a3 in_pRecord:a4];
          case 1049:
            unsigned int v7 = "META_FLOODFILL";
            return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
          case 1051:
            return [(WMFPlayer *)self playRectangle:*(void *)&a3 in_pRecord:a4];
          case 1055:
            unsigned int v7 = "META_SETPIXEL";
            return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
          default:
            if (v5 == 1065) {
              return [(WMFPlayer *)self playFrameRegion:*(void *)&a3 in_pRecord:a4];
            }
            if (v5 != 1078) {
              return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
            }
            unsigned int v7 = "META_ANIMATEPALETTE";
            break;
        }
        return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
      }
      if (v5 > 762)
      {
        if (v5 > 803)
        {
          if (v5 == 804) {
            return [(WMFPlayer *)self playPolygon:*(void *)&a3 in_pRecord:a4];
          }
          if (v5 == 805) {
            return [(WMFPlayer *)self playPolyline:*(void *)&a3 in_pRecord:a4];
          }
        }
        else
        {
          if (v5 == 763) {
            return [(WMFPlayer *)self playCreateFontIndirect:*(void *)&a3 in_pRecord:a4];
          }
          if (v5 == 764) {
            return [(WMFPlayer *)self playCreateBrushIndirect:*(void *)&a3 in_pRecord:a4];
          }
        }
      }
      else if (v5 > 563)
      {
        if (v5 == 564) {
          return [(WMFPlayer *)self playSelectPalette:*(void *)&a3 in_pRecord:a4];
        }
        if (v5 == 762) {
          return [(WMFPlayer *)self playCreatePenIndirect:*(void *)&a3 in_pRecord:a4];
        }
      }
      else
      {
        if (v5 == 552) {
          return [(WMFPlayer *)self playFillRegion:*(void *)&a3 in_pRecord:a4];
        }
        if (v5 == 561)
        {
          unsigned int v7 = "META_SETMAPPERFLAGS";
          return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
        }
      }
    }
    return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
  }
  if (v5 > 312)
  {
    if (v5 <= 504)
    {
      switch(v5)
      {
        case 313:
          return [(WMFPlayer *)self playResizePalette:*(void *)&a3 in_pRecord:a4];
        case 322:
          return [(WMFPlayer *)self playCreateDIBPatternBrush:*(void *)&a3 in_pRecord:a4];
        case 496:
          return [(WMFPlayer *)self playDeleteObject:*(void *)&a3 in_pRecord:a4];
      }
      return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
    }
    switch(v5)
    {
      case 505:
        int result = [(WMFPlayer *)self playCreatePatternBrush:*(void *)&a3 in_pRecord:a4];
        break;
      case 506:
      case 507:
      case 508:
      case 509:
      case 510:
      case 511:
      case 512:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 528:
      case 530:
        return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
      case 513:
        int result = [(WMFPlayer *)self playSetBkColour:*(void *)&a3 in_pRecord:a4];
        break;
      case 521:
        int result = [(WMFPlayer *)self playSetTextColour:*(void *)&a3 in_pRecord:a4];
        break;
      case 522:
        int result = [(WMFPlayer *)self playSetTextJustification:*(void *)&a3 in_pRecord:a4];
        break;
      case 523:
        int result = [(WMFPlayer *)self playSetWindowOrg:*(void *)&a3 in_pRecord:a4];
        break;
      case 524:
        int result = [(WMFPlayer *)self playSetWindowExt:*(void *)&a3 in_pRecord:a4];
        break;
      case 525:
        int result = [(WMFPlayer *)self playSetViewportOrg:*(void *)&a3 in_pRecord:a4];
        break;
      case 526:
        int result = [(WMFPlayer *)self playSetViewportExt:*(void *)&a3 in_pRecord:a4];
        break;
      case 527:
        int result = [(WMFPlayer *)self playOffsetWindowOrg:*(void *)&a3 in_pRecord:a4];
        break;
      case 529:
        int result = [(WMFPlayer *)self playOffsetViewportOrg:*(void *)&a3 in_pRecord:a4];
        break;
      case 531:
        int result = [(WMFPlayer *)self playLineTo:*(void *)&a3 in_pRecord:a4];
        break;
      case 532:
        int result = [(WMFPlayer *)self playMoveTo:*(void *)&a3 in_pRecord:a4];
        break;
      default:
        if (v5 != 544) {
          return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
        }
        int result = [(WMFPlayer *)self playOffsetClipRegion:*(void *)&a3 in_pRecord:a4];
        break;
    }
  }
  else
  {
    if (v5 <= 54)
    {
      switch(v5)
      {
        case 0:
          return -2;
        case 30:
          return [(WMFPlayer *)self playSaveDC:*(void *)&a3 in_pRecord:a4];
        case 53:
          return [(WMFPlayer *)self playRealizePalette:*(void *)&a3 in_pRecord:a4];
      }
      return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
    }
    switch(v5)
    {
      case 247:
        int result = [(WMFPlayer *)self playCreatePalette:*(void *)&a3 in_pRecord:a4];
        break;
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 256:
      case 257:
        return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
      case 258:
        int result = [(WMFPlayer *)self playSetBkMode:*(void *)&a3 in_pRecord:a4];
        break;
      case 259:
        int result = [(WMFPlayer *)self playSetMapMode:*(void *)&a3 in_pRecord:a4];
        break;
      case 260:
        int result = [(WMFPlayer *)self playSetROP2:*(void *)&a3 in_pRecord:a4];
        break;
      case 261:
        unsigned int v7 = "META_SETRELABS";
        return [(WMFPlayer *)self playUnsupported:*(void *)&a3 in_recordName:v7 in_pRecord:a4];
      case 262:
        int result = [(WMFPlayer *)self playSetPolyFillMode:*(void *)&a3 in_pRecord:a4];
        break;
      case 263:
        int result = [(WMFPlayer *)self playSetStretchBltMode:*(void *)&a3 in_pRecord:a4];
        break;
      case 264:
        int result = [(WMFPlayer *)self playSetTextCharExtra:*(void *)&a3 in_pRecord:a4];
        break;
      default:
        switch(v5)
        {
          case 295:
            int result = [(WMFPlayer *)self playRestoreDC:*(void *)&a3 in_pRecord:a4];
            break;
          case 296:
          case 297:
            return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
          case 298:
            int result = [(WMFPlayer *)self playInvertRegion:*(void *)&a3 in_pRecord:a4];
            break;
          case 299:
            int result = [(WMFPlayer *)self playPaintRegion:*(void *)&a3 in_pRecord:a4];
            break;
          case 300:
            int result = [(WMFPlayer *)self playSelectClipRegion:*(void *)&a3 in_pRecord:a4];
            break;
          case 301:
            int result = [(WMFPlayer *)self playSelectObject:*(void *)&a3 in_pRecord:a4];
            break;
          case 302:
            int result = [(WMFPlayer *)self playSetTextAlign:*(void *)&a3 in_pRecord:a4];
            break;
          default:
            if (v5 != 55) {
              return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(void *)&a3);
            }
            int result = [(WMFPlayer *)self playSetPaletteEntries:*(void *)&a3 in_pRecord:a4];
            break;
        }
        break;
    }
  }
  return result;
}

- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4 = a4;
  if (a3 == 18)
  {
    double v13 = 0.0;
    double v12 = 1280.0;
    double v11 = 1024.0;
    double v10 = 0.0;
  }
  else
  {
    if (a3 != 40) {
      return -7;
    }
    +[WMFPlayer placeableBounds:a4];
    double v10 = 0.0;
    double v11 = 1024.0;
    double v12 = 1280.0;
    if (v8 == 0.0)
    {
      double v13 = 0.0;
    }
    else
    {
      double v13 = 0.0;
      if (v9 != 0.0)
      {
        float v14 = 1000.0 / (double)(11 * *((unsigned __int16 *)v4 + 7));
        double v15 = v14;
        double v13 = v6 * v15;
        double v10 = v7 * v15;
        double v12 = v8 * v15;
        double v11 = v9 * v15;
      }
    }
    v4 += 22;
  }
  int v17 = *(_DWORD *)(v4 + 6);
  self->m_windowsVersion = *((_WORD *)v4 + 2);
  self->m_records = (v17 - 9) / 3u;
  int result = [(MFGraphicsDevice *)self->m_gdi setMapMode:8];
  if (!result)
  {
    int result = [(MFGraphicsDevice *)self->m_gdi setWindowOrg:(int)v13 in_y:(int)v10];
    if (!result)
    {
      int result = [(MFGraphicsDevice *)self->m_gdi setWindowExt:(int)v12 in_y:(int)v11];
      if (!result)
      {
        int result = [(MFGraphicsDevice *)self->m_gdi setViewportOrg:0 in_y:0];
        if (!result)
        {
          int result = [(MFGraphicsDevice *)self->m_gdi setViewportExt:(int)v12 in_y:(int)v11];
          if (!result)
          {
            m_gdi = self->m_gdi;
            return [(MFGraphicsDevice *)m_gdi setViewBox:0.0 top:0.0 width:v12 height:v11];
          }
        }
      }
    }
  }
  return result;
}

- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playPatBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x12) {
    return [(MFGraphicsDevice *)self->m_gdi patBlt:(__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16) in_y:(__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14) in_width:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) in_height:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) in_rop:*(unsigned int *)(a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x1E) {
    return -7;
  }
  uint64_t v4 = *((unsigned __int16 *)a4 + 13);
  if (*((unsigned __int16 *)a4 + 14) * v4 + 32 > a3) {
    return -7;
  }
  int v7 = *((unsigned __int8 *)a4 + 10);
  __int16 v8 = *((unsigned __int8 *)a4 + 11);
  unsigned int v9 = *((unsigned __int8 *)a4 + 12);
  __int16 v10 = *((unsigned __int8 *)a4 + 13);
  int v19 = *(_DWORD *)(a4 + 6);
  unsigned int v20 = *((unsigned __int16 *)a4 + 7);
  HIDWORD(v18) = *((unsigned __int16 *)a4 + 8);
  unsigned int v11 = *((unsigned __int8 *)a4 + 18);
  __int16 v12 = *((unsigned __int8 *)a4 + 19);
  unsigned int v13 = *((unsigned __int8 *)a4 + 20);
  __int16 v14 = *((unsigned __int8 *)a4 + 21);
  double v15 = [(MFGraphicsDevice *)self->m_gdi createBitmap:*((unsigned __int16 *)a4 + 12) in_height:v4 in_planes:*((unsigned __int8 *)a4 + 30) in_bitsPerPixel:*((unsigned __int8 *)a4 + 31) in_bitmap:a4 + 32 in_bitmapSize:a3 - 32];
  if (v15)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = (__int16)(v8 << 8) | v7;
    HIDWORD(v17) = v19;
    int v5 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", (__int16)(v14 << 8) | v13, (__int16)(v12 << 8) | v11, HIDWORD(v18), v20, v15, (__int16)(v10 << 8) | v9, v17, 0, v18);
  }
  else
  {
    int v5 = -7;
  }

  return v5;
}

- (int)playDibBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x18) {
    return -7;
  }
  double v6 = (unsigned __int16 *)&a4[2 * (a3 == 24)];
  uint64_t v7 = v6[7];
  uint64_t v8 = v6[8];
  uint64_t v9 = v6[9];
  uint64_t v10 = v6[10];
  if (a3 == 24)
  {
    [(MFGraphicsDevice *)self->m_gdi fillRectangle:v6[10] y1:v6[9] x2:(v10 + v8) y2:(v9 + v7)];
    return 0;
  }
  else
  {
    unsigned int v11 = *(_DWORD *)(a4 + 6);
    unsigned int v12 = *((unsigned __int16 *)a4 + 5);
    uint64_t v13 = *((unsigned __int16 *)a4 + 6);
    uint64_t v14 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:a4 + 22 in_dibSize:a3 - 22 in_usage:0];
    double v15 = (void *)v14;
    if (v14)
    {
      LODWORD(v17) = 0;
      int v4 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v10, v9, v8, v7, v14, v13, __PAIR64__(v11, v12), 0, v17);
    }
    else
    {
      int v4 = -7;
    }
  }
  return v4;
}

- (int)playStretchDib:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x28) {
    return -7;
  }
  int v28 = *((unsigned __int8 *)a4 + 7);
  int v29 = *((unsigned __int8 *)a4 + 6);
  int v30 = *((unsigned __int8 *)a4 + 9);
  int v26 = *((unsigned __int8 *)a4 + 12);
  int v27 = *((unsigned __int8 *)a4 + 8);
  int v24 = *((unsigned __int8 *)a4 + 14);
  __int16 v25 = *((unsigned __int8 *)a4 + 13);
  int v22 = *((unsigned __int8 *)a4 + 16);
  __int16 v23 = *((unsigned __int8 *)a4 + 15);
  unsigned int v20 = *((unsigned __int8 *)a4 + 18);
  __int16 v21 = *((unsigned __int8 *)a4 + 17);
  __int16 v19 = *((unsigned __int8 *)a4 + 19);
  unsigned int v6 = *((unsigned __int8 *)a4 + 20);
  __int16 v7 = *((unsigned __int8 *)a4 + 21);
  unsigned int v8 = *((unsigned __int8 *)a4 + 22);
  __int16 v9 = *((unsigned __int8 *)a4 + 23);
  unsigned int v10 = *((unsigned __int8 *)a4 + 24);
  __int16 v11 = *((unsigned __int8 *)a4 + 25);
  unsigned int v12 = *((unsigned __int8 *)a4 + 26);
  __int16 v13 = *((unsigned __int8 *)a4 + 27);
  uint64_t v14 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:a4 + 28 in_dibSize:a3 - 28 in_usage:*((unsigned __int16 *)a4 + 5)];
  if (v14)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = (__int16)(v25 << 8) | v26;
    *(void *)((char *)&v17 + 4) = v29 | (v28 << 8) | (v27 << 16) | (v30 << 24);
    LODWORD(v16) = (__int16)(v21 << 8) | v22;
    HIDWORD(v16) = (__int16)(v23 << 8) | v24;
    int v4 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", (__int16)(v13 << 8) | v12, (__int16)(v11 << 8) | v10, (__int16)(v9 << 8) | v8, (__int16)(v7 << 8) | v6, v14, (__int16)(v19 << 8) | v20, v16, (void)v17, 0, v18);
  }
  else
  {
    int v4 = -7;
  }

  return v4;
}

- (int)playDibStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x26) {
    return -7;
  }
  int v28 = *((unsigned __int8 *)a4 + 7);
  int v29 = *((unsigned __int8 *)a4 + 6);
  int v30 = *((unsigned __int8 *)a4 + 9);
  int v26 = *((unsigned __int8 *)a4 + 10);
  int v27 = *((unsigned __int8 *)a4 + 8);
  int v24 = *((unsigned __int8 *)a4 + 12);
  int v25 = *((unsigned __int8 *)a4 + 11);
  int v22 = *((unsigned __int8 *)a4 + 14);
  int v23 = *((unsigned __int8 *)a4 + 13);
  int v20 = *((unsigned __int8 *)a4 + 16);
  int v21 = *((unsigned __int8 *)a4 + 15);
  int v19 = *((unsigned __int8 *)a4 + 17);
  int v6 = *((unsigned __int8 *)a4 + 18);
  int v7 = *((unsigned __int8 *)a4 + 19);
  int v8 = *((unsigned __int8 *)a4 + 20);
  int v9 = *((unsigned __int8 *)a4 + 21);
  unsigned int v10 = *((unsigned __int8 *)a4 + 22);
  __int16 v11 = *((unsigned __int8 *)a4 + 23);
  unsigned int v12 = *((unsigned __int8 *)a4 + 24);
  __int16 v13 = *((unsigned __int8 *)a4 + 25);
  uint64_t v14 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:a4 + 26 in_dibSize:a3 - 26 in_usage:0];
  if (v14)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = v26 | (v25 << 8);
    *(void *)((char *)&v17 + 4) = v29 | (v28 << 8) | (v27 << 16) | (v30 << 24);
    LODWORD(v16) = v22 | (v21 << 8);
    HIDWORD(v16) = v24 | (v23 << 8);
    int v4 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", (__int16)(v13 << 8) | v12, (__int16)(v11 << 8) | v10, v8 | (v9 << 8), v6 | (v7 << 8), v14, v20 | (v19 << 8), v16, (void)v17, 0, v18);
  }
  else
  {
    int v4 = -7;
  }

  return v4;
}

- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi setTextAlign:a4[6] & 1 textHorizontalAlign:a4[6] & 6 textVerticalAlign:a4[6] & 0x18 textDirection:(a4[7] & 1) << 8];
  }
  else {
    return -7;
  }
}

- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  int v6 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 6) green:*((unsigned __int8 *)a4 + 7) blue:*((unsigned __int8 *)a4 + 8)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi setBkColour:v6];

  return v4;
}

- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 7) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:");
  }
}

- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 1) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setBkMode:](self->m_gdi, "setBkMode:");
  }
}

- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 3) {
    return -7;
  }
  else {
    return -[MFGraphicsDevice setStretchBltMode:](self->m_gdi, "setStretchBltMode:");
  }
}

- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  int v6 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 6) green:*((unsigned __int8 *)a4 + 7) blue:*((unsigned __int8 *)a4 + 8)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi setTextColour:v6];

  return v4;
}

- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi setTextJustification:*((unsigned __int16 *)a4 + 4) in_breakCount:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSetTextCharExtra:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi setTextCharExtra:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi offsetClipRegionByX:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6) y:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8)];
  }
  else {
    return -7;
  }
}

- (int)playTextOut:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 7) {
    return -7;
  }
  int v5 = (*((_WORD *)a4 + 3) & 1) + *((unsigned __int16 *)a4 + 3);
  if (v5 + 12 > a3) {
    return -7;
  }
  int v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a4 + 8);
  int v6 = [(MFGraphicsDevice *)self->m_gdi textOutEncoded:(__int16)(a4[v5 + 11] << 8) | a4[v5 + 10] y:(__int16)(a4[v5 + 9] << 8) | a4[v5 + 8] in_data:v8];

  return v6;
}

- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xE) {
    return -7;
  }
  int v5 = *((unsigned __int8 *)a4 + 10);
  uint64_t v6 = v5 | (*((unsigned __int8 *)a4 + 11) << 8);
  int v7 = (v5 & 1) + v6;
  if (v7 + 14 > a3) {
    return -7;
  }
  __int16 v9 = *((unsigned __int8 *)a4 + 7);
  __int16 v10 = *((unsigned __int8 *)a4 + 9);
  int v11 = *((unsigned __int8 *)a4 + 12);
  if ((v11 & 6) == 0)
  {
    unsigned int v12 = 0;
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    unsigned int v16 = 0;
    unsigned int v15 = 14;
LABEL_7:
    unsigned int v17 = v15 + v7;
    unsigned int v18 = a3 - v17;
    if (a3 < v17) {
      return -7;
    }
    unsigned int v32 = v16;
    unsigned int v33 = v14;
    unsigned int v34 = *((unsigned __int8 *)a4 + 6);
    int v35 = *((unsigned __int8 *)a4 + 13);
    unsigned int v36 = *((unsigned __int8 *)a4 + 8);
    unsigned int v37 = v13;
    unsigned int v38 = v12;
    uint64_t v39 = [MEMORY[0x263EFF8F8] dataWithBytes:&a4[v15] length:v6];
    unsigned int v21 = v18 >> 1;
    if (v18 >= 2)
    {
      int v23 = (char *)malloc_type_malloc(4 * (v18 >> 1), 0xD809582AuLL);
      int v22 = v23;
      if (!v23)
      {
        int v19 = -4;
        int v30 = (void *)v39;
        goto LABEL_19;
      }
      uint64_t v24 = 0;
      if (v21 <= 1) {
        unsigned int v25 = 1;
      }
      else {
        unsigned int v25 = v21;
      }
      int v26 = &a4[(v5 & 1) + 1 + v15 + (unint64_t)v6];
      uint64_t v27 = 4 * v25;
      do
      {
        int v28 = *((unsigned __int8 *)v26 - 1);
        __int16 v29 = *(unsigned __int8 *)v26;
        v26 += 2;
        *(_DWORD *)&v23[v24] = (__int16)(v29 << 8) | v28;
        v24 += 4;
      }
      while (v27 != v24);
    }
    else
    {
      int v22 = 0;
    }
    int v30 = (void *)v39;
    LODWORD(v31) = v21;
    int v19 = -[MFGraphicsDevice extTextOutEncoded:y:in_data:options:left:top:right:bottom:spacingValues:numValues:](self->m_gdi, "extTextOutEncoded:y:in_data:options:left:top:right:bottom:spacingValues:numValues:", (__int16)(v10 << 8) | v36, (__int16)(v9 << 8) | v34, v39, v11 | (v35 << 8), v38, v37, __PAIR64__(v32, v33), v22, v31);
    free(v22);
LABEL_19:

    return v19;
  }
  if (a3 >= 0x16)
  {
    unsigned int v12 = *((unsigned __int16 *)a4 + 7);
    unsigned int v13 = *((unsigned __int16 *)a4 + 8);
    unsigned int v14 = *((unsigned __int16 *)a4 + 9);
    unsigned int v15 = 22;
    unsigned int v16 = *((unsigned __int16 *)a4 + 10);
    goto LABEL_7;
  }
  return -7;
}

- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE) {
    return [(MFGraphicsDevice *)self->m_gdi rectangle:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) y1:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) x2:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) y2:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE) {
    return [(MFGraphicsDevice *)self->m_gdi ellipse:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) y1:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) x2:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) y2:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 6) {
    return [(MFGraphicsDevice *)self->m_gdi saveDC];
  }
  else {
    return -7;
  }
}

- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi restoreDC:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playMoveTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi moveTo:(double)*((__int16 *)a4 + 4) y:(double)*((__int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi lineTo:(double)*((__int16 *)a4 + 4) y:(double)*((__int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8) {
    return -7;
  }
  uint64_t v5 = *((unsigned __int16 *)a4 + 3);
  if (4 * (int)v5 + 8 > a3) {
    return -7;
  }
  if (!*((_WORD *)a4 + 3)) {
    return -4;
  }
  int v8 = (char *)malloc_type_malloc((16 * v5), 0xD809582AuLL);
  if (!v8) {
    return -4;
  }
  __int16 v9 = v8;
  uint64_t v10 = 0;
  int v11 = a4 + 11;
  do
  {
    unsigned int v12 = (double *)&v8[v10];
    *unsigned int v12 = (double)*(__int16 *)(v11 - 3);
    v12[1] = (double)*(__int16 *)(v11 - 1);
    v10 += 16;
    v11 += 4;
  }
  while (16 * v5 != v10);
  int v13 = [(MFGraphicsDevice *)self->m_gdi polygon:v8 in_count:v5];
  free(v9);
  return v13;
}

- (int)playPolyline:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC) {
    return -7;
  }
  uint64_t v5 = *((unsigned __int16 *)a4 + 3);
  if (4 * (int)v5 + 8 > a3) {
    return -7;
  }
  if (!*((_WORD *)a4 + 3)) {
    return -4;
  }
  int v8 = (char *)malloc_type_malloc((16 * v5), 0xD809582AuLL);
  if (!v8) {
    return -4;
  }
  __int16 v9 = v8;
  uint64_t v10 = 0;
  int v11 = a4 + 11;
  do
  {
    unsigned int v12 = (double *)&v8[v10];
    *unsigned int v12 = (double)*(__int16 *)(v11 - 3);
    v12[1] = (double)*(__int16 *)(v11 - 1);
    v10 += 16;
    v11 += 4;
  }
  while (16 * v5 != v10);
  int v13 = [(MFGraphicsDevice *)self->m_gdi polyline:v8 in_count:v5];
  free(v9);
  return v13;
}

- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x16) {
    return -7;
  }
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x16) {
    return -7;
  }
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 != 22) {
    return -7;
  }
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 == 18) {
    return [(MFGraphicsDevice *)self->m_gdi roundRect:(__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16) top:(__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14) right:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) bottom:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) rx:(double)*((__int16 *)a4 + 4) * 0.5 ry:(double)*((__int16 *)a4 + 3) * 0.5];
  }
  else {
    return -7;
  }
}

- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8) {
    return -7;
  }
  uint64_t v6 = *((unsigned __int16 *)a4 + 3);
  unsigned int v7 = 2 * v6 + 8;
  if (v7 > a3) {
    return -7;
  }
  if (!*((_WORD *)a4 + 3)) {
    return -4;
  }
  int v11 = (char *)malloc_type_malloc(4 * *((unsigned __int16 *)a4 + 3), 0xD809582AuLL);
  if (!v11) {
    return -4;
  }
  unsigned int v12 = v11;
  uint64_t v13 = 0;
  LODWORD(v14) = 0;
  unsigned int v15 = a4 + 9;
  do
  {
    int v16 = *(unsigned __int16 *)(v15 - 1);
    unint64_t v14 = (v16 + v14);
    *(_DWORD *)&v11[v13] = v16;
    v13 += 4;
    v15 += 2;
  }
  while (4 * v6 != v13);
  if (v7 + 4 * v14 <= a3)
  {
    if (v14 && (unsigned int v17 = (double *)malloc_type_malloc(16 * v14, 0xD809582AuLL)) != 0)
    {
      unsigned int v18 = v17;
      unint64_t v19 = 0;
      int v20 = &a4[(2 * v6) + 8];
      unsigned int v21 = v17 + 1;
      do
      {
        *(v21 - 1) = (double)*(__int16 *)v20;
        int v22 = *((__int16 *)v20 + 1);
        v20 += 4;
        *unsigned int v21 = (double)v22;
        v21 += 2;
        ++v19;
      }
      while (v19 < v14);
      int v8 = [(MFGraphicsDevice *)self->m_gdi polyPolygon:v17 in_polyCounts:v12 in_count:v6];
      free(v18);
    }
    else
    {
      int v8 = -4;
    }
  }
  else
  {
    int v8 = -7;
  }
  free(v12);
  return v8;
}

- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  uint64_t v6 = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  uint64_t v7 = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    int result = 0;
    self->m_ignoreSetWindowOrg = 1;
  }
  else if (self->m_boundsSet)
  {
    m_gdi = self->m_gdi;
    uint64_t v10 = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
    uint64_t v11 = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
    return [(MFGraphicsDevice *)m_gdi setWindowExt:v10 in_y:v11];
  }
  else
  {
    if ((int)v6 >= 0) {
      int v12 = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
    }
    else {
      int v12 = -(int)v6;
    }
    if ((int)v7 >= 0) {
      int v13 = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
    }
    else {
      int v13 = -(int)v7;
    }
    int result = [(MFGraphicsDevice *)self->m_gdi setMapMode:8];
    if (!result)
    {
      int result = [(MFGraphicsDevice *)self->m_gdi setWindowExt:v6 in_y:v7];
      if (!result)
      {
        BOOL v14 = (int)v7 >= 0 || (int)v6 <= -1;
        __int16 v15 = v14 ? v7 : v13;
        int result = [(MFGraphicsDevice *)self->m_gdi setViewportExt:v6 in_y:v15];
        if (!result) {
          int result = [(MFGraphicsDevice *)self->m_gdi setViewBox:0.0 top:0.0 width:(double)v12 height:(double)v13];
        }
      }
    }
    self->m_boundsSet = 1;
  }
  return result;
}

- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  if (self->m_ignoreSetWindowOrg) {
    return 0;
  }
  return [(MFGraphicsDevice *)self->m_gdi setWindowOrg:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_y:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
}

- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE) {
    return [(MFGraphicsDevice *)self->m_gdi scaleWindowExt:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) in_xDenom:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) in_yNum:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_yDenom:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playOffsetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi offsetWindowOrg:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_y:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playOffsetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi offsetViewportOrg:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_y:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi setViewportExt:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_y:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi setViewportOrg:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_y:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE) {
    return [(MFGraphicsDevice *)self->m_gdi scaleViewportExt:(__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12) in_xDenom:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) in_yNum:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_yDenom:(__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)];
  }
  else {
    return -7;
  }
}

- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi selectObject:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi selectObject:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi deleteObject:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playCreateDIBPatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x16) {
    return -7;
  }
  uint64_t v6 = [(MFGraphicsDevice *)self->m_gdi createDIBitmap:a4 + 10 in_dibSize:a3 - 10 in_usage:*((unsigned __int16 *)a4 + 4)];
  if (v6) {
    int v4 = [(MFGraphicsDevice *)self->m_gdi createPatternBrush:v6 index:0xFFFFFFFFLL usePaletteForBilevel:0];
  }
  else {
    int v4 = -7;
  }

  return v4;
}

- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 6) {
    return [(MFGraphicsDevice *)self->m_gdi realizePalette];
  }
  else {
    return -7;
  }
}

- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  int v5 = *((unsigned __int16 *)a4 + 4);
  if (4 * v5 + 10 > a3) {
    return -7;
  }
  BOOL v8 = [MEMORY[0x263EFF980] arrayWithCapacity:*((unsigned __int16 *)a4 + 4)];
  if (v5)
  {
    __int16 v9 = (unsigned __int8 *)(a4 + 12);
    do
    {
      uint64_t v10 = +[OITSUColor colorWithRGBBytes:*(v9 - 2) green:*(v9 - 1) blue:*v9];
      [v8 addObject:v10];
      v9 += 4;

      --v5;
    }
    while (v5);
  }
  int v6 = [(MFGraphicsDevice *)self->m_gdi createPalette:v8 in_index:0xFFFFFFFFLL];

  return v6;
}

- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA) {
    return -7;
  }
  int v5 = *((unsigned __int16 *)a4 + 4);
  if (4 * v5 + 10 > a3) {
    return -7;
  }
  uint64_t v8 = *((unsigned __int16 *)a4 + 3);
  __int16 v9 = [MEMORY[0x263EFF980] arrayWithCapacity:*((unsigned __int16 *)a4 + 4)];
  if (v5)
  {
    uint64_t v10 = (unsigned __int8 *)(a4 + 12);
    do
    {
      uint64_t v11 = +[OITSUColor colorWithRGBBytes:*(v10 - 2) green:*(v10 - 1) blue:*v10];
      [v9 addObject:v11];
      v10 += 4;

      --v5;
    }
    while (v5);
  }
  int v6 = [(MFGraphicsDevice *)self->m_gdi setPaletteEntries:v8 in_colours:v9 in_index:0xFFFFFFFFLL];

  return v6;
}

- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi resizePalette:*((unsigned __int16 *)a4 + 3) in_index:0xFFFFFFFFLL];
  }
  else {
    return -7;
  }
}

- (int)playCreatePatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x12
    || *((unsigned __int16 *)a4 + 6)
     * ((__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10))
     + 38 > a3)
  {
    return -7;
  }
  int v6 = [(MFGraphicsDevice *)self->m_gdi createBitmap:(__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8) in_height:(__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10) in_planes:*((unsigned __int8 *)a4 + 14) in_bitsPerPixel:*((unsigned __int8 *)a4 + 15) in_bitmap:a4 + 38 in_bitmapSize:a3 - 38];
  if (v6) {
    int v4 = [(MFGraphicsDevice *)self->m_gdi createPatternBrush:v6 index:0xFFFFFFFFLL usePaletteForBilevel:0];
  }
  else {
    int v4 = -7;
  }

  return v4;
}

- (int)playCreatePenIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x10) {
    return -7;
  }
  if (*((unsigned __int16 *)a4 + 3) <= 6u) {
    uint64_t v6 = *((unsigned __int16 *)a4 + 3);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *((unsigned __int16 *)a4 + 4);
  uint64_t v8 = +[OITSUColor colorWithRGBBytes:*((unsigned __int8 *)a4 + 12) green:*((unsigned __int8 *)a4 + 13) blue:*((unsigned __int8 *)a4 + 14)];
  int v4 = [(MFGraphicsDevice *)self->m_gdi createPen:v6 width:v7 in_colour:v8 in_userStyleArray:0 index:0xFFFFFFFFLL];

  return v4;
}

- (int)playCreateFontIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0x18) {
    return -7;
  }
  unsigned int v33 = *((unsigned __int8 *)a4 + 8);
  unsigned int v34 = *((unsigned __int8 *)a4 + 6);
  __int16 v28 = *((unsigned __int8 *)a4 + 9);
  __int16 v29 = *((unsigned __int8 *)a4 + 7);
  unsigned int v31 = *((unsigned __int8 *)a4 + 12);
  unsigned int v32 = *((unsigned __int8 *)a4 + 10);
  __int16 v26 = *((unsigned __int8 *)a4 + 13);
  __int16 v27 = *((unsigned __int8 *)a4 + 11);
  unsigned int v30 = *((unsigned __int8 *)a4 + 14);
  __int16 v25 = *((unsigned __int8 *)a4 + 15);
  int v35 = *((unsigned __int8 *)a4 + 16);
  int v36 = *((unsigned __int8 *)a4 + 17);
  int v37 = *((unsigned __int8 *)a4 + 18);
  int v8 = *((unsigned __int8 *)a4 + 19);
  unsigned int v9 = *((unsigned __int8 *)a4 + 20);
  char v38 = a4[21];
  unsigned int v10 = *((unsigned __int8 *)a4 + 22);
  unsigned int v11 = *((unsigned __int8 *)a4 + 23);
  int IsValidCharSet = ChValueIsValidCharSet(v8);
  if (IsValidCharSet) {
    int v13 = 0;
  }
  else {
    int v13 = -7;
  }
  if (!IsValidCharSet) {
    int v8 = 0;
  }
  if (a3 <= 0x18)
  {
    __int16 v15 = 0;
  }
  else
  {
    if (v8 == 128) {
      unint64_t v14 = OCNsStringEncodingForWindowsCharSet(128);
    }
    else {
      unint64_t v14 = 5;
    }
    int v16 = a4 + 24;
    __int16 v15 = (void *)[[NSString alloc] initWithBytes:v16 length:32 encoding:v14];
    if (!v15) {
      __int16 v15 = (void *)[[NSString alloc] initWithBytes:v16 length:32 encoding:5];
    }
    if (!v15) {
      int v13 = -7;
    }
  }
  if (v9 >= 0xB || v11 >= 0x60) {
    int v4 = -7;
  }
  else {
    int v4 = v13;
  }
  if (!v4)
  {
    int v18 = v11 & 0xF0;
    if (v11 >= 0x60) {
      int v18 = 0;
    }
    int v19 = v10 & 3;
    if (v10 < 5) {
      int v19 = v10;
    }
    if (v9 >= 0xB) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v9;
    }
    LODWORD(v24) = v18;
    BYTE4(v23) = v38;
    HIDWORD(v22) = v8;
    LODWORD(v23) = v20;
    BYTE1(v22) = v37 != 0;
    LOBYTE(v22) = v36 != 0;
    int v4 = -[MFGraphicsDevice createFontIndirect:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](self->m_gdi, "createFontIndirect:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", (__int16)(v29 << 8) | v34, (__int16)(v28 << 8) | v33, (__int16)(v27 << 8) | v32, (__int16)(v26 << 8) | v31, (__int16)(v25 << 8) | v30, v35 != 0, v22, v23, __PAIR64__(v11 & 3, v19), v24, v15);
  }

  return v4;
}

- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
  {
    uint64_t v7 = *((unsigned __int16 *)a4 + 3);
    int v8 = [(MFGraphicsDevice *)self->m_gdi createColorWithRGBBytes:*((unsigned __int8 *)a4 + 8) green:*((unsigned __int8 *)a4 + 9) blue:*((unsigned __int8 *)a4 + 10) flags:*((unsigned __int8 *)a4 + 11)];
    if ((v7 - 3) >= 7)
    {
      if (v7 >= 3)
      {
        int v4 = -7;
LABEL_10:

        return v4;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
    if (*((unsigned __int16 *)a4 + 6) >= 6u) {
      uint64_t v9 = 0xFFFFFFLL;
    }
    else {
      uint64_t v9 = *((unsigned __int16 *)a4 + 6);
    }
    int v4 = [(MFGraphicsDevice *)self->m_gdi createBrush:v7 in_colour:v8 hatchstyle:v9 index:0xFFFFFFFFLL];
    goto LABEL_10;
  }
  return -7;
}

- (int)playCreateRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  BOOL v4 = a3 >= 6;
  uint64_t v5 = a3 - 6;
  if (!v4) {
    return -7;
  }
  int v8 = [(WMFPlayer *)self parseRegion:v5 in_pData:a4 + 6];
  if (v8) {
    int v6 = [(MFGraphicsDevice *)self->m_gdi createRegion:v8];
  }
  else {
    int v6 = -7;
  }

  return v6;
}

- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8) {
    return -7;
  }
  m_gdi = self->m_gdi;
  if (*((_WORD *)a4 + 3) == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  return [(MFGraphicsDevice *)m_gdi setPolyFillMode:v6];
}

- (int)playSetROP2:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi setRop2:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -1;
  }
}

- (int)playFillRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA) {
    return [(MFGraphicsDevice *)self->m_gdi fillRgn:*((unsigned __int16 *)a4 + 4) in_brushID:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playFrameRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE) {
    return [(MFGraphicsDevice *)self->m_gdi frameRegion:*((unsigned __int16 *)a4 + 6) in_brushID:*((unsigned __int16 *)a4 + 5) in_width:*((unsigned __int16 *)a4 + 4) in_height:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playInvertRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi invertRgn:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playPaintRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi paintRgn:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8) {
    return [(MFGraphicsDevice *)self->m_gdi setClipRegion:*((unsigned __int16 *)a4 + 3)];
  }
  else {
    return -7;
  }
}

- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xE) {
    return -1;
  }
  int v5 = (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10);
  int v6 = (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12);
  return -[MFGraphicsDevice excludeClipRect:](self->m_gdi, "excludeClipRect:", (double)v6, (double)v5, (double)(((__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8)) - v6), (double)(((__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)) - v5));
}

- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xE) {
    return -1;
  }
  int v5 = (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10);
  int v6 = (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12);
  return -[MFGraphicsDevice intersectClipRect:](self->m_gdi, "intersectClipRect:", (double)v6, (double)v5, (double)(((__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8)) - v6), (double)(((__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)) - v5));
}

- (id)parseRegion:(unsigned int)a3 in_pData:(const char *)a4
{
  if (a3 < 0x16)
  {
    if (!a3)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "array", *(void *)&a3, a4);
      goto LABEL_16;
    }
  }
  else
  {
    int v6 = *((unsigned __int16 *)a4 + 5);
    uint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:*((unsigned __int16 *)a4 + 5)];
    if (!v6) {
      goto LABEL_16;
    }
    int v8 = 0;
    uint64_t v9 = (unsigned __int8 *)(a4 + 22);
    unsigned int v10 = &a4[a3];
    while (1)
    {
      unsigned int v11 = v9 + 6;
      if (v9 + 6 > (unsigned __int8 *)v10) {
        break;
      }
      int v12 = *v9;
      if (v12) {
        break;
      }
      unint64_t v13 = (2 * v12) | (v9[1] << 9);
      if (&v11[v13] > (unsigned __int8 *)v10) {
        break;
      }
      if (v13)
      {
        unint64_t v14 = 0;
        int v15 = (__int16)(v9[3] << 8) | v9[2];
        double v16 = (double)v15;
        double v17 = (double)(((__int16)(v9[5] << 8) | v9[4]) - v15);
        do
        {
          int v18 = (__int16)(v9[v14 + 7] << 8) | v9[v14 + 6];
          int v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", (double)v18, v16, (double)(((__int16)(v9[v14 + 9] << 8) | v9[v14 + 8]) - v18), v17);
          [v7 addObject:v19];

          v14 += 4;
        }
        while (v14 < v13);
      }
      uint64_t v9 = &v11[(v13 + 2)];
      if (++v8 == v6) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_16:
  return v7;
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 length];
  id v6 = v4;
  uint64_t v7 = (_DWORD *)[v6 bytes];
  if (v5 <= 0x11) {
    goto LABEL_4;
  }
  if (*v7 != -1698247209)
  {
LABEL_8:
    [a1 windowBounds:v6];
    double v8 = v16;
    double v9 = v17;
    double v10 = v18;
    double v11 = v19;
    goto LABEL_9;
  }
  if (v5 > 0x27)
  {
    +[WMFPlayer placeableBounds:v7];
    double v10 = v15;
    if (v15 != 0.0)
    {
      double v11 = v14;
      if (v14 != 0.0)
      {
        double v8 = v12;
        double v9 = v13;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_4:
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
LABEL_9:

  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void).cxx_destruct
{
}

@end