@interface RCOverrideRule
+ (BOOL)supportsSecureCoding;
- (NSNumber)categoryUpdateTime;
- (NSString)category;
- (NSString)messageIdHeader;
- (NSString)xAppleRequestHeader;
- (RCAddress)address;
- (RCOverrideRule)initWithCoder:(id)a3;
- (RCOverrideRule)initWithEmailAddress:(id)a3 category:(id)a4 categoryUpdateTime:(double)a5;
- (RCOverrideRule)initWithEmailAddress:(id)a3 displayName:(id)a4 category:(id)a5 categoryUpdateTime:(double)a6;
- (RCOverrideRule)initWithMessageIdHeader:(id)a3 appleRequestHeader:(id)a4 category:(id)a5 categoryUpdateTime:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryUpdateTime:(id)a3;
- (void)setMessageIdHeader:(id)a3;
- (void)setXAppleRequestHeader:(id)a3;
@end

@implementation RCOverrideRule

- (RCOverrideRule)initWithEmailAddress:(id)a3 category:(id)a4 categoryUpdateTime:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RCOverrideRule;
  v11 = [(RCOverrideRule *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_category, a4);
    uint64_t v13 = [NSNumber numberWithDouble:a5];
    categoryUpdateTime = v12->_categoryUpdateTime;
    v12->_categoryUpdateTime = (NSNumber *)v13;

    objc_storeStrong((id *)&v12->_address, a3);
  }

  return v12;
}

- (RCOverrideRule)initWithEmailAddress:(id)a3 displayName:(id)a4 category:(id)a5 categoryUpdateTime:(double)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[RCAddress alloc] initWithAddress:v12 displayName:v11];

  if (v13)
  {
    self = [(RCOverrideRule *)self initWithEmailAddress:v13 category:v10 categoryUpdateTime:a6];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (RCOverrideRule)initWithMessageIdHeader:(id)a3 appleRequestHeader:(id)a4 category:(id)a5 categoryUpdateTime:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RCOverrideRule;
  v14 = [(RCOverrideRule *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_category, a5);
    uint64_t v16 = [NSNumber numberWithDouble:a6];
    categoryUpdateTime = v15->_categoryUpdateTime;
    v15->_categoryUpdateTime = (NSNumber *)v16;

    address = v15->_address;
    v15->_address = 0;

    objc_storeStrong((id *)&v15->_messageIdHeader, a3);
    objc_storeStrong((id *)&v15->_xAppleRequestHeader, a4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)[(NSString *)self->_category copy];
  [v4 setCategory:v5];

  v6 = (void *)[(NSNumber *)self->_categoryUpdateTime copy];
  [v4 setCategoryUpdateTime:v6];

  v7 = (void *)[(RCAddress *)self->_address copy];
  [v4 setAddress:v7];

  [v4 setXAppleRequestHeader:self->_xAppleRequestHeader];
  [v4 setMessageIdHeader:self->_messageIdHeader];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v5 = a3;
  [v5 encodeObject:address forKey:@"_address"];
  [v5 encodeObject:self->_category forKey:@"_category"];
  [v5 encodeObject:self->_categoryUpdateTime forKey:@"_categoryUpdateTime"];
  [v5 encodeObject:self->_xAppleRequestHeader forKey:@"_appleRequestHeader"];
  [v5 encodeObject:self->_messageIdHeader forKey:@"_messageIdHeader"];
}

- (RCOverrideRule)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCOverrideRule *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_address"];
    address = v5->_address;
    v5->_address = (RCAddress *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_category"];
    category = v5->_category;
    v5->_category = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_categoryUpdateTime"];
    categoryUpdateTime = v5->_categoryUpdateTime;
    v5->_categoryUpdateTime = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appleRequestHeader"];
    xAppleRequestHeader = v5->_xAppleRequestHeader;
    v5->_xAppleRequestHeader = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_messageIdHeader"];
    messageIdHeader = v5->_messageIdHeader;
    v5->_messageIdHeader = (NSString *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(RCAddress *)self->_address displayName];
  v7 = [(RCAddress *)self->_address emailAddress];
  long long v12 = *(_OWORD *)&self->_xAppleRequestHeader;
  category = self->_category;
  id v9 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)-[NSNumber longLongValue](self->_categoryUpdateTime, "longLongValue"));
  uint64_t v10 = [v3 stringWithFormat:@"[%@ email:%@<%@> uuid:%@ msgId:%@ cat:%@ lastmod:%@]", v5, v6, v7, v12, category, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)categoryUpdateTime
{
  return self->_categoryUpdateTime;
}

- (void)setCategoryUpdateTime:(id)a3
{
}

- (RCAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)xAppleRequestHeader
{
  return self->_xAppleRequestHeader;
}

- (void)setXAppleRequestHeader:(id)a3
{
}

- (NSString)messageIdHeader
{
  return self->_messageIdHeader;
}

- (void)setMessageIdHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdHeader, 0);
  objc_storeStrong((id *)&self->_xAppleRequestHeader, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_categoryUpdateTime, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end