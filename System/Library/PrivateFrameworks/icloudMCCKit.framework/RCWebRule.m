@interface RCWebRule
+ (BOOL)supportsSecureCoding;
- (NSDictionary)sender;
- (NSNumber)lastModifiedDate;
- (NSString)category;
- (RCWebRule)initWithCoder:(id)a3;
- (RCWebRule)initWithSender:(id)a3 category:(id)a4 lastModified:(double)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation RCWebRule

- (RCWebRule)initWithSender:(id)a3 category:(id)a4 lastModified:(double)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RCWebRule;
  v10 = [(RCWebRule *)&v18 init];
  if (v10)
  {
    v19 = @"email";
    v20[0] = v8;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    sender = v10->_sender;
    v10->_sender = (NSDictionary *)v11;

    uint64_t v13 = [NSNumber numberWithDouble:a5];
    lastModifiedDate = v10->_lastModifiedDate;
    v10->_lastModifiedDate = (NSNumber *)v13;

    category = v10->_category;
    v10->_category = (NSString *)@"others";

    v16 = [v9 lowercaseString];
    if ([&unk_270E0D588 containsObject:v16])
    {
      objc_storeStrong((id *)&v10->_category, v16);
    }
    else
    {

      v10 = 0;
    }
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  sender = self->_sender;
  id v5 = a3;
  [v5 encodeObject:sender forKey:@"_sender"];
  [v5 encodeObject:self->_category forKey:@"_category"];
  [v5 encodeObject:self->_lastModifiedDate forKey:@"_lastModifiedDate"];
}

- (RCWebRule)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCWebRule *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_sender"];
    sender = v5->_sender;
    v5->_sender = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_category"];
    category = v5->_category;
    v5->_category = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastModifiedDate"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSNumber *)v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_sender copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_category copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSNumber *)self->_lastModifiedDate copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"WebRule:{%@,%@}", self->_sender, self->_category];
}

- (NSDictionary)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end