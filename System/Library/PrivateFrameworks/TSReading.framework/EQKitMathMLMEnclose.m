@interface EQKitMathMLMEnclose
- (const)mathMLAttributes;
- (id)schemataRow;
@end

@implementation EQKitMathMLMEnclose

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesData, (int *)&UnsafePointer);
  }
  return &-[EQKitMathMLMEnclose mathMLAttributes]::sAttributesSet;
}

- (id)schemataRow
{
  return self->super.mChild;
}

@end