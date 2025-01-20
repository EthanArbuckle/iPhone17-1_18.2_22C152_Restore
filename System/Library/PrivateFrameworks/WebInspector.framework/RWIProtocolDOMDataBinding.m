@interface RWIProtocolDOMDataBinding
- (NSString)binding;
- (NSString)type;
- (NSString)value;
- (RWIProtocolDOMDataBinding)initWithBinding:(id)a3 value:(id)a4;
- (void)setBinding:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation RWIProtocolDOMDataBinding

- (RWIProtocolDOMDataBinding)initWithBinding:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolDOMDataBinding;
  v8 = [(RWIProtocolJSONObject *)&v11 init];
  if (v8)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"binding" format];
    }
    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"value" format];
    }
    [(RWIProtocolDOMDataBinding *)v8 setBinding:v6];
    [(RWIProtocolDOMDataBinding *)v8 setValue:v7];
    v9 = v8;
  }

  return v8;
}

- (void)setBinding:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"binding"];
}

- (NSString)binding
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMDataBinding;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"binding"];
  return (NSString *)v2;
}

- (void)setType:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"type"];
}

- (NSString)type
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMDataBinding;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"type"];
  return (NSString *)v2;
}

- (void)setValue:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMDataBinding;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"value"];
}

- (NSString)value
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMDataBinding;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"value"];
  return (NSString *)v2;
}

@end