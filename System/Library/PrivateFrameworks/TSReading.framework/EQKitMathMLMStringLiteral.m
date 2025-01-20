@interface EQKitMathMLMStringLiteral
- (BOOL)schemataIsQuoted;
- (const)mathMLAttributes;
@end

@implementation EQKitMathMLMStringLiteral

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesData, _ZZZN5EQKit7UnicodeL15pseudoScriptSetEvEUb_E17sPseudoScriptData);
  }
  return &-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesSet;
}

- (BOOL)schemataIsQuoted
{
  return 1;
}

@end