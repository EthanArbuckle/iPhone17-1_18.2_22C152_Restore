@interface PFZlibDataCompressionOptions
+ (id)defaultOptions;
- (int)chunkSize;
- (int)compressionLevel;
- (int)memoryLevel;
- (int)strategy;
- (int)windowBits;
- (void)setChunkSize:(int)a3;
- (void)setCompressionLevel:(int)a3;
- (void)setCompressionStrategy:(int)a3;
- (void)setMemoryLevel:(int)a3;
- (void)setStrategy:(int)a3;
- (void)setWindowBits:(int)a3;
@end

@implementation PFZlibDataCompressionOptions

- (void)setChunkSize:(int)a3
{
  self->_chunkSize = a3;
}

- (int)chunkSize
{
  return self->_chunkSize;
}

- (void)setMemoryLevel:(int)a3
{
  self->_memoryLevel = a3;
}

- (int)memoryLevel
{
  return self->_memoryLevel;
}

- (void)setWindowBits:(int)a3
{
  self->_windowBits = a3;
}

- (int)windowBits
{
  return self->_windowBits;
}

- (void)setStrategy:(int)a3
{
  self->_strategy = a3;
}

- (int)strategy
{
  return self->_strategy;
}

- (int)compressionLevel
{
  return self->_compressionLevel;
}

- (void)setCompressionStrategy:(int)a3
{
  self->_strategy = a3;
}

- (void)setCompressionLevel:(int)a3
{
  self->_compressionLevel = a3;
}

+ (id)defaultOptions
{
  uint64_t v2 = objc_opt_new();
  *(_OWORD *)(v2 + 8) = xmmword_1A42D3680;
  *(_DWORD *)(v2 + 24) = 0x4000;

  return (id)v2;
}

@end