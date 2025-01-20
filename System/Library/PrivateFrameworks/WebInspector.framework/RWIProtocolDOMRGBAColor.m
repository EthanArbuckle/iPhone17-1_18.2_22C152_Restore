@interface RWIProtocolDOMRGBAColor
- (RWIProtocolDOMRGBAColor)initWithR:(int)a3 g:(int)a4 b:(int)a5;
- (double)a;
- (int)b;
- (int)g;
- (int)r;
- (void)setA:(double)a3;
- (void)setB:(int)a3;
- (void)setG:(int)a3;
- (void)setR:(int)a3;
@end

@implementation RWIProtocolDOMRGBAColor

- (RWIProtocolDOMRGBAColor)initWithR:(int)a3 g:(int)a4 b:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)RWIProtocolDOMRGBAColor;
  v8 = [(RWIProtocolJSONObject *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(RWIProtocolDOMRGBAColor *)v8 setR:v7];
    [(RWIProtocolDOMRGBAColor *)v9 setG:v6];
    [(RWIProtocolDOMRGBAColor *)v9 setB:v5];
    v10 = v9;
  }

  return v9;
}

- (void)setR:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"r"];
}

- (int)r
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"r"];
}

- (void)setG:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"g"];
}

- (int)g
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"g"];
}

- (void)setB:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"b"];
}

- (int)b
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"b"];
}

- (void)setA:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"a" forKey:a3];
}

- (double)a
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMRGBAColor;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"a"];
  return result;
}

@end