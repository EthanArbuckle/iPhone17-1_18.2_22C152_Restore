@interface SFSportsTopic
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)requestedEntityType;
- (SFSportsTopic)initWithCoder:(id)a3;
- (SFSportsTopic)initWithQuery:(id)a3 requestedEntityType:(id)a4 identifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestedEntityType:(id)a3;
@end

@implementation SFSportsTopic

- (void).cxx_destruct
{
}

- (void)setRequestedEntityType:(id)a3
{
}

- (NSString)requestedEntityType
{
  return self->_requestedEntityType;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)SFSportsTopic;
  v3 = [(SFQueryTopic *)&v9 description];
  v4 = NSString;
  v5 = [(SFSportsTopic *)self requestedEntityType];
  v6 = [v4 stringWithFormat:@" requestedEntityType: %@", v5];
  v7 = [v3 stringByAppendingString:v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSportsTopic;
  if ([(SFQueryTopic *)&v10 isEqual:v4])
  {
    id v5 = v4;
    v6 = [(SFSportsTopic *)self requestedEntityType];
    v7 = [v5 requestedEntityType];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFSportsTopic;
  unint64_t v3 = [(SFQueryTopic *)&v7 hash];
  id v4 = [(SFSportsTopic *)self requestedEntityType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSportsTopic;
  id v4 = a3;
  [(SFQueryTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedEntityType, @"_requestedEntityType", v5.receiver, v5.super_class);
}

- (SFSportsTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSportsTopic;
  objc_super v5 = [(SFQueryTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestedEntityType"];
    requestedEntityType = v5->_requestedEntityType;
    v5->_requestedEntityType = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFSportsTopic;
  id v4 = [(SFQueryTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFSportsTopic *)self requestedEntityType];
  [v4 setRequestedEntityType:v5];

  return v4;
}

- (SFSportsTopic)initWithQuery:(id)a3 requestedEntityType:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFSportsTopic;
  objc_super v9 = [(SFQueryTopic *)&v12 initWithType:3 query:a3 identifier:a5];
  objc_super v10 = v9;
  if (v9) {
    [(SFSportsTopic *)v9 setRequestedEntityType:v8];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end