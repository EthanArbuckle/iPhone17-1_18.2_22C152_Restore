@interface UIWebClip(SBAdditions)
- (id)sb_iconImageFileProtectionType;
- (uint64_t)sb_markIconImageFileProtectionTypeAsNone;
@end

@implementation UIWebClip(SBAdditions)

- (id)sb_iconImageFileProtectionType
{
  v1 = [a1 iconImagePath];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 attributesOfItemAtPath:v1 error:0];

  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];

  return v4;
}

- (uint64_t)sb_markIconImageFileProtectionTypeAsNone
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 iconImagePath];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [v2 attributesOfItemAtPath:v1 error:0];

  v4 = (void *)*MEMORY[0x1E4F28378];
  uint64_t v5 = *MEMORY[0x1E4F28370];
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
  int v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = v5;
    v12[0] = v4;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v8 setAttributes:v9 ofItemAtPath:v1 error:0];
  }
  return v7 ^ 1u;
}

@end