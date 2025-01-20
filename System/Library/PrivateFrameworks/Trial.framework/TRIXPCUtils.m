@interface TRIXPCUtils
+ (BOOL)validateSafeASCIISubsetIdentifier:(id)a3;
@end

@implementation TRIXPCUtils

+ (BOOL)validateSafeASCIISubsetIdentifier:(id)a3
{
  uint64_t v3 = qword_1EB3B7A28;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB3B7A28, &__block_literal_global_26);
  }
  uint64_t v5 = [v4 rangeOfCharacterFromSet:_MergedGlobals_21];

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

void __49__TRIXPCUtils_validateSafeASCIISubsetIdentifier___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_.-"];
  uint64_t v2 = [v1 invertedSet];
  uint64_t v3 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = v2;
}

@end