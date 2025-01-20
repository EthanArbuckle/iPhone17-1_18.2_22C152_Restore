@interface RWIProtocolDOMHighlightConfig
- (BOOL)showInfo;
- (RWIProtocolDOMRGBAColor)borderColor;
- (RWIProtocolDOMRGBAColor)contentColor;
- (RWIProtocolDOMRGBAColor)marginColor;
- (RWIProtocolDOMRGBAColor)paddingColor;
- (void)setBorderColor:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setMarginColor:(id)a3;
- (void)setPaddingColor:(id)a3;
- (void)setShowInfo:(BOOL)a3;
@end

@implementation RWIProtocolDOMHighlightConfig

- (void)setShowInfo:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"showInfo"];
}

- (BOOL)showInfo
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"showInfo"];
}

- (void)setContentColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"contentColor"];
}

- (RWIProtocolDOMRGBAColor)contentColor
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"contentColor"];
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"contentColor"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setPaddingColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"paddingColor"];
}

- (RWIProtocolDOMRGBAColor)paddingColor
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"paddingColor"];
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"paddingColor"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setBorderColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"borderColor"];
}

- (RWIProtocolDOMRGBAColor)borderColor
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"borderColor"];
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"borderColor"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

- (void)setMarginColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  [(RWIProtocolJSONObject *)&v3 setObject:a3 forKey:@"marginColor"];
}

- (RWIProtocolDOMRGBAColor)marginColor
{
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  objc_super v3 = [(RWIProtocolJSONObject *)&v14 objectForKey:@"marginColor"];
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    v5 = [(RWIProtocolJSONObject *)&v11 objectForKey:@"marginColor"];
    [v5 toJSONObject];
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = [(RWIProtocolJSONObject *)v4 initWithJSONObject:&v13];
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
    v7 = 0;
  }

  return v7;
}

@end