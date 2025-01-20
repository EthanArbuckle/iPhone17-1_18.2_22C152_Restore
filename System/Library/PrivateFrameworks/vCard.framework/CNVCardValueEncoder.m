@interface CNVCardValueEncoder
+ (id)encodeValue:(id)a3;
+ (id)substitutions;
@end

@implementation CNVCardValueEncoder

+ (id)substitutions
{
  if (substitutions_onceToken_1 != -1) {
    dispatch_once(&substitutions_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)substitutions_sSubstitutions_1;
  return v2;
}

uint64_t __36__CNVCardValueEncoder_substitutions__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F5A468]);
  v1 = (void *)substitutions_sSubstitutions_1;
  substitutions_sSubstitutions_1 = (uint64_t)v0;

  [(id)substitutions_sSubstitutions_1 setObject:@"\\n" forKey:@"\r\n"];
  [(id)substitutions_sSubstitutions_1 setObject:@"\\n" forKey:@"\n"];
  [(id)substitutions_sSubstitutions_1 setObject:@"\\n" forKey:@"\r"];
  [(id)substitutions_sSubstitutions_1 setObject:@"\\;" forKey:@";"];
  [(id)substitutions_sSubstitutions_1 setObject:@"\\," forKey:@","];
  [(id)substitutions_sSubstitutions_1 setObject:@"\\\\" forKey:@"\\"];
  v2 = (void *)substitutions_sSubstitutions_1;
  return [v2 setObject:&stru_1F362EAE0 forKey:&stru_1F3630E40];
}

+ (id)encodeValue:(id)a3
{
  id v4 = a3;
  v5 = [a1 substitutions];
  v6 = objc_msgSend(v4, "_cn_stringByReplacingStrings:", v5);

  return v6;
}

@end