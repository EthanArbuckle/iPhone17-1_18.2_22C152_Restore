@interface RWIProtocolRuntimeCollectionEntry
- (RWIProtocolRuntimeCollectionEntry)initWithValue:(id)a3;
- (RWIProtocolRuntimeRemoteObject)key;
- (RWIProtocolRuntimeRemoteObject)value;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RWIProtocolRuntimeCollectionEntry

- (RWIProtocolRuntimeCollectionEntry)initWithValue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"value" format];
    }
    [(RWIProtocolRuntimeCollectionEntry *)v5 setValue:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setKey:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"key"];
}

- (RWIProtocolRuntimeRemoteObject)key
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"key"];
  if (v3)
  {
    id v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"key"];
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

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"value"];
}

- (RWIProtocolRuntimeRemoteObject)value
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"value"];
  if (v3)
  {
    id v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolRuntimeCollectionEntry;
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

@end