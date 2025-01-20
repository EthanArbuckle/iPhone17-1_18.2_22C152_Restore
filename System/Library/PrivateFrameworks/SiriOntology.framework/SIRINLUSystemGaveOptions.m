@interface SIRINLUSystemGaveOptions
+ (BOOL)supportsSecureCoding;
- (NSArray)choices;
- (NSString)renderedText;
- (SIRINLUSystemGaveOptions)initWithChoices:(id)a3;
- (SIRINLUSystemGaveOptions)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChoices:(id)a3;
- (void)setRenderedText:(id)a3;
@end

@implementation SIRINLUSystemGaveOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

- (void)setChoices:(id)a3
{
}

- (NSArray)choices
{
  return self->_choices;
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
  v3 = [(SIRINLUSystemGaveOptions *)self choices];
  v4 = +[SIRINLUPrintUtils indentArray:v3 numSpaces:4];

  v5 = NSString;
  v6 = [(SIRINLUSystemGaveOptions *)self renderedText];
  v7 = [v5 stringWithFormat:@"{SystemGaveOptions\n  choices:\n%@\n  renderedText: %@\n}", v4, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemGaveOptions *)self choices];
  [v4 encodeObject:v5 forKey:@"choices"];

  id v6 = [(SIRINLUSystemGaveOptions *)self renderedText];
  [v4 encodeObject:v6 forKey:@"renderedText"];
}

- (SIRINLUSystemGaveOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SIRINLUSystemGaveOptions;
  v5 = [(SIRINLUSystemGaveOptions *)&v23 init];
  if (v5)
  {
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v22, "setWithObjects:", v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"choices"];
    choices = v5->_choices;
    v5->_choices = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderedText"];
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v17;
  }
  return v5;
}

- (SIRINLUSystemGaveOptions)initWithChoices:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemGaveOptions;
  uint64_t v6 = [(SIRINLUSystemGaveOptions *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_choices, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end