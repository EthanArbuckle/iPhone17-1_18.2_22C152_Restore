@interface MOContextDimension
+ (BOOL)supportsSecureCoding;
+ (id)fromBiome:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOContextDimension)initWithCoder:(id)a3;
- (MOContextDimension)initWithName:(id)a3;
- (NSArray)queries;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setQueries:(id)a3;
@end

@implementation MOContextDimension

+ (id)fromBiome:(id)a3
{
  id v3 = a3;
  v4 = [MOContextDimension alloc];
  v5 = [v3 name];

  v6 = [(MOContextDimension *)v4 initWithName:v5];
  return v6;
}

- (MOContextDimension)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextDimension;
  v6 = [(MOContextDimension *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
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
  [v5 encodeObject:self->_queries forKey:@"queries"];
}

- (MOContextDimension)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [(MOContextDimension *)self initWithName:v5];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"queries"];
    queries = v6->_queries;
    v6->_queries = (NSArray *)v10;
  }
  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"name, %@, queries, %@", self->_name, self->_queries];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    char v6 = [v5 isMemberOfClass:objc_opt_class()];
    name = self->_name;
    uint64_t v8 = [v5 name];

    LOBYTE(name) = [(NSString *)name isEqual:v8];
    char v9 = v6 & name;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContextDimension alloc];
  id v5 = [(MOContextDimension *)self name];
  char v6 = [(MOContextDimension *)v4 initWithName:v5];

  v7 = [(MOContextDimension *)self queries];
  [(MOContextDimension *)v6 setQueries:v7];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end