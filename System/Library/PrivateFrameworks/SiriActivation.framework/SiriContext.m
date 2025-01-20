@interface SiriContext
+ (BOOL)supportsSecureCoding;
- (AFSpeechRequestOptions)speechRequestOptions;
- (SiriContext)initWithCoder:(id)a3;
- (SiriContext)initWithContextOverride:(id)a3;
- (SiriContext)initWithSpeechRequestOptions:(id)a3;
- (SiriContextOverride)contextOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContextOverride:(id)a3;
@end

@implementation SiriContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextOverride, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
}

- (SiriContext)initWithSpeechRequestOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriContext;
  v6 = [(SiriContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_speechRequestOptions, a3);
  }

  return v7;
}

- (SiriContext)initWithContextOverride:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriContext;
  id v5 = [(SiriContext *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SiriContext *)v5 setContextOverride:v4];
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SiriContext *)self contextOverride];
  id v5 = [(SiriContext *)self speechRequestOptions];
  v6 = [v3 stringWithFormat:@"<SiriContext contextOverride:%@ speechRequestOptions:%@>", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SiriContext alloc];
  id v5 = [(SiriContext *)self speechRequestOptions];
  v6 = [(SiriContext *)v4 initWithSpeechRequestOptions:v5];

  v7 = [(SiriContext *)self contextOverride];
  [(SiriContext *)v6 setContextOverride:v7];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriContext;
  id v5 = [(SiriContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speechRequestOptions"];
    speechRequestOptions = v5->_speechRequestOptions;
    v5->_speechRequestOptions = (AFSpeechRequestOptions *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextOverride"];
    contextOverride = v5->_contextOverride;
    v5->_contextOverride = (SiriContextOverride *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriContext *)self speechRequestOptions];
  [v4 encodeObject:v5 forKey:@"speechRequestOptions"];

  id v6 = [(SiriContext *)self contextOverride];
  [v4 encodeObject:v6 forKey:@"contextOverride"];
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (SiriContextOverride)contextOverride
{
  return self->_contextOverride;
}

- (void)setContextOverride:(id)a3
{
}

@end