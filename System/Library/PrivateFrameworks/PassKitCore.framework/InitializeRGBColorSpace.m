@interface InitializeRGBColorSpace
@end

@implementation InitializeRGBColorSpace

CGColorSpaceRef ___InitializeRGBColorSpace_block_invoke()
{
  _MergedGlobals_199 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  qword_1EB402B70 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
  qword_1EB402B78 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  qword_1EB402B80 = (uint64_t)result;
  return result;
}

@end