@interface RWIProtocolCSSStyleId
- (NSString)styleSheetId;
- (RWIProtocolCSSStyleId)initWithStyleSheetId:(id)a3 ordinal:(int)a4;
- (int)ordinal;
- (void)setOrdinal:(int)a3;
- (void)setStyleSheetId:(id)a3;
@end

@implementation RWIProtocolCSSStyleId

- (RWIProtocolCSSStyleId)initWithStyleSheetId:(id)a3 ordinal:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolCSSStyleId;
  v7 = [(RWIProtocolJSONObject *)&v10 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"styleSheetId" format];
    }
    [(RWIProtocolCSSStyleId *)v7 setStyleSheetId:v6];
    [(RWIProtocolCSSStyleId *)v7 setOrdinal:v4];
    v8 = v7;
  }

  return v7;
}

- (void)setStyleSheetId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleId;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"styleSheetId"];
}

- (NSString)styleSheetId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleId;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"styleSheetId"];
  return (NSString *)v2;
}

- (void)setOrdinal:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleId;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"ordinal"];
}

- (int)ordinal
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleId;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"ordinal"];
}

@end