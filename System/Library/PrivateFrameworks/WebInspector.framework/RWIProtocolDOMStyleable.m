@interface RWIProtocolDOMStyleable
- (RWIProtocolDOMStyleable)initWithNodeId:(int)a3;
- (int)nodeId;
- (int64_t)pseudoId;
- (void)setNodeId:(int)a3;
- (void)setPseudoId:(int64_t)a3;
@end

@implementation RWIProtocolDOMStyleable

- (RWIProtocolDOMStyleable)initWithNodeId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDOMStyleable;
  v4 = [(RWIProtocolJSONObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(RWIProtocolDOMStyleable *)v4 setNodeId:v3];
    v6 = v5;
  }

  return v5;
}

- (void)setNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStyleable;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"nodeId"];
}

- (int)nodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMStyleable;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"nodeId"];
}

- (void)setPseudoId:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMStyleable;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"pseudoId"];

  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)pseudoId
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMStyleable;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"pseudoId"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  v11 = v3;
  LODWORD(v12) = v4;
  BYTE4(v12) = BYTE4(v4);
  char v13 = 1;
  char v14 = 0;
  int64_t result = std::__lower_bound[abi:sn180100]<std::_ClassicAlgPolicy,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,WTF::ComparableStringView,std::__identity,RWIProtocolCSSPseudoId const* WTF::SortedArrayMap<std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId>[23]>::tryGet<WTF::String>(WTF::String const&)::{lambda(WTF::String&,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const* &)#1}>((uint64_t)&Inspector::fromProtocolString<RWIProtocolCSSPseudoId>(WTF::String const&)::mappings, (uint64_t)&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings);
  int64_t v6 = result;
  if ((char **)result == &Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings) {
    goto LABEL_12;
  }
  if (!v13)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  if (!WTF::operator==(v11, v12, *(unsigned __int8 **)result, *(void *)(result + 8)))
  {
LABEL_12:
    int64_t result = std::__throw_bad_optional_access[abi:sn180100]();
    goto LABEL_13;
  }
  int64_t v7 = *(void *)(v6 + 16);
  objc_super v8 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v8)
  {
    if (*v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v8 -= 2;
    }
  }
  return v7;
}

@end