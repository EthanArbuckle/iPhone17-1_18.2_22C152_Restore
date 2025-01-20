@interface SFTopic
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SFTopic)initWithCoder:(id)a3;
- (SFTopic)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SFTopic

- (void).cxx_destruct
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(SFTopic *)self identifier];
  v4 = [v2 stringWithFormat:@"queryID: %@", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    v8 = [(SFTopic *)self identifier];
    v9 = [v7 identifier];

    char v6 = [v8 isEqual:v9];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(SFTopic *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SFTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFTopic;
  uint64_t v5 = [(SFTopic *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (SFTopic)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFTopic;
  uint64_t v5 = [(SFTopic *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(SFTopic *)v5 setIdentifier:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(SFTopic *)self identifier];
  [v4 setIdentifier:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end