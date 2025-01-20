@interface ESDDibFileBlipContext
- (BOOL)loadDelayedNode:(id)a3;
@end

@implementation ESDDibFileBlipContext

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ESDDibFileBlipContext;
  [(ESDBlipContext *)&v21 loadDelayedNode:v4];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:0];
  id v6 = [v4 data];
  v7 = (unsigned int *)[v6 bytes];
  uint64_t mByteCount = self->super.mByteCount;
  unsigned int v20 = mByteCount + 14;
  if ((unint64_t)[v6 length] >= 4
    && ((int v9 = CsLeReadSInt32(v7), v10 = v9, v9 != 12) ? (v11 = 14) : (v11 = 10),
        v9 == 12 ? (int v12 = 3) : (int v12 = 4),
        [v6 length] >= (unint64_t)(v11 + 2)))
  {
    unsigned int UInt16 = CsLeReadUInt16((unsigned __int16 *)((char *)v7 + v11));
    int v15 = 1 << UInt16;
    if (UInt16 >= 9) {
      int v15 = 0;
    }
    int v19 = v10 + v15 * v12 + 14;
    [v5 appendBytes:"BM" length:2];
    int v18 = CsLeReadSInt32(&v20);
    [v5 appendBytes:&v18 length:4];
    [v5 appendBytes:&unk_238EDC414 length:4];
    int SInt32 = CsLeReadSInt32((unsigned int *)&v19);
    [v5 appendBytes:&SInt32 length:4];
    [v5 appendBytes:v7 length:mByteCount];
    [v4 setData:v5];
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end