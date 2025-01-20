@interface SIRINLUParser
+ (BOOL)supportsSecureCoding;
- (SIRINLUParser)init;
- (SIRINLUParser)initWithAlgorithmType:(int)a3 parserIdentifier:(int)a4;
- (SIRINLUParser)initWithCoder:(id)a3;
- (id)description;
- (int)algorithmType;
- (int)parserIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAlgorithmType:(int)a3;
- (void)setParserIdentifier:(int)a3;
@end

@implementation SIRINLUParser

- (void)setParserIdentifier:(int)a3
{
  self->_parserIdentifier = a3;
}

- (int)parserIdentifier
{
  return self->_parserIdentifier;
}

- (void)setAlgorithmType:(int)a3
{
  self->_algorithmType = a3;
}

- (int)algorithmType
{
  return self->_algorithmType;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{Parser\n  algorithmType: %d\n  parserIdentifier: %d\n}", self->_algorithmType, self->_parserIdentifier);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUParser algorithmType](self, "algorithmType"), @"algorithmType");
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUParser parserIdentifier](self, "parserIdentifier"), @"parserIdentifier");
}

- (SIRINLUParser)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUParser;
  v5 = [(SIRINLUParser *)&v7 init];
  if (v5)
  {
    v5->_algorithmType = [v4 decodeIntForKey:@"algorithmType"];
    v5->_parserIdentifier = [v4 decodeIntForKey:@"parserIdentifier"];
  }

  return v5;
}

- (SIRINLUParser)initWithAlgorithmType:(int)a3 parserIdentifier:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUParser;
  result = [(SIRINLUParser *)&v7 init];
  if (result)
  {
    result->_algorithmType = a3;
    result->_parserIdentifier = a4;
  }
  return result;
}

- (SIRINLUParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUParser;
  return [(SIRINLUParser *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end