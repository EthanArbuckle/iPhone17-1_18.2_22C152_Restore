@interface TSTTableTileRowInfo
- (TSTTableTileRowInfo)initWithOwner:(id)a3 tileRowIndex:(unsigned __int16)a4;
- (id)description;
- (id)p_debugDumpCompact;
- (unsigned)cellCount;
- (unsigned)tileRowIndex;
- (void)dealloc;
- (void)i_upgradeWithDataStore:(id)a3;
- (void)setTileRowIndex:(unsigned __int16)a3;
@end

@implementation TSTTableTileRowInfo

- (TSTTableTileRowInfo)initWithOwner:(id)a3 tileRowIndex:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSTTableTileRowInfo;
  result = [(TSPContainedObject *)&v7 initWithOwner:a3];
  if (result)
  {
    result->mTileRowIndex = a4;
    result->mStorageBuffer = 0;
    result->mBufferSize = 0;
    result->mCellCount = 0;
    result->mMaxTileColumnIndex = -1;
    result->mMaxTileColumnIndexValid = 1;
    *(void *)&long long v6 = -1;
    *((void *)&v6 + 1) = -1;
    *(_OWORD *)&result->mStorageOffsets[247] = v6;
    *(_OWORD *)&result->mStorageOffsets[232] = v6;
    *(_OWORD *)&result->mStorageOffsets[240] = v6;
    *(_OWORD *)&result->mStorageOffsets[216] = v6;
    *(_OWORD *)&result->mStorageOffsets[224] = v6;
    *(_OWORD *)&result->mStorageOffsets[200] = v6;
    *(_OWORD *)&result->mStorageOffsets[208] = v6;
    *(_OWORD *)&result->mStorageOffsets[184] = v6;
    *(_OWORD *)&result->mStorageOffsets[192] = v6;
    *(_OWORD *)&result->mStorageOffsets[168] = v6;
    *(_OWORD *)&result->mStorageOffsets[176] = v6;
    *(_OWORD *)&result->mStorageOffsets[152] = v6;
    *(_OWORD *)&result->mStorageOffsets[160] = v6;
    *(_OWORD *)&result->mStorageOffsets[136] = v6;
    *(_OWORD *)&result->mStorageOffsets[144] = v6;
    *(_OWORD *)&result->mStorageOffsets[120] = v6;
    *(_OWORD *)&result->mStorageOffsets[128] = v6;
    *(_OWORD *)&result->mStorageOffsets[104] = v6;
    *(_OWORD *)&result->mStorageOffsets[112] = v6;
    *(_OWORD *)&result->mStorageOffsets[88] = v6;
    *(_OWORD *)&result->mStorageOffsets[96] = v6;
    *(_OWORD *)&result->mStorageOffsets[72] = v6;
    *(_OWORD *)&result->mStorageOffsets[80] = v6;
    *(_OWORD *)&result->mStorageOffsets[56] = v6;
    *(_OWORD *)&result->mStorageOffsets[64] = v6;
    *(_OWORD *)&result->mStorageOffsets[40] = v6;
    *(_OWORD *)&result->mStorageOffsets[48] = v6;
    *(_OWORD *)&result->mStorageOffsets[24] = v6;
    *(_OWORD *)&result->mStorageOffsets[32] = v6;
    *(_OWORD *)&result->mStorageOffsets[8] = v6;
    *(_OWORD *)&result->mStorageOffsets[16] = v6;
    *(_OWORD *)result->mStorageOffsets = v6;
    result->mStorageVersion = 3;
  }
  return result;
}

- (void)dealloc
{
  mStorageBuffer = self->mStorageBuffer;
  if (mStorageBuffer) {
    CFRelease(mStorageBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTTableTileRowInfo;
  [(TSTTableTileRowInfo *)&v4 dealloc];
}

- (id)p_debugDumpCompact
{
  v3 = (void *)[MEMORY[0x263F089D8] stringWithString:@"idx: |"];
  objc_super v4 = (void *)[MEMORY[0x263F089D8] stringWithString:@"off: |"];
  for (uint64_t i = 0; i != 255; ++i)
  {
    uint64_t v6 = self->mStorageOffsets[i];
    if (v6 != 0xFFFF)
    {
      objc_msgSend(v3, "appendFormat:", @"%3hu|", i);
      objc_msgSend(v4, "appendFormat:", @"%3hu|", v6);
    }
  }
  [v3 appendFormat:@"\n%@", v4];
  return v3;
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p tileRowIndex %hu cellCount %hu>", NSStringFromClass(v4), self, self->mTileRowIndex, self->mCellCount];
}

- (unsigned)tileRowIndex
{
  return self->mTileRowIndex;
}

- (void)setTileRowIndex:(unsigned __int16)a3
{
  self->mTileRowIndex = a3;
}

- (unsigned)cellCount
{
  return self->mCellCount;
}

- (void)i_upgradeWithDataStore:(id)a3
{
  v5 = [[TSTTableTileRowInfo alloc] initWithOwner:0 tileRowIndex:[(TSTTableTileRowInfo *)self tileRowIndex]];
  if (!v5)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTTableTileRowInfo(Internal) i_upgradeWithDataStore:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableTileRowInfo.mm"), 669, @"failed to allocate memory in tile upgrade, the world will end now" file lineNumber description];
  }
  v8 = objc_alloc_init(TSTCell);
  MutableBytePtr = CFDataGetMutableBytePtr(self->mStorageBuffer);
  uint64_t v10 = 0;
  __int16 v11 = 0;
  do
  {
    if (self->mCellCount == v11) {
      break;
    }
    uint64_t v12 = self->mStorageOffsets[v10];
    if (v12 != 0xFFFF)
    {
      TSTCellInflateFromStorageRef((uint64_t)v8, &MutableBytePtr[v12], (id *)a3);
      TSTTableTileRowInfoSetCell(v5, v10, v8);
      ++v11;
    }
    ++v10;
  }
  while (v10 != 255);
  if (v11)
  {
    mStorageBuffer = v5->mStorageBuffer;
    if (!mStorageBuffer)
    {
      v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[TSTTableTileRowInfo(Internal) i_upgradeWithDataStore:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableTileRowInfo.mm"), 719, @"NULL storage buffer");
      mStorageBuffer = v5->mStorageBuffer;
    }
    CFRetain(mStorageBuffer);
    CFRelease(self->mStorageBuffer);
    self->mStorageBuffer = v5->mStorageBuffer;
    memcpy(self->mStorageOffsets, v5->mStorageOffsets, 0x200uLL);
  }
  self->mStorageVersion = 3;
}

@end