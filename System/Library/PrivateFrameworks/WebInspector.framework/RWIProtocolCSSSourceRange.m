@interface RWIProtocolCSSSourceRange
- (RWIProtocolCSSSourceRange)initWithStartLine:(int)a3 startColumn:(int)a4 endLine:(int)a5 endColumn:(int)a6;
- (int)endColumn;
- (int)endLine;
- (int)startColumn;
- (int)startLine;
- (void)setEndColumn:(int)a3;
- (void)setEndLine:(int)a3;
- (void)setStartColumn:(int)a3;
- (void)setStartLine:(int)a3;
@end

@implementation RWIProtocolCSSSourceRange

- (RWIProtocolCSSSourceRange)initWithStartLine:(int)a3 startColumn:(int)a4 endLine:(int)a5 endColumn:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolCSSSourceRange;
  v10 = [(RWIProtocolJSONObject *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(RWIProtocolCSSSourceRange *)v10 setStartLine:v9];
    [(RWIProtocolCSSSourceRange *)v11 setStartColumn:v8];
    [(RWIProtocolCSSSourceRange *)v11 setEndLine:v7];
    [(RWIProtocolCSSSourceRange *)v11 setEndColumn:v6];
    v12 = v11;
  }

  return v11;
}

- (void)setStartLine:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"startLine"];
}

- (int)startLine
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"startLine"];
}

- (void)setStartColumn:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"startColumn"];
}

- (int)startColumn
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"startColumn"];
}

- (void)setEndLine:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"endLine"];
}

- (int)endLine
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"endLine"];
}

- (void)setEndColumn:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"endColumn"];
}

- (int)endColumn
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSSourceRange;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"endColumn"];
}

@end