@interface ESDBlipContext
- (BOOL)loadDelayedNode:(id)a3;
- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4;
- (ESDBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 stream:(SsrwOOStream *)a5 streamID:(unsigned int)a6;
- (NSString)description;
- (SsrwOOStream)stream;
- (id)dataRep;
@end

@implementation ESDBlipContext

- (ESDBlipContext)initWithOffset:(unsigned int)a3 byteCount:(unsigned int)a4 stream:(SsrwOOStream *)a5 streamID:(unsigned int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ESDBlipContext;
  result = [(ESDBlipContext *)&v11 init];
  if (result)
  {
    result->mStartOffset = a3;
    result->mByteCount = a4;
    result->mStream = a5;
    result->mStreamID = a6;
  }
  return result;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  mStream = self->mStream;
  if (mStream)
  {
    (*((void (**)(SsrwOOStream *, void, void, void))mStream->var0 + 3))(mStream, self->mStreamID, self->mStartOffset, 0);
    p_mByteCount = &self->mByteCount;
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:self->mByteCount];
    [v7 setLength:self->mByteCount];
    v8 = self->mStream;
    id v9 = v7;
    (*((void (**)(SsrwOOStream *, uint64_t, unsigned int *))v8->var0 + 7))(v8, [v9 mutableBytes], p_mByteCount);
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v4 setData:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setSoundData:v9];
      }
    }

    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4
{
  return 0;
}

- (SsrwOOStream)stream
{
  return self->mStream;
}

- (id)dataRep
{
  return 0;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)ESDBlipContext;
  v2 = [(ESDBlipContext *)&v4 description];
  return (NSString *)v2;
}

@end