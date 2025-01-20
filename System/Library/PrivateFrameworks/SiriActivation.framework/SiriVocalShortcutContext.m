@interface SiriVocalShortcutContext
+ (BOOL)supportsSecureCoding;
- (NSString)utteranceText;
- (SiriVocalShortcutContext)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUtteranceText:(id)a3;
@end

@implementation SiriVocalShortcutContext

- (id)description
{
  v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  v5 = [(SiriVocalShortcutContext *)self utteranceText];
  v6 = [v3 stringWithFormat:@"<SiriVocalShortcutContext contextOverride:%@, utteranceText:%@>", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriVocalShortcutContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriVocalShortcutContext;
  v5 = [(SiriContext *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"utteranceText"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F336E7E8;
    }
    objc_storeStrong((id *)&v5->_utteranceText, v8);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriVocalShortcutContext;
  id v4 = a3;
  [(SiriContext *)&v6 encodeWithCoder:v4];
  v5 = [(SiriVocalShortcutContext *)self utteranceText];
  [v4 encodeObject:v5 forKey:@"utteranceText"];
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end