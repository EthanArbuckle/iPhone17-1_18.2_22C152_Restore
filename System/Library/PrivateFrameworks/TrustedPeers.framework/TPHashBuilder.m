@interface TPHashBuilder
+ (id)hashWithAlgo:(int64_t)a3 ofBytes:(const void *)a4 len:(unint64_t)a5;
+ (id)hashWithAlgo:(int64_t)a3 ofData:(id)a4;
+ (id)keyedHashWithAlgo:(int64_t)a3 key:(id)a4 data:(id)a5;
+ (int64_t)algoOfHash:(id)a3;
- ($1DC23E134A5F43A06C89BE309303CDCF)ctxHMAC;
- (BOOL)keyed;
- (CC_SHA256state_st)ctxSHA256;
- (CC_SHA512state_st)ctxSHA512;
- (TPHashBuilder)init;
- (TPHashBuilder)initWithAlgo:(int64_t)a3;
- (TPHashBuilder)initWithKeyedAlgo:(int64_t)a3 key:(id)a4;
- (id)finalHash;
- (id)finalKeyedHash;
- (int64_t)algo;
- (void)resetWithAlgo:(int64_t)a3;
- (void)setAlgo:(int64_t)a3;
- (void)setCtxHMAC:(id *)a3;
- (void)setCtxSHA256:(CC_SHA256state_st *)a3;
- (void)setCtxSHA512:(CC_SHA512state_st *)a3;
- (void)setKeyed:(BOOL)a3;
- (void)throwInvalidAlgo;
- (void)updateWithBytes:(const void *)a3 len:(unint64_t)a4;
- (void)updateWithData:(id)a3;
@end

@implementation TPHashBuilder

- (void)setCtxHMAC:(id *)a3
{
}

- ($1DC23E134A5F43A06C89BE309303CDCF)ctxHMAC
{
  return ($1DC23E134A5F43A06C89BE309303CDCF *)memcpy(retstr, &self->_ctxHMAC, sizeof($1DC23E134A5F43A06C89BE309303CDCF));
}

- (void)setCtxSHA512:(CC_SHA512state_st *)a3
{
  *(_OWORD *)self->_ctxSHA512.count = *(_OWORD *)a3->count;
  long long v3 = *(_OWORD *)a3->hash;
  long long v4 = *(_OWORD *)&a3->hash[2];
  long long v5 = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA512.hash[4] = *(_OWORD *)&a3->hash[4];
  *(_OWORD *)&self->_ctxSHA512.hash[6] = v5;
  *(_OWORD *)self->_ctxSHA512.hash = v3;
  *(_OWORD *)&self->_ctxSHA512.hash[2] = v4;
  long long v6 = *(_OWORD *)a3->wbuf;
  long long v7 = *(_OWORD *)&a3->wbuf[2];
  long long v8 = *(_OWORD *)&a3->wbuf[6];
  *(_OWORD *)&self->_ctxSHA512.wbuf[4] = *(_OWORD *)&a3->wbuf[4];
  *(_OWORD *)&self->_ctxSHA512.wbuf[6] = v8;
  *(_OWORD *)self->_ctxSHA512.wbuf = v6;
  *(_OWORD *)&self->_ctxSHA512.wbuf[2] = v7;
  long long v9 = *(_OWORD *)&a3->wbuf[8];
  long long v10 = *(_OWORD *)&a3->wbuf[10];
  long long v11 = *(_OWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA512.wbuf[12] = *(_OWORD *)&a3->wbuf[12];
  *(_OWORD *)&self->_ctxSHA512.wbuf[14] = v11;
  *(_OWORD *)&self->_ctxSHA512.wbuf[8] = v9;
  *(_OWORD *)&self->_ctxSHA512.wbuf[10] = v10;
}

- (CC_SHA512state_st)ctxSHA512
{
  long long v3 = *(_OWORD *)&self[1].wbuf[2];
  *(_OWORD *)&retstr->wbuf[10] = *(_OWORD *)self[1].wbuf;
  *(_OWORD *)&retstr->wbuf[12] = v3;
  *(_OWORD *)&retstr->wbuf[14] = *(_OWORD *)&self[1].wbuf[4];
  long long v4 = *(_OWORD *)&self[1].hash[2];
  *(_OWORD *)&retstr->wbuf[2] = *(_OWORD *)self[1].hash;
  *(_OWORD *)&retstr->wbuf[4] = v4;
  long long v5 = *(_OWORD *)&self[1].hash[6];
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self[1].hash[4];
  *(_OWORD *)&retstr->wbuf[8] = v5;
  long long v6 = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->hash[2] = *(_OWORD *)&self->wbuf[10];
  *(_OWORD *)&retstr->hash[4] = v6;
  long long v7 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[14];
  *(_OWORD *)retstr->wbuf = v7;
  long long v8 = *(_OWORD *)&self->wbuf[8];
  *(_OWORD *)retstr->count = *(_OWORD *)&self->wbuf[6];
  *(_OWORD *)retstr->hash = v8;
  return self;
}

- (void)setCtxSHA256:(CC_SHA256state_st *)a3
{
  long long v3 = *(_OWORD *)a3->count;
  long long v4 = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_ctxSHA256.hash[6] = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA256.hash[2] = v4;
  *(_OWORD *)self->_ctxSHA256.count = v3;
  long long v5 = *(_OWORD *)&a3->wbuf[2];
  long long v6 = *(_OWORD *)&a3->wbuf[6];
  long long v7 = *(_OWORD *)&a3->wbuf[10];
  *(void *)&self->_ctxSHA256.wbuf[14] = *(void *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA256.wbuf[10] = v7;
  *(_OWORD *)&self->_ctxSHA256.wbuf[6] = v6;
  *(_OWORD *)&self->_ctxSHA256.wbuf[2] = v5;
}

- (CC_SHA256state_st)ctxSHA256
{
  long long v3 = *(_OWORD *)&self->wbuf[8];
  long long v4 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->wbuf[10] = v4;
  *(void *)&retstr->wbuf[14] = *(void *)&self[1].hash[2];
  long long v5 = *(_OWORD *)self->wbuf;
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[4];
  *(_OWORD *)&retstr->hash[2] = v5;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[4];
  *(_OWORD *)&retstr->wbuf[2] = v3;
  return self;
}

- (void)setKeyed:(BOOL)a3
{
  self->_keyed = a3;
}

- (BOOL)keyed
{
  return self->_keyed;
}

- (void)setAlgo:(int64_t)a3
{
  self->_algo = a3;
}

- (int64_t)algo
{
  return self->_algo;
}

- (void)throwInvalidAlgo
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidTPHashAlgo" reason:@"Invalid TPHash algorithm" userInfo:0];
  objc_exception_throw(v2);
}

- (id)finalKeyedHash
{
  id v3 = objc_alloc(MEMORY[0x263EFF990]);
  if ([(TPHashBuilder *)self algo] == 4)
  {
    id v3 = (id) [v3 initWithLength:32];
    CCHmacFinal((CCHmacContext *)&self->_ctxHMAC, (void *)[v3 mutableBytes]);
  }
  else
  {
    [(TPHashBuilder *)self throwInvalidAlgo];
  }
  [(TPHashBuilder *)self setAlgo:-1];
  return v3;
}

- (id)finalHash
{
  id v3 = objc_alloc(MEMORY[0x263EFF990]);
  switch([(TPHashBuilder *)self algo])
  {
    case 0:
      id v3 = (id) [v3 initWithLength:28];
      CC_SHA224_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA256);
      long long v4 = @"SHA224";
      break;
    case 1:
      id v3 = (id) [v3 initWithLength:32];
      CC_SHA256_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA256);
      long long v4 = @"SHA256";
      break;
    case 2:
      id v3 = (id) [v3 initWithLength:48];
      CC_SHA384_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA512);
      long long v4 = @"SHA384";
      break;
    case 3:
      id v3 = (id) [v3 initWithLength:64];
      CC_SHA512_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA512);
      long long v4 = @"SHA512";
      break;
    default:
      [(TPHashBuilder *)self throwInvalidAlgo];
      long long v4 = 0;
      break;
  }
  long long v5 = NSString;
  long long v6 = [v3 base64EncodedStringWithOptions:0];
  long long v7 = [v5 stringWithFormat:@"%@:%@", v4, v6];

  [(TPHashBuilder *)self setAlgo:-1];
  return v7;
}

- (void)updateWithBytes:(const void *)a3 len:(unint64_t)a4
{
  CC_LONG v4 = a4;
  switch([(TPHashBuilder *)self algo])
  {
    case 0:
      CC_SHA224_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 1:
      CC_SHA256_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 2:
      CC_SHA384_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 3:
      CC_SHA512_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 4:
      CCHmacUpdate((CCHmacContext *)&self->_ctxHMAC, a3, v4);
      break;
    default:
      [(TPHashBuilder *)self throwInvalidAlgo];
      break;
  }
}

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  [(TPHashBuilder *)self updateWithBytes:v5 len:v6];
}

- (void)resetWithAlgo:(int64_t)a3
{
  self->_algo = a3;
  switch(a3)
  {
    case 0:
      CC_SHA224_Init(&self->_ctxSHA256);
      goto LABEL_9;
    case 1:
      CC_SHA256_Init(&self->_ctxSHA256);
      goto LABEL_9;
    case 2:
      CC_SHA384_Init(&self->_ctxSHA512);
      goto LABEL_9;
    case 3:
      CC_SHA512_Init(&self->_ctxSHA512);
LABEL_9:
      self->_keyed = 0;
      break;
    default:
      [(TPHashBuilder *)self throwInvalidAlgo];
      break;
  }
}

- (TPHashBuilder)initWithKeyedAlgo:(int64_t)a3 key:(id)a4
{
  id v6 = a4;
  long long v7 = [(TPHashBuilder *)self init];
  long long v8 = v7;
  v7->_algo = a3;
  if (a3 == 4)
  {
    id v9 = v6;
    CCHmacInit((CCHmacContext *)&v8->_ctxHMAC, 2u, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    v8->_keyed = 1;
  }
  else
  {
    [(TPHashBuilder *)v7 throwInvalidAlgo];
  }

  return v8;
}

- (TPHashBuilder)initWithAlgo:(int64_t)a3
{
  id v4 = [(TPHashBuilder *)self init];
  [(TPHashBuilder *)v4 resetWithAlgo:a3];
  return v4;
}

- (TPHashBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)TPHashBuilder;
  result = [(TPHashBuilder *)&v3 init];
  if (result)
  {
    result->_algo = -1;
    result->_keyed = 0;
  }
  return result;
}

+ (id)keyedHashWithAlgo:(int64_t)a3 key:(id)a4 data:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[TPHashBuilder alloc] initWithKeyedAlgo:a3 key:v8];

  [(TPHashBuilder *)v9 updateWithData:v7];
  long long v10 = [(TPHashBuilder *)v9 finalKeyedHash];

  return v10;
}

+ (id)hashWithAlgo:(int64_t)a3 ofBytes:(const void *)a4 len:(unint64_t)a5
{
  id v7 = [[TPHashBuilder alloc] initWithAlgo:a3];
  [(TPHashBuilder *)v7 updateWithBytes:a4 len:a5];
  id v8 = [(TPHashBuilder *)v7 finalHash];

  return v8;
}

+ (id)hashWithAlgo:(int64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];

  return +[TPHashBuilder hashWithAlgo:a3 ofBytes:v6 len:v7];
}

+ (int64_t)algoOfHash:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"SHA224:"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 hasPrefix:@"SHA256:"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 hasPrefix:@"SHA384:"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 hasPrefix:@"SHA512:"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

@end