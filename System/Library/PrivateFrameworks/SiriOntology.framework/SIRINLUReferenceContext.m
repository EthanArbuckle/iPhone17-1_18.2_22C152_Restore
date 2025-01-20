@interface SIRINLUReferenceContext
+ (BOOL)supportsSecureCoding;
- (BOOL)contextualReference;
- (BOOL)disambiguationNeeded;
- (SIRINLUReferenceContext)initWithCoder:(id)a3;
- (SIRINLUReferenceContext)initWithContextualReference:(BOOL)a3 DisambiguationNeeded:(BOOL)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContextualReference:(BOOL)a3;
- (void)setDisambiguationNeeded:(BOOL)a3;
@end

@implementation SIRINLUReferenceContext

- (void)setDisambiguationNeeded:(BOOL)a3
{
  self->_disambiguationNeeded = a3;
}

- (BOOL)disambiguationNeeded
{
  return self->_disambiguationNeeded;
}

- (void)setContextualReference:(BOOL)a3
{
  self->_contextualReference = a3;
}

- (BOOL)contextualReference
{
  return self->_contextualReference;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{ReferenceContext:\n  contextualReference: %d\n  disambiguationNeeded: %d\n}", self->_contextualReference, self->_disambiguationNeeded);
}

- (SIRINLUReferenceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUReferenceContext;
  v5 = [(SIRINLUReferenceContext *)&v7 init];
  if (v5)
  {
    v5->_contextualReference = [v4 decodeBoolForKey:@"contextualReference"];
    v5->_disambiguationNeeded = [v4 decodeBoolForKey:@"disambiguationNeeded"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL contextualReference = self->_contextualReference;
  id v5 = a3;
  [v5 encodeBool:contextualReference forKey:@"contextualReference"];
  [v5 encodeBool:self->_disambiguationNeeded forKey:@"disambiguationNeeded"];
}

- (SIRINLUReferenceContext)initWithContextualReference:(BOOL)a3 DisambiguationNeeded:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SIRINLUReferenceContext;
  result = [(SIRINLUReferenceContext *)&v7 init];
  if (result)
  {
    result->_BOOL contextualReference = a3;
    result->_disambiguationNeeded = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end