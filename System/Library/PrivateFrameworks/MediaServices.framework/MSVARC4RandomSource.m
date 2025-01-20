@interface MSVARC4RandomSource
+ (BOOL)supportsSecureCoding;
+ (MSVARC4RandomSource)sharedSource;
- (MSVARC4RandomSource)init;
- (MSVARC4RandomSource)initWithCoder:(id)a3;
- (MSVARC4RandomSource)initWithSeed:(id)a3;
- (NSData)seed;
- (id)bytesWithLength:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableBytesWithLength:(int64_t)a3;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSeed:(id)a3;
@end

@implementation MSVARC4RandomSource

- (void).cxx_destruct
{
}

- (NSData)seed
{
  return self->_seed;
}

- (id)mutableBytesWithLength:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 < 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSVRandom.m", 127, @"Must have a valid length > -1: %ld", v3);
  }
  else if (!a3)
  {
    id v7 = [MEMORY[0x1E4F1CA58] data];
    goto LABEL_7;
  }
  v5 = [MEMORY[0x1E4F1CA58] dataWithLength:v3];
  state = self->_state;
  id v7 = v5;
  v8 = (unsigned char *)[v7 mutableBytes];
  var2 = state->var2;
  LODWORD(v10) = state->var0;
  unsigned int var1 = state->var1;
  do
  {
    uint64_t v10 = (v10 + 1);
    char v12 = var2[v10];
    LOBYTE(var1) = v12 + var1;
    var2[v10] = var2[var1];
    var2[var1] = v12;
    *v8++ = var2[(var2[v10] + v12)];
    --v3;
  }
  while (v3);
  state->var0 = v10;
  state->unsigned int var1 = var1;
LABEL_7:
  return v7;
}

- (id)bytesWithLength:(int64_t)a3
{
  if (a3 < 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSVRandom.m", 120, @"Must have a valid length > -1: %ld", a3);

    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    v5 = [(MSVARC4RandomSource *)self mutableBytesWithLength:a3];
    v6 = (void *)[v5 copy];

    goto LABEL_5;
  }
  v6 = [MEMORY[0x1E4F1C9B8] data];
LABEL_5:
  return v6;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  if (a3 < 2) {
    return 0;
  }
  unsigned int v19 = 0;
  if ((a3 & (a3 - 1)) != 0)
  {
    do
    {
      uint64_t v10 = 0;
      state = self->_state;
      var2 = state->var2;
      LODWORD(v13) = state->var0;
      unsigned int var1 = state->var1;
      do
      {
        uint64_t v13 = (v13 + 1);
        char v15 = var2[v13];
        unsigned __int8 v16 = v15 + var1;
        unsigned int var1 = (v15 + var1);
        var2[v13] = var2[v16];
        var2[v16] = v15;
        *((unsigned char *)&v19 + v10++) = var2[(var2[v13] + v15)];
      }
      while (v10 != 4);
      state->var0 = v13;
      state->unsigned int var1 = var1;
      unint64_t v17 = bswap32(v19);
      unint64_t v3 = v17 % a3;
    }
    while (a3 - 1 + v17 < v17 % a3);
  }
  else
  {
    uint64_t v4 = 0;
    v5 = self->_state;
    v6 = v5->var2;
    LODWORD(v7) = v5->var0;
    unsigned int v8 = v5->var1;
    do
    {
      uint64_t v7 = (v7 + 1);
      char v9 = v6[v7];
      LOBYTE(v8) = v9 + v8;
      v6[v7] = v6[v8];
      v6[v8] = v9;
      *((unsigned char *)&v19 + v4++) = v6[(v6[v7] + v9)];
    }
    while (v4 != 4);
    v5->var0 = v7;
    v5->unsigned int var1 = v8;
    return (bswap32(v19) * a3) >> 32;
  }
  return v3;
}

- (void)setSeed:(id)a3
{
  id v17 = a3;
  if ([v17 length])
  {
    id v4 = v17;
  }
  else
  {
    v5 = malloc_type_malloc(0x10uLL, 0x471D04EDuLL);
    if (SecRandomCopyBytes(0, 0x10uLL, v5))
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"failed to generate secure random bytes" userInfo:MEMORY[0x1E4F1CC08]];
      objc_exception_throw(v16);
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v5 length:16 freeWhenDone:1];

    id v4 = (id)v6;
  }
  id v18 = v4;
  objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithData:");
  uint64_t v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  seed = self->_seed;
  self->_seed = v7;

  state = self->_state;
  uint64_t v10 = [(NSData *)self->_seed bytes];
  NSUInteger v11 = [(NSData *)self->_seed length];
  unint64_t v12 = 0;
  int v13 = 0;
  var2 = state->var2;
  do
  {
    int v15 = var2[v12];
    v13 += v15 + v10[v12 % v11];
    var2[v12] = var2[v13];
    var2[v13] = v15;
    ++v12;
  }
  while (v12 != 255);
}

- (void)dealloc
{
  state = self->_state;
  if (state->var2)
  {
    free(state->var2);
    state = self->_state;
  }
  free(state);
  v4.receiver = self;
  v4.super_class = (Class)MSVARC4RandomSource;
  [(MSVARC4RandomSource *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t var0 = self->_state->var0;
  id v5 = a3;
  [v5 encodeInt:var0 forKey:@"i"];
  [v5 encodeInt:self->_state->var1 forKey:@"j"];
  [v5 encodeBytes:self->_state->var2 length:256 forKey:@"bytes"];
}

- (MSVARC4RandomSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSVARC4RandomSource;
  id v5 = [(MSVARC4RandomSource *)&v14 init];
  if (v5)
  {
    uint64_t v6 = (MSVArc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      uint64_t v7 = v6;
      *(void *)&v6->uint64_t var0 = 0;
      unsigned int v8 = (char *)malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    v5->_state->uint64_t var0 = [v4 decodeIntForKey:@"i"];
    v5->_state->unsigned int var1 = [v4 decodeIntForKey:@"j"];
    unint64_t v13 = 0;
    uint64_t v10 = (const void *)[v4 decodeBytesForKey:@"bytes" returnedLength:&v13];
    if (v13 >= 0x100) {
      size_t v11 = 256;
    }
    else {
      size_t v11 = v13;
    }
    memcpy(v5->_state->var2, v10, v11);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithSeed:self->_seed];
  state = self->_state;
  uint64_t v6 = (void *)*((void *)result + 1);
  void *v6 = *(void *)&state->var0;
  uint64_t v7 = (_OWORD *)v6[1];
  var2 = state->var2;
  long long v9 = *((_OWORD *)var2 + 15);
  long long v10 = *((_OWORD *)var2 + 12);
  long long v11 = *((_OWORD *)var2 + 13);
  v7[14] = *((_OWORD *)var2 + 14);
  v7[15] = v9;
  v7[12] = v10;
  v7[13] = v11;
  long long v13 = *((_OWORD *)var2 + 8);
  long long v12 = *((_OWORD *)var2 + 9);
  long long v14 = *((_OWORD *)var2 + 11);
  v7[10] = *((_OWORD *)var2 + 10);
  v7[11] = v14;
  v7[8] = v13;
  v7[9] = v12;
  long long v16 = *((_OWORD *)var2 + 4);
  long long v15 = *((_OWORD *)var2 + 5);
  long long v17 = *((_OWORD *)var2 + 7);
  v7[6] = *((_OWORD *)var2 + 6);
  v7[7] = v17;
  v7[4] = v16;
  v7[5] = v15;
  long long v19 = *(_OWORD *)var2;
  long long v18 = *((_OWORD *)var2 + 1);
  long long v20 = *((_OWORD *)var2 + 3);
  v7[2] = *((_OWORD *)var2 + 2);
  v7[3] = v20;
  *uint64_t v7 = v19;
  v7[1] = v18;
  return result;
}

- (MSVARC4RandomSource)initWithSeed:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVARC4RandomSource;
  id v5 = [(MSVARC4RandomSource *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (MSVArc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      uint64_t v7 = v6;
      *(void *)&v6->uint64_t var0 = 0;
      unsigned int v8 = (char *)malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    [(MSVARC4RandomSource *)v5 setSeed:v4];
  }

  return v5;
}

- (MSVARC4RandomSource)init
{
  unint64_t v3 = [MEMORY[0x1E4F1C9B8] data];
  id v4 = [(MSVARC4RandomSource *)self initWithSeed:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MSVARC4RandomSource)sharedSource
{
  if (sharedSource_onceToken != -1) {
    dispatch_once(&sharedSource_onceToken, &__block_literal_global_2026);
  }
  v2 = (void *)sharedSource___source;
  return (MSVARC4RandomSource *)v2;
}

uint64_t __35__MSVARC4RandomSource_sharedSource__block_invoke()
{
  sharedSource___source = objc_alloc_init(MSVARC4RandomSource);
  return MEMORY[0x1F41817F8]();
}

@end