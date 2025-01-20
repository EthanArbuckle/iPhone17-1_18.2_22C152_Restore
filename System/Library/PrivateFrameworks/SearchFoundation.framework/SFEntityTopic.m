@interface SFEntityTopic
+ (BOOL)supportsSecureCoding;
- (NSString)identifier;
- (SFEntityTopic)initWithCoder:(id)a3;
- (SFEntityTopic)initWithType:(int)a3 identifier:(id)a4;
- (SFEntityTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SFEntityTopic

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

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFEntityTopic;
  id v4 = a3;
  [(SFQueryTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"_identifier", v5.receiver, v5.super_class);
}

- (SFEntityTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEntityTopic;
  objc_super v5 = [(SFQueryTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFEntityTopic;
  id v4 = [(SFQueryTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFEntityTopic *)self identifier];
  [v4 setIdentifier:v5];

  return v4;
}

- (SFEntityTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SFEntityTopic;
  objc_super v9 = [(SFQueryTopic *)&v12 initWithType:v6 query:a4];
  v10 = v9;
  if (v9) {
    [(SFEntityTopic *)v9 setIdentifier:v8];
  }

  return v10;
}

- (SFEntityTopic)initWithType:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFEntityTopic;
  objc_super v7 = [(SFQueryTopic *)&v10 initWithType:v4 query:v6];
  id v8 = v7;
  if (v7) {
    [(SFEntityTopic *)v7 setIdentifier:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end