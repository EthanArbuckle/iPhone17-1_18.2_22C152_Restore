@interface MSUiBootHeaderV2
- (BOOL)isValid;
- (BOOL)loadHeaderAtOffset:(unsigned int)a3;
- (BOOL)validHash;
- (BOOL)validHeaderSignature;
- (MSUiBootHeaderV2)initWithIOServiceWriter:(id)a3;
- (char)headerHash;
- (char)headerReserved;
- (id)_hashData:(id)a3 withMethod:(id)a4;
- (id)_hashDataWithNativeHashMethod:(id)a3;
- (id)computeHash;
- (id)description;
- (id)packStructure;
- (unsigned)headerSignature;
- (unsigned)headerVersion;
- (unsigned)length;
- (unsigned)secondaryPayloadOffset;
- (void)dealloc;
- (void)invalidate;
- (void)makeValid;
- (void)setAsFirstGeneration;
- (void)setHeaderHash:(char *)a3;
- (void)setHeaderReserved:(char *)a3;
- (void)setHeaderSignature:(unsigned int)a3;
- (void)setHeaderVersion:(unsigned int)a3;
- (void)setSecondaryPayloadOffset:(unsigned int)a3;
@end

@implementation MSUiBootHeaderV2

- (MSUiBootHeaderV2)initWithIOServiceWriter:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MSUiBootHeaderV2;
  v3 = [(MSUiBootHeader *)&v5 initWithIOServiceWriter:a3];
  if (v3)
  {
    v3->_headerHash = (char *)calloc(0x20uLL, 1uLL);
    v3->_headerReserved = (char *)calloc(0x10uLL, 1uLL);
    v3->_headerSignature = 1;
  }
  return v3;
}

- (void)setHeaderHash:(char *)a3
{
  headerHash = self->_headerHash;
  long long v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)headerHash = *(_OWORD *)a3;
  *((_OWORD *)headerHash + 1) = v4;
}

- (void)setHeaderReserved:(char *)a3
{
  *(_OWORD *)self->_headerReserved = *(_OWORD *)a3;
}

- (id)packStructure
{
  v6[0] = 1095128392;
  v6[1] = [(MSUiBootHeaderV2 *)self headerVersion];
  v6[2] = [(MSUiBootHeader *)self headerGeneration];
  v6[3] = [(MSUiBootHeader *)self imageAddress];
  headerHash = self->_headerHash;
  long long v4 = *((_OWORD *)headerHash + 1);
  long long v8 = *(_OWORD *)headerHash;
  long long v9 = v4;
  long long v7 = *(_OWORD *)self->_headerReserved;
  return +[NSData dataWithBytes:v6 length:64];
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  memset(v10, 0, sizeof(v10));
  long long v8 = 0u;
  long long v9 = 0u;
  id v5 = [(IOServiceWriter *)[(MSUiBootHeader *)self serviceWriter] readDataAtOffset:*(void *)&a3 ofLength:64];
  id v6 = [v5 length];
  if (v6)
  {
    [v5 getBytes:&v8 length:64];
    [(MSUiBootHeaderV2 *)self setHeaderVersion:DWORD1(v8)];
    [(MSUiBootHeader *)self setHeaderGeneration:DWORD2(v8)];
    [(MSUiBootHeader *)self setImageAddress:HIDWORD(v8)];
    [(MSUiBootHeaderV2 *)self setHeaderSignature:v8];
    [(MSUiBootHeaderV2 *)self setHeaderHash:v10];
    [(MSUiBootHeaderV2 *)self setHeaderReserved:&v9];
    [(MSUiBootHeader *)self setStartLocation:v3];
  }
  return v6 != 0;
}

- (unsigned)secondaryPayloadOffset
{
  return *(_DWORD *)self->_headerReserved;
}

- (void)setSecondaryPayloadOffset:(unsigned int)a3
{
  *(_DWORD *)self->_headerReserved = a3;
}

- (void)setAsFirstGeneration
{
  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  [(MSUiBootHeaderV1 *)&v3 setAsFirstGeneration];
  [(MSUiBootHeader *)self setHeaderGeneration:1];
}

- (unsigned)length
{
  return 64;
}

- (void)invalidate
{
  [(MSUiBootHeaderV2 *)self setHeaderSignature:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  [(MSUiBootHeaderV1 *)&v3 invalidate];
}

- (BOOL)isValid
{
  unsigned __int8 v3 = [(MSUiBootHeaderV2 *)self validHeaderSignature];
  return [(MSUiBootHeaderV2 *)self validHash] & v3;
}

- (BOOL)validHeaderSignature
{
  return [(MSUiBootHeaderV2 *)self headerSignature] == 1095128392;
}

- (void)makeValid
{
  [(MSUiBootHeaderV2 *)self setHeaderSignature:1095128392];
  [(MSUiBootHeaderV2 *)self setHeaderVersion:1];
  id v3 = [[-[MSUiBootHeaderV2 computeHash](self, "computeHash") bytes];

  [(MSUiBootHeaderV2 *)self setHeaderHash:v3];
}

- (BOOL)validHash
{
  id v3 = [[-[MSUiBootHeaderV2 computeHash](self, "computeHash") bytes];
  return *v3 == *(void *)[(MSUiBootHeaderV2 *)self headerHash];
}

- (id)computeHash
{
  id v3 = [[-[MSUiBootHeaderV2 packStructure](self, "packStructure") subdataWithRange:0, 32];

  return [(MSUiBootHeaderV2 *)self _hashDataWithNativeHashMethod:v3];
}

- (id)_hashDataWithNativeHashMethod:(id)a3
{
  uint64_t v5 = MGCopyAnswer();

  return [(MSUiBootHeaderV2 *)self _hashData:a3 withMethod:v5];
}

- (id)_hashData:(id)a3 withMethod:(id)a4
{
  CC_LONG v6 = [a3 length];
  if ([a4 isEqualToString:kAMAuthInstallApParameterImg4DigestSHA1])
  {
    uint64_t v7 = 20;
    long long v8 = (unsigned __int8 *)calloc(0x14uLL, 1uLL);
    CC_SHA1([a3 bytes], v6, v8);
  }
  else if ([a4 isEqualToString:kAMAuthInstallApParameterImg4DigestSHA384])
  {
    uint64_t v7 = 48;
    long long v8 = (unsigned __int8 *)calloc(0x30uLL, 1uLL);
    CC_SHA384([a3 bytes], v6, v8);
  }
  else
  {
    iBU_LOG_real(@"Unknown hash digest type: %@", "-[MSUiBootHeaderV2 _hashData:withMethod:]", v9, v10, v11, v12, v13, v14, (uint64_t)a4);
    long long v8 = 0;
    uint64_t v7 = 0;
  }
  v15 = +[NSData dataWithBytes:v8 length:v7];
  free(v8);
  return v15;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Generation: 0x%08x. Version: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x. SecondaryOffset: 0x%08x", [(MSUiBootHeader *)self headerGeneration], [(MSUiBootHeaderV2 *)self headerVersion], [(MSUiBootHeader *)self startLocation], [(MSUiBootHeader *)self imageAddress], [(MSUiBootHeaderV2 *)self secondaryPayloadOffset]];
}

- (void)dealloc
{
  free(self->_headerHash);
  free(self->_headerReserved);
  v3.receiver = self;
  v3.super_class = (Class)MSUiBootHeaderV2;
  [(MSUiBootHeader *)&v3 dealloc];
}

- (unsigned)headerSignature
{
  return *(&self->super._valid + 1);
}

- (void)setHeaderSignature:(unsigned int)a3
{
  *(&self->super._valid + 1) = a3;
}

- (char)headerHash
{
  return self->_headerHash;
}

- (unsigned)headerVersion
{
  return self->_headerSignature;
}

- (void)setHeaderVersion:(unsigned int)a3
{
  self->_headerSignature = a3;
}

- (char)headerReserved
{
  return self->_headerReserved;
}

@end