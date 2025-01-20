@interface NSError(OSAXformAugment)
- (id)augmentWithPrefix:()OSAXformAugment;
@end

@implementation NSError(OSAXformAugment)

- (id)augmentWithPrefix:()OSAXformAugment
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  v6 = [a1 domain];
  uint64_t v7 = [a1 code];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v8 = NSString;
  v9 = [a1 localizedDescription];
  v10 = [v8 stringWithFormat:@"%@: %@", v5, v9];

  v15[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = [v4 errorWithDomain:v6 code:v7 userInfo:v11];

  return v12;
}

@end