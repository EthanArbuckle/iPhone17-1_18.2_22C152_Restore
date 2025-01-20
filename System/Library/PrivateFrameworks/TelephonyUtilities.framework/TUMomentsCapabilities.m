@interface TUMomentsCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilities:(id)a3;
- (NSSet)supportedMediaTypes;
- (TUMomentsCapabilities)initWithAvailability:(int)a3 supportedMediaTypes:(id)a4;
- (TUMomentsCapabilities)initWithCoder:(id)a3;
- (id)description;
- (int)availability;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUMomentsCapabilities

- (TUMomentsCapabilities)initWithAvailability:(int)a3 supportedMediaTypes:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUMomentsCapabilities;
  v7 = [(TUMomentsCapabilities *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_availability = a3;
    uint64_t v9 = [v6 copy];
    supportedMediaTypes = v8->_supportedMediaTypes;
    v8->_supportedMediaTypes = (NSSet *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TUMomentsCapabilities *)self availability];
  id v6 = [(TUMomentsCapabilities *)self supportedMediaTypes];
  v7 = [v6 allObjects];
  v8 = [v7 componentsJoinedByString:@","];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p availability=%d supportedMediaTypes=%@>", v4, self, v5, v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TUMomentsCapabilities *)self availability];
  uint64_t v4 = [(TUMomentsCapabilities *)self supportedMediaTypes];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUMomentsCapabilities *)self isEqualToCapabilities:v4];

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4 = a3;
  int v5 = [(TUMomentsCapabilities *)self availability];
  if (v5 == [v4 availability])
  {
    id v6 = [(TUMomentsCapabilities *)self supportedMediaTypes];
    v7 = [v4 supportedMediaTypes];
    char v8 = [v6 isEqualToSet:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUMomentsCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_availability);
  uint64_t v6 = [v4 decodeIntForKey:v5];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = NSStringFromSelector(sel_supportedMediaTypes);
  v11 = [v4 decodeObjectOfClasses:v9 forKey:v10];

  objc_super v12 = [(TUMomentsCapabilities *)self initWithAvailability:v6 supportedMediaTypes:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUMomentsCapabilities *)self availability];
  uint64_t v6 = NSStringFromSelector(sel_availability);
  [v4 encodeInt:v5 forKey:v6];

  id v8 = [(TUMomentsCapabilities *)self supportedMediaTypes];
  v7 = NSStringFromSelector(sel_supportedMediaTypes);
  [v4 encodeObject:v8 forKey:v7];
}

- (int)availability
{
  return self->_availability;
}

- (NSSet)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void).cxx_destruct
{
}

@end