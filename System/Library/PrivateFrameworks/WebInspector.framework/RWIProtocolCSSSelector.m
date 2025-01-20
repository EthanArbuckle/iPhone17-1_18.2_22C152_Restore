@interface RWIProtocolCSSSelector
- (BOOL)dynamic;
- (NSArray)specificity;
- (NSString)text;
- (RWIProtocolCSSSelector)initWithText:(id)a3;
- (void)setDynamic:(BOOL)a3;
- (void)setSpecificity:(id)a3;
- (void)setText:(id)a3;
@end

@implementation RWIProtocolCSSSelector

- (RWIProtocolCSSSelector)initWithText:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolCSSSelector;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"text" format];
    }
    [(RWIProtocolCSSSelector *)v5 setText:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelector;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"text"];
}

- (NSString)text
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSSelector;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"text"];
  return (NSString *)v2;
}

- (void)setSpecificity:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSSelector;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"specificity"];
  objc_super v4 = v6;
  v6 = 0;
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

- (NSArray)specificity
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSSelector;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"specificity"];
  v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  v6 = 0;
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

- (void)setDynamic:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelector;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"dynamic"];
}

- (BOOL)dynamic
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSelector;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"dynamic"];
}

@end