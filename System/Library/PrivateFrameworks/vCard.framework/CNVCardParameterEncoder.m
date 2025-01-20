@interface CNVCardParameterEncoder
+ (BOOL)mustEncloseStringInQuotes:(id)a3;
+ (id)encodeParameterValue:(id)a3;
+ (id)stringByEnclosingInQuotesIfNecessary:(id)a3;
+ (id)stringByReplacingEncodableCharactersInString:(id)a3;
+ (id)substitutions;
@end

@implementation CNVCardParameterEncoder

+ (id)encodeParameterValue:(id)a3
{
  v4 = [a1 stringByReplacingEncodableCharactersInString:a3];
  v5 = [a1 stringByEnclosingInQuotesIfNecessary:v4];

  return v5;
}

+ (id)substitutions
{
  if (substitutions_onceToken_0 != -1) {
    dispatch_once(&substitutions_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)substitutions_sSubstitutions_0;
  return v2;
}

uint64_t __40__CNVCardParameterEncoder_substitutions__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F5A468]);
  v1 = (void *)substitutions_sSubstitutions_0;
  substitutions_sSubstitutions_0 = (uint64_t)v0;

  [(id)substitutions_sSubstitutions_0 setObject:@"^n" forKey:@"\n\r"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^n" forKey:@"\r\n"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^n" forKey:@"\n"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^n" forKey:@"\r"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^t" forKey:@"\t"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^^" forKey:@"^"];
  [(id)substitutions_sSubstitutions_0 setObject:@"^'" forKey:@"\""];
  v2 = (void *)substitutions_sSubstitutions_0;
  return [v2 setObject:&stru_1F362EAE0 forKey:&stru_1F3630E40];
}

+ (id)stringByReplacingEncodableCharactersInString:(id)a3
{
  id v4 = a3;
  v5 = [a1 substitutions];
  v6 = objc_msgSend(v4, "_cn_stringByReplacingStrings:", v5);

  return v6;
}

+ (id)stringByEnclosingInQuotesIfNecessary:(id)a3
{
  id v4 = a3;
  if ([a1 mustEncloseStringInQuotes:v4])
  {
    id v5 = [NSString stringWithFormat:@"\"%@\"", v4];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)mustEncloseStringInQuotes:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 characterSetWithCharactersInString:@",:;"];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

@end