@interface CNVCardParameterDecoder
+ (id)decodeParameterValue:(id)a3;
+ (id)substitutions;
@end

@implementation CNVCardParameterDecoder

+ (id)substitutions
{
  if (substitutions_onceToken != -1) {
    dispatch_once(&substitutions_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)substitutions_sSubstitutions;
  return v2;
}

uint64_t __40__CNVCardParameterDecoder_substitutions__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F5A468]);
  v1 = (void *)substitutions_sSubstitutions;
  substitutions_sSubstitutions = (uint64_t)v0;

  [(id)substitutions_sSubstitutions setObject:@"\n" forKey:@"^n"];
  [(id)substitutions_sSubstitutions setObject:@"\t" forKey:@"^t"];
  [(id)substitutions_sSubstitutions setObject:@"^" forKey:@"^^"];
  v2 = (void *)substitutions_sSubstitutions;
  return [v2 setObject:@"\" forKey:@"^'""];
}

+ (id)decodeParameterValue:(id)a3
{
  id v4 = a3;
  v5 = [a1 substitutions];
  v6 = objc_msgSend(v4, "_cn_stringByReplacingStrings:", v5);

  return v6;
}

@end