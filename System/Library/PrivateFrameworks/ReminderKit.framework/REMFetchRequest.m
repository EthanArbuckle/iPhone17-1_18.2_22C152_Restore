@interface REMFetchRequest
+ (BOOL)supportsSecureCoding;
- (REMFetchRequest)fetchRequestWithFetchResultToken:(id)a3;
- (REMFetchRequest)initWithCoder:(id)a3;
- (REMFetchRequest)initWithFetchExecutor:(id)a3;
- (REMFetchResultToken)fetchResultToken;
- (_REMFetchExecutor)fetchExecutor;
- (id)copyWithType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countOnlyFetchRequest;
- (id)description;
- (id)metadataFetchRequest;
- (id)objectIDsOnlyFetchRequest;
- (id)storagesAndParentFetchRequest;
- (id)storagesOnlyFetchRequest;
- (int64_t)type;
- (unint64_t)fetchLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchExecutor:(id)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setFetchResultToken:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation REMFetchRequest

- (REMFetchRequest)initWithFetchExecutor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFetchRequest;
  v6 = [(REMFetchRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_fetchExecutor, a3);
    v7->_fetchLimit = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)storagesAndParentFetchRequest
{
  id v2 = [(REMFetchRequest *)self copyWithType:0];

  return v2;
}

- (id)storagesOnlyFetchRequest
{
  id v2 = [(REMFetchRequest *)self copyWithType:1];

  return v2;
}

- (id)countOnlyFetchRequest
{
  id v2 = [(REMFetchRequest *)self copyWithType:2];

  return v2;
}

- (id)objectIDsOnlyFetchRequest
{
  id v2 = [(REMFetchRequest *)self copyWithType:3];

  return v2;
}

- (id)metadataFetchRequest
{
  id v2 = [(REMFetchRequest *)self copyWithType:4];

  return v2;
}

- (REMFetchRequest)fetchRequestWithFetchResultToken:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(REMFetchRequest *)self copy];
  [v5 setFetchResultToken:v4];

  return (REMFetchRequest *)v5;
}

- (id)copyWithType:(int64_t)a3
{
  id v4 = (void *)[(REMFetchRequest *)self copy];
  [v4 setType:a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMFetchRequest alloc];
  id v5 = [(REMFetchRequest *)self fetchExecutor];
  v6 = [(REMFetchRequest *)v4 initWithFetchExecutor:v5];

  [(REMFetchRequest *)v6 setType:[(REMFetchRequest *)self type]];
  [(REMFetchRequest *)v6 setFetchLimit:[(REMFetchRequest *)self fetchLimit]];
  v7 = [(REMFetchRequest *)self fetchResultToken];
  [(REMFetchRequest *)v6 setFetchResultToken:v7];

  return v6;
}

- (REMFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchExecutor"];
  v6 = [(REMFetchRequest *)self initWithFetchExecutor:v5];

  if (v6)
  {
    unint64_t v7 = [v4 decodeIntegerForKey:@"type"];
    if (v7 >= 5)
    {
      v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[REMFetchResult initWithCoder:](v7, v8);
      }

      unint64_t v7 = 2;
    }
    v6->_type = v7;
    v6->_fetchLimit = [v4 decodeIntegerForKey:@"fetchLimit"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchResultToken"];
    fetchResultToken = v6->_fetchResultToken;
    v6->_fetchResultToken = (REMFetchResultToken *)v9;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchRequest type](self, "type"), @"type");
  id v5 = [(REMFetchRequest *)self fetchExecutor];
  [v4 encodeObject:v5 forKey:@"fetchExecutor"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchRequest fetchLimit](self, "fetchLimit"), @"fetchLimit");
  id v6 = [(REMFetchRequest *)self fetchResultToken];
  [v4 encodeObject:v6 forKey:@"fetchResultToken"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(REMFetchRequest *)self fetchResultToken];

  if (v4)
  {
    id v5 = NSString;
    id v6 = [(REMFetchRequest *)self fetchResultToken];
    unint64_t v7 = [v5 stringWithFormat:@"fetchResultToken: %@", v6];

    [v3 addObject:v7];
  }
  else
  {
    unint64_t v7 = &stru_1F1339A18;
  }
  v8 = [v3 componentsJoinedByString:@", "];
  if ([v8 length])
  {
    uint64_t v9 = objc_msgSend(@", ", "stringByAppendingString:", v8);

    v8 = (void *)v9;
  }
  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromREMFetchRequestType([(REMFetchRequest *)self type]);
  v13 = [(REMFetchRequest *)self fetchExecutor];
  v14 = [v10 stringWithFormat:@"<%@: %p type: %@, executor:%@%@>", v11, self, v12, v13, v8];

  return v14;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (_REMFetchExecutor)fetchExecutor
{
  return self->_fetchExecutor;
}

- (void)setFetchExecutor:(id)a3
{
}

- (REMFetchResultToken)fetchResultToken
{
  return self->_fetchResultToken;
}

- (void)setFetchResultToken:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultToken, 0);

  objc_storeStrong((id *)&self->_fetchExecutor, 0);
}

@end