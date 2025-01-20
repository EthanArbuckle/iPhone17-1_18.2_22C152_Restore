@interface PXGShaderFlagsDescription
@end

@implementation PXGShaderFlagsDescription

__CFString *__PXGShaderFlagsDescription_block_invoke_361(uint64_t a1, unsigned int a2)
{
  return PXGYCbCrBitDepthDescription((a2 >> 12) & 3);
}

__CFString *__PXGShaderFlagsDescription_block_invoke_355(uint64_t a1, unsigned int a2)
{
  return PXGYCbCrMatrixDescription((a2 >> 8) & 0xF);
}

@end