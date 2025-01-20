@interface EQKitMathMLMStackLine
- (const)mathMLAttributes;
- (unint64_t)schemataThickness;
@end

@implementation EQKitMathMLMStackLine

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesSet, (int *)&-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStackRow mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStackLine mathMLAttributes]::sAttributesSet;
}

- (unint64_t)schemataThickness
{
  return 1;
}

@end