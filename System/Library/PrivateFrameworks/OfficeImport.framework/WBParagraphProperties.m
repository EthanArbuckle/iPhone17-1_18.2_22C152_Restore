@interface WBParagraphProperties
+ (id)formattingChangeDate:(const WrdDateTime *)a3;
+ (void)createTrackedPropertiesIfNeeded:(id)a3;
+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5;
+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 document:(id)a6 properties:(id)a7;
@end

@implementation WBParagraphProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 document:(id)a6 properties:(id)a7
{
  id v13 = a3;
  id v11 = a7;
  v12 = v11;
  if (a4 && v11)
  {
    [v11 setResolveMode:0];
    [a1 mapWordProperties:a4 reader:v13 toProperties:v12];
    if (a5)
    {
      [v12 setResolveMode:1];
      [a1 mapWordProperties:a5 reader:v13 toProperties:v12];
    }
    [v12 setResolveMode:2];
  }
}

+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v9 & 4) != 0)
  {
    uint64_t BorderTopReference = WrdParagraphProperties::getBorderTopReference((WrdParagraphProperties *)a3);
    id v13 = [v8 mutableTopBorder];
    +[WBBorder readFrom:BorderTopReference to:v13];

    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
    if ((v9 & 8) == 0)
    {
LABEL_3:
      if ((v9 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v10 = *((void *)a3 + 2);
    if ((v9 & 8) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t BorderLeftReference = WrdParagraphProperties::getBorderLeftReference((WrdParagraphProperties *)a3);
  v15 = [v8 mutableLeftBorder];
  +[WBBorder readFrom:BorderLeftReference to:v15];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x10) == 0)
  {
LABEL_4:
    if ((v9 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t BorderBottomReference = WrdParagraphProperties::getBorderBottomReference((WrdParagraphProperties *)a3);
  v17 = [v8 mutableBottomBorder];
  +[WBBorder readFrom:BorderBottomReference to:v17];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x20) == 0)
  {
LABEL_5:
    if ((v9 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t BorderRightReference = WrdParagraphProperties::getBorderRightReference((WrdParagraphProperties *)a3);
  v19 = [v8 mutableRightBorder];
  +[WBBorder readFrom:BorderRightReference to:v19];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x40) == 0)
  {
LABEL_6:
    if ((v9 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t BorderBetweenReference = WrdParagraphProperties::getBorderBetweenReference((WrdParagraphProperties *)a3);
  v21 = [v8 mutableBetweenBorder];
  +[WBBorder readFrom:BorderBetweenReference to:v21];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v9 & 0x80) == 0)
  {
LABEL_7:
    if ((v10 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t BorderBarReference = WrdParagraphProperties::getBorderBarReference((WrdParagraphProperties *)a3);
  v23 = [v8 mutableBarBorder];
  +[WBBorder readFrom:BorderBarReference to:v23];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80) == 0)
  {
LABEL_8:
    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t ShadingReference = WrdParagraphProperties::getShadingReference((WrdParagraphProperties *)a3);
  v25 = [v8 mutableShading];
  +[WBShading readFrom:ShadingReference to:v25];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 1) == 0)
  {
LABEL_9:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  v26 = [v7 styleAtIndex:*((unsigned __int16 *)a3 + 70) expectedType:1];
  [v8 setBaseStyle:v26];

  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000) == 0)
  {
LABEL_10:
    if ((v10 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v8 setPageBreakBefore:(*(_DWORD *)((char *)a3 + 294) >> 5) & 1];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 8) == 0)
  {
LABEL_11:
    if ((v10 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v8 setListLevel:*((unsigned __int8 *)a3 + 300)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x10) == 0)
  {
LABEL_12:
    if ((v10 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v8 setListIndex:*((unsigned __int16 *)a3 + 71)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v8 setDropCap:*(unsigned __int8 *)(*((void *)a3 + 6) + 8) | ((unint64_t)*(unsigned __int8 *)(*((void *)a3 + 6) + 12) << 8)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000) == 0)
  {
LABEL_14:
    if ((v10 & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v8 setWidth:*((int *)a3 + 58)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v10 & 0x10000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v8 setHeight:*((unsigned __int16 *)a3 + 145)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x10000000) == 0)
  {
LABEL_16:
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v8 setHeightRule:*((unsigned int *)a3 + 40)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_17:
    if ((v10 & 0x40000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v8 setVerticalSpace:*((int *)a3 + 59)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x40000000) == 0)
  {
LABEL_18:
    if ((v10 & 0x400000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v8 setHorizontalSpace:*((int *)a3 + 60)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000000) == 0)
  {
LABEL_19:
    if ((v10 & 0x1000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v8 setWrap:(*(_DWORD *)((char *)a3 + 294) >> 11) & 1];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_20:
    if ((v10 & 0x800000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v8 setHorizontalAnchor:*((unsigned int *)a3 + 39)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x800000) == 0)
  {
LABEL_21:
    if ((v10 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v8 setVerticalAnchor:*((unsigned int *)a3 + 38)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x100000) == 0)
  {
LABEL_22:
    if ((v10 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v8 setHorizontalPosition:*((int *)a3 + 56)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200000) == 0)
  {
LABEL_23:
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v8 setVerticalPosition:*((int *)a3 + 57)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_24:
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v8 setWrapCode:*((char *)a3 + 298)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v8 setAnchorLock:(*(_DWORD *)((char *)a3 + 294) >> 8) & 1];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x40000) == 0)
  {
LABEL_26:
    if ((v10 & 0x200000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v8 setSpaceBefore:*((unsigned __int16 *)a3 + 136)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((v10 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v8 setSpaceBeforeAuto:(*(_DWORD *)((char *)a3 + 294) >> 23) & 1];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x80000) == 0)
  {
LABEL_28:
    if ((v10 & 0x400000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v8 setSpaceAfter:*((unsigned __int16 *)a3 + 138)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x400000000000000) == 0)
  {
LABEL_29:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v8 setSpaceAfterAuto:HIBYTE(*(_DWORD *)((char *)a3 + 294)) & 1];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x20000) == 0)
  {
LABEL_30:
    if ((v10 & 0x1000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_71;
  }
LABEL_65:
  [v8 setLineSpacing:*(__int16 *)(*((void *)a3 + 5) + 8)];
  uint64_t v10 = *((void *)a3 + 2);
  if ((v10 & 0x20000) != 0)
  {
    uint64_t v27 = *((void *)a3 + 5);
    if (*(__int16 *)(v27 + 8) < 0) {
      uint64_t v28 = 1;
    }
    else {
      uint64_t v28 = 2 * (*(_WORD *)(v27 + 10) != 1);
    }
    [v8 setLineSpacingRule:v28];
    uint64_t v10 = *((void *)a3 + 2);
  }
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v10 & 0x800000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v8 setLeadingIndent:*((__int16 *)a3 + 126)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x800000000000000) == 0)
  {
LABEL_32:
    if ((v10 & 0x4000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v8 setFollowingIndent:*((__int16 *)a3 + 124)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x4000000000000000) == 0)
  {
LABEL_33:
    if ((v10 & 0x2000000000000000) == 0) {
      goto LABEL_34;
    }
LABEL_74:
    [v8 setRightIndent:*((__int16 *)a3 + 132)];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
    if ((v10 & 0x8000000000000000) == 0) {
      goto LABEL_35;
    }
LABEL_75:
    id v11 = (char *)a3 + 256;
    goto LABEL_76;
  }
LABEL_73:
  [v8 setLeftIndent:*((__int16 *)a3 + 134)];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_74;
  }
LABEL_34:
  if (v10 < 0) {
    goto LABEL_75;
  }
LABEL_35:
  if ((v9 & 1) == 0) {
    goto LABEL_77;
  }
  id v11 = (char *)a3 + 260;
LABEL_76:
  [v8 setFirstLineIndent:*(__int16 *)v11];
  uint64_t v10 = *((void *)a3 + 2);
  __int16 v9 = *((_WORD *)a3 + 12);
LABEL_77:
  if ((v10 & 0x20) != 0)
  {
    [v8 setJustification:*((unsigned int *)a3 + 42)];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x40) != 0)
  {
    [v8 setPhysicalJustification:*((unsigned int *)a3 + 43)];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x80000000000) != 0)
  {
    [v8 setOutlineLevel:*((unsigned __int8 *)a3 + 299)];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x1000) != 0)
  {
    [v8 setKeepNextParagraphTogether:(*(_DWORD *)((char *)a3 + 294) >> 4) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x800) != 0)
  {
    [v8 setKeepLinesTogether:(*(_DWORD *)((char *)a3 + 294) >> 3) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x4000000) != 0)
  {
    [v8 setSuppressAutoHyphens:(*(_DWORD *)((char *)a3 + 294) >> 7) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x10000) != 0)
  {
    [v8 setSuppressLineNumbers:(*(_DWORD *)((char *)a3 + 294) >> 6) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100000000) != 0)
  {
    [v8 setWidowControl:(*(_DWORD *)((char *)a3 + 294) >> 9) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100000000000) != 0)
  {
    [v8 setBiDi:HIWORD(*(_DWORD *)((char *)a3 + 294)) & 1];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x200000000) != 0)
  {
    [v8 setKinsokuOff:(*(_DWORD *)((unsigned char *)a3 + 294) & 0x400) == 0];
    uint64_t v10 = *((void *)a3 + 2);
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v10 & 0x100) != 0)
  {
    uint64_t v29 = *((unsigned __int16 *)a3 + 68);
    if (*((__int16 *)a3 + 68) >= 1)
    {
      uint64_t v30 = 0;
      do
      {
        __int16 v34 = *(_WORD *)(*((void *)a3 + 25) + 2 * v30);
        WrdTabDescriptor::WrdTabDescriptor((WrdTabDescriptor *)v33, *(const WrdTabDescriptor **)(*((void *)a3 + 22) + 8 * v30));
        char v35 = v33[8];
        char v36 = v33[12];
        [v8 addTabStopAdded:&v34];
        ++v30;
      }
      while (v29 != v30);
    }
    [v8 setTabStopAddedCount:(__int16)v29];
    if ((*((void *)a3 + 2) & 0x100) != 0)
    {
      uint64_t v31 = *((unsigned __int16 *)a3 + 69);
      if (*((__int16 *)a3 + 69) >= 1)
      {
        uint64_t v32 = 0;
        do
        {
          [v8 addTabStopDeletedPosition:*(__int16 *)(*((void *)a3 + 26) + v32)];
          v32 += 2;
        }
        while (2 * v31 != v32);
      }
      [v8 setTabStopDeletedPositionCount:(__int16)v31];
    }
    __int16 v9 = *((_WORD *)a3 + 12);
  }
  if ((v9 & 0x200) != 0) {
    [v8 setFormattingChanged:(*(_DWORD *)((char *)a3 + 294) >> 26) & 1];
  }
}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", a3);
}

+ (void)createTrackedPropertiesIfNeeded:(id)a3
{
  id v3 = a3;
  [v3 setResolveMode:1];
  if ([v3 isAnythingOverridden]
    && (v4 = +[WBObjectFactory create:41]) != 0)
  {
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end