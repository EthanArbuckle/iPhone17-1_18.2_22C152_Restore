@interface FCNewsletter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCNewsletter)init;
- (FCNewsletter)initWithCoder:(id)a3;
- (FCNewsletter)initWithIdentifier:(id)a3 enrollment:(int64_t)a4;
- (NSString)identifier;
- (id)description;
- (int64_t)enrollment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCNewsletter

- (FCNewsletter)init
{
  return [(FCNewsletter *)self initWithIdentifier:0 enrollment:0];
}

- (FCNewsletter)initWithIdentifier:(id)a3 enrollment:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCNewsletter;
  v8 = [(FCNewsletter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_enrollment = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [(FCNewsletter *)self identifier];
    v8 = [v6 identifier];
    if (v7 == v8)
    {
      int64_t v10 = [(FCNewsletter *)self enrollment];
      BOOL v9 = v10 == [v6 enrollment];
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
  v3 = [(FCNewsletter *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCNewsletter enrollment](self, "enrollment"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(FCNewsletter *)self identifier];
  v5 = [v3 stringWithFormat:@"<FCNewsletter: identifier=%@, enrollment=%ld>", v4, -[FCNewsletter enrollment](self, "enrollment")];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FCNewsletter *)self identifier];

  if (v4)
  {
    v5 = [(FCNewsletter *)self identifier];
    [v9 encodeObject:v5 forKey:@"identifier"];
  }
  if ([(FCNewsletter *)self enrollment])
  {
    int64_t v6 = [(FCNewsletter *)self enrollment];
    id v7 = @"UNKNOWN";
    if (v6 == 2) {
      id v7 = @"SUBSCRIBED";
    }
    if (v6 == 1) {
      v8 = @"UNSUBSCRIBED";
    }
    else {
      v8 = v7;
    }
    [v9 encodeObject:v8 forKey:@"enrollment"];
  }
}

- (FCNewsletter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enrollment"];

  if ([v6 isEqualToString:@"UNSUBSCRIBED"])
  {
    uint64_t v7 = 1;
  }
  else if ([v6 isEqualToString:@"SUBSCRIBED"])
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [(FCNewsletter *)self initWithIdentifier:v5 enrollment:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)enrollment
{
  return self->_enrollment;
}

- (void).cxx_destruct
{
}

@end