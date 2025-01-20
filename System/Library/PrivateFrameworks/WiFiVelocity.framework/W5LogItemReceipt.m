@interface W5LogItemReceipt
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLogItemReceipt:(id)a3;
- (NSArray)relativeURLs;
- (NSDictionary)info;
- (W5LogItemReceipt)initWithCoder:(id)a3;
- (W5LogItemRequest)request;
- (double)completedAt;
- (double)startedAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedAt:(double)a3;
- (void)setInfo:(id)a3;
- (void)setRelativeURLs:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStartedAt:(double)a3;
@end

@implementation W5LogItemReceipt

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5LogItemReceipt;
  [(W5LogItemReceipt *)&v3 dealloc];
}

- (void)setInfo:(id)a3
{
  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        self->_info = (NSDictionary *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (void)setRelativeURLs:(id)a3
{
  relativeURLs = self->_relativeURLs;
  if (relativeURLs != a3)
  {

    self->_relativeURLs = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        self->_relativeURLs = (NSArray *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Name: %@ (%ld)\n", W5DescriptionForLogItemID(-[W5LogItemRequest itemID](self->_request, "itemID")), -[W5LogItemRequest itemID](self->_request, "itemID")];
  [v3 appendFormat:@"UUID: %@\n", -[NSUUID UUIDString](-[W5LogItemRequest uuid](self->_request, "uuid"), "UUIDString")];
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateStyle:0];
  [v4 setTimeStyle:2];
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"));
  [v3 appendFormat:@"Started: %@\n", objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_startedAt))];
  [v3 appendFormat:@"Completed: %@\n", objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_completedAt))];
  [v3 appendFormat:@"Configuration: %@\n", -[W5LogItemRequest configuration](self->_request, "configuration")];
  [v3 appendFormat:@"Info: %@\n", self->_info];
  [v3 appendFormat:@"URLs: %@\n", self->_relativeURLs];
  v5 = (void *)[v3 copy];
  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5LogItemReceipt;
  if (-[W5LogItemReceipt conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToLogItemReceipt:(id)a3
{
  id v4 = [(W5LogItemRequest *)self->_request uuid];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "request"), "uuid");
  return [(NSUUID *)v4 isEqual:v5];
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
  return [(W5LogItemReceipt *)self isEqualToLogItemReceipt:a3];
}

- (unint64_t)hash
{
  v2 = [(W5LogItemRequest *)self->_request uuid];
  return [(NSUUID *)v2 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5LogItemReceipt allocWithZone:a3] init];
  [(W5LogItemReceipt *)v4 setRequest:self->_request];
  [(W5LogItemReceipt *)v4 setInfo:self->_info];
  [(W5LogItemReceipt *)v4 setRelativeURLs:self->_relativeURLs];
  [(W5LogItemReceipt *)v4 setStartedAt:self->_startedAt];
  [(W5LogItemReceipt *)v4 setCompletedAt:self->_completedAt];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_request forKey:@"_request"];
  [a3 encodeObject:self->_info forKey:@"_info"];
  [a3 encodeObject:self->_relativeURLs forKey:@"_relativeURLs"];
  [a3 encodeDouble:@"_startedAt" forKey:self->_startedAt];
  double completedAt = self->_completedAt;
  [a3 encodeDouble:@"_completedAt" forKey:completedAt];
}

- (W5LogItemReceipt)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)W5LogItemReceipt;
  id v4 = [(W5LogItemReceipt *)&v16 init];
  if (v4)
  {
    v4->_request = (W5LogItemRequest *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_request"), "copy");
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_relativeURLs = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"_relativeURLs"), "copy");
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), @"_info"), "copy");
    [a3 decodeDoubleForKey:@"_startedAt"];
    v4->_startedAt = v13;
    [a3 decodeDoubleForKey:@"_completedAt"];
    v4->_double completedAt = v14;
  }
  return v4;
}

- (W5LogItemRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSArray)relativeURLs
{
  return self->_relativeURLs;
}

- (NSDictionary)info
{
  return self->_info;
}

- (double)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(double)a3
{
  self->_startedAt = a3;
}

- (double)completedAt
{
  return self->_completedAt;
}

- (void)setCompletedAt:(double)a3
{
  self->_double completedAt = a3;
}

@end