@interface EQKitMathMLMSpace
- (BOOL)isSpaceLike;
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
@end

@implementation EQKitMathMLMSpace

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMSpace;
  return [(EQKitMathMLMSpace *)&v5 init];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet, -[EQKitMathMLMSpace mathMLAttributes]::sAttributesData, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet;
}

- (BOOL)isSpaceLike
{
  return 1;
}

@end