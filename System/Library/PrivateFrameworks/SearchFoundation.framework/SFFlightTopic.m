@interface SFFlightTopic
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (SFFlightTopic)initWithCoder:(id)a3;
- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4;
- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4 identifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation SFFlightTopic

- (void).cxx_destruct
{
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)SFFlightTopic;
  v3 = [(SFQueryTopic *)&v9 description];
  v4 = NSString;
  v5 = [(SFFlightTopic *)self date];
  v6 = [v4 stringWithFormat:@" date: %@", v5];
  v7 = [v3 stringByAppendingString:v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFlightTopic;
  if ([(SFQueryTopic *)&v10 isEqual:v4])
  {
    id v5 = v4;
    v6 = [(SFFlightTopic *)self date];
    v7 = [v5 date];

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
  v5.receiver = self;
  v5.super_class = (Class)SFFlightTopic;
  unint64_t v3 = [(SFQueryTopic *)&v5 hash];
  return [(NSDate *)self->_date hash] ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFFlightTopic;
  id v4 = a3;
  [(SFQueryTopic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, @"_date", v5.receiver, v5.super_class);
}

- (SFFlightTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFFlightTopic;
  objc_super v5 = [(SFQueryTopic *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFFlightTopic;
  id v4 = [(SFQueryTopic *)&v7 copyWithZone:a3];
  objc_super v5 = [(SFFlightTopic *)self date];
  [v4 setDate:v5];

  return v4;
}

- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4
{
  return [(SFFlightTopic *)self initWithQuery:a3 date:a4 identifier:a3];
}

- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFFlightTopic;
  objc_super v9 = [(SFQueryTopic *)&v12 initWithType:5 query:a3 identifier:a5];
  objc_super v10 = v9;
  if (v9) {
    [(SFFlightTopic *)v9 setDate:v8];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end