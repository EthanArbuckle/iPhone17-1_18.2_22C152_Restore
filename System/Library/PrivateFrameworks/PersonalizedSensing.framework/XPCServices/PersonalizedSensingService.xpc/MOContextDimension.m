@interface MOContextDimension
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOContextDimension)initWithCoder:(id)a3;
- (MOContextDimension)initWithContextDimensionMO:(id)a3;
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
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"queries"];
    queries = v6->_queries;
    v6->_queries = (NSArray *)v9;
  }
  return v6;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"name, %@, queries, %@", self->_name, self->_queries];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unsigned __int8 v6 = [v5 isMemberOfClass:objc_opt_class()];
    name = self->_name;
    v8 = [v5 name];

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
  unsigned __int8 v6 = [(MOContextDimension *)v4 initWithName:v5];

  uint64_t v7 = [(MOContextDimension *)self queries];
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

- (MOContextDimension)initWithContextDimensionMO:(id)a3
{
  if (a3)
  {
    id v4 = [a3 name];
    self = [(MOContextDimension *)self initWithName:v4];

    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end