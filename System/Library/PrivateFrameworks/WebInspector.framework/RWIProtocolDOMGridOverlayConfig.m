@interface RWIProtocolDOMGridOverlayConfig
- (BOOL)showAreaNames;
- (BOOL)showExtendedGridLines;
- (BOOL)showLineNames;
- (BOOL)showLineNumbers;
- (BOOL)showTrackSizes;
- (RWIProtocolDOMGridOverlayConfig)initWithGridColor:(id)a3;
- (RWIProtocolDOMRGBAColor)gridColor;
- (void)setGridColor:(id)a3;
- (void)setShowAreaNames:(BOOL)a3;
- (void)setShowExtendedGridLines:(BOOL)a3;
- (void)setShowLineNames:(BOOL)a3;
- (void)setShowLineNumbers:(BOOL)a3;
- (void)setShowTrackSizes:(BOOL)a3;
@end

@implementation RWIProtocolDOMGridOverlayConfig

- (RWIProtocolDOMGridOverlayConfig)initWithGridColor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  v5 = [(RWIProtocolJSONObject *)&v8 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"gridColor" format];
    }
    [(RWIProtocolDOMGridOverlayConfig *)v5 setGridColor:v4];
    v6 = v5;
  }

  return v5;
}

- (void)setGridColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"gridColor"];
}

- (RWIProtocolDOMRGBAColor)gridColor
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"gridColor"];
  if (v3)
  {
    id v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"gridColor"];
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

- (void)setShowLineNames:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showLineNames"];
}

- (BOOL)showLineNames
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showLineNames"];
}

- (void)setShowLineNumbers:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showLineNumbers"];
}

- (BOOL)showLineNumbers
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showLineNumbers"];
}

- (void)setShowExtendedGridLines:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showExtendedGridLines"];
}

- (BOOL)showExtendedGridLines
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showExtendedGridLines"];
}

- (void)setShowTrackSizes:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showTrackSizes"];
}

- (BOOL)showTrackSizes
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showTrackSizes"];
}

- (void)setShowAreaNames:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showAreaNames"];
}

- (BOOL)showAreaNames
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMGridOverlayConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showAreaNames"];
}

@end