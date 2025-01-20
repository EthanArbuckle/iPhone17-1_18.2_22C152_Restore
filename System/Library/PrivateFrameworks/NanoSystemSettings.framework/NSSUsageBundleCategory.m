@interface NSSUsageBundleCategory
+ (BOOL)supportsSecureCoding;
- (NSSUsageBundleCategory)initWithCoder:(id)a3;
- (NSString)name;
- (id)description;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation NSSUsageBundleCategory

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSSUsageBundleCategory: %p; name: \"%@\", size: \"%llu\">",
               self,
               self->_name,
               self->_size);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInt64:self->_size forKey:@"size"];
}

- (NSSUsageBundleCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSUsageBundleCategory;
  id v5 = [(NSSUsageBundleCategory *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_size = [v4 decodeInt64ForKey:@"size"];
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end