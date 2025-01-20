@interface BLScoreData
- ($5D796546D9AF09FC9BC354EAF68730F2)featureVector;
- (BOOL)isIr;
- (NSNumber)frameNumber;
- (_sEispLibDbgInfoFwCommon)readFwCommon:(const _sEispLibDbgInfoShared *)a3;
- (char)readStructure:(const _sEispLibDbgInfoShared *)a3 withId:(int)a4;
- (float)scoreVersus:(id)a3;
- (id)initFromDebugData:(id)a3;
- (unsigned)sequenceNumber;
- (unsigned)structureOffset:(const _sEispLibDbgInfoShared *)a3 withId:(int)a4;
- (void)dealloc;
- (void)setSequenceNumber:(unsigned __int16)a3;
@end

@implementation BLScoreData

- (id)initFromDebugData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (_DWORD *)[a3 bytes];
  v15.receiver = self;
  v15.super_class = (Class)BLScoreData;
  v5 = [(BLScoreData *)&v15 init];
  v6 = v5;
  if (!v5)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "self", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLScoreData.m", 20, 0);
    goto LABEL_9;
  }
  if (!v4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "eispInfo", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLScoreData.m", 21, 0);
    goto LABEL_9;
  }
  if (*v4 != 106)
  {
    NSLog(&cfstr_EFileVersionNo.isa);
LABEL_9:

    return 0;
  }
  uint64_t v7 = [(BLScoreData *)v5 readFwCommon:v4];
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dbgInfoFwCommonData", (const char *)&unk_222DFB9BF, "/Library/Caches/com.apple.xbs/Sources/Pearl/BioLog/BLScoreData.m", 29, 0);
    goto LABEL_9;
  }
  uint64_t v8 = v7;
  uint64_t v9 = v7 + 35924;
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(v7 + 35924)];
  frameNumber = v6->_frameNumber;
  v6->_frameNumber = (NSNumber *)v10;

  v6->_isIr = *(_DWORD *)(v9 + 8) == 1;
  unint64_t v12 = *(unsigned int *)(v9 + 1320);
  LODWORD(v9) = *(unsigned __int8 *)(v9 + 1325);
  memcpy(__dst, (const void *)(v8 + 37250), sizeof(__dst));
  v13 = ($5D796546D9AF09FC9BC354EAF68730F2 *)malloc_type_malloc(0x208uLL, 0x1000040EE8C0CC6uLL);
  v6->_featureVector = v13;
  if (v9 && v12 <= 0x80)
  {
    v13->var1 = v12;
    memcpy(v13, &__dst[2], 0x200uLL);
  }
  else
  {
    v13->var1 = 0;
  }
  return v6;
}

- (void)dealloc
{
  free(self->_featureVector);
  v3.receiver = self;
  v3.super_class = (Class)BLScoreData;
  [(BLScoreData *)&v3 dealloc];
}

- (float)scoreVersus:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    unint64_t var1 = self->_featureVector->var1;
    if (var1 != *(void *)([v4 featureVector] + 512))
    {
      uint64_t v7 = [v5 featureVector];
      if (var1 >= *(void *)(v7 + 512)) {
        unint64_t var1 = *(void *)(v7 + 512);
      }
      NSLog(&cfstr_ComparingFeatu.isa);
    }
    if (var1)
    {
      uint64_t v8 = 0;
      float v9 = 0.0;
      do
      {
        float v10 = self->_featureVector->var0[v8];
        uint64_t v11 = [v5 featureVector];
        float v9 = v9 + (float)((float)(v10 - *(float *)(v11 + 4 * v8)) * (float)(v10 - *(float *)(v11 + 4 * v8)));
        ++v8;
      }
      while (var1 != v8);
    }
    else
    {
      float v9 = 0.0;
    }
    float v12 = -sqrtf(v9);
  }
  else
  {
    float v12 = 0.0;
  }

  return v12;
}

- (_sEispLibDbgInfoFwCommon)readFwCommon:(const _sEispLibDbgInfoShared *)a3
{
  if ((unint64_t)[(BLScoreData *)self structureOffset:a3 withId:0] + 39996 > a3->var4) {
    return 0;
  }

  return (_sEispLibDbgInfoFwCommon *)[(BLScoreData *)self readStructure:a3 withId:0];
}

- (unsigned)structureOffset:(const _sEispLibDbgInfoShared *)a3 withId:(int)a4
{
  if (a3->var3 <= a4) {
    return 0;
  }
  else {
    return a3->var7[a4];
  }
}

- (char)readStructure:(const _sEispLibDbgInfoShared *)a3 withId:(int)a4
{
  if (-[BLScoreData structureOffset:withId:](self, "structureOffset:withId:")) {
    return (char *)a3 + a3->var7[a4];
  }
  else {
    return 0;
  }
}

- (NSNumber)frameNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isIr
{
  return self->_isIr;
}

- ($5D796546D9AF09FC9BC354EAF68730F2)featureVector
{
  return self->_featureVector;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned __int16)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end