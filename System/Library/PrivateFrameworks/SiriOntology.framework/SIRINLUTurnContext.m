@interface SIRINLUTurnContext
+ (BOOL)supportsSecureCoding;
+ (id)createEmptyPlaceholderLegacyNLContext;
+ (id)createEmptyPlaceholderNLContext;
- (SIRINLULegacyNLContext)legacyNLContext;
- (SIRINLULegacyNLContext)legacyNLContextNullable;
- (SIRINLUNLContext)nlContext;
- (SIRINLUNLContext)nlContextNullable;
- (SIRINLUTurnContext)init;
- (SIRINLUTurnContext)initWithCoder:(id)a3;
- (SIRINLUTurnContext)initWithLegacyNLContext:(id)a3;
- (SIRINLUTurnContext)initWithNLContext:(id)a3;
- (SIRINLUTurnContext)initWithNLContext:(id)a3 legacyNLContext:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLegacyNLContext:(id)a3;
- (void)setLegacyNLContextNullable:(id)a3;
- (void)setNlContext:(id)a3;
- (void)setNlContextNullable:(id)a3;
@end

@implementation SIRINLUTurnContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNLContextNullable, 0);
  objc_storeStrong((id *)&self->_nlContextNullable, 0);
  objc_storeStrong((id *)&self->_legacyNLContext, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

- (void)setLegacyNLContextNullable:(id)a3
{
}

- (SIRINLULegacyNLContext)legacyNLContextNullable
{
  return self->_legacyNLContextNullable;
}

- (void)setNlContextNullable:(id)a3
{
}

- (SIRINLUNLContext)nlContextNullable
{
  return self->_nlContextNullable;
}

- (void)setLegacyNLContext:(id)a3
{
}

- (SIRINLULegacyNLContext)legacyNLContext
{
  return self->_legacyNLContext;
}

- (void)setNlContext:(id)a3
{
}

- (SIRINLUNLContext)nlContext
{
  return self->_nlContext;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SIRINLUTurnContext *)self nlContext];
  v5 = [(SIRINLUTurnContext *)self nlContextNullable];
  v6 = [(SIRINLUTurnContext *)self legacyNLContext];
  v7 = [(SIRINLUTurnContext *)self legacyNLContextNullable];
  v8 = [v3 stringWithFormat:@"{TurnContext\n  nlContext: %@\n  nlContextNullable: %@\n  legacyNLContext: %@\n  legacyNLContextNullable: %@\n}", v4, v5, v6, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUTurnContext *)self nlContext];
  [v4 encodeObject:v5 forKey:@"nlContext"];

  v6 = [(SIRINLUTurnContext *)self nlContextNullable];
  [v4 encodeObject:v6 forKey:@"nlContextNullable"];

  v7 = [(SIRINLUTurnContext *)self legacyNLContext];
  [v4 encodeObject:v7 forKey:@"legacyNLContext"];

  id v8 = [(SIRINLUTurnContext *)self legacyNLContextNullable];
  [v4 encodeObject:v8 forKey:@"legacyNLContextNullable"];
}

- (SIRINLUTurnContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUTurnContext;
  v5 = [(SIRINLUTurnContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nlContext"];
    nlContext = v5->_nlContext;
    v5->_nlContext = (SIRINLUNLContext *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nlContextNullable"];
    nlContextNullable = v5->_nlContextNullable;
    v5->_nlContextNullable = (SIRINLUNLContext *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legacyNLContext"];
    legacyNLContext = v5->_legacyNLContext;
    v5->_legacyNLContext = (SIRINLULegacyNLContext *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legacyNLContextNullable"];
    legacyNLContextNullable = v5->_legacyNLContextNullable;
    v5->_legacyNLContextNullable = (SIRINLULegacyNLContext *)v12;
  }
  return v5;
}

- (SIRINLUTurnContext)initWithLegacyNLContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTurnContext;
  uint64_t v6 = [(SIRINLUTurnContext *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() createEmptyPlaceholderNLContext];
    nlContext = v6->_nlContext;
    v6->_nlContext = (SIRINLUNLContext *)v7;

    nlContextNullable = v6->_nlContextNullable;
    v6->_nlContextNullable = 0;

    objc_storeStrong((id *)&v6->_legacyNLContext, a3);
    objc_storeStrong((id *)&v6->_legacyNLContextNullable, a3);
  }

  return v6;
}

- (SIRINLUTurnContext)initWithNLContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUTurnContext;
  uint64_t v6 = [(SIRINLUTurnContext *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nlContext, a3);
    objc_storeStrong((id *)&v7->_nlContextNullable, a3);
    uint64_t v8 = [(id)objc_opt_class() createEmptyPlaceholderLegacyNLContext];
    legacyNLContext = v7->_legacyNLContext;
    v7->_legacyNLContext = (SIRINLULegacyNLContext *)v8;

    legacyNLContextNullable = v7->_legacyNLContextNullable;
    v7->_legacyNLContextNullable = 0;
  }
  return v7;
}

- (SIRINLUTurnContext)initWithNLContext:(id)a3 legacyNLContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUTurnContext;
  v9 = [(SIRINLUTurnContext *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nlContext, a3);
    objc_storeStrong((id *)&v10->_nlContextNullable, a3);
    objc_storeStrong((id *)&v10->_legacyNLContext, a4);
    objc_storeStrong((id *)&v10->_legacyNLContextNullable, a4);
  }

  return v10;
}

- (SIRINLUTurnContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUTurnContext;
  return [(SIRINLUTurnContext *)&v3 init];
}

+ (id)createEmptyPlaceholderLegacyNLContext
{
  v2 = [[SIRINLULegacyNLContext alloc] initWithDictationPrompt:0 strictPrompt:0 previousDomainName:&stru_1F246D8C8 listenAfterSpeaking:0];
  return v2;
}

+ (id)createEmptyPlaceholderNLContext
{
  v2 = [SIRINLUNLContext alloc];
  objc_super v3 = [MEMORY[0x1E4F1C978] array];
  id v4 = [MEMORY[0x1E4F1C978] array];
  id v5 = [MEMORY[0x1E4F1C978] array];
  uint64_t v6 = [(SIRINLUNLContext *)v2 initWithSystemDialogActs:v3 activeTasks:v4 executedTasks:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end