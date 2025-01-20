@interface RWIProtocolCSSPseudoIdMatches
- (NSArray)matches;
- (RWIProtocolCSSPseudoIdMatches)initWithPseudoId:(int64_t)a3 matches:(id)a4;
- pseudoId;
- (int64_t)pseudoId;
- (void)setMatches:(id)a3;
- (void)setPseudoId:(int64_t)a3;
@end

@implementation RWIProtocolCSSPseudoIdMatches

- (RWIProtocolCSSPseudoIdMatches)initWithPseudoId:(int64_t)a3 matches:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  v18 = [(RWIProtocolJSONObject *)&v23 init];
  if (v18)
  {
    if (!v17) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"matches" format];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v17;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      uint64_t v9 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = (void *)MEMORY[0x263EFF940];
            v13 = (objc_class *)objc_opt_class();
            v14 = NSStringFromClass(v13);
            [v12 raise:v9, @"array should contain objects of type '%@', found bad value: %@", v14, v11 format];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    [(RWIProtocolCSSPseudoIdMatches *)v18 setPseudoId:a3];
    [(RWIProtocolCSSPseudoIdMatches *)v18 setMatches:v6];
    v15 = v18;
  }

  return v18;
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
  v6.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"pseudoId"];

  v5 = v7;
  uint64_t v7 = 0;
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
  v9.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"pseudoId"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  uint64_t v11 = v3;
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
  uint64_t v8 = (_DWORD *)v10;
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

- (void)setMatches:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_super v9 = (void *)MEMORY[0x263EFF940];
          uint64_t v10 = (objc_class *)objc_opt_class();
          uint64_t v11 = NSStringFromClass(v10);
          [v9 raise:v6, @"array should contain objects of type '%@', found bad value: %@", v11, v8 format];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  [(RWIProtocolJSONObject *)&v14 setJSONArray:&v15 forKey:@"matches"];
  uint64_t v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v12;
    }
  }
}

- (NSArray)matches
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPseudoIdMatches;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"matches"];
  id v2 = Inspector::toObjCArray<RWIProtocolCSSRuleMatch>(&v6);
  id v3 = v6;
  uint64_t v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- pseudoId
{
  if (*result == 2) {
    return (_DWORD *)WTF::StringImpl::destroy();
  }
  *result -= 2;
  return result;
}

@end