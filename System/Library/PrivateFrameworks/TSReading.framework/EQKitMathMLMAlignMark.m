@interface EQKitMathMLMAlignMark
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
@end

@implementation EQKitMathMLMAlignMark

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignMark;
  return [(EQKitMathMLMAlignMark *)&v5 init];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet, -[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData, &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData[1]);
  }
  return &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet;
}

@end