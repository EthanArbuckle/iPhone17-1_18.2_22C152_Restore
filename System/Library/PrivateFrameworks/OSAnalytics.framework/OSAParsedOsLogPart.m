@interface OSAParsedOsLogPart
- (BOOL)isArgument;
- (BOOL)isImmutable;
- (NSString)stringValue;
- (OSAParsedOsLogPart)initWithIntegerArgumentStringValue:(id)a3;
- (OSAParsedOsLogPart)initWithLiteral:(id)a3 isImmutable:(BOOL)a4;
- (OSAParsedOsLogPart)initWithStringArgument:(id)a3 isImmutable:(BOOL)a4;
- (id)description;
@end

@implementation OSAParsedOsLogPart

- (OSAParsedOsLogPart)initWithLiteral:(id)a3 isImmutable:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSAParsedOsLogPart;
  v8 = [(OSAParsedOsLogPart *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isImmutable = a4;
    objc_storeStrong((id *)&v8->_stringValue, a3);
    v9->_isArgument = 0;
  }

  return v9;
}

- (OSAParsedOsLogPart)initWithStringArgument:(id)a3 isImmutable:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSAParsedOsLogPart;
  v8 = [(OSAParsedOsLogPart *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isImmutable = a4;
    objc_storeStrong((id *)&v8->_stringValue, a3);
    v9->_isArgument = 1;
  }

  return v9;
}

- (OSAParsedOsLogPart)initWithIntegerArgumentStringValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OSAParsedOsLogPart;
  v6 = [(OSAParsedOsLogPart *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_isImmutable = 1;
    objc_storeStrong((id *)&v6->_stringValue, a3);
    v7->_isArgument = 1;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"isImmutable: %d, isArgument: %d, stringValue: %@", self->_isImmutable, self->_isArgument, self->_stringValue];
}

- (BOOL)isImmutable
{
  return self->_isImmutable;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isArgument
{
  return self->_isArgument;
}

- (void).cxx_destruct
{
}

@end