@interface RWIProtocolDOMEventListener
- (BOOL)disabled;
- (BOOL)hasBreakpoint;
- (BOOL)isAttribute;
- (BOOL)onWindow;
- (BOOL)once;
- (BOOL)passive;
- (BOOL)useCapture;
- (NSString)handlerName;
- (NSString)type;
- (RWIProtocolDOMEventListener)initWithEventListenerId:(int)a3 type:(id)a4 useCapture:(BOOL)a5 isAttribute:(BOOL)a6;
- (RWIProtocolDebuggerLocation)location;
- (int)eventListenerId;
- (int)nodeId;
- (void)setDisabled:(BOOL)a3;
- (void)setEventListenerId:(int)a3;
- (void)setHandlerName:(id)a3;
- (void)setHasBreakpoint:(BOOL)a3;
- (void)setIsAttribute:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setNodeId:(int)a3;
- (void)setOnWindow:(BOOL)a3;
- (void)setOnce:(BOOL)a3;
- (void)setPassive:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setUseCapture:(BOOL)a3;
@end

@implementation RWIProtocolDOMEventListener

- (RWIProtocolDOMEventListener)initWithEventListenerId:(int)a3 type:(id)a4 useCapture:(BOOL)a5 isAttribute:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMEventListener;
  v11 = [(RWIProtocolJSONObject *)&v14 init];
  if (v11)
  {
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"type" format];
    }
    [(RWIProtocolDOMEventListener *)v11 setEventListenerId:v8];
    [(RWIProtocolDOMEventListener *)v11 setType:v10];
    [(RWIProtocolDOMEventListener *)v11 setUseCapture:v7];
    [(RWIProtocolDOMEventListener *)v11 setIsAttribute:v6];
    v12 = v11;
  }

  return v11;
}

- (void)setEventListenerId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"eventListenerId"];
}

- (int)eventListenerId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"eventListenerId"];
}

- (void)setType:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"type"];
}

- (NSString)type
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMEventListener;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"type"];
  return (NSString *)v2;
}

- (void)setUseCapture:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"useCapture"];
}

- (BOOL)useCapture
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"useCapture"];
}

- (void)setIsAttribute:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isAttribute"];
}

- (BOOL)isAttribute
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isAttribute"];
}

- (void)setNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"nodeId"];
}

- (int)nodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"nodeId"];
}

- (void)setOnWindow:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"onWindow"];
}

- (BOOL)onWindow
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"onWindow"];
}

- (void)setLocation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"location"];
}

- (RWIProtocolDebuggerLocation)location
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMEventListener;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"location"];
  if (v3)
  {
    objc_super v4 = [RWIProtocolDebuggerLocation alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMEventListener;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"location"];
    [v5 toJSONObject];
    BOOL v6 = v12;
    ++*v12;
    v13 = v6;
    BOOL v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
    uint64_t v8 = v13;
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
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setHandlerName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"handlerName"];
}

- (NSString)handlerName
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMEventListener;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"handlerName"];
  return (NSString *)v2;
}

- (void)setPassive:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"passive"];
}

- (BOOL)passive
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"passive"];
}

- (void)setOnce:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"once"];
}

- (BOOL)once
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"once"];
}

- (void)setDisabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"disabled"];
}

- (BOOL)disabled
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"disabled"];
}

- (void)setHasBreakpoint:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"hasBreakpoint"];
}

- (BOOL)hasBreakpoint
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMEventListener;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"hasBreakpoint"];
}

@end