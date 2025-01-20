@interface SFUCryptoKey
- (NSString)passphrase;
- (const)keyData;
- (id)initAes128Key:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5;
- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5;
- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5 saltData:(id)a6;
- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4;
- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4 saltData:(id)a5;
- (id)initAes128KeyFromPassphrase:(id)a3 withIterationCountAndSaltDataFromCryptoKey:(id)a4;
- (id)saltData;
- (int)keyType;
- (unint64_t)keyLength;
- (unsigned)iterationCount;
- (void)dealloc;
@end

@implementation SFUCryptoKey

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  v6 = (const char *)[a3 UTF8String];
  size_t v7 = strlen(v6);
  id v8 = +[SFUCryptoUtils generateRandomSaltWithLength:16];
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v6 length:v7 iterationCount:v4 saltData:v8];
}

- (id)initAes128KeyFromPassphrase:(id)a3 withIterationCountAndSaltDataFromCryptoKey:(id)a4
{
  if (!a3) {
    return 0;
  }
  v6 = (const char *)[a3 UTF8String];
  size_t v7 = strlen(v6);
  uint64_t v8 = [a4 iterationCount];
  uint64_t v9 = [a4 saltData];
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v6 length:v7 iterationCount:v8 saltData:v9];
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:a3 length:*(void *)&a4 iterationCount:*(void *)&a5 saltData:0];
}

- (id)initAes128KeyFromPassphrase:(id)a3 iterationCount:(unsigned int)a4 saltData:(id)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v9 = [a3 UTF8String];
  size_t v10 = strlen((const char *)[a3 UTF8String]);
  return [(SFUCryptoKey *)self initAes128KeyFromPassphrase:v9 length:v10 iterationCount:v6 saltData:a5];
}

- (id)initAes128KeyFromPassphrase:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5 saltData:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)SFUCryptoKey;
  size_t v10 = [(SFUCryptoKey *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->mIterationCount = a5;
    v10->mKeyLength = 16;
    v10->mKey = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0xE3DC6D96uLL);
    v11->_passphrase = (NSString *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    v12 = (NSData *)[a6 copy];
    v11->mSaltData = v12;
    if ((SFUDeriveAes128Key((uint64_t)a3, a4, v11->mIterationCount, v11->mKey, v11->mKeyLength, (void *)[(NSData *)v12 bytes], [(NSData *)v11->mSaltData length]) & 1) == 0)
    {

      return 0;
    }
  }
  return v11;
}

- (id)initAes128Key:(const char *)a3 length:(unsigned int)a4 iterationCount:(unsigned int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SFUCryptoKey;
  uint64_t v8 = [(SFUCryptoKey *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->mIterationCount = a5;
    v8->mKeyLength = 16;
    size_t v10 = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x5DE6D7FuLL);
    v9->mKey = v10;
    memcpy(v10, a3, v9->mKeyLength);
    if (v9->mKeyLength != a4)
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  mKey = self->mKey;
  if (mKey)
  {
    free(mKey);
    self->mKey = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SFUCryptoKey;
  [(SFUCryptoKey *)&v4 dealloc];
}

- (int)keyType
{
  return 0;
}

- (unsigned)iterationCount
{
  return self->mIterationCount;
}

- (const)keyData
{
  return self->mKey;
}

- (unint64_t)keyLength
{
  return self->mKeyLength;
}

- (id)saltData
{
  return self->mSaltData;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

@end