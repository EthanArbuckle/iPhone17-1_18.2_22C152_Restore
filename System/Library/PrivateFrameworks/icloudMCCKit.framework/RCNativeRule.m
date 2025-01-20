@interface RCNativeRule
+ (BOOL)supportsSecureCoding;
- (NSDictionary)messageRef;
- (NSString)category;
- (RCNativeRule)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setMessageRef:(id)a3;
@end

@implementation RCNativeRule

- (void)encodeWithCoder:(id)a3
{
  messageRef = self->_messageRef;
  id v5 = a3;
  [v5 encodeObject:messageRef forKey:@"_messageRef"];
  [v5 encodeObject:self->_category forKey:@"_category"];
}

- (RCNativeRule)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCNativeRule *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_messageRef"];
    messageRef = v5->_messageRef;
    v5->_messageRef = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_category"];
    category = v5->_category;
    v5->_category = (NSString *)v11;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_messageRef copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_category copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)messageRef
{
  return self->_messageRef;
}

- (void)setMessageRef:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_messageRef, 0);
}

@end