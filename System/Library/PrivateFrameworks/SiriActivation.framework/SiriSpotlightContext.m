@interface SiriSpotlightContext
+ (BOOL)supportsSecureCoding;
- (NSString)utteranceText;
- (SiriSpotlightContext)initWithCoder:(id)a3;
- (id)description;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setUtteranceText:(id)a3;
@end

@implementation SiriSpotlightContext

- (id)description
{
  v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  v5 = [(SiriSpotlightContext *)self utteranceText];
  v6 = objc_msgSend(NSString, "stringWithSiriSpotlightContextSource:", -[SiriSpotlightContext source](self, "source"));
  v7 = [v3 stringWithFormat:@"<SiriLongPressButtonContext contextOverride:%@, utteranceText:%@, source:%@>", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriSpotlightContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSpotlightContext;
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

    v5->_source = [v4 decodeIntegerForKey:@"source"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSpotlightContext;
  id v4 = a3;
  [(SiriContext *)&v6 encodeWithCoder:v4];
  v5 = [(SiriSpotlightContext *)self utteranceText];
  [v4 encodeObject:v5 forKey:@"utteranceText"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriSpotlightContext source](self, "source"), @"source");
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end