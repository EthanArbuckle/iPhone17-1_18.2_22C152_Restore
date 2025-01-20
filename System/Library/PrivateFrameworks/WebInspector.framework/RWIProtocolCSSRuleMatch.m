@interface RWIProtocolCSSRuleMatch
- (NSArray)matchingSelectors;
- (RWIProtocolCSSRule)rule;
- (RWIProtocolCSSRuleMatch)initWithRule:(id)a3 matchingSelectors:(id)a4;
- (void)setMatchingSelectors:(id)a3;
- (void)setRule:(id)a3;
@end

@implementation RWIProtocolCSSRuleMatch

- (RWIProtocolCSSRuleMatch)initWithRule:(id)a3 matchingSelectors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolCSSRuleMatch;
  v8 = [(RWIProtocolJSONObject *)&v11 init];
  if (v8)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"rule" format];
    }
    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"matchingSelectors" format];
    }
    [(RWIProtocolCSSRuleMatch *)v8 setRule:v6];
    [(RWIProtocolCSSRuleMatch *)v8 setMatchingSelectors:v7];
    v9 = v8;
  }

  return v8;
}

- (void)setRule:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSRuleMatch;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"rule"];
}

- (RWIProtocolCSSRule)rule
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSRuleMatch;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"rule"];
  if (v3)
  {
    v4 = [RWIProtocolCSSRule alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolCSSRuleMatch;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"rule"];
    [v5 toJSONObject];
    id v6 = v12;
    ++*v12;
    v13 = v6;
    id v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v8;
      }
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v9;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setMatchingSelectors:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSRuleMatch;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"matchingSelectors"];
  v4 = v6;
  id v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)matchingSelectors
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSRuleMatch;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"matchingSelectors"];
  v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  id v6 = 0;
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

@end