@interface GSAddition(FPFSAdditions)
+ (uint64_t)brc_isLegacyConflictAddition:()FPFSAdditions;
@end

@implementation GSAddition(FPFSAdditions)

+ (uint64_t)brc_isLegacyConflictAddition:()FPFSAdditions
{
  id v3 = a3;
  v4 = [v3 nameSpace];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F406A8]];

  if (v5)
  {
    v6 = [v3 name];
    v7 = [v6 componentsSeparatedByString:@"_"];

    if (v7 && [v7 count])
    {
      v8 = [v7 objectAtIndexedSubscript:0];
      if ([v7 count] == 4 && objc_msgSend(v8, "hasSuffix:", @":"))
      {
        uint64_t v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);

        v8 = (void *)v9;
      }
      if (v8) {
        uint64_t v10 = [MEMORY[0x263F325E0] validateMangledIDString:v8];
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end