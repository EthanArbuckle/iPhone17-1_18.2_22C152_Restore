@interface CNVCardProdIdString
+ (id)defaultLanguage;
+ (id)stringForCurrentBuild;
+ (id)stringWithProduct:(id)a3 version:(id)a4 language:(id)a5;
@end

@implementation CNVCardProdIdString

+ (id)stringForCurrentBuild
{
  v3 = (void *)_CFCopySystemVersionDictionary();
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1CD18]];
  v5 = [v3 objectForKey:*MEMORY[0x1E4F1CD30]];
  v6 = [a1 defaultLanguage];
  v7 = [a1 stringWithProduct:v4 version:v5 language:v6];

  return v7;
}

+ (id)stringWithProduct:(id)a3 version:(id)a4 language:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28E78] stringWithString:@"-//Apple Inc."];
  uint64_t v11 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v7) & 1) == 0)
  {
    [v10 appendFormat:@"//%@", v7];
    if (((*(uint64_t (**)(uint64_t, id))(v11 + 16))(v11, v8) & 1) == 0) {
      [v10 appendFormat:@" %@", v8];
    }
  }
  if (((*(uint64_t (**)(uint64_t, id))(v11 + 16))(v11, v9) & 1) == 0) {
    [v10 appendFormat:@"//%@", v9];
  }

  return v10;
}

+ (id)defaultLanguage
{
  return @"EN";
}

@end