@interface RWIProtocolGenericTypesSearchMatch
- (NSString)lineContent;
- (RWIProtocolGenericTypesSearchMatch)initWithLineNumber:(double)a3 lineContent:(id)a4;
- (double)lineNumber;
- (void)setLineContent:(id)a3;
- (void)setLineNumber:(double)a3;
@end

@implementation RWIProtocolGenericTypesSearchMatch

- (RWIProtocolGenericTypesSearchMatch)initWithLineNumber:(double)a3 lineContent:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  v7 = [(RWIProtocolJSONObject *)&v10 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"lineContent" format];
    }
    [(RWIProtocolGenericTypesSearchMatch *)v7 setLineNumber:a3];
    [(RWIProtocolGenericTypesSearchMatch *)v7 setLineContent:v6];
    v8 = v7;
  }

  return v7;
}

- (void)setLineNumber:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"lineNumber" forKey:a3];
}

- (double)lineNumber
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"lineNumber"];
  return result;
}

- (void)setLineContent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"lineContent"];
}

- (NSString)lineContent
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolGenericTypesSearchMatch;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"lineContent"];
  return (NSString *)v2;
}

@end