@interface ESDMetafileBlipContext
- (BOOL)loadDelayedNode:(id)a3;
- (ESDMetafileBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 uncompressed:(unsigned int)a5 stream:(SsrwOOStream *)a6 streamID:(unsigned int)a7;
- (unsigned)defaultHeaderSize;
- (void)setDefaultHeaderSize:(unsigned int)a3;
@end

@implementation ESDMetafileBlipContext

- (ESDMetafileBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 uncompressed:(unsigned int)a5 stream:(SsrwOOStream *)a6 streamID:(unsigned int)a7
{
  v9.receiver = self;
  v9.super_class = (Class)ESDMetafileBlipContext;
  result = [(ESDBlipContext *)&v9 initWithOffset:*(void *)&a3 byteCount:*(void *)&a4 stream:a6 streamID:*(void *)&a7];
  if (result) {
    *(&result->super.mByteCount + 1) = a5;
  }
  return result;
}

- (void)setDefaultHeaderSize:(unsigned int)a3
{
  self->mCb = a3;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (self->mCb + (unint64_t)*(&self->super.mByteCount + 1)) >> 32;
  if (!v5)
  {
    (*((void (**)(SsrwOOStream *, void, void, void))self->super.mStream->var0 + 3))(self->super.mStream, self->super.mStreamID, self->super.mStartOffset, 0);
    p_mByteCount = &self->super.mByteCount;
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:self->super.mByteCount];
    mStream = self->super.mStream;
    id v9 = v7;
    (*((void (**)(SsrwOOStream *, uint64_t, unsigned int *))mStream->var0 + 7))(mStream, [v9 mutableBytes], &self->super.mByteCount);
    uLongf v10 = *(&self->super.mByteCount + 1);
    v11 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:(self->mCb + v10)];
    uLongf destLen = v10;
    id v12 = v11;
    uint64_t v13 = [v12 mutableBytes];
    uint64_t mCb = self->mCb;
    id v15 = v9;
    LODWORD(v13) = uncompress((Bytef *)(v13 + mCb), &destLen, (const Bytef *)[v15 mutableBytes], *p_mByteCount);
    id v16 = v4;
    v17 = v16;
    if (v13) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = destLen == v10;
    }
    if (v18) {
      [v16 setData:v12];
    }
  }
  return v5 == 0;
}

- (unsigned)defaultHeaderSize
{
  return self->mCb;
}

@end