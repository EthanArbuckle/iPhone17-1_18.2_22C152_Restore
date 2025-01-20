@interface SIRINLUSystemOffered
+ (BOOL)supportsSecureCoding;
- (NSString)renderedText;
- (SIRINLUSystemOffered)initWithCoder:(id)a3;
- (SIRINLUSystemOffered)initWithOfferedAct:(id)a3;
- (SIRINLUUserDialogAct)offeredAct;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOfferedAct:(id)a3;
- (void)setRenderedText:(id)a3;
@end

@implementation SIRINLUSystemOffered

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offeredAct, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

- (void)setOfferedAct:(id)a3
{
}

- (SIRINLUUserDialogAct)offeredAct
{
  return self->_offeredAct;
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
  v3 = [(SIRINLUSystemOffered *)self offeredAct];
  v4 = [v3 description];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = NSString;
  v7 = [(SIRINLUSystemOffered *)self renderedText];
  v8 = [v6 stringWithFormat:@"{SystemOffered\n  offeredAct:\n%@  renderedText: %@\n}", v5, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUSystemOffered *)self offeredAct];
  [v4 encodeObject:v5 forKey:@"offeredAct"];

  id v6 = [(SIRINLUSystemOffered *)self renderedText];
  [v4 encodeObject:v6 forKey:@"renderedText"];
}

- (SIRINLUSystemOffered)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SIRINLUSystemOffered;
  v5 = [(SIRINLUSystemOffered *)&v21 init];
  if (v5)
  {
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v20, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"offeredAct"];
    offeredAct = v5->_offeredAct;
    v5->_offeredAct = (SIRINLUUserDialogAct *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderedText"];
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v17;
  }
  return v5;
}

- (SIRINLUSystemOffered)initWithOfferedAct:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemOffered;
  uint64_t v6 = [(SIRINLUSystemOffered *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_offeredAct, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end