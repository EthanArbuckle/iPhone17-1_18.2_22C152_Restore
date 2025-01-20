@interface EQKitMathMLMAlignGroup
- (const)mathMLAttributes;
- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4;
@end

@implementation EQKitMathMLMAlignGroup

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignGroup;
  return [(EQKitMathMLMAlignGroup *)&v5 init];
}

- (const)mathMLAttributes
{
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesData, -[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesSet;
}

@end