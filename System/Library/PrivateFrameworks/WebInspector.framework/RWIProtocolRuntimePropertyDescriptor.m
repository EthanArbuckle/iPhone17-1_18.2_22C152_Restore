@interface RWIProtocolRuntimePropertyDescriptor
- (BOOL)configurable;
- (BOOL)enumerable;
- (BOOL)isOwn;
- (BOOL)isPrivate;
- (BOOL)nativeGetter;
- (BOOL)wasThrown;
- (BOOL)writable;
- (NSString)name;
- (RWIProtocolRuntimePropertyDescriptor)initWithName:(id)a3;
- (RWIProtocolRuntimeRemoteObject)get;
- (RWIProtocolRuntimeRemoteObject)set;
- (RWIProtocolRuntimeRemoteObject)symbol;
- (RWIProtocolRuntimeRemoteObject)value;
- (void)setConfigurable:(BOOL)a3;
- (void)setEnumerable:(BOOL)a3;
- (void)setGet:(id)a3;
- (void)setIsOwn:(BOOL)a3;
- (void)setIsPrivate:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNativeGetter:(BOOL)a3;
- (void)setSet:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setValue:(id)a3;
- (void)setWasThrown:(BOOL)a3;
- (void)setWritable:(BOOL)a3;
@end

@implementation RWIProtocolRuntimePropertyDescriptor

- (RWIProtocolRuntimePropertyDescriptor)initWithName:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"name" format];
    }
    [(RWIProtocolRuntimePropertyDescriptor *)v5 setName:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"name"];
}

- (NSString)name
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"name"];
  return (NSString *)v2;
}

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"value"];
}

- (RWIProtocolRuntimeRemoteObject)value
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"value"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"value"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    objc_super v8 = v13;
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
    v7 = 0;
  }

  return v7;
}

- (void)setWritable:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"writable"];
}

- (BOOL)writable
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"writable"];
}

- (void)setGet:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"get"];
}

- (RWIProtocolRuntimeRemoteObject)get
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"get"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"get"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    objc_super v8 = v13;
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
    v7 = 0;
  }

  return v7;
}

- (void)setSet:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"set"];
}

- (RWIProtocolRuntimeRemoteObject)set
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"set"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"set"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    objc_super v8 = v13;
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
    v7 = 0;
  }

  return v7;
}

- (void)setWasThrown:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"wasThrown"];
}

- (BOOL)wasThrown
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"wasThrown"];
}

- (void)setConfigurable:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"configurable"];
}

- (BOOL)configurable
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"configurable"];
}

- (void)setEnumerable:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"enumerable"];
}

- (BOOL)enumerable
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"enumerable"];
}

- (void)setIsOwn:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isOwn"];
}

- (BOOL)isOwn
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isOwn"];
}

- (void)setSymbol:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"symbol"];
}

- (RWIProtocolRuntimeRemoteObject)symbol
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"symbol"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"symbol"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    objc_super v8 = v13;
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
    v7 = 0;
  }

  return v7;
}

- (void)setIsPrivate:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isPrivate"];
}

- (BOOL)isPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isPrivate"];
}

- (void)setNativeGetter:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"nativeGetter"];
}

- (BOOL)nativeGetter
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimePropertyDescriptor;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"nativeGetter"];
}

@end