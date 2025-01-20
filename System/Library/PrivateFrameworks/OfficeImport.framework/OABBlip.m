@interface OABBlip
+ (EshBlip)writeBlip:(id)a3;
+ (id)compressMetafileData:(id)a3 info:(void *)a4;
+ (id)delayedSubBlipWithMetafileInfo:(const void *)a3;
+ (id)dibFileContentsWithDibBlipData:(const OcBinaryData *)a3;
+ (id)readBlipFromBse:(id)a3;
+ (id)readBlipFromEshBlip:(EshBlip *)a3;
+ (id)subBlipWithMetafileInfo:(const void *)a3;
+ (int)blipTypeForBlipSignature:(int)a3;
+ (void)setMetafileBoundsFromPictData:(id)a3 info:(void *)a4;
+ (void)writeBlip:(id)a3 toBlipStoreEntry:(EshBSE *)a4;
+ (void)writeEmptyBlipStoreEntry:(EshBSE *)a3;
@end

@implementation OABBlip

+ (id)readBlipFromBse:(id)a3
{
  id v4 = a3;
  v5 = (const void *)[v4 eshObject];
  if (v5
  {
    int v7 = v6[13];
    if (v7 && *((void *)v6 + 4))
    {
      objc_msgSend(a1, "readBlipFromEshBlip:");
      v8 = (OADBlip *)objc_claimAutoreleasedReturnValue();
      *[(OADBlip *)v8 referenceCount] = v7;
    }
    else
    {
      v8 = objc_alloc_init(OADBlip);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)readBlipFromEshBlip:(EshBlip *)a3
{
  if (!a3)
  {
    v10 = 0;
    goto LABEL_20;
  }
  int RecordType = EshRecord::getRecordType((EshRecord *)a3);
  v6 = objc_alloc_init(OADBlip);
  if ((RecordType - 61466) >= 6 && (RecordType - 61481) > 1) {
    goto LABEL_18;
  }
  if ((*((uint64_t (**)(EshBlip *))a3->var0 + 10))(a3))
  {
    uint64_t v7 = 2;
    if (RecordType <= 61470)
    {
      if (RecordType != 61469)
      {
        if (RecordType != 61470) {
          goto LABEL_23;
        }
        uint64_t v7 = 3;
      }
    }
    else if (RecordType != 61482)
    {
      if (RecordType != 61481)
      {
        if (RecordType == 61471)
        {
          v8 = [[OADSubBlip alloc] initWithData:0 type:1];
          v9 = [(ESDBlipContext *)[ESDDibFileBlipContext alloc] initWithOffset:*(unsigned int *)&a3[1].var3.var0[4] byteCount:*(unsigned int *)&a3[1].var3.var0[12] stream:*(void *)&a3[2].var2.var1 streamID:*(unsigned int *)&a3[1].var3.var0[8]];
          [(OCDDelayedNode *)v8 setDelayedContext:v9];
          [(OADBlip *)v6 setMainSubBlip:v8];
LABEL_17:

LABEL_18:
          v10 = v6;
          goto LABEL_19;
        }
LABEL_23:
        v8 = [a1 delayedSubBlipWithMetafileInfo:&a3[1]];
        [(OADBlip *)v6 setMainSubBlip:v8];
        v9 = [a1 delayedSubBlipWithMetafileInfo:&a3[3].var2.var4];
        if (v9) {
          [(OADBlip *)v6 setAltSubBlip:v9];
        }
        goto LABEL_17;
      }
      uint64_t v7 = 8;
    }
    v8 = [[OADSubBlip alloc] initWithData:0 type:v7];
    v9 = [[ESDBlipContext alloc] initWithOffset:*(unsigned int *)&a3[1].var3.var0[4] byteCount:*(unsigned int *)&a3[1].var3.var0[12] stream:*(void *)&a3[2].var2.var1 streamID:*(unsigned int *)&a3[1].var3.var0[8]];
    [(OCDDelayedNode *)v8 setDelayedContext:v9];
    [(OADBlip *)v6 setMainSubBlip:v8];
    goto LABEL_17;
  }
  +[TCMessageException raise:TCUnknownProblemMessage];
  v10 = 0;
LABEL_19:

LABEL_20:
  return v10;
}

+ (id)delayedSubBlipWithMetafileInfo:(const void *)a3
{
  int v4 = **(_WORD **)a3 & 0xFFFE;
  if (v4 && (int v5 = v4 == 1346, v6 = objc_msgSend(a1, "blipTypeForBlipSignature:"), v6) && *((_DWORD *)a3 + 10))
  {
    uint64_t v7 = [[OADSubBlip alloc] initWithData:0 type:v6];
    -[OADSubBlip setSizeInPoints:](v7, "setSizeInPoints:", (double)*((int *)a3 + 23) / 12700.0, (double)*((int *)a3 + 24) / 12700.0);
    -[OADSubBlip setFrame:](v7, "setFrame:", (double)*((int *)a3 + 19), (double)*((int *)a3 + 20), (double)(*((_DWORD *)a3 + 21) - *((_DWORD *)a3 + 19)), (double)(*((_DWORD *)a3 + 22) - *((_DWORD *)a3 + 20)));
    v8 = [[ESDMetafileBlipContext alloc] initWithOffset:*((unsigned int *)a3 + 8) byteCount:*((unsigned int *)a3 + 10) uncompressed:*((unsigned int *)a3 + 18) stream:*((void *)a3 + 8) streamID:*((unsigned int *)a3 + 9)];
    [(ESDMetafileBlipContext *)v8 setDefaultHeaderSize:(v5 << 9)];
    [(OCDDelayedNode *)v7 setDelayedContext:v8];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

+ (int)blipTypeForBlipSignature:(int)a3
{
  if (a3 <= 1759)
  {
    if (a3 <= 1129)
    {
      if (a3 == 534) {
        return 4;
      }
      if (a3 == 980) {
        return 5;
      }
      return 0;
    }
    if (a3 != 1130)
    {
      if (a3 == 1346) {
        return 6;
      }
      return 0;
    }
    return 2;
  }
  if (a3 <= 1763)
  {
    if (a3 == 1760) {
      return 3;
    }
    if (a3 != 1762) {
      return 0;
    }
    return 2;
  }
  if (a3 == 1764) {
    return 8;
  }
  return a3 == 1960;
}

+ (EshBlip)writeBlip:(id)a3
{
  int v4 = (void *)MEMORY[0x23EC9A170]();
  int v5 = [a3 mainSubBlip];
  switch([v5 type])
  {
    case 2u:
      int v6 = 0;
      int v7 = 1;
      int v8 = 1;
      break;
    case 3u:
      int v8 = 0;
      int v7 = 1;
      int v6 = 1;
      break;
    case 4u:
      int v8 = 0;
      int v6 = 0;
      int v7 = 1;
      break;
    case 5u:
      int v8 = 0;
      int v6 = 0;
      int v7 = 1;
      break;
    case 6u:
      int v8 = 0;
      int v6 = 0;
      int v7 = 1;
      break;
    default:
      int v7 = 0;
      int v8 = 0;
      int v6 = 0;
      break;
  }
  v9 = [v5 data];
  v10 = v9;
  if (v9) {
    int v11 = v7;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1 && [v9 length])
  {
    CFUUIDRef v12 = CFUUIDCreate(0);
    CFUUIDGetUUIDBytes(v12);
    if ((v8 | v6) == 1) {
      operator new();
    }
    operator new();
  }

  return 0;
}

+ (void)writeBlip:(id)a3 toBlipStoreEntry:(EshBSE *)a4
{
  id v13 = a3;
  if (*(_DWORD *)[v13 referenceCount]
    && ([v13 mainSubBlip],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 sizeInBytes],
        v6,
        v7 >= 1)
    && (int v8 = (EshBlip *)[a1 writeBlip:v13], (v9 = v8) != 0))
  {
    int BlipType = EshBlip::getBlipType(v8);
    int v11 = BlipType;
    int v12 = BlipType;
    switch(BlipType)
    {
      case 0:
        goto LABEL_6;
      case 1:
        break;
      case 2:
      case 3:
        int v12 = 4;
        break;
      case 4:
        int v12 = 4;
        int v11 = 3;
        break;
      default:
        int v12 = BlipType;
        break;
    }
    EshRecord::setInstance((uint64_t)a4, BlipType);
    a4->var11 = v11;
    a4->var12 = v12;
    a4->var8 = 255;
    a4->var9 = 0;
    a4->var6 = *(_DWORD *)[v13 referenceCount];
    a4->var15 = v9->var3;
    a4->var3 = v9;
  }
  else
  {
LABEL_6:
    [a1 writeEmptyBlipStoreEntry:a4];
  }
}

+ (id)dibFileContentsWithDibBlipData:(const OcBinaryData *)a3
{
  int v4 = [MEMORY[0x263EFF990] dataWithCapacity:0];
  var5 = (unsigned int *)a3->var5;
  uint64_t var3 = a3->var3;
  unsigned int v16 = var3 + 14;
  int SInt32 = CsLeReadSInt32(var5);
  uint64_t v8 = 14;
  if (SInt32 == 12) {
    uint64_t v8 = 10;
  }
  unsigned int UInt16 = CsLeReadUInt16((unsigned __int16 *)((char *)var5 + v8));
  if (SInt32 == 12) {
    int v10 = 3;
  }
  else {
    int v10 = 4;
  }
  int v11 = 1 << UInt16;
  if (UInt16 >= 9) {
    int v11 = 0;
  }
  int v15 = SInt32 + v11 * v10 + 14;
  [v4 appendBytes:"BM" length:2];
  int v14 = CsLeReadSInt32(&v16);
  [v4 appendBytes:&v14 length:4];
  [v4 appendBytes:&unk_238EDBFEC length:4];
  int v13 = CsLeReadSInt32((unsigned int *)&v15);
  [v4 appendBytes:&v13 length:4];
  [v4 appendBytes:var5 length:var3];
  return v4;
}

+ (id)subBlipWithMetafileInfo:(const void *)a3
{
  int v3 = **(_WORD **)a3 & 0xFFFE;
  if ((**(_WORD **)a3 & 0xFFFE) != 0)
  {
    uint64_t v5 = [a1 blipTypeForBlipSignature:**(_WORD **)a3 & 0xFFFE];
    int v6 = v3 == 1346;
    uLong v7 = *((unsigned int *)a3 + 25);
    uLongf v8 = *((unsigned int *)a3 + 18);
    uLongf destLen = v8;
    id v9 = objc_retainAutorelease((id)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:(v8 + (v6 << 9))]);
    if (uncompress((Bytef *)([v9 mutableBytes] + (v6 << 9)), &destLen, *((const Bytef **)a3 + 6), v7))
    {
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = destLen == v8;
    }
    if (v10)
    {
      int v11 = [[OADSubBlip alloc] initWithData:v9 type:v5];
      -[OADSubBlip setSizeInPoints:](v11, "setSizeInPoints:", (double)*((int *)a3 + 23) / 12700.0, (double)*((int *)a3 + 24) / 12700.0);
      -[OADSubBlip setFrame:](v11, "setFrame:", (double)*((int *)a3 + 19), (double)*((int *)a3 + 20), (double)(*((_DWORD *)a3 + 21) - *((_DWORD *)a3 + 19)), (double)(*((_DWORD *)a3 + 22) - *((_DWORD *)a3 + 20)));
    }
    else
    {
      int v11 = 0;
    }
  }
  else
  {
    int v11 = 0;
  }
  return v11;
}

+ (void)setMetafileBoundsFromPictData:(id)a3 info:(void *)a4
{
  id v14 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v14];
  int v6 = v5;
  if (v5)
  {
    [v5 size];
  }
  else
  {
    double v7 = 1000.0;
    double v8 = 1000.0;
  }
  float v9 = v7 * 12700.0;
  float v10 = v8 * 12700.0;
  *((_DWORD *)a4 + 23) = llroundf(v9);
  *((_DWORD *)a4 + 24) = llroundf(v10);
  float v11 = v7;
  int v12 = llroundf(v11);
  float v13 = v8;
  *((_DWORD *)a4 + 19) = 0;
  *((_DWORD *)a4 + 20) = 0;
  *((_DWORD *)a4 + 21) = v12;
  *((_DWORD *)a4 + 22) = llroundf(v13);
}

+ (id)compressMetafileData:(id)a3 info:(void *)a4
{
  id v5 = a3;
  int v6 = [v5 length];
  *((_DWORD *)a4 + 18) = v6;
  uLongf v7 = (int)vcvtps_s32_f32((float)((float)v6 * 1.01) + 12.0);
  [MEMORY[0x263EFF990] dataWithLength:v7];
  uLongf destLen = v7;
  id v8 = objc_claimAutoreleasedReturnValue();
  float v9 = (Bytef *)[v8 mutableBytes];
  id v10 = v5;
  if (compress(v9, &destLen, (const Bytef *)[v10 bytes], v6)) {
    +[TCMessageException raise:TCUnknownProblemMessage];
  }
  [v8 setLength:destLen];
  *((_DWORD *)a4 + 25) = destLen;
  *((_WORD *)a4 + 52) = -512;

  return v8;
}

+ (void)writeEmptyBlipStoreEntry:(EshBSE *)a3
{
  *(void *)&a3->var11 = 0;
  a3->var8 = 255;
  a3->var9 = 0;
  a3->var6 = 0;
}

@end