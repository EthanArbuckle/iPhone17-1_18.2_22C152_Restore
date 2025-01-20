@interface RWIProtocolCSSPropertyInfo
- (BOOL)inherited;
- (NSArray)aliases;
- (NSArray)longhands;
- (NSArray)values;
- (NSString)name;
- (RWIProtocolCSSPropertyInfo)initWithName:(id)a3;
- (void)setAliases:(id)a3;
- (void)setInherited:(BOOL)a3;
- (void)setLonghands:(id)a3;
- (void)setName:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation RWIProtocolCSSPropertyInfo

- (RWIProtocolCSSPropertyInfo)initWithName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolCSSPropertyInfo;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    [(RWIProtocolCSSPropertyInfo *)v5 setName:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSPropertyInfo;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setAliases:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"aliases"];
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

- (NSArray)aliases
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"aliases"];
  v2 = Inspector::toObjCStringArray(&v6);
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

- (void)setLonghands:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"longhands"];
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

- (NSArray)longhands
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"longhands"];
  v2 = Inspector::toObjCStringArray(&v6);
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

- (void)setValues:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"values"];
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

- (NSArray)values
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"values"];
  v2 = Inspector::toObjCStringArray(&v6);
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

- (void)setInherited:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"inherited"];
}

- (BOOL)inherited
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSPropertyInfo;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"inherited"];
}

@end