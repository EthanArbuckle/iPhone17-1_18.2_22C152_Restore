@interface SFLocalTopic
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (SFLocalTopic)initWithCoder:(id)a3;
- (SFLocalTopic)initWithIdentifier:(id)a3;
- (SFLocalTopic)initWithResult:(id)a3;
- (SFLocalTopic)initWithResult:(id)a3 identifier:(id)a4;
- (SFSearchResult)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)normalizedTopic;
- (void)encodeWithCoder:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation SFLocalTopic

- (void).cxx_destruct
{
}

- (void)setResult:(id)a3
{
}

- (SFSearchResult)result
{
  return self->_result;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)SFLocalTopic;
  v3 = [(SFTopic *)&v9 description];
  v4 = NSString;
  v5 = [(SFLocalTopic *)self result];
  v6 = [v4 stringWithFormat:@" result: %@", v5];
  v7 = [v3 stringByAppendingString:v6];

  return (NSString *)v7;
}

- (id)normalizedTopic
{
  if (self->_result)
  {
    v3 = [SFLocalTopic alloc];
    v4 = [(SFTopic *)self identifier];
    v5 = [(SFLocalTopic *)v3 initWithIdentifier:v4];
  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFLocalTopic;
  id v4 = a3;
  [(SFTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, @"_result", v5.receiver, v5.super_class);
}

- (SFLocalTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFLocalTopic;
  objc_super v5 = [(SFTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_result"];
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFLocalTopic;
  id v4 = [(SFTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFLocalTopic *)self result];
  [v4 setResult:v5];

  return v4;
}

- (SFLocalTopic)initWithResult:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLocalTopic;
  objc_super v7 = [(SFTopic *)&v10 initWithIdentifier:a4];
  v8 = v7;
  if (v7) {
    [(SFLocalTopic *)v7 setResult:v6];
  }

  return v8;
}

- (SFLocalTopic)initWithResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFLocalTopic;
  objc_super v5 = [(SFLocalTopic *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(SFLocalTopic *)v5 setResult:v4];
  }

  return v6;
}

- (SFLocalTopic)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFLocalTopic;
  return [(SFTopic *)&v4 initWithIdentifier:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end