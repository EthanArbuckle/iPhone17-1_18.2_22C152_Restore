@interface SFQueryTopic
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)query;
- (SFQueryTopic)initWithCoder:(id)a3;
- (SFQueryTopic)initWithType:(int)a3 query:(id)a4;
- (SFQueryTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int)queryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryType:(int)a3;
@end

@implementation SFQueryTopic

- (void).cxx_destruct
{
}

- (void)setQueryType:(int)a3
{
  self->_queryType = a3;
}

- (int)queryType
{
  return self->_queryType;
}

- (void)setQuery:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)SFQueryTopic;
  v3 = [(SFTopic *)&v10 description];
  v4 = NSString;
  uint64_t v5 = [(SFQueryTopic *)self queryType];
  v6 = [(SFQueryTopic *)self query];
  v7 = [v4 stringWithFormat:@" queryType: %d queryString: %@", v5, v6];
  v8 = [v3 stringByAppendingString:v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFQueryTopic;
  if ([(SFTopic *)&v11 isEqual:v4])
  {
    id v5 = v4;
    v6 = [(SFQueryTopic *)self query];
    v7 = [v5 query];
    if ([v6 isEqual:v7])
    {
      int v8 = [(SFQueryTopic *)self queryType];
      BOOL v9 = v8 == [v5 queryType];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFQueryTopic;
  unint64_t v3 = [(SFTopic *)&v8 hash];
  id v4 = [(SFQueryTopic *)self query];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFQueryTopic *)self queryType] ^ v3;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFQueryTopic;
  id v4 = a3;
  [(SFTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, @"_query", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_queryType forKey:@"_queryType"];
}

- (SFQueryTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFQueryTopic;
  objc_super v5 = [(SFTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_query"];
    query = v5->_query;
    v5->_query = (NSString *)v6;

    v5->_queryType = [v4 decodeInt32ForKey:@"_queryType"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFQueryTopic;
  id v4 = [(SFTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFQueryTopic *)self query];
  [v4 setQuery:v5];

  objc_msgSend(v4, "setQueryType:", -[SFQueryTopic queryType](self, "queryType"));
  return v4;
}

- (SFQueryTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFQueryTopic;
  objc_super v9 = [(SFTopic *)&v12 initWithIdentifier:a5];
  objc_super v10 = v9;
  if (v9)
  {
    [(SFQueryTopic *)v9 setQueryType:v6];
    [(SFQueryTopic *)v10 setQuery:v8];
  }

  return v10;
}

- (SFQueryTopic)initWithType:(int)a3 query:(id)a4
{
  return [(SFQueryTopic *)self initWithType:*(void *)&a3 query:a4 identifier:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end