@interface SIRINLULegacyNLContext
+ (BOOL)supportsSecureCoding;
- (BOOL)dictationPrompt;
- (BOOL)fromPommes;
- (BOOL)listenAfterSpeaking;
- (BOOL)strictPrompt;
- (NSArray)renderedTexts;
- (NSString)previousDomainName;
- (SIRINLULegacyNLContext)initWithCoder:(id)a3;
- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6;
- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7;
- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7 legacyContextSource:(int)a8;
- (id)description;
- (int)legacyContextSource;
- (void)encodeWithCoder:(id)a3;
- (void)setDictationPrompt:(BOOL)a3;
- (void)setFromPommes:(BOOL)a3;
- (void)setLegacyContextSource:(int)a3;
- (void)setListenAfterSpeaking:(BOOL)a3;
- (void)setPreviousDomainName:(id)a3;
- (void)setRenderedTexts:(id)a3;
- (void)setStrictPrompt:(BOOL)a3;
@end

@implementation SIRINLULegacyNLContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedTexts, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

- (void)setLegacyContextSource:(int)a3
{
  self->_legacyContextSource = a3;
}

- (int)legacyContextSource
{
  return self->_legacyContextSource;
}

- (void)setFromPommes:(BOOL)a3
{
  self->_fromPommes = a3;
}

- (BOOL)fromPommes
{
  return self->_fromPommes;
}

- (void)setRenderedTexts:(id)a3
{
}

- (NSArray)renderedTexts
{
  return self->_renderedTexts;
}

- (void)setListenAfterSpeaking:(BOOL)a3
{
  self->_listenAfterSpeaking = a3;
}

- (BOOL)listenAfterSpeaking
{
  return self->_listenAfterSpeaking;
}

- (void)setPreviousDomainName:(id)a3
{
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (void)setStrictPrompt:(BOOL)a3
{
  self->_strictPrompt = a3;
}

- (BOOL)strictPrompt
{
  return self->_strictPrompt;
}

- (void)setDictationPrompt:(BOOL)a3
{
  self->_dictationPrompt = a3;
}

- (BOOL)dictationPrompt
{
  return self->_dictationPrompt;
}

- (id)description
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%i", -[SIRINLULegacyNLContext dictationPrompt](self, "dictationPrompt"));
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%i", -[SIRINLULegacyNLContext strictPrompt](self, "strictPrompt"));
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%i", -[SIRINLULegacyNLContext listenAfterSpeaking](self, "listenAfterSpeaking"));
  v6 = [(SIRINLULegacyNLContext *)self renderedTexts];
  v7 = +[SIRINLUPrintUtils indentArray:v6 numSpaces:4];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[SIRINLULegacyNLContext legacyContextSource](self, "legacyContextSource"));
  v9 = NSString;
  v10 = [(SIRINLULegacyNLContext *)self previousDomainName];
  v11 = [v9 stringWithFormat:@"{LegacyNLContext\n  dictationPrompt: %@\n  strictPrompt: %@\n  previousDomainName: %@\n  listenAfterSpeaking: %@\n  renderedTexts:\n%@\n  legacyContextSource: %@\n}", v3, v4, v10, v5, v7, v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  BOOL dictationPrompt = self->_dictationPrompt;
  id v6 = a3;
  id v11 = [v4 numberWithBool:dictationPrompt];
  [v6 encodeObject:v11 forKey:@"dictationPrompt"];
  v7 = [NSNumber numberWithBool:self->_strictPrompt];
  [v6 encodeObject:v7 forKey:@"strictPrompt"];
  v8 = [(SIRINLULegacyNLContext *)self previousDomainName];
  [v6 encodeObject:v8 forKey:@"previousDomainName"];

  v9 = [NSNumber numberWithBool:self->_listenAfterSpeaking];
  [v6 encodeObject:v9 forKey:@"listenAfterSpeaking"];
  v10 = [(SIRINLULegacyNLContext *)self renderedTexts];
  [v6 encodeObject:v10 forKey:@"renderedTexts"];

  objc_msgSend(v6, "encodeInt:forKey:", -[SIRINLULegacyNLContext legacyContextSource](self, "legacyContextSource"), @"legacyContextSource");
}

- (SIRINLULegacyNLContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIRINLULegacyNLContext;
  v5 = [(SIRINLULegacyNLContext *)&v17 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dictationPrompt"];
    v5->_BOOL dictationPrompt = [v6 BOOLValue];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strictPrompt"];
    v5->_strictPrompt = [v7 BOOLValue];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousDomainName"];
    previousDomainName = v5->_previousDomainName;
    v5->_previousDomainName = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listenAfterSpeaking"];
    v5->_listenAfterSpeaking = [v10 BOOLValue];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"renderedTexts"];
    renderedTexts = v5->_renderedTexts;
    v5->_renderedTexts = (NSArray *)v14;

    v5->_legacyContextSource = [v4 decodeIntForKey:@"legacyContextSource"];
  }

  return v5;
}

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7 legacyContextSource:(int)a8
{
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SIRINLULegacyNLContext;
  objc_super v17 = [(SIRINLULegacyNLContext *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_BOOL dictationPrompt = a3;
    v17->_strictPrompt = a4;
    objc_storeStrong((id *)&v17->_previousDomainName, a5);
    v18->_listenAfterSpeaking = a6;
    objc_storeStrong((id *)&v18->_renderedTexts, a7);
    v18->_legacyContextSource = a8;
  }

  return v18;
}

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7
{
  return [(SIRINLULegacyNLContext *)self initWithDictationPrompt:a3 strictPrompt:a4 previousDomainName:a5 listenAfterSpeaking:a6 renderedTexts:a7 legacyContextSource:0];
}

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6
{
  return [(SIRINLULegacyNLContext *)self initWithDictationPrompt:a3 strictPrompt:a4 previousDomainName:a5 listenAfterSpeaking:a6 renderedTexts:0 legacyContextSource:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end