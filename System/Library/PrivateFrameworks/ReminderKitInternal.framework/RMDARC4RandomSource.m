@interface RMDARC4RandomSource
- (BOOL)nextBool;
- (NSData)seed;
- (RMDARC4RandomSource)init;
- (RMDARC4RandomSource)initWithCoder:(id)a3;
- (RMDARC4RandomSource)initWithSeed:(id)a3;
- (float)nextUniform;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (unint64_t)nextBits:(int)a3;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
- (void)dealloc;
- (void)dropValuesWithCount:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSeed:(id)a3;
@end

@implementation RMDARC4RandomSource

- (RMDARC4RandomSource)init
{
  v3 = malloc_type_malloc(0x10uLL, 0x70E53ECDuLL);
  if (SecRandomCopyBytes(0, 0x10uLL, v3))
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"failed to generate secure random bytes" userInfo:MEMORY[0x1E4F1CC08]];
    objc_exception_throw(v7);
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v3 length:16 freeWhenDone:1];
  v5 = [(RMDARC4RandomSource *)self initWithSeed:v4];

  return v5;
}

- (RMDARC4RandomSource)initWithSeed:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMDARC4RandomSource;
  v5 = [(RMDRandomSource *)&v11 init];
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      id v7 = v6;
      *(void *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0xF5193E1EuLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    [(RMDARC4RandomSource *)v5 setSeed:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithSeed:self->_seed];
  state = self->_state;
  v6 = (void *)*((void *)result + 1);
  void *v6 = *(void *)&state->var0;
  id v7 = (_OWORD *)v6[1];
  var2 = state->var2;
  long long v10 = *((_OWORD *)var2 + 8);
  long long v9 = *((_OWORD *)var2 + 9);
  long long v11 = *((_OWORD *)var2 + 11);
  v7[10] = *((_OWORD *)var2 + 10);
  v7[11] = v11;
  v7[8] = v10;
  v7[9] = v9;
  long long v13 = *((_OWORD *)var2 + 4);
  long long v12 = *((_OWORD *)var2 + 5);
  long long v14 = *((_OWORD *)var2 + 7);
  v7[6] = *((_OWORD *)var2 + 6);
  v7[7] = v14;
  v7[4] = v13;
  v7[5] = v12;
  long long v16 = *(_OWORD *)var2;
  long long v15 = *((_OWORD *)var2 + 1);
  long long v17 = *((_OWORD *)var2 + 3);
  v7[2] = *((_OWORD *)var2 + 2);
  v7[3] = v17;
  *id v7 = v16;
  v7[1] = v15;
  long long v18 = *((_OWORD *)var2 + 15);
  long long v20 = *((_OWORD *)var2 + 12);
  long long v19 = *((_OWORD *)var2 + 13);
  v7[14] = *((_OWORD *)var2 + 14);
  v7[15] = v18;
  v7[12] = v20;
  v7[13] = v19;
  return result;
}

- (RMDARC4RandomSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMDARC4RandomSource *)self init];
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      id v7 = v6;
      *(void *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0xF5193E1EuLL);
      uint64_t v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    v5->_state->var0 = [v4 decodeIntForKey:@"i"];
    v5->_state->var1 = [v4 decodeIntForKey:@"j"];
    unint64_t v13 = 0;
    long long v10 = (const void *)[v4 decodeBytesForKey:@"bytes" returnedLength:&v13];
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

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMDARC4RandomSource;
  id v4 = a3;
  [(RMDRandomSource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", self->_state->var0, @"i", v5.receiver, v5.super_class);
  [v4 encodeInt:self->_state->var1 forKey:@"j"];
  [v4 encodeBytes:self->_state->var2 length:256 forKey:@"bytes"];
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
  v4.super_class = (Class)RMDARC4RandomSource;
  [(RMDARC4RandomSource *)&v4 dealloc];
}

- (NSData)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
  id v13 = a3;
  objc_super v4 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v13];
  seed = self->_seed;
  self->_seed = v4;

  state = self->_state;
  id v7 = [(NSData *)self->_seed bytes];
  NSUInteger v8 = [(NSData *)self->_seed length];
  unint64_t v9 = 0;
  int v10 = 0;
  var2 = state->var2;
  do
  {
    int v12 = var2[v9];
    v10 += v12 + v7[v9 % v8];
    var2[v9] = var2[v10];
    var2[v10] = v12;
    ++v9;
  }
  while (v9 != 255);
}

- (unint64_t)nextBits:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  if (a3 >= 64) {
    int v4 = 64;
  }
  else {
    int v4 = a3;
  }
  uint64_t v5 = (v4 + 7) >> 3;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v8) = state->var0;
  unsigned int var1 = state->var1;
  do
  {
    uint64_t v8 = (v8 + 1);
    char v10 = var2[v8];
    LOBYTE(var1) = v10 + var1;
    var2[v8] = var2[var1];
    var2[var1] = v10;
    v14[v3++] = var2[(var2[v8] + v10)];
  }
  while (v5 != v3);
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  state->var0 = v8;
  state->unsigned int var1 = var1;
  do
    unint64_t v12 = v14[v11++] | (v12 << 8);
  while (v5 != v11);
  return v12 >> (((v4 + 7) & 0xF8u) - v4);
}

- (int64_t)nextInt
{
  uint64_t v2 = 0;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v5) = state->var0;
  unsigned int var1 = state->var1;
  do
  {
    uint64_t v5 = (v5 + 1);
    char v7 = var2[v5];
    LOBYTE(var1) = v7 + var1;
    var2[v5] = var2[var1];
    var2[var1] = v7;
    v9[v2++] = var2[(var2[v5] + v7)];
  }
  while (v2 != 4);
  state->var0 = v5;
  state->unsigned int var1 = var1;
  return (v9[0] << 24) | ((unint64_t)v9[1] << 16) | ((unint64_t)v9[2] << 8) | v9[3];
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  if (a3 < 2) {
    return 0;
  }
  unsigned int v18 = 0;
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
        LOBYTE(var1) = v15 + var1;
        var2[v13] = var2[var1];
        var2[var1] = v15;
        *((unsigned char *)&v18 + v10++) = var2[(var2[v13] + v15)];
      }
      while (v10 != 4);
      state->var0 = v13;
      state->unsigned int var1 = var1;
      unint64_t v16 = bswap32(v18);
      unint64_t v3 = v16 % a3;
    }
    while (a3 - 1 + v16 < v16 % a3);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = self->_state;
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
      *((unsigned char *)&v18 + v4++) = v6[(v6[v7] + v9)];
    }
    while (v4 != 4);
    v5->var0 = v7;
    v5->unsigned int var1 = v8;
    return (bswap32(v18) * a3) >> 32;
  }
  return v3;
}

- (float)nextUniform
{
  uint64_t v2 = 0;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v5) = state->var0;
  unsigned int var1 = state->var1;
  do
  {
    uint64_t v5 = (v5 + 1);
    char v7 = var2[v5];
    LOBYTE(var1) = v7 + var1;
    var2[v5] = var2[var1];
    var2[var1] = v7;
    v9[v2++] = var2[(var2[v5] + v7)];
  }
  while (v2 != 3);
  state->var0 = v5;
  state->unsigned int var1 = var1;
  return (float)((v9[0] << 16) | (v9[1] << 8) | v9[2]) / 16777000.0;
}

- (BOOL)nextBool
{
  state = self->_state;
  var2 = state->var2;
  uint64_t v4 = (state->var0 + 1);
  char v5 = var2[v4];
  unsigned __int8 v6 = v5 + LOBYTE(state->var1);
  var2[v4] = var2[v6];
  var2[v6] = v5;
  LOBYTE(var2) = var2[(var2[v4] + v5)];
  state->var0 = v4;
  state->unsigned int var1 = v6;
  return var2 & 1;
}

- (void)dropValuesWithCount:(unint64_t)a3
{
  state = self->_state;
  LODWORD(v5) = state->var0;
  unsigned int var1 = state->var1;
  if (a3)
  {
    var2 = state->var2;
    do
    {
      uint64_t v5 = (v5 + 1);
      char v7 = var2[v5];
      LOBYTE(var1) = v7 + var1;
      var2[v5] = var2[var1];
      var2[var1] = v7;
      --a3;
    }
    while (a3);
    unsigned int var1 = var1;
  }
  state->var0 = v5;
  state->unsigned int var1 = var1;
}

- (void).cxx_destruct
{
}

@end