@interface W5LogItemRequest
+ (BOOL)supportsSecureCoding;
+ (W5LogItemRequest)requestWithItemID:(int64_t)a3 configuration:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLogItemRequest:(id)a3;
- (NSDictionary)configuration;
- (NSUUID)uuid;
- (W5LogItemRequest)init;
- (W5LogItemRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)itemID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setItemID:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5LogItemRequest

- (W5LogItemRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)W5LogItemRequest;
  v2 = [(W5LogItemRequest *)&v4 init];
  if (v2) {
    v2->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "copy");
  }
  return v2;
}

+ (W5LogItemRequest)requestWithItemID:(int64_t)a3 configuration:(id)a4
{
  v6 = objc_alloc_init(W5LogItemRequest);
  [(W5LogItemRequest *)v6 setItemID:a3];
  [(W5LogItemRequest *)v6 setConfiguration:a4];
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5LogItemRequest;
  [(W5LogItemRequest *)&v3 dealloc];
}

- (void)setConfiguration:(id)a3
{
  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v16 = (void *)MEMORY[0x263F08928];
        v8 = (void *)MEMORY[0x263EFFA08];
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        self->_configuration = (NSDictionary *)(id)objc_msgSend(v16, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Name: %@ (%ld)\n", W5DescriptionForLogItemID(self->_itemID), self->_itemID];
  [v3 appendFormat:@"Configuration: %@\n", self->_configuration];
  objc_super v4 = (void *)[v3 copy];
  return v4;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5LogItemRequest;
  if (-[W5LogItemRequest conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToLogItemRequest:(id)a3
{
  uuid = self->_uuid;
  uint64_t v4 = [a3 uuid];
  return [(NSUUID *)uuid isEqual:v4];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5LogItemRequest *)self isEqualToLogItemRequest:a3];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5LogItemRequest allocWithZone:a3] init];
  [(W5LogItemRequest *)v4 setItemID:self->_itemID];
  [(W5LogItemRequest *)v4 setConfiguration:self->_configuration];
  [(W5LogItemRequest *)v4 setUuid:self->_uuid];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_itemID forKey:@"_itemID"];
  [a3 encodeObject:self->_configuration forKey:@"_configuration"];
  uuid = self->_uuid;
  [a3 encodeObject:uuid forKey:@"_uuid"];
}

- (W5LogItemRequest)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)W5LogItemRequest;
  uint64_t v4 = [(W5LogItemRequest *)&v14 init];
  if (v4)
  {
    v4->_itemID = [a3 decodeIntegerForKey:@"_itemID"];
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), @"_configuration"), "copy");
    v4->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_uuid"), "copy");
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(int64_t)a3
{
  self->_itemID = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

@end