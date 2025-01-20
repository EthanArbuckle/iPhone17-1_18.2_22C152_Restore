@interface SIRINLUSystemInformed
+ (BOOL)supportsSecureCoding;
- (NSArray)entities;
- (NSString)renderedText;
- (SIRINLUSystemInformed)initWithCoder:(id)a3;
- (SIRINLUSystemInformed)initWithEntities:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEntities:(id)a3;
- (void)setRenderedText:(id)a3;
@end

@implementation SIRINLUSystemInformed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

- (void)setEntities:(id)a3
{
}

- (NSArray)entities
{
  return self->_entities;
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
  v3 = [(SIRINLUSystemInformed *)self entities];
  v4 = +[SIRINLUPrintUtils indentArray:v3 numSpaces:4];

  v5 = NSString;
  v6 = [(SIRINLUSystemInformed *)self renderedText];
  v7 = [v5 stringWithFormat:@"{SystemInformed\n  entities:\n%@\n  renderedText: %@\n}", v4, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemInformed *)self entities];
  [v4 encodeObject:v5 forKey:@"entities"];

  id v6 = [(SIRINLUSystemInformed *)self renderedText];
  [v4 encodeObject:v6 forKey:@"renderedText"];
}

- (SIRINLUSystemInformed)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SIRINLUSystemInformed;
  v5 = [(SIRINLUSystemInformed *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"entities"];
    entities = v5->_entities;
    v5->_entities = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderedText"];
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v11;
  }
  return v5;
}

- (SIRINLUSystemInformed)initWithEntities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemInformed;
  id v6 = [(SIRINLUSystemInformed *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entities, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end