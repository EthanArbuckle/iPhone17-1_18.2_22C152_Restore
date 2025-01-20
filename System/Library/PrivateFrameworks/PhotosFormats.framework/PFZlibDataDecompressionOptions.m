@interface PFZlibDataDecompressionOptions
+ (id)defaultOptions;
- (BOOL)decompressAllAtOnce;
- (id)createBuffer;
- (id)growData;
- (int)windowBits;
- (void)setCreateBuffer:(id)a3;
- (void)setDecompressAllAtOnce:(BOOL)a3;
- (void)setGrowData:(id)a3;
- (void)setWindowBits:(int)a3;
@end

@implementation PFZlibDataDecompressionOptions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_growData, 0);

  objc_storeStrong(&self->_createBuffer, 0);
}

- (void)setDecompressAllAtOnce:(BOOL)a3
{
  self->_decompressAllAtOnce = a3;
}

- (BOOL)decompressAllAtOnce
{
  return self->_decompressAllAtOnce;
}

- (id)growData
{
  return self->_growData;
}

- (id)createBuffer
{
  return self->_createBuffer;
}

- (void)setWindowBits:(int)a3
{
  self->_windowBits = a3;
}

- (int)windowBits
{
  return self->_windowBits;
}

- (void)setGrowData:(id)a3
{
  self->_growData = (id)MEMORY[0x1A6259AE0](a3, a2);

  MEMORY[0x1F41817F8]();
}

- (void)setCreateBuffer:(id)a3
{
  self->_createBuffer = (id)MEMORY[0x1A6259AE0](a3, a2);

  MEMORY[0x1F41817F8]();
}

+ (id)defaultOptions
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = -15;
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = &__block_literal_global_12606;

  v4 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = &__block_literal_global_38;

  return (id)v2;
}

void __48__PFZlibDataDecompressionOptions_defaultOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend(v4, "increaseLengthBy:", (unint64_t)objc_msgSend(a2, "length") >> 1);
}

uint64_t __48__PFZlibDataDecompressionOptions_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA58];
  uint64_t v3 = 4 * [a2 length];

  return [v2 dataWithLength:v3];
}

@end