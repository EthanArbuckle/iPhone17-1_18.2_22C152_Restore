@interface SIRINLUSystemPrompted
+ (BOOL)supportsSecureCoding;
- (NSString)renderedText;
- (SIRINLUSystemPrompted)initWithCoder:(id)a3;
- (SIRINLUSystemPrompted)initWithReference:(id)a3;
- (USOSerializedGraph)reference;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setReference:(id)a3;
- (void)setRenderedText:(id)a3;
@end

@implementation SIRINLUSystemPrompted

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

- (void)setReference:(id)a3
{
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setRenderedText:(id)a3
{
}

- (NSString)renderedText
{
  return self->renderedText;
}

- (id)description
{
  v3 = [(SIRINLUSystemPrompted *)self reference];
  v4 = [v3 printedForm];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUSystemPrompted *)self renderedText];
  v8 = [v6 stringWithFormat:@"{SystemPrompted\n  reference:\n%@\n  renderedText: %@\n}", v5, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemPrompted *)self reference];
  [v4 encodeObject:v5 forKey:@"reference"];

  id v6 = [(SIRINLUSystemPrompted *)self renderedText];
  [v4 encodeObject:v6 forKey:@"renderedText"];
}

- (SIRINLUSystemPrompted)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUSystemPrompted;
  v5 = [(SIRINLUSystemPrompted *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reference"];
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderedText"];
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v8;
  }
  return v5;
}

- (SIRINLUSystemPrompted)initWithReference:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemPrompted;
  uint64_t v6 = [(SIRINLUSystemPrompted *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reference, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end